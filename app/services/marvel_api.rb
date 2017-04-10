require 'securerandom'
require 'digest'

class MarvelApi
  MARVEL_API_ENDPOINT = 'https://gateway.marvel.com/v1/public/'

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: MARVEL_API_ENDPOINT)
  end

  def characters(query_params = {})
    ActiveSupport::JSON.decode(
      conn.get('characters', query_params.merge(authentication_params))
      .body
    )
  end

  private

  def authentication_params
    ts = timestamp
    {ts: ts,
     apikey: public_api_key,
     hash: generate_md5(ts)}
  end

  def public_api_key
    ENV['MARVEL_PUBLIC_API_KEY']
  end

  def private_api_key
    ENV['MARVEL_PRIVATE_API_KEY']
  end

  def timestamp
    SecureRandom.urlsafe_base64
  end

  def generate_md5(timestamp)
    Digest::MD5.new.update("#{timestamp}#{private_api_key}#{public_api_key}").to_s
  end
end
