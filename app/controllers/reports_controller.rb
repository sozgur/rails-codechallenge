class ReportsController < ApplicationController

	def create
		report = Reports.new(report_params, lonlat: "POINT(#{report_params[:lon]} #{report_params[:lat]})")
		if report.save
			render json: {status: 'SUCCESS', message: 'Saved report', data: article}, status: :ok
		else
			render json: {status: 'ERROR', message:'Report not saved', data: article.errors}, status: :unprocessable_entity
		end
	end

	private

	def report_params
		params.permit(:scooter_id, :lon, :lat, :battery_level)
	end

end
