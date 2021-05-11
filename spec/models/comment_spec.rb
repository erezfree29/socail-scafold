require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validation' do
    it 'comment should have content' do
      expect { should validate_presence_of(:content) }
    end
  end
  describe 'ActiveRecord associations' do
    it 'belongs to user' do
      expect { should belongs_to(user) }
    end
    it 'belongs to post' do
      expect { should belongs_to(post) }
    end
  end
end
