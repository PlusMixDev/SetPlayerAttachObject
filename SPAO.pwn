new attachedit[MAX_PLAYERS];

CMD:sattach(playerid, params[])  {
    new user,slot,slot2;
    if(sscanf(params, "ddd", user, slot, slot2))
        SendClientMessage(playerid, -1, "/sattach [slot] [object] [bone]");

    SetPlayerAttachedObject(playerid, user, slot, slot2);
    return 1;
}

CMD:eattach(playerid, params[])  {
    new user;
    if(sscanf(params, "d", user))
        SendClientMessage(playerid, -1, "/eattach [slot]");

    attachedit[playerid] = 1;
    EditAttachedObject(playerid, user);
    return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) {
	new szMessage[300];
    	if(response == EDIT_RESPONSE_FINAL) {
	   	if(attachedit[playerid] == 1) {
   			attachedit[playerid] = 0;
        		SetPlayerAttachedObject(playerid, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ);
			printf("SetPlayerAttachedObject(playerid, %d,%d,%d,%f,%f,%f,%f,%f,%f,%f,%f,%f);",index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX,fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);

			format(szMessage, sizeof(szMessage), "%d Attached object ถูกบันทึกแล้ว",modelid);
		   	SendClientMessage(playerid, -1, szMessage);
		}
	}
	return 1;
}
