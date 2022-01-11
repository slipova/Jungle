require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    
    before(:each) do
      @user = User.create!(first_name: "Betty", last_name: "Linetti", email: "betty.linetti@betty.is.great", password: "1234567abcde", password_confirmation: "1234567abcde")
    end

    after(:each) do
      puts @user.errors.full_messages
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
      
      it 'should not exist if the password is shorter than 6 symbols' do
        @user.password = "abc"
        expect(@user).to_not be_valid
      end
      
      it 'should not exist if the email already exists in the database' do
        user2 = User.create!(first_name: "Lou", last_name: "Felicci", email: "lou.felicci@betty.is.great", password: "13579ace", password_confirmation: "13579ace") 
        user2.email = "betty.linetti@betty.is.great"
        expect(user2).to_not be_valid
      end

      it 'should not exist if the email with different case already exists in the database' do
        user2 = User.create!(first_name: "Lou", last_name: "Felicci", email: "lou.felicci@betty.is.great", password: "13579ace", password_confirmation: "13579ace") 
        user2.email = "Betty.linEtti@betty.is.great"
        expect(user2).to_not be_valid
      end
      
    end
    
  end


  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create!(first_name: "Betty", last_name: "Linetti", email: "betty.linetti@betty.is.great", password: "1234567abcde", password_confirmation: "1234567abcde")
    end

    after(:each) do
      puts @user.errors.full_messages
    end

    describe 'user' do
      it 'should authenticate the user if email and password match the database' do
        expect(User.authenticate_with_credentials("betty.linetti@betty.is.great", "1234567abcde")).to eq(@user)
      end

      it 'should authenticate the user if email uses different cases in their email' do
        expect(User.authenticate_with_credentials("beTty.linetTi@betty.IS.great", "1234567abcde")).to eq(@user)
      end

      it 'should authenticate the user if email has extra spaces around' do
        expect(User.authenticate_with_credentials("  betty.linetti@betty.is.great   ", "1234567abcde")).to eq(@user)
      end

    end

  end
end

