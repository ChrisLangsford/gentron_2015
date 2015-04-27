class FeedbackMailer < ActionMailer::Base
	default from: "web@gentron.co.za"
  def feedback_email(feedback)
  	@feedback = feedback
  	mail(to: "info@gentron.co.za", subject: "Feedback submitted by #{@feedback.company_name}")
  end
end
