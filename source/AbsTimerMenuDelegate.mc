// menu2Delegate.mc
// This code is from Class: Toybox::WatchUi::Menu2InputDelegate API reference
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;

class AbsTimerMenuDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
        
    }

    function onSelect(item) {
        onBack();
    }
    
    function onMenuItem(item) {
    	//System.println(item.getId());
    	if (item == :item_1) {
            //Select FABS
            Application.getApp().setProperty("abs", 0);
    	        } else if (item == :item_2) {
            //Select TABS
            Application.getApp().setProperty("abs", 1);
        } else if (item == :item_3) {
            //Select PLABS
            Application.getApp().setProperty("abs", 2);
        } else if (item == :item_4) {
            //Select STRETCHING
            Application.getApp().setProperty("abs", 3);
        } else if (item == :item_5) {
            //Select MYRTLES
            Application.getApp().setProperty("abs", 4);
        } else if (item == :item_6) {
            //Select MYRTLES
            Application.getApp().setProperty("abs", 5);
        } else if (item == :item_7) {
            //Select MYRTLES
            Application.getApp().setProperty("abs", 6);
        }
    }
    
}