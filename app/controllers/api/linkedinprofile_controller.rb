class Api::LinkedinprofileController < ApplicationController
  def check_connection_sent
    @check_connect = 0
    email = params[:data][:emailid]
    puts email
    linkedin_url = params[:data][:linkdin_url]
    if email.blank?
      @linkedin_return_dict = "please enter email to proceed further"
    end
    if linkedin_url.blank?
      @linkedin_return_dict = "Linkedin url is not there"
    end
    if email and linkedin_url
      check_linke=Linkedinconnectprofile.where(linkedinid: linkedin_url)
      if check_linke.blank?
        @linkedin_return_dict ='Not connected earlier'
        @check_connect =1
      else
        @linkedin_return_dict ='Connected earlier'

      end
    end
    render json: {status: 'SUCCESS', connect_status: @check_connect, data: @linkedin_return_dict}, status: :ok

  end
  def add_connection
    email = params[:data][:emailid]
    linkedin_url = params[:data][:linkdin_url]
    @check_connect = 0
    if email.blank?
      message = "please enter email to proceed further"
    end
    if linkedin_url.blank?
      message = "Linkedin url is not there"
    end
    if email and linkedin_url
      check_linke=Linkedinconnectprofile.where(linkedinid: params[:data][:linkdin_url])
      if check_linke.blank?
        if params[:data][:scrapped_check].blank?
          Linkedinconnectprofile.create(:linkedinid => params[:data][:linkdin_url],:ConnectionSentByAccount => params[:data][:emailid],:connectiondatetime =>Time.now )
        else
          Linkedinconnectprofile.create(:linkedinid => params[:data][:linkdin_url],:ConnectionSentByAccount => params[:data][:emailid],:is_scraped=>true,:scraped_datetime =>Time.now )
        end
        @check_connect = 1
      else
        if params[:data][:scrapped_check] == 'true'
          check_linke[0].is_scraped = true
          check_linke[0].scraped_datetime =Time.now
          check_linke[0].save
        end
        message ="Already connected to our database"
      end
    end
    render json: {status: 'SUCCESS', connect_status: @check_connect, data: message}, status: :ok
  end
end
