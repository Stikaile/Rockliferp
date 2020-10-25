include ("sh_ano.lua")

local conf = ANOCONF

local function PlayerAno(ply, args)
        if args == "" then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
                return ""
        end
        local DoSay = function(text)
                if text == "" then
                        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
                        return
                end
                for k,v in pairs(player.GetAll()) do
                        DarkRP.talkToPerson(v, Color(255,0,0,255), conf.tchatmsg, Color(255, 255, 255, 255), text, ply)
						ServerLog(ply:Nick() .. "  do : ")
						end
	end
        return args, DoSay
end


DarkRP.defineChatCommand(conf.cmd, PlayerAno, 1.5) 

-- Declaration of the command


DarkRP.declareChatCommand{
	command = "ano",
	description = "write an annonyme on the tchat",
	delay = 1.5
}

-- Automatic message in the chat.


function MsgAuto()
    if AutoMSG then
        for k, v in pairs(player.GetAll()) do
	     v:ChatPrint( conf.AnoMsg )
        end
    end
  end

timer.Create( "automsg", conf.TimeMsg, 0, MsgAuto)

