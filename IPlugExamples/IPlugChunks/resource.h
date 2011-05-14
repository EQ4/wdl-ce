// Double quotes, spaces OK.
#define PLUG_MFR "Manufacturer"
#define PLUG_NAME "IPlugChunks"

// No quotes or spaces.
#define PLUG_CLASS_NAME IPlugChunks

// OSX crap.
// - Manually edit the info.plist file to set the CFBundleIdentifier to the either the string 
// "com.BUNDLE_MFR.audiounit.BUNDLE_NAME" or "com.BUNDLE_MFR.vst.BUNDLE_NAME".
// Double quotes, no spaces.
#define BUNDLE_MFR "Manufacturer"
#define BUNDLE_NAME "IPlugChunks"

// - Manually create a PLUG_CLASS_NAME.exp file with two entries: _PLUG_ENTRY and _PLUG_VIEW_ENTRY
// (these two defines, each with a leading underscore).
// No quotes or spaces.
#define PLUG_ENTRY IPlugChunks_Entry
#define PLUG_VIEW_ENTRY IPlugChunks_ViewEntry

// The same strings, with double quotes.  There's no other way, trust me.
#define PLUG_ENTRY_STR "IPlugChunks_Entry"
#define PLUG_VIEW_ENTRY_STR "IPlugChunks_ViewEntry"

// This is the exported cocoa view class, some hosts display this string.
// No quotes or spaces.
#define VIEW_CLASS IPlugChunks_View
#define VIEW_CLASS_STR "IPlugChunks_View"

// This is interpreted as 0xMAJR.MN.BG
#define PLUG_VER 0x00010000

// http://service.steinberg.de/databases/plugin.nsf/plugIn?openForm
// 4 chars, single quotes. must include one capital letter
#define PLUG_UNIQUE_ID 'IplA'
// make sure this is not the same as BUNDLE_MFR
#define PLUG_MFR_ID 'Acme'

#define PLUG_CHANNEL_IO "1-1 2-2"

#define PLUG_LATENCY 0
#define PLUG_IS_INST 0
#define PLUG_DOES_MIDI 0
#define PLUG_DOES_STATE_CHUNKS 0

// Unique IDs for each image resource.
//#define KNOB_ID 101
//#define BG_ID   102

// Image resource locations for this plug.
//#define KNOB_FN "img/knob.png"
//#define BG_FN   "img/bg.png"

//Make sure there is allways a newline character at the end of this file (msvc bug)

