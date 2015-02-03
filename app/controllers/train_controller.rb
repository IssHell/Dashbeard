class TrainController < ApplicationController

	respond_to :html
	layout false

	def station
		require 'net/http'

		trainCode = 'TARA' # Tara street station default
		# Pulling train station code from settings
		begin
			setting = Setting.find(1)
			trainCode = setting.trainstation
		rescue Exception => ee
			puts ee
		end

		url = "http://www.irishrail.ie/realtime/station-updates.jsp?code=#{trainCode}"
		begin
			result = Net::HTTP.get(URI.parse(url))	
		rescue Exception => e
			
		end
		stationname = "Tara Street"
		# removing images, cos it throws errors on my console, boo
		result = result.gsub(/<img src.+?>/m, '')
		responseres = ""

		regresults = result.scan(/(Train.+?\/tbody>)/m)
		for full in regresults
			singletrain = full[0].scan(/(Train.+?td>)/m)[0]
			if not singletrain.empty?
				singletrain = singletrain[0].gsub(/Train Service /m, '')
				singletrain = singletrain.gsub(/">.*/m, '') #At this stage we have the train route
				# puts singletrain 
				stationDeptTime = full[0].scan(/Tara Street.+?tr>/m)
				if not stationDeptTime.empty?
					stationDeptTime = stationDeptTime[0].sub(/.+?time">/m, '')
					stationDeptTime = stationDeptTime.sub(/.+?time">/m, '')
					stationDeptTime = stationDeptTime.sub(/<\/td>.+/m, '') #this is the departure time of the train from tara street
					responseres = "#{responseres} <font color=\"blue\">#{singletrain}</font> departing at <font class=\"livetime\">#{stationDeptTime}</font></br><br>" 
				end
			end 
		end
		
		if responseres.empty?
			responseres = "No data available, retrying..."
		end
	 	render :text => responseres
		
	end
end
