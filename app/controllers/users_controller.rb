class UsersController < Clearance::UsersController 

	private

	def user_from_params
	  user_params = params[:user] || Hash.new
	  email = user_params.delete(:email)
	  password = user_params.delete(:password)
	  name = user_params.delete(:name)
	  avatar = user_params.delete("avatar")

	  Clearance.configuration.user_model.new(user_params).tap do |user|
	    user.email = email
	    user.password = password
	    user.name = name
	    user.avatar = avatar
	  end
	end
	def permit_params
	  params.require(:user).permit(:name, :email, :password, :avatar)
end
end
