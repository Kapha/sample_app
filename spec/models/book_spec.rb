# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Book do
  before { @book = Book.new(title: "Bible", author: "God", description: "It's a big book but it's a crack and read") }

  subject { @book }
  
  it { should respond_to(:author) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }

  describe "when title is not present" do
    before { @book.title = " " }
    it { should_not be_valid }
  end

  describe "when author is not present" do
    before { @book.author = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @book.description = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @book.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when author is too long" do
    before { @book.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @book.description = "a" * 251 }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @book.description = "a" * 8 }
    it { should_not be_valid }
  end

  describe "when title is already taken" do
    before do
      book_with_same_title = @book.dup
      book_with_same_title.title = @book.title.upcase
      book_with_same_title.save
    end
    it { should_not be_valid }
  end
end
