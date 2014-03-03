include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def valid_signup
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

def signup_errors
  it { should have_title('Sign up') }
  it { should have_content('error') }
  it { should have_content('Name can\'t be blank') }
  it { should have_content('Email can\'t be blank') }
  it { should have_content('Password can\'t be blank') }
  it { should have_content('Email is invalid') }
  it { should have_content('Password is too short (minimum is 6 characters)') }
  #it { should have_content('Password confirmation doesn\'t match Password') }
  #it { should have_content('Password confirmation can\'t be blank') }
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end
