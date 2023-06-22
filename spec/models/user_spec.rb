require_relative '../spec_helper'

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'New', posts_counter: 30, photo: 'New Photo', bio: 'A new user.') }

  before { subject.save }

  it 'Name should be present' do
    subject['name'] = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'check if posts counter is equal or greater than zero' do
    expect(subject.posts_counter).to be >= 0
  end
end
