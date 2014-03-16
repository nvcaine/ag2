package model.events;

import flash.events.Event;

class SceneEvent extends Event
{
	public static inline var CHANGE_SCENE:String = "changeScene";

	public var data:Dynamic;

	public function new(type:String, ?data:Dynamic)
	{
		super(type);

		this.data = {};

		if(data != null)
			this.data = data;
	}
}