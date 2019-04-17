##　下のコードで簡単に送信内容の確認できる(※実際には送信されない)
```
require 'action_mailer'

#SMTP設定
ActionMailer::Base.smtp_settings.merge!(
	address: 'smtp',
	port: 1025
)

#テンプレートファイルの置き場所のルートフォルダを設定
ActionMailer::Base.prepend_view_path File.dirname(File.expand_path(__FILE__))

#メール送信クラス
class TestMailer < ActionMailer::Base
	default from: 'from@example.com'

	def test_mail(to, subject, body)
		mail(to: to, subject: subject, body: body)
	end

	def test_html_mail(to, subject, arg1, arg2)
		@arg1 = arg1
		@arg2 = arg2
		mail(to: to, subject: subject)
	end
end

#普通のメールを送信
TestMailer.test_mail(
	'to_address@example.com',
	'test subject',
	'Hello, World!!!!'
).deliver_now
```
