require_relative 'facebook_likes/all'

class FacebookLikes

  def call(env)
    PictureGenerator.generate!
    [status, headers, body]
  end

  def status
    200
  end

  def headers
    {
      'Cache-Control' => 'max-age=0, no-cache, no-store, must-revalidate',
      'Content-Type' => "image/png"
    }
  end

  def body
    File.read('facebook-banner.jpg')
  end

end

