require_relative 'like_finder'
require 'RMagick'

class PictureGenerator
  class << self
    def generate!
      File.delete('facebook-banner.jpg') if File.exists?('facebook-banner.jpg')
      image = Magick::ImageList.new("banner-template.png")
      image.annotate(Magick::Draw.new, 0, 0, 55, 20, "Like us on Facebook") do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::BoldWeight
      end
      image.annotate(Magick::Draw.new, 0, 0, 220, 20, "and join our other") do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::NormalWeight
        annotation.font_style = Magick::NormalStyle
      end
      image.annotate(Magick::Draw.new, 0, 0, 350, 20, likes) do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::BoldWeight
      end
      image.annotate(Magick::Draw.new, 0, 0, 55, 40, "friends. Chat to the team and be the first to hear") do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::NormalWeight
        annotation.font_style = Magick::NormalStyle
      end
      image.annotate(Magick::Draw.new, 0, 0, 55, 60, "about competitions, deals, tips and") do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::NormalWeight
        annotation.font_style = Magick::NormalStyle
      end
      image.annotate(Magick::Draw.new, 0, 0, 305, 60, "beachspiration.") do |annotation|
        annotation.gravity = Magick::NorthGravity
        annotation.align = Magick::LeftAlign
        annotation.pointsize = 16
        annotation.stroke = 'transparent'
        annotation.fill = '#fff'
        annotation.font_weight = Magick::NormalWeight
        annotation.font_style = Magick::ItalicStyle
      end
      image.format = 'JPG'
      image.write('facebook-banner.jpg')
      image.destroy!
    end

    def eee
      "Chat to the team and be the first to hear about competitions, deals, tips and beachspiration."
    end

    def likes
      LikeFinder.new.likes.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
  end
end
