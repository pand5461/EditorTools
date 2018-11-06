" kerboscript.vim: Syntax highlighting for kerboscript
" Copyright (C) 2015  Tom van der Lee
" 
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
" 
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
"
" Vim syntax file
" Language:	kerboscript
" Maintainer:	Tom van der Lee <t0m.vd.l33@gmail.com>

if exists("b:current_syntax")
	finish
endif

syn case ignore

" Booleans "{{{1
syn keyword	ksBoolean	true false
hi def link	ksBoolean	Boolean

" Conditionals "{{{1
syn keyword	ksConditional	if else when then on off and or not
hi def link	ksConditional	Conditional

" Constants "{{{1
syn keyword	ksConstant	pi e g c solarprimevector red green blue yellow cyan magenta purple white black
syn match	ksConstant	"@lazyglobal"
hi def link	ksConstant	Constant

" Numeric literals "{{{1
" Regex design borrowed from python.vim. Order matters.
syn match	ksNumber	"\v<\d+>"
syn match	ksFloat		"\v<\d+e[-+]?\d+>"
syn match	ksFloat		"\v<\d+\.%(e[-+]?\d+)?%(\W|$)@="
syn match	ksFloat		"\v%(^|\W)@<=\d*\.\d+%(e[-+]?\d+)?>"
hi def link	ksNumber	Number
hi def link	ksFloat		Float

" Functions "{{{1
"
syn keyword	ksFunction	add remove stage clearscreen log copy rename delete edit run compile switch reboot shutdown batch deploy activate togglemode print transmit clearvecdraws highlight
syn keyword	ksFunction	runpath runoncepath copypath movepath deletepath exists create createdir open writejson readjson cd
syn keyword	ksFunction	transfer transferall hasnode
hi def link	ksFunction	Function

" 
" Keywords "{{{1
syn keyword	ksKeyword	set to is lock unlock declare parameter toggle return
hi def link	ksKeyword	Keyword

" 
" Operators "{{{1
syn keyword	ksOperator	abs ceiling floor ln log10 mod min max round sqrt sin cos tan arcsin arccos arctan arctan2 positionat velocityat orbitat vdot vcrs vxcl vang vectordotproduct vectorcrossproduct vectorangle vectorexclude lookdirup angleaxis rotatefromto heading rgb rgba hsv hsva
syn match	ksOperator	'\*'
syn match	ksOperator	'\^'
syn match	ksOperator	'/'
syn match	ksOperator	'-'
syn match	ksOperator	'+'
syn match	ksOperator	'<='
syn match	ksOperator	'>='
syn match	ksOperator	'<>'
syn match	ksOperator	'=='
syn match	ksOperator	'='
syn match	ksOperator	'<'
syn match	ksOperator	'>'
hi def link	ksOperator	Operator

" Comments "{{{1
syn match	ksComment	"//.*$" contains=ksTodo
hi def link	ksComment	Comment

" Regions "{{{1
syn region	ksParens	start='(' end=')' fold transparent
syn region	ksCodeBlock	start='{' end='}' fold transparent
syn region	ksArraryIndex	start='\[' end='\]' fold transparent

" Structures "{{{1
syn keyword	ksStructure	constant vessel ship kuniverse steeringmanager core nextnode archive terminal alt eta processor body gui config time addons target path scriptpath volume
syn keyword	ksStructure	bodies targets processors resources parts engines sensors elements dockingports files volumes allnodes
syn keyword	ksStructure	homeconnection controlconnection
hi def link	ksStructure	Structure

" Suffixes "{{{1
syn match	ksSuffix	":deltav\|:burnvector\|:prograde\|:radialout\|:normal"
syn match	ksSuffix	":r\|:red\|:g\|:green\|:b\|:blue\|:a\|:alpha\|:h\|:hue\|:s\|:saturation\|:v\|:value\|:html\|:hex"
syn match	ksSuffix	":x\|:y\|:z\|:mag\|:normalized\|:sqrmagnitude\|:direction\|:vec"
syn match	ksSuffix	":ipu\|:ucp\|:stat\|:rt\|:arch\|:obeyhideui\|:safe\|:audioerr\|:verbose\|:telnet\|:tport\|:ipaddress\|:brightness\|:defaultfontsize\|:debugeachopcode"
syn match	ksSuffix	":call\|:bind"
syn match	ksSuffix	":lastsampletime\|:kp\|:ki\|:kd\|:input\|:setpoint\|:error\|:output\|:maxoutput\|:minoutput\|:errorsum\|:pterm\|:iterm\|:dterm\|:changerate\|:reset\|:update"
syn match	ksSuffix	":body\|:orbit\|:hasbody\|:hasorbit\|:hasobt\|:obt\|:up\|:north\|:prograde\|:srfprograde\|:retrograde\|:srfretrograde\|:position\|:velocity\|:latitude\|:longitude\|:geoposition\|:patches"
syn match	ksSuffix	":surface\|:lat\|:lng\|:distance\|:terrainheight\|:heading\|:bearing\|:altitude\|:altitudeposition\|:altitudevelocity"
syn match	ksSuffix	":control\|:mainthrottle\|:yaw\|:pitch\|:roll\|:rotation\|:yawtrim\|:pitchtrim\|:rolltrim\|:fore\|:starboard\|:top\|:translation\|:wheelsteer\|:wheelthrottle\|:wheelsteertrim\|:wheelthrottletrim\|:neutral\|:neutralize"
syn match	ksSuffix	":pilotmainthrottle\|:pilotyaw\|:pilotpitch\|:pilotroll\|:pilotrotation\|:pilotyawtrim\|:pilotpitchtrim\|:pilotrolltrim\|:pilotfore\|:pilotstarboard\|:pilottop\|:pilottranslation\|:pilotwheelsteer\|:pilotwheelthrottle\|:pilotwheelsteertrim\|:pilotwheelthrottletrim\|:pilotneutral"
syn match	ksSuffix	":forevector\|:vector\|:topvector\|:upvector\|:starvector\|:rightvector\|:inverse"
syn match	ksSuffix	":gender\|:experience\|:trait\|:tourist\|:part"
syn match	ksSuffix	":partstagged\|:partsnamed\|:partsdubbed\|:partstitled\|:partstaggedpattern\|:partsnamedpattern\|:partstitledpattern\|:partsdubbedpattern"
syn match	ksSuffix	":width\|:height"
syn match	ksSuffix	":connection\|:messages"
syn match	ksSuffix	":type\|:tostring\|:hassuffix\|:suffixnames\|:isserializable\|:typename\|:istype\|:inheritance"
syn match	ksSuffix	":iterator\|:reverseiterator\|:length\|:contains\|:empty\|:dump"
syn match	ksSuffix	":reset\|:next\|:atend\|:index\|:value"
syn match	ksSuffix	":add\|:casesensitive\|:case\|:clear\|:copy\|:haskey\|:hasvalue\|:keys\|:values\|:remove"
syn match	ksSuffix	":insert\|:sublist\|:join\|:push\|:pop\|:peek\|:start\|:stop\|:step"
syn match	ksSuffix	":type\|:string\|:volume\|:segments\|:name\|:hasextension\|:extension\|:root\|:parent\|:changename\|:changeextension\|:isparent\|:combine"
syn match	ksSuffix	":freespace\|:capacity\|:renameable\|:files\|:powerrequirement\|:exists\|:create\|:createdir\|:open\|:delete"
syn match	ksSuffix	":readall\|:write\|:writeln\|:size\|:isfile"
syn match	ksSuffix	":amount\|:capacity"
syn match	ksSuffix	":apoapsis\|:periapsis\|:radar\|:transition"
syn match	ksSuffix	":vessel\|:element\|:version\|:currentvolume"
syn match	ksSuffix	":filepath\|:description\|:editor\|:launchsite\|:mass\|:cost\|:partcount"
syn match	ksSuffix	":acquirerange\|:acquireforce\|:acquiretorque\|:reengagedistance\|:dockedshipname\|:nodeposiiton\|:nodetype\|:portfacing\|:state\|:undock\|:targetable"
syn match	ksSuffix	":uid\|:parts\|:dockingports\|:resources"
syn match	ksSuffix	":thrustlimit\|:maxthrust\|:maxthrustat\|:thrust\|:availablethrust\|:availablethrustat\|:fuelflow\|:isp\|:ispat\|:vacuumisp\|:visp\|:sealevelisp\|:slisp\|:flameout\|:ignition\|:allowrestart\|:allowshutdown\|:throttlelock\|:multimode\|:mode\|:modes\|:primarymode\|:autoswitch\|:hasgimbal\|:gimbal"
syn match	ksSuffix	":lock\|:limit\|:range\|:responsespeed\|:pitchangle\|:yawangle\|:rollangle"
syn match	ksSuffix	":activate\|:deactivate\|:tag\|:bootfilename"
syn match	ksSuffix	":title\|:drymass\|:wetmass\|:controlfrom\|:stage\|:uid\|:facing\|:ship\|:getmodule\|:getmodulebyindex\|:modules\|:allmodules\|:hasmodule\|:hasparent\|:hasphysics\|:children"
syn match	ksSuffix	":allfields\|:allfieldnames\|:allevents\|:alleventnames\|:allactions\|:allactionnames\|:getfield\|:setfield\|:doevent\|:doaction\|:hasfield\|:hasevent\|:hasaction"
syn match	ksSuffix	":toggleable\|:enabled"
syn match	ksSuffix	":sciencevalue\|:transmitvalue\|:data\|:dataamount"
syn match	ksSuffix	":inoperable\|:rerunnable\|:deployed\|:hasdata"
syn match	ksSuffix	":active\|:display\|:powerconsumption"
syn match	ksSuffix	":ready\|:number\|:resourceslex"
syn match	ksSuffix	":dynamicpressure\|:q\|:verticalspeed\|:groundspeed\|:airspeed\|:shipname\|:status\|:starttracking\|:angularmomentum\|:angularvel\|:sensors\|:loaded\|:unpacked\|:loaddistance\|:isdead\|:patches\|:rootpart\|:controlpart\|:parts\|:dockingports\|:elements\|:modulesnamed\|:partsingroup\|:modulesingroup\|:allpartstagged\|:crew\|:crewcapacity"
syn match	ksSuffix	":acc\|:pres\|:temp\|:grav\|:light"
syn match	ksSuffix	":isconnected\|:delay\|:destination\|:sendmessage"
syn match	ksSuffix	":sentat\|:receivedat\|:sender\|:hassender\|:content"
syn match	ksSuffix	":period\|:inclination\|:eccentricity\|:semimajoraxis\|:semiminoraxis\|:lan\|:longitudeofascendingnode\|:argumentofperiapsis\|:trueanomaly\|:meananomalyatepoch\|:epoch\|nextpatch\|:nextpatcheta\|:hasnextpatch"
syn match	ksSuffix	":rotationperiod\|:radius\|:mu\|:atm\|:geopositionof\|:geopositionlatlng\|:altitudeof\|:soiradius\|:rotationangle\|:exists\|:oxygen\|:sealevelpressure\|:altitudepressure"
syn match	ksSuffix	":clock\|:calendar\|:second\|:minute\|:hour\|:day\|:year\|:seconds"
hi def link	ksSuffix	Define

" Special "{{{1
syn keyword	ksSpecial	rcs sas gear sasmode navmode mapview 
syn keyword	ksSpecial	lights brakes abort legs chutes chutessafe panels radiators ladders bays deploydrills drills fuelcells isru intakes steering wheelsteering throttle wheelthrottle
syn keyword	ksSpecial	warp allwaypoints
syn match	ksSpecial	"ag[0-9]"
hi def link	ksSpecial	Special

" Repeats "{{{1
syn keyword	ksRepeat	for until in
hi def link	ksRepeat	Repeat

" Statements "{{{1
syn keyword	ksStatement	wait break preserve
hi def link	ksStatement	Statement

" StorageClasses "{{{1
syn keyword	ksStorageClass	global local
hi def link	ksStorageClass	StorageClass

" Strings "{{{1
syn region	ksString	start=+"+ end=+"+
hi def link	ksString	String

" TODOs "{{{1
syn keyword	ksTodo		contained TODO
hi def link	ksTodo		Todo

" Types "{{{1
syn keyword	ksType		function q v r latlng parameter list lexicon lex uniqueset queue range stack waypoint node vecdraw vecdrawargs hudtext pidloop
hi def link	ksType		Type
" }}}

let b:current_syntax = "kerboscript"
" vim: set ts=8 sw=8 tw=78 fdm=marker noet :
