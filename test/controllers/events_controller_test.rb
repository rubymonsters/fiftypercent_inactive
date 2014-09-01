class EventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end
  
  test "index renders a list of events" do
    Event.create(name: "Froscon")
    get :index
    assert_select 'ul' do
        assert_select 'li', 'Froscon'
    end
  end
end
