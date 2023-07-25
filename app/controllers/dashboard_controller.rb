class DashboardController < ApplicationController
  def dashboard_1
    @right_chart_data = [
                                    ["Element", "Density", {
                                      role: "style"
                                    }],
                                    ["Copper", 8.94, "#b87333"],
                                    ["Silver", 10.49, "silver"],
                                    ["Gold", 19.30, "gold"],
                                    ["Platinum", 21.45, "color: #e5e4e2"]
                                  ]
    @center_pi_chart_data = [
                                    ['Task', 'Hours per Day'],
                                    ['Work', 11],
                                    ['Eat', 2],
                                    ['Commute', 2],
                                    ['Watch TV', 2],
                                    ['Sleep', 7]
                                  ]
    @left_bar_chart_data = [
                                    ["Element", "Density", {
                                      role: "style"
                                    }],
                                    ["Copper", 8.94, "#0e7dc1"],
                                    ["Silver", 10.49, "#29A6A6."],
                                    ["Gold", 19.30, "#A52A2A"],
                                    ["Platinum", 21.45, "color: #e5e4e2"]
                                  ]
    @bottom_line_chart_data = [
                                    ['Year', 'Sales', 'Expenses'],
                                    ['2004', 1000, 400],
                                    ['2005', 1170, 460],
                                    ['2006', 660, 1120],
                                    ['2007', 1030, 540]
                                  ]
  end
end
