require 'thor'
require 'ahihi/cli/new_paper'
require 'ahihi/cli/run_paper'
module Ahihi
  class Board < Thor
    desc "list", "View all paperwork defined"
    long_desc <<-LIST

    You'll get something like below.

    monday.yml \n
    tuesday.yml \n
    subday.yml

    Note: view all paperwork at ~/.ahihi
    LIST

    def list
      # Dir[ '~/.ahihi/*.yml' ].select{ |f| p "anh" }
    end

    desc "new monday", "New a paperwork with name monday.yml at ~/.ahihi folder"
    option :e
    def new paperwork
      Ahihi::CLI::NewPaper.new.create_paperwork(paperwork)
      your_editor = options[:e] || "nano"
      exec "sudo #{your_editor} ~/.ahihi/#{paperwork.downcase}.yml"
    end

    long_desc <<-RUN

    Step by step run task of paperwork.

    cd: Project-Ruby \n
    sublime: ahihi

    RUN

    desc "let monday", "Let run some task of paperwork in monday.yml at ~/.ahihi folder"
    def let paperwork
      Ahihi::CLI::RunPaper.read_paperwork paperwork
    end
  end
end
