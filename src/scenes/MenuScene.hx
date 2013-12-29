package scenes;

import com.haxepunk.graphics.Image;

import entities.HoverEffect;
import lib.ui.Button;

import model.events.SceneEvent;

import nme.events.MouseEvent;

class MenuScene extends AbstractScene
{
	private var newGameB:Button;
	private var optionsB:Button;
	private var creditsB:Button;

	private var highlight:HoverEffect;

	override public function begin()
	{
		super.begin();

		initBackground();

		highlight = new HoverEffect(0, 300);
		highlight.visible = false;

		add(highlight);

		newGameB = new Button(141, 300, {defaultImage: "menu/button_ply_unselect.png", overImage: "menu/button_ply_select.png", downImage: "menu/button_ply_unselect.png", scaleX: 3, scaleY:3});
		newGameB.addListener(MouseEvent.CLICK, onNewGameClicked);
		newGameB.addListener(MouseEvent.MOUSE_OVER, onNewGameOver);
		newGameB.addListener(MouseEvent.MOUSE_OUT, onButtonOut);
		add(newGameB);

		optionsB = new Button(141, 450, {defaultImage: "menu/button_opt_unselect.png", overImage: "menu/button_opt_select.png", downImage: "menu/button_opt_unselect.png", scaleX: 3, scaleY:3});
		optionsB.addListener(MouseEvent.MOUSE_OVER, onOptionsOver);
		optionsB.addListener(MouseEvent.MOUSE_OUT, onButtonOut);
		add(optionsB);

		creditsB = new Button(141, 600, {defaultImage: "menu/button_crd_unselect.png", overImage: "menu/button_crd_select.png", downImage: "menu/button_crd_unselect.png", scaleX: 3, scaleY:3});
		creditsB.addListener(MouseEvent.MOUSE_OVER, onCreditsOver);
		creditsB.addListener(MouseEvent.MOUSE_OUT, onButtonOut);
		add(creditsB);

	}

	override public function end()
	{
		newGameB.clearListener(MouseEvent.CLICK, onNewGameClicked);
		newGameB.clearListener(MouseEvent.MOUSE_OVER, onNewGameOver);
		optionsB.clearListener(MouseEvent.MOUSE_OVER, onOptionsOver);
		optionsB.clearListener(MouseEvent.MOUSE_OUT, onButtonOut);
		creditsB.clearListener(MouseEvent.MOUSE_OVER, onCreditsOver);
		creditsB.clearListener(MouseEvent.MOUSE_OUT, onButtonOut);
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