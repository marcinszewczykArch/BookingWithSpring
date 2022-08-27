package com.example.bookingwithspring.Aop;

import com.example.bookingwithspring.Entity.UserActivity;
import com.example.bookingwithspring.Repo.UserActivityRepo;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.StringWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.stream.Collectors;

@Aspect
@Component
@EnableAspectJAutoProxy
@Slf4j
public class LoggingAspect {

    private final UserActivityRepo userActivityRepo;

    public LoggingAspect(UserActivityRepo userActivityRepo) {
        this.userActivityRepo = userActivityRepo;
    }


    @Pointcut("execution(* com.example.bookingwithspring.ControllerRest..*(..))")
    private void anyPublicMethod() {
    }

    @Before("anyPublicMethod()")
        public void beforeAnyPublicMethod(JoinPoint joinPoint){
        log.info("::before::" + joinPoint.getSignature().getName());
        for (Object arg : joinPoint.getArgs()) {
            log.info("::beforeArgs::" + arg);
        }
    }

    @After("anyPublicMethod()")
    public void afterAnyPublicMethod(JoinPoint joinPoint) {
        log.info("::after::" + joinPoint.getSignature().getName());
    }

    @Around("execution(* com.example.bookingwithspring.ControllerRest..*(..))")
    public Object aroundControllerMethod(ProceedingJoinPoint joinPoint) throws Throwable {
        Object proceed = joinPoint.proceed();
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
            Long start = System.nanoTime();
            Long executionTime = System.nanoTime() - start;
            String method = request.getMethod();
            String requestURI = request.getRequestURI();

            Object object = joinPoint.getArgs()[0];
            ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());
            String body = mapper.writeValueAsString(object);

            UserActivity userActivity = new UserActivity(method, requestURI, body, executionTime, LocalDateTime.now());
            userActivityRepo.save(userActivity);

        } catch (Throwable e) {
            log.info(":::not endpoint:::");
        }

        return proceed;
    }

}
