package scenes;

import com.haxepunk.graphics.Image;

import entities.HoverEffect;
import lib.ui.Button;

import model.consts.MenuConsts;
import model.events.SceneEvent;

import nme.events.MouseEvent;

class MenuScene extends AbstractScene
{
	private var newGameB:Button;
	private var optionsB:Button;
	private var creditsB:Button;

	private var highlight:HoverEffect;

	private var MENU_OPTIONS:Array<Dynamic>;

	override public function begin()
	{
		MENU_OPTIONS = [{
				instance: newGameB,
				x: 141, y: 300,
				skin: {
					defaultImage: "menu/button_ply_unselect.png",
					overImage: "menu/button_ply_select.png",
					downImage: "menu/button_ply_unselect.png",
					scaleX: 3, scaleY: 3
				},
				info: [
					{event: MouseEvent.CLICK, handler: onNewGameClicked},
					{event: MouseEvent.MOUSE_OVER, handler: onNewGameOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut}
				]
			}, {
				instance: optionsB,
				x: 141, y: 450,
				skin: {
					defaultImage: "menu/button_opt_unselect.png",
					overImage: "menu/button_opt_select.png",
					downImage: "menu/button_opt_unselect.png",
					scaleX: 3, scaleY: 3
				},
				info: [
					{event: MouseEvent.MOUSE_OVER, handler: onOptionsOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut}
				]
			}, {
				instace: creditsB,
				x: 141, y: 600,
				skin: {
					defaultImage: "menu/button_crd_unselect.png",
					overImage: "menu/button_crd_select.png",
					downImage: "menu/button_crd_unselect.png",
					scaleX: 3, scaleY: 3
				},
				info: [
					{event: MouseEvent.MOUSE_OVER, handler: onCreditsOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut}
				]
		}];

		super.begin();

		initBackground();

		highlight = new HoverEffect(0, 300);
		highlight.visible = false;

		add(highlight);

		addButtonListeners(MENU_OPTIONS);
	}

	override public function end()
	{
		clearButtonListeners(MENU_OPTIONS);
	}

	private function addButtonListeners(instancesEventHandlers:Array<Dynamic>)
	{
		for(instanceEventInfo in instancesEventHandlers)
			addButtonHandlers(instanceEventInfo);
	}

	private function clearButtonListeners(eventInstances:Array<Dynamic>)
	{
		for(instanceEventInfo in eventInstances)
			parseEventInstance(instanceEventInfo);
	}

	private function addButtonHandlers(instanceInfo:Dynamic)
	{
		var handlerInfo:Array<Dynamic> = instanceInfo.info;

		if(handlerInfo == null)
			return;

		for(eventHandlerPair in handlerInfo)
			initButton(instanceInfo.instance, instanceInfo.x, instanceInfo.y, instanceInfo.skin, eventHandlerPair);

		add(instanceInfo.instance);
	}

	private function parseEventInstance(instanceInfo:Dynamic)
	{
		var handlerInfo:Array<Dynamic> = instanceInfo.info;
	
		if(handlerInfo == null)
			return;
	
		for(eventHandlerPair in handlerInfo)
			clearInstanceEventInfo(instanceInfo.instance, eventHandlerPair);
	}

	private function initButton(instanceEventInfo:Button, x:Float, y:Float, skin:Dynamic, handlerInfo:Dynamic)
	{
		/*var button:Button*/
		instanceEventInfo = new Button(x, y, skin);

		instanceEventInfo.addListener(handlerInfo.event, handlerInfo.handler);
	}

	private function clearInstanceEventInfo(intance:Button, handlerInfo:Dynamic)
	{
		intance.clearListener(handlerInfo.event, handlerInfo.handler);
		remove(intance);
	}

	private function initBackground()
	{
		var i:Image = new Image("gfx/bg.png");

		i.scaleX = i.scaleY = 3;

		addGraphic(i);
	}

	private function updateHightlight(targetY:Float)
	{
		highlight.visible = true;
		highlight.y = targetY;
	}

	private function onNewGameClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.NEW_GAME));
	}

	private function onNewGameOver(e:MouseEvent)
	{
		updateHightlight(300);
	}

	private function onOptionsOver(e:MouseEvent)
	{
		updateHightlight(450);
	}

	private function onCreditsOver(e:MouseEvent)
	{
		updateHightlight(600);
	}

	private function onButtonOut(e:MouseEvent)
	{
		highlight.visible = false;
	}
}