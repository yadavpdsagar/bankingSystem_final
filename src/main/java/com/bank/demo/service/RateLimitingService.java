package com.bank.demo.service;


import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@Service
public class RateLimitingService {

    private static final int MAX_REQUESTS = 1; // Max requests allowed
    private static final int TIME_WINDOW_SECONDS = 5; // Time window in seconds

    @SuppressWarnings("unchecked")
    public boolean isRequestAllowed(HttpSession session) {
        Map<String, RateLimitInfo> rateLimitInfoMap = (Map<String, RateLimitInfo>) session.getAttribute("rateLimitInfo");
        if (rateLimitInfoMap == null) {
            rateLimitInfoMap = new HashMap<>();
            session.setAttribute("rateLimitInfo", rateLimitInfoMap);
        }

        String sessionId = session.getId();
        RateLimitInfo rateLimitInfo = rateLimitInfoMap.get(sessionId);
        if (rateLimitInfo == null) {
            rateLimitInfo = new RateLimitInfo();
            rateLimitInfoMap.put(sessionId, rateLimitInfo);
        }

        Instant now = Instant.now();
        if (rateLimitInfo.getTimestamp().plusSeconds(TIME_WINDOW_SECONDS).isBefore(now)) {
            // Reset the count and timestamp if time window has passed
            rateLimitInfo.setCount(0);
            rateLimitInfo.setTimestamp(now);
        }

        if (rateLimitInfo.getCount() < MAX_REQUESTS) {
            // Allow request and increment count
            rateLimitInfo.setCount(rateLimitInfo.getCount() + 1);
            return true;
        } else {
            // Rate limit exceeded
            return false;
        }
    }

    private static class RateLimitInfo {
        private int count = 0;
        private Instant timestamp = Instant.now();

        public int getCount() {
            return count;
        }

        public void setCount(int count) {
            this.count = count;
        }

        public Instant getTimestamp() {
            return timestamp;
        }

        public void setTimestamp(Instant timestamp) {
            this.timestamp = timestamp;
        }
    }


}
