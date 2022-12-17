# frozen_string_literal: true

# controller for proving Simon hypothesis
class SimonController < ApplicationController
  before_action :check_params, only: :show

  def input; end

  def show
    # fact_sources = (params[:start].to_i..params[:end].to_i).to_a
    # factorials = fact_sources.map { |val| Math.gamma(val + 1).to_i }

    # @res = helpers.collect_res(calc_simon_numbers(factorials), fact_sources, factorials)

    from = params[:start].to_i
    to = params[:end].to_i

    @res = SimonResult.get(from, to)

    # SimonInterval.create(start: params[:start], end: params[:end])
  end

  private

  def check_param(param)
    /\A\d+\z/.match(param)
  end

  def redirect_to_input(message)
    redirect_to(root_path, alert: message)
  end

  def check_params
    unless check_param(params[:start].to_s)
      return redirect_to_input('Начало интервала должно быть целым неотрицательным числом')
    end

    redirect_to_input('Конец интервала должен быть целым неотрицательным числом') unless check_param(params[:end].to_s)
  end
end
