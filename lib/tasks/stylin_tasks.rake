namespace :stylin do
  namespace :development do
    desc "Copy templates from view directories into template directory"
    task :copy_templates_for_generator do
      view_path = File.expand_path("../../../app/views", __FILE__)
      template_path = File.expand_path("../../generators/templates/views", __FILE__)

      FileUtils.rm_r(template_path)
      FileUtils.cp_r(view_path, template_path)
    end
  end
end
