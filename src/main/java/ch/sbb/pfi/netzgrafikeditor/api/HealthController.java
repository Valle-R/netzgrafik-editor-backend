package ch.sbb.pfi.netzgrafikeditor.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class HealthController {
    @GetMapping("/v1/health")
    public HttpStatus healthCheck() {
        return HttpStatus.OK;
    }
}
