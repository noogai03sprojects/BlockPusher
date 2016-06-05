package;
import entities.gates.LogicGate;
import flixel.FlxG;

/**
 * ...
 * @author Noogai03
 */
class ChannelManager
{
	var operables:List<Operable>;
	var generators:List<Operable>;
	var gates:List<LogicGate>;
	
	public function new() 
	{
		operables = new List<Operable>();
		generators = new List<Operable>();
		gates = new List<LogicGate>();
	}
	
	public function registerOperable(o:Operable) : Void {
		operables.add(o);
		o.initManager(this);
	}
	
	public function registerGenerator(g:Operable) : Void {
		generators.add(g);
		g.initManager(this);
	}
	
	public function addGate(g:LogicGate) :Void {
		gates.push(g);
	}
	
	public function activateChannel(channel:Int):Void {
		//FlxG.log.add("activating channel " + Std.string(channel));
		for (operable in operables) {
			if (operable.channel == channel) {
				operable.activate();
			}
		}
		for (gate in gates) {
			for (i in 0...gate.inputs.length) {
				if (gate.inputs[i] == channel) {
					gate.activateInput(i);
				}
			}
		}
	}
	
	public function deactivateChannel(channel:Int):Void {
		//FlxG.log.add("deactivating channel " + Std.string(channel));
		for (operable in operables) {
			if (operable.channel == channel) {
				operable.deactivate();
			}
		}
		for (gate in gates) {
			for (i in 0...gate.inputs.length) {
				if (gate.inputs[i] == channel) {
					gate.deactivateInput(i);
				}
			}
		}
	}
	
	public function checkGates() {
		for (gate in gates) {
			if (gate.checkOutput()) {
				activateChannel(gate.output);
			}
			else {
				deactivateChannel(gate.output);
			}
		}
	}
	
}