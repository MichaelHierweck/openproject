#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

InstanceFinder.register(Category, Proc.new { |name| Category.find_by_name(name) })

Given /^the [Pp]roject "([^\"]*)" has (\d+) [cC]ategor(?:ies|y)? with(?: the following)?:$/ do |project, count, table|
  p = Project.find_by_name(project) || Project.find_by_identifier(project)
  table.rows_hash['assigned_to'] = Principal.like(table.rows_hash['assigned_to']).first if table.rows_hash['assigned_to']
  as_admin count do
    ic = FactoryGirl.build(:category, project: p)
    send_table_to_object(ic, table)
    ic.save
  end
end

Given /^the [Pp]roject "([^\"]*)" has (\d+) [cC]ategor(?:ies|y)?$/ do |project, count|
  p = Project.find_by_name(project) || Project.find_by_identifier(project)
  as_admin count do
    ic = FactoryGirl.build(:category, project: p)
    ic.save
  end
end
