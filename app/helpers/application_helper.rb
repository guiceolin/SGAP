module ApplicationHelper
  def add_to_calendar object, options = {}
    label = options.delete(:label) || ''
    link_to "<i class='icon-calendar'></i>".html_safe + label, "http://www.google.com/calendar/event?ctext=+#{object.calendar_string}+&action=TEMPLATE&pprop=HowCreated%3AQUICKADD", options
  end

  def breadcrumb(path)
    all_paths = path.split('/').inject([]) do |memo,new|
      if memo.blank?
        memo << [new, new]
      else
        memo << [new, [memo.last.last,new].join('/')]
      end
      memo
    end
    # removes empty string that split create because first slash
    all_paths.shift

    breadcrumb_string = content_tag('ul', class: 'breadcrumb') do
      all_paths.collect do |crumb|
        content_tag(:li) do
          link_to(CGI::unescape(crumb.first.capitalize), crumb.last) + content_tag(:span, '/', class: 'divider')
        end
      end.join('').html_safe
    end
    breadcrumb_string.html_safe
  end
end
