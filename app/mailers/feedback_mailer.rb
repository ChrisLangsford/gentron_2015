class FeedbackMailer < ActionMailer::Base
  default from: "from@example.com"

  def feedback_email(feedback)
  	@feedback = feedback
  	mail(to: "langz020@gmail.com", subject: "Feedback submitted by #{@feedback.company_name}")
  end
end
