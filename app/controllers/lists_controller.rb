require_relative '../models/list'

class ListsController  < ActiveRecord::Base

  def self.completed(list)
    list_to_search = List.where('name = ?', list)[0].id
    TasksController.completed(list_to_search)
  end

  def self.outstanding(list)
    list_to_search = List.where('name = ?', list)[0].id
    TasksController.outstanding(list_to_search)
  end

  def self.name_to_id(name)
    List.all.each { |list| return list.id if list.name == name }
  end

end
