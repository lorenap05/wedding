diff --git a/app/controllers/rsvps_controller.rb b/app/controllers/rsvps_controller.rb
index a93dc519585841a9c9047ac6d3131ecba00c6f20..810ca94f129fde70b205f5c5c5dc5b51960321da 100644
--- a/app/controllers/rsvps_controller.rb
+++ b/app/controllers/rsvps_controller.rb
@@ -1,21 +1,31 @@
 class RsvpsController < ApplicationController
   def new
     @rsvp = Rsvp.new
   end
 
   def create
     @rsvp = Rsvp.new(rsvp_params)
 
     if @rsvp.save
+      send_rsvp_notification(@rsvp)
       redirect_to new_rsvp_path, notice: "Confirmação enviada com sucesso!"
     else
       render :new, status: :unprocessable_entity
     end
   end
 
   private
 
   def rsvp_params
     params.require(:rsvp).permit(:name, :attending)
   end
+
+  def send_rsvp_notification(rsvp)
+    recipient_email = AdminUser.order(:id).pick(:email) || ENV["ADMIN_EMAIL"]
+    return if recipient_email.blank?
+
+    RsvpMailer.with(rsvp: rsvp, recipient_email: recipient_email).notification.deliver_now
+  rescue StandardError => e
+    Rails.logger.error("[RSVP_NOTIFICATION] Failed to send email for RSVP ##{rsvp.id}: #{e.class} - #{e.message}")
+  end
 end
