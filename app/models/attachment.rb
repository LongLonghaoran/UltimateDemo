class Attachment < ActiveRecord::Base
	mount_uploader :file, FileUploader

	def file_name
		(%r{/[\w.]*$}.match file.url).to_s.gsub("/","")
	end
end
