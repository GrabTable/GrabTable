package edu.skku.history_service.history.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jayway.jsonpath.JsonPath;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.bson.Document;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.ReplaceOptions;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@RequiredArgsConstructor
public class KafkaConsumer {

    private final MongoTemplate mongoTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @KafkaListener(topics = "reservation-history",
            containerFactory = "kafkaListenerContainerFactory")
    public void consume(ConsumerRecord<String, String> consumerRecord) {
        String value = consumerRecord.value();
        try {
            // JSON 파싱 (재파싱 필요)
            JsonNode intermediateNode = objectMapper.readTree(value);

            // 중첩된 JSON을 다시 파싱
            String actualJson = intermediateNode.asText();
            JsonNode root = objectMapper.readTree(actualJson);

            // reservationId 추출
            JsonNode reservationIdNode = root.path("reservationId");
            long reservationId = reservationIdNode.asLong();
            log.info("Extracted reservationId: {}", reservationId);

            Query query = Query.query(Criteria.where("reservationId").is(reservationId));
            Document document = Document.parse(actualJson);
            mongoTemplate.replace(query, document, ReplaceOptions.replaceOptions().upsert(),
                    "reservation-history");
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
