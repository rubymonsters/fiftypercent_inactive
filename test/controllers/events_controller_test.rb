class EventsControllerTest < ActionController::TestCase
  test "should GET index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end
  
  test "index renders a list of events" do
    Event.create(name: "Froscon")
    get :index
    assert_select "ul" do
      assert_select "li", "Froscon"
    end
  end
  
  test "displays a form for creating event" do
    get :new
    assert_response :success
    assert_not_nil assigns(:event)
  end

  test "new renders a form" do
    get :new
    # puts response.body
    assert_select "form[action=/events]" do
      assert_select "input[name='event[name]']"
    end
  end

  test "should create an event if posted data is valid" do
    post :create, event: {name: "Some name"}
    event = Event.first
    assert_not_nil event
    assert_equal "Some name", event.name
  end

  test "if post data is valid, new view is rendered" do
    post :create, event: {name: "New View"}
    assert_redirected_to event_path(assigns(:event))
  end

  test "should redirect to the event show url if posted data is valid" do
    post :create, event: { name: 'Some name' }
    event = Event.first
    assert_redirected_to controller: 'events', action: 'show', id: event.id
  end  

  test "should not create event if posted data is invalid" do
    post :create, event: { name: '' }
    event = Event.first
    assert_nil event 
  end

  test "should display the :new view if posted data is invalid" do
    post :create, event: { name: ''}
    assert_template :new
  end  

  test "should display the :edit view for a specific event" do
    get :edit, :id => 1
  end  
end
