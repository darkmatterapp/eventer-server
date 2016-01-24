require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :url => "MyText",
      :creator_name => "MyString",
      :creator_url => "MyText",
      :author_photo => "MyText",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "textarea#link_url[name=?]", "link[url]"

      assert_select "input#link_creator_name[name=?]", "link[creator_name]"

      assert_select "textarea#link_creator_url[name=?]", "link[creator_url]"

      assert_select "textarea#link_author_photo[name=?]", "link[author_photo]"

      assert_select "textarea#link_content[name=?]", "link[content]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
