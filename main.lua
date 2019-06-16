-- 
-- Abstract: materialcolors Library Plugin Test Project
-- 
--This is an example Corona Project documenting how
-- to use the Material Hex Color library.
--
-- Created by Joseph Hinkle
--
------------------------------------------------------------

-- Load plugin library
local materialColors = require "plugin.materialcolors"
materialColors.initHooks()

local widget = require "widget"

-------------------------------------------------------------------------------
-- BEGIN (Insert your sample test starting here)
-------------------------------------------------------------------------------

-- screen positioning
local screenSB = display.topStatusBarContentHeight
local screenW = display.contentWidth
local screenH = display.contentHeight
local screenAW = display.actualContentWidth
local screenAH = display.actualContentHeight
local screenCX = display.contentCenterX
local screenCY = display.contentCenterY + screenSB * .5
local screenL = -(screenAW-screenW)*.5
local screenR = screenAW-(screenAW-screenW)*.5
local screenT = -(screenAH-screenH)*.5 + screenSB
local screenB = screenAH-(screenAH-screenH)*.5
local screenH = screenH - screenSB
local screenAH = screenAH - screenSB
-- status bar included
local screenAHWithSB = screenAH + screenSB
local screenCYWithSB = screenCY - screenSB * .5
local screenTWithSB = screenT - screenSB

--
-- TEST
--
local titleBarColor = "blue350"
local notificationBarColor = materialColors.getAccentColor( titleBarColor )
local titleBarHeight = 60

local bg = display.newRect( screenCX, screenCYWithSB, screenAW, screenAHWithSB )
bg:setFillColor( "orange400" )

local titleBar = display.newRect( screenCX, screenTWithSB + titleBarHeight*.5, screenAW, titleBarHeight )
titleBar:setFillColor( titleBarColor )
local notificationBar = display.newRect( screenCX, screenTWithSB+screenSB*.5, screenAW, screenSB )
notificationBar:setFillColor( notificationBarColor )

local title = display.newText( 'title:setFillColor( "#00FFFF" )', screenCX, screenT + 20, nil, 24 )
title:setFillColor( "#00FFFF" )

local button = widget.newButton({
    left = 50,
    top = 20,
    label = 'local button = widget.newButton({\n\tlabelColor = {\n\t\tdefault={ "lightGreen900" },\n\t\tover={ "lightGreen600" } },\n\tfillColor = {\n\t\tdefault={"green300"},\n\t\tover={"lightGreen300-50"} },\n\tstrokeColor = {\n\t\tdefault={ "lightGreen300" },\n\t\tover={ "lightGreen500" } }\n})',
    shape = "rect",
    width=screenAW - 100,
    fontSize = 14,
    height = 200,
    labelColor = { default={ "lightGreen900" }, over={ "lightGreen600" } },
    fillColor = { default={"green300"}, over={"lightGreen300-50"} },
    strokeWidth = 10,
    strokeColor = { default={ "lightGreen300" }, over={ "lightGreen500" } }
})

local circle = display.newCircle( screenCX, screenCY+85, screenAW*.3 )

-- added my own colors
circle:setFillColor( "azul200" )
materialColors.addNewMaterialColor( "azul", {
    "#E1F5FE", -- will be used for "azul50"
    "#B3E5FC", -- will be used for "azul100"
    "#81D4FA", -- will be used for "azul200"
    "#4FC3F7", -- will be used for "azul300"
    "#29B6F6", -- will be used for "azul400"
    "#03A9F4", -- will be used for "azul500"
    "#039BE5", -- will be used for "azul600"
    "#0288D1", -- will be used for "azul700"
    "#0277BD", -- will be used for "azul800"
    "#01579B"  -- will be used for "azul900"
})
circle:setFillColor( "azul850" )
circle.strokeWidth = 5
circle:setStrokeColor( "azul500" )
display.newText( 'circle:setFillColor("azul200")\ncircle:setStrokeColor( "azul500" )', circle.x, circle.y, nil, 12 )


local doggo = display.newImage( "doggo.jpg" )
doggo:scale(.08,.08)
doggo.x = screenL + 50
doggo.y = screenB - doggo.height*.08*.5 - 10
doggo:setFillColor( materialColors.mixColors("purple700","blue700",.38) )
display.newText( 'doggo:setFillColor(\n\tmaterialColors.mixColors(\n\t"purple700",\n\t"blue700",\n\t.38)\n)', screenCX + 40, doggo.y, nil, 12 ):setFillColor( 0 )


-- -------------------------------------------------------------------------------
-- -- END
-- -------------------------------------------------------------------------------
