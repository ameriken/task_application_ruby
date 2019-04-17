class TaskMailer < ApplicationMailer
  def creation_email(task)
    @task = task
    mail(
    subject: 'タスク作成完了メール',
    to: 'hoge@example.com',
    from: 'taskManagement@example.com'
    )
  end
end
