require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'ActiveRecords Associations' do
    it 'belongs to user' do
      expect { should belongs_to(:user) }
    end
    it 'belongs to friend' do
      expect { should belongs_to(:friend) }
    end
  end
end
