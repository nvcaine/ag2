package entities.ships;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.tweens.TweenEvent;
import com.haxepunk.tweens.motion.LinearPath;

class Enemy extends Ship
{
	private var fireDelay:Float = 1;
	private var sequenceEnded:Bool = false;
	private var sequencePath:LinearPath;
	private var sequenceStarted:Bool = false;

	override public function added()
	{
		super.added();

		startSequence();

		type = "enemy";
	}

	override public function update()
	{
		super.update();

		if(fireDelay > 0)
			fireDelay -= HXP.elapsed;

		if(fireDelay <= 0)
			fireWithDelay(1);

		move();
	}

	public function startSequence()
	{
		if(data.sequence == null || data.sequence.waypoints == null || data.sequence.duration == null)
			return;

		initSequence(data.sequence.waypoints, data.sequence.duration);

		sequenceStarted = true;
		sequenceEnded = false;
	}

	public function fireWithDelay(delay:Int)
	{
		fire();

		fireDelay = delay;
	}

	private function move()
	{
		checkPlayerCollision();

		if(!sequenceEnded && sequenceStarted)
		{
			updateSequencePosition();
			return;
		}

		if(data.sequence.cycle == true && !sequenceStarted)
		{
			startSequence();
			return;
		}
		
		moveBy(0, data.speed);
	}

	private function updateSequencePosition()
	{
		this.x = sequencePath.x;
		this.y = sequencePath.y;
	}

	private function initSequence(waypoints:Array<Dynamic>, duration:Float)
	{
		sequencePath = initSequencePath(waypoints, duration, onSequenceEnded);
		sequencePath.start();

		this.addTween(sequencePath);
	}

	private function initSequencePath(waypoints:Array<Dynamic>, duration:Float, callBack:TweenEvent->Void):LinearPath
	{
		var result:LinearPath = new LinearPath();

		for(waypoint in waypoints)
			result.addPoint(this.x + waypoint.x, this.y + waypoint.y);

		result.setMotion(duration);
		result.addEventListener(TweenEvent.FINISH, callBack, false, 0, true);

		return result;
	}

	private function onSequenceEnded(e:TweenEvent)
	{
		sequencePath.removeEventListener(TweenEvent.FINISH, onSequenceEnded);

		sequenceEnded = true;
		sequenceStarted = false;
	}

	private function checkPlayerCollision()
	{
		var player:Entity = collide("player", this.x, this.y);

		if(player == null)
			return;

		scene.remove(this);
	}
}