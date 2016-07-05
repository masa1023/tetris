class BookingsController < ApplicationController
  def index
    # 入力画面を表示
    @booking = Booking.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @booking = Booking.new(params[:booking])
    if @booking.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    @booking = Booking.new(params[:booking])
    BookingMailer.received_email(@booking).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end
end
