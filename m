Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6XxCKJVSOmph6AcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 11:32:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF846B5D33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 11:32:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=TiK7zKll;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KwlOJ1Ow;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=fzB7Agy2;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=FKujNMJI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APntQsOccwQnZea3C3fUDmIC53Y8NycYvXVH37NARos=; b=TiK7zKllgQx9/saFf9pHFbkV0+
	Y2DbSO2KmnDX1rT8NCvKdattlZQo/keUxM9uSjbL5ljFBM2vLIFk7AaQuXmt06IBdPL5XGUiupfGr
	fSaxRKneHINFGXMzw/ioPpv2ZgsLcEZDyWSWi4Ijrh8z6b98wVvxe0EP8SaJ3YWBi/Zc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbxU5-00040Y-P9;
	Tue, 23 Jun 2026 09:31:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wbxTw-00040J-F6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 09:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WyBIgxenZ3T9XWNK7IzOTn2O7ARfMlSI6MDzwWMyhoE=; b=KwlOJ1OwFJCc2IhSbXTtDQZeTN
 b8tU0g90K/fhSbppGjwSsADX8e4/Yefv2q8LRD4+fWiJ196Zjl0eCMcw6g9RB5KlqYs22B3S+9lcm
 ZIuQLffLwwUV9WtdCWCf1mIGSgAKfrmXs8Hia3J8kXR9t5IOyT67T7FZHXYiFt7Bekeo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WyBIgxenZ3T9XWNK7IzOTn2O7ARfMlSI6MDzwWMyhoE=; b=fzB7Agy2X2EbI9MUeiQtOfTukY
 e6DikJ3KMGDKwyPbvzLZWGcD2I7gmouCgqpUyyta5MSVWhjOORsu05f20OeoYyamNz7MF2aIu1P4i
 1ApZ9gFwMD3rrDtNFbmLVsAKxwlK+b5+YPqSVrFeDrX1H4gyD++A2yNvv+euqEFFgNnw=;
Received: from mail-japaneastazolkn19012061.outbound.protection.outlook.com
 ([52.103.43.61] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbxTs-0000uz-AY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 09:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgLWqOBbbp1pjJLHi4Ny7pi9IWwT9qlBpaPwdwaJAHYIWOS1NDhB9g6/AHFwe/A6j7Ec0db+HFZ0ftL1Mr3HJUJpwKlTMqt3lpZkPPRlMA6yshzJVUY84evuSMSfd7uvfTpyiio5DanJ+sr7oVBB1CTuDIsTWDpPproKbbBnB9u2PCJNymzs/bNwgUpO740X13N7wEnOTvxYteCHmfJZWwHCH+BIdmMN3fNecGlyB/FvgAxbNZsB6xdyE1Hnp9sjlkHUuWvDP5r3u+7U6AFnLylP2GIF3ew2HV9jTF/NqDYfoR9enhH5mvLc9Ro8KvzdVruuB2WFbZLDcTqZMWPLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyBIgxenZ3T9XWNK7IzOTn2O7ARfMlSI6MDzwWMyhoE=;
 b=O/MObiXLbFiqFze/gkokRJzvRTXbs9EADPu0jQhUQrILEJYgXhPG2xTVDwHCOtvBvrc4sefPBT3+XCmbqJtDKkq3U4xacM1DYZwZXI3R1+13OK/2tEi2A7BBnET7OXImCd7p4dxDRvPpjT/nXRoNa0ZJWYkIYa0YbOI6qEmTuIJ+x72YI31Zp3pUDfNACxv5xwqJBx0qqwd6XsEd+XVp3wIKvCE9utZKV5FEL9akmeTVUBtZyPGmbD1cgN2VR5sTCTczt9X/0jQfPcme/F6tdMb6DckOM3N6BTdAoDuos0tcWStBloNkSvI2aaD7JI7/1VbDvlz5duh3pb7gLIJpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyBIgxenZ3T9XWNK7IzOTn2O7ARfMlSI6MDzwWMyhoE=;
 b=FKujNMJIedRqqSBiCSQD/XRxHZOZEEQLff0KGda+u2mwW/gGgJ+kwpZrfOaIXTJFkJA+OOdg5i1ZJ6hCT3hbLiX+PZ1eR+JMBR/1JbOq2hInC49eTWFxkEhuiLiFWRMHMXCfduNfGcO48c9/feeCrP9VZrhrrRGY2k6K3qT3uy0TDnb9YhbNyUL4U4xQqQ/QP1Zf2F/QKQKyzlrafwbpr4nVu00n3S/hyaHveHOFMrtJcpTO3UbC26XW3Pzfr63T1VCMJjmykHMFOWNIBa8mqI+ccBr4h2mqa8b5ZCtUEf28maHYysAttz52LBR7D18zYxi9x3lTMXvhsckJWxgkHg==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by OSNPR02MB9875.apcprd02.prod.outlook.com (2603:1096:604:484::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Tue, 23 Jun
 2026 09:31:31 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 09:31:31 +0000
Message-ID: <SEZPR02MB566274C1A81B5BCA484B0DE999EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Tue, 23 Jun 2026 17:31:27 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
 <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
 <SEZPR02MB56622CEC6B0C1B8E320262DE99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <7cad39b2-b822-4c0a-81c0-03e37b8334ef@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <7cad39b2-b822-4c0a-81c0-03e37b8334ef@kernel.org>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <0d7e178a-6fc3-4716-9a74-e4b9e5a46a94@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|OSNPR02MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f01f19-af51-4dbe-51f5-08ded10a351d
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkOM3L7kH8PFxmRXXyP2A8WEzo3aU8cTM3SYL6U4wkP1Bte4uhJaWrU4xJWfE3gMCQHVKbCnSxLLZXAVMovuSAlKbc0qmTmgstEieCyPsOivoSm0ZrxFMceLRbnuRAA8sWFRvudRnnqui2NzeO3V4iwj7GLE7k65DvvZA2AUP3JBCiG4b9+9mw2KCE/EHkTo4cwSPIr+cMh5YM9ikh/KmrJ1DT+iKQrm5exHtgp+6cPuXbrZJ2D1wazKVxTx7uPIN6/BfGpt6RZAy2qMd/FyNJDr8hwlyKNbgF4gYXYrsc8gkU58nMCbcQZibsbNa+R8xTo2mnMKqwVpjV2BQexJHIIOM476lVx+Db2f3BC0yAmtNy9FTN/1PQXJv2jWun5+aP817VuQ5mdcCCaNiR+o4DFYRYcLemAwuNETzfSQCGLKL6izChJsWZPTmdfXTlu1f5/5YTVe185zs6Ld7ODUj00WASlzOJemT3J+9bLjILGGHhR+gKQChuzAurpQnFqFznYLK5YuCRaxvEmFrVIFHWoMdSXh9DpqWHQyeRnNKvP79q/D9sQuRBj3CSeqQAeT1xBkm8dxs6O9BAAx/XtW2W8p/XXIhcHgdUW3BSztPDvH9XZW5y4J7vOYvGTakOQ4KDyaH1B89IhZhFQnwv1qYsS54+JCNwFrhAzb/SArQcL3LcCAZd3v8swVvnNyMoV/8XBU7ZCUiQxTw7Tk+jDzNRvRdy0LK6gjVQYchZVBjBNgZhsuY3lzTFdtYJqY12qJWa3jc5YtmjA1408vDfgRVYA7l5nI+vSZfS
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|45011099003|15080799012|6090799003|5072599009|23021999003|7042599007|41001999006|24121999003|51005399006|22091999003|19110799012|8060799015|10035399007|440099028|3412199025|12091999003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2FIWkRjTFpwSmlUZnRvbkFobXZRSFhLWi9iS2FRb3R6blhXQkgxN0hpWjNt?=
 =?utf-8?B?U1QyV0xlUWo3a0VFZ0FSZkxWc0xRK0NvSGFKRVdRV3JSQzRZZGdCOGd6eTFT?=
 =?utf-8?B?ZGdUTFBtaDJrZjhNdi9vazBEeENVa0xYREd0SHZTVHBMUnlQSlkyYlRySThh?=
 =?utf-8?B?cVZhMEM5eHlqeEZWVVJmYktaM0F2OVgySXUyMUVIcTl5YTgzN0ZZSnkxdDNU?=
 =?utf-8?B?dFdweUVGSlRJU2RlYlQyeWdvdlc1V0YrWEdtaDFNS3FwZ29TTmhCa1J1ZUla?=
 =?utf-8?B?SDhJUWFYdW85dDBMamZtNVorRGFZNGptZ3RnL0VNeHpMNk05ZTlQcVdkeDU1?=
 =?utf-8?B?dFhzeTJMZGkva0RsSjlQRzNWaDVVMGpRcGpTWWdEcjVFOFo1bURTN1hzdHhl?=
 =?utf-8?B?WjZucm5mQlhsQ1R0SlRjYUVJYXgrNzZwblVUQmp0Z2R0U08vSkVYOUFIUy9p?=
 =?utf-8?B?elN0VXAwekcwNlRTbENncTMycWZpd1lQWWpYUmZiZm1hbitIbTFUNjQwY0xi?=
 =?utf-8?B?WEttR2F4NXpSZ0cydlpwWWQ1b1RZMWw2aWFjL3pHTVhrb3U2cDY2VG54RXRi?=
 =?utf-8?B?ZWVoeHpGNUM4TjJldTZpZm9CSXlGVXFIcXcyQ0dncmM4YXJtd3BxaDZNYmdI?=
 =?utf-8?B?bTZ1cmt6WmRMWi9jOXlaNDR1WlJvOWY3bzJ1WjEvZ1h4T3hKU3BmUmMwZ2pt?=
 =?utf-8?B?a1JFcWkwT0YwWmx4aTFLaTY5a1RsQnRMdWN1dXFjVThwR2pWMDNvRkRxV1Nx?=
 =?utf-8?B?eWJPWDR0dklxYWMxUXUwYWVNMEVpUSt0UlZvN1pJNjF1RjdmWXhFb1l1ejl6?=
 =?utf-8?B?cXJSRTBycWdxMjRVSkwzU1l0SVhVQzdQWE9saEZFYk54SEczQnpVZkN5MVRh?=
 =?utf-8?B?RHRUNm5zYXNiYXoxMmMrbXVPblhsbXZXclo5cEVQMGt2dS9MSTZtVlZCS29u?=
 =?utf-8?B?ZWVrTE9qcGI1bEVBdTFEQXhGb3JGQ3lKRGxTVlZHdjkwcjlxcWhjanZPa0RE?=
 =?utf-8?B?djVUc3UvSEJQRVFRNzRIZWZNdjMyUkt4RTRMck9PVjBMa3N4M2FVcDNSRzJ3?=
 =?utf-8?B?VVhnUVRJbjhjS1Nhc3hZZThyRURJeWZHdzBmZ3pVdHpKMnl6NVp4SEt5eU5s?=
 =?utf-8?B?MEVuNUZOcWd2QXY0VzB5WGZaano2cXphNHVaT29ZRVp4ajVtNE1aV3ByVCsv?=
 =?utf-8?B?ekFzb3BGajkrbkpvdER0M2JJUkxmZlNFbzE4L0RaN1p1RVJCSldCVHpoeHFi?=
 =?utf-8?B?Nm5vQ2F5U1N4eUJhUG9SUzFBUGdOOEYxVXhXUXEwOWdXVGRYU3lTYVY3ZDJR?=
 =?utf-8?B?bHQxc3U3ckZ4WDA5NGcvalZmdjVsd1dIRTNMUGU5YUVWaVd1QXFKdGpzQmls?=
 =?utf-8?B?cDF3MmRoVi94bDJGRHJoZEEvUHdXWm13b1NFS0U1OTBlcDJETjZUa1RmbVlG?=
 =?utf-8?B?WmZQSndqZ2JkOElndTZ2NWRsNUNPVGtueTFoNVJQQmtvazdSRGk0bExiZnVN?=
 =?utf-8?B?YS9LZjlodzN6L2xneGY3K1B2YTV5NWlIcFhHSFNGZXk3VUZ1eTF6QnpoUGxL?=
 =?utf-8?Q?sMm8fSRVgDJl7piwbQlyNUfh0/OvzGRFweQlzxgdGEIjBD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lxQ2hCUmJyNWxSSm9COEl6R21KaWNSbXcyTU5zUmJxUHhqcWV6eVNkNDRn?=
 =?utf-8?B?REl1QU1CWFoxSmFOUUtiY25KN3JTNkgxWnh3MXFra2M4OFdmejk2ZXA4Wkt5?=
 =?utf-8?B?M0VLRDhsalNDelJ2Q3g4MzR1SGhLc2wwdVZGQXNsVU05azNmb09YUUJtcjh1?=
 =?utf-8?B?LzQxZEFDQW5Za1AzTHlLTmpLd2ZLcXpCTHpXMHdKcHNRVk5iOSswZWhBZE1l?=
 =?utf-8?B?L2hRbDRqVng2eW1DY2RzbjJ1SnBXeWRQYnlwMUcyVUd1UTZLVFF0S0hCa01a?=
 =?utf-8?B?SmpDTjJaMitJcGNvbGJzTndESjBTa2QydmxTYkJvUGF5Nm5pcHROU2FPRFA3?=
 =?utf-8?B?SitIcXBUNlJVN25abitUM20wY2haNE0waFh4SEFoMTZRVTlKVDdWc3M2L2Nn?=
 =?utf-8?B?dDJnRHpnTHpEQlRyTDBDYjVWd1JHL0pISFFPUnBHRlZabmg3bU5EazkyS0VC?=
 =?utf-8?B?RlBSMFpQQndYV2R2ZXBsb3R4dWNyWU5remlKWjBPd3NtTS9SMDhvdGRyQVRS?=
 =?utf-8?B?a1M3UzZTdzhFWUZsbWNWdWFPTnh0RkVEVExMaXgrNGowY1Jkc3pHUU5idzZO?=
 =?utf-8?B?N0luN25ERURUcmd0NHdxV2MvRnZSV1paandnWEdLb2o3RjhiZlRtQUJrYzVQ?=
 =?utf-8?B?RHhRU29CZFZudTIwUG1MbWJCV0xKRlVkVFM2UHRnb0F2V25HV2p0akVlcG9u?=
 =?utf-8?B?MUIyOVpxbWFMQm0wdklXN2JUaWxnOU9GRXNnd251YlFDdHdST1A1RDAwMnlQ?=
 =?utf-8?B?bUYzTGlqQVZaRUQraCtDOVdhSzN0TXNoN1B0d2dqTVlQYkZ6MTl2YjdodCtI?=
 =?utf-8?B?WmpQQWsvK1UrcGQ2RkF6eU5OTGJMNENPb0lUMk5iOVU4eVFGRkN5cWV0a0gx?=
 =?utf-8?B?MWtTZHM2VGd3dHZRNllrRUFZOER1ZGU0OVJtSFVoZDFDZzM5aHM4MFgvVnRI?=
 =?utf-8?B?ODIxNHBDZUtiM09iMTRLUnJZUnFmTXNZWHNNbmUxaktVd1lUY0IvL0hWSXFj?=
 =?utf-8?B?TGpSNldZRWhEY3RGTmJFSmpGOWtXQU9uMTkxRjRnSUkvbFBJY0R6YlFVNXh5?=
 =?utf-8?B?VkZSdjByQmlhUUhMRklWNmp2ZDAyQzRub2lXZ3c0NjF3S0o4UUFyTU9JZUdt?=
 =?utf-8?B?dlBQZzg3WHY2WlRDZzhBMnRmaVl2M1VuejJCcGNVUmhSZHVNcnNSRDAwbTBr?=
 =?utf-8?B?VXJHNVZ2WkZOeHNtWWtaeGpldjJZak1HR0JIbmd1K3VtQW9ySmRLRXA4ZmdW?=
 =?utf-8?B?K3ZaMG45SmhBYTV3UldDRWhkMWVBWUNHYzFsbHVtQ01DUjh0UnlOTUo3dGVn?=
 =?utf-8?B?U0RLeGVvditqNWo1bWxxU2ZuY3g5RjFSRjhKZVlFS1RVN25ibG1GL0gzMjJB?=
 =?utf-8?B?YzRqZEtYVUxZcWVqQSs4aUFWOHJmUTFublBNQkx6WmhEVWw3YnJmRDVramp4?=
 =?utf-8?B?WGoyOVEyWTNlNStxMTlLNVRySUxYUnBYVnlLMGZqc3dnMnRuQ21MSXc3ZzlS?=
 =?utf-8?B?NXB6dUdaZk0rTnFiSzBJTzQ2V2hUN3hIaTdXSyszenhpcllxS1lnZStMUHZv?=
 =?utf-8?B?YVZTUXhWY2Z6aGt6SUJTUXVLdHJZK2RwSnI0N1VQdEpMM2hwODlmZnJkZVNC?=
 =?utf-8?B?OGN6c3NlOUJVTGtVMUt6RndxUUJUVXg0VGZrZ3VvSVhRc2FQRjZEWkViY1N1?=
 =?utf-8?B?ZysvWU1OOXhTSHM4MmU4V3Nvc3RhVFAyYmdzOTRVVXM3UUZFa2cvN0FielJM?=
 =?utf-8?B?bFVuQXRpVS82KzQ2VEdUc0NJZEZPMGJIN2RhN2V3OFRmYjc3Y0l2bjBQaWph?=
 =?utf-8?B?SVpPTmdFSnFCc3ppYVEvNjN0UWIvR1lpODRldHk1SCt5OTNDZWtETmZVVmJz?=
 =?utf-8?B?K3BaRjlQZFZ5WDVzaXhyWW5JUHI2a0hzTzhSaTVaN3VsQzArZFBCZGxUOHQ0?=
 =?utf-8?Q?vYqdbFk+5eo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f01f19-af51-4dbe-51f5-08ded10a351d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 09:31:31.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR02MB9875
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/22/26 08:45, Chao Yu via Linux-f2fs-devel wrote: > On
 6/22/26 00:07, Yongpeng Yang wrote: >> >> On 6/20/26 2:15 PM, Chao Yu via
 Linux-f2fs-devel wrote: >>> On 6/19/26 22:38, Yongpeng Yang wrote: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.61 listed in wl.mailspike.net]
X-Headers-End: 1wbxTs-0000uz-AY
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BF846B5D33

Ck9uIDYvMjIvMjYgMDg6NDUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gNi8yMi8yNiAwMDowNywgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4KPj4gT24gNi8yMC8yNiAy
OjE1IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gNi8xOS8y
NiAyMjozOCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pgo+Pj4+IE9uIDYvMTUvMjYgODowNSBQ
TSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4gT24gNi8xMi8yNiAx
OTo1OCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4KPj4+Pj4+IFByZXZpb3VzbHksIHdoZW4gYW4g
ZXh0ZW50IGJlaW5nIGluc2VydGVkIG92ZXJsYXBzIHdpdGggdGhlIGxhcmdlc3QKPj4+Pj4+IGV4
dGVudCwgdGhlIGxhcmdlc3QgZXh0ZW50IGlzIGRyb3BwZWQgZW50aXJlbHkuIFRoaXMgd2FzIGRv
bmUgdG8KPj4+Pj4+IGhhbmRsZQo+Pj4+Pgo+Pj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1p
c3NlZCBhbnl0aGluZywgSSByZW1lbWJlciB0aGF0IHdlIHdpbGwgYWRkCj4+Pj4+IGxhcmdlc3QK
Pj4+Pj4gZXh0ZW50IGluIGJlbG93IHBhdGg/Cj4+Pj4+Cj4+Pj4+IC0gX191cGRhdGVfZXh0ZW50
X3RyZWVfcmFuZ2UKPj4+Pj4gwqAgLSBfX2luc2VydF9leHRlbnRfdHJlZQo+Pj4+PiDCoMKgIC0g
X190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdlc3Qgdy8gcmlnaHQgZXh0
ZW50Cj4+Pj4+IMKgIC0gX190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdl
c3Qgdy8gbGVmdCBleHRlbnQKPj4+Pgo+Pj4+IFRoZSBsYXJnZXN0IGV4dGVudCBtaWdodCBub3Qg
cmVzaWRlIGluIHRoZSBleHRlbnQgdHJlZS4gSWYKPj4+PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9y
YW5nZSBpbnZva2VzIF9fZHJvcF9sYXJnZXN0X2V4dGVudCwgdGhlIGxlbmd0aCBvZgo+Pj4KPj4+
IEkgbWVhbnQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UgaW52b2tlcyBfX2Ryb3BfbGFyZ2Vz
dF9leHRlbnQgdG8gZHJvcAo+Pj4gbGFyZ2VzdCBmaXJzdCwgYW5kIHRoZW4sIGl0IHRyaWVzIHRv
IHVwZGF0ZSBsYXJnZXN0IGV4dGVudCB3LyBsYXJnZXItCj4+PiBzaXplCj4+PiBvbmUgb2Ygc2Vw
YXJhdGVkIHR3byBleHRlbnRzLgo+Pj4KPj4+PiB0aGUgbGFyZ2VzdCBleHRlbnQgd2lsbCBoYXZl
IGJlZW4gc2V0IHRvIHplcm8uIEFzIGEgcmVzdWx0LCB0aGUgbGFyZ2VzdAo+Pj4+IGV4dGVudCB1
cGRhdGVkIGluc2lkZSBfX3RyeV91cGRhdGVfbGFyZ2VzdF9leHRlbnQgY2FuIGVuZCB1cCBzbWFs
bGVyCj4+Pj4gdGhhbiB0aGUgbGFyZ2VzdCBleHRlbnQgb2J0YWluZWQgYWZ0ZXIgX19wdW5jaF9s
YXJnZXN0X2V4dGVudCBjb21wbGV0ZXMKPj4+PiBpdHMgcHVuY2ggb3BlcmF0aW9uLgo+Pj4KPj4+
IEkgZGlkbid0IGdldCBpdCwgY2FuIHlvdSBnaXZlIGFuIGV4YW1wbGUgZm9yIHRoaXM/Cj4+Cj4+
IFRoZSBvbmx5IGRpc3RpbmN0aW9uIGJldHdlZW4gcHVuY2ggYW5kIGRyb3AgYXJpc2VzIHdoZW4g
dGhlIGxhcmdlc3QKPj4gZXh0ZW50IGlzIG5vdCBwcmVzZW50IGluIHRoZSBleHRlbnQgdHJlZS4K
Pj4KPj4gQmVmb3JlIHRoaXMgcGF0Y2goZXh0ZW50IGZvcm1hdCBbZm9mcywgbGVuLCBibGtdKQo+
PiAxLiBpbml0YWwgc3RhdGUKPj4gwqDCoMKgwqAgbGFyZ2VzdCBleHRlbnQ6IFswLCAxMDI0LCAx
MF0sIGV4dGVudCB0cmVlOiBlbXB0eQo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXl5eXl4KPiAKPiBJdCdzIG5vdCBlbXB0eSB3L28gcGF0Y2ggMi81LgoK
U29ycnkgZm9yIHRoZSBjb25mdXNpb24uICJlbXB0eSIgbWVhbnMgdGhhdCB0aGUgbGFyZ2VzdCBl
eHRlbnQgaGFzIGJlZW4Kc2hydW5rLgoKVGhhbmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4g
Cj4+IDIuIGluc2VydCBbNTExLCAxLCAxMDAwMF0KPj4gwqDCoMKgwqAgbGFyZ2VzdCBleHRlbnQ6
IFs1MTEsIDEsIDEwMDAwXSwgZXh0ZW50IHRyZWU6IFs1MTEsIDEsIDEwMDAwXQo+Pgo+PiBBZnRl
ciB0aGlzIHBhdGNoOgo+PiAxLiBpbml0YWwgc3RhdGUKPj4gwqDCoMKgwqAgbGFyZ2VzdCBleHRl
bnQ6IFswLCAxMDI0LCAxMF0sIGV4dGVudCB0cmVlOiBlbXB0eQo+PiAyLiBpbnNlcnQgWzUxMSwg
MSwgMTAwMDBdCj4+IMKgwqDCoMKgIGxhcmdlc3QgZXh0ZW50OiBbNTEyLCA1MTIsIDUyMl0sIGV4
dGVudCB0cmVlOiBbNTExLCAxLCAxMDAwMF0KPj4KPj4gVGhhbmtzCj4+IFlvbmdwZW5nLAo+Pgo+
Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+PiBUaGFua3MKPj4+PiBZb25ncGVuZywKPj4+Pgo+
Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiB0aGUgY2FzZSB3aGVyZSB0aGUgbGFyZ2Vz
dCBleHRlbnQgaXMgbm90IGluIG1lbW9yeSwgYXZvaWRpbmcKPj4+Pj4+IGluY29uc2lzdGVuY3kg
YmV0d2VlbiB0aGUgbGFyZ2VzdCBleHRlbnQgYW5kIHRoZSBleHRlbnQgdHJlZS4KPj4+Pj4+Cj4+
Pj4+PiBUaGlzIHBhdGNoIGNoYW5nZXMgdGhlIHNlbWFudGljcyBvZiBfX2Ryb3BfbGFyZ2VzdF9l
eHRlbnQgKHJlbmFtZWQgdG8KPj4+Pj4+IF9fcHVuY2hfbGFyZ2VzdF9leHRlbnQpOiBpbnN0ZWFk
IG9mIGRpc2NhcmRpbmcgdGhlIGVudGlyZSBsYXJnZXN0Cj4+Pj4+PiBleHRlbnQgd2hlbiBhbnkg
b3ZlcmxhcCBpcyBkZXRlY3RlZCwga2VlcCB0aGUgbGFyZ2VyIHJlbWFpbmluZwo+Pj4+Pj4gcG9y
dGlvbgo+Pj4+Pj4gKGxlZnQgb3IgcmlnaHQpIGFmdGVyIHRoZSBwdW5jaC4gVGhpcyBwcmVzZXJ2
ZXMgZXh0ZW50IGNhY2hlIGNvdmVyYWdlCj4+Pj4+PiBmb3IgdHJ1bmNhdGUgYW5kIG92ZXJ3cml0
ZSBvcGVyYXRpb25zIHRoYXQgb25seSBwYXJ0aWFsbHkgb3ZlcmxhcCB0aGUKPj4+Pj4+IGxhcmdl
c3QgZXh0ZW50Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiDCoCBmcy9mMmZzL2V4dGVu
dF9jYWNoZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVu
dF9jYWNoZS5jCj4+Pj4+PiBpbmRleCBmOGQ5NGRiNjBkYzYuLjgyZDg0YzRlOThiMiAxMDA2NDQK
Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMKPj4+Pj4+IEBAIC0zOTcsMTQgKzM5NywzMSBAQCBzdGF0aWMgdW5zaWdu
ZWQgaW50Cj4+Pj4+PiBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LAo+Pj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gY291bnQ7Cj4+Pj4+PiDCoCB9Cj4+Pj4+PiAtc3Rh
dGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdCBleHRlbnRfdHJlZSAqZXQsCj4+
Pj4+PiArc3RhdGljIHZvaWQgX19wdW5jaF9sYXJnZXN0X2V4dGVudChzdHJ1Y3QgZXh0ZW50X3Ry
ZWUgKmV0LAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBnb2ZmX3QgZm9mcywgdW5zaWduZWQgaW50IGxlbikKPj4+Pj4+IMKgIHsKPj4+Pj4+IC3CoMKg
wqAgaWYgKGZvZnMgPCAocGdvZmZfdClldC0+bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3QubGVu
ICYmCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2ZzICsgbGVuID4gZXQtPmxhcmdl
c3QuZm9mcykgewo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0LmxlbiA9IDA7Cj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3RfdXBkYXRlZCA9IHRydWU7Cj4+Pj4+PiAr
wqDCoMKgIHVuc2lnbmVkIGludCBsYXJnZXN0X2VuZCwgcHVuY2hfZW5kOwo+Pj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnQgbGVmdF9sZW4sIHJpZ2h0X2xlbjsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKg
wqAgaWYgKGZvZnMgPj0gKHBnb2ZmX3QpZXQtPmxhcmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0Lmxl
biB8fAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9mcyArIGxlbiA8PSBldC0+bGFy
Z2VzdC5mb2ZzKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4+ICsKPj4+Pj4+
ICvCoMKgwqAgLyogUHVuY2ggW2ZvZnMsIGZvZnMgKyBsZW4pIGZyb20gbGFyZ2VzdCBleHRlbnQu
ICovCj4+Pj4+PiArwqDCoMKgIGxhcmdlc3RfZW5kID0gZXQtPmxhcmdlc3QuZm9mcyArIGV0LT5s
YXJnZXN0LmxlbjsKPj4+Pj4+ICvCoMKgwqAgcHVuY2hfZW5kID0gZm9mcyArIGxlbjsKPj4+Pj4+
ICsKPj4+Pj4+ICvCoMKgwqAgbGVmdF9sZW4gPSBmb2ZzID4gZXQtPmxhcmdlc3QuZm9mcyA/IGZv
ZnMgLSBldC0KPj4+Pj4+ID5sYXJnZXN0LmZvZnMgOiAwOwo+Pj4+Pj4gK8KgwqDCoCByaWdodF9s
ZW4gPSBsYXJnZXN0X2VuZCA+IHB1bmNoX2VuZCA/IGxhcmdlc3RfZW5kIC0KPj4+Pj4+IHB1bmNo
X2VuZCA6IDA7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIGlmIChsZWZ0X2xlbiA+PSByaWdodF9s
ZW4pIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdC5sZW4gPSBsZWZ0X2xlbjsK
Pj4+Pj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2Vz
dC5ibGsgKz0gcHVuY2hfZW5kIC0gZXQtPmxhcmdlc3QuZm9mczsKPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBldC0+bGFyZ2VzdC5mb2ZzID0gcHVuY2hfZW5kOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGV0LT5sYXJnZXN0LmxlbiA9IHJpZ2h0X2xlbjsKPj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4g
K8KgwqDCoCBldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsKPj4+Pj4+IMKgIH0KPj4+Pj4+IMKg
IHZvaWQgZjJmc19pbml0X3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0Cj4+Pj4+PiBmb2xpbyAqaWZvbGlvKQo+Pj4+Pj4gQEAgLTY4MCwxMCArNjk3LDEwIEBAIHN0
YXRpYyB2b2lkCj4+Pj4+PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGRyb3AgbGFyZ2Vz
dCBleHRlbnQgYmVmb3JlIGxvb2t1cCwgaW4gY2FzZSBpdCdzIGFscmVhZHkKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogcHVuY2ggbGFyZ2VzdCBleHRlbnQgYmVmb3JlIGxvb2t1cCwgaW4gY2Fz
ZSBpdCdzIGFscmVhZHkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYmVlbiBzaHJ1bmsg
ZnJvbSBleHRlbnQgdHJlZQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZvZnMsIGxlbik7Cj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgX19wdW5jaF9sYXJnZXN0X2V4dGVudChldCwgZm9mcywgbGVuKTsK
Pj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAoZXQtPmxhcmdlc3QubGVu
ICE9IDAgJiYKPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+Pj4+Cj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Cj4gCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
