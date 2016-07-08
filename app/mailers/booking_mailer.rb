class BookingMailer < ActionMailer::Base
  default from: "west013minami@gmail.com"   # 送信元アドレス
  default to: "west013minami@gmail.com"     # 送信先アドレス

  def received_email(booking, estimate)
    @booking = booking
    @estimate = estimate
    mail(to: @booking.email, bcc: ["takknnjp@yahoo.co.jp", "west013minami@gmail.com"], subject: 'お問い合わせを承りました')
  end
end