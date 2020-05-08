require 'colorize'
require_relative 'cursor.rb'
require_relative 'menu.rb'
require_relative 'keypress.rb'
require_relative 'screen.rb'
require_relative 'controls.rb'

Cursor.hide
Screen.show

main_menu = Menu.new(%w(Battle Characters Shop Objectives Upgrades Training Profile Exit))
character_menu = Menu.new(%w(Battle Heroes Villains Upgrades Training Stats Missions Gear Main\ Menu Exit))
battle_menu = Menu.new(%w(One Two Three Four Five Seven CHaracters Eight Nine Ten Main\ Menu Exit))
activities = {"MAIN MENU": main_menu, "BATTLE": battle_menu, "CHARACTERS": character_menu}

activity = "MAIN MENU"

Cursor.move [10,10]
print activities[:"#{activity}"]
until activity == "EXIT"
  activity = Controls.selector(activities[:"#{activity}"], 0)
end