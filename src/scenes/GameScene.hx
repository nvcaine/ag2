package scenes;

import entities.level.Level;
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

		init();
	}

	override public function end()
	{
		backB.clearListener(MouseEvent.CLICK, onBackClicked);
	}

	private function onBackClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.MAIN_MENU));
	}

	private function init()
	{
		//data = LevelProxy.cloneInstance().waves[levelIndex].concat([]);

		add(new Level([]));
		//add(new HUDEntityWrapper(0, 668));

		//player = new Player(HXP.width / 2, HXP.height - 150, this);

		/*endTimer = 0.15;
		killedBoss = playerDead = false;
		endCount = 0;*/
	}
}