package com.aetherwallet.e2e.metrics;

import org.junit.jupiter.api.extension.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ArrayNode;

import java.io.*;
import java.nio.file.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Selenium E2E Test Metrics Reporter
 * Collects and generates metrics reports for Selenium tests
 */
public class SeleniumMetricsReporter implements TestWatcher, BeforeAllCallback, AfterAllCallback {
    
    private static final String METRICS_DIR = "target/selenium-metrics";
    private static final Map<String, TestMetric> metrics = new ConcurrentHashMap<>();
    private static long suiteStartTime;
    private static int totalTests = 0;
    private static int passedTests = 0;
    private static int failedTests = 0;
    private static int skippedTests = 0;

    @Override
    public void beforeAll(ExtensionContext context) {
        suiteStartTime = System.currentTimeMillis();
        createMetricsDirectory();
        // Reset counters for fresh run
        totalTests = 0;
        passedTests = 0;
        failedTests = 0;
        skippedTests = 0;
        metrics.clear();
    }

    @Override
    public void afterAll(ExtensionContext context) {
        long suiteDuration = System.currentTimeMillis() - suiteStartTime;
        generateMetricsReport(suiteDuration);
    }

    @Override
    public void testSuccessful(ExtensionContext context) {
        recordMetric(context, "PASSED", null);
        passedTests++;
        totalTests++;
    }

    @Override
    public void testFailed(ExtensionContext context, Throwable cause) {
        recordMetric(context, "FAILED", cause.getMessage());
        failedTests++;
        totalTests++;
    }

    @Override
    public void testAborted(ExtensionContext context, Throwable cause) {
        recordMetric(context, "SKIPPED", cause != null ? cause.getMessage() : "Aborted");
        skippedTests++;
        totalTests++;
    }

    @Override
    public void testDisabled(ExtensionContext context, Optional<String> reason) {
        recordMetric(context, "SKIPPED", reason.orElse("Disabled"));
        skippedTests++;
        totalTests++;
    }

    private void recordMetric(ExtensionContext context, String status, String errorMessage) {
        String testName = context.getDisplayName();
        String className = context.getTestClass().map(Class::getSimpleName).orElse("Unknown");
        
        TestMetric metric = new TestMetric();
        metric.testName = testName;
        metric.className = className;
        metric.status = status;
        metric.errorMessage = errorMessage;
        metric.timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        
        metrics.put(className + "." + testName, metric);
    }

    private void createMetricsDirectory() {
        try {
            Files.createDirectories(Paths.get(METRICS_DIR));
        } catch (IOException e) {
            System.err.println("Failed to create metrics directory: " + e.getMessage());
        }
    }

    private void generateMetricsReport(long suiteDuration) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            ObjectNode report = mapper.createObjectNode();
            
            // Summary
            ObjectNode summary = mapper.createObjectNode();
            summary.put("totalTests", totalTests);
            summary.put("passed", passedTests);
            summary.put("failed", failedTests);
            summary.put("skipped", skippedTests);
            summary.put("passRate", totalTests > 0 ? (passedTests * 100.0 / totalTests) : 0);
            summary.put("duration", suiteDuration);
            summary.put("durationFormatted", formatDuration(suiteDuration));
            summary.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
            report.set("summary", summary);
            
            // Test Details
            ArrayNode tests = mapper.createArrayNode();
            for (TestMetric metric : metrics.values()) {
                ObjectNode test = mapper.createObjectNode();
                test.put("className", metric.className);
                test.put("testName", metric.testName);
                test.put("status", metric.status);
                test.put("timestamp", metric.timestamp);
                if (metric.errorMessage != null) {
                    test.put("error", metric.errorMessage);
                }
                tests.add(test);
            }
            report.set("tests", tests);
            
            // Write JSON report
            String jsonReport = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(report);
            Files.write(Paths.get(METRICS_DIR, "selenium-metrics.json"), jsonReport.getBytes());
            
            // Write HTML report
            generateHtmlReport(summary, tests);
            
            // Console output
            printConsoleReport();
            
        } catch (IOException e) {
            System.err.println("Failed to generate metrics report: " + e.getMessage());
        }
    }

    private void generateHtmlReport(ObjectNode summary, ArrayNode tests) throws IOException {
        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n");
        html.append("<meta charset=\"UTF-8\">\n");
        html.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        html.append("<title>Selenium E2E Test Metrics - AetherWallet</title>\n");
        html.append("<style>\n");
        html.append("* { margin: 0; padding: 0; box-sizing: border-box; }\n");
        html.append("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); color: #eee; min-height: 100vh; padding: 40px; }\n");
        html.append(".container { max-width: 1200px; margin: 0 auto; }\n");
        html.append(".header { text-align: center; margin-bottom: 50px; }\n");
        html.append(".header h1 { font-size: 2.5rem; margin-bottom: 10px; background: linear-gradient(90deg, #f59e0b, #fbbf24); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }\n");
        html.append(".header p { color: #888; font-size: 1.1rem; }\n");
        html.append(".summary { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 20px; margin-bottom: 50px; }\n");
        html.append(".card { background: rgba(255,255,255,0.05); backdrop-filter: blur(10px); padding: 25px; border-radius: 16px; text-align: center; border: 1px solid rgba(255,255,255,0.1); transition: transform 0.3s; }\n");
        html.append(".card:hover { transform: translateY(-5px); }\n");
        html.append(".card h2 { font-size: 2.5rem; margin-bottom: 5px; }\n");
        html.append(".card p { color: #888; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px; }\n");
        html.append(".passed { color: #4ade80; }\n");
        html.append(".failed { color: #f87171; }\n");
        html.append(".skipped { color: #fbbf24; }\n");
        html.append(".rate { color: #60a5fa; }\n");
        html.append(".duration { color: #c084fc; }\n");
        html.append(".tests-section h2 { margin-bottom: 20px; font-size: 1.5rem; }\n");
        html.append("table { width: 100%; border-collapse: collapse; background: rgba(255,255,255,0.05); border-radius: 16px; overflow: hidden; }\n");
        html.append("th { background: rgba(245,158,11,0.2); padding: 15px 20px; text-align: left; font-weight: 600; color: #f59e0b; }\n");
        html.append("td { padding: 15px 20px; border-bottom: 1px solid rgba(255,255,255,0.05); }\n");
        html.append("tr:last-child td { border-bottom: none; }\n");
        html.append("tr:hover { background: rgba(255,255,255,0.02); }\n");
        html.append(".status { padding: 6px 16px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; display: inline-block; }\n");
        html.append(".status-passed { background: rgba(74,222,128,0.2); color: #4ade80; }\n");
        html.append(".status-failed { background: rgba(248,113,113,0.2); color: #f87171; }\n");
        html.append(".status-skipped { background: rgba(251,191,36,0.2); color: #fbbf24; }\n");
        html.append(".footer { text-align: center; margin-top: 50px; color: #666; font-size: 0.9rem; }\n");
        html.append("</style>\n</head>\n<body>\n");
        
        html.append("<div class=\"container\">\n");
        html.append("<div class=\"header\">\n");
        html.append("<h1>🧪 Selenium E2E Test Metrics</h1>\n");
        html.append("<p>AetherWallet Trading Platform - Test Execution Report</p>\n");
        html.append("<p style=\"margin-top: 10px;\">Generated: ").append(summary.get("timestamp").asText()).append("</p>\n");
        html.append("</div>\n");
        
        html.append("<div class=\"summary\">\n");
        html.append("<div class=\"card\"><h2>").append(summary.get("totalTests").asInt()).append("</h2><p>Total Tests</p></div>\n");
        html.append("<div class=\"card\"><h2 class=\"passed\">").append(summary.get("passed").asInt()).append("</h2><p>Passed ✅</p></div>\n");
        html.append("<div class=\"card\"><h2 class=\"failed\">").append(summary.get("failed").asInt()).append("</h2><p>Failed ❌</p></div>\n");
        html.append("<div class=\"card\"><h2 class=\"skipped\">").append(summary.get("skipped").asInt()).append("</h2><p>Skipped ⏭️</p></div>\n");
        html.append("<div class=\"card\"><h2 class=\"rate\">").append(String.format("%.1f%%", summary.get("passRate").asDouble())).append("</h2><p>Pass Rate</p></div>\n");
        html.append("<div class=\"card\"><h2 class=\"duration\">").append(summary.get("durationFormatted").asText()).append("</h2><p>Duration</p></div>\n");
        html.append("</div>\n");
        
        html.append("<div class=\"tests-section\">\n");
        html.append("<h2>📋 Test Details</h2>\n");
        html.append("<table>\n<thead><tr><th>Test Class</th><th>Test Name</th><th>Status</th><th>Timestamp</th></tr></thead>\n<tbody>\n");
        
        for (int i = 0; i < tests.size(); i++) {
            var test = tests.get(i);
            String status = test.get("status").asText();
            String statusClass = "status-" + status.toLowerCase();
            html.append("<tr>");
            html.append("<td>").append(test.get("className").asText()).append("</td>");
            html.append("<td>").append(test.get("testName").asText()).append("</td>");
            html.append("<td><span class=\"status ").append(statusClass).append("\">").append(status).append("</span></td>");
            html.append("<td>").append(test.get("timestamp").asText()).append("</td>");
            html.append("</tr>\n");
        }
        html.append("</tbody>\n</table>\n</div>\n");
        
        html.append("<div class=\"footer\">\n");
        html.append("<p>AetherWallet Trading Platform - Selenium E2E Test Suite</p>\n");
        html.append("</div>\n");
        html.append("</div>\n</body>\n</html>");
        
        Files.write(Paths.get(METRICS_DIR, "selenium-report.html"), html.toString().getBytes());
    }

    private void printConsoleReport() {
        System.out.println("\n╔══════════════════════════════════════════════════════════════╗");
        System.out.println("║           SELENIUM E2E TEST METRICS REPORT                   ║");
        System.out.println("╠══════════════════════════════════════════════════════════════╣");
        System.out.println("║  Total Tests:    " + String.format("%-44d", totalTests) + "║");
        System.out.println("║  Passed:         " + String.format("%-44s", passedTests + " ✅") + "║");
        System.out.println("║  Failed:         " + String.format("%-44s", failedTests + " ❌") + "║");
        System.out.println("║  Skipped:        " + String.format("%-44s", skippedTests + " ⏭️") + "║");
        System.out.println("║  Pass Rate:      " + String.format("%-44s", String.format("%.1f%%", passedTests * 100.0 / Math.max(totalTests, 1))) + "║");
        System.out.println("╠══════════════════════════════════════════════════════════════╣");
        System.out.println("║  Reports:                                                    ║");
        System.out.println("║  • JSON: target/selenium-metrics/selenium-metrics.json       ║");
        System.out.println("║  • HTML: target/selenium-metrics/selenium-report.html        ║");
        System.out.println("╚══════════════════════════════════════════════════════════════╝\n");
    }

    private String formatDuration(long millis) {
        long seconds = millis / 1000;
        long minutes = seconds / 60;
        seconds = seconds % 60;
        if (minutes > 0) {
            return String.format("%dm %ds", minutes, seconds);
        }
        return String.format("%ds", seconds);
    }

    static class TestMetric {
        String testName;
        String className;
        String status;
        String errorMessage;
        String timestamp;
    }
}
