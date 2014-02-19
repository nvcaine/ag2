package entities.level;

import com.haxepunk.Entity;
import com.haxepunk.HXP;

import entities.ships.Enemy;

class Level extends Entity
{
	private var endLevel:Bool = false;

	private var background:ScrollingBackground;

	public function new(wavesData:Array<Dynamic>)
	{
		super(0, 0);
	}

	override public function added()
	{
		init();
		initWaves();
	}

	override public function update()
	{
		if(endLevel)
			return;
	}

	private function init(backgroundSpeed:Float = 1)
	{
		background = new ScrollingBackground(backgroundSpeed);

		scene.add(background);

		endLevel = false;
	}

	private function initWaves()
	{
		scene.add(new Enemy(100, 100, {asset: "gfx/ships/nava2.png", flipped: true}));
	}
}