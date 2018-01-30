ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    panel "步骤" do
        ol do
            li link_to "初始化城市", admin_cities_path
            li link_to "初始化库位", admin_storages_path
            li link_to "初始化员工", admin_staffs_path
            hr

            li link_to "出入库操作", admin_documents_path
            li link_to "借还文档", admin_op_records_path
            #li link_to "Milestones", admin_project_milestones_path(resource)
        end
    end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
        
        span '欢迎访问Zara 文档管理系统'
        

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
