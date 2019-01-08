class ApplicantsController < ApplicationController
  before_action :restrict_access

  def index
    @applicants = Applicant.order(:created_at)
    render json: @applicants
  end

  def show
    @applicant = Applicant.find(params[:id])
    render json: @applicant
  end

  def update_status
    @applicant = Applicant.find params[:id]
    status = params[:status]

    if status == nil
      render json: { message: "Please provide a status in order to update this application." }
    end

    @applicant.update(status: status)

    case status
    when "Accepted"
      ApplicantMailer.acceptance_email(@applicant).deliver_now
      message = "#{@applicant.firstname} has been accepted."
    when "More info requested"
      ApplicantMailer.more_info(@applicant).deliver_now
      message = "#{@applicant.firstname} has been sent an email to request more info."
    when "Rejected"
      ApplicantMailer.rejection_email(@applicant).deliver_now
      message = "#{@applicant.firstname} has been sent a rejection email."
    when "Remind"
      ApplicantMailer.reminder(@applicant).deliver_now
      message = "#{@applicant.firstname} has been sent a reminder email."
    end

    render json: { message: message }
  end

  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      ApplicantMailer.confirm_email(@applicant).deliver_now
      render json: @applicant, status: :created
    else
      render json: @applicant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @applicant = Applicant.find params[:id]
    @applicant.destroy
    render json: nil, status: :no_content
  end

  private

  def applicant_params
    params.require(:applicant).permit(
      :firstname,
      :lastname,
      :email,
      :nationality,
      :location,
      :orgtype,
      :company,
      :position,
      :website,
      :aboutcompany,
      :position,
      :businessexperience,
      :sectorexperience,
      :language,
      :bmodel,
      :interest,
      :profile,
      :additional,
      :referrer,
      :role,
      :financing,
      :partner_bmodel,
      :support_region,
      :partner_sector,
      :support_type,
      :additonal_support)
  end

end
