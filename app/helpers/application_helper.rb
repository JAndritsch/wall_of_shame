module ApplicationHelper
  def show_flash
    html = ""
    if flash[:error].present?
      html += %Q(
        <div class="alert alert-error">
          <strong>Error!</strong>
          #{flash[:error]}
        </div>
      )
    end

    if flash[:message].present?
      html += %Q(
        <div class="alert alert-success">
          <strong>Success!</strong>
          #{flash[:message]}
        </div>
      )
    end
    html
  end
end
