require_relative 'fund_request'

project1 = Project.new("Craft Store",1900, 2025)
project2 = Project.new("Yoga Studio", 4000, 4500)
project3 = Project.new("Social Networking", 17000, 17050)

projects = FundRequest.new("VC-Friendly Start-up Projects")
puts projects.title
projects.add_project(project1)
projects.add_project(project2)
projects.add_project(project3)
projects.request_funding(6)
projects.print_stats 






