class ApplicantMailer < ApplicationMailer
  default from: 's.kennedy@endeva.org'
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  ORIGINATOR_PAGE_LOOKUP = {
    "Originator 1" => "https://www.meetandmultiply.org/",
    "Originator 2" => "https://www.meetandmultiply.org/",
    "Originator 3" => "https://www.meetandmultiply.org/",
    "Originator 4" => "https://www.meetandmultiply.org/",
  }

  def confirm_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: 'We have received your application')
  end

  def acceptance_email(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_PAGE_LOOKUP[@originator]
    mail(to: @applicant.email, subject: "You’ve been accepted to attend Meet & Multiply")
  end

  def more_info(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_PAGE_LOOKUP[@originator]
    mail(to: @applicant.email, subject: "More information needed for your Meet & Multiply application")
  end

  def rejection_email(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: "[Meet & Multiply] Your application results")
  end

  def reminder(applicant)
    @applicant = applicant
    @originator = @applicant.bmodel
    @originator_page_url = ORIGINATOR_PAGE_LOOKUP[@originator]
    mail(to: @applicant.email, subject: "Please confirm your attendance at Meet & Multiply!")
  end
end
