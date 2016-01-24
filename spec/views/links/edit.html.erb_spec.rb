require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :url => "MyText",
      :creator_name => "MyString",
      :creator_url => "MyText",
      :author_photo => "MyText",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "textarea#link_url[name=?]", "link[url]"

      assert_select "input#link_creator_name[name=?]", "link[creator_name]"

      assert_select "textarea#link_creator_url[name=?]", "link[creator_url]"

      assert_select "textarea#link_author_photo[name=?]", "link[author_photo]"

      assert_select "textarea#link_content[name=?]", "link[content]"

      assert_select "input#link_user_id[name=?]", "link[user_id]"
    end
  end
end
