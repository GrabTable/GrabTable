package edu.skku.grabtable.service;

import edu.skku.grabtable.repository.ReviewRepository;
import edu.skku.grabtable.repository.StoreRepository;
import edu.skku.grabtable.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final StoreRepository storeRepository;


}
