package entities.gates;
import flixel.FlxG;

/**
 * ...
 * @author Noogai03
 */
class NOTGate implements LogicGate {
	public var inputs:Array<Int>;
	public var inputStates:Array<Bool>;
	public var output:Int;
	
	public function new (inputs:Array<Int>, output:Int) {
		this.inputs = inputs;
		this.output = output;
		inputStates = new Array<Bool>();
		for (i in 0...inputs.length) {
			inputStates.push(false);
		}			
	}
	
	public function activateInput(input:Int) : Void {
		FlxG.log.add("activated");
		inputStates[input] = true;
	}
	
	public function deactivateInput(input:Int) : Void {
		inputStates[input] = false;
	}
	
	public function checkOutput() : Bool {
		if (inputStates[0])
			return false;
		else
			return true;
	}
}