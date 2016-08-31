package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.HmcDAO;
import com.springapp.mvc.dao.interfaces.PlywoodDAO;
import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;
import com.springapp.mvc.service.interfaces.WorkWithFilesService;
import com.springapp.mvc.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class WorkWithFilesServiceImpl implements WorkWithFilesService {

    @Autowired
    private PlywoodDAO plywoodDAO;

   /* @Transactional
    public ResponseEntity<byte[]> getPDFOffer(String path, String products, String company, String director, boolean showPrice) throws Exception {
        String[] productsArr = products.split(";");
        Hmc[] machines = new Hmc[productsArr.length];
        for (int i = 0; i < machines.length; i++) {
            machines[i] = hmcDAO.getMachine(productsArr[i].split(",")[0]);
        }

        String pathPdf = GeneratePdfUtil.createPDF(path, products, machines, company, director, showPrice);

        File file = new File(pathPdf);
        byte[] contents = new byte[(int) file.length()];
        new FileInputStream(file).read(contents);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        String filename = "VMC-HMC-offer.pdf";
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        return new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
    }

    @Transactional
    public ResponseEntity<byte[]> getPDFOfferSingle(String path, String productId, String company, String director, boolean showPrice) throws Exception {
        Hmc machine = hmcDAO.getMachine(productId);

        String pathPdf = GeneratePdfUtil.createPDFSingle(path, machine, company, director, showPrice);

        File file = new File(pathPdf);
        byte[] contents = new byte[(int) file.length()];
        new FileInputStream(file).read(contents);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        String filename = "VMC-HMC-offer-" + productId + ".pdf";
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        return new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
    }

    @Transactional
    public void uploadMachines(String path, MultipartFile[] machines) {
        for (int i = 0; i < machines.length; i++) {
            try {
                File uploadFile = UploadMultipartFileUtil.uploadFile(path, machines[i]);
                Hmc machine = ReadExcelUtil.readMachine(uploadFile);
                hmcDAO.addMachine(machine);
                uploadFile.delete();
                System.out.println("Successfully uploaded machine: " + machines[i].getOriginalFilename());
            } catch (IOException e) {
                System.out.println("Failed to upload machine file: " + e.getMessage());
            }
        }
    }
    */

    @Transactional
    public void uploadPlywood(String path, MultipartFile[] plywood_file) {
        for (int i = 0; i < plywood_file.length; i++) {
            try {
                File uploadFile = UploadMultipartFileUtil.uploadFile(path, plywood_file[i]);
                Map<String, Object> plywood = ReadExcelUtil.readPlywood(uploadFile);
                ArrayList<PriceListEntity> priceList = (ArrayList<PriceListEntity>) plywood.get("priceList");

                plywoodDAO.addPlywood((PlywoodEntity) plywood.get("plywood"));
                for (PriceListEntity item : priceList)  {
                    plywoodDAO.addPriceList(item);
                }
                uploadFile.delete();
                System.out.println("Successfully uploaded machine: " + plywood_file[i].getOriginalFilename());
            } catch (IOException e) {
                System.out.println("Failed to upload machine file: " + e.getMessage());
            }
        }
    }

    @Transactional
    public void uploadImages(String path, MultipartFile[] images) {
        for (int i = 0; i < images.length; i++) {
            try {
                UploadMultipartFileUtil.uploadImage(path, images[i]);
                System.out.println("Successfully uploaded photo: " + images[i].getOriginalFilename());
            } catch (IOException e) {
                System.out.println("Failed to upload photo: " + e.getMessage());
            }
        }
    }

    @Transactional
    public String[] listImage(String path) {
        return ImageUtil.getListImage(path);
    }

    @Transactional
    public void removeImage(String path, String image) {
        ImageUtil.removeImage(path, image);
    }

}
