package model.events;

import flash.events.Event;

class SceneEvent extends Event
{
	public static inline var NEW_GAME:String = "newGame";
	public static inline var MAIN_MENU:String = "showMenu";

	public function new(type:String)
	{
		super(type);
	}
}