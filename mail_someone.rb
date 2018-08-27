require 'mail'
Mail.defaults do
  retriever_method :pop3, :address    => "pop.163.com",
                          :port       => 995,
                          :user_name  => '18687430124@163.com',
                          :password   => '*****',
                          :enable_ssl => true
end
mail = Mail.last
mail.attachments.each do | attachment |
  # Attachments is an AttachmentsList object containing a
  # number of Part objects
  if (attachment.content_type.start_with?('image/'))
    # extracting images for example...
    filename = attachment.try(:filename)
    begin
      File.open("/home/longhaoran/下载/"+filename, "w+b", 0644) {|f| f.write attachment.decoded}
    rescue => e
      puts "Unable to save data for #{filename} because #{e.message}"
    end
  end
end
puts Mail.last
puts mail.attachments.first.filename
