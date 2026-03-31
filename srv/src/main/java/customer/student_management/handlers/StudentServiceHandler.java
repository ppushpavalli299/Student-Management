package customer.student_management.handlers;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.services.EventContext;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

@Component
@ServiceName("StudentService")
public class StudentServiceHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @On(event = "uploadExcel")
    public void uploadExcel(EventContext context) {

        String base64File = (String) context.get("file");
        String fileName = (String) context.get("fileName");

        // ✅ Validations
        if (base64File == null || base64File.isEmpty()) {
            throw new RuntimeException("File content is missing");
        }

        if (fileName == null || fileName.isEmpty()) {
            throw new RuntimeException("File name is missing");
        }

        // ✅ Clean base64
        base64File = base64File
                .replaceAll("\\s", "")
                .replaceAll("[^A-Za-z0-9+/=]", "");

        byte[] fileBytes;

        try {
            fileBytes = Base64.getDecoder().decode(base64File);
        } catch (IllegalArgumentException e) {
            throw new RuntimeException("Invalid base64 content: " + e.getMessage());
        }

        // ✅ Prepare DB entry
        Map<String, Object> entry = new HashMap<>();
        entry.put("ID", UUID.randomUUID());
        entry.put("fileName", fileName);
        entry.put("content", fileBytes);
        entry.put("mimeType", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        // ✅ Insert into DB
        db.run(Insert.into("ec.masters.ExcelFiles").entry(entry));

        Map<String, Object> result = new HashMap<>();
        result.put("message", "Upload successful for: " + fileName);

        // ✅ Correct way in your CAP version
        context.put("result", result);
        context.setCompleted();
    }
}