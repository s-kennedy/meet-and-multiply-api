class ApplicantMailer < ApplicationMailer
  default from: ENV['endeva_username']
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  ORIGINATOR_URL_LOOKUP = {
    "Blooom" => "https://www.meetandmultiply.org/ekutir-blooom",
    "LifeBank" => "https://www.meetandmultiply.org/lifebank",
    "ONergy" => "https://www.meetandmultiply.org/onergy",
    "Ignitia" => "https://www.meetandmultiply.org/ignitia",
  }

  EVENT_AGENDA_URL = "https://www.meetandmultiply.org/#contact"

  def confirm_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: 'We have received your application')
  end

  def acceptance_email(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_URL_LOOKUP[@originator]
    @agenda_url = EVENT_AGENDA_URL
    mail(to: @applicant.email, subject: "You’ve been accepted to attend Meet & Multiply")
  end

  def more_info(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_URL_LOOKUP[@originator]
    mail(to: @applicant.email, subject: "More information needed for your Meet & Multiply application")
  end

  def rejection_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: "[Meet & Multiply] Your application results")
  end

  def reminder(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_URL_LOOKUP[@originator]
    mail(to: @applicant.email, subject: "Please confirm your attendance at Meet & Multiply!")
  end
end
