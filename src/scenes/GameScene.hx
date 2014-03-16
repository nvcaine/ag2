package scenes;

import entities.PlayerController;
import entities.level.Level;

import lib.ui.Button;

import model.consts.SceneConsts;
import model.events.SceneEvent;

import nme.events.MouseEvent;

class GameScene extends AbstractScene
{
	private var backB:Button;
	private var player:PlayerController;

	override public function begin()
	{
		super.begin();

		backB = new Button(10, 10, {defaultImage: "menu/back.png", overImage: "menu/back_over.png", downImage: "menu/back.png"});

		backB.addListener(MouseEvent.CLICK, onBackClicked);

		add(backB);

		init();
	}

	override public function update()
	{
		super.update();
		player.checkInput();
	}

	override public function end()
	{
		backB.clearListener(MouseEvent.CLICK, onBackClicked);
	}

	private function onBackClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.CHANGE_SCENE, {scene: SceneConsts.MENU}));
	}

	private function init()
	{
		//data = LevelProxy.cloneInstance().waves[levelIndex].concat([]);

		add(new Level([]));

		player = new PlayerController(this);
		//add(new HUDEntityWrapper(0, 668));

		//player = new Player(HXP.width / 2, HXP.height - 150, this);

		/*endTimer = 0.15;
		killedBoss = playerDead = false;
		endCount = 0;*/
	}
}