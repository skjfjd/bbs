package bit.com.a.login;

import bit.com.a.dto.MemberDto;

import java.util.List;

public interface MemberService {

    //List<MemberDto> allMember();

    int getId(MemberDto mem);
    boolean addMember(MemberDto mem);

    MemberDto login(MemberDto dto);
}
