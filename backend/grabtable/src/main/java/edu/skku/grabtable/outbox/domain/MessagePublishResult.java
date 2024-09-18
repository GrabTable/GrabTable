package edu.skku.grabtable.outbox.domain;

import java.util.Set;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class MessagePublishResult {

    private final Set<Long> successMessageIds;
    private final Set<Long> failMessageIds;
}
