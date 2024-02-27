{-# OPTIONS_GHC -Wno-deprecations #-}
--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Actions.CycleWS
import Text.Printf
import XMonad.Util.Dzen
import Graphics.X11.Xinerama
import XMonad.Hooks.SetWMName
import XMonad.Actions.WindowBringer

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
-- myTerminal      = "st -f 'DejaVu Sans Mono:size=17'"
myTerminal      = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#0099ff"
--myFocusedBorderColor = "#ff0000"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm              , xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    --, ((modm,               xK_p     ), spawn "dmenu_run")

    -- launch gmrun
    , ((modm              , xK_o     ), spawn "GTK_THEME=Adwaita:dark gmrun")

    -- close focused window
    , ((modm              , xK_d     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_w     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_l     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_h     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_m     ), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_l     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_h     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_j     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_k     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_u     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_s ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_r), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart")

    -- Move to workspace given a window name
    , ((modm              , xK_slash ), gotoMenu)

    -- Bring window with given name to workspace
    , ((modm .|. shiftMask, xK_slash ), bringMenu)

    -- Launch screenshot tool
    , ((modm              , xK_p     ), spawn "flameshot gui")

    -- Lock the screen
    , ((modm              , xK_Escape), spawn "slock")

    -- Change current monitor to the next hidden, non-empty workspace
    , ((modm              , xK_t     ), moveTo Next HiddenNonEmptyWS)

    -- Change current monitor to the next hidden empty workspace
    , ((modm              , xK_g     ), moveTo Next HiddenEmptyWS)

    -- Indicate which workspace is on which screen
    , ((modm              , xK_c     ), notifyWorkspaceTags)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9]--[xK_ampersand, xK_bracketleft, xK_braceleft, xK_braceright, xK_parenleft, xK_equal, xK_asterisk, xK_parenright, xK_plus]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{a,o,e}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{a,o,e}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), (screenWorkspace sc >>= flip whenJust (windows . f)))
        | (key, sc) <- zip [xK_n, xK_a, xK_i] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++

    --
    --Multimedia keys
    [ ((0, stringToKeysym "XF86MonBrightnessDown"         ), spawn ("xbacklight -dec 5") >> notifyBrightness)
    , ((0, stringToKeysym "XF86MonBrightnessUp"           ), spawn ("xbacklight -inc 5") >> notifyBrightness)
    , ((shiftMask, stringToKeysym "XF86MonBrightnessUp"   ), spawn ("xbacklight -set 100") >> notifyBrightness)
    , ((shiftMask, stringToKeysym "XF86MonBrightnessDown" ), spawn ("xbacklight -set 1") >> notifyBrightness)
    , ((0, stringToKeysym "XF86AudioLowerVolume"          ), spawn ("pactl set-sink-volume 1 -5%;") >>  notifyAudioVolume)
    , ((0, stringToKeysym "XF86AudioRaiseVolume"          ), spawn ("pactl set-sink-volume 1 +5%") >> notifyAudioVolume)
    --, ((0, stringToKeysym "XF86AudioLowerVolume"          ), spawn ("GTK_THEME=Adwaita:dark; pavucontrol -t 3"))
    --, ((0, stringToKeysym "XF86AudioRaiseVolume"          ), spawn ("GTK_THEME=Adwaita:dark; pavucontrol -t 3"))
    , ((0, stringToKeysym "XF86AudioMute"                 ), spawn ("pactl set-sink-mute 1 toggle"))
    ]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Pavucontrol" --> doFloat
    , className =? "PathgenGUI" --> doFloat
    , className =? "Gmrun" --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    setWMName "LG3D"
    spawn "/home/lu/bin/setKeyboard"
    --spawn "xset r rate 300 50"
    --spawn "setxkbmap -option compose:ralt"
    spawn "python /usr/bin/prime-offload"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
    xmbar <- spawnPipe "killall xmobar; xmobar -x 0"
    xmonad $ docks defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]

------------------------------------------------------------------------
-- helper functions
notifyAudioVolume :: X ()
notifyAudioVolume = do
    vol <- runProcessWithInput "/home/lu/bin/audiovolume" [] []
    screen <- notificationScreen
    dzenConfig (timeout 0.4 >=> center 120 50 screen) ("Volume: " ++ vol)

notifyBrightness :: X ()
notifyBrightness = do
    brightness <- fst <$> span (/='.') <$> runProcessWithInput "/home/lu/bin/brightness" [] []
    screen <- notificationScreen
    dzenConfig (timeout 0.4 >=> center 130 50 screen) ("Brightness: " ++ brightness)

notifyScreenId :: X ()
notifyScreenId = do
    screencount <- xScreenCount
    let screens = [0 .. (screencount - 1)]
    sequence $ fmap (\s -> dzenConfig (timeout 1 >=> center 130 130 (S s) >=> font "DejaVu Sans Mono:size=80") (show s)) screens
    return ()

xScreenCount :: X Int
xScreenCount = withDisplay (io . fmap length . getScreenInfo)

notificationScreen :: X ScreenId
notificationScreen = do
    screencount <- xScreenCount
    return (if screencount == 3 then 1
                                else 0)

notifyWorkspaceTags :: X ()
notifyWorkspaceTags = do
    screens <- W.screens <$> getWindowState
    let screenIds = W.screen <$> screens
    let workspaceTags = W.tag <$> W.workspace <$> screens
    sequence $ fmap (\(sid, tag) -> dzenConfig (timeout 1 >=> center 130 130 sid >=> font "DejaVu Sans Mono:size=80" >=> font "DejaVu Sans Mono:size=80") tag) $ zip screenIds workspaceTags
    return ()

getWindowState :: X (WindowSet)
getWindowState = do
    XState { windowset = old } <- get
    return old