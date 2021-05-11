require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create(user_id: 1, content: 'my new post') }
  context 'should create new post successfully' do
    it 'should return post id' do
      expect(post.user_id).to eq(1)
    end
    it 'should return the contnet' do
      expect(post.content).to eq('my new post')
    end
    it 'should not return content' do
      expect(post.content).not_to eq('a_different_content')
    end
    it 'should not create a post witha a user that does not exist' do
      expect(Post.create(user_id: 1000, content: 'another post')).to_not be_valid
    end
  end

  describe 'ActiveRecord associations' do
    it 'has many comments' do
      expect { should has_many(comments) }
    end
    it 'has many likes' do
      expect { should has_many(likes) }
    end
  end
end
