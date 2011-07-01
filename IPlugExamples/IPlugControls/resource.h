// Double quotes, spaces OK.
#define PLUG_MFR "Manufacturer"
#define PLUG_NAME "IPlugControls"

// No quotes or spaces.
#define PLUG_CLASS_NAME IPlugControls

// OSX crap.
// - Manually edit the info.plist file to set the CFBundleIdentifier to the either the string 
// "com.BUNDLE_MFR.audiounit.BUNDLE_NAME" or "com.BUNDLE_MFR.vst.BUNDLE_NAME".
// Double quotes, no spaces.
#define BUNDLE_MFR "Manufacturer"
#define BUNDLE_NAME "IPlugControls"

// - Manually create a PLUG_CLASS_NAME.exp file with two entries: _PLUG_ENTRY and _PLUG_VIEW_ENTRY
// (these two defines, each with a leading underscore).
// No quotes or spaces.
#define PLUG_ENTRY IPlugControls_Entry
#define PLUG_VIEW_ENTRY IPlugControls_ViewEntry

// The same strings, with double quotes.  There's no other way, trust me.
#define PLUG_ENTRY_STR "IPlugControls_Entry"
#define PLUG_VIEW_ENTRY_STR "IPlugControls_ViewEntry"

// This is the exported cocoa view class, some hosts display this string.
// No quotes or spaces.
#define VIEW_CLASS IPlugControls_View
#define VIEW_CLASS_STR "IPlugControls_View"

// This is interpreted as 0xMAJR.MN.BG
#define PLUG_VER 0x00010000

// http://service.steinberg.de/databases/plugin.nsf/plugIn?openForm
// 4 chars, single quotes. must include one capital letter
#define PLUG_UNIQUE_ID 'Ipco'
// make sure this is not the same as BUNDLE_MFR
#define PLUG_MFR_ID 'Acme'

#define PLUG_CHANNEL_IO "1-1 2-2"

#define PLUG_LATENCY 0
#define PLUG_IS_INST 0
#define PLUG_DOES_MIDI 0
#define PLUG_DOES_STATE_CHUNKS 0

// Unique IDs for each image resource.
#define BG_ID					100
#define ISWITCHCONTROL_2_ID		101
#define ISWITCHCONTROL_3_ID		102
#define IRADIOBUTTONSCONTROL_ID 103
#define ICONTACTCONTROL_ID		104
#define IFADERCONTROL_HORIZ_ID	105
#define IFADERCONTROL_VERT_ID	106
#define IKNOBROTATERCONTROL_ID	107
#define IKNOBMULTICONTROL_ID	108
#define IKRMC_BASE_ID			109
#define IKRMC_MASK_ID			110
#define	IKRMC_TOP_ID			111
#define IBOC_ID					112

// Image resource locations for this plug.
#define BG_FN					"img/BG_1024x640.png"
#define ISWITCHCONTROL_2_FN		"img/ISwitchControl_x2.png"
#define ISWITCHCONTROL_3_FN		"img/ISwitchControl_x3.png"
#define IRADIOBUTTONSCONTROL_FN "img/IRadioButtonsControl_x2.png"
#define ICONTACTCONTROL_FN		"img/IContactControl_x2.png"
#define IFADERCONTROL_HORIZ_FN	"img/IFaderControl_Horiz.png"
#define IFADERCONTROL_VERT_FN	"img/IFaderControl_Vert.png"
#define IKNOBROTATERCONTROL_FN	"img/IKnobRotaterControl.png"
#define IKNOBMULTICONTROL_FN	"img/IKnobMultiControl_x14.png"
#define IKRMC_BASE_FN			"img/IKRMC_Base.png"
#define IKRMC_MASK_FN			"img/IKRMC_Mask.png"
#define IKRMC_TOP_FN			"img/IKRMC_Top.png"
#define IBOC_FN					"img/IBitmapOverlayControl.png"

//Make sure there is allways a newline character at the end of this file (msvc bug)

