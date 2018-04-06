// -----------------------------------------------------------------------------
//    File: core_c_config.nss
//  System: Core Framework (configuration script)
//     URL: https://github.com/squattingmonk/nwn-core-framework
// Authors: Michael A. Sinclair (Squatting Monk) <squattingmonk@gmail.com>
// -----------------------------------------------------------------------------
// Core Framework configuration settings. This script contains user-definable
// toggles and settings for the Core Framework. This script is freely editable
// by the mod builder. All below constants may be overridden, but do not alter
// the names of the constants.
//
// Remember: any changes to this file will not be reflected in the module unless
// you recompile all scripts in which this file is included (however remotely).
// -----------------------------------------------------------------------------
// Aknowledgment:
// The scripts contained in this package are adapted from those included in
// Edward Beck's HCR2 and EPOlson's Common Scripting Framework.
// -----------------------------------------------------------------------------

#include "util_i_debug"

// -----------------------------------------------------------------------------
//                                   Debugging
// -----------------------------------------------------------------------------

// This is the level of debug messages that will be written to the log and
// displayed to online DMs.
// Possible values:
// - DEBUG_LEVEL_CRITICAL: errors severe enough to stop the script
// - DEBUG_LEVEL_ERROR: indicates the script malfunctioned in some way
// - DEBUG_LEVEL_WARNING: indicates unexpected behavior may occur
// - DEBUG_LEVEL_NOTICE: information to track the flow of functions
const int DEBUG_LEVEL_CORE = DEBUG_LEVEL_NOTICE;

// -----------------------------------------------------------------------------
//                               Plugin Management
// -----------------------------------------------------------------------------

// This is a comma-separated list of plugins that should be loaded OnModuleLoad.
// The order indicates priority.
const string INSTALLED_PLUGINS = "auth, dlg, pqj";

// -----------------------------------------------------------------------------
//                               Event Management
// -----------------------------------------------------------------------------

// These settings control the order in which event hook-ins run. Event hook-ins
// get sorted by their priority: a floating point number between 0.0 and 10.0.
// While you can specify a priority for a hook in the same variable that calls
// it, you can set a default priority here to avoid having to repeatedly set
// priorities.
//
// Event hook-ins are sorted into global and local types:
// - Global event hook-ins are defined by an installed plugin. They are called
//   whenever a particular event is triggered.
// - Local event hook-ins are defined on a particular object, such as a creature
//   or placeable, or on the area or persistent object (such as a trigger or
//   AoE) the object is in.
// By default, local scripts have priority over global scripts. You can change
// this for all scripts here or set thr priorities of scripts in the object
// variables on a case-by-case basis.

// This is the default priority for global event hook-in scripts (i.e., on a
// plugin object) that do not have a proprioty explicitly set.  It can be a
// value from 0.0 - 10.0 (where a higher priority = earlier run time). If you
// set this to a negative number, hook-in scripts with no explicit priority will
// not run (not recommended).
// Default value: 5.0
const float GLOBAL_EVENT_PRIORITY = 5.0;

// This is the default priority for local event hook-in scripts (i.e., set on an
// object besides a plugin) that do not have a priority explicitly assigned.
// This can be a value from 0.0 - 10.0 (where a hgher priority = earlier run
// time). If you set this to a negative number, local hook-nin scripts with no
// explicit priority will not run (not recommended). It is recommended that you
// set this higher than the value of GLOBAL_EVENT_PRIORITY. This ensures local
// event scripts will run before most globally defined scripts.
// Default value: 7.0
const float LOCAL_EVENT_PRIORITY = 7.0;

// This controls whether the Core handles tag-based scripting on its own. If
// this is TRUE, tag-based scripts will be called as library scripts rather than
// stand-alone scripts, allowing you to greatly reduce the number of tag-based
// scripts in the module. If you have traditional ag-based scripts, those will
// continue to work. The only reason you might want to turn this off is to
// completely disable tag-based scripting or to use a plugin to call the desired
// scripts (e.g., make a plaugin for the BioWare X2 functions, which handle
// tag-based scripting on their own).
// Default value: TRUE
const int ENABLE_TAGBASED_SCRIPTS = TRUE;

// -----------------------------------------------------------------------------
//                                 Custom Events
// -----------------------------------------------------------------------------

// This toggles whether to allow the OnHour event. If this is TRUE, the OnHour
// event will execute each time the hour changes.
const int ENABLE_ON_HOUR_EVENT = TRUE;

// This toggles whether the OnAreaEmpty event runs. If this is TRUE, the
// OnAreaEmpty event will run on an area ON_AREA_EMPTY_EVENT_DELAY seconds after
// the last PC exists the area. This is a good event for area cleanup scripts.
const int ENABLE_ON_AREA_EMPTY_EVENT = TRUE;

// This is the number of seconds after an area is emptied of player to run the
// OnAreaEmpty scripts for that area.
// Default value: 180.0 (3 real-life minutes)
const float ON_AREA_EMPTY_EVENT_DELAY = 180.0;

// -----------------------------------------------------------------------------
//                                 Miscellaneous
// -----------------------------------------------------------------------------

// This is the welcome message that will be sent to all players and DMs that log
// into the module.
const string WELCOME_MESSAGE = "Welcome to the Core Framework.";
