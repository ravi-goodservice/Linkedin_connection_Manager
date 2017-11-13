class Api::LinkedinprofileController < ApplicationController
  def check_connection_sent
    puts 'sssss'
    puts params[:data]
    linkedin_return_dict={}
    for url in params[:data][:linkdin_url] do
      puts url['linkurl']
      check_linke=Linkedinconnectprofile.find_by_linkedinid_and_connectionsent_and_ConnectionSentByAccount(:url["linkurl"],'No',:url["emailid"])
      if check_linke.to_s.empty?
        linkedin_return_dict[url['div_id']]='No'
      else
        linkedin_return_dict[url['div_id']]='Yes'
      end
    end
    render json: {status: 'SUCCESS', message: 'Checked', data: linkedin_return_dict}, status: :ok
  end
  def add_connection
    puts params[:data]
    puts params[:data][:emailid]
    puts params[:data][:linkdin_url]
    check_linke=Linkedinconnectprofile.find_by_linkedinid(:params[:data][:linkdin_url])
    if check_linke.to_s.empty?
      Linkedinconnectprofile.create(:linkedinid => params[:data][:linkdin_url],:connectionsent => 'Yes',:ConnectionSentByAccount => params[:data][:emailid],:connectiondatetime =>Time.now )
    else
      puts check_linke
    end
    render json: {status: 'SUCCESS', message: 'Checked', data: 'done'}, status: :ok
  end
end
