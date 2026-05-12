class RsvpMailer < ApplicationMailer
  def notification
    @rsvp = params[:rsvp]

    mail(
      to: params[:recipient_email],
      subject: "Novo RSVP recebido: #{@rsvp.name}"
    )
  end
end
