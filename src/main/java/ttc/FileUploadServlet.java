package ttc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileUploadException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.io.File;

import java.util.List;
import java.util.Iterator;
import ttc.util.ImageResizer;

import org.apache.commons.lang3.RandomStringUtils;

public class FileUploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		req.setCharacterEncoding("utf-8");

//		保存先のパス
		String path = "/tmp";

		String resultPath = null;

		String hostName = req.getLocalName();

		int width = 0;
		int height = 0;

		String info = req.getPathInfo();

		boolean resizeFlg = true;

		if (info != null && info.equals("/header")) {
			width = 1500;
			height = 500;
		} else if (info != null && info.equals("/article")) {
			resizeFlg = false;
			//リサイズしません
		} else {
			width = 400;
			height = 400;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		try {
			List list = sfu.parseRequest(req);
			Iterator it = list.iterator();
			while (it.hasNext()) {
				FileItem item = (FileItem) it.next();

				if (!item.isFormField()) {
					String fileName = item.getName();
					if ((fileName != null) && (!fileName.equals(""))) {
//						File target = new File(fileName);
//						
//						fileName = target.getName();

//						ファイルの拡張子を保持する変数

						String suffix = "";
						int point = fileName.lastIndexOf(".");
//						ファイル名から一番最後の.の位置を取得
						
						if (point != -1) {	//ファイル名に.が含まれているかどうかのチェック
//							最後の.の次の文字から先を拡張子として切り取る
							suffix = fileName.substring(point);
						}

						fileName = RandomStringUtils.randomAlphanumeric(10)+suffix;

//						ファイルの書き込み
						item.write(new File(path + "/" + fileName));

						String result = null;

						if (resizeFlg) {
							
							result = ImageResizer.doResize(new File(path + "/" + fileName), width, height, path + "/" + fileName);
						} else {
							String inputPath = fileName;
							String ext = inputPath.substring(inputPath.lastIndexOf(".") + 1);

							String[] temp = fileName.split("\\.", 0);
							StringBuffer buff = new StringBuffer();
							for (int i = 0; i < temp.length; i++) {
								if (i == temp.length - 1) {
									buff.append("_resize.");
								}
								buff.append(temp[i]);
							}
							result = new String(buff);
						}

//						戻り値としてサーバ上の画像のパスを返す
						resultPath = "http://" + hostName + "/TeraNavi/imgPath/" + result;
					}
				}

			}

		} catch (FileUploadException e) {
			throw new IOException(e.getMessage(), e);
		} catch (Exception e) {
			throw new IOException(e.getMessage(), e);
		}

//		ajaxで画像のパスを返すための記述
		String responseJson = "{\"result\":\"" + resultPath + "\"}";
		res.setContentType("application/json;charset=UTF-8");

		PrintWriter writer = res.getWriter();
		writer.print(responseJson);

		writer.flush();
		writer.close();
	}

	private String getFilename(Part part) {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}

		return null;
	}
}
