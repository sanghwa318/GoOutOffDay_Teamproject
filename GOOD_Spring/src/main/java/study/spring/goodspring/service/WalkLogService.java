package study.spring.goodspring.service;


import study.spring.goodspring.model.WalkLog;

public interface WalkLogService {
public void addWalkLog(WalkLog input) throws Exception;
public void startRecord(WalkLog input) throws Exception;
public void endRecord(WalkLog input) throws Exception;

}
