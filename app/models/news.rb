class News < ActiveRecord::Base
  TENCENT_SYNC_URL = 'https://pacaio.match.qq.com/irs/rcd'
  TOUTIAO_SYNC_URL = 'https://www.toutiao.com/api/pc/feed/?'
  validates_uniqueness_of :item_id
  class << self
    # 腾讯新闻同步
    def sync_tencent
      query_params = {
          cid: 4,
          token: '9513f1a78a663e1d25b46a826f248c3c',
          page: 0,
      }.with_indifferent_access
      result = RestClient.get(TENCENT_SYNC_URL, params: query_params)
      res_body = result.body
      # res_body[-1] = ''
      # res_body.gsub!(/^__jp\d/, '')
      # res_body[0] = ''
      res_hash = JSON.parse(res_body)
      puts "page: #{query_params[:page]}"
      while(res_hash["datanum"] != 0)
        res_hash['data'].each do |item|
          news = News.new
          News.column_names.reject{|c| c == 'id'}.each do |col_name|
            news.assign_attributes("#{col_name}": item[col_name])
          end
          news.assign_attributes("t_id": item['id'])
          news.save!
        rescue => e
          puts "处理出错: #{e.message}"
        end
        query_params[:page] += 1
        result = RestClient.get(TENCENT_SYNC_URL, params: query_params)
        res_body = result.body
        # res_body[-1] = ''
        # res_body.gsub!(/^__jp\d/, '')
        # res_body[0] = ''
        res_hash = JSON.parse(res_body)
      end
      puts "page: #{query_params[:page]} complete!"
    end

    # 头条新闻同步
    def sync_toutiao
      query_params = {
          max_behot_time: Time.now.beginning_of_day.to_i,
          category: 'news_hot',
          utm_source: 'toutiao',
          widen: 1,
          tadrequire: true
      }.with_indifferent_access
      result = RestClient.get(TOUTIAO_SYNC_URL + query_params.to_query, cookies: {:tt_webid=> '6662903737592251908'})
      res_hash = JSON.parse(result.body)
      puts "开始同步"
      number = 0
      while(res_hash['data'].present?)
        res_hash['data'].each do |item|
          news = News.new
          news.title= item['title']
          news.item_id= item['item_id']
          news.group_id= item['group_id']
          news.abstract= item['abstract']
          news.comments_count= item['comments_count']
          news.chinese_tag= item['chinese_tag']
          news.source= item['source']
          news.source_url= TOUTIAO_SYNC_URL + item['source_url']
          news.middle_image_url= item['middle_image']
          news.save!
          puts "已处理:#{number}条新闻!"
          number+=1
        rescue ActiveRecord::RecordInvalid=> e
          puts "同一文章,item_id重复了:#{e.message}"
        end
        query_params[:max_behot_time]= res_hash['next']['max_behot_time']
        result = RestClient.get(TOUTIAO_SYNC_URL + query_params.to_query, cookies: {:tt_webid=> '6662903737592251908'})
        puts "该批次爬取结束:#{query_params.to_query}"
        res_hash = JSON.parse(result.body)
      end
      puts '结束：以下是res_hash'
      puts res_hash
    end
  end
end
