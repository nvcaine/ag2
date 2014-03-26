import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.Scene;

import lib.events.EventManager;

import model.consts.SceneConsts;
import model.events.SceneEvent;

import nme.events.Event;

import scenes.MenuScene;
import scenes.GameScene;
import scenes.OptionsScene;
import scenes.CreditsScene;


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
			{hash:SceneConsts.GAME, scene: new GameScene()},
			{hash:SceneConsts.OPTIONS, scene: new OptionsScene()},
			{hash:SceneConsts.CREDITS, scene: new CreditsScene()}
		]);

		HXP.scene = appScenes.get(SceneConsts.MENU);

		em = EventManager.cloneInstance();

		em.addEventListener(SceneEvent.CHANGE_SCENE, onChangeScene, false, 0, true);
	}

	public static function main()
	{
		new Main();
	}

	private function initScenes(hashScenePairs:Array<Dynamic>)
	{
		appScenes = new Hash<Scene>();

		for(pair in hashScenePairs)
			appScenes.set(pair.hash, pair.scene);
	}

	private function onChangeScene(e:SceneEvent)
	{
		HXP.scene = appScenes.get(e.data.scene);
	}
}