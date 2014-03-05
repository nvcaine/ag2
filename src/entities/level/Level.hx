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
		var sequenceData:Dynamic = {
			    cycle: false,
			 duration: 3,
			waypoints: [{x: 0, y: 0}, {x: 100, y: 100}, {x: -100, y: 100}, {x: 0, y: 0}],
		};

		var enemyData:Dynamic = {
			   asset: "gfx/ships/nava2.png",
			 flipped: true,
			sequence: sequenceData,
			   speed: 1
		};

		scene.add(new Enemy(100, 100, enemyData));
	}
}