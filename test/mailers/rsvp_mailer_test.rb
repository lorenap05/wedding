require "test_helper"

class RsvpMailerTest < ActionMailer::TestCase
  test "notification uses admin recipient and includes RSVP details" do
    with_env("MAILER_FROM" => "no-reply@example.com") do
      rsvp = Rsvp.new(name: "Maria Silva", attending: true, created_at: Time.current)

      email = RsvpMailer.with(rsvp: rsvp, recipient_email: "admin@example.com").notification

      assert_emails 1 do
        email.deliver_now
      end

      assert_equal ["admin@example.com"], email.to
      assert_equal "Novo RSVP recebido: Maria Silva", email.subject

      text_body = email.text_part&.decoded || email.body.decoded
      html_body = email.html_part&.decoded || email.body.decoded

      assert_match "Presença: Sim", text_body
      assert_match "Presença:</strong> Sim", html_body
    end
  end

  private

  def with_env(vars)
    old_values = {}

    vars.each do |key, value|
      old_values[key] = ENV[key]
      ENV[key] = value
    end

    yield
  ensure
    old_values.each { |key, value| ENV[key] = value }
  end
end
