--[[-------------------------------------------------------------------------
Copyright 2017-2018 viral32111

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
---------------------------------------------------------------------------]]

if not (sql.TableExists("afksystem")) then
	sql.Query("CREATE TABLE afksystem (steamid TEXT, weapons TEXT, position TEXT)")
end

--[[-------------------------------------------------------------------------
Remove stored information when the player disconnects.
---------------------------------------------------------------------------]]
hook.Add("PlayerDisconnected", "afkSystemDisconnect", function(ply)
	sql.Query("DELETE FROM afksystem WHERE steamid = '" .. ply:SteamID64() .. "'")

	--[[local result = sql.Query("DELETE FROM afksystem WHERE steamid = '" .. ply:SteamID64() .. "'")

	if (result == false) then
		print("SQL Error: " .. sql.LastError())
	end]]
end)