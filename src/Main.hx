import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.Scene;

import lib.events.EventManager;

import model.consts.SceneConsts;
import model.events.SceneEvent;

import nme.events.Event;

import scenes.MenuScene;
import scenes.GameScene;


class Main extends Engine
{
	private var appScenes:Hash<Scene>;
	private var em:EventManager;

	override public function init()
	{
//#if debug
		//HXP.console.enable();
//#end

		initScenes([
			{hash:SceneConsts.MENU, scene: new MenuScene()},
			{hash:SceneConsts.GAME, scene: new GameScene()}
		]);

		HXP.scene = appScenes.get(SceneConsts.MENU);

		em = EventManager.cloneInstance();

		em.addEventListener(SceneEvent.MAIN_MENU, onShowMenu, false, 0, true);
		em.addEventListener(SceneEvent.NEW_GAME, onNewGame, false, 0, true);
	}

	private function initScenes(hashScenePairs:Array<Dynamic>)
	{
		appScenes = new Hash<Scene>();

		for(pair in hashScenePairs)
			appScenes.set(pair.hash, pair.scene);
	}

	public static function main()
	{
		new Main();
	}

	private function onNewGame(e:SceneEvent)
	{
		HXP.scene = appScenes.get(SceneConsts.GAME);
	}

	private function onShowMenu(e:SceneEvent)
	{
		HXP.scene = appScenes.get(SceneConsts.MENU);
	}
}