package dogo.util;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ImportExcelData {
	private HSSFWorkbook wb = null;

	private HSSFSheet sheet = null;

	private HSSFRow row = null;

	private FileInputStream in = null;

	private int sheetNum = 0;

	public void beginImport(File file) throws Exception {
		in = new FileInputStream(file);
		wb = new HSSFWorkbook(new POIFSFileSystem(in));
		in.close();
	}

	public int getSheetCount() throws NullPointerException {
		if (wb == null) {
			throw new NullPointerException();
		}
		int sheetCount = -1;
		sheetCount = wb.getNumberOfSheets();
		return sheetCount;
	}

	public int getRowCount() throws NullPointerException {
		if (wb == null) {
			throw new NullPointerException();
		}
		HSSFSheet sheet = wb.getSheetAt(this.sheetNum);
		int rowCount = -1;
		rowCount = sheet.getLastRowNum();
		return rowCount;
	}

	public String readStringExcelCell(int sheetNum, int rowNum, int cellNum)
			throws NullPointerException {
		if (wb == null) {
			throw new NullPointerException();
		}
		if (sheetNum < 0 || rowNum < 0) {
			return "";
		}
		String strExcelCell = "";
		sheet = wb.getSheetAt(sheetNum);
		row = sheet.getRow(rowNum);
		if (row.getCell((short) cellNum) != null) {
			switch (row.getCell((short) cellNum).getCellType()) {
			case HSSFCell.CELL_TYPE_FORMULA:
				strExcelCell = "FORMULA ";
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				strExcelCell = String.valueOf(row.getCell((short) cellNum)
						.getNumericCellValue());
				break;
			case HSSFCell.CELL_TYPE_STRING:
				strExcelCell = row.getCell((short) cellNum)
						.getStringCellValue();
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				strExcelCell = "";
				break;
			default:
				strExcelCell = "";
				break;
			}
		}
		return strExcelCell;
	}

	public String[][] readExcel(int sheetNum) throws NullPointerException {
		if (wb == null) {
			throw new NullPointerException();
		}
		if (sheetNum < 0) {
			return null;
		}
		sheet = wb.getSheetAt(sheetNum);
		int rowCount = sheet.getLastRowNum();
		String[][] str = new String[rowCount - 1][24];
		for (int i = 0; i <= rowCount - 1; i++) {
			str[i][0] = Params.trim(readStringExcelCell(sheetNum, i + 1, 0));
			str[i][1] = Params.trim(readStringExcelCell(sheetNum, i + 1, 1));
			str[i][2] = Params.trim(readStringExcelCell(sheetNum, i + 1, 2));
			str[i][3] = Params.trim(readStringExcelCell(sheetNum, i + 1, 3));
			str[i][4] = Params.trim(readStringExcelCell(sheetNum, i + 1, 4));
			str[i][5] = Params.trim(readStringExcelCell(sheetNum, i + 1, 5));
			str[i][6] = Params.trim(readStringExcelCell(sheetNum, i + 1, 6));
			str[i][7] = Params.trim(readStringExcelCell(sheetNum, i + 1, 7));
			str[i][8] = Params.trim(readStringExcelCell(sheetNum, i + 1, 8));
			str[i][9] = Params.trim(readStringExcelCell(sheetNum, i + 1, 9));
			str[i][10] = Params.trim(readStringExcelCell(sheetNum, i + 1, 10));
			str[i][11] = Params.trim(readStringExcelCell(sheetNum, i + 1, 11));
			str[i][12] = Params.trim(readStringExcelCell(sheetNum, i + 1, 12));
			str[i][13] = Params.trim(readStringExcelCell(sheetNum, i + 1, 13));
			str[i][14] = Params.trim(readStringExcelCell(sheetNum, i + 1, 14));
			str[i][15] = Params.trim(readStringExcelCell(sheetNum, i + 1, 15));
			str[i][16] = Params.trim(readStringExcelCell(sheetNum, i + 1, 16));
			str[i][17] = Params.trim(readStringExcelCell(sheetNum, i + 1, 17));
			str[i][18] = Params.trim(readStringExcelCell(sheetNum, i + 1, 18));
			str[i][19] = Params.trim(readStringExcelCell(sheetNum, i + 1, 19));
			str[i][20] = Params.trim(readStringExcelCell(sheetNum, i + 1, 20));
			str[i][21] = Params.trim(readStringExcelCell(sheetNum, i + 1, 21));
			str[i][22] = Params.trim(readStringExcelCell(sheetNum, i + 1, 22));
			str[i][23] = Params.trim(readStringExcelCell(sheetNum, i + 1, 23));
		}
		return str;
	}

	public String[][] readExcelAddList(int sheetNum)
			throws NullPointerException {
		if (wb == null) {
			throw new NullPointerException();
		}
		if (sheetNum < 0) {
			return null;
		}
		String[][] datas = null;
		sheet = wb.getSheetAt(sheetNum);
		int rowCount = sheet.getLastRowNum();
		
		HSSFRow row = sheet.getRow(0);
		int cellCount = row.getLastCellNum();
		datas = new String[rowCount][cellCount];
		for (int i = 1; i <= rowCount; i++) {
			HSSFRow oneRow = sheet.getRow(i);
			for (int j = 0; j < cellCount; j++) {
				HSSFCell cell = oneRow.getCell((short) j);
				String value = "";
				if (cell != null) {
					switch (cell.getCellType()) {
					case HSSFCell.CELL_TYPE_FORMULA:
						//value = "FORMULA ";
						 value =String.valueOf((double)cell.getNumericCellValue());
						break;
					case HSSFCell.CELL_TYPE_NUMERIC:
			                if (HSSFDateUtil.isCellDateFormatted(cell)) { 
			                          SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
			                          Date dt = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());  
			                          value = dateformat.format(dt); 
			                  }else {
			                	  
			                	  Double d =cell.getNumericCellValue(); 
			                        if(d == d.longValue()){ 
			                               value ="" + d.longValue(); 
			                        }else {
			                        	value =String.valueOf(cell.getNumericCellValue());
			                        } 
			                	  //value = String.valueOf(cell.getNumericCellValue());
			                	 // value =String.valueOf(cell.getNumericCellValue());
			                  }
						break;
					case HSSFCell.CELL_TYPE_STRING:
						value = cell.getStringCellValue();
						break;
					case HSSFCell.CELL_TYPE_BLANK:
						value = "";
						break;
					default:
						value = "";
						break;
					}
				}
				datas[i - 1][j] = value;
			}
		}
		return datas;
	}

}
