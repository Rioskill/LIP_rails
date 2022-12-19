# frozen_string_literal: true

# controller for proving Simon hypothesis
class SimonController < ApplicationController
  before_action :check_params, only: :show

  def show
    return render xml: "<error_msg>#{@error_msg}</error_msg>" unless @error_msg.nil?

    @res = find_simon_numbers(params[:start].to_i, params[:end].to_i)
    render 'simon/show', formats: :xml
  end

  private

  def find_simon_numbers(from, to)
    fact_sources = (from..to).to_a
    factorials = fact_sources.map { |val| Math.gamma(val + 1).to_i }

    helpers.collect_res(calc_simon_numbers(factorials), fact_sources, factorials)
  end

  def calc_simon_numbers(factorials)
    to = factorials.last

    helpers.find_simon_numbers(to).select { |val| factorials.include? val[1] }
  end

  def check_param(param)
    /\A\d+\z/.match(param)
  end

  def check_params
    @error_msg = nil
    unless check_param(params[:start].to_s)
      return @error_msg = 'Начало интервала должно быть целым неотрицательным числом'
    end

    return @error_msg = 'Конец интервала должен быть целым неотрицательным числом' unless check_param(params[:end].to_s)
  end
end
