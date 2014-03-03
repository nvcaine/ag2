package model.consts;

import com.haxepunk.utils.Key;

class PlayerConsts
{
	static public inline var MAX_VELOCITY:Float = 8;
	static public inline var SPEED:Float = 3;
	static public inline var DEFAULT_SPEED: Float = 2;
	static public inline var DRAG:Float = 0.4;

	static public inline var UP_INPUT:String = "up";
	static public inline var DOWN_INPUT:String = "down";
	static public inline var LEFT_INPUT:String = "left";
	static public inline var RIGHT_INPUT:String = "right";
	static public inline var FIRE_INPUT:String = "fire";

	static public inline var INPUT:Array<Dynamic> = [
		{name: UP_INPUT, keys: [Key.UP, Key.W]},
		{name: DOWN_INPUT, keys: [Key.DOWN, Key.S]},
		{name: LEFT_INPUT, keys: [Key.LEFT, Key.A]},
		{name: RIGHT_INPUT, keys: [Key.RIGHT, Key.D]},
		{name: FIRE_INPUT, keys: [Key.X]}
	];
}