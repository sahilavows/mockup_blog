class Dashboards::Dashboard4Controller < ApplicationController
  def dashboard_4
    @speed_meter =  
    {
      "overall_sat_lev" => 4.5,
      "sat_lev_emp_registration" => 4.5,
      "sat_lev_panel_clinic" => 4.5,
      "sat_lev_to_worker_reg" => 4.5,
      "proc_of_med_exam_understandable" => 4.5,
      "res_of_med_exam_ease_obtain" => 4.5,
      "overall_sat_to_fomema_exam" => 4.5,
      "overall_average_nps" => 4.5,
      "registration_process_web_portal" => 4.5,
      "loc_of_panel_clinic_near" => 4.5
    }
  end
end
