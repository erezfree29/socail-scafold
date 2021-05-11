require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'ActiveRecords Associations' do
    it 'needs to have a unique combination of user_id and friend_id' do
      expect { should validate_uniqueness_of(user_id).scoped_to(:friend_id) }
    end
    it 'belongs to user' do
      expect { should belongs_to(:user) }
    end
    it 'belongs to friend' do
      expect { should belongs_to(:friend) }
    end
  end
end
