# frozen_string_literal: true

class WelcomeController < ApplicationController
  def result
    n = params[:n].to_i

    cached_result = CachedResult.find_or_initialize_by(n: n)

    if cached_result.new_record?
      cached_result.values = squared_palindromes n
      cached_result.save!
    end

    @result = cached_result.values

    respond_to do |format|
      format.json { render json: @result }
      format.html { render }
      format.xml { render xml: @result.to_xml }
      format.rss { render xml: @result.to_xml }
    end
  end

  def index; end

  def cached
    result = CachedResult.all.map { |inst| { n: inst.n, result: inst.values } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
      format.json { render json: result }
    end
  end

  private

  def squared_palindromes(n)
    (0..n)
        .map { |a| { x: a, xsqr: a ** 2 } }
        .select { |a| a.values.all? { |x| is_palindrome x } }
        .to_a
  end

  def is_palindrome(num)
    string = num.to_s
    string == string.reverse
  end
end
