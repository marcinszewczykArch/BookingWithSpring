package com.example.bookingwithspring.Configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

@Configuration
@EnableScheduling
public class AppConfiguration {

    int i = 0;
    int j = 0;
    int k = 0;




    //3 seconds between end of last execution and start
    @Scheduled(fixedDelay = 3000)
    public void sendMessageWithFixedDelay() throws InterruptedException {
        i++;
        TimeUnit.SECONDS.sleep(1);
        System.out.println(Thread.currentThread().getName() + " " + i + ". fixedDelay=3sec");
    }

    //3 seconds between starts
    @Scheduled(fixedRate = 3000)
    public void sendMessageWithFixedRate() throws InterruptedException {
        j++;
        TimeUnit.SECONDS.sleep(1);
        System.out.println(Thread.currentThread().getName() + " " + j + ". fixedRate=3sec");
    }

    //with CRON - 3 seconds between starts
    @Scheduled(cron="*/3 * * * * *")
    public void sendMessageWithCron() throws InterruptedException {
        k++;
        TimeUnit.SECONDS.sleep(1);
        System.out.println(Thread.currentThread().getName() + " " + k + ". CRON every 3sec");
    }







}
