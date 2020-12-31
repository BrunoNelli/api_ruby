require 'rails_helper'

describe ArticlesController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :article, 2
      get :index
      json = JSON.parse(response.body)
      json_data = json['data']
      expect(json_data.length).to eql(2)
      expect(json_data[0]['attributes']).to eql({"title" => "My awesome article 1",
        "content" => "The content of my awesome article 1",
        "slug" => "my-awesome-article-1"})
    end
  end
end
