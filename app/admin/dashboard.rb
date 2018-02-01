ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    panel "Steps:" do
        ol do
            li link_to "Init city", admin_cities_path
            li link_to "Init team", admin_teams_path
            li link_to "Init legal entity", admin_legal_entities_path
            li link_to "Init storage", admin_storages_path
            li link_to "Init staff", admin_staffs_path
            hr

            li link_to "Document manage", admin_documents_path
            li link_to "Operation record", admin_op_records_path
            #li link_to "Milestones", admin_project_milestones_path(resource)
        end
    end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
        
        span 'Welcome visite Library Management System'
        

      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
