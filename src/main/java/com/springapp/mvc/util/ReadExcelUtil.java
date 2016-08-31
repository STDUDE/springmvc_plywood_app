package com.springapp.mvc.util;

import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

public class ReadExcelUtil {

    private static Workbook getWorkbook(FileInputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        }
        return workbook;
    }

    public static Hmc readMachine(File file) throws IOException{
        FileInputStream fis = new FileInputStream(file);
        Workbook workbook = getWorkbook(fis,file.getPath());
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        DataFormatter df = new DataFormatter();

        Hmc machine = new Hmc();
        machine.setProductId(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        Row tmp = rowIterator.next();
        machine.setMachineTypeEn(df.formatCellValue(tmp.getCell(1)).trim());
        machine.setMachineTypeRu(df.formatCellValue(tmp.getCell(2)).trim());
        machine.setModel(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setBrand(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        tmp = rowIterator.next();
        machine.setProducingCountryEn(df.formatCellValue(tmp.getCell(1)));
        machine.setProducingCountryRu(df.formatCellValue(tmp.getCell(2)));
        machine.setSystemCNC(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        machine.setFullSystemCNC(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        machine.setProductionYear((int) rowIterator.next().getCell(1).getNumericCellValue());
        tmp = rowIterator.next();
        machine.setMachineConditionEn(df.formatCellValue(tmp.getCell(1)));
        machine.setMachineConditionRu(df.formatCellValue(tmp.getCell(2)));
        tmp = rowIterator.next();
        machine.setMachineLocationEn(df.formatCellValue(tmp.getCell(1)).trim());
        machine.setMachineLocationRu(df.formatCellValue(tmp.getCell(2)).trim());
        machine.setAxisCount(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setxMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setyMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setzMotion((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setxTableSize((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setyTableSize((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setTableLoad(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleTaper(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleRotationFreq(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindlePower(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setToolCount(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolDiameter(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolWeight(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMaxToolLength(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setToolReplacementTime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setChipReplacementTime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPositionRepositionPrecision(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setSpindleRuntime(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setMachineLaunching(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPrice((int)rowIterator.next().getCell(1).getNumericCellValue());
        machine.setPhoto1(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto2(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto3(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto4(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setPhoto5(df.formatCellValue(rowIterator.next().getCell(1)));
        tmp = rowIterator.next();
        machine.setDescriptionEn(df.formatCellValue(tmp.getCell(1)));
        machine.setDescriptionRu(df.formatCellValue(tmp.getCell(2)));
        machine.setVideo1(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setVideo2(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setVideo3(df.formatCellValue(rowIterator.next().getCell(1)));
        machine.setIsSold(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        if(machine.getIsSold().equals("")) {
            machine.setIsSold("No");
        }
        fis.close();
        return machine;
    }

    public static Map<String,Object> readPlywood(File file) throws IOException {
        Map<String,Object> map = new HashMap<String, Object>(2);

        FileInputStream fis = new FileInputStream(file);
        Workbook workbook = getWorkbook(fis,file.getPath());
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        DataFormatter df = new DataFormatter();
        int countPlywood = 0;

        PlywoodEntity plywood = new PlywoodEntity();
        List<PriceListEntity> priceList = new ArrayList<PriceListEntity>();

        plywood.setProductId(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        plywood.setBrand(df.formatCellValue(rowIterator.next().getCell(1)).trim());
        plywood.setType(df.formatCellValue(rowIterator.next().getCell(1)).trim());

        Row tmp = rowIterator.next();
        Iterator<Cell> cellIterator = tmp.cellIterator();
        Cell c = cellIterator.next();
        while (true){
            c = cellIterator.next();
            if(c == null || c.getCellType() == Cell.CELL_TYPE_BLANK) {
                break;
            }
            else {
                priceList.add(countPlywood, new PriceListEntity());
                priceList.get(countPlywood).getPriceListPK().setThickness((int)c.getNumericCellValue());
                countPlywood++;
            }
        }
        tmp = rowIterator.next();
        for(int i = 0; i < countPlywood; i++){
            priceList.get(i).getPriceListPK().setLength((int)tmp.getCell(i+1).getNumericCellValue());
        }

        tmp = rowIterator.next();
        for(int i = 0; i < countPlywood; i++){
            priceList.get(i).getPriceListPK().setWidth((int)tmp.getCell(i+1).getNumericCellValue());
        }

        tmp = rowIterator.next();
        for(int i = 0; i < countPlywood; i++){
            priceList.get(i).setWeight((int)tmp.getCell(i+1).getNumericCellValue());
        }

        tmp = rowIterator.next();
        for(int i = 0; i < countPlywood; i++){
            priceList.get(i).setPrice((int)tmp.getCell(i+1).getNumericCellValue());
        }

        plywood.setPhoto1(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setPhoto2(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setPhoto3(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setPhoto4(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setPhoto5(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setApplication(df.formatCellValue(rowIterator.next().getCell(1)));
        plywood.setDescription(df.formatCellValue(rowIterator.next().getCell(1)));

        fis.close();

        for (int i = 0; i < priceList.size(); i++) {
            priceList.get(i).getPriceListPK().setPlywood(plywood);
        }

        map.put("plywood", plywood);
        map.put("priceList", priceList);
        return map;
    }

}
