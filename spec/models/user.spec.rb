require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Elvis', email: 'elvis@gmail.com', password: '246888') }
  context 'should create new user' do
    it 'should return user name' do
      expect(user.name).to eq('Elvis')
    end
    it 'should return user email' do
      expect(user.email).to eq('elvis@gmail.com')
    end
    it 'should not return user password' do
      expect(user.password).to eq('246888')
    end
  end

  describe 'ActiveRecord associations' do
    it 'has many posts' do
      expect { should has_many(posts) }
    end
    it 'has many comments' do
      expect { should has_many(comments) }
    end
    it 'has many likes' do
      expect { should has_many(likes) }
    end
    it 'has many  pending_friends' do
      expect { should has_many(pending_friends) }
    end
    it 'has many friendships' do
      expect { should has_many(friendships) }
    end
    it 'has many inverse_friendships' do
      expect { should has_many(inverse_friendships).with_foreign_key }
    end
  end
end
