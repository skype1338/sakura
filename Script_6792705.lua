local tab = ui.create("A")
local enable = tab:switch("Auto")
local gear = enable:create()
local mode = gear:combo("Mode",{"16","30"})
local game_executed = false
events.round_start:set(function()
    if not enable:get() then return end	   
	local game_rules = entity.get_game_rules()
	if game_executed == true then return end
	if game_rules.m_bWarmupPeriod then game_executed = false else game_executed = true end
	if game_executed == false then return end
	if mode:get() == "16" then
	    utils.console_exec("say "..".16")
	else
	    utils.console_exec("say "..".30")
	end
end)
events.level_init:set(function()
    game_executed = false
end)
events.cs_game_disconnected:set(function()
    game_executed = false
end)
