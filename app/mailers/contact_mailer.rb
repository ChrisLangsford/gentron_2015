class ContactMailer < ActionMailer::Base
  default from: "web@gentron.co.za"

  def contact_email(corres)
  	@corres = corres

  	@person = @corres.first_name + " " + @corres.last_name

  	mail(to: "quotes@gentron.co.za", subject: "#{@corres.corres_type} requested by #{@person} from #{@corres.company}")
  end
end
