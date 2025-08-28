Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D64B392B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 06:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otaC3/vkIPpWRkFMvLiM7HCx4C+ENsPKlbpbRUIw3vI=; b=lRn+/bcW8n0aIu4QbWeGf/bA4m
	pdtWrNKGQ44TAcYtBaOD1CaDP1q6MA8c2/eqjyOZyahFfIAx7BTV1K5sLYpBUnT3SvAbXdRl6SQP5
	slwPUKWnE1UvbdO9kFMiAZbnP7RUvmLLsF2uA4B+JFgCkv5eg17XrtqVnU9NiXTEndlU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urUZs-0002iB-2k;
	Thu, 28 Aug 2025 04:49:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1urUZq-0002i2-1C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 04:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mULZ/aaNvTB7200kr9OzuqjWK0oGPpSBdY9zmIj5BLM=; b=KvfHQzxxqQ6FSvi72GuDJ+0DiR
 hsZZxTUWBfrcmYy152Wp7AHod7MNGuIV/bJ4b9/DdEZpy2055r1FWvqOjdabr2uEs6fN0lN2MMDhx
 6t3wQX3J0YPvsggSVJf7SoQDM+PLFs1JM/NbNviX4Ur00UeSXXTceXu7qPawI/Sg6ft8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mULZ/aaNvTB7200kr9OzuqjWK0oGPpSBdY9zmIj5BLM=; b=SJNEdxFIIFwfQn/9vx8ICKb1j1
 ltFncLqDohAO3Lepjceu88OrFZj94EJ37dD5JRp/R8oQbBmKNHc7s1siRDksz9iUrRygvlTjwSWYz
 AbDRCYYBebK0BqYe4l6VNLgpiPQeaPauoKmLVItgnw0S5F5qvXH4I3pfilcTeaYcVUb0=;
Received: from mail-japaneastazon11013063.outbound.protection.outlook.com
 ([52.101.127.63] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urUZo-0003BY-6u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 04:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSZtsHENjk4sL+3gNLZ5eTWrt1v23kxhmGnKpigS9+m/LN8QZrtk7tCfJEYR6TCf3ubcob7zU0i5k0xx7YJYE+D3BiVxvaeTipIJ7RLLXB5Ej9jRIQgchuQq85Kw2bNxLn5vGFZtaFpK3CG5W8RzFaV89GfGHMQ3MD0y0Rt3d8BbyXDcQ7XzFsJZrY4Fx6XdaXuQUHwJjN+A0RmeiSlGVigMbS1VDRVEJbpnXyMF0owm0cj6+yPFZwmlvT+kcVyqs3tiGVxorYl74fNmWX9v/8QC/lqn9MtUYbeIos3eYS/YPklSu+cVwxnz4FbkZvLCvCtTwDyBb0mssEhji6ITug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mULZ/aaNvTB7200kr9OzuqjWK0oGPpSBdY9zmIj5BLM=;
 b=f54i32lZVYXCe8oozvLiXWB/mR9e9iHuUgBcSGgl5HXQw98n5MK2SaCA6G8Ws0DUhUHbBN9OCRbUQ6U2Zfaq6IiryHWGIV/h0tX6eNUzQkpbAxe+yf46C20ckw3Q2HV/riAEUhceN6pL2xXZzPfjSmKjMPQIOJn3LnsKQdwlovYToPp8ZKkTxvMR7eW3Xde2xJ+3VU77pMVil2An8+fWwrprYdwNjIL69d03xAPVesVbLbfWcfhydDE364cv0sRB8Us46dLeek5QfQUrHJqAobqZv+FJ1wtX5hn1V4jw3QNBNFc2Ld+CY9dPVSGTVk20kUeatMKSb2s0zv3ZvD8Jeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mULZ/aaNvTB7200kr9OzuqjWK0oGPpSBdY9zmIj5BLM=;
 b=A38CtbL1BhwdUc49Pw173zon2/cBf2zQpNKxsaMXXkFL3R/TmMhnzixRm0ffZpd1g32rM4Bw2wdcg4BR5DgKm9Oaa5O+3eFqAiiI0gXNCSZHUDoJv7+uq2zkrlaehEauWvENDOb9xIaPBuK6RrOanB1gb2rJVMliBBrb1xNAqruUtxZIhvOK0TZgtr+JrgDBXRDI1r30MyDgww0qIdxIHR4DJE+wby9m6rDgDuQGAqEK9vtC51GWoQiBiWZz4uGz4+fRS/oJxQCoTfUhJ2c/1qYC61HO67mz64ASZ+7g/FKyx+l3dzp6vMXu2GIjo8mNP2b/eNYM1a5QzGhnKqtizQ==
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SI6PR06MB7219.apcprd06.prod.outlook.com (2603:1096:4:253::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 04:49:18 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 04:49:18 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
Thread-Index: AQHcEae4/QBW+zQuskmLaGzt9Idjh7RypxMAgAGMrgCAAyNwgIAAM7YA
Date: Thu, 28 Aug 2025 04:49:18 +0000
Message-ID: <b38f1597-c32e-4651-b5aa-596ed4e61ef7@vivo.com>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
 <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
 <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
In-Reply-To: <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6845:EE_|SI6PR06MB7219:EE_
x-ms-office365-filtering-correlation-id: 1bf97ea1-34e2-4498-7be7-08dde5ee3f42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZGZEODVBLzhTbzE4UjM5RlV1eWZISHRiWSt3WGc5UE1KRC9FTFdzVXF5ZUlL?=
 =?utf-8?B?SnJDNDZEcEkxc3VZa096RHZXQmRwdUUrUGxIK2dnWGZad2d6ZWFqSUlPRDVN?=
 =?utf-8?B?bCtoeVhQeHNIV0NnK0dQaWdqSGRTY2xyMGJGTFVXK2xaOVNZRFljYTZuOXQv?=
 =?utf-8?B?Ry9ZOEJzRjZqNE5Ka2J0dlpmbnllZk5JZFAyYW5jcWdxS1ZkQXNLTXk2Z2dC?=
 =?utf-8?B?TmZTNG8wUUh6aEJ2VFYwT3J4a09tT01ET3k5THVtR1ZXY0ZJMjBKUVY5M3hO?=
 =?utf-8?B?Z00rbWVKTFBESFliQ28wSWxvcThiWmF0UE9GMGV3eEtqV29yR3M1eFdJWG01?=
 =?utf-8?B?c1dhT01YanZSelR2WHhINkFzUEZIQ3AxRldCR2I3Nll6UGVLdk4zMEc1ZytE?=
 =?utf-8?B?WldqQjJMZmQxbktFSGlMM3R3M01YZXhmMkh3T3VVaTFvZVoxMzFnekNmVkpX?=
 =?utf-8?B?YWpoR0ZIcmtkdEZIWHl1b1RycG04enpTWmZ5V2NQL0dPOU0vblVOUTkvcHR5?=
 =?utf-8?B?cGZZSTdSdUxhdGZwaUZvZkRTOEc0OFNucm11N1IvSllGZVF3M1lub1B1cFZM?=
 =?utf-8?B?UGUyTThjc2tmazQ5TmVpbUNrTGpheHBoREhsVjF6Nk1XT2FGWUZCZzh1ZExm?=
 =?utf-8?B?TE5wSktHRmF5MU5wUnRUd3NGdFZJTWJNWU1YY2ZoTEVUcHJXTTFmcm12elpB?=
 =?utf-8?B?elRkbXlLZjRTbDArRUpKc0RIeDk5UVZtL2RkNE9kWWZXQmtTR01SZzlNM1pP?=
 =?utf-8?B?c1B0M3hVNS90KzZ6dFRnNFh1cm1jV0pybWozTENISFBkNjA3VGZwZUwydmRt?=
 =?utf-8?B?eGh4OHVZUFVPb2FwVDJaNnFhQWM1N1ZwQ3VSUUtPTWpQdUVJOXY5UitpeW1z?=
 =?utf-8?B?ZzZLVUYvY3RQUXZ6cU1jbEJrSU1Xb2ZlT2ZNb295TUJvRlZCTytDeHF6NzVB?=
 =?utf-8?B?elpPeXNDS3JkL0ZmRWlSOVJ0NXc3RmM3T0JmSFpJNlVESHlRYlZlY0l6WExP?=
 =?utf-8?B?YS9WdmRnV3ZOc1NHUHJNNWE0K1dBSW52MUxDVGdiLzd4MTZoRUhkWDR3ZWNo?=
 =?utf-8?B?aGVHNW1WWEE3dzZONlZZVFNTNmtONWVjMEFvbTdyclU0eFEyNm1xRjU1aEdz?=
 =?utf-8?B?Z01QdXQ5ZWNlU0ViZmFHdjRlMGVlTEtyMHVRVUgxdVFhT0w3eXRxT3NYVXp5?=
 =?utf-8?B?aTZnaWh3b05ITjBYblNHTGJHU2QvR25PRTB0b3NMY0d2U0RLWGRhczZCa3Nm?=
 =?utf-8?B?cVFGYUxvL1NNbWNtKzJFbFJocmFXN2ZJZG0wbi9nNXVaYWk3NTJySzJURlpW?=
 =?utf-8?B?Vjc3SXNVRXdMTm9QTVpFa0ZjY1lwekVFRlpIZkxqVE1IY3MxOWRXUHpEejdB?=
 =?utf-8?B?dDFDSUNVTTJYM3htSVpTWng4RVVuZENydDJBWjVsV3B6RDcvUzVudktNdkpI?=
 =?utf-8?B?VFYrYnBnK2g4cklCSnpDaHJ4T0REMVZOU2RpZFhZSlBXakpnL2ZlWjlVeGxo?=
 =?utf-8?B?Vk51b29wQmhvVTJ6dE43Y0FWUjY0SFFxVHI2UUQ4NFJrN1hZendPc1NtRmVw?=
 =?utf-8?B?VGhTcVA4ZmxoRnhra3h2TFJGeWJKczl1bENnNkJsMXM3UjNnblhJcHpWYTNx?=
 =?utf-8?B?QlY2L0lHWEMxTDZ3QmFWNDZudHk3K1p5dTE1SjBrRlRhb3dtMmZGRGVUWnNQ?=
 =?utf-8?B?VWV5Z3Q2UXNxL0JBdE5lSVlIekZDbnNhamhBRzNmZHFQMHZSeXhlT2hpaFg4?=
 =?utf-8?B?TVpSMkczOFVZQ0dDbWt2cG44K3RUcFlkVzFGdzMybVBDU1I5SEVpYzRlYXcy?=
 =?utf-8?B?c3VlQlZjTStzaGpwSjhiZzJYajN4NVFxd21DbHI5MXhhS1RlUGFzcTZaZkhz?=
 =?utf-8?B?SnVuNWpHNW05ZW12cEJKa0FObHkzY2Z1QmVTMXdBNXkyeWo4L3NJMmtjSHhX?=
 =?utf-8?B?VjFkWDYrSnhGMUNKcGdOSVUrdnp5OGV4QVpmL3JKSHEzWXVFV0VIUXcrMjZL?=
 =?utf-8?B?RGROMFF4Mm5BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTNlUVdWT2hkYkViQk9taFhOMkc2K2VPYXE0YVl0U3FPWjZpQTdUcSt0QUp0?=
 =?utf-8?B?SkRQK0xaOW45VVYweVJCR21rNTN1aWFoMjV1SGwvYU1KeG51dGI3ME8valNE?=
 =?utf-8?B?Y2JmQk1sWHNSdDErblVpVndhY3UrdFR6azVrSnZOOEd2NElINXJXMExqYzdO?=
 =?utf-8?B?dUZmTGhjeHR2L0ZoeGtUbUsvUWhOaDVTSVZWcDlrYWE5SXlTa0duNXB3bllE?=
 =?utf-8?B?Vm5Lb2hRUDZUa0dPL1ZybktpQVBQd3o2OEVhRmx5d0p5U3lKdkE0cm9ZdEF0?=
 =?utf-8?B?dlUxY2tRQnZNdkxCR1N1NThLYkZpTXc2MUF1cG1ndHlWcEdhb0NVUDdrQWhK?=
 =?utf-8?B?eEQwcG1XclVRRXFYVDZPbFUxUnZadTgvVkV5T0gzR3BMa054UmFrMU1qaDFr?=
 =?utf-8?B?M0liSGxDRjdhbUNSekMwbTZGejRhTFFzeTM2OGZ4bEh4QTVZK3FyanR0MXQ4?=
 =?utf-8?B?R3JxYm1vQTZ5Nkx6UmNyWnVhZkthdlN4V3JobmVPYmpuNlhIZzlSbjQ3NU96?=
 =?utf-8?B?VzNvdC82UEs0ckNmbUp5cFBsWlp1OWgxSW1ieFRRN1o3eHcxcHBYbnUycGs5?=
 =?utf-8?B?RXhkbFZxd0lRSmhQNFZpelAyTlJZbVN1UXR0TkJ4aU1payt6cXJFYkZYTWRo?=
 =?utf-8?B?bWdlOFc5a1BoTjI1djBQNUdjMXpWSTVYcURFL29seG83eWZERi83YmIrcUlz?=
 =?utf-8?B?aVBwWDh3Y2hLOTBZUXNNY0hPbDl3amJ3SWV5RTlYUTFEQ0xjK2RyRnhnM1FT?=
 =?utf-8?B?Vi9XV2czYnkxT3NvMmdPRmZwVGlTbUJ1UDFpVmhWa3ZkSjJva0p4d3JQeVBC?=
 =?utf-8?B?RkF3K1Z6c3VXT2JRSzhDRVJxcGxPOVdjMXRUN0tBczFSaGxKSVREbjB3V0U4?=
 =?utf-8?B?TmVrOGVYdTR6OG5DN1BPT2RzYW5qcG5mQVh2TmxHS2xlWGZUeHd1WmpwdFdt?=
 =?utf-8?B?eEZ2ZXVreE11YmVuWjErQXk5aHI0WXhOY3ZmbVIxaENjUlNFSnB2bzJIVnNr?=
 =?utf-8?B?YmVUR1k2UXd0QnE4d1JZclNyUUVNVjVtZ1RPT2d0MEhwUURwWW1sbHQxcElB?=
 =?utf-8?B?Q3d2SFBhcm13dWV3OFN3cDROWWI3NXl4SWRQem9wemltRW5GV2FYSkZYcTJE?=
 =?utf-8?B?WEFFbjBubVEvRldRMk12R0IwazM1S0ZJd0VOQ1NrWGh5cVVpMUNRK0JDOWNj?=
 =?utf-8?B?b3FoaTFkMEJiQlVoc2lqMXluMjdzMGRRNUw4cVExbVFOTE51c2pPNGZ3OEdY?=
 =?utf-8?B?OFkvUm5EdXJJSytWYlRDVHNXOUdRZ1BtcVNvYlV6NEp2MUpaSjN0L2Q1YzRq?=
 =?utf-8?B?a1NubGJTNllEdk9ySWZuaVFoMUZiYmx6b05LT0hDam13Z3hHQ3ZLdkNteGxQ?=
 =?utf-8?B?MnNJUHJGSFBDbkZxZENjc0srSzJSTm1IcDRvQ0hlNHBPN0h0eHV0ZWlhWmdO?=
 =?utf-8?B?OHlzZGIxOHBOZm5KbmdPYzh3cjRsb1BTY3luUkRvSnhPOHdUanVWcW4xMVpF?=
 =?utf-8?B?SW5hdXBLS2F1bEpXYS9YWFhKa2NSb2J4UTdVVExmMlA1YmJsR0NDY2h2VTky?=
 =?utf-8?B?MFhaVHRhTUFXU0pkSUgxMUNTV3R3VFhMaTJ3bWhmN3p1UzE3NllEQW9RY3ky?=
 =?utf-8?B?SFRwUytBazdxbG1vMFZRN0YxbXFIUVRIYU4vYkUyTC9GOVoyN1UzV0srblV2?=
 =?utf-8?B?ZUxBaDJjUEtqVzhBS0ZRdmJaa1dYVHFHZ3BqSmhKckZ1cGFmUS9oMlFNUXJh?=
 =?utf-8?B?ZEFIWk1uQ1FSU0NxdmVWLzZ4enVLNDV3Sy90bGUwRVFjaGlYOXE3cUhlZDRL?=
 =?utf-8?B?M1Z3ckdiM3JJd1hKY1dLcEVXbDlMWjdpVC9sWlZGVzRzVTY2d2NyRU9LT0cz?=
 =?utf-8?B?Z0pYdlpxY2JOUWtrUDk1UzFwdmIwc2MxNWtMd2dWcWk2YXNoT0M4WDRKTGJr?=
 =?utf-8?B?NEFMUjVZT3ZlcDM5MjA0Vy9XdkoxdE4xNnMxMEcrL0lqNmZjdVBhVVVveEQw?=
 =?utf-8?B?aFRLZ0RTeEZveUN3WDBiZ2U3by9vQWtKajZ0aVIxbVBCQVRNczFKNW5QUkQw?=
 =?utf-8?B?bjQ5SkFmcEdmWXhPd2d0L1dVUmhwVmpJNVg1WkJYNXFJR0lIVDc0SlBBUG5y?=
 =?utf-8?Q?oW0k=3D?=
Content-ID: <E5CD458F63B0804D9918CDC11DE0C4AE@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf97ea1-34e2-4498-7be7-08dde5ee3f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 04:49:18.2550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJOqN9oouV1Wwpv+agixPpC6vsXlAVMDv0G567LwhrMG7UV9B0ws4SogETrZFAynesbyGg7GaoagR5KSj8yuxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7219
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 8/28/2025 9:44 AM, Chao Yu 写道: > On 8/26/25 09:48,
    王晓珺 wrote: >> 在 8/25/2025 10:08 AM, Chao Yu 写道: >>> On 8/20/25
    15:54, Wang Xiaojun wrote: >>>> This patch fixes missing space rec [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.127.63 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1urUZo-0003BY-6u
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
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
From: =?utf-8?B?546L5pmT54+6?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDgvMjgvMjAyNSA5OjQ0IEFNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gOC8yNi8yNSAwOTo0
OCwg546L5pmT54+6IHdyb3RlOg0KPj4g5ZyoIDgvMjUvMjAyNSAxMDowOCBBTSwgQ2hhbyBZdSDl
hpnpgZM6DQo+Pj4gT24gOC8yMC8yNSAxNTo1NCwgV2FuZyBYaWFvanVuIHdyb3RlOg0KPj4+PiBU
aGlzIHBhdGNoIGZpeGVzIG1pc3Npbmcgc3BhY2UgcmVjbGFtYXRpb24gZHVyaW5nIHRoZSByZWNv
dmVyeSBwcm9jZXNzLg0KPj4+Pg0KPj4+PiBJbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvcywgRjJG
UyBjYW5ub3QgcmVjbGFpbSB0cnVuY2F0ZWQgc3BhY2UuDQo+Pj4+IGNhc2UgMToNCj4+Pj4gd3Jp
dGUgZmlsZSBBLCBzaXplIGlzIDFHIHwgQ1AgfCB0cnVuY2F0ZSBBIHRvIDFNIHwgZnN5bmMgQSB8
IFNQTw0KPj4+Pg0KPj4+PiBjYXNlIDI6DQo+Pj4+IENQIHwgd3JpdGUgZmlsZSBBLCBzaXplIGlz
IDFHIHwgZnN5bmMgQSB8IHRydW5jYXRlIEEgdG8gMU0gfCBmc3luYyBBIHxTUE8NCj4+Pj4NCj4+
Pj4gRHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBGMkZTIHdpbGwgcmVjb3ZlciBmaWxlIEEs
DQo+Pj4+IGJ1dCB0aGUgMU0tMUcgc3BhY2UgY2Fubm90IGJlIHJlY2xhaW1lZC4NCj4+Pj4NCj4+
Pj4gQnV0IHRoZSBjb21iaW5hdGlvbiBvZiB0cnVuY2F0ZSBhbmQgZmFsbG9jIGNvbXBsaWNhdGVz
IHRoZSByZWNvdmVyeQ0KPj4+PiBwcm9jZXNzLg0KPj4+PiBGb3IgZXhhbXBsZSwgaW4gdGhlIGZv
bGxvd2luZyBzY2VuYXJpbzoNCj4+Pj4gd3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRydW5jYXRl
IDI1NksgfCBmYWxsb2MgLWsgMjU2SyAxTSB8IGZzeW5jIEEgfCBTUE8NCj4+Pj4gVGhlIGZhbGxv
YyAoMjU2SywgMU0pIG5lZWQgdG8gYmUgcmVjb3ZlcmVkIGFzIHByZS1hbGxvY2F0ZWQgc3BhY2Uu
DQo+Pj4+DQo+Pj4+IEhvd2V2ZXIgaW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpb3MsIHRoZSBzaXR1
YXRpb24gaXMgdGhlIG9wcG9zaXRlLg0KPj4+PiB3cml0ZSBmaWxlQSAyTSB8IGZzeW5jIHwgZmFs
bG9jIC1rIDJNIDEwTSB8IGZzeW5jIEEgfCB0cnVuY2F0ZSAyNTZLIHwNCj4+Pj4gZnN5bmMgQSB8
IFNQTw0KPj4+PiBJbiB0aGlzIHNjZW5hcmlvLCB0aGUgc3BhY2UgYWxsb2NhdGVkIGJ5IGZhbGxv
YyBuZWVkcyB0byBiZSB0cnVuY2F0ZWQuDQo+Pj4+DQo+Pj4+IER1cmluZyB0aGUgcmVjb3Zlcnkg
cHJvY2VzcywgaXQgaXMgZGlmZmljdWx0IHRvIGRpc3Rpbmd1aXNoDQo+Pj4+IGJldHdlZW4gdGhl
IGFib3ZlIHR3byB0eXBlcyBvZiBmYWxsb2MuDQo+Pj4+DQo+Pj4+IFNvIGluIHRoaXMgY2FzZSBv
ZiBmYWxsb2MgLWsgd2UgbmVlZCB0byB0cmlnZ2VyIGEgY2hlY2twb2ludCBmb3IgZnN5bmMuDQo+
Pj4+DQo+Pj4+IEZpeGVzOiBkNjI0Yzk2ZmIzMjQ5ICgiZjJmczogYWRkIHJlY292ZXJ5IHJvdXRp
bmVzIGZvciByb2xsLWZvcndhcmQiKQ0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFhp
YW9qdW4gPHdhbmd4aWFvanVuQHZpdm8uY29tPg0KPj4+PiAtLS0NCj4+Pj4gdjQ6IFRyaWdnZXIg
Y2hlY2twb2ludCBmb3IgZnN5bmMgYWZ0ZXIgZmFsbG9jIC1rDQo+Pj4+IHYzOiBBZGQgYSBGaXhl
cyBsaW5lLg0KPj4+PiB2MjogQXBwbHkgQ2hhbydzIHN1Z2dlc3Rpb24gZnJvbSB2MS4gTm8gbG9n
aWNhbCBjaGFuZ2VzLg0KPj4+PiB2MTogRml4IG1pc3Npbmcgc3BhY2UgcmVjbGFtYXRpb24gZHVy
aW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLg0KPj4+PiAtLS0NCj4+Pj4gICAgZnMvZjJmcy9jaGVj
a3BvaW50LmMgfCAgMyArKysNCj4+Pj4gICAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgMyArKysN
Cj4+Pj4gICAgZnMvZjJmcy9maWxlLmMgICAgICAgfCAgOCArKysrKystLQ0KPj4+PiAgICBmcy9m
MmZzL3JlY292ZXJ5LmMgICB8IDE4ICsrKysrKysrKysrKysrKysrLQ0KPj4+PiAgICA0IGZpbGVz
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jDQo+
Pj4+IGluZGV4IGRiMzgzMWY3ZjJmNS4uNzc1ZTMzMzMwOTdlIDEwMDY0NA0KPj4+PiAtLS0gYS9m
cy9mMmZzL2NoZWNrcG9pbnQuYw0KPj4+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYw0KPj4+
PiBAQCAtMTE1MSw2ICsxMTUxLDkgQEAgc3RhdGljIGludCBmMmZzX3N5bmNfaW5vZGVfbWV0YShz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpDQo+Pj4+ICAgIAkJaWYgKGlub2RlKSB7DQo+Pj4+ICAg
IAkJCXN5bmNfaW5vZGVfbWV0YWRhdGEoaW5vZGUsIDApOw0KPj4+PiAgICANCj4+Pj4gKwkJCWlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSkpDQo+Pj4+ICsJ
CQkJY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSk7DQo+Pj4+ICsN
Cj4+Pj4gICAgCQkJLyogaXQncyBvbiBldmljdGlvbiAqLw0KPj4+PiAgICAJCQlpZiAoaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKSkNCj4+Pj4gICAgCQkJCWYyZnNfdXBk
YXRlX2lub2RlX3BhZ2UoaW5vZGUpOw0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmgg
Yi9mcy9mMmZzL2YyZnMuaA0KPj4+PiBpbmRleCA0NmJlNzU2MDU0OGMuLmY1YTU0YmM4NDhkNSAx
MDA2NDQNCj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZz
LmgNCj4+Pj4gQEAgLTQ1OSw2ICs0NTksNyBAQCBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgew0K
Pj4+PiAgICAJc3RydWN0IGlub2RlICppbm9kZTsJLyogdmZzIGlub2RlIHBvaW50ZXIgKi8NCj4+
Pj4gICAgCWJsb2NrX3QgYmxrYWRkcjsJLyogYmxvY2sgYWRkcmVzcyBsb2NhdGluZyB0aGUgbGFz
dCBmc3luYyAqLw0KPj4+PiAgICAJYmxvY2tfdCBsYXN0X2RlbnRyeTsJLyogYmxvY2sgYWRkcmVz
cyBsb2NhdGluZyB0aGUgbGFzdCBkZW50cnkgKi8NCj4+Pj4gKwlsb2ZmX3QgbWF4X2lfc2l6ZTsJ
LyogcHJldmlvdXMgbWF4IGZpbGUgc2l6ZSBmb3IgdHJ1bmNhdGUgKi8NCj4+Pj4gICAgfTsNCj4+
Pj4gICAgDQo+Pj4+ICAgICNkZWZpbmUgbmF0c19pbl9jdXJzdW0oam5sKQkJKGxlMTZfdG9fY3B1
KChqbmwpLT5uX25hdHMpKQ0KPj4+PiBAQCAtODM1LDYgKzgzNiw3IEBAIGVudW0gew0KPj4+PiAg
ICAJRklfQVRPTUlDX1JFUExBQ0UsCS8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovDQo+Pj4+
ICAgIAlGSV9PUEVORURfRklMRSwJCS8qIGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICov
DQo+Pj4+ICAgIAlGSV9ET05BVEVfRklOSVNIRUQsCS8qIGluZGljYXRlIHBhZ2UgZG9uYXRpb24g
b2YgZmlsZSBoYXMgYmVlbiBmaW5pc2hlZCAqLw0KPj4+PiArCUZJX0ZBTExPQ19LRUVQX1NJWkUs
CS8qIGZpbGUgYWxsb2NhdGUgcmVzZXJ2ZWQgc3BhY2UgYW5kIGtlZXAgc2l6ZSAqLw0KPj4+PiAg
ICAJRklfTUFYLAkJCS8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovDQo+Pj4+ICAgIH07DQo+
Pj4+ICAgIA0KPj4+PiBAQCAtMTE5Myw2ICsxMTk1LDcgQEAgZW51bSBjcF9yZWFzb25fdHlwZSB7
DQo+Pj4+ICAgIAlDUF9TUEVDX0xPR19OVU0sDQo+Pj4+ICAgIAlDUF9SRUNPVkVSX0RJUiwNCj4+
Pj4gICAgCUNQX1hBVFRSX0RJUiwNCj4+Pj4gKwlDUF9GQUxMT0NfRklMRSwNCj4+Pj4gICAgfTsN
Cj4+Pj4gICAgDQo+Pj4+ICAgIGVudW0gaW9zdGF0X3R5cGUgew0KPj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYw0KPj4+PiBpbmRleCA0MmZhYWVkNmEwMmQu
LmYwODIwZjgxNzgyNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMNCj4+Pj4gKysr
IGIvZnMvZjJmcy9maWxlLmMNCj4+Pj4gQEAgLTIzNiw2ICsyMzYsOCBAQCBzdGF0aWMgaW5saW5l
IGVudW0gY3BfcmVhc29uX3R5cGUgbmVlZF9kb19jaGVja3BvaW50KHN0cnVjdCBpbm9kZSAqaW5v
ZGUpDQo+Pj4+ICAgIAllbHNlIGlmIChmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNf
SShpbm9kZSktPmlfcGlubywNCj4+Pj4gICAgCQkJCQkJCVhBVFRSX0RJUl9JTk8pKQ0KPj4+PiAg
ICAJCWNwX3JlYXNvbiA9IENQX1hBVFRSX0RJUjsNCj4+Pj4gKwllbHNlIGlmIChpc19pbm9kZV9m
bGFnX3NldChpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSkpDQo+Pj4+ICsJCWNwX3JlYXNvbiA9
IENQX0ZBTExPQ19GSUxFOw0KPj4+PiAgICANCj4+Pj4gICAgCXJldHVybiBjcF9yZWFzb247DQo+
Pj4+ICAgIH0NCj4+Pj4gQEAgLTE5NTMsMTAgKzE5NTUsMTIgQEAgc3RhdGljIGludCBmMmZzX2V4
cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsDQo+Pj4+
ICAgIAl9DQo+Pj4+ICAgIA0KPj4+PiAgICAJaWYgKG5ld19zaXplID4gaV9zaXplX3JlYWQoaW5v
ZGUpKSB7DQo+Pj4+IC0JCWlmIChtb2RlICYgRkFMTE9DX0ZMX0tFRVBfU0laRSkNCj4+Pj4gKwkJ
aWYgKG1vZGUgJiBGQUxMT0NfRkxfS0VFUF9TSVpFKSB7DQo+Pj4+ICsJCQlzZXRfaW5vZGVfZmxh
Zyhpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSk7DQo+Pj4gWGlhb2p1biwNCj4+Pg0KPj4+IFdl
bGwsIHdoYXQgYWJvdXQgdGhpcyBjYXNlPw0KPj4+DQo+Pj4gZmFsbG9jIC1rIG9mcyBzaXplIGZp
bGUNCj4+PiBmbHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEgb2YgZmlsZQ0KPj4gSGkgQ2hhbywN
Cj4+IEZsdXNoIGFsbCBkYXRhIGFuZCBtZXRhZGF0YSBvZiBmaWxlLCBidXQgd2l0aG91dCB1c2lu
ZyBmc3luYyBvciBDUD8NCj4gWGlhb2p1biwNCj4NCj4gSSB0aGluayBzbywgb3IgYW0gSSBtaXNz
aW5nIHNvbWV0aW5nPw0KPg0KPiBUaGFua3MsDQoNCkhpIENoYW8sDQpJIHRoaW5rIHRoaXMgY2Fz
ZSBpcyBwb3NzaWJsZS4gVGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhpcyBpc3N1ZS4NCkkg
d2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KDQo+PiBUaGFua3Ms
DQo+Pg0KPj4+IGV2aWN0IGlub2RlDQo+Pj4gd3JpdGUgZmlsZSAmIGZzeW5jIGZpbGUgd29uJ3Qg
dHJpZ2dlciBhIGNoZWNrcG9pbnQ/DQo+Pj4NCj4+PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5n
Pw0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+DQo+Pj4+ICAgIAkJCWZpbGVfc2V0X2tlZXBfaXNpemUo
aW5vZGUpOw0KPj4+PiAtCQllbHNlDQo+Pj4+ICsJCX0gZWxzZSB7DQo+Pj4+ICAgIAkJCWYyZnNf
aV9zaXplX3dyaXRlKGlub2RlLCBuZXdfc2l6ZSk7DQo+Pj4+ICsJCX0NCj4+Pj4gICAgCX0NCj4+
Pj4gICAgDQo+Pj4+ICAgIAlyZXR1cm4gZXJyOw0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9y
ZWNvdmVyeS5jIGIvZnMvZjJmcy9yZWNvdmVyeS5jDQo+Pj4+IGluZGV4IDRjYjNhOTE4MDFiNC4u
NjhiNjJjOGE3NGQzIDEwMDY0NA0KPj4+PiAtLS0gYS9mcy9mMmZzL3JlY292ZXJ5LmMNCj4+Pj4g
KysrIGIvZnMvZjJmcy9yZWNvdmVyeS5jDQo+Pj4+IEBAIC05NSw2ICs5NSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmFkZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksDQo+Pj4+ICAgIAllbnRyeSA9IGYyZnNfa21lbV9jYWNoZV9hbGxvYyhmc3luY19l
bnRyeV9zbGFiLA0KPj4+PiAgICAJCQkJCUdGUF9GMkZTX1pFUk8sIHRydWUsIE5VTEwpOw0KPj4+
PiAgICAJZW50cnktPmlub2RlID0gaW5vZGU7DQo+Pj4+ICsJZW50cnktPm1heF9pX3NpemUgPSBp
X3NpemVfcmVhZChpbm9kZSk7DQo+Pj4+ICAgIAlsaXN0X2FkZF90YWlsKCZlbnRyeS0+bGlzdCwg
aGVhZCk7DQo+Pj4+ICAgIA0KPj4+PiAgICAJcmV0dXJuIGVudHJ5Ow0KPj4+PiBAQCAtNzk2LDYg
Kzc5Nyw3IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+Pj4gICAgCXdoaWxlICgxKSB7DQo+
Pj4+ICAgIAkJc3RydWN0IGZzeW5jX2lub2RlX2VudHJ5ICplbnRyeTsNCj4+Pj4gICAgCQlzdHJ1
Y3QgZm9saW8gKmZvbGlvOw0KPj4+PiArCQlsb2ZmX3QgaV9zaXplOw0KPj4+PiAgICANCj4+Pj4g
ICAgCQlpZiAoIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksIGJsa2FkZHIsIE1FVEFfUE9SKSkN
Cj4+Pj4gICAgCQkJYnJlYWs7DQo+Pj4+IEBAIC04MjgsNiArODMwLDkgQEAgc3RhdGljIGludCBy
ZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpp
bm9kZV9saXN0LA0KPj4+PiAgICAJCQkJYnJlYWs7DQo+Pj4+ICAgIAkJCX0NCj4+Pj4gICAgCQkJ
cmVjb3ZlcmVkX2lub2RlKys7DQo+Pj4+ICsJCQlpX3NpemUgPSBpX3NpemVfcmVhZChlbnRyeS0+
aW5vZGUpOw0KPj4+PiArCQkJaWYgKGVudHJ5LT5tYXhfaV9zaXplIDwgaV9zaXplKQ0KPj4+PiAr
CQkJCWVudHJ5LT5tYXhfaV9zaXplID0gaV9zaXplOw0KPj4+PiAgICAJCX0NCj4+Pj4gICAgCQlp
ZiAoZW50cnktPmxhc3RfZGVudHJ5ID09IGJsa2FkZHIpIHsNCj4+Pj4gICAgCQkJZXJyID0gcmVj
b3Zlcl9kZW50cnkoZW50cnktPmlub2RlLCBmb2xpbywgZGlyX2xpc3QpOw0KPj4+PiBAQCAtODQ0
LDggKzg0OSwxOSBAQCBzdGF0aWMgaW50IHJlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHN0cnVjdCBsaXN0X2hlYWQgKmlub2RlX2xpc3QsDQo+Pj4+ICAgIAkJfQ0KPj4+PiAg
ICAJCXJlY292ZXJlZF9kbm9kZSsrOw0KPj4+PiAgICANCj4+Pj4gLQkJaWYgKGVudHJ5LT5ibGth
ZGRyID09IGJsa2FkZHIpDQo+Pj4+ICsJCWlmIChlbnRyeS0+YmxrYWRkciA9PSBibGthZGRyKSB7
DQo+Pj4+ICsJCQlpX3NpemUgPSBpX3NpemVfcmVhZChlbnRyeS0+aW5vZGUpOw0KPj4+PiArCQkJ
aWYgKGVudHJ5LT5tYXhfaV9zaXplID4gaV9zaXplKSB7DQo+Pj4+ICsJCQkJZXJyID0gZjJmc190
cnVuY2F0ZV9ibG9ja3MoZW50cnktPmlub2RlLA0KPj4+PiArCQkJCQkJCWlfc2l6ZSwgZmFsc2Up
Ow0KPj4+PiArCQkJCWlmIChlcnIpIHsNCj4+Pj4gKwkJCQkJZjJmc19mb2xpb19wdXQoZm9saW8s
IHRydWUpOw0KPj4+PiArCQkJCQlicmVhazsNCj4+Pj4gKwkJCQl9DQo+Pj4+ICsJCQkJZjJmc19t
YXJrX2lub2RlX2RpcnR5X3N5bmMoZW50cnktPmlub2RlLCB0cnVlKTsNCj4+Pj4gKwkJCX0NCj4+
Pj4gICAgCQkJbGlzdF9tb3ZlX3RhaWwoJmVudHJ5LT5saXN0LCB0bXBfaW5vZGVfbGlzdCk7DQo+
Pj4+ICsJCX0NCj4+Pj4gICAgbmV4dDoNCj4+Pj4gICAgCQlyYV9ibG9ja3MgPSBhZGp1c3RfcG9y
X3JhX2Jsb2NrcyhzYmksIHJhX2Jsb2NrcywgYmxrYWRkciwNCj4+Pj4gICAgCQkJCQluZXh0X2Js
a2FkZHJfb2Zfbm9kZShmb2xpbykpOw0KPj4NCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
