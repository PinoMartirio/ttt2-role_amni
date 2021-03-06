-- Convar to toggle the amnesiac popup when the amnesiac takes over a role

CreateConVar("ttt2_amnesiac_showpopup", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_amnesiac_confim_player", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_amnesiac_limit_to_unconfirmed", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_amnesiac_convars", function(tbl)
	tbl[ROLE_AMNESIAC] = tbl[ROLE_AMNESIAC] or {}

	table.insert(tbl[ROLE_AMNESIAC], {cvar = "ttt2_amnesiac_showpopup", checkbox = true, desc = "ttt2_amnesiac_showpopup (def. 1)"})
	table.insert(tbl[ROLE_AMNESIAC], {cvar = "ttt2_amnesiac_confim_player", checkbox = true, desc = "ttt2_amnesiac_confim_player (def. 0)"})
	table.insert(tbl[ROLE_AMNESIAC], {cvar = "ttt2_amnesiac_limit_to_unconfirmed", checkbox = true, desc = "ttt2_amnesiac_limit_to_unconfirmed (def. 1)"})
end)

hook.Add("TTT2SyncGlobals", "ttt2_amni_sync_convars", function()
	SetGlobalBool("ttt2_amnesiac_limit_to_unconfirmed", GetConVar("ttt2_amnesiac_limit_to_unconfirmed"):GetBool())
	SetGlobalBool("ttt2_amnesiac_confim_player", GetConVar("ttt2_amnesiac_confim_player"):GetBool())
end)

-- sync convars on change
cvars.AddChangeCallback("ttt2_amnesiac_limit_to_unconfirmed", function(cv, old, new)
	SetGlobalBool("ttt2_amnesiac_limit_to_unconfirmed", tobool(tonumber(new)))
end)

cvars.AddChangeCallback("ttt2_amnesiac_confim_player", function(cv, old, new)
	SetGlobalBool("ttt2_amnesiac_confim_player", tobool(tonumber(new)))
end)
