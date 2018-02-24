require 'elasticsearch/model'

class MicroBlog < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name self.table_name  # 这里可以自定义Article的ES索引名称

  mapping do
    indexes :subject, type: 'multi_field' do
      indexes :raw, index: :not_analyzed
      indexes :tokenized, analyzer: 'ik_max_word'
    end
    indexes :content, type: :string, analyzer: 'ik_max_word'
  end
end
#导入数据到elastic_search
def import_data
  self.import
end