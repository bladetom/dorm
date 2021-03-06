package com.tian.test;

import com.tian.dao.DormDao;
import com.tian.dao.EvaRecordDao;
import com.tian.dao.StudentDao;
import com.tian.domain.Dorm;
import com.tian.domain.EvaRecord;
import com.tian.domain.Student;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class EvaTest {
    private InputStream in ;
    private SqlSessionFactory factory;
    private SqlSession session;
    private EvaRecordDao dao;


    @Before//在测试方法执行之前执行
    public void init() throws IOException {
        //1.读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //2.创建构建者对象
        SqlSessionFactoryBuilder builder= new SqlSessionFactoryBuilder();
        //3.创建 SqlSession 工厂对象
        factory = builder.build(in);
        //4.创建 SqlSession 对象
        session = factory.openSession();
        //5.创建 Dao 的代理对象
        dao =session.getMapper(EvaRecordDao.class);

    }
    @After
    public void destory() throws IOException {
        session.commit();
        session.close();
        in.close();
    }
    @Test
    public void saveUser(){
        EvaRecord byRecId = dao.findByRecId(1);
        System.out.println(byRecId.getDorms());
    }
}
