require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before(:each) do
      @user = User.create!(first_name: "Betty", last_name: "Linetti", email: "betty.linetti@betty.is.great", password: "1234567abcde", password_confirmation: "1234567abcde")
    end


    describe "@user" do
      it 'should create a new user' do
        expect(@user).to be_valid
      end

      it 'should not exist if the first name is absent' do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

      it 'should not exist if the last name is absent' do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end

      it 'should not exist if the password is absent' do
        @user.password = nil
        expect(@user).to_not be_valid
      end

      it 'should not exist if the confirmation password is absent' do
        @user.password_confirmation = nil
        expect(@user).to_not be_valid
      end


    end
    
  end
end

