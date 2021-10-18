--------------------------------------------------
-----------------Rockstar-Editor------------------
--------------------------------------------------
RegisterCommand("record", function(source , args)
    StartRecording(1)
    QBCore.Functions.Notify("Started Recording!", "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Saved Recording!", "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Deleted Recording!", "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Later aligator!", "error")
end)
--------------------------------------------------
-----------------Pause-Menu-text------------------
--------------------------------------------------
CreateThread(function()
    AddTextEntry('FE_THDR_GTAO', 'Welcome to Free City!')
end)
--------------------------------------------------
------------------Prop----stuck-------------------
--------------------------------------------------
RegisterCommand('propstuck', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)