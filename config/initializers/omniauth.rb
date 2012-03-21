Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '251834431573170', '80d695620f24d870d79eb2ed1f6190ef'

end

