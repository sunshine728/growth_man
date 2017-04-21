package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_role")
public class TbRole {
    @Id
    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "role_description")
    private String roleDescription;

    /**
     * @return role_id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * @return role_name
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * @return role_description
     */
    public String getRoleDescription() {
        return roleDescription;
    }

    /**
     * @param roleDescription
     */
    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }
}