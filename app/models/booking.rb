class Booking
  include ActiveModel::Model

  attr_accessor :name, :email, :age, :sex, :nationality, :bed_type, :checkin_date, :period, :preview_date, :message

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :age, :presence => {:message => '年齢を入力してください'}
  validates :sex, :presence => {:message => '性別を入力してください'}
  validates :nationality, :presence => {:message => '国籍を入力してください'}
end