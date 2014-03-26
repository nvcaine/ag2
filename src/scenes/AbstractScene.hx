package scenes;

import com.haxepunk.Scene;

import lib.events.EventManager;

class AbstractScene extends Scene 
{
	private var eventManager:EventManager;

	override public function begin()
	{
		eventManager = EventManager.cloneInstance();
	}

	override public function end()
	{
		removeAll();
	}

	private function addListeners(eventHandlerPairs:Array<Dynamic>)
	{
		for(pair in eventHandlerPairs)
			eventManager.addEventListener(pair.event, pair.handler, false, 0, true);
	}

	private function clearListeners(eventHandlerPairs:Array<Dynamic>)
	{
		for(pair in eventHandlerPairs)
			eventManager.removeEventListener(pair.event, pair.handler);
	}
}