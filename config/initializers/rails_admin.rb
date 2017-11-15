RailsAdmin.config do |config|
  config.excluded_models << User
  config.model 'Linkedinconnectprofile' do
    # object_label_method do
    #   :custom_label_method
    # end
    list do
      # simply adding fields by their names (order will be maintained)
      include_fields :id,:linkedinid, :created_at,:ConnectionSentByAccount,:is_scraped
    end
  end
  config.actions do
    dashboard
    index
    export
    history_index
    show
    history_show
    show_in_app
  end
  config.authenticate_with do
    if current_user
      if current_user.admin == false
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end
end