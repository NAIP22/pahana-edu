package com.icbt.service;

import com.icbt.model.User;
import com.icbt.dao.UserDAO;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class UserServiceTest {

    private UserService userService;
    private UserDAO realDao;

    @BeforeEach
    void setUp() {
        realDao = new UserDAO();
        userService = new UserService();
        // If your UserService doesn't take DAO in constructor, adjust accordingly
    }

    @Test
    @DisplayName("login returns user for valid credentials")
    void loginValidUser() {
        String username = "testUser";
        String password = "Password123";
        // Ensure test user exists in DB or mock DAO behavior
        User user = userService.login(username, password);
        assertNotNull(user, "Expected valid login to return a User object");
        assertEquals(username, user.getUsername());
    }

    @Test
    @DisplayName("login returns null for invalid password")
    void loginInvalidPassword() {
        User user = userService.login("testUser", "WrongPassword");
        assertNull(user, "Expected invalid password to return null");
    }

    @Test
    @DisplayName("login returns null for non-existent user")
    void loginNonExistentUser() {
        User user = userService.login("noSuchUser", "whatever");
        assertNull(user, "Expected login to fail for non-existent user");
    }
}
