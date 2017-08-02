class UserMailer < ApplicationMailer
  default from: 'xxx@xxx.com'
  def welcome_email(email)
    file_path = File.join File.expand_path(""),"..","template.rb"
    attachments['file'] = File.read(file_path)
    attachments.inline['reba.jpg'] = File.read(File.join(File.expand_path(""),"..","reba.jpg"))
    @url = 'http://www.bing.com'
    mail( from: 'm18687430124@163.com', to: email, subject: '尼玛，难道还要改个名字才可以发送？')
  end

  def recive_mail(mail)
    file = File.open(email.to.first)
    fill.puts "这是来自#{mail.from}的邮件"
  end
end
