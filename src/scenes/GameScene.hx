package scenes;

import lib.ui.Button;

import model.events.SceneEvent;

import nme.events.MouseEvent;

class GameScene extends AbstractScene
{
	private var backB:Button;

	override public function begin()
	{
		super.begin();

		backB = new Button(10, 10, {defaultImage: "menu/back.png", overImage: "menu/back_over.png", downImage: "menu/back.png"});

		backB.addListener(MouseEvent.CLICK, onBackClicked);

		add(backB);
	}

	override public function end()
	{
		backB.clearListener(MouseEvent.CLICK, onBackClicked);
	}

	private function onBackClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.MAIN_MENU));
	}
}