module SessionsHelper

	def login (user)
		session[:user_id] = user.id
		@current_user = user
	end

	def logged_in?
		if current_user == nil
			redirect_to root_path
		end
	end

	def current_user
		@current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
	end

	def logout
		@current_user = session[:user_id] = nil
		redirect_to root_path
	end


end
