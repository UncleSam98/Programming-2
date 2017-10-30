package CircuitModel;
public class Circuit {
	double voltage;
	double amperage;
	double resistance;
	
	public double getVoltage() {
		return voltage;
	}
	public void setVoltage(double voltage) {
		this.voltage = voltage;
	}
	public double getAmperage() {
		return amperage;
	}
	public void setAmperage(double amperage) {
		this.amperage = amperage;
	}
	public double getResistance() {
		return resistance;
	}
	public void setResistance(double resistance) {
		this.resistance = resistance;
	}
	public void calculateVoltage() {
		voltage = amperage * resistance;
	}
	public void calculateAmperage() {
		amperage = voltage / resistance;
	}
	public void calculateResistance() {
		resistance = voltage / amperage;
	}

}
