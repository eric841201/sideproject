/*
 * @(#)BaseBean.java
 *
 * Copyright (c) 2022 HiTRUST Incorporated.
 * All rights reserved.
 * 
 * Description:
 *      網際威信 smartFDS 系統 - Entity Bean 基礎類別
 *
 * Modify History:
 * 2022/04/01, Kevin.Wang
 *   1) First release
 */
package com.example.demo.bean;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * 網際威信 smartFDS 系統 - Entity Bean 基礎類別
 * 
 * @author KevinWang
 */
@MappedSuperclass
@Data
@SuperBuilder
@NoArgsConstructor
public class BaseBean {
    
	private static final long serialVersionUID = 1L;

	/**
     * 物件識別碼 (Object Identifier), 對應至資料庫 Primary Key 欄位.
     */
    @Id
    @GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid", strategy="uuid")
    @Column(name = "OID", length = 32, nullable = false)
    protected String oid;
    
    /**
     * 建檔日期
     */
    @CreationTimestamp
    @Column(name="CREATE_DATETIME", nullable = false)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    protected LocalDateTime createdDateTime;
 
    /**
     * 更新時間
     */
    @UpdateTimestamp
    @Column(name="UPDATE_DATETIME")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    protected LocalDateTime updatedDateTime;
    
}
