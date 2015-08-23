# ~*~ encoding: utf-8 ~*~

class Gollum::Filter::Render < Gollum::Filter
  def extract(data)
    begin
      #Only the extention part of page_name is used (for wiki format selection)
      page_name = "p." + @markup.format.to_s
      data = GitHub::Markup.render(page_name, data)
      if data.nil?
        raise "There was an error converting #{@markup.name} to HTML."
      end
    rescue Object => e
      data = html_error("Failed to render page: #{e.message}")
    end

    data
  end

  def process(data)
    data
  end
end
