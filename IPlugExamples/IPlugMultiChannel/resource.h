// Double quotes, spaces OK.
#define PLUG_MFR "Manufacturer"
#define PLUG_NAME "IPlugMultiChannel"

// No quotes or spaces.
#define PLUG_CLASS_NAME IPlugMultiChannel

// OSX crap.
// - Manually edit the info.plist file to set the CFBundleIdentifier to the either the string 
// "com.BUNDLE_MFR.audiounit.BUNDLE_NAME" or "com.BUNDLE_MFR.vst.BUNDLE_NAME".
// Double quotes, no spaces.
#define BUNDLE_MFR "Manufacturer"
#define BUNDLE_NAME "IPlugMultiChannel"

// - Manually create a PLUG_CLASS_NAME.exp file with two entries: _PLUG_ENTRY and _PLUG_VIEW_ENTRY
// (these two defines, each with a leading underscore).
// No quotes or spaces.
#define PLUG_ENTRY IPlugMultiChannel_Entry
#define PLUG_VIEW_ENTRY IPlugMultiChannel_ViewEntry

// The same strings, with double quotes.  There's no other way, trust me.
#define PLUG_ENTRY_STR "IPlugMultiChannel_Entry"
#define PLUG_VIEW_ENTRY_STR "IPlugMultiChannel_ViewEntry"

// This is the exported cocoa view class, some hosts display this string.
// No quotes or spaces.
#define VIEW_CLASS IPlugMultiChannel_View
#define VIEW_CLASS_STR "IPlugMultiChannel_View"

// This is interpreted as 0xMAJR.MN.BG
#define PLUG_VER 0x00010000

// http://service.steinberg.de/databases/plugin.nsf/plugIn?openForm
// 4 chars, single quotes. must include one capital letter
#define PLUG_UNIQUE_ID 'Ipmc'
// make sure this is not the same as BUNDLE_MFR
#define PLUG_MFR_ID 'Acme'

//the channel io should include the side chain channels
//it seems that for an AU with side chain input you also need to support no sidechain
#define PLUG_CHANNEL_IO "2-2 4-2"

#define PLUG_SC_CHANS 2 // audiounit effects only
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

