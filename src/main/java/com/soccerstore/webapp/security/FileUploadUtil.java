package com.soccerstore.webapp.security;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Component
public class FileUploadUtil {

    // Define the upload directory as a constant or get it from a configuration class
    private final String uploadDirectory = "src/main/webapp/pub/images/products/";

    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }

        // Create directory if it doesn't exist
        Path uploadPath = Paths.get(uploadDirectory);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate unique filename
        String originalFilename = file.getOriginalFilename();
        String extension = "";
        if (originalFilename != null && originalFilename.contains(".")) {
            extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        }
        String filename = UUID.randomUUID().toString() + extension;

        // Save the file
        Path filePath = uploadPath.resolve(filename);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        // Return the relative path to be stored in database
        return "/pub/images/products/" + filename;
    }
}