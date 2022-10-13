Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2345FD38D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 05:33:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oioyY-0006gT-C6;
	Thu, 13 Oct 2022 03:33:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lvgaofei@oppo.com>) id 1oioyW-0006gN-Pf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 03:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XsgeX3jWbQgWmjICUdwp9FHAdDIV/izg+qcCK4rvC98=; b=E4y2ZIT2Nl1iIipIgzuJTX60k0
 a+uRGhX+phW/TwupM4FBsjy2AIhCjr6Lx2E4nBFJxZMPcbt9bUeP6ZS12EpPhgDhX3JIna3KsXIvD
 IguTogN+1Vunw74E/3KA05RqVtBWGd0gEG8NH2KZQ7BYIdORZ5MJzlKga6xgfa89UtTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XsgeX3jWbQgWmjICUdwp9FHAdDIV/izg+qcCK4rvC98=; b=V
 TVGFD+fzqe3fPSPwPlC62t03nVM80WgC4Yo2AJZ5mJkiZrWrRfDe2ou8utAad7kh8atl/SkFDBLYX
 1CEoaFCOJQJCN0cdOv8geXfrCuJYWdbye1oaODsY5vPxGcc0Epe3Hy4QVUryj/eADfJvO0KqPuafU
 /pcSznM4HFw+eDec=;
Received: from mail-tyzapc01on2080.outbound.protection.outlook.com
 ([40.107.117.80] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oioyP-001muF-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 03:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHNY1iGv4x0uLPzDRRUvGGKfEM+W2WoctoQXNIoD3FZAgbfD1EJvFC0FXLRD0jCjPB38bgUCFo0SjGaJWyghGRdSXVBisHqT0KWfOekPHYryDRRYj5juEB0rA2jRFoYIOszIOe9bPhWHp/eF5gDe1sryhW+Q5iVU15x8T/dJFw/VrTzl7u8XW6Q+sJGxLFA4HVuWqG8CNMjmmYHEuQG0wB7y7zHQNdxQi0q5aCuquVx3ADs+zixkcyj9Mw+HNl3o9n4c8A6ZhgXIA3blWtvqI6PeBJ9xZdtNsQmLRXkacCEXTqVJ793ni4VM2KeOGYjb2ebGj8kemhxaQj13iW02/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsgeX3jWbQgWmjICUdwp9FHAdDIV/izg+qcCK4rvC98=;
 b=Ye/lf4TAMURGX1JktioQGizsyifb02q1xf2ILfKjLNwlYVrFBPqWCEaly+lsCRj8jQ3wyWyymO3XFuj/INyvDG8JeWYpt0xYs7jjAXmEX6RlOmdSKNFFqEPjS2TTaTgyDnsUMRraGrAjVCkjLG4+QijY8/tmlF7kFCcsz1ME2VHZOaEdA+SQv0C8RWHZre93vw+QwFFAKsD5MI0XarWllt/BXJZi1entaE3jXQIXG/uyCtwKCT0lQowUBWXFXoZ3A3MkGlf8STnK2lZv2Q4k0nviVFY2Lq85+G9Uf7MRg+X8HwRCEQbkGUFDCJEPuFNz0BREzOkrCgTv0oiCSr3btA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsgeX3jWbQgWmjICUdwp9FHAdDIV/izg+qcCK4rvC98=;
 b=QmSPVASj4VEKKSUKL7VGLkL53qC/OrijYWsHQhTjWlBYCB+/lqsiR+ql8kj9PztiJJZted4qk7rraU2c6CtE0QapQBMOjzs97llv8K4sZTOuOvyxYDpHpRpgnkdC1yWat4v+xtOnbLyAEq/oJjs0IE2qC/cH3nrnX7t567SVq4Q=
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com (2603:1096:101:7e::10)
 by KL1PR02MB6168.apcprd02.prod.outlook.com (2603:1096:820:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Thu, 13 Oct
 2022 03:18:10 +0000
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741]) by SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 03:18:10 +0000
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Thread-Topic: [PATCH] Cherry picked from commit
 e3b49ea36802053f312013fd4ccb6e59920a9f76 [Please apply to 5.10-stable and
 5.15-stable.]
Thread-Index: AQHY3rJrqaHnZrUO7kO2CGyCX3qiMw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 13 Oct 2022 03:18:10 +0000
Message-ID: <SEZPR02MB6007FD0908879CDAEBB12216AC259@SEZPR02MB6007.apcprd02.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR02MB6007:EE_|KL1PR02MB6168:EE_
x-ms-office365-filtering-correlation-id: f4bf3a6f-beec-4d8d-18c1-08daacc98e43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fYgrfOt67pT987izloYQWwF/3s1F1sNdV87TrnzmY8o2wHkrB9I0rJ5CPqYXe+2InsVy5Rz8p0qEu07cDuEYQxJ0Njkqv5km1wiHuWwCudvQ2Ku03deitFdUDSRqAQkui8VO4gSuNHfGh3eYQX57wuQnFum7cOk7NWG8vA+sqPZj5dLX3qDjyT7Ldr/ICPz/pasm75tSYsPXiwO5DtC50gKZDeqXiELg+5EOowJLaUWZ17t5Kx4RhCi9w07yBUv7h3Try7tMtdFm19laQMp57gJag+5e6i7WZcg8PvFP5B0yTk/djbIMjyBl2RllvaNGHHp1EWavuGgILz05G7rFxretKJYzIQtHPVhrkWkB3aFMQxgQ3pJjGMHgLCL2359PqHOsiyQe549Zr/RcI+xfWN0btKgPQNim6dJhRnCtQIC8wPBBBPnRZRDU9AIx4HjKvsOLjowHJCO0/sNwPOTeUaz0+Hrn2pd9y8qDAvxRDYuvGjOv2W/2fOTdkru0inxkh+sU2iW3VMzC2FKQa4T+9pqwx68QKV/+FKtPcEfOud1jaSoWebW0DhmzmU2L6ncke7fBUxf8kUWYE6yU38YlTQBubXRwkWmCv0q715aa2bbS4Jk4sAU7k4fA4oTmWEl59zzxD2Q9fP8N8H50/N4ukNK6v/fZMXncGQ4RMuIwV15t4fECjvVU2KTgMQet5nFXjMg9tZHZ+sm0PAkaRZfO+ahXtMqTA3rV1Rd8kJmpOyAF6Woivz6xi56qJ7DULvbR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB6007.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(316002)(55016003)(33656002)(54906003)(6916009)(8936002)(186003)(122000001)(26005)(9686003)(52536014)(4744005)(5660300002)(2906002)(224303003)(85182001)(4326008)(66476007)(7696005)(66446008)(64756008)(38100700002)(76116006)(66946007)(6506007)(66556008)(41300700001)(71200400001)(38070700005)(83380400001)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?eGRKamdPOVlsdGZtcnpEUjk5TmxVTmRsY1A0TTdKams3eUsrVExnVG5OTC9E?=
 =?gb2312?B?Z3BhT1QyRlFIb3RmTkdLbkZzekREWVVoalNWWllEWE9KTW53YnBGd2dDZDhH?=
 =?gb2312?B?emswRFc4Qk5BRVUxSmdlM3BPdGZ6ZkJPaWVsclowSHZWVnRkcVpnT00yMkZi?=
 =?gb2312?B?RWlCa1lHRklRaUhNK29tTWpWZVVjL2lPZWZqTktmL1NydXBIYk5NSlRBTkU3?=
 =?gb2312?B?QmJMQklOd0t1aUM2bWFGVGYzOU9wWW5GaWZMQ0UyL2VUaDFSL1pXSlhUMm8x?=
 =?gb2312?B?V3ludDJwbVlUSmdmeERwSHlEZFBHYS91c0JnZzExWjlBemZWaEUvUFpSOFNK?=
 =?gb2312?B?UEVBYzRySDROL1d1UHRHTGMwdnIxRlVxT00vY2RQOE5KckVWT0QyeWZFMjRY?=
 =?gb2312?B?ZnlSeVNzdFdQcVlQSU5PT1VBNS92S0gxRGgvRlRoMDZEY0dVeVRheGNmTEIx?=
 =?gb2312?B?R1V3UjFGb3ZISDNMZXFjS1JLRXhsU2RPQmRNKzNpNTlvaXhlbFRmMEZHYzJL?=
 =?gb2312?B?UW80TGRqczUzdE1LU0g1QXp4azI1TWlTZmtDZVRxeGFzSERKQmY2MmdTaS9u?=
 =?gb2312?B?bklyek5sT1AvWEZ5bVlDYWRBYzIybUdBUnRiWlE1dTYwaTFqZEdQZVRkOTRM?=
 =?gb2312?B?RkNFdWc4MU1GemFON0VEbmU5ZjdqNTlsL2VQZXFRdzZJYk9oMFZOTWxMbzRW?=
 =?gb2312?B?emxYaEo4M2NTb3pZaHkzS3hyRjNGdlJHRkpsd3VDL1g2NHlTZXVNY3ZsUUlj?=
 =?gb2312?B?YXpHK1Y3aTRDMWFjTFZwYzcxUGdCOGVTSHNsdlFRaWlSZXUycU5wWUYxbkFj?=
 =?gb2312?B?ZnlraHp5d1hQZ05hZEJzVXovTkFhRjIwYmtpdVIrUTdxYzRtSExadWZQOWJ2?=
 =?gb2312?B?VGdWbllhaXU0OG0yb1NiUk1STkNONm9IMWJnNDJHd0xEb256MlB4MFV6dTdj?=
 =?gb2312?B?b3JGVkhKbEd4ZVR5dGFqZ0gvS3dqMUFOMFVBdVAwRENOeEF1YXFHelJyK1NN?=
 =?gb2312?B?UTJ1NTdzUU81VXJ0MmEwOGc5ZE90eHVIM2FNMDVWZ2tXK2xOalZFMlVtc01M?=
 =?gb2312?B?WDBRYWxEY01YenUwSUJXZG9QalRMWG1XWDk1a0JRK0ZYQ2V6U0hVVTR2NVdl?=
 =?gb2312?B?Si9TRjJvZFF0eVMzR1dMelAvQmpYNG1Pb2RmUjZWMk5RNmV1TkxrODcyYWx0?=
 =?gb2312?B?NGpsV0J6aW1mTFRWNU9pd1V4Qk1lTkFEZmtNR2QwZzgzOWp3Rnd6MTVuc0M4?=
 =?gb2312?B?bTdQMkFSQUVoUDMydHlwMnVGR3pvZDNFQmVXSDBQZTFyckJxY2pYWEZCQjhK?=
 =?gb2312?B?SURYV1Z6RkxNVkVIemhSdThDa2xyRS92NGN1RFRhcTFEVDNMZzY2Vk81MGl2?=
 =?gb2312?B?RTZOTDBNaFJXa25oZkllSDRyQzQ5UmJNWVUySnNUK1M1YytUKytBTGYrOVly?=
 =?gb2312?B?bW8xQkxJeDQ3U2psSWRIeXJ6bzNuQ1NWZStqZUZudlNiUlFibENJOG9Ka2Nq?=
 =?gb2312?B?K3E4K1RQaUtiREFGKzBnYjEwN2NZaXFEcUVvaldLa2lWMCtWRitRVDROVE5v?=
 =?gb2312?B?R0ZHNWFEWGxrTi9WZTV1TGFEMURLRkdnZDNHNGorZnBwd09CQ3BETmV6bysr?=
 =?gb2312?B?a3Bhc1BQekNwUVpVR2o0SGVoT1RUQld6TUpJQmMzSWlXdnZFSXo4M04wdWIy?=
 =?gb2312?B?UjRuRGdUblBINFptR1JhbnNHaWFWcDJIY2V5STZLaDNRWStKbmJsWFRHZUhE?=
 =?gb2312?B?V3hZNUxNSnh0amVVTzJKVHJaWEgrV0ExVkhEdURpTzE5RW90RHRydEtUK3NO?=
 =?gb2312?B?TVhPbkVyRDRIeGRORVRrTUdXN1J0R045ODVkaXR3Yks1eHJaUUlDeXBTY3ow?=
 =?gb2312?B?OUdPSVZ5dW5jZ2cwb1V5WTBYcmtvT3R6T09aMzBGT0gzdWNVVnNIdHN0a3NI?=
 =?gb2312?B?YWp0QzFYNTI2MGJtNFppWjlEUUVTRUZKNWZYcy9FYUlSaEp6eVA5SFZnUjZD?=
 =?gb2312?B?QWFLQ2Q1UmxGTlJMaVdGZHZscDdaTXdwa1E4bE0wdStrN05aSXYxekhMZUE4?=
 =?gb2312?B?M29MRmNRV0VkZFVROW5QVW9hQjIxRFhuYmc5ZyszUFd5MnNBVGg4MHFtWTR1?=
 =?gb2312?Q?XjOJIz7PuJNHjr49/tT1kOzcu?=
MIME-Version: 1.0
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB6007.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bf3a6f-beec-4d8d-18c1-08daacc98e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 03:18:10.1199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RI3nvQGPFn0zXZvBgxgu26oxCz+ncmCA1hS8ZBLoKauY4oLk0iWE2AovGHn46S5L1dujTrjrlyOF7VoxkiRL3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6168
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  吕高飞(Gaofei Lyu) 将撤回邮件“[PATCH] Cherry picked from
   commit e3b49ea36802053f312013fd4ccb6e59920a9f76 [Please apply to 5.10-stable
    and 5.15-stable.]”。 OPPO 本电子邮件及其附件含有OPPO公司的保密信息，仅限于邮件指明的收件人使用（包含个人及群组）。禁止任何人在未经授权的情况下以任何形式使用。如果您错收了本邮件，请立即以电子邮件通知发件人并删除本邮件及其附件。
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.117.80 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.117.80 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1oioyP-001muF-Sp
Subject: [f2fs-dev] =?gb2312?b?s7e72DogW1BBVENIXSBDaGVycnkgcGlja2VkIGZy?=
 =?gb2312?b?b20gY29tbWl0IGUzYjQ5ZWEzNjgwMjA1M2YzMTIwMTNmZDRjY2I2ZTU5OTIw?=
 =?gb2312?b?YTlmNzYgW1BsZWFzZSBhcHBseSB0byA1LjEwLXN0YWJsZSBhbmQgNS4xNS1z?=
 =?gb2312?b?dGFibGUuXQ==?=
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
From: =?gb2312?B?wsC437fJKEdhb2ZlaSBMeXUp?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?gb2312?B?wsC437fJKEdhb2ZlaSBMeXUp?= <lvgaofei@oppo.com>
Cc: Hyeong-Jun Kim <hj514.kim@samsung.com>,
 "drosen@google.com" <drosen@google.com>,
 =?gb2312?B?wsC437fJKEdhb2ZlaSBMeXUp?= <lvgaofei@oppo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "gregkh@google.com" <gregkh@google.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

wsC437fJKEdhb2ZlaSBMeXUpIL2rs7e72NPKvP6hsFtQQVRDSF0gQ2hlcnJ5IHBpY2tlZCBmcm9t
IGNvbW1pdCBlM2I0OWVhMzY4MDIwNTNmMzEyMDEzZmQ0Y2NiNmU1OTkyMGE5Zjc2IFtQbGVhc2Ug
YXBwbHkgdG8gNS4xMC1zdGFibGUgYW5kIDUuMTUtc3RhYmxlLl2hsaGjDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KT1BQTw0KDQqxvrXn19PTyrz+vLDG5Li9vP66rNPQT1BQT7mr
y761xLGjw9zQxc+io6y99s/e09rTyrz+1rjD97XEytW8/sjLyrnTw6OosPy6rLj2yMu8sMi61+mj
qaGjvfvWucjOus7Iy9TazrS+rcrayKi1xMfpv/bPwtLUyM66ztDOyr3KudPDoaPI57n7xPq07crV
wcuxvtPKvP6jrMfrwaK8tNLUtefX09PKvP7NqNaqt6K8/sjLsqLJvrP9sb7Tyrz+vLDG5Li9vP6h
ow0KDQpUaGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uIGZyb20gT1BQTywgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBl
cnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2Yg
dGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBi
dXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0
aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVk
aWF0ZWx5IGFuZCBkZWxldGUgaXQhDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
