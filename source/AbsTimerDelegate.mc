using Toybox.WatchUi as Ui;
using Toybox.System as sys;
using Toybox.Application as App;

class AbsTimerDelegate extends Ui.BehaviorDelegate {
	var menu;
	var pausedMenu;
	var settingsValid = true;
	hidden var manager;
    function initialize(valid, mgr) {
    	self.manager = mgr;
    	settingsValid = valid;
        BehaviorDelegate.initialize();
        updateMenu();
    }

    function onMenu() {
    	//updateMenu();
        Ui.pushView( menu, new AbsTimerMenuDelegate(), Ui.SLIDE_IMMEDIATE );
		//sys.println ("Menu pressed");
		return true;
    }
    
    function updateMenu() {
    	menu = new Rez.Menus.MainMenu();
    	//Would update here if watch supported Menu2
	}
    
    function getLabels() {
    	var numThings = 7;
    	var toReturn = new [numThings];
        for (var i = 0; i < numThings; i++) {
        	toReturn[i] = Application.getApp().getProperty("label_" + (i + 1));
        }
		//System.println(toReturn);
		return toReturn;
    }
    
    function onKey(keyEvent) {
        //System.println(keyEvent.getKey());  // e.g. KEY_MENU = 7
        //System.println(keyEvent.getType()); // e.g. PRESS_TYPE_DOWN = 0
        if (Ui.KEY_ENTER == keyEvent.getKey()) {
			manager.startOrStopTimer();
		} else if (Ui.KEY_ESC == keyEvent.getKey()) {
			// Exit application
			Ui.popView(Ui.SLIDE_IMMEDIATE);
		} else if (Ui.KEY_UP == keyEvent.getKey() || Ui.KEY_MENU == keyEvent.getKey()) {
			onMenu();
		} else if (Ui.KEY_DOWN == keyEvent.getKey()) {
			manager.skip();
		}

		return true;
    }

}