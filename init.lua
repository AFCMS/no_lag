local i_count = {}

minetest.register_on_joinplayer(function(player)
	i_count[player] = 0
end)

minetest.register_on_leaveplayer(function(player)
	i_count[player] = nil
end)


minetest.register_on_chat_message(function(name, message)
	if string.find(message, "l+a+g+") then
		minetest.chat_send_player(name, minetest.colorize("red", "[ADMIN] No, the server isn't lagging"))
		local player = minetest.get_player_by_name(name)
		if player then
			i_count[player] = i_count[player] + 1
			if i_count[player] >= 5 then
				minetest.kick_player(name, "\n\nYou don't have the right to criticize my server!\n It isn't lagging because I said so.")
			end
		end
		return true
	end
end)