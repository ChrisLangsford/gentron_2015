class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email(corres)
  	@corres = corres

  	@person = @corres.first_name + " " + @corres.last_name

  	mail(to: "langz020@gmail.com", subject: "#{@corres.corres_type} requested by #{@person} from #{@corres.company}")
  end
end