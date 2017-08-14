include ActionView::Helpers::NumberHelper
class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end

  def download
    attachment = Attachment.find(params[:id])
    file = File.open("public" + attachment.file.url)
    send_file file
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path, notice: '删除成功'
  end

  def upload
    attachment = Attachment.new
    if params[:attachment].present?
      attachment.file = params[:attachment][:file]
      if attachment.save
        redirect_to attachments_path, notice: '上传成功!'
      else
        redirect_to attachments_path, alert: '上传失败'
      end
    else
      redirect_to attachments_path, alert: '请先选择文件！'
    end
  end
end
