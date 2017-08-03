class SandboxEmailInterceptor
  def self.delivering_email(message)
    logger.info("正在发送邮件...,from:#{message.from}->to: #{message.to}")
  end
end
