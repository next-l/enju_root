module EnjuRoot
  module ApplicationHelper
    def frbr_graph(resource)
      resource.frbr_graph.read.html_safe.force_encoding('UTF-8')
    end
  end
end
