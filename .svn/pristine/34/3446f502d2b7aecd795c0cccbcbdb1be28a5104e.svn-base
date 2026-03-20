package com.cnpiecsb.np.print.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.cnpiecsb.common.util.ExcelUtil;
import com.cnpiecsb.common.util.ExcelUtil1;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

/**
 * 打印工具类
 * 
 * @author user
 *
 */
public class PrintUtil {
	// excel存放的路径
	private static String excelPath = "c:/template/excelReport/"; 

	/**
	 * 送到打印机打印
	 * 
	 * @param printerName 打印机名.xls
	 * @param xls         打印的excel模板名称
	 * @param map         传入的数据map
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	public static void toPrint(String xls, Map map,String printerName) throws EncryptedDocumentException, InvalidFormatException, IOException{
		// 复制并处理复制后文件, 将复制文件绝对路径返回
		String outFilePath = copyAndDealwith(xls, map, printerName);
		
		// 以下真正的打印
		ActiveXComponent xl = null;
		Dispatch excel = null;
		try{
			ComThread.InitSTA();
			xl = new ActiveXComponent("Excel.Application");
			
			//new Variant(false)  打印时是否显示文档       false不显示   
			Dispatch.put(xl, "Visible", new Variant(false));
			Dispatch workbooks = xl.getProperty("Workbooks").toDispatch(); 
			 
			//打开文档 
			excel=Dispatch.call(workbooks,"Open",outFilePath).toDispatch(); 
			
			// 第五个参数指定打印机名称, 如果打印机错了的话会选择默认打印机
			Dispatch.callN(excel,"PrintOut",new Object[]{Variant.VT_MISSING, Variant.VT_MISSING, new Integer(1),
	                new Boolean(false),printerName.split("\\.")[0], new Boolean(true),Variant.VT_MISSING, ""});  // 第4个参数为true不直接打印
		} catch(Exception e){
			System.out.println(e);
			// 关闭excel
			Dispatch.call(excel, "Close", new Variant(false));  
		} finally{
			// 删除临时excel, 不删留着也可, 反正会覆盖
//			File tempFile = new File(outFilePath);
//			tempFile.delete();
			xl.invoke("Quit",new Variant[0]);
			ComThread.Release();
		}
	}
	
	/**
	 * 处理 excel内容, 用于后续导出
	 * 
	 * @param xls      模板文件名
	 * @param map      数据map
	 * @param tempXls  临时xls文件名
	 * 
	 * @return byte[] 字节数组
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	public static byte[] toHandle(String xls, Map map, String tempXls) throws EncryptedDocumentException, InvalidFormatException, IOException{
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
		
        // 复制并处理复制后文件, 将复制文件绝对路径返回
        String outFilePath = copyAndDealwith(xls, map, tempXls);
     		
		FileInputStream fis = new FileInputStream(outFilePath);
		Workbook workbook = WorkbookFactory.create(fis);
		workbook.write(out);

        byte[] bytes = out.toByteArray();  
        return bytes;
	}
	
	/**
	 * 复制excel, 然后处理动态部分填入数据
	 * 
	 * @param tempFileName 临时文件名
	 * @param xls  excel模板文件名
	 * @param map  数据map
	 * @return     返回复制完后的excel文件绝对路径
	 * 
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	private static String copyAndDealwith(String xls, Map map, String tempFileName) throws EncryptedDocumentException, InvalidFormatException, IOException{
		// 得到需要处理的的文件
//		String webroot = System.getProperty(WebConstants.LDWEBROOT);
//		String filePath = webroot + excelPath + xls;
		String webroot = "";
		String filePath = webroot + excelPath + xls;
				
        // 产生出来一个workbook, 并且填入动态内容  对原来的模板文件不影响
		Workbook workbook = WorkbookFactory.create(new File(filePath));
		Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
		
		
		if (map != null) {
			// 遍历每行, 判断每行第一列有没有{report_Start}, 如果有的话需要插入明细行, 并且复制内容
			List items = null;  // 明细集合数据
			for (Row row : sheet) {
				Cell cell = row.getCell(0);
				if (cell != null && 
						cell.getCellType() == Cell.CELL_TYPE_STRING) {
					String cellValue = cell.toString();
					if (cellValue.equals("{report_Start}")){
						items = (List) map.get("items");		
						int insertLines = items.size() - 1;
						
						int lastRowNum = sheet.getLastRowNum();
						int startRowNum = row.getRowNum() + 2;
						
						// 在末尾加入需要插入的行数
						for (int i = 1; i <= insertLines; i++) {
							sheet.createRow(lastRowNum + i);
						}
						
						// 明细行后的数据行copy
						if (insertLines > 0) {
							for (int i = lastRowNum; i >= startRowNum; i--) {
								ExcelUtil.copyRow(workbook, sheet.getRow(i), sheet.getRow(i + insertLines), true);
							}
						}
						
						if (insertLines > 0) {
							sheet.shiftRows(startRowNum, startRowNum + insertLines - 1, insertLines);  // 批量插入多行明细数据行
						}
						
						//  以下明细数据行copy
						for (int i = 0; i < insertLines; i++){
							ExcelUtil1.copyRow(workbook, sheet.getRow(startRowNum + i - 1), sheet.getRow(startRowNum + i), true); 
						}
						ExcelUtil1.emptyColumnStyleList();  // 前面循环执行完后, 一定要执行这个 不要忘记
						
						break;  // 注意插入完成后记得退出
					}
				}
			}
	//		sheet.shiftRows(18, sheet.getLastRowNum(), 2);  // 索引18行插入一行,索引从19开始, 也就是插入第19行 
	//		ExcelUtil.copyRow(workbook, sheet.getRow(17), sheet.getRow(18), true);  // 第18行(索引17行)内容复制到第19行
			
			boolean isList = false; // 是否进入明细状态
			int itemIndex = 0;  // 明细序号
			boolean isInUse = false;  // 是否明细正在使用中
			for (Row row : sheet) {
				for (Cell cell : row) {
					if (cell != null && 
							cell.getCellType() == Cell.CELL_TYPE_STRING) {
						String cellValue = cell.toString();
						String resultValue = null;
	
						if (cellValue.equals("{report_End}")) {
							isList = false;  // 清单使用状态取消
							row.setZeroHeight(true);  // 将该行隐藏起来
						}
						
						if (isList) {
							resultValue = replaceValue(cellValue, (Map) items.get(itemIndex));
							isInUse = true;
						} else {
							resultValue = replaceValue(cellValue, map);
						}
						
						cell.setCellValue(resultValue);
						
						if (cellValue.equals("{report_Start}")) {
							isList = true;  // 处于清单使用状态
							row.setZeroHeight(true);  // 将该行隐藏起来
							break;  
						}
					}
				}
				
				if (isList && isInUse) {  // 假如是明细写入状态, 每读取一行要将明细索引增加1个
					itemIndex++;
				}
			}
		}
		
		// 写完excel保存到硬盘中
		String outFilePath = webroot + excelPath + tempFileName; 
		OutputStream os = new FileOutputStream(outFilePath);            
		workbook.write(os);
		
		return outFilePath;
	}
	
	/**
	 * 替换掉 {}中的内容
	 * 
	 * @param cellValue
	 * @param map
	 * @return
	 */
	private static String replaceValue(String cellValue, Map map) {
		String regex = "\\{([^\\}]+)\\}";  // 代表{}
		
		Pattern pattern = Pattern.compile(regex); // 正则表达式匹配{}内的内容
        Matcher matcher = pattern.matcher(cellValue); 
        while(matcher.find()){ 
            String t = matcher.group(1); 
            
            // 直接替换为具体值
            if (map.get(t) != null) {
            	String str = map.get(t).toString();
            	if (isNumberFloat(str)){  // 假如是小数,取小数点后两位
            		DecimalFormat myformat = new DecimalFormat("#0.00");
            		myformat.setRoundingMode(RoundingMode.HALF_UP);  //四舍五入必须加这段
            		str = myformat.format(Double.parseDouble(str)); //保留2为小数
            	}
            	cellValue = cellValue.replace("{" + t + "}", str);
            } else {  // 假如为空 , 替换为 空字符
            	cellValue = "";
            }
        }
        return cellValue;
	}
	
	/**
	 * 判断是否小数，与判断整型的区别在与d后面的小数点（红色）  
	 * 
	 * @param str
	 * @return
	 */
	private static boolean isNumberFloat(String str) {
	    return str.matches("\\d+\\.\\d+$");  
	}  
	
	/**
	 * 获得可以在excel里面打印的条码
	 * 
	 * @param isbn
	 * @return
	 */
	public static String getExcelBarcode(String isbn){
		int checksum = 104;
		for (int i = 0; i < isbn.length(); i++){
			int unicodeNo = isbn.substring(i, i + 1).getBytes()[0];  // 原来有强制转int的处理, 现在去掉了不知道有没有影响
			if (unicodeNo >= 32){  // 一般都是32以上
				checksum += (unicodeNo - 32) * (i + 1);
			} else {
				checksum += (unicodeNo + 64) * (i + 1);
			}
		}
		
		checksum = checksum % 103;
		if (checksum < 95){
			checksum += 32;
		} else {
			checksum += 100;
		}
		
		char checkCode = (char)checksum;
		
		String result = (char)204 + isbn + checkCode + (char)206;
		return result;
	}
	
//	public static void main(String[] args) {
//		String str = "100.0080";
//		DecimalFormat myformat = new DecimalFormat("#0.00");
//		myformat.setRoundingMode(RoundingMode.HALF_UP);  //四舍五入必须加这段
//		String dstr = myformat.format(Double.parseDouble(str)); //保留2为小数
//		System.out.println(dstr);
//	}
	
//	public static void main(String[] args) {
//		ComThread.InitSTA();
//		ActiveXComponent xl = new ActiveXComponent("Excel.Application"); 
//		
//		//new Variant(false)  打印时是否显示文档       false不显示   
//		Dispatch.put(xl, "Visible", new Variant(false));
//		Dispatch workbooks = xl.getProperty("Workbooks").toDispatch(); 
//		
//		//打开文档 
//		Dispatch excel=Dispatch.call(workbooks,"Open","d:\\Distribution_List_Single.xls").toDispatch(); 
//		
//	//	Dispatch currentSheet = Dispatch.get(excel, "ActiveSheet").toDispatch();
//	//	Dispatch pageSetup = Dispatch.get(currentSheet, "PageSetup").toDispatch();
//	//	Dispatch.put(pageSetup, "Orientation", new Variant(2));//VBA通用 PaperSize
//		
//		
//		// 第五个参数指定打印机名称
//		Dispatch.callN(excel,"PrintOut",new Object[]{Variant.VT_MISSING, Variant.VT_MISSING, new Integer(1),
//	            new Boolean(false),"ZMIN X1", new Boolean(true),Variant.VT_MISSING, ""});
//		
//		ComThread.Release();
//	}
	
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {
		String filePath = "d://1.xls";
				
        // 产生出来一个workbook, 并且填入动态内容  对原来的模板文件不影响
		Workbook workbook = WorkbookFactory.create(new File(filePath));
		Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
		
		sheet.shiftRows(11, sheet.getLastRowNum(), 1);   // 第7行后插入一行
		ExcelUtil.copyRow(workbook, sheet.getRow(11), sheet.getRow(12), true);   // 第22行复制到第24行
		//ExcelUtil.removeRow(sheet, 21);// 删除第22行
		
		// 写完excel保存到硬盘中
		String outFilePath = "d://2.xls";
		OutputStream os = new FileOutputStream(outFilePath);            
		workbook.write(os);
	}
}
