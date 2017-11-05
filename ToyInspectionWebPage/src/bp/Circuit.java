package bp;

import java.security.InvalidParameterException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.Database;
import db.Parameter;
/**
 * Implements permanent storage.
 */
public class Circuit implements ICircuit, IPermanentStorage {
	/**
	 * Variable to hold toy ID.
	 */
	private int toyID;
	/**
	 * Variable to hold circuit ID.
	 */
	private int circuitID;
	/**
	 * Variable to hold voltage.
	 */
	private double voltage;
	/**
	 * Variable to hold amperage.
	 */
	private double amperage;
	/**
	 * Variable to hold resistance.
	 */
	private double resistance;
	/**
	 * Variable to hold manufacturing location.
	 */
	private String manufactureLocation;
	/**
	 * 
	 * @param pCircuitID sets circuit.
	 */
	public Circuit(final int pCircuitID) {
		circuitID = pCircuitID;
	}
	/**
	 * Method to call for Toy ID.
	 */
	@Override
	public int getToyID() {
		return toyID;
	}
	/**
	 * Method to call for Circuit ID.
	 */
	@Override
	public int getCircuitID() {
		return circuitID;
	}
	/**
	 * Method to call for Voltage.
	 */
	@Override
	public double getVoltage() {
		return voltage;
	}
	/**
	 * Method to call for Amperage.
	 */
	@Override
	public double getAmperage() {
		return amperage;
	}
	/**
	 * Method to call for Resistance.
	 */
	@Override
	public double getResistance() {
		return resistance;
	}
	/**
	 * Method to call for Manufacture Location.
	 */
	@Override
	public String getManufactureLocation() {
		return manufactureLocation;
	}
	/**
	 * Method to set Toy ID.
	 */
	@Override
	public void setToyID(final int pToyID) {
		toyID = pToyID;
		
	}
	/**
	 * Method to set Circuit ID.
	 */
	@Override
	public void setCircuitID(final int pCircuitID) {
		circuitID = pCircuitID;
		
	}
	/**
	 * Method to set Voltage.
	 */
	@Override
	public void setVoltage(final double pVoltage) {
		voltage = pVoltage;		
	}
	/**
	 * Method to set Amperage.
	 */
	@Override
	public void setAmperage(final double pAmperage) {
		amperage = pAmperage;
	}
	/**
	 * Method to set Resistance.
	 */
	@Override
	public void setResistance(final double pResistance) {
		resistance = pResistance;		
	}
	/**
	 * Method to set Manufacturing Location.
	 */
	@Override
	public void setManufactureLocation(final String pManufactureLocation) {
		manufactureLocation = pManufactureLocation;
	}
	/**
	 * Method to calculate voltage.
	 */
	@Override
	public void calculateVoltage() {
		voltage = amperage * resistance;		
	}
	/**
	 * Method to calculate amperage.
	 */
	@Override
	public void calculateAmperage() {
		amperage = voltage / resistance;		
	}
	/**
	 * Method to calculate resistance..
	 */
	@Override
	public void calculateResistance() {
		resistance = voltage / amperage;		
	}
	/**
	 * Method to check for validity.
	 */
	@Override
	public boolean isValid() {
		return voltage == amperage * resistance;
	}
	/**
	 * Method to save circuit to database..
	 */
	@Override
	public void save() {
		Database db = new Database(Settings.getServer());
		List<Parameter> params = new ArrayList<>();
		
		//Set parameter values from properties
		params.add(new Parameter<Integer>(toyID));
		params.add(new Parameter<Integer>(circuitID));
		params.add(new Parameter<String>(manufactureLocation));
		params.add(new Parameter<Double>(voltage));
		params.add(new Parameter<Double>(amperage));
		params.add(new Parameter<Double>(resistance));
		
		//Save
		db.executeSql("usp_SaveCircuit", params);
		
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}
	/**
	 * Method to load circuit from database..
	 */
	@Override
	public void load(final int... id) {
		Database db = new Database(Settings.getServer());
		List<Parameter> params = new ArrayList<>();
		
		params.add(new Parameter<Integer>(id[0]));
		params.add(new Parameter<Integer>(id[1]));
		
		ResultSet circuit = db.getResultSet("usp_GetCircuit", params);
		
		try {
			if (circuit.next()) {
				toyID = circuit.getInt("ToyID");
				circuitID = circuit.getInt("CircuitID");
				voltage = circuit.getDouble("Voltage");
				resistance = circuit.getDouble("Resistance");
				amperage = circuit.getDouble("Amperage");
				manufactureLocation = circuit.getString("ManufactureLocation");
			} else {
				throw new InvalidParameterException("ToyID not found.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
