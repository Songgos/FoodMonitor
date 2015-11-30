require 'test_helper'

class FoodsFlowTest < ActionDispatch::IntegrationTest
    fixtures :recipes
    test "create foods" do
        https!
        potato = foods(:potato)
        get "/foods/new"
        assert_response :success
        post_via_redirect "/foods/new", title:
            foods(:potato).title
        assert_equal '/recipes', path
        assert_equal 'Create Food', flash[:notice]
        https! (false)
        get "/foods"
        assert_response :success
        assert assigns(:foods)
    end
end