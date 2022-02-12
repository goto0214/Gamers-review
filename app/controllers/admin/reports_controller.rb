class Admin::ReportsController < ApplicationController

  def index
    if Report.exists?
      @reports = Report.all.includes(:review)
    else
      admin_root_path
    end
  end

end
