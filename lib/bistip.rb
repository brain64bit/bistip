require 'httparty'

module Bistip
  include HTTParty
  # Your code goes here...
  
  base_uri 'http://www.bistip.com'

  API_VERSION = '/api/v1'
  SEARCH_TRIP = '/trips.json'
  SEARCH_SEEK = '/seeks.json'
  DEFAULT_PER_PAGE = 10
  DEFAULT_PAGE = 1
  
  def self.trips(params={})
  	check_params(params)
  	from = params[:from] if params[:from]
  	to = params[:to] if params[:to]
  	per_page = params[:per_page].nil? ? DEFAULT_PER_PAGE : params[:per_page]
  	page = params[:page].nil? ? DEFAULT_PAGE : params[:page]
  	
  	result = get("#{API_VERSION+SEARCH_TRIP}?from=#{from}&to=#{to}&page=#{page}&per_page=#{per_page}")
	result = result.first.include?("exception") ? Array.new : result
	return result
  end
  
  def self.seeks(params={})
  	check_params(params)
  	from = params[:from] if params[:from]
  	to = params[:to] if params[:to]
  	per_page = params[:per_page].nil? ? DEFAULT_PER_PAGE : params[:per_page]
  	page = params[:page].nil? ? DEFAULT_PAGE : params[:page]
  	
  	result = get("#{API_VERSION+SEARCH_SEEK}?from=#{from}&to=#{to}&page=#{page}&per_page=#{per_page}")
	result = result.first.include?("exception") ? Array.new : result
	return result
  end
  
  private
  
  	def self.check_params(params)
  		raise ArgumentError, 'parameters must be a hash' unless params.is_a?(Hash)
  		raise ArgumentError, 'parameters can not be empty' unless !params.empty?
  		raise ArgumentError, 'parameters should contain :from and/or :to properties' unless params.keys.include?(:from) or params.keys.include?(:to)
  		
  		raise ArgumentError, ':page must be an integer' unless params[:page].is_a?(Integer) if params[:page]
  		raise ArgumentError, ':per_page must be an integer' unless params[:per_page].is_a?(Integer) if params[:per_page]
  	end
  
end
