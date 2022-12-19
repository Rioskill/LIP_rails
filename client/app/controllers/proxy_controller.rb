# frozen_string_literal: true

require 'open-uri'

# controller that transforms xml to html
class ProxyController < ApplicationController
  before_action :check_params, only: :output

  def input; end

  def output
    xml_response = send_request

    case params[:side]
    when 'server'
      @result = xslt_transform(xml_response).to_html
    when 'client'
      render xml: add_xslt_ref(xml_response).to_xml
    else
      render xml: xml_response
    end
  end

  private

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/transform.xslt"))
    xslt.transform(doc)
  end

  def add_xslt_ref(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet',
                                                    'type="text/xsl" href="/browser.xslt"')
    doc.root.add_previous_sibling(xslt)
    doc
  end

  def send_request
    URI.open("http://127.0.0.1:3000?start=#{params[:start]}&end=#{params[:end]}")
  end

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
