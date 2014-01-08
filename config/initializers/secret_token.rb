# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the exiting token.
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end


SampleApp::Application.config.secret_key_base = '2ae0fa229aa0d05df21d117ee68c2f6a51bbda45dc0c3de8acc288f1f3947c6c5a4063122156cb1c5c8e68009a349ed5946796c6fd5572786b7b7c394d540f62'
