class Attachment < ActiveRecord::Base
	mount_uploader :file, FileUploader

	def file_name
		CGI.unescape(File.basename(file.url))
	end
end
