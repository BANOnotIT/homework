# frozen_string_literal: true

class WelcomeController < ApplicationController
  def result
    @result = (0..params[:n].to_i)
              .map { |a| { x: a, xsqr: a**2 } }
              .select { |a| a.values.all? { |x| is_palindrome x } }
              .to_a
    respond_to do |format|
      format.json { render json: @result }
      format.html { render }
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def index; end

  private

  def is_palindrome(num)
    string = num.to_s
    string == string.reverse
  end
end
