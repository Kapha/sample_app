require 'spec_helper'

describe Review do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # Will fix
    @review = Review.new(text: "This is a review for a book.", user_id: user.id, book_id: 2)
  end

  subject { @review }

  it { should respond_to(:text) }
  it { should respond_to(:user_id) }
  it { should respond_to(:book_id) }
end
