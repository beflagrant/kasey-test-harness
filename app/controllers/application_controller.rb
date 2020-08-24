class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    respond_to do |format|
      format.html do
        render file: Rails.root.join('public', '404.html'),
               layout: false,
               status: :not_found
      end
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
