package scenes;

import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

import lib.ui.Button;

import model.consts.SceneConsts;
import model.events.SceneEvent;

import nme.events.MouseEvent;

class CreditsScene extends AbstractScene
{
	private var backB:Button;

	override public function begin()
	{
		super.begin();

		initBackground();

		backB = new Button(10, 10, {defaultImage: "menu/back.png", overImage: "menu/back_over.png", downImage: "menu/back.png"});

		backB.addListener(MouseEvent.CLICK, onBackClicked);

		add(backB);

		addGraphic(init(), 1, 100, 300);
	}

	private function onBackClicked(e:MouseEvent)
	{
		eventManager.dispatchEvent(new SceneEvent(SceneEvent.CHANGE_SCENE, {scene:SceneConsts.MENU}));
	}

	private function init()
	{
		var g:Graphiclist = new Graphiclist();

		var image1:Image = new Image("gfx/credits/helas.png");
		var image2:Image = new Image("gfx/credits/helas.png");

		image1.x = 300;
		image1.y = 0;

		image2.x = 0;
		image2.y = 160;

		g.add(new Text("Artwork", 193, 0));
		g.add(new Text("Bogdan Alexandru Ilie", 77, 20));
		g.add(image1);

		g.add(new Text("Programming", 140, 160));
		g.add(new Text("Romuald Marius Halasz", 140, 180));
		g.add(image2);

		return g;
	}

	private function initBackground()
	{
		var i:Image = new Image("gfx/bg.png");

		i.scaleX = i.scaleY = 3;

		addGraphic(i);
	}
}