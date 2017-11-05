package bp;

import java.security.InvalidParameterException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import db.Database;
import db.Parameter;

/**
 * This implements permanent storage.
 */
public class Toy implements IToy, IPermanentStorage {
	/**
	 * This variable holds toy ID.
	 */
	private int toyID;
	/**
	 * This variable holds toy inspector name.
	 */
	private String inspector;
	/**
	 * This variable holds Date and Time.
	 */
	private Date inspectionDateTime;
	/**
	 * This creates a copy of circuit for circuit 1.
	 */
	private Circuit circuit1 = new Circuit(1);
	/**
	 * This creates a copy of circuit for circuit 2.
	 */
	private Circuit circuit2 = new Circuit(2);

	/**
	 * Method to call for Toy ID.
	 */
	@Override
	public int getToyID() {
		return toyID;
	}

	/**
	 * Method to call for Inspector.
	 */
	@Override
	public String getInspector() {
		return inspector;
	}

	/**
	 * Method to call for Inspection Date and Time.
	 */
	@Override
	public Date getInspectionDateTime() {
		return inspectionDateTime;
	}

	/**
	 * Method to call for Circuit 1.
	 */
	@Override
	public Circuit getCircuit1() {
		return circuit1;
	}

	/**
	 * Method to call for Circuit 2.
	 */
	@Override
	public Circuit getCircuit2() {
		return circuit2;
	}

	/**
	 * Method to set variable Toy ID.
	 */
	@Override
	public void setToyID(final int pToyID) {
		toyID = pToyID;
		circuit1.setToyID(pToyID);
		circuit2.setToyID(pToyID);
	}

	/**
	 * Method to set variable Inspector.
	 */
	@Override
	public void setInspector(final String pInspector) {
		inspector = pInspector;
	}

	/**
	 * Method to set variable Date and Time.
	 */
	@Override
	public void setInspectionDateTime(final Date pInspectionDateTime) {
		inspectionDateTime = pInspectionDateTime;
	}

	/**
	 * Method to set variable for Circuit 1.
	 */
	@Override
	public void setCircuit1(final Circuit pCircuit1) {
		circuit1 = pCircuit1;
	}

	/**
	 * Method to set variable for Circuit 2.
	 */
	@Override
	public void setCircuit2(final Circuit pCircuit2) {
		circuit2 = pCircuit2;
	}

	/**
	 * Method to save toy to database.
	 */
	@Override
	public void save() {
		Database db = new Database(Settings.getServer());
		List<Parameter> params = new ArrayList<>();

		params.add(new Parameter<Integer>(toyID));
		params.add(new Parameter<String>(inspector));
		params.add(new Parameter<Date>(inspectionDateTime));

		db.executeSql("usp_SaveToy", params);
		circuit1.save();
		circuit2.save();

	}

	/**
	 * Method to clear toy.
	 */
	@Override
	public void clear() {
		toyID = 0;
		inspector = "";
		inspectionDateTime = null;
		circuit1.clear();
		circuit2.clear();

	}

	/**
	 * Method to delete toy from database.
	 */
	@Override
	public void delete() {
		Database db = new Database(Settings.getServer());
		List<Parameter> params = new ArrayList<>();
		params.add(new Parameter<Integer>(toyID));
		db.executeSql("usp_DeleteToy", params);

	}

	/**
	 * Method to load toy from database.
	 */
	@Override
	public void load(final int... id) {
		Database db = new Database(Settings.getServer());
		List<Parameter> params = new ArrayList<>();

		params.add(new Parameter<Integer>(id[0]));

		ResultSet toys = db.getResultSet("usp_GetToy", params);

		try {
			if (toys.next()) {
				toyID = toys.getInt("ToyID");
				inspectionDateTime = toys.getTimestamp("InspectionDateTime");
				inspector = toys.getString("Inspector");
				circuit1.load(toyID, 1);
				circuit2.load(toyID, 2);
			} else {
				throw new InvalidParameterException("ToyID not found.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
