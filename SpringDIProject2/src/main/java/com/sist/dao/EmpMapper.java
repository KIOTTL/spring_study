package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface EmpMapper {
	/*
	 * 	<select id="empListData" resultType="EmpVO">
	 *    SELECT empno, ename, job, hiredate, sal, deptno
	 *    FROM emp
	 * 	</select>
	 */
	@Select("SELECT empno, ename, job, hiredate, sal, deptno "
			+ "FROM emp")
	public List<EmpVO> empListData();
	//		resultType   id        parameterType
	// public List<EmpVO> findAll();
	
	
	/*
	 * 	<select id="empDetailData" resultType="EmpVO" parameterType="int">
	 *    SELECT * FROM emp
	 *    WHERE empno=#{empno}
	 *  </select>
	 */
	@Select("SELECT * FROM emp "
			+"WHERE empno=#{empno}")
	public EmpVO empDetailData(int empno);
}
