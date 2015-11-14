module EnjuRoot
  module ApplicationHelper
    def frbr_graph(resource)
      g = GraphViz::new("G", type: :graph, use: "dot")
      g.node[:shape] = "plaintext"
      g.node[:fontsize] = 10

      case resource.class.to_s
      when 'EnjuRoot::Work'
        w = g.add_nodes(
          "[W#{resource.id}] #{resource.preferred_title}",
          "URL" => enju_root.work_path(resource),
          fontcolor: "red", shape: 'box', color: 'blue'
        )

        resource.parents.each do |parent|
          p = g.add_nodes(
            "[W#{parent.id}] #{parent.preferred_title}",
            "URL" => enju_root.work_path(parent),
            shape: 'box', color: 'blue'
          )
          g.add_edges(p, w)
        end

        resource.children.each do |child|
          c = g.add_nodes(
            "[W#{child.id}] #{child.preferred_title}",
            "URL" => enju_root.work_path(child),
            shape: 'box', color: 'blue'
          )
          g.add_edges(w, c)
          child.expressions.each do |expression|
            e3 = g.add_nodes(
              "[E#{expression.id}] #{expression.language.display_name} #{expression.content_type.display_name}",
              "URL" => enju_root.expression_path(expression),
              shape: 'box', color: 'blue'
            )
            g.add_edges(c, e3)
            expression.manifestations.each do |manifestation|
              m = g.add_nodes(
                "[M#{manifestation.id}] #{manifestation.cinii_title}",
                "URL" => enju_root.manifestation_path(manifestation),
                shape: 'box', color: 'blue'
              )
              g.add_edges(e3, m)
            end
          end
        end

      when 'EnjuRoot::Expression'
        e = g.add_nodes(
          "[E#{resource.id}] #{resource.language.display_name} #{resource.content_type.try(:name)}",
          "URL" => enju_root.expression_path(resource),
          fontcolor: "red", shape: 'box', color: 'blue'
        )
        w = g.add_nodes(
          "[W#{resource.work.id}] #{resource.work.preferred_title}",
          "URL" => enju_root.work_path(resource.work),
          shape: 'box', color: 'blue'
        )
        g.add_edges(w, e)

        resource.work.expressions.each do |expression|
          if expression != resource
            e = g.add_nodes(
              "[E#{expression.id}] #{expression.language.display_name} #{expression.content_type.display_name}",
              "URL" => enju_root.expression_path(expression),
              shape: 'box', color: 'blue'
            )
            g.add_edges(w, e)
          end
        end
      end

      if resource.class.to_s == 'EnjuRoot::Work'
        resource.expressions.each do |expression|
          e = g.add_nodes(
            "[E#{expression.id}] #{expression.language.display_name} #{expression.content_type.display_name}",
            "URL" => enju_root.expression_path(expression),
            shape: 'box', color: 'blue'
          )
          g.add_edges(w, e)
          expression.manifestations.each do |manifestation|
            m = g.add_nodes("[M#{manifestation.id}] #{manifestation.cinii_title}", "URL" => "/manifestations/#{manifestation.id}", shape: 'box', color: 'blue')
            g.add_edges(e, m)
            manifestation.expressions.each do |expression2|
              unless expressions.include?(expression2)
                e2 = g.add_nodes(
                  "[E#{expression2.id}] #{expression2.language.display_name} #{expression2.content_type.display_name}",
                  "URL" => enju_root.expression_path(expression2),
                  shape: 'box', color: 'blue'
                )
                g.add_edges(e2, m)
                if expression2.work != resource
                  w2 = g.add_nodes(
                    "[W#{expression2.work.id}] #{expression2.work.preferred_title}",
                    "URL" => enju_root.work_path(expression2.work),
                    shape: 'box', color: 'blue'
                  )
                  g.add_edges(w2, e2)
                end
                expression.work.parents.each do |parent|
                  w3 = g.add_nodes(
                    "[W#{parent.id}] #{parent.preferred_title}",
                    "URL" => enju_root.work_path(parent),
                    shape: 'box', color: 'blue'
                  )
                  g.add_edges(w3, w2)
                end
              end
            end
          end
        end
      end

      graph = Tempfile.open("#{resource.class.to_s}_graph_#{resource.id}") do |file|
        g.output(svg: file.path)
        file
      end
      File.read(graph.path).html_safe.force_encoding('UTF-8')
    end
  end
end
