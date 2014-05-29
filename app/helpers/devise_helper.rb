module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    # messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    messages = ""
    resource.errors.full_messages.each do |message|
      messages += message + '<br/>'
    end
    html = <<-HTML
    <div class="alert alert-error alert-block"> <button type="button"
    class="close" data-dismiss="alert">x</button><p id='help_question_mark'>
      This form contains #{pluralize(resource.errors.count, "error")}.
      #{image_tag "help_question_mark.png",
        alt: "?", size: "20x20"}
        <span class='file_reqs'>#{messages}</span></p>
    </div>
    HTML

    html.html_safe
  end
end
