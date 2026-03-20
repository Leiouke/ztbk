package com.cnpiecsb.np.basic.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.controller.ZtbkServiceController;

/**
 * 客户银行相关服务, 初始化用
 * 
 * @author user
 *
 */
@Service
public class ClientBankInitialService extends ZtbkServiceController {	
	/**
	 * 新增客户银行信息
	 * 
	 * @param postData
	 * @return
	 */
	public boolean addClientBank(Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"custom_id", "f_companyName", "f_registMark", "f_companyAddress", "f_companyPhone", "f_bank",
				"f_account", "f_default", "my_bank", "my_account", "kp_type", "tax_rate", "is_item",
				"kp_content", "kp_amount", "kp_unit"};
		postData.put("spName", "u_basic_bank_new_initial");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return false;
		}
		return true;
    }
	
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();  
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
		
		ClientBankInitialService clientBankInitialService = (ClientBankInitialService) context.getBean("clientBankInitialService");
		
		// 逻辑： 先全量读入, 然后增量读入(增量包括以前没有的或者以前有的这次有了修改的部分)
		// 目前基本每次只能读取20000条记录, 得分批读取了(大概超过20M就没法读了)
		Workbook workbook = WorkbookFactory.create(new File("D:/Users/user/Desktop/1.xlsx"));  
		
		Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
		
		int rowNum = 0;		
		System.out.println(sheet.getLastRowNum());
		for (rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++){  // 行数，索引从第1行开始, 第0行是表头数据
				Row row = sheet.getRow(rowNum);
				
				Map<String, Object> itemMap = new HashMap();			
				Cell cellIsbn = row.getCell(2);  // 户号
				cellIsbn.setCellType(Cell.CELL_TYPE_STRING);
				String custom_id = cellIsbn.getStringCellValue().trim();
				// 户号必须有内容才可以执行下去
				if (custom_id != null && custom_id.length() > 0) {
					for (int i = 0; i <= 18; i++) {
						itemMap.put("custom_id", custom_id);
						Cell cell = row.getCell(i);
						if (cell != null){
							switch(i){
								case 1:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_companyName", cell.getStringCellValue().trim());break;}
								case 4:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_registMark", cell.getStringCellValue().trim());break;
								}		
								case 5:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_companyAddress", cell.getStringCellValue().trim());break;
								}
								case 6:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_companyPhone", cell.getStringCellValue().trim());break;
								}
								case 7:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_bank", cell.getStringCellValue().trim());break;
								}
								case 8:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_account", cell.getStringCellValue().trim());break;}	
								case 12:{
//									itemMap.put("tax_rate", cell.getNumericCellValue());break; }
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("tax_rate", cell.getStringCellValue().trim());break;
								} case 13:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("is_item", cell.getStringCellValue().trim());break;
								} case 14:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("kp_content", cell.getStringCellValue().trim());break;		
								}		
								case 15:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("kp_type", cell.getStringCellValue().trim());break;
								} 
								case 16:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("f_default", cell.getStringCellValue().trim());break;
								} 
								case 17:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("kp_unit", cell.getStringCellValue().trim());break;
								} 
								case 18:{
									cell.setCellType(Cell.CELL_TYPE_STRING);
									itemMap.put("kp_amount", cell.getStringCellValue().trim());break;
								} 
							}						
						}
					}
					
					itemMap.put("my_bank", "工行南京西路支行");
					itemMap.put("my_account", "1001207419206563490");
					clientBankInitialService.addClientBank(itemMap);  
					System.out.println("插入行号为" + (rowNum + 1) + "的记录完成！");
					
//					break;
				}				
		}
	}
}
