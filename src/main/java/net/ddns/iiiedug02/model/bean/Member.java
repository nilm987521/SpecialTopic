package net.ddns.iiiedug02.model.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * JavaBean物件，對應資料庫中的members資料表
 */
@Entity
@Table(name = "members")
public class Member implements Serializable, UserDetails {

  private static final long serialVersionUID = 1L;

  @Id
  @Column(name = "uid")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int uid;

  @Column(name = "username")
  private String username;

  @Column(name = "password")
  private String password;

  @Column(name = "activated")
  private short activated = 0;

  @OneToOne(fetch = FetchType.LAZY, mappedBy = "member",
      cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
  private MemberInfomation memberDetail;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "member",
      cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
  private Set<MemberRole> roles;

  public int getUid() {
    return uid;
  }

  public void setUid(int uid) {
    this.uid = uid;
  }

  @Override
  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  @Override
  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public short getActivated() {
    return activated;
  }

  public void setActivated(short activated) {
    this.activated = activated;
  }

  public MemberInfomation getMemberDetail() {
    return memberDetail;
  }

  public void setMemberDetail(MemberInfomation memberDetail) {
    this.memberDetail = memberDetail;
  }

  public Set<MemberRole> getRoles() {
    return roles;
  }

  public void setRoles(Set<MemberRole> roles) {
    this.roles = roles;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return getRoles();
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

}