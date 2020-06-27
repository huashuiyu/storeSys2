package file;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

public class UploadAction extends ActionSupport {
    private String uid;
    private File headImage;
    private String headImageContentType;
    private String headImageFileName;

    public String execute() throws IOException{
        String realpath = ServletActionContext.getServletContext().getRealPath("/image");
        File file = new File(realpath);
        if(!file.exists()){
            file.mkdir();
        }

        FileUtils.copyFile(headImage,new File(file,headImageFileName));
        return SUCCESS;
    }


    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public File getHeadImage() {
        return headImage;
    }

    public void setHeadImage(File headImage) {
        this.headImage = headImage;
    }

    public String getHeadImageContentType() {
        return headImageContentType;
    }

    public void setHeadImageContentType(String headImageContentType) {
        this.headImageContentType = headImageContentType;
    }

    public String getHeadImageFileName() {
        return headImageFileName;
    }

    public void setHeadImageFileName(String headImageFileName) {
        this.headImageFileName = headImageFileName;
    }
}
