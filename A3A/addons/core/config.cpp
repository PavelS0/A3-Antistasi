#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgSounds.hpp"
class A3A {
    #include "Templates.hpp"
    #include "Params.hpp"

#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
    class CfgFunctions {
        class A3A {
            class debug {
                file = QPATHTOFOLDER(functions\debug);
                class prepFunctions { preInit = 1; };
                class runPostInitFuncs { postInit = 1; };
            };
        };
    };
#else
    #include "CfgFunctions.hpp"
#endif

// Load external member list if present
#if __has_include("\A3AMembers.hpp")
#include "\A3AMembers.hpp"
#endif

#ifndef UseDoomGUI
    #include "defines.hpp"
    #include "dialogs.hpp"
#endif

#include "keybinds.hpp"

class CfgMPGameTypes {
    class ANTI {
        name = "Antistasi";
        shortcut = "ANTI";
        id = 30;
        picture = QPATHTOFOLDER(Pictures\antistasi_logo_small.paa);
        description = "";
    };
};

class RscGroupRootMenu
{
    class Items
    {
        class SplitToHC
        {
            class Params
            {
                expression = "[player] call A3A_fnc_hcSplitGroup";
            };
            title = "<img color='#e5e500' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa'/><t>Отделить выделенных юнитов в новую группу</t>";
            show = "1";
            enable = "1";
            speechId = 0;
            command = -5;
        };
    };
};


class RscHCGroupRootMenu
{
    class Items
    {
        class MergeToGroup
        {
            class Params
            {
                expression = "[hcSelected player] call A3A_fnc_hcMergeGroup";
            };
            title = "<img color='#e5e500' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa'/><t>Вернуть группу в свой отряд</t>";
            show = "";
            enable = "HCNotEmpty";
            speechId = 0;
            command = -5;
        };
    };
};