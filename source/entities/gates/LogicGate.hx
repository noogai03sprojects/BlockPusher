package entities.gates;

/**
 * @author Noogai03
 */
interface LogicGate 
{
	public var inputs:Array<Int>;
	public var inputStates:Array<Bool>;
	public var output:Int;
	
	public function activateInput(input:Int) : Void;
	public function deactivateInput(input:Int) : Void;
	
	public function checkOutput() : Bool;
}