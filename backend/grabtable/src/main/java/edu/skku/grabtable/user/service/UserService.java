package edu.skku.grabtable.user.service;

import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.domain.request.UserUpdateRequest;
import edu.skku.grabtable.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public void modifyUser(User user, UserUpdateRequest userRequest) {
        user.update(
                userRequest.getUsername(),
                userRequest.getEmail(),
                userRequest.getPhone(),
                userRequest.getProfileImageUrl()
        );
        userRepository.save(user);
    }
}
