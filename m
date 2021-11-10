Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A744BA5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Nov 2021 03:35:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkdSG-0000Oa-D1; Wed, 10 Nov 2021 02:35:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkdSF-0000OU-QC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DePR+Ed0I8nN2mA7uGbHddPk+A3zLHFgeq665ZFS6kc=; b=mHHAk980RUyh4IVrXYQEkZQuoe
 ntTU44VTRQ6s7P0krYE+jdLhW7LFocKIuRTT70k7LDz/SCVfkFdwscuEcAsmjcmLXaEwrwuLdbrW1
 q8M6xhoa4ozUTKjccv25PREyCY/NCJxoM3QzcDnt+w37VjPYLQQTkQBIPCvZBfKs7hfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DePR+Ed0I8nN2mA7uGbHddPk+A3zLHFgeq665ZFS6kc=; b=bfPYsrcCyjdsZBDRgo51hClPyC
 Ru6DOLbzK/FzSIyWbbIwwLsBfUwTJw5ubr3ZSn4RSXydF6C2eJpaRlp+unG7dM/OwVYJmdWM7PTTw
 v+KNIR9Aglofo2Q/TyTGkeVsVjmXIM/4QB6alLciN2xkAipzP++I6b868IgDVWveWwgw=;
Received: from mail-eopbgr1300112.outbound.protection.outlook.com
 ([40.107.130.112] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkdSC-0008V7-BM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8JKkgli8WBvfIRGtnGmGc821QhVjtvEqkZLAsILJeQ4meMy6EZ6L5VryRWAEaXY1ZU9u28P3615keZsmGjfelmzJkioTHJdfM+UmYWRjQVXL4nUsYIuSZjW1X/LnK+udj7mQDnY1zpc1Yq/d5yLo88Bl/ucZdq2wUZ7ptmjPV8sy7vzzEiNCAJ6dt2FYnhK05Cngy4UO9TzQgP1R4njZneoh0bwlhZd+/kUZdtK8Wi1zP8r9cy3dVUw5wTKqCZ/ITI8vOY0fFNR+ftovD1ruFGJ9qTvbKFlSwr5+RER5ft0HQtfv4cWAkIUt6fdsZQ3/A+W6PeuF2mY7neNNbd8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DePR+Ed0I8nN2mA7uGbHddPk+A3zLHFgeq665ZFS6kc=;
 b=mJJKHJe8Ib8WzyeYGH8d9pPPcVluORn9Rd2GFrC0r15skKTa9RAOnpraiOi3F1m5ZRZsqguDxTW8yBoeYOyJdWFFtmkMFvcmKtPDIry3NP8OEtgxRHlNMbs3VTrueOh5h0nSw6woYo3ywWznT7/r0FPWIwJ9C+rY+D3/Q3CEtcQfkCb2EIInHPXO65WdlvAewUhCKFg87+gOlwVeGJbr7+6haIRogOcg+Jowx7MXbz2Hbb9yGibcpZSVa3Uk0UWWrnmIyoxJyfdm2QCrDx/iM4P0aypYlNGAoWtXf/Zn3YOHlYMcJ/O0NSFZ8Bdq13ud6vz0rotw3HyStxA2f5mYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DePR+Ed0I8nN2mA7uGbHddPk+A3zLHFgeq665ZFS6kc=;
 b=K1AxBAOhXA/jyLhgHZOPvmCFUe9xXvDPpgb5tY0t0jzh/+unaHqNunPaQpD99awHLwDDUU1h6hJcp/cZWsoY2vQ+fmSZQHkMgqu3p/aMJDYNZoQizhxzU5E4l+2v47F/aJSbfBUnzcHcDr5vwdJptDbHIW0hlUKFowIxD78/4vA=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3861.apcprd06.prod.outlook.com (2603:1096:820:1a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 02:35:00 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 02:35:00 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: compress: reduce one page array alloc and free
 when write compressed page
Thread-Index: AQHX1R2d1cRDUFaUBkOxDhx3CAUs7Kv7POCAgADPcyA=
Date: Wed, 10 Nov 2021 02:34:59 +0000
Message-ID: <KL1PR0601MB4003B1F1D743572816552417BB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211109035408.260852-1-changfengnan@vivo.com>
 <ALIA-QAiE0UFErjRNaMLZaqL.9.1636467042061.Hmail.changfengnan@vivo.com>
In-Reply-To: <ALIA-QAiE0UFErjRNaMLZaqL.9.1636467042061.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67cc03c2-2892-489a-7051-08d9a3f2b14d
x-ms-traffictypediagnostic: KL1PR0601MB3861:
x-microsoft-antispam-prvs: <KL1PR0601MB3861B661957DDCE61A494E1BBB939@KL1PR0601MB3861.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zykk5ey2+erSjOcHx3MQcM0vfaOfvRUh4ZyFNjJtXWD1Zd6skAH4dCkU76JvJGroo0bt4Gd+1oOPoK3FDLYbySNaLWtQzT7I29k3VU3dkinO8uVWP6gTp3FiLUCW7ldpAH5K3xxTOcPmVeFWmZucD2iA2sEAc4DyH2fjOpGoGga5+msOKzCHS/XKKOsAWxVBFd0S1y7ZZuqD5eudm+Pgrw2o+N8NKS5NSCNI4NDCHAnGvoqGCxtBSeCLRIbn03YMRieMEwvV+ANr4x2TIjUgtkbcIgav3nwhpKF9DFuslnKHFk6/mpcXUNcWUBvmLfvr+usEeaBXIo3Uac1VkjnYXbUnVr08sJRh2hTbmO2xhk4rFcXh2wbwfULybHFQaaLirMPyGH7KdJU/t70BZIMbDcVyPGVTiCNZyGs+x1QFM5fxrLMZlNpDBhswtjrRIab2sXNE9bXvusPM1q5xWuEi8dF2BuyfNq7UI0/NYhw9sEwn8Twr5S53igcokTvfjuq8MzkrM2guo9gCMevxCJqo42WVxlhJv1X2TTeYfVPsHOK1aJhZyQdHHvezY2Du+qKBw9hnqg7610Rc6ah8JJCHc/wZQyKwBGPyc8dtZQZkW0zDe5PVRuDLwnWaXvHnj3PGWawyrn0DmFKfbrh1HrZD1i8kl37saYKOyctBGYvby7SU364sFQuzWz/NcqkQBYENjWavxUHZSvjCsfQzVKcSRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(186003)(66446008)(7696005)(66946007)(66476007)(71200400001)(66556008)(64756008)(122000001)(316002)(85182001)(6506007)(110136005)(4326008)(83380400001)(38100700002)(86362001)(53546011)(2906002)(508600001)(8676002)(8936002)(52536014)(33656002)(76116006)(5660300002)(9686003)(55016002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1VKMm5kRVNlQlNod2hBV3hmc0FTYU5odXJkMUtBenFTZXVLN2tPTE82VTBq?=
 =?utf-8?B?aytBNFVuV2xyQjNzc0plMmhrbWpvLzk0eFRLK3hQbDF4QWJ2R0dheklPdksy?=
 =?utf-8?B?a0g3dHB1dXZNQzRSZzM4Q1oyaDVvTWxXdWhUb0dSem9IYUNNWExVdU5yVFV5?=
 =?utf-8?B?OVRpNTVQdHJ6WHJGMzBMbVJoZ2NraWhQTy96Q2Y0VDY4NUhYUnNHL1lhcXlU?=
 =?utf-8?B?STZYVGVSYnkrR005RERkUHNvY0tLbEEwOWRNTElJajl3N3o0RWRHL3BWL25y?=
 =?utf-8?B?eFdvQ2ZXcFN4S20rVG1EcS9IU2w4SDlVNUlITXE5ZzRZZXk5MEo1RlU2bjFR?=
 =?utf-8?B?OXBYTE81N0dsU2EwMkRpQVBqbWVBck4wTXhvN1ZOWVgyU1h3TnAzL0FMZ1BC?=
 =?utf-8?B?WUE2SzFhd3MxNE5jV3ExUnRWdm1lMUFwWTNWNjNsZEE0V1ZJZ2o3cVpEYnBx?=
 =?utf-8?B?SnBzM3F3OTQrQmhYT2szTlo2ejJjUTV4Y2d1b29zVUtTd204TGZzQ1JVS2JW?=
 =?utf-8?B?NElxZlNhc0NwdlVRUTUwTkhFMFAybnkrcXY3ZTFoRWsvZUxVcjVkNzRHK2FH?=
 =?utf-8?B?ckNvMU5yaGNRWnNKYU1maGlSV2pld09JVGF1Wkhpclp2ZGorQXdRQ2tvQ3RN?=
 =?utf-8?B?TWc4VDZRWjB4aXRuUTF0OTFwQ294cEF4WEY1bk9GclJ1N2ZJQzFPc0ZEd0Vo?=
 =?utf-8?B?Q1VWZGV2SFZWQmUra1VRaElBdWxWSnFTaUcwelNBOTJhT3d6WUNtMmFjcUxT?=
 =?utf-8?B?a2RNTVpJbDM1ZnNYbG1KUFhQOXZ6UGl2UWswa2pYZXpjWmY4alBXdkJ4blNh?=
 =?utf-8?B?NnpSSkRjWVN2Nlp2dW1raFBLSDRRK3Q0YS9mVk1tMnNXVmcyNjFoeGJvZ1VI?=
 =?utf-8?B?RmdWMUtjNkFOdmFGbXZDK2RGNFJQaFJWcHZOV1J3d3JqcHN4T2MrVGsxS1Ba?=
 =?utf-8?B?ZTNQSTNXYlJNbjJ2RlBDck9mRkUrQmhPWG15a1R5MDBSM1hHcCtUZndGWDMw?=
 =?utf-8?B?R3JENDljL3dqOEZWdWFKem5zSjlDVHFRNVZCaUFxSm9rcHk3ZEVCKy9UM0R5?=
 =?utf-8?B?RStNKytGeWNyWVBIeUZuOWQxSGZUNTBGU1ZXaXZlb1NLZFNsczhONUE3SHhB?=
 =?utf-8?B?WU9la2Z3NlRQNHpkMnlXSTRjaldjaFBHYmpBZlFkNkcwZ3FZQlBvb1o1UXNk?=
 =?utf-8?B?enhObCtkNytmM3R1YkE1WTlBVFltU1lUN3Y0aFJyaGROT1ZXa3FsM1QrQmtB?=
 =?utf-8?B?L0prckg0WUc1RU1tMUFlZGVGWnBoQXFpQnlJNk83Vk00UTA2M0xpa1FZbkt4?=
 =?utf-8?B?VTdCVHdURTZxWkZxbXlhR2x3UkV0Mk1EZVoyUVEvTDllVDMwNmFLcXhvSFgw?=
 =?utf-8?B?SlBOQVpGQmN0MmNwSVB3K204dU90RkZtM20yaVJoS1FLalYweXg1QWxiekpi?=
 =?utf-8?B?S2lJNDdtUlNkWktVVU82SndMMkJTOHBLREZIWVJYZHkzOEVPS0x0aEdZNGVz?=
 =?utf-8?B?WHNrWUVTT244Yjl4ZkxoZThLWlNGTkZ3R1lLdFJjRGxFZCs5c3hVWHI3clND?=
 =?utf-8?B?MGtqamhtM2hKWVg1ZDMvQ2VqTkowOXVINlRDb2YwN0U5ZEM4YUFIbTlmMTJr?=
 =?utf-8?B?MUVyRWhEWHdQNEdyTHErVE5qZUU1U2NkWkt0TncrS2FXWlFRQnFoazdXVUhj?=
 =?utf-8?B?cjMycVlxNHhRVWVydytBWFEzRUltVWhya0tlOEZPOEFTZTdUWCtXUndtS0o4?=
 =?utf-8?B?VG1GdWp1VEJSMjZudm5uVDE0aWZyM1lYNEJTV0N5ZlpFekdGbnFIUnczZDJL?=
 =?utf-8?B?UDYxOFY4UTB2VXFCNUc2WGIxZlFKek5TbnJBT0E2dVRWR0RrN2hPN0llbm9o?=
 =?utf-8?B?cEZuZVRZQjFMQ2Naa2RpMnA2TkFYVUJZUnZhNDNzWDhPUEZWelR6MTZHVEZE?=
 =?utf-8?B?SG5hYnp1eElkazhvSzRYUkM1OFdqY2JiNk9OZ1FGVXpkOVRPZDFBMXdRT3Iv?=
 =?utf-8?B?QnJtZVNrMS8rYU9wM2tYTkdYbVdYeHhnSE5kT1VMV3gxN1hLWldoQVNCM00z?=
 =?utf-8?B?Vk9WbHVxa1FGQnZuSnhoQnpaTHc1aTZ0L2lSZU1jWk40REkrV1BQL3VwbGlr?=
 =?utf-8?B?ZTI0ZjN1eGdoWDZnTTlhT0NBSXd1WEZzcFEvbUZreDdpSElJaDhSRmd1NUVv?=
 =?utf-8?B?b0E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cc03c2-2892-489a-7051-08d9a3f2b14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 02:34:59.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssKwau8DfcYN1MggYD2IIiz0KyX/AIBrc4tsjVO7I4k2fBJ5HUZ18vn6qYVx0pFX+9BAzjv/jhE21BjtGVnVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3861
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.112 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.112 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mkdSC-0008V7-BM
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDksIDIwMjEgMTA6MTEgUE0NCj4gVG86IOW4uOWHpOal
oCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnDQo+IENjOiBsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyXSBmMmZzOiBjb21wcmVzczogcmVkdWNlIG9uZSBwYWdlIGFycmF5IGFsbG9jIGFuZA0KPiBm
cmVlIHdoZW4gd3JpdGUgY29tcHJlc3NlZCBwYWdlDQo+IA0KPiBPbiAyMDIxLzExLzkgMTE6NTQs
IEZlbmduYW4gQ2hhbmcgd3JvdGU6DQo+ID4gRG9uJ3QgYWxsb2MgbmV3IHBhZ2UgcG9pbnRlcnMg
YXJyYXkgdG8gcmVwbGFjZSBvbGQsIGp1c3QgdXNlIG9sZCwNCj4gPiBpbnRyb2R1Y2UgdmFsaWRf
bnJfY3BhZ2VzIHRvIGluZGljYXRlIHZhbGlkIG51bWJlciBvZiBwYWdlIHBvaW50ZXJzIGluDQo+
ID4gYXJyYXksIHRyeSB0byByZWR1Y2Ugb25lIHBhZ2UgYXJyYXkgYWxsb2MgYW5kIGZyZWUgd2hl
biB3cml0ZSBjb21wcmVzcw0KPiBwYWdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25h
biBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+IC0tLQ0KPiA+ICAgZnMvZjJmcy9j
b21wcmVzcy5jIHwgMjcgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICBmcy9mMmZz
L2RhdGEuYyAgICAgfCAgMSArDQo+ID4gICBmcy9mMmZzL2YyZnMuaCAgICAgfCAgMSArDQo+ID4g
ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3Mu
YyBpbmRleA0KPiA+IDliNjYzZWFmNDgwNS4uMjg3ODVkZDc4YzZmIDEwMDY0NA0KPiA+IC0tLSBh
L2ZzL2YyZnMvY29tcHJlc3MuYw0KPiA+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYw0KPiA+IEBA
IC0xNTMsNiArMTUzLDcgQEAgdm9pZCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfY3R4KHN0cnVjdA0K
PiBjb21wcmVzc19jdHggKmNjLCBib29sIHJldXNlKQ0KPiA+ICAgCWNjLT5ycGFnZXMgPSBOVUxM
Ow0KPiA+ICAgCWNjLT5ucl9ycGFnZXMgPSAwOw0KPiA+ICAgCWNjLT5ucl9jcGFnZXMgPSAwOw0K
PiA+ICsJY2MtPnZhbGlkX25yX2NwYWdlcyA9IDA7DQo+ID4gICAJaWYgKCFyZXVzZSkNCj4gPiAg
IAkJY2MtPmNsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSOw0KPiA+ICAgfQ0KPiA+IEBAIC02MTks
NyArNjIwLDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdA0KPiBjb21w
cmVzc19jdHggKmNjKQ0KPiA+ICAgCWNvbnN0IHN0cnVjdCBmMmZzX2NvbXByZXNzX29wcyAqY29w
cyA9DQo+ID4gICAJCQkJZjJmc19jb3BzW2ZpLT5pX2NvbXByZXNzX2FsZ29yaXRobV07DQo+ID4g
ICAJdW5zaWduZWQgaW50IG1heF9sZW4sIG5ld19ucl9jcGFnZXM7DQo+ID4gLQlzdHJ1Y3QgcGFn
ZSAqKm5ld19jcGFnZXM7DQo+ID4gICAJdTMyIGNoa3N1bSA9IDA7DQo+ID4gICAJaW50IGksIHJl
dDsNCj4gPg0KPiA+IEBAIC02MzQsNiArNjM0LDcgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNz
X3BhZ2VzKHN0cnVjdA0KPiBjb21wcmVzc19jdHgNCj4gPiAqY2MpDQo+ID4NCj4gPiAgIAltYXhf
bGVuID0gQ09NUFJFU1NfSEVBREVSX1NJWkUgKyBjYy0+Y2xlbjsNCj4gPiAgIAljYy0+bnJfY3Bh
Z2VzID0gRElWX1JPVU5EX1VQKG1heF9sZW4sIFBBR0VfU0laRSk7DQo+ID4gKwljYy0+dmFsaWRf
bnJfY3BhZ2VzID0gY2MtPm5yX2NwYWdlczsNCj4gPg0KPiA+ICAgCWNjLT5jcGFnZXMgPSBwYWdl
X2FycmF5X2FsbG9jKGNjLT5pbm9kZSwgY2MtPm5yX2NwYWdlcyk7DQo+ID4gICAJaWYgKCFjYy0+
Y3BhZ2VzKSB7DQo+ID4gQEAgLTY4NCwxMyArNjg1LDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXBy
ZXNzX3BhZ2VzKHN0cnVjdA0KPiA+IGNvbXByZXNzX2N0eCAqY2MpDQo+ID4NCj4gPiAgIAluZXdf
bnJfY3BhZ2VzID0gRElWX1JPVU5EX1VQKGNjLT5jbGVuICsNCj4gQ09NUFJFU1NfSEVBREVSX1NJ
WkUsDQo+ID4gUEFHRV9TSVpFKTsNCj4gPg0KPiA+IC0JLyogTm93IHdlJ3JlIGdvaW5nIHRvIGN1
dCB1bm5lY2Vzc2FyeSB0YWlsIHBhZ2VzICovDQo+ID4gLQluZXdfY3BhZ2VzID0gcGFnZV9hcnJh
eV9hbGxvYyhjYy0+aW5vZGUsIG5ld19ucl9jcGFnZXMpOw0KPiA+IC0JaWYgKCFuZXdfY3BhZ2Vz
KSB7DQo+ID4gLQkJcmV0ID0gLUVOT01FTTsNCj4gPiAtCQlnb3RvIG91dF92dW5tYXBfY2J1ZjsN
Cj4gDQo+IEl0IHJlbW92ZXMgbGFzdCB1c2VyIG9mIG91dF92dW5tYXBfY2J1ZiBsYWJlbCwgc28g
d2UgY2FuIHJlbW92ZSBiZWxvdw0KPiBkZWFkIGNvZGVzIGluIGVycm9yIHBhdGggYXMgd2VsbC4N
Cj4gDQo+IG91dF92dW5tYXBfY2J1ZjoNCj4gCXZtX3VubWFwX3JhbShjYy0+Y2J1ZiwgY2MtPm5y
X2NwYWdlcyk7DQoNCk5vdCByaWdodCwgdGhlcmUgc3RpbGwgb3RoZXIgY29kZSB1c2UgdGhpcy4N
Cg0KVGhhbmtzLg0KPiANCj4gPiAtCX0NCj4gPiAtDQo+ID4gICAJLyogemVybyBvdXQgYW55IHVu
dXNlZCBwYXJ0IG9mIHRoZSBsYXN0IHBhZ2UgKi8NCj4gPiAgIAltZW1zZXQoJmNjLT5jYnVmLT5j
ZGF0YVtjYy0+Y2xlbl0sIDAsDQo+ID4gICAJCQkobmV3X25yX2NwYWdlcyAqIFBBR0VfU0laRSkg
LQ0KPiA+IEBAIC03MDEsNyArNjk1LDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2Vz
KHN0cnVjdA0KPiBjb21wcmVzc19jdHgNCj4gPiAqY2MpDQo+ID4NCj4gPiAgIAlmb3IgKGkgPSAw
OyBpIDwgY2MtPm5yX2NwYWdlczsgaSsrKSB7DQo+ID4gICAJCWlmIChpIDwgbmV3X25yX2NwYWdl
cykgew0KPiA+IC0JCQluZXdfY3BhZ2VzW2ldID0gY2MtPmNwYWdlc1tpXTsNCj4gPiAgIAkJCWNv
bnRpbnVlOw0KPiA+ICAgCQl9DQo+IA0KPiBpZiAoaSA8IG5ld19ucl9jcGFnZXMpDQo+IAljb250
aW51ZTsNCj4gDQo+ID4gICAJCWYyZnNfY29tcHJlc3NfZnJlZV9wYWdlKGNjLT5jcGFnZXNbaV0p
Ow0KPiA+IEBAIC03MTEsOSArNzA0LDcgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2Vz
KHN0cnVjdA0KPiBjb21wcmVzc19jdHggKmNjKQ0KPiA+ICAgCWlmIChjb3BzLT5kZXN0cm95X2Nv
bXByZXNzX2N0eCkNCj4gPiAgIAkJY29wcy0+ZGVzdHJveV9jb21wcmVzc19jdHgoY2MpOw0KPiA+
DQo+ID4gLQlwYWdlX2FycmF5X2ZyZWUoY2MtPmlub2RlLCBjYy0+Y3BhZ2VzLCBjYy0+bnJfY3Bh
Z2VzKTsNCj4gPiAtCWNjLT5jcGFnZXMgPSBuZXdfY3BhZ2VzOw0KPiA+IC0JY2MtPm5yX2NwYWdl
cyA9IG5ld19ucl9jcGFnZXM7DQo+ID4gKwljYy0+dmFsaWRfbnJfY3BhZ2VzID0gbmV3X25yX2Nw
YWdlczsNCj4gPg0KPiA+ICAgCXRyYWNlX2YyZnNfY29tcHJlc3NfcGFnZXNfZW5kKGNjLT5pbm9k
ZSwgY2MtPmNsdXN0ZXJfaWR4LA0KPiA+ICAgCQkJCQkJCWNjLT5jbGVuLCByZXQpOw0KPiA+IEBA
IC0xMjg4LDE0ICsxMjc5LDE0IEBAIHN0YXRpYyBpbnQNCj4gZjJmc193cml0ZV9jb21wcmVzc2Vk
X3BhZ2VzKHN0cnVjdA0KPiA+IGNvbXByZXNzX2N0eCAqY2MsDQo+ID4NCj4gPiAgIAljaWMtPm1h
Z2ljID0gRjJGU19DT01QUkVTU0VEX1BBR0VfTUFHSUM7DQo+ID4gICAJY2ljLT5pbm9kZSA9IGlu
b2RlOw0KPiA+IC0JYXRvbWljX3NldCgmY2ljLT5wZW5kaW5nX3BhZ2VzLCBjYy0+bnJfY3BhZ2Vz
KTsNCj4gPiArCWF0b21pY19zZXQoJmNpYy0+cGVuZGluZ19wYWdlcywgY2MtPnZhbGlkX25yX2Nw
YWdlcyk7DQo+ID4gICAJY2ljLT5ycGFnZXMgPSBwYWdlX2FycmF5X2FsbG9jKGNjLT5pbm9kZSwg
Y2MtPmNsdXN0ZXJfc2l6ZSk7DQo+ID4gICAJaWYgKCFjaWMtPnJwYWdlcykNCj4gPiAgIAkJZ290
byBvdXRfcHV0X2NpYzsNCj4gPg0KPiA+ICAgCWNpYy0+bnJfcnBhZ2VzID0gY2MtPmNsdXN0ZXJf
c2l6ZTsNCj4gPg0KPiA+IC0JZm9yIChpID0gMDsgaSA8IGNjLT5ucl9jcGFnZXM7IGkrKykgew0K
PiA+ICsJZm9yIChpID0gMDsgaSA8IGNjLT52YWxpZF9ucl9jcGFnZXM7IGkrKykgew0KPiA+ICAg
CQlmMmZzX3NldF9jb21wcmVzc2VkX3BhZ2UoY2MtPmNwYWdlc1tpXSwgaW5vZGUsDQo+ID4gICAJ
CQkJCWNjLT5ycGFnZXNbaSArIDFdLT5pbmRleCwgY2ljKTsNCj4gPiAgIAkJZmlvLmNvbXByZXNz
ZWRfcGFnZSA9IGNjLT5jcGFnZXNbaV07IEBAIC0xMzQwLDcgKzEzMzEsNw0KPiBAQCBzdGF0aWMN
Cj4gPiBpbnQgZjJmc193cml0ZV9jb21wcmVzc2VkX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHgg
KmNjLA0KPiA+ICAgCQlpZiAoZmlvLmNvbXByX2Jsb2NrcyAmJiBfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihibGthZGRyKSkNCj4gPiAgIAkJCWZpby5jb21wcl9ibG9ja3MrKzsNCj4gPg0KPiA+IC0J
CWlmIChpID4gY2MtPm5yX2NwYWdlcykgew0KPiA+ICsJCWlmIChpID4gY2MtPnZhbGlkX25yX2Nw
YWdlcykgew0KPiA+ICAgCQkJaWYgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKSB7
DQo+ID4gICAJCQkJZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIpOw0KPiA+ICAg
CQkJCWYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4sIE5FV19BRERSKTsgQEANCj4gLTEzNjUs
OCArMTM1Niw4IEBADQo+ID4gc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFnZXMo
c3RydWN0IGNvbXByZXNzX2N0eCAqY2MsDQo+ID4NCj4gPiAgIAlpZiAoZmlvLmNvbXByX2Jsb2Nr
cykNCj4gPiAgIAkJZjJmc19pX2NvbXByX2Jsb2Nrc191cGRhdGUoaW5vZGUsIGZpby5jb21wcl9i
bG9ja3MgLSAxLA0KPiBmYWxzZSk7DQo+ID4gLQlmMmZzX2lfY29tcHJfYmxvY2tzX3VwZGF0ZShp
bm9kZSwgY2MtPm5yX2NwYWdlcywgdHJ1ZSk7DQo+ID4gLQlhZGRfY29tcHJfYmxvY2tfc3RhdChp
bm9kZSwgY2MtPm5yX2NwYWdlcyk7DQo+ID4gKwlmMmZzX2lfY29tcHJfYmxvY2tzX3VwZGF0ZShp
bm9kZSwgY2MtPnZhbGlkX25yX2NwYWdlcywgdHJ1ZSk7DQo+ID4gKwlhZGRfY29tcHJfYmxvY2tf
c3RhdChpbm9kZSwgY2MtPnZhbGlkX25yX2NwYWdlcyk7DQo+ID4NCj4gPiAgIAlzZXRfaW5vZGVf
ZmxhZyhjYy0+aW5vZGUsIEZJX0FQUEVORF9XUklURSk7DQo+ID4gICAJaWYgKGNjLT5jbHVzdGVy
X2lkeCA9PSAwKQ0KPiA+IEBAIC0xNDA0LDcgKzEzOTUsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3Jp
dGVfY29tcHJlc3NlZF9wYWdlcyhzdHJ1Y3QNCj4gY29tcHJlc3NfY3R4ICpjYywNCj4gPiAgIAll
bHNlDQo+ID4gICAJCWYyZnNfdW5sb2NrX29wKHNiaSk7DQo+ID4gICBvdXRfZnJlZToNCj4gPiAt
CWZvciAoaSA9IDA7IGkgPCBjYy0+bnJfY3BhZ2VzOyBpKyspIHsNCj4gPiArCWZvciAoaSA9IDA7
IGkgPCBjYy0+dmFsaWRfbnJfY3BhZ2VzOyBpKyspIHsNCj4gPiAgIAkJaWYgKCFjYy0+Y3BhZ2Vz
W2ldKQ0KPiA+ICAgCQkJY29udGludWU7DQo+IA0KPiBXZSBjYW4gcmVtb3ZlIGFib3ZlIGNwYWdl
cyBjaGVjaz8NCj4gDQo+IFRoYW5rcywNCj4gDQo+ID4gICAJCWYyZnNfY29tcHJlc3NfZnJlZV9w
YWdlKGNjLT5jcGFnZXNbaV0pOw0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jIGluZGV4DQo+ID4gZjRmZDZjMjQ2YzlhLi40ZGRjMGJhMGYyYzAgMTAwNjQ0
DQo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMNCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+
IEBAIC0yOTM0LDYgKzI5MzQsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMo
c3RydWN0DQo+IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsDQo+ID4gICAJCS5ycGFnZXMgPSBOVUxM
LA0KPiA+ICAgCQkubnJfcnBhZ2VzID0gMCwNCj4gPiAgIAkJLmNwYWdlcyA9IE5VTEwsDQo+ID4g
KwkJLnZhbGlkX25yX2NwYWdlcyA9IDAsDQo+ID4gICAJCS5yYnVmID0gTlVMTCwNCj4gPiAgIAkJ
LmNidWYgPSBOVUxMLA0KPiA+ICAgCQkucmxlbiA9IFBBR0VfU0laRSAqIEYyRlNfSShpbm9kZSkt
PmlfY2x1c3Rlcl9zaXplLCBkaWZmIC0tZ2l0DQo+ID4gYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2Yy
ZnMvZjJmcy5oIGluZGV4IDAzOWEyMjllMTFjOS4uYWNiNTg3ZjA1NGRiDQo+ID4gMTAwNjQ0DQo+
ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+IEBA
IC0xNDgxLDYgKzE0ODEsNyBAQCBzdHJ1Y3QgY29tcHJlc3NfY3R4IHsNCj4gPiAgIAl1bnNpZ25l
ZCBpbnQgbnJfcnBhZ2VzOwkJLyogdG90YWwgcGFnZSBudW1iZXIgaW4gcnBhZ2VzDQo+ICovDQo+
ID4gICAJc3RydWN0IHBhZ2UgKipjcGFnZXM7CQkvKiBwYWdlcyBzdG9yZSBjb21wcmVzc2VkIGRh
dGEgaW4NCj4gY2x1c3RlciAqLw0KPiA+ICAgCXVuc2lnbmVkIGludCBucl9jcGFnZXM7CQkvKiB0
b3RhbCBwYWdlIG51bWJlciBpbiBjcGFnZXMNCj4gKi8NCj4gPiArCXVuc2lnbmVkIGludCB2YWxp
ZF9ucl9jcGFnZXM7CS8qIHZhbGlkIHBhZ2UgbnVtYmVyIGluIGNwYWdlcyAqLw0KPiA+ICAgCXZv
aWQgKnJidWY7CQkJLyogdmlydHVhbCBtYXBwZWQgYWRkcmVzcyBvbiBycGFnZXMgKi8NCj4gPiAg
IAlzdHJ1Y3QgY29tcHJlc3NfZGF0YSAqY2J1ZjsJLyogdmlydHVhbCBtYXBwZWQgYWRkcmVzcyBv
bg0KPiBjcGFnZXMgKi8NCj4gPiAgIAlzaXplX3QgcmxlbjsJCQkvKiB2YWxpZCBkYXRhIGxlbmd0
aCBpbiByYnVmICovDQo+ID4NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
