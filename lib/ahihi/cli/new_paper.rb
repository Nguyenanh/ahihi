module Ahihi
  module CLI
    class NewPaper
      include Thor::Base
      include Thor::Actions
      source_root File.expand_path("../../templates", __FILE__)

      def create_paperwork(file_name)
        file_name = file_name.downcase
        copy_file "paper.yml", "~/.ahihi/#{file_name}.yml"
      end
    end
  end
end
