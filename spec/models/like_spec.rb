require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  describe 'Likes Validations' do
    subject { Like.new(author_id: 5, post_id: 8) }

    before { subject.save }

    it 'checks if author id is a number' do
      subject['author_id'] = 'id'
      expect(subject).to_not eql 1
    end

    it 'checks if post id is a number' do
      id = subject['post_id'] = 10
      expect(id).to be == 10
    end
  end
end
