#include <a_samp>
#include <jBan>
#include <zcmd>

#define COLOR_RED 0xFF0000FF

new
	ban_reason[MAX_REASON_LENGTH],
    ban_target,
    ban_time;

COMMAND:ban(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "[jBan]: You need to be logged in as an RCON administrator to perform this!");
	if(j_sscanf(params, "uis", ban_target, ban_time, ban_reason)) return SendClientMessage(playerid, COLOR_RED, "[jBan]: Correct usage -> /ban <player> <time (minutes)> <reason>");
	if(!IsPlayerConnected(ban_target)) return SendClientMessage(playerid, COLOR_RED, "[jBan]: Player was not found!");
	if(ban_time < 0) SendClientMessage(playerid, COLOR_RED, "[jBan]: Please input a valid ban time!");
	jBan(ban_target, playerid, ban_reason, ban_time);
	return 1;
}

COMMAND:unbanip(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "[jBan]: You need to be logged in as an RCON administrator to perform this!");
	if(isnull(params) || strlen(params) > MAX_PLAYER_IP) return SendClientMessage(playerid, COLOR_RED, "[jBan]: Correct usage -> /unbanip <ip address>");
	jUnbanIP(params);
	format(ban_reason, MAX_REASON_LENGTH, "[jBan]: You have un-banned %s", params);
	SendClientMessage(playerid, COLOR_RED, ban_reason);
	return 1;
}

COMMAND:unbanname(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "[jBan]: You need to be logged in as an RCON administrator to perform this!");
	if(isnull(params) || strlen(params) > MAX_PLAYER_NAME) return SendClientMessage(playerid, COLOR_RED, "[jBan]: Correct usage -> /unbanname <name>");
	jUnbanName(params);
	format(ban_reason, MAX_REASON_LENGTH, "[jBan]: You have un-banned %s", params);
	SendClientMessage(playerid, COLOR_RED, ban_reason);
	return 1;
}
