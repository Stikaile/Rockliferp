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

--[[-------------------------------------------------------------------------
Include the configuration file
---------------------------------------------------------------------------]]
include("autorun/shared/sh_config.lua")

--[[-------------------------------------------------------------------------
HUD at the top of the screen
---------------------------------------------------------------------------]]
hook.Add("HUDPaint", "afkSystemHUD", function()
	local ply = LocalPlayer()

	if (ply:isAFK()) then
		local text = "Type '!afk' again to return to the game."

		surface.SetFont("TargetID")
		local width, height = surface.GetTextSize(text)

		draw.RoundedBox(5, ScrW()/2-(width/2), 65, width+20, height+10, Color(0, 0, 0, 220))
		draw.DrawText(text, "TargetID", ScrW()/2+10, 70, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	end
end)