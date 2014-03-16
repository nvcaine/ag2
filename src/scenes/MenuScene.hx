package scenes;

import com.haxepunk.graphics.Image;

import entities.HoverEffect;
import lib.ui.Button;

import model.consts.MenuConsts;
import model.consts.SceneConsts;
import model.events.SceneEvent;

import nme.events.MouseEvent;

class MenuScene extends AbstractScene
{
	private var highlight:HoverEffect;

	private var MENU_OPTIONS:Array<Dynamic>;

	override public function begin()
	{
		MENU_OPTIONS = [{

				skin: MenuConsts.MENU_BUTTON_SKINS[0],
				info: [
					{event: MouseEvent.CLICK, handler: onNewGameClicked},
					{event: MouseEvent.MOUSE_OVER, handler: onNewGameOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut}
				]

			}, {

				skin: MenuConsts.MENU_BUTTON_SKINS[1],
				info: [
					{event: MouseEvent.MOUSE_OVER, handler: onOptionsOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut}
				]

			}, {

				skin: MenuConsts.MENU_BUTTON_SKINS[2],
				info: [
					{event: MouseEvent.MOUSE_OVER, handler: onCreditsOver},
					{event: MouseEvent.MOUSE_OUT, handler: onButtonOut},
					{event: MouseEvent.CLICK, handler: onCreditsClicked}
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

		instanceInfo.instance = initButton(instanceInfo.skin, handlerInfo);

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

	private function initButton(skin:Dynamic, handlerInfo:Array<Dynamic>):Button
	{
		var result:Button = new Button(skin.x, skin.y, skin);

		for(eventHandlerPair in handlerInfo)
			result.addListener(eventHandlerPair.event, eventHandlerPair.handler);

		return result;
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
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.CHANGE_SCENE, {scene: SceneConsts.GAME}));
	}

	public function onCreditsClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.CHANGE_SCENE, {scene: SceneConsts.CREDITS}));
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