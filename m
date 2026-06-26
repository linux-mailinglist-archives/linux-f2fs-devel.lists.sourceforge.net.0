Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JYFACvE3PmqMBgkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 10:27:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 410766CB547
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 10:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=b8OOF7X7;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=P2Y2cNnp;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BLpUnRL4;
	dkim=fail ("body hash did not verify") header.d=amlogic.com header.s=selector1 header.b=t6BTXPgp;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrzsqMOpkYrgatFG5QwXD4w0XgNg/pwkY+vbJ3Jd6Kg=; b=b8OOF7X7D+gyeJHbBjehgfpYFL
	FVik8hzfsCW1cp2VXpFrFmZp+RSBZZzJj38Q7GYhGN5KIUZVPu1UTNVp+xn0SDfmBGAbYaOo20IUb
	aPvNOc83za0vb6hCSVkhOiporDanLAW0I4c4YWmqzeiokzA2/mEQjZum+LrOGgYaA8PQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wd1u8-0005oO-0K;
	Fri, 26 Jun 2026 08:27:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Jiucheng.Xu@amlogic.com>) id 1wd1u6-0005oH-5Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 08:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ia833OD0+/6vhStlVUXwNLar49ca/5MRLH6Rv5Kx+Y=; b=P2Y2cNnpQezzMUTMLSdIbUZ3yv
 CdpcIlW3+mgOh2G4TQ0BALeKyujRaSBGdlimOMJefps361+wB4XfRXE1pK7ljcnRQHtNOFC9Pejld
 fqVSVdGuD1L4KOexHaflzy8s6bRr5Zro5tKH4GdX9SXoCw5UWy6sHAv6yXghagixqZio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ia833OD0+/6vhStlVUXwNLar49ca/5MRLH6Rv5Kx+Y=; b=BLpUnRL4AxMoFhyeWbFwhEcVYC
 k/65MZESt30PgZlOJN17TqaSlUusirrxsDbmV0ekWwRBHBOcm0NsTXY3RwrLMAyxiAJCAB4iTsR61
 Z0W+/DBHMy+KSPsN4JQc05Lo8NYTVwEtFiuJjzdb70ajVGdm/s4LoUZTFAeOIz7LqccM=;
Received: from mail-koreacentralazon11023082.outbound.protection.outlook.com
 ([40.107.44.82] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wd1u4-00042f-1d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 08:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRec1XKo2GP5ykHP3FO7TfH/dDvXCMrb5fCLBMpuzoFnjyPZWVV3MuLLFNKBo+nLREbSHrl5JXipA/AmdA8OqA3mQ7JzAmxYj3gcRLYEcIzyuLvgZKi1WzwDFtObIAH+dDi6lPYCGuojYoxtKED6bY5aYp2swbA960onKOQkb/RosKMySrLYg7/cU6BzuExfpa3IhqzRre2BIG4Iln6sAu9/na20Zrew8sXQvosLm1mmCIhvMFBWoorToIFecRvkCyAsgerkRKM9wGLf7eKrQfHSuH3jbt0Ff/wpk++LoXNbTgWkGgvAjoNO/sHybzOtlCt49Cf7ENTNBzzvtrfh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ia833OD0+/6vhStlVUXwNLar49ca/5MRLH6Rv5Kx+Y=;
 b=HfGhc6XORNIZXoFmhSrZmG8ZMT39VzxJSoRqELJVBr8g6YeakppKva1JcS5Nl8bUpB+gtqlKBGqABWVSap5LpbaNwHxB1Bf6dQ2EcrSENttYhQROuSQqJyRUmyikGkLNmrf56B2ftKXSjJtpBvFwHmev0H6BHlXPu4g3GtqgVWP7gwHeOc47JgfKPpPZo8VA5XCfX1OgCJ5elhmo4AANcJMwy2cWdnPl5lvhMp8j6b1lvUGCuxr7YovwOVdwQW8OpsBQyzRAp5HY/vs18SvbcQKbVsjbRgF7+Qn+wJXGXNvV3atpEUWdMn3LTEYwGRSbrL6GsZVUj5wcEjLO7JxPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ia833OD0+/6vhStlVUXwNLar49ca/5MRLH6Rv5Kx+Y=;
 b=t6BTXPgpiSlw1o6bv/clg6DmnoFnPpyAufhXFQSO5c1kxp2pjbA2CVtXefzghttpfchv89A6WTaVT5jDeSZ4hVNli+gPsvi4gONZRtG9zuB9r7ToC6lAY6DePnRB6WQMDnQtp6fDZ8KPnScq8vnYZWH2JgMkUspikqMz6o60DWO1eJh5RUuM86rF9Kls5+hxuKerwXfzDOb0iv96/oOjuB/zGvweECaGiqQuFJ+v5mn1/7SIEXtCX5iByKo6PNa6i/cPY7vnskef5HSjJmzN/6xsj60yAv1o8gOJP/luAAYCaOyiwno6XrJD14yCerDeXC/PNI16ZOxlgP1l+zfNpA==
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5)
 by SEYPR03MB6995.apcprd03.prod.outlook.com (2603:1096:101:bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.7; Fri, 26 Jun
 2026 08:12:39 +0000
Received: from TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f]) by TYUPR03MB7232.apcprd03.prod.outlook.com
 ([fe80::525d:fa76:296a:a64f%3]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 08:12:39 +0000
Message-ID: <5ae99228-84b0-40bb-b001-7fa20cf9fdd3@amlogic.com>
Date: Fri, 26 Jun 2026 16:12:36 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260620-origin-dev-v1-1-3b2e639e794c@amlogic.com>
 <dffacd73-ebc2-4f35-9433-d569b48014be@kernel.org>
 <e9f39088-a4c1-4d1f-9a06-9d530e3fab15@amlogic.com>
 <2d9c5628-7f99-47f8-9d51-ac64352af4d9@kernel.org>
Content-Language: en-US
In-Reply-To: <2d9c5628-7f99-47f8-9d51-ac64352af4d9@kernel.org>
X-ClientProxiedBy: TP0P295CA0044.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::6)
 To TYUPR03MB7232.apcprd03.prod.outlook.com
 (2603:1096:400:354::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR03MB7232:EE_|SEYPR03MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 713a3b9b-ef93-4dad-fc70-08ded35ab05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ohX5hzTH4bompHsUpy0fciflWz3rqIQmeadwHJ9ZEPRQyzNvMnYbjmJq82kz+cwtXwtf9TCikCkr9nMnHIoh+w0GicteoZkUWJG+UMM2vLNtna6H4/8poPs/R2qIMhGtJBxn9YLu4iT/796tEl/vbPDKGusqkf3/kxdywMY0xRnQJuBJyG2gS2TNv3mjSaV7IoR6YI9Shk5wgoUSTUoIJMeWj5T9h5BAgvQgast0twehvSPMHZFnc8SN/8lIHG5LDQQpKNZqg3gS3FeaajevjKi6eRuYIPchtHn35ZhIK6TwGsJd2UwsI9kIs2IUQGgfsvR5jIni5+4hysDW0z70aOv91jZMDeGeNcmwcp1sUhg+XtsbLZKVV6bFUH8s1yoI8FfIpUblD+YJ5qf2VizoaLkYm62P3bH3T4TojrctlSg+fMhCIeQzuxEbWM6rWg7XAgxAjnt/y886+nZGWqHhMCq9Njq5z7JOwQXvDxzgX2X/xMgHQvJy61NgEyKbl+Orimk7qDJ2XA8kc8ENQySEy6UOkUXjHWZ6blcb23VCBhTMl+9JMKWrWTrUeXX3vlTpgc8XzPy0H9eNIMArfaFHHqHIaf6lhoCnWNUU6auZqwk/ezeEAtjDy7cEzKfz465tI+mTYTEvmis+adF31Y0zis2iOpNK7QAhp/HlKU2WU+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYUPR03MB7232.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnVERmlaVnpRRmx1VlE0akN2Si9Ba1dhcTFCSU5vZHpKaTdUNGlpR2Z4cTh0?=
 =?utf-8?B?VkFtNjB2VkkwaGJLOFRFNTF6L0hWZmFNZWxmSnBTVUszcmt4NWxLSUhXNk5w?=
 =?utf-8?B?T3A3a1lGcDNpNlFQUXBRMi9pRzBFMmRSbVZMcWcwRm1oVzJ5Z1NhelV1dVI5?=
 =?utf-8?B?VVpGbWx1Y0VVUVVTL0c1VnJ3QmdnSXIrNU5MTm9RMVFiall4cnlIRFMvZ2FD?=
 =?utf-8?B?UnB3cVhBdW42N3FiL2p4bVNtM25KeVRGU1A5RGFnSjliYmdTL0ZheDVvb25J?=
 =?utf-8?B?a1oxUnllaGVzNlZrVzN2QWt1TmhldHNIajZmWjMzTHI4WDBIUXpTblNaY0dw?=
 =?utf-8?B?aGk1Zk01emxMaXM4YlF4blduWUhha2ptTHlOLzlHUXZlU0Qrbjk1OFRiWm9N?=
 =?utf-8?B?N2JLcVRCRVMyRDdUUDlSL2ZTTGkySnQ3UWpVVE5wY1krcTFKcTgvdDZKeGh1?=
 =?utf-8?B?S0V1NWxjTmdGbldvd0hyNFo3V2RJZmd4MVRXNzMvUnUvRXFOUEZSWS9IeExw?=
 =?utf-8?B?SnZBOGRMZVJDazFaTWtidHRoWitYd0h3MExGenhZU3QrMkpJTlVReE9SQ2pr?=
 =?utf-8?B?cTVGZG5UbTVOL2hRNU14WlhpQTIrNEZqckNIbnRCMUZ0bjk5QlpyWUFrWTNC?=
 =?utf-8?B?elRhRDQwVWJRUkg2UkJFQkNMN3hVMVREQ01NSVhhK2xFTDdtdHhyTzNoTE5o?=
 =?utf-8?B?bWcrRktia1lWZFNpYzB5Wk1MK25TK3F4TWxhQ1hJRnNVV3JKT01sU293dE5D?=
 =?utf-8?B?aDZhcFpaWkdYTzkvTEc0RDhwdHc3QU9yRE1aUms0WU11cjFHemV6TmdEMlNx?=
 =?utf-8?B?bmhOTVFJSkt0QVBETkE2a0VIMnFGUkJCUFpmS0Y5ajZOY0JydmxWQXhQei95?=
 =?utf-8?B?d2dSRytmOXNoaFBtN2pZNjJkWTdFTVlrUjU0Ni9lRDdXdlozTjl4d2NHMUdZ?=
 =?utf-8?B?L1YrcXZKOXJzQXpRTTdXWGxEenJSdmp4Q2hmVVRaUkdxWGFqblZxSWppVkJo?=
 =?utf-8?B?azUyOG5lTDdzdVlmNFlOcElBWElhNTBJbGF3bmdWdHNJdjNZTVN5N0pGc2k2?=
 =?utf-8?B?eWVtakhteXJub0d1VzFNeUVYTWFReXhjSFcvWmsxK1ZtcGppWXNGTm1rSi9p?=
 =?utf-8?B?enlPTDRldkg2ckNDMlBoZmR2cWJrV294TzgzbmFGb0pBVUhDQ1IzN2dKT1M2?=
 =?utf-8?B?U3RTVTVhZFU0R2ZuMmVDT1NpTjZ6WEs2VktLQkVoTnZhVGd4ZndxemhMQkln?=
 =?utf-8?B?eFpud2REZUU4UDVXZ2cyL2JSeVdxbCsyOHFJb2JNenNjK0RzOXhHQy9KNW9x?=
 =?utf-8?B?OUxGMUZsTjlFcjFHdVhHNzNFMEVkVGhxRVg4TlM3eFNzTUdkN3M3RU1XbWlp?=
 =?utf-8?B?SlgzeVVCSStkdW1oNGdYa1V2UlRmdnY3UEhydDR2R004Wi9UcURteWMyV1dB?=
 =?utf-8?B?Unk4M1VuQXVNZlc0czZHdElKbit6QnppV3B5c1BvRVhhSWJrNjhxLzVkVVpR?=
 =?utf-8?B?cTlqazNkek9laldRRVVHMTQ2WmVmdnZYUVFIUzVTckdRSUlmei9PNjBBTEty?=
 =?utf-8?B?NWlRVmV4YUNLT002Lzc0anpZVHpDVEZDQm55dksxWTFaNEF0RWkzUlFOemtl?=
 =?utf-8?B?NTdQUDVNSkxuWU9ybXMrU0FwUjRzU1g5YmJ6eWFlZDVXakJZcHYrU1JUOHVZ?=
 =?utf-8?B?MFVYazFxWEIwRU0vYmtCQ1QvOGFqQzRXblU2OWQyWElScCsvS1NBN3UwRjg1?=
 =?utf-8?B?cHVtNm96a3ZnMUhpMDV4S25QY3hUSlJsVUI2ZG5SZVpGL2tmRVFRZ3VxK1lP?=
 =?utf-8?B?SjhGeWFTVTM4VzEvOWxsRHYxdkpZZG90OWhINjhDVGZmQThuREJmQ3NXVXlu?=
 =?utf-8?B?b2hDN2VzMlFtRG5tVFU4VTdzSHJWSEg5aW1LeXVCaGUxU0x2aWZjYUxkd0Fm?=
 =?utf-8?B?REtqYnQ3U282Zkh3d3RpUytybk45MFFzd2dkdnE4cVFidCtFNnlDZlY0SFNt?=
 =?utf-8?B?QnJWdGcxcjU5b3BmVlA0YkhLamR6eEVnVHVxYkQzejJSYkJ4U21XVm1SRGlo?=
 =?utf-8?B?WHkyRk1kaE9jQU1HMFd3RUlvSSs3MGplSllEeXF0UW1nTVhFeWxuNU9zUWll?=
 =?utf-8?B?cnBCQ1YyQkNDREJIL3lZZ2dDUllLSGNBb3hGQkJldC8zU2ExWDdZY0tLY3My?=
 =?utf-8?B?d2VzQkhmSEgyTDlyVlZjNGNqT1VWbFJ0YmJIK3BNOGRWc0pyWFN2dXd5SHk3?=
 =?utf-8?B?cXBwSVpaQjNQV0ZaSHhVWkZHSVRpWkV5YnFsRXZtcUp6MW9YQTV3Sm5Yakhj?=
 =?utf-8?B?VmR2bVc2S1Y1azdJOTdWbWxmdEtiNDlBS0ZTZDBDVnBPcXpYcytWZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713a3b9b-ef93-4dad-fc70-08ded35ab05d
X-MS-Exchange-CrossTenant-AuthSource: TYUPR03MB7232.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:12:39.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzGXRO4C6HVPUUEnmUo6S0m5Ri4tHvtbi7A30vhNbMR/0JojqZw/WyOGDTVLCjJuNoDiMq23q/9n2CmkjCsQeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6995
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/2026 3:09 PM,
 Chao Yu wrote: > [Some people who received
 this message don't often get email from chao@kernel.org. Learn why this is
 important at https://aka.ms/LearnAboutSenderIdentification ] [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.82 listed in wl.mailspike.net]
X-Headers-End: 1wd1u4-00042f-1d
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix FG GC failure when file in victim
 is pinned
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Jiucheng Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:tuan.zhang@amlogic.com,m:linux-kernel@vger.kernel.org,m:jianxin.pan@amlogic.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,amlogic.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,amlogic.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jiucheng.xu@amlogic.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 410766CB547



On 6/25/2026 3:09 PM, Chao Yu wrote:
> [Some people who received this message don't often get email from chao@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [ EXTERNAL EMAIL ]
> 
> On 6/22/26 18:40, Jiucheng Xu wrote:
>>
>> Regarding "why the pinfile is fragmented" you said, we use v5.15 + android U. Is it that v5.15 lacks some patches for special handling of pinfiles?
> 
> Ah, I think you can unpin log file created by logcat, the flag is added
> in aosp/1014260 to avoid fragmentation in filesystem (), but it's gone in
> aosp/43c6d76a
> 
> Thanks,

Thanks Chao, I think unpinning the log file can avoid this issue.

Let me ask a bit more.

I wonder why gc_control.nr_free_secs must be 0 in f2fs_expand_inode_data().

static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
                                         loff_t len, int mode)
{
         struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
                         .init_gc_type = FG_GC,
                         .should_migrate_blocks = false,
                         .err_gc_skipped = true,
                         .nr_free_secs = 0 };


Since it has reached such an urgent situation that FG GC needs to be 
triggered, I think the GC should try the second most suitable victim 
instead of returning -EAGAIN.

int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control 
*gc_control)
{
         if (gc_type == FG_GC) {
                 sbi->cur_victim_sec = NULL_SEGNO;

                 if (has_enough_free_secs(sbi, sec_freed, 0)) {
                         if (!gc_control->no_bg_gc &&
                             total_sec_freed < gc_control->nr_free_secs) 
//If nr_free_secs = 1, GC can try the second most suitable victim.

                                 goto go_gc_more;
                         goto stop;
                 }

Is there any risk if it is set to 1?

If I'm not mistaken, for pinned files, the allocation in 
f2fs_expand_inode_data() is also carried out in units of sections. 
Therefore, it should be reasonable to set nr_free_secs to 1 here.

Welcome your feedback!

Thanks,

>>>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>>>> ---
>>>>    fs/f2fs/file.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 8acdd94272a0ced448e0ba21635d702cfec10682..3e49a73bbf3a184a314e97bff9509a66c27eac00 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -1883,7 +1883,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>>>                        .init_gc_type = FG_GC,
>>>>                        .should_migrate_blocks = false,
>>>>                        .err_gc_skipped = true,
>>>> -                     .nr_free_secs = 0 };
>>>> +                     .nr_free_secs = 1 };
>>>>        pgoff_t pg_start, pg_end;
>>>>        loff_t new_size;
>>>>        loff_t off_end;
>>>>
>>>> ---
>>>> base-commit: b51f606aa323d553d786ed681a213f134dc688d6
>>>> change-id: 20260620-origin-dev-99cdccc83800
>>>>
>>>> Best regards,
>>>
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
