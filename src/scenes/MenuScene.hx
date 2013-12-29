package scenes;

import lib.ui.Button;

import model.events.SceneEvent;

import nme.events.MouseEvent;

class MenuScene extends AbstractScene
{
	private var newGameB:Button;

	override public function begin()
	{
		super.begin();

		newGameB = new Button(10, 10, {defaultImage: "menu/new_game.png", overImage: "menu/new_game_over.png", downImage: "menu/new_game_down.png"});

		newGameB.addListener(MouseEvent.CLICK, onNewGameClicked);

		add(newGameB);
	}

	override public function end()
	{
		newGameB.clearListener(MouseEvent.CLICK, onNewGameClicked);
	}

	private function onNewGameClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.NEW_GAME));
	}
}