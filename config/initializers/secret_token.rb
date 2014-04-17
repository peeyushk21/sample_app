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
		#Use the existing token.
		File.read(token_file).chomp
	else
		#Generate a new token  and store it in a token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end


SampleApp::Application.config.secret_key_base = 'fd51f3d2c65dad3c4c52f5c624893a56bc8b3db11e707655475fdaaab3185574c4f4cbb94c9102e334df9e3c5bfeab27dbc018198ff93f12ee5d7c654b9d2b77'
