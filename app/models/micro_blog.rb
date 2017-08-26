require 'elasticsearch/model'

class MicroBlog < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title
    end
  end
  MicroBlog.__elasticsearch__.client.indices.create index: MicroBlog.index_name,
                                                    body: {
                                                      settings: MicroBlog.settings.to_hash,
                                                      mappings: MicroBlog.mappings.to_hash }

end
