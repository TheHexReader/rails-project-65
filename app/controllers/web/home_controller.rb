# frozen_string_literal: true

# HomeController
module Web
  # Class HomeController
  class HomeController < ApplicationController
    def index
      @bulletins = Bulletin.all.published.order(created_at: :desc)
    end
  end
end
