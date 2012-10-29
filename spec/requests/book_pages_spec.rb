require 'spec_helper'

describe "Book Pages" do

  subject { page }

  describe "create" do

    before { visit newbook_path }

    let(:submit) { "Create Book" }

    describe "with invalid information" do
      it "should not create new book" do
        expect { click_button submit }.not_to change(Book, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",          with: "Bible"
        fill_in "Author",         with: "God"
        fill_in "Description",     with: "It's a big book but it's a crack and read."
      end

      it "should create book" do
        expect { click_button submit }.to change(Book, :count).by(1)
      end
    end
  end
end
