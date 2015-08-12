local DialogSets=require('DialogSets')
local DFFile = require('DFCommon.File')
local DataCache = require('DFCommon.DataCache')

--print("Adding new dialogSets")

--[[
 There are 5 different types of events in Spacebase DF-9.
 Immigration
 	- This is when you get new citizens at your base (aka The cruisin' around event)
 Hostile Immigration
 	- This is just normal raiders you come up to the base (aka The fake service call)
 Ambigious Docking
 	- This is a docking event which can be good or bad (aka The messed up transmission not pirates)
 Hostile Docking events
 	- This is when the raiders dock with you (aka the offended zealots)
 General Docking
 	- Just a normal docking event (aka Fake service call) *Note - I'm not sure where this is called

 You can add more dialog choices to any of these events. They all use the same template.
 To change what event you are adding to just change the sEventType string down below.

 Immigration = 'immigrationEvents'
 Hostile Immigration = 'hostileImmigrationEvents'
 General Docking = 'dockingEvents'

 For docking it's a little more difficult. You need to change the code at table.insert down below

 Ambiguous docking = table.insert(DialogSets['dockingEvents']['ambiguous'], 1, tDlgSet)
 Hostile Docking events = table.insert(DialogSets['dockingEvents']['hostile'], 1, tDlgSet)
]]--

local sEventType = 'immigrationEvents'

local tDlg=DataCache.getData("linecode", DFFile.getDataPath('Dialog/Linecodes/MainGame_enUS.lua'))
-- Carefull not to override anyother line codes. You should probablly change the 'EVENT001TEXT' to your own thing.
-- You can go to the Dialog/Linecodes/MainGame_enUs.lua to check if you are causing any problems
tDlg['EVENT001TEXT'] = {sLine='Traveling Band of Merry Men'} -- Title
tDlg['EVENT002TEXT'] = {sLine='We see thou art has a mighty fine base!\nIt would be an honor if you would so kindly take us aboard your abode and give us shelter from this harsh outside space.'} --Request
tDlg['EVENT003TEXT'] = {sLine='We would kindly accept you in to our fine establishment'} -- AcceptButton
tDlg['EVENT004TEXT'] = {sLine='I think your in the wrong year... You should just go.'} -- RejectButton
tDlg['EVENT005TEXT'] = {sLine='Why thank you most kindly. We shall provide the utmost entertainment to our fellow crew members.'} -- AcceptedResponse
tDlg['EVENT006TEXT'] = {sLine='Just keep the robbing to a minimum.'} -- AcceptedResponseButton
tDlg['EVENT007TEXT'] = {sLine='We accept our fate. But fare not because we shall retrun on day!'} -- RejectedResponse
tDlg['EVENT008TEXT'] = {sLine='I think the renaissance is a few light years down the road.'} -- RejectedResponseButton
tDlg['EVENT009TEXT'] = {sLine='We shant take that kind of response from the likes of you! We are letting ourselves in now!'} -- ScrewYouResponse
tDlg['EVENT010TEXT'] = {sLine="Do you realize it's the year like 9000?"} -- ScrewYouResponseButton

local tDlgSet = {
    title='EVENT001TEXT',request='EVENT002TEXT',acceptButton='EVENT003TEXT',rejectButton='EVENT004TEXT',

    acceptedResponse='EVENT005TEXT',acceptedResponseButton='EVENT006TEXT',
    rejectedResponse='EVENT007TEXT',rejectedResponseButton='EVENT008TEXT',
    screwYouResponse='EVENT009TEXT',screwYouResponseButton='EVENT010TEXT',
}

table.insert(DialogSets[sEventType], 1, tDlgSet)

print("Dialog set added")
--print("Listing all immigrationEvents...")
--for k,v in pairs(DialogSets['immigrationEvents']) do print(k,v) end