module ApplicationHelper
	def igb_trust
	  if request.headers['User-Agent'].scan('EVE-IGB')
		"requestTrust();"
	  end
	end
	# View Helpers
	def display_user(id)
		u = User.find(id)
		# give an email for now, todo: make email fallback after main character's name
		u.email
	end
end
