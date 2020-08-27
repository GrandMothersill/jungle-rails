require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @user = User.new(
          :first_name => 'Lauren', 
          :last_name => 'Laurenson', 
          :email => 'lauren@lauren.lauren', 
          :password => 'laurenlauren'
      )
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is invalid with non-unique email" do

    @user = User.new(
          :first_name => 'Lauren', 
          :last_name => 'Laurenson', 
          :email => 'lauren@lauren.lauren', 
          :password => 'laurenlauren'
      ).save
    @smoren = User.new(
          :first_name => 'Smoren', 
          :last_name => 'Smorenson', 
          :email => 'lauren@lauren.lauren', 
          :password => 'smorensmoren'
      )
      @smoren.save
    expect(@smoren).to_not be_valid
  end

  it "is not valid without a first name" do
    @user.first_name= nil
    expect(@user).to_not be_valid
  end

  it "is not valid without a last name" do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is not valid with a password under 8 characters long" do
    @user.password = 'lauren'
    expect(@user).to_not be_valid
  end

end

describe '.authenticate_with_credentials' do
  
it "returns an instance of the user if authentication is successful" do
  @user = User.new(
    :first_name => 'Lauren', 
    :last_name => 'Laurenson', 
    :email => 'lauren@lauren.lauren', 
    :password => 'laurenlauren'
)
@user.save
  auth = User.authenticate_with_credentials('lauren@lauren.lauren', 'laurenlauren')
  expect(auth).to eq(@user)
end

it "returns an nil if authentication is unsuccessful" do
  @user = User.new(
    :first_name => 'Lauren', 
    :last_name => 'Laurenson', 
    :email => 'lauren@lauren.lauren', 
    :password => 'laurenlauren'
)
@user.save
  auth = User.authenticate_with_credentials('lauren@lauren.lauren', 'laurensmoren')
  expect(auth).to eq(nil)
end

it "validates successfully regardless of the case of the input email" do
  @user = User.new(
    :first_name => 'Lauren', 
    :last_name => 'Laurenson', 
    :email => 'lauren@lauren.lauren', 
    :password => 'laurenlauren'
)
@user.save
  auth = User.authenticate_with_credentials('LAUREN@lauren.lauren', 'laurenlauren')
  expect(auth).to eq(@user)
end

end

end