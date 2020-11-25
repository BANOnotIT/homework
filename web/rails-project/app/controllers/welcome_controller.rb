# frozen_string_literal: true
class WelcomeController < ApplicationController
  def result
    @result = (0..params[:n].to_i)
                  .map { |a| [a, a ** 2] }
                  .select { |a| a.all? { |x| is_palindrome x } }
                  .to_a
    respond_to do |format|
      format.json { render json: @result }
      format.html { render }
    end
  end

  def index; end

  private

  def is_palindrome(num)
    string = num.to_s
    string == string.reverse
  end
end
