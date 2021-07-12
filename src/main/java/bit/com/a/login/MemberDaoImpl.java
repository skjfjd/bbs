package bit.com.a.login;

import bit.com.a.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

    @Autowired
    SqlSession sqlSession;

    String namespace = "Member.";

    @Override
    public int getId(MemberDto mem) {
        return sqlSession.selectOne( namespace + "getId" , mem);
    }

    @Override
    public boolean addMember(MemberDto mem) {
        int n = sqlSession.insert(namespace + "addMember", mem);
        return n>0?true:false;
    }

    @Override
    public MemberDto login(MemberDto dto) {
        MemberDto mem = sqlSession.selectOne(namespace + "login", dto);
        return mem;
    }
}
