package com.team4.myapp.cause.service;

import java.util.List;

import com.team4.myapp.cause.model.Cause;
import com.team4.myapp.cause.model.dto.CauseDto;
import com.team4.myapp.cause.model.dto.CauseListDto;

public interface ICauseService {	
	int selectCauseCount(String memberId);
	void insertCause(CauseDto causeDto);

	List<CauseListDto> selectCauseList(String memberId, int page);
	List<CauseListDto> selectCauseListAdmin(int page);
	
}
