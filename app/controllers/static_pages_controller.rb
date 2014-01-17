class StaticPagesController < ApplicationController
  before_action :add_tally

  def faq
  end

  def about_us
  end

  def return_policy
  end

  private
  def add_tally
    @tally.product_views += 1
    @tally.save
  end
end
