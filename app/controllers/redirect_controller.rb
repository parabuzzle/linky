class RedirectController < ApplicationController

  def index
    path = request.path.reverse.chop.reverse
    short = path.split('/').first
    short = path if short.blank?
    param = path.gsub(/#{short}\/?/, "")

    @short = short

    link = Link.find_by_short_name( short )

    if link
      link.clicks += 1
      link.save
      redirect_to construct_url(link, param)
    end

  end

  private

    def construct_url(link, param)
      if !param.blank?
        return "#{link.params_url}#{param}" if link.params_url
      end
      return link.url
    end

end
