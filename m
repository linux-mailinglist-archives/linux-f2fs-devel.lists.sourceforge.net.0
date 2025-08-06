Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15CB1C286
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 10:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yf3LcGCTLClgN5C5sLnKds6aXeGIbPpYh65iS58WkM=; b=UlGhdsoAzMUL9KItNoojTHFsiS
	uFcc7AsFmN6Udk4YznhEQe4hF7AeYjzssiSPRnMlC6Llt1iRPP9q8Pr9jyhxi2WV6RE0kS+Ljomv/
	I2a3q5tDuEo1FLWeZQukH70QTKvaxXmF9nSZX0Z+8Fz2Q8qtrCcjWUVpQearCSpOdzKw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujZxJ-0007bz-UG;
	Wed, 06 Aug 2025 08:57:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1ujZx5-0007Y1-NC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RiBYQlkwyI6YP+54KrnQhReGbbfk/L/DXtW//Ouy8qI=; b=WOZ6Z7WLxcYUjGlW2Jhuql8hp1
 k4tO/mYUiD8QzmuQS1KeAQ7RMRdw5N/vglkQTfjM3DtPgrtHKuaWN/BCpDM+e17CfkgXpZ/97gBOG
 RJtqFWp8kjM9bknoMsl0trxyshVzpbqv0V0l2mfyZT59eBptaGRxEwVefpUhrZs6eexs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RiBYQlkwyI6YP+54KrnQhReGbbfk/L/DXtW//Ouy8qI=; b=eUqgR8PlOfeO6wkZqw/e5y0UAr
 oiPrgBrB15lD30KhPfG8rmrS+peGqT7x4rzPDk92XAiYaFQ/SJ1U+jNqQeLQ81YHEPNcEnVKlPrjV
 M9QmmIZD/XNDMT78oEbj1rgC57Qu+gSftiZ3oGZuPKWc7lO7p/6SeVzGd0aLQgKH9Yec=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujZx4-0004Rb-HB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9xqCSsq2lgGC/hBIO2DKbqB/OjeluCiD4iWAbOuTNd5qwrvlO0UzlByoITEUDwrdHvUtd7gCJcXbSjqPb3iANcEK9CdduExCev7X2Ax7mzpgTkxQSKP5Dj/Ty6D0e7CGyrw3TfoaKicQI77Y2UMMimlu09nXUp1s2yA4Vf65PtfJgJC1dMgLEmC20UMMsd7q1GCCKd9+NR2X0rnyK4BHA/+1dF+B2b17ooU6ulF4TxORQCG4q/HStva03HecajrcYApbVQTom+dhA15GSe0lMEpVlWCGAg8Q5/IuWrt5OA6AhEHESi4Y45hFJg2QsusrmYRO7qMwFPMg9m4EEnDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiBYQlkwyI6YP+54KrnQhReGbbfk/L/DXtW//Ouy8qI=;
 b=Roy8qGCKOBtsU6sz2xU4sZlVoNITw8nVfh6o8MnAMoT+KPqj8+xY+yadCJ6SJpLGjo9Xqw2E3NP0OV7Fq7NRLwCLgkrLcrHH13JblictpBy9p/fG3ZQWjIb0s4n6P4ZHHoNm2RIQU/aw130GpEryqimFeIKdFPJFMJ8+pUNfsdvmYq14a3Wga+xgQMTJR2syDJSivJs4NAcwUURGbR0R+as+ztRazGJ9B1+pS3mApQiuosZsePzA9NE9wLlYuUo15mKxVlPeI+qoZ52Ccz1K/KZpMC1PukwUigduzfBbhSr2cgv9w3S7XPq/Fp6REAA/tTsFe7VUdCLUolfgh41D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiBYQlkwyI6YP+54KrnQhReGbbfk/L/DXtW//Ouy8qI=;
 b=etFuy6EkCRAwF0HC6tjb6wVCm9eBs1Mu77V27g3hGkeT+IoqQR9LKf7k2m+QJue3Qf9THVFP+Nv9LVy5+WrfsyQfVz3wTsSu23d5Rj7X5tuNav5ZB0P/15rQSa1dNXLt96A0EX2SPuZDJXo+XYm1gsyQEUSi+ofZ9Ck9JqQirMGr32VLxlH1SsbrPFD+HWYU6XygZSox5VL6VOoJLfVFMRAd7jCeP45sL4Ygr8683WSZvJWoXjEVCbk7gCfGMUhfuo8Edow4vTG9pqbEy/GEqNJebMgRnUu0NAYeQUmfkW49ZRaDpBSezSTSEx0Kv+kW5C7aBRoErOY/CTcBaKZapg==
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by KL1PR0601MB5616.apcprd06.prod.outlook.com (2603:1096:820:9b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 08:56:33 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2%7]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 08:56:33 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chunhai Guo <guochunhai@vivo.com>
Thread-Topic: [PATCH v4] f2fs: add reserved nodes for privileged users
Thread-Index: AQHcAfDM8kPfZ6SYUUWrrljF9aem3rRL61YAgAAjfYCAB1E4AIAB/BSA
Date: Wed, 6 Aug 2025 08:56:32 +0000
Message-ID: <8a304530-83a9-4fb0-947b-49b9e33fb19a@vivo.com>
References: <20250731075731.628454-1-guochunhai@vivo.com>
 <13bec8f2-8482-44f5-a7c6-db7cbde5173b@kernel.org>
 <564db113-d910-4337-9581-ca59128dadc0@vivo.com> <aJFuinsBEdMeRbiN@google.com>
In-Reply-To: <aJFuinsBEdMeRbiN@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF5540628D6:EE_|KL1PR0601MB5616:EE_
x-ms-office365-filtering-correlation-id: e63368a3-a73d-4ff8-243c-08ddd4c7244d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aTF0T2MwK01ON3lhVW1hWk1HSjVubHpISVMrZk1XNHd6Q0wyYjI4NVFxVmE2?=
 =?utf-8?B?aGxnT2pzRGdGSTBqY3BBY21yMGs1a3JGbEp2bG9xY1VXQlNUQXdDc1d3UFVo?=
 =?utf-8?B?SkhEOGJKQy9HTzU4cGZQMnIxVlZBcDBHL21lMG9PcU5FS3Yxa1ZrS0JYUENY?=
 =?utf-8?B?WW4yVWIySTRqRkxEeCtJTVZTOEhwbjUzZmlvTFFsYSsrRkFtMDNKdHFVVXJK?=
 =?utf-8?B?SEp3dzVVU25YNEhXZUxpc3ZyVEtHNkQ1NkRDeS9GZ1B6RjF3OTZRbXpxSDEx?=
 =?utf-8?B?K2pmMGttMzRJL3NYNGIxM21WSWRNam05RmM0L3FUZnVqc1Q5clU3ZzhwcFIw?=
 =?utf-8?B?Q2tWM2htaVg1Q0dYWEtDUW9QU0lndkNkMElDWi9lVlFLMTBTU3p3eWN0Nk41?=
 =?utf-8?B?M3NsK0s0R1RuREx6NGJpTjVoc1BydlErQ3IyTWhqYnhVMU44Rll2U2FlYjV5?=
 =?utf-8?B?YTA3UVhuVTFPRDhoYyt1VE5jektmSlFBUGluS1Rna3JYOTVmaXdseTY1OHpy?=
 =?utf-8?B?aTY1Nkd1MVl6VDAvdjBTWG9aaTVaSjhSVEc0bVlOK0FnUDFVOEJ2YkxoUnd6?=
 =?utf-8?B?U3J4dkFmREtZc0xmckRLaHAyOWZ0eHFGNk50STExdlBjeUI2SGNwRTlpQXRp?=
 =?utf-8?B?K2VmUXQrWEkxQUFTczBBL1I4NmhwdXUvbmFSbXo1UHptdFF6MCtVYXQyTzlS?=
 =?utf-8?B?eEJmemFoRnlCRG45MUdhUzJVNHJnNXRnMmRMZlRMTEsyT2VodFNpeUF2dmhM?=
 =?utf-8?B?VFpCM3ROdkpOVHRPaFdsS1pIQ1JCS3J2VDRNVHhSSCtqOVZRdDJzeGJocXdh?=
 =?utf-8?B?MHpSKzYrRG85eVBqaWVQM3BqN0xCdDh6U0dPS2FwbUZNVC9nZGFjaWVtVHNM?=
 =?utf-8?B?eGlHT25lQTMybGJNNXZNZW8vaEtzOUF0azdZTjlRZTRHM2lBT2dIMU53SUpH?=
 =?utf-8?B?b212N25BVnRibXRzSWoxdXZtcjd4OStFeEhWV0NrMzNURDNwYUhHeHIyaWh6?=
 =?utf-8?B?dEZyV1B6eDZxSVBKRFFZSFFNWXJZWEhScFAveG1TcWpreUxsYUFJY3IySjBC?=
 =?utf-8?B?bkdWM25QcmRIV0l6eHcyQStDWUhsOVBKdlRzUFEzTlgxQWViQTVxVUlvdXND?=
 =?utf-8?B?d3ZGTEtRZmZLeXQvMUtsM053TnhuZUF5YVRBVDQ2VWp4M3dyMHBGMVRiY0hp?=
 =?utf-8?B?NmZlN1huNXJiWUVoenRWS3hUV0lENVF2SEwwc08wb2I1SmliRk1WZGE5S25J?=
 =?utf-8?B?OXFLYkdCemJnL2h2c0gvc25zR3E4OE5hNTFHZjVTaW1XME5vQWRlVU5IaFM0?=
 =?utf-8?B?M0FObVkvK2FUcXB4RFRPM08yR3N1cEZLeFpmTFZGODk1c2FKendkWk5oaUo0?=
 =?utf-8?B?WmVlVjZwMERvMi9wUDhWWlBsNHc1elhvL05KZWNTU0E1eFRsNTV4dkFGcWhi?=
 =?utf-8?B?Q0pkNkxVc0RCV3N3djZQT1djWGZkVy9JNTV4clI5Wko1T1V5U1hVVDlpL1JU?=
 =?utf-8?B?dzFGSWlkK3Q5NkJ3QXZOZkloQlpTOEdUYnhQUVhEVlF3aFhTbVFNMkJaTFds?=
 =?utf-8?B?alpKSUlWa2FDSEhwU0N6aFpDRVArclBhcFE2Q0poNEpUT09vckVpS1orZGpt?=
 =?utf-8?B?SUZDM2YzSE1tUjhvODR4dmMyWWpLTDVVdlZPWkl3RlA4K2tqSnZ3bzFmUmVJ?=
 =?utf-8?B?UEFiNTlhMm5tSWRXRGsxUTNoc1VrMUhuN1I2NVAxNnlrZCtqOUthYm1SemF6?=
 =?utf-8?B?bGVuOTJwczQ2bTdFZjlzUkM1bGVQTzdMTlRUeDNyREk5TlFDRFEvYUV3NnpR?=
 =?utf-8?B?N3NZU05CVlV1ejZCNFpUQ05vRlBtMVJod2Vzd0RQdnN1ZUk5THpzRHZxSVE5?=
 =?utf-8?B?TE9yNFlpN1JFNTl2YlFwTUF0T3Z6QWRxckRoekF0aG5VS1ZjbVVDT3JIRnh2?=
 =?utf-8?B?SExHcExMaTZYZFdoL1VWRUJvR2djbnc1Rld1d214K2V6Rzd0ak51Sjk4blpZ?=
 =?utf-8?Q?roWm/X1ubXUiMsI+m5G7WbJHxcdqBc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk80QmIwOW1DRTBGVmRvK2hvU21Ib3JvblJOOVN0YUtaTFdkUTVHVmMwQmI4?=
 =?utf-8?B?TTF5UnBDa2FKM3V4eG1LcjNDSmVLSUQvM1BQVllWMm9vUXJpbHRBd2VKZG8z?=
 =?utf-8?B?YThVZElkWXlJNzk5bm5FaGVPaWlZcXFjRldwUm1wZTR0VURiTUowNGpuaTZ4?=
 =?utf-8?B?ejFIRFJpMkdjUVZYWkl6OWxiOFVpOU9GbG5TUHVUVHUzckFheFY3ZEswZktI?=
 =?utf-8?B?UkE2eVE3K2psdGtIS3A2Q1ZKVFkybnlObmFEOTgrd1JpM0ZTbWdCYlE4K2cx?=
 =?utf-8?B?QzRHcjhkL2gxNFdZY3NFN3ltSWNvZzFCNnhpSHdOVWVMRGdlK2o2SmRNb0w5?=
 =?utf-8?B?Wkt4Q1h3RU9RY1pCZ3RtaXpzazliSXN2NUpKK3d4YVgxTE5oMCtXQzBYWnlZ?=
 =?utf-8?B?K045VE05d0wwYU5wdkpJZUYveFVsS3AyRDlPZkVhWjBmOUZ3WTRjMTdJUk9J?=
 =?utf-8?B?bnU0VlpGM3dmYnNlVUNZUFpTZW5PV1hmZEcvc0VrV2Q1MGhpeE83Y0lpNWJX?=
 =?utf-8?B?aFZ0WUVKZ0JkUE40K0gva2RKc0NZSlBxMGFqNk1FRVZ2dlRPVFFRZUFkOEJS?=
 =?utf-8?B?ODUzSXpXMFpacXRWSWV5QW5QVnhSR2x4bTRSZHJiVUZnckdQMVFyRHhQU3ha?=
 =?utf-8?B?aHZtVHBDYVBYNll3RUo2WmtWaGp1RWpXNWh1di8zZi82bXlZb0VlNVlDNFVi?=
 =?utf-8?B?WVNGaFJCaXRxZzh2NTJCZlRYVEJJUDRlYlJZQ1lsWjBxUm82WjZnS1VMRC9V?=
 =?utf-8?B?Nyt2QnlkRFlINEpHZklMbTU1TUU3VkdUendOZFRmVGpqSkRoSlhOSVZQc1hL?=
 =?utf-8?B?N3A3eDBMeUlCS1NKeEY1ODNUb2V3MU5GZHkrN29nTnBzamFuSmlYTVhhRU5C?=
 =?utf-8?B?ZUlFWklHRmFGTnJmYjdaQkFNTVNUQTFEZXBzeS81Z3g1QUp6R2NMYjdSRnFI?=
 =?utf-8?B?SVptS28wdzFMYU4wM1B3QkNBNXNwUkdUWFJuRFhKQjAwVUJQd2xCTUZuT3U3?=
 =?utf-8?B?VFJQNzBUZWtkOHlmR2RQR0s5SFg0L1F4czhvUmo0V2p5SzFuaitRUG4xYUdQ?=
 =?utf-8?B?alUzR1MrZHdtTzJUN0p1U1laN1Uxdk9rUzFDclhsTlQvSHBubit3eWRDUFFD?=
 =?utf-8?B?b0J2UFRPR002MXdoWGZFQk9vdTBsa2dLZWtBQndzUldsT1Y1d1hpazY0Z3E2?=
 =?utf-8?B?ZG1sQjZIMjlUK0J0dmYxN3pGcXdQaHNxZGQ0U0F3QXNuQVNPSStOM2R6eW85?=
 =?utf-8?B?cHBhRjhOZHlOb2sxbW1tbjEvM1FkZ0h3NGhRSTNmck9rSHYzc1plb0FNVnVD?=
 =?utf-8?B?aTUwby91amZ3eDA5Mlh1dng0cnVDcFVPRUpLQnJ5YzYwY2NsL0hVMjc3ZnUz?=
 =?utf-8?B?a3Y0S00zbC9HUnpGLzlzbm5RL1ZPNEppNVpDSTRqNUw1azcvRlRhaE9aZzd0?=
 =?utf-8?B?N2ZYMk5ValZKMmZkU2xVWndOT3RCVzR2RFhSNUZneCtxaWVZaEFmcHo2TStt?=
 =?utf-8?B?U2ZRMGIvYjNvSmNhVHRwVnErOUpKU0VGbWFTcGJTdkxodmdCOUFDbzU5dUtN?=
 =?utf-8?B?SVppbDJoeXRDaE5lU2VTWC8yeHpZcHZiZEljbkVNMkhiOVNGN0xWTVIvSzF1?=
 =?utf-8?B?ZDJPYytYdGVxZGg1V0RoaCt0NVUvQ1Q2djNrMi9Ddm1aV0xsK0w3dFRwejB0?=
 =?utf-8?B?c2pFK2NRelJ4WmpTYkhiWGxQOGpsY09walJSVzdaZ1pwN28wbzdHbjRCREM2?=
 =?utf-8?B?MFppZ0JVSk5oY2J0Tjl4NnRNQjdBTzRWUHBML29VUTlPYktnQ2ZYeUp2NmJU?=
 =?utf-8?B?bURoalRhakRhT2g0YlRYSk56dUU3d253VE9udE9KZklkRXFHV1N2bU9KeHVL?=
 =?utf-8?B?UlowSzBCcXpFR1U0TFpsYXJ0MEpGaTdlVGk4MlBTenlGYTBqY2NzakRCTGFQ?=
 =?utf-8?B?SzEzTGx5dERQQzBCRXVpSnFBN2lEc2FORFJocUliTFFvOFEwRGdXTmtxNlZ2?=
 =?utf-8?B?K1drQVZ6eWRRS20wMTF4ZUh3SnBtQ2p0K0tERC9ITTQyMzJmeE9pa2E4ODY1?=
 =?utf-8?B?RUM0MVU5aGpUL21RYUg4VHJwcDBYTGlsM0hWSUhPTG9SbFdZZTg3NWxVWWJm?=
 =?utf-8?Q?1CLY=3D?=
Content-ID: <70940510CB04BD43B45C7C4E77204F8C@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63368a3-a73d-4ff8-243c-08ddd4c7244d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 08:56:32.8515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lvMoItNL9+Ixzu4GlIuxeL05qvgb7xv4Ec/M0saz3gmdyDKVHIETK/R7cEao6x4MbXQPOBqJ74CpcC9oTF3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5616
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 8/5/2025 10:38 AM, Jaegeuk Kim 写道: > On 07/31, Chunhai
    Guo wrote: >> 在 7/31/2025 4:46 PM, Chao Yu 写道: >>> On 7/31/25 15:57,
    Chunhai Guo wrote: >>>> This patch allows privileged users to [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.51 listed in wl.mailspike.net]
X-Headers-End: 1ujZx4-0004Rb-HB
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add reserved nodes for privileged
 users
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDgvNS8yMDI1IDEwOjM4IEFNLCBKYWVnZXVrIEtpbSDlhpnpgZM6DQo+IE9uIDA3LzMxLCBD
aHVuaGFpIEd1byB3cm90ZToNCj4+IOWcqCA3LzMxLzIwMjUgNDo0NiBQTSwgQ2hhbyBZdSDlhpnp
gZM6DQo+Pj4gT24gNy8zMS8yNSAxNTo1NywgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+Pj4+IFRoaXMg
cGF0Y2ggYWxsb3dzIHByaXZpbGVnZWQgdXNlcnMgdG8gcmVzZXJ2ZSBub2RlcyB2aWEgdGhlDQo+
Pj4+ICdyZXNlcnZlX25vZGUnIG1vdW50IG9wdGlvbiwgd2hpY2ggaXMgc2ltaWxhciB0byB0aGUg
ZXhpc3RpbmcNCj4+Pj4gJ3Jlc2VydmVfcm9vdCcgb3B0aW9uLg0KPj4+Pg0KPj4+PiAiLW8gcmVz
ZXJ2ZV9ub2RlPTxOPiIgbWVhbnMgPE4+IG5vZGVzIGFyZSByZXNlcnZlZCBmb3IgcHJpdmlsZWdl
ZA0KPj4+PiB1c2VycyBvbmx5Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1
byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYzLT52NDogUmViYXNlIHRo
aXMgcGF0Y2ggb24gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI1
MDczMTA2MDMzOC4xMTM2MDg2LTEtY2hhb0BrZXJuZWwub3JnDQo+Pj4+IHYyLT52MzogQXBwbHkg
Q2hhbydzIHN1Z2dlc3Rpb24gZnJvbSB2Mi4NCj4+Pj4gdjEtPnYyOiBBZGQgdHdvIG1pc3Npbmcg
aGFuZGxpbmcgcGFydHMuDQo+Pj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1m
MmZzLWRldmVsLzIwMjUwNzI5MDk1MjM4LjYwNzQzMy0xLWd1b2NodW5oYWlAdml2by5jb20vDQo+
Pj4+IC0tLQ0KPj4+PiAgICBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IHwgIDkg
KysrKy0tLQ0KPj4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgICAgICAgIHwgMTQg
KysrKysrKy0tLQ0KPj4+PiAgICBmcy9mMmZzL3N1cGVyLmMgICAgICAgICAgICAgICAgICAgIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+Pj4+ICAgIDMgZmlsZXMgY2hhbmdl
ZCwgNTIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IGIvRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9mMmZzLnJzdA0KPj4+PiBpbmRleCAwM2IxZWZhNmQzYjIuLjk1ZGJjZDdhYzlh
OCAxMDA2NDQNCj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdA0K
Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0DQo+Pj4+IEBAIC0x
NzMsOSArMTczLDEyIEBAIGRhdGFfZmx1c2ggICAgICAgICAgICAgICBFbmFibGUgZGF0YSBmbHVz
aGluZyBiZWZvcmUgY2hlY2twb2ludCBpbiBvcmRlciB0bw0KPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIHBlcnNpc3QgZGF0YSBvZiByZWd1bGFyIGFuZCBzeW1saW5rLg0KPj4+PiAgICByZXNl
cnZlX3Jvb3Q9JWQgICAgICAgICAgICAgU3VwcG9ydCBjb25maWd1cmluZyByZXNlcnZlZCBzcGFj
ZSB3aGljaCBpcyB1c2VkIGZvcg0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGFsbG9jYXRp
b24gZnJvbSBhIHByaXZpbGVnZWQgdXNlciB3aXRoIHNwZWNpZmllZCB1aWQgb3INCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgIGdpZCwgdW5pdDogNEtCLCB0aGUgZGVmYXVsdCBsaW1pdCBpcyAw
LjIlIG9mIHVzZXIgYmxvY2tzLg0KPj4+PiAtcmVzdWlkPSVkICAgICAgICAgICAgVGhlIHVzZXIg
SUQgd2hpY2ggbWF5IHVzZSB0aGUgcmVzZXJ2ZWQgYmxvY2tzLg0KPj4+PiAtcmVzZ2lkPSVkICAg
ICAgICAgICAgVGhlIGdyb3VwIElEIHdoaWNoIG1heSB1c2UgdGhlIHJlc2VydmVkIGJsb2Nrcy4N
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdpZCwgdW5pdDogNEtCLCB0aGUgZGVmYXVsdCBs
aW1pdCBpcyAxMi41JSBvZiB1c2VyIGJsb2Nrcy4NCj4+Pj4gK3Jlc2VydmVfbm9kZT0lZCAgICAg
ICAgICAgICAgU3VwcG9ydCBjb25maWd1cmluZyByZXNlcnZlZCBub2RlcyB3aGljaCBhcmUgdXNl
ZCBmb3INCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGFsbG9jYXRpb24gZnJvbSBhIHByaXZp
bGVnZWQgdXNlciB3aXRoIHNwZWNpZmllZCB1aWQgb3INCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGdpZCwgdGhlIGRlZmF1bHQgbGltaXQgaXMgMTIuNSUgb2YgYWxsIG5vZGVzLg0KPj4+PiAr
cmVzdWlkPSVkICAgICAgICAgICAgVGhlIHVzZXIgSUQgd2hpY2ggbWF5IHVzZSB0aGUgcmVzZXJ2
ZWQgYmxvY2tzIGFuZCBub2Rlcy4NCj4+Pj4gK3Jlc2dpZD0lZCAgICAgICAgICAgIFRoZSBncm91
cCBJRCB3aGljaCBtYXkgdXNlIHRoZSByZXNlcnZlZCBibG9ja3MgYW5kIG5vZGVzLg0KPj4+PiAg
ICBmYXVsdF9pbmplY3Rpb249JWQgIEVuYWJsZSBmYXVsdCBpbmplY3Rpb24gaW4gYWxsIHN1cHBv
cnRlZCB0eXBlcyB3aXRoDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgc3BlY2lmaWVkIGlu
amVjdGlvbiByYXRlLg0KPj4+PiAgICBmYXVsdF90eXBlPSVkICAgICAgICAgICAgICAgU3VwcG9y
dCBjb25maWd1cmluZyBmYXVsdCBpbmplY3Rpb24gdHlwZSwgc2hvdWxkIGJlDQo+Pj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oDQo+Pj4+IGluZGV4IGViMzcy
YWYyMmVkYy4uYjk2NzZlZjE2MjQ2IDEwMDY0NA0KPj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaA0K
Pj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPj4+PiBAQCAtMTMxLDYgKzEzMSw3IEBAIGV4dGVy
biBjb25zdCBjaGFyICpmMmZzX2ZhdWx0X25hbWVbRkFVTFRfTUFYXTsNCj4+Pj4gICAgICogc3Ry
aW5nIHJhdGhlciB0aGFuIHVzaW5nIHRoZSBNU19MQVpZVElNRSBmbGFnLCBzbyB0aGlzIG11c3Qg
cmVtYWluLg0KPj4+PiAgICAgKi8NCj4+Pj4gICAgI2RlZmluZSBGMkZTX01PVU5UX0xBWllUSU1F
ICAgICAgICAgICAgICAgIDB4NDAwMDAwMDANCj4+Pj4gKyNkZWZpbmUgRjJGU19NT1VOVF9SRVNF
UlZFX05PREUgICAgICAgICAgICAgMHg4MDAwMDAwMA0KPj4+Pg0KPj4+PiAgICAjZGVmaW5lIEYy
RlNfT1BUSU9OKHNiaSkgICAoKHNiaSktPm1vdW50X29wdCkNCj4+Pj4gICAgI2RlZmluZSBjbGVh
cl9vcHQoc2JpLCBvcHRpb24pICAgICAoRjJGU19PUFRJT04oc2JpKS5vcHQgJj0gfkYyRlNfTU9V
TlRfIyNvcHRpb24pDQo+Pj4+IEBAIC0xNzIsNiArMTczLDcgQEAgc3RydWN0IGYyZnNfcndzZW0g
ew0KPj4+PiAgICBzdHJ1Y3QgZjJmc19tb3VudF9pbmZvIHsNCj4+Pj4gICAgICAgdW5zaWduZWQg
aW50IG9wdDsNCj4+Pj4gICAgICAgYmxvY2tfdCByb290X3Jlc2VydmVkX2Jsb2NrczsgICAvKiBy
b290IHJlc2VydmVkIGJsb2NrcyAqLw0KPj4+PiArICAgIGJsb2NrX3Qgcm9vdF9yZXNlcnZlZF9u
b2RlczsgICAgLyogcm9vdCByZXNlcnZlZCBub2RlcyAqLw0KPj4+PiAgICAgICBrdWlkX3Qgc19y
ZXN1aWQ7ICAgICAgICAgICAgICAgIC8qIHJlc2VydmVkIGJsb2NrcyBmb3IgdWlkICovDQo+Pj4+
ICAgICAgIGtnaWRfdCBzX3Jlc2dpZDsgICAgICAgICAgICAgICAgLyogcmVzZXJ2ZWQgYmxvY2tz
IGZvciBnaWQgKi8NCj4+Pj4gICAgICAgaW50IGFjdGl2ZV9sb2dzOyAgICAgICAgICAgICAgICAv
KiAjIG9mIGFjdGl2ZSBsb2dzICovDQo+Pj4+IEBAIC0yMzU1LDcgKzIzNTcsNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgZjJmc19oYXNfeGF0dHJfYmxvY2sodW5zaWduZWQgaW50IG9mcykNCj4+Pj4g
ICAgICAgcmV0dXJuIG9mcyA9PSBYQVRUUl9OT0RFX09GRlNFVDsNCj4+Pj4gICAgfQ0KPj4+Pg0K
Pj4+PiAtc3RhdGljIGlubGluZSBib29sIF9fYWxsb3dfcmVzZXJ2ZWRfYmxvY2tzKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwNCj4+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBfX2FsbG93X3Jlc2Vy
dmVkX3Jvb3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgY2FwKQ0KPj4+
PiAgICB7DQo+Pj4+ICAgICAgIGlmICghaW5vZGUpDQo+Pj4+IEBAIC0yMzgwLDcgKzIzODIsNyBA
QCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+Pj4gICAgICAgYXZhaWxfdXNlcl9ibG9ja19jb3Vu
dCA9IHNiaS0+dXNlcl9ibG9ja19jb3VudCAtDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2JpLT5jdXJyZW50X3Jlc2VydmVkX2Jsb2NrczsNCj4+Pj4NCj4+Pj4g
LSAgICBpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX1JPT1QpICYmICFfX2FsbG93X3Jlc2VydmVk
X2Jsb2NrcyhzYmksIGlub2RlLCBjYXApKQ0KPj4+PiArICAgIGlmICh0ZXN0X29wdChzYmksIFJF
U0VSVkVfUk9PVCkgJiYgIV9fYWxsb3dfcmVzZXJ2ZWRfcm9vdChzYmksIGlub2RlLCBjYXApKQ0K
Pj4+PiAgICAgICAgICAgICAgIGF2YWlsX3VzZXJfYmxvY2tfY291bnQgLT0gRjJGU19PUFRJT04o
c2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrczsNCj4+Pj4NCj4+Pj4gICAgICAgaWYgKHVubGlrZWx5
KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7DQo+Pj4+IEBAIC0yNzM4
LDcgKzI3NDAsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpbmNfdmFsaWRfbm9kZV9jb3VudChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBpc19pbm9kZSkNCj4+Pj4gICAgew0K
Pj4+PiAgICAgICBibG9ja190IHZhbGlkX2Jsb2NrX2NvdW50Ow0KPj4+PiAtICAgIHVuc2lnbmVk
IGludCB2YWxpZF9ub2RlX2NvdW50Ow0KPj4+PiArICAgIHVuc2lnbmVkIGludCB2YWxpZF9ub2Rl
X2NvdW50LCBhdmFpbF91c2VyX25vZGVfY291bnQ7DQo+Pj4+ICAgICAgIHVuc2lnbmVkIGludCBh
dmFpbF91c2VyX2Jsb2NrX2NvdW50Ow0KPj4+PiAgICAgICBpbnQgZXJyOw0KPj4+Pg0KPj4+PiBA
QCAtMjc2Nyw4ICsyNzY5LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IGluY192YWxpZF9ub2RlX2Nv
dW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+Pj4gICAgICAgICAgICAgICBnb3RvIGVu
b3NwYzsNCj4+Pj4gICAgICAgfQ0KPj4+Pg0KPj4+PiArICAgIGF2YWlsX3VzZXJfbm9kZV9jb3Vu
dCA9IHNiaS0+dG90YWxfbm9kZV9jb3VudCAtIEYyRlNfUkVTRVJWRURfTk9ERV9OVU07DQo+Pj4+
ICsgICAgaWYgKHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9OT0RFKSAmJg0KPj4+PiArICAgICAgICAg
ICAgICAgICAgICAhX19hbGxvd19yZXNlcnZlZF9yb290KHNiaSwgaW5vZGUsIGZhbHNlKSkNCj4+
PiBDaHVuaGFpLA0KPj4+DQo+Pj4gRG8gd2UgbmVlZCB0byBwYXNzIGNhcD10cnVlIHRvIF9fYWxs
b3dfcmVzZXJ2ZWRfcm9vdCgpPw0KPj4+DQo+Pj4gSW4gYWRkaXRpb24sIGRvIHdlIG5lZWQgdG8g
Y2hhbmdlIGNhcCBhcyB3ZWxsIGZvciBiZWxvdyBzdGF0ZW1lbnQ/DQo+Pj4NCj4+PiBhdmFpbF91
c2VyX2Jsb2NrX2NvdW50ID0gZ2V0X2F2YWlsYWJsZV9ibG9ja19jb3VudChzYmksIGlub2RlLCBm
YWxzZSk7DQo+Pg0KPj4gSGkgSmFlZ2V1aywNCj4+DQo+Pg0KPj4gQmFzZWQgb24gdGhlIGRlc2Ny
aXB0aW9uIGluIGNvbW1pdCBhOTBhMDg4NGFjNzUgKCJmMmZzOiBjaGVjaw0KPj4gY2FwX3Jlc291
cmNlIG9ubHkgZm9yIGRhdGEgYmxvY2tzIiksIGl0IHNlZW1zIHRoYXQgaW5vZGUgb3Igbm9kZSBi
bG9ja3MNCj4+IGRvbid0IG5lZWQgdG8gcGVyZm9ybSBhIGNoZWNrIG9uIHRoZSBjYXBfcmVzb3Vy
Y2UuIEknbSBub3QgY2VydGFpbiBhYm91dA0KPj4gdGhlIHJlYXNvbmluZyBiZWhpbmQgdGhpcy4g
Q291bGQgeW91IHBsZWFzZSBoZWxwIHRvIGNsYXJpZnkgaXQ/DQo+IEkgZG9uJ3QgcXVpdGUgcmVt
ZW1iZXIgYXMgSSBoYWQgdG8gZml4IHRoZSBzZWxpbnggaXNzdWUgbG9uZyBsb25nIHRpbWUgYWdv
Lg0KDQpHb3QgaXQuIEl0IHNlZW1zIGhhcmQgdG8gY2xhcmlmeSB0aGUgcmVhc29uIGJhY2sgdGhl
bi4NCg0KVGhhbmtzDQoNCj4+DQo+PiBUaGFua3MsDQo+Pg0KPj4+IFRoYW5rcywNCj4+Pg0KPj4+
PiArICAgICAgICAgICAgYXZhaWxfdXNlcl9ub2RlX2NvdW50IC09IEYyRlNfT1BUSU9OKHNiaSku
cm9vdF9yZXNlcnZlZF9ub2RlczsNCj4+Pj4gICAgICAgdmFsaWRfbm9kZV9jb3VudCA9IHNiaS0+
dG90YWxfdmFsaWRfbm9kZV9jb3VudCArIDE7DQo+Pj4+IC0gICAgaWYgKHVubGlrZWx5KHZhbGlk
X25vZGVfY291bnQgPiBzYmktPnRvdGFsX25vZGVfY291bnQpKSB7DQo+Pj4+ICsgICAgaWYgKHVu
bGlrZWx5KHZhbGlkX25vZGVfY291bnQgPiBhdmFpbF91c2VyX25vZGVfY291bnQpKSB7DQo+Pj4+
ICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnNiaS0+c3RhdF9sb2NrKTsNCj4+Pj4gICAgICAg
ICAgICAgICBnb3RvIGVub3NwYzsNCj4+Pj4gICAgICAgfQ0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jDQo+Pj4+IGluZGV4IDMwYzAzODQxMzA0MC4u
YTI0ZTg1NWEzOGVkIDEwMDY0NA0KPj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMNCj4+Pj4gKysr
IGIvZnMvZjJmcy9zdXBlci5jDQo+Pj4+IEBAIC0xNDMsNiArMTQzLDcgQEAgZW51bSB7DQo+Pj4+
ICAgICAgIE9wdF9leHRlbnRfY2FjaGUsDQo+Pj4+ICAgICAgIE9wdF9kYXRhX2ZsdXNoLA0KPj4+
PiAgICAgICBPcHRfcmVzZXJ2ZV9yb290LA0KPj4+PiArICAgIE9wdF9yZXNlcnZlX25vZGUsDQo+
Pj4+ICAgICAgIE9wdF9yZXNnaWQsDQo+Pj4+ICAgICAgIE9wdF9yZXN1aWQsDQo+Pj4+ICAgICAg
IE9wdF9tb2RlLA0KPj4+PiBAQCAtMjY1LDYgKzI2Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZnNfcGFyYW1ldGVyX3NwZWMgZjJmc19wYXJhbV9zcGVjc1tdID0gew0KPj4+PiAgICAgICBmc3Bh
cmFtX2ZsYWdfbm8oImV4dGVudF9jYWNoZSIsIE9wdF9leHRlbnRfY2FjaGUpLA0KPj4+PiAgICAg
ICBmc3BhcmFtX2ZsYWcoImRhdGFfZmx1c2giLCBPcHRfZGF0YV9mbHVzaCksDQo+Pj4+ICAgICAg
IGZzcGFyYW1fdTMyKCJyZXNlcnZlX3Jvb3QiLCBPcHRfcmVzZXJ2ZV9yb290KSwNCj4+Pj4gKyAg
ICBmc3BhcmFtX3UzMigicmVzZXJ2ZV9ub2RlIiwgT3B0X3Jlc2VydmVfbm9kZSksDQo+Pj4+ICAg
ICAgIGZzcGFyYW1fZ2lkKCJyZXNnaWQiLCBPcHRfcmVzZ2lkKSwNCj4+Pj4gICAgICAgZnNwYXJh
bV91aWQoInJlc3VpZCIsIE9wdF9yZXN1aWQpLA0KPj4+PiAgICAgICBmc3BhcmFtX2VudW0oIm1v
ZGUiLCBPcHRfbW9kZSwgZjJmc19wYXJhbV9tb2RlKSwNCj4+Pj4gQEAgLTMzNiw2ICszMzgsNyBA
QCBzdGF0aWMgbWF0Y2hfdGFibGVfdCBmMmZzX2NoZWNrcG9pbnRfdG9rZW5zID0gew0KPj4+PiAg
ICAjZGVmaW5lIEYyRlNfU1BFQ19kaXNjYXJkX3VuaXQgICAgICAgICAgICAgICAgICAgICAoMSA8
PCAyMSkNCj4+Pj4gICAgI2RlZmluZSBGMkZTX1NQRUNfbWVtb3J5X21vZGUgICAgICAgICAgICAg
ICAgICAgICAgKDEgPDwgMjIpDQo+Pj4+ICAgICNkZWZpbmUgRjJGU19TUEVDX2Vycm9ycyAgICAg
ICAgICAgICAgICAgICAoMSA8PCAyMykNCj4+Pj4gKyNkZWZpbmUgRjJGU19TUEVDX3Jlc2VydmVf
bm9kZSAgICAgICAgICAgICAgICAgICAgICAoMSA8PCAyNCkNCj4+Pj4NCj4+Pj4gICAgc3RydWN0
IGYyZnNfZnNfY29udGV4dCB7DQo+Pj4+ICAgICAgIHN0cnVjdCBmMmZzX21vdW50X2luZm8gaW5m
bzsNCj4+Pj4gQEAgLTQzNywyMiArNDQwLDMwIEBAIHN0YXRpYyB2b2lkIGYyZnNfZGVzdHJveV9j
YXNlZm9sZF9jYWNoZSh2b2lkKSB7IH0NCj4+Pj4NCj4+Pj4gICAgc3RhdGljIGlubGluZSB2b2lk
IGxpbWl0X3Jlc2VydmVfcm9vdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpDQo+Pj4+ICAgIHsN
Cj4+Pj4gLSAgICBibG9ja190IGxpbWl0ID0gbWluKChzYmktPnVzZXJfYmxvY2tfY291bnQgPj4g
MyksDQo+Pj4+ICsgICAgYmxvY2tfdCBibG9ja19saW1pdCA9IG1pbigoc2JpLT51c2VyX2Jsb2Nr
X2NvdW50ID4+IDMpLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgc2JpLT51c2VyX2Jsb2Nr
X2NvdW50IC0gc2JpLT5yZXNlcnZlZF9ibG9ja3MpOw0KPj4+PiArICAgIGJsb2NrX3Qgbm9kZV9s
aW1pdCA9IHNiaS0+dG90YWxfbm9kZV9jb3VudCA+PiAzOw0KPj4+Pg0KPj4+PiAgICAgICAvKiBs
aW1pdCBpcyAxMi41JSAqLw0KPj4+PiAgICAgICBpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX1JP
T1QpICYmDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9y
ZXNlcnZlZF9ibG9ja3MgPiBsaW1pdCkgew0KPj4+PiAtICAgICAgICAgICAgRjJGU19PUFRJT04o
c2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcyA9IGxpbWl0Ow0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzID4gYmxvY2tfbGltaXQp
IHsNCj4+Pj4gKyAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9j
a3MgPSBibG9ja19saW1pdDsNCj4+Pj4gICAgICAgICAgICAgICBmMmZzX2luZm8oc2JpLCAiUmVk
dWNlIHJlc2VydmVkIGJsb2NrcyBmb3Igcm9vdCA9ICV1IiwNCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2Nrcyk7DQo+Pj4+ICAg
ICAgIH0NCj4+Pj4gLSAgICBpZiAoIXRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9ST09UKSAmJg0KPj4+
PiArICAgIGlmICh0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9ERSkgJiYNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVzID4gbm9kZV9s
aW1pdCkgew0KPj4+PiArICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVk
X25vZGVzID0gbm9kZV9saW1pdDsNCj4+Pj4gKyAgICAgICAgICAgIGYyZnNfaW5mbyhzYmksICJS
ZWR1Y2UgcmVzZXJ2ZWQgbm9kZXMgZm9yIHJvb3QgPSAldSIsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVzKTsNCj4+Pj4gKyAg
ICB9DQo+Pj4+ICsgICAgaWYgKCF0ZXN0X29wdChzYmksIFJFU0VSVkVfUk9PVCkgJiYgIXRlc3Rf
b3B0KHNiaSwgUkVTRVJWRV9OT0RFKSAmJg0KPj4+PiAgICAgICAgICAgICAgICghdWlkX2VxKEYy
RlNfT1BUSU9OKHNiaSkuc19yZXN1aWQsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1ha2Vfa3VpZCgmaW5pdF91c2VyX25zLCBGMkZTX0RFRl9SRVNVSUQpKSB8fA0KPj4+PiAg
ICAgICAgICAgICAgICFnaWRfZXEoRjJGU19PUFRJT04oc2JpKS5zX3Jlc2dpZCwNCj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFrZV9rZ2lkKCZpbml0X3VzZXJfbnMsIEYyRlNf
REVGX1JFU0dJRCkpKSkNCj4+Pj4gLSAgICAgICAgICAgIGYyZnNfaW5mbyhzYmksICJJZ25vcmUg
c19yZXN1aWQ9JXUsIHNfcmVzZ2lkPSV1IHcvbyByZXNlcnZlX3Jvb3QiLA0KPj4+PiArICAgICAg
ICAgICAgZjJmc19pbmZvKHNiaSwgIklnbm9yZSBzX3Jlc3VpZD0ldSwgc19yZXNnaWQ9JXUgdy9v
IHJlc2VydmVfcm9vdCINCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIGFuZCBy
ZXNlcnZlX25vZGUiLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBmcm9tX2t1aWRfbXVu
Z2VkKCZpbml0X3VzZXJfbnMsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5zX3Jlc3VpZCksDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGZyb21fa2dpZF9tdW5nZWQoJmluaXRfdXNlcl9ucywNCj4+Pj4gQEAgLTg0MSw2
ICs4NTIsMTEgQEAgc3RhdGljIGludCBmMmZzX3BhcnNlX3BhcmFtKHN0cnVjdCBmc19jb250ZXh0
ICpmYywgc3RydWN0IGZzX3BhcmFtZXRlciAqcGFyYW0pDQo+Pj4+ICAgICAgICAgICAgICAgRjJG
U19DVFhfSU5GTyhjdHgpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzID0gcmVzdWx0LnVpbnRfMzI7DQo+
Pj4+ICAgICAgICAgICAgICAgY3R4LT5zcGVjX21hc2sgfD0gRjJGU19TUEVDX3Jlc2VydmVfcm9v
dDsNCj4+Pj4gICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICBjYXNlIE9wdF9yZXNlcnZl
X25vZGU6DQo+Pj4+ICsgICAgICAgICAgICBjdHhfc2V0X29wdChjdHgsIEYyRlNfTU9VTlRfUkVT
RVJWRV9OT0RFKTsNCj4+Pj4gKyAgICAgICAgICAgIEYyRlNfQ1RYX0lORk8oY3R4KS5yb290X3Jl
c2VydmVkX25vZGVzID0gcmVzdWx0LnVpbnRfMzI7DQo+Pj4+ICsgICAgICAgICAgICBjdHgtPnNw
ZWNfbWFzayB8PSBGMkZTX1NQRUNfcmVzZXJ2ZV9ub2RlOw0KPj4+PiArICAgICAgICAgICAgYnJl
YWs7DQo+Pj4+ICAgICAgIGNhc2UgT3B0X3Jlc3VpZDoNCj4+Pj4gICAgICAgICAgICAgICBGMkZT
X0NUWF9JTkZPKGN0eCkuc19yZXN1aWQgPSByZXN1bHQudWlkOw0KPj4+PiAgICAgICAgICAgICAg
IGN0eC0+c3BlY19tYXNrIHw9IEYyRlNfU1BFQ19yZXN1aWQ7DQo+Pj4+IEBAIC0xNDI0LDYgKzE0
NDAsMTQgQEAgc3RhdGljIGludCBmMmZzX2NoZWNrX29wdF9jb25zaXN0ZW5jeShzdHJ1Y3QgZnNf
Y29udGV4dCAqZmMsDQo+Pj4+ICAgICAgICAgICAgICAgY3R4X2NsZWFyX29wdChjdHgsIEYyRlNf
TU9VTlRfUkVTRVJWRV9ST09UKTsNCj4+Pj4gICAgICAgICAgICAgICBjdHgtPm9wdF9tYXNrICY9
IH5GMkZTX01PVU5UX1JFU0VSVkVfUk9PVDsNCj4+Pj4gICAgICAgfQ0KPj4+PiArICAgIGlmICh0
ZXN0X29wdChzYmksIFJFU0VSVkVfTk9ERSkgJiYNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
KGN0eC0+b3B0X21hc2sgJiBGMkZTX01PVU5UX1JFU0VSVkVfTk9ERSkgJiYNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgY3R4X3Rlc3Rfb3B0KGN0eCwgRjJGU19NT1VOVF9SRVNFUlZFX05PREUp
KSB7DQo+Pj4+ICsgICAgICAgICAgICBmMmZzX2luZm8oc2JpLCAiUHJlc2VydmUgcHJldmlvdXMg
cmVzZXJ2ZV9ub2RlPSV1IiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04o
c2JpKS5yb290X3Jlc2VydmVkX25vZGVzKTsNCj4+Pj4gKyAgICAgICAgICAgIGN0eF9jbGVhcl9v
cHQoY3R4LCBGMkZTX01PVU5UX1JFU0VSVkVfTk9ERSk7DQo+Pj4+ICsgICAgICAgICAgICBjdHgt
Pm9wdF9tYXNrICY9IH5GMkZTX01PVU5UX1JFU0VSVkVfTk9ERTsNCj4+Pj4gKyAgICB9DQo+Pj4+
DQo+Pj4+ICAgICAgIGVyciA9IGYyZnNfY2hlY2tfdGVzdF9kdW1teV9lbmNyeXB0aW9uKGZjLCBz
Yik7DQo+Pj4+ICAgICAgIGlmIChlcnIpDQo+Pj4+IEBAIC0xNjIzLDYgKzE2NDcsOSBAQCBzdGF0
aWMgdm9pZCBmMmZzX2FwcGx5X29wdGlvbnMoc3RydWN0IGZzX2NvbnRleHQgKmZjLCBzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiKQ0KPj4+PiAgICAgICBpZiAoY3R4LT5zcGVjX21hc2sgJiBGMkZTX1NQ
RUNfcmVzZXJ2ZV9yb290KQ0KPj4+PiAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkucm9v
dF9yZXNlcnZlZF9ibG9ja3MgPQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEYyRlNfQ1RYX0lORk8oY3R4KS5yb290X3Jlc2VydmVkX2Jsb2NrczsNCj4+Pj4gKyAg
ICBpZiAoY3R4LT5zcGVjX21hc2sgJiBGMkZTX1NQRUNfcmVzZXJ2ZV9ub2RlKQ0KPj4+PiArICAg
ICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVzID0NCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfQ1RYX0lORk8oY3R4KS5yb290
X3Jlc2VydmVkX25vZGVzOw0KPj4+PiAgICAgICBpZiAoY3R4LT5zcGVjX21hc2sgJiBGMkZTX1NQ
RUNfcmVzZ2lkKQ0KPj4+PiAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkuc19yZXNnaWQg
PSBGMkZTX0NUWF9JTkZPKGN0eCkuc19yZXNnaWQ7DQo+Pj4+ICAgICAgIGlmIChjdHgtPnNwZWNf
bWFzayAmIEYyRlNfU1BFQ19yZXN1aWQpDQo+Pj4+IEBAIC0yMzQyLDkgKzIzNjksMTEgQEAgc3Rh
dGljIGludCBmMmZzX3Nob3dfb3B0aW9ucyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwgc3RydWN0IGRl
bnRyeSAqcm9vdCkNCj4+Pj4gICAgICAgZWxzZSBpZiAoRjJGU19PUFRJT04oc2JpKS5mc19tb2Rl
ID09IEZTX01PREVfRlJBR01FTlRfQkxLKQ0KPj4+PiAgICAgICAgICAgICAgIHNlcV9wdXRzKHNl
cSwgImZyYWdtZW50OmJsb2NrIik7DQo+Pj4+ICAgICAgIHNlcV9wcmludGYoc2VxLCAiLGFjdGl2
ZV9sb2dzPSV1IiwgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7DQo+Pj4+IC0gICAgaWYg
KHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9ST09UKSkNCj4+Pj4gLSAgICAgICAgICAgIHNlcV9wcmlu
dGYoc2VxLCAiLHJlc2VydmVfcm9vdD0ldSxyZXN1aWQ9JXUscmVzZ2lkPSV1IiwNCj4+Pj4gKyAg
ICBpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX1JPT1QpIHx8IHRlc3Rfb3B0KHNiaSwgUkVTRVJW
RV9OT0RFKSkNCj4+Pj4gKyAgICAgICAgICAgIHNlcV9wcmludGYoc2VxLCAiLHJlc2VydmVfcm9v
dD0ldSxyZXNlcnZlX25vZGU9JXUscmVzdWlkPSV1LCINCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAicmVzZ2lkPSV1IiwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX2Jsb2NrcywNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfbm9kZXMs
DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyb21fa3VpZF9tdW5nZWQoJmlu
aXRfdXNlcl9ucywNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBG
MkZTX09QVElPTihzYmkpLnNfcmVzdWlkKSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZnJvbV9rZ2lkX211bmdlZCgmaW5pdF91c2VyX25zLA0KPj4NCg0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
