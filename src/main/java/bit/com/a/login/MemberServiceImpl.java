package bit.com.a.login;

import bit.com.a.dto.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberDao dao;


    @Override
    public int getId(MemberDto mem) {
        return dao.getId(mem);
    }

    @Override
    public boolean addMember(MemberDto mem) {
        return dao.addMember(mem);
    }

    @Override
    public MemberDto login(MemberDto dto) {
        return dao.login(dto);
    }
}
