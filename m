Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C85506283
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 05:15:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngeKo-0002Ge-QV; Tue, 19 Apr 2022 03:15:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1ngeKa-0002GS-3w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfNb12YHWt5kMFST67us3RShkkjX+0SOazyV7xWOMeQ=; b=MFaRPgVVbRZXotA2tVw1enEKVs
 1lmSDyO8SMOi209PFLDiczb1pLsqu4Q+m3hgFSOr35Lu4ud0gMEMBCeG9LIz3s4V5oDMFl1K16wvz
 3PEIFoOigKgrC4CrnX0BsTxKwUYIa8dd01x/fHPnrcZ7IQlSOJROm+Zs30i5BJCNcR8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xfNb12YHWt5kMFST67us3RShkkjX+0SOazyV7xWOMeQ=; b=MIfuyE4559sRsqS5uBIZarAtFG
 I4g1Jd7+VscjmFLP5yyHbFYXecgLOhR1MbD0mzvhVoShZDJN4wyx+VseR/X9fAwAWhlv8LncqNm1S
 dYDii97IxfUNY+BUnH7wNk155qEDI7h+3kjQkACrd8EatB8JCV539+7CzrpWp1TEp0t0=;
Received: from mail-tyzapc01on2118.outbound.protection.outlook.com
 ([40.107.117.118] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngeKW-003Vif-DO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 03:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgIa0zMpXUqpv5m7SkWW70lhc3IoI1nlt6FNLXHU1Fn8HCQlTsD+Jru0jJMu+IJ6uNox7fXQDYWiRy1ogykjFP3UVmcvkYwRpznt9R3ZVUtCX2mSqMzv/cyIbkDg+0OvMtFvsM/YFFJ0r7/iDojF6bfJB6+AVGnGI+tbSkDQ84DjkmBxjdlLbO2jg5HZuihk42HHkyB16Y0LSNGyZRwJEc20xzsi/q3dsVXEDZQL31T2FqC2U5ArvVQFRs9P9gynzs9ZY88Xch75ZU+5qPKsWOeonlTRDZ88etGypnY4izDxpXcizo4q/HHK1le6VVPASwd2ksYp1oNGM6CmF7UVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfNb12YHWt5kMFST67us3RShkkjX+0SOazyV7xWOMeQ=;
 b=iSjEvbX9fSexyQ0nTHOMmQ4Mx063rIiYNTjrTB7Nb1OjIyPDB9mK4cXnFJm9fm5xKy8Sn7RqRGhmhAUKyC7r9DGeQWFaiPwsOqg6n4quOa0NWOqPg8HdczTDtGmgkQ5oml0KiYHXFHVvi1H6HtrZk2lzn2uyXX4vnK9lt2T+A8LZ/V/2aDCoh8uMw9MzKhRaBdVS7sB5P2OHXIm385umkS8MJN9tRXm1gYnU1dgvFMrKN+GFtvUZxKVUTMGBO1r6kp+Hy5pQyBNMdpOLdh0UPuGF/nkS6z15IE8D2KI01xUPG7QDjjsW/kiG/dmF1V2I2FBiVMnKzPtd/e8dSYAPng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfNb12YHWt5kMFST67us3RShkkjX+0SOazyV7xWOMeQ=;
 b=cQ8iif5iIyZvQjCEAnliqrUJIEK97nOgvelm2v432E2mm4EhisawPosbPkRbAOKGFfV6xuK98t+ZmhdPOU7czRthOGHBrpUuoEoWRaQ9q+FW0LoL+bysD8mZBH/EyzFusUuZ6/qlFWZ71mUuxFrlktKM6levHwdGJYRMHiT8WSg=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PU1PR06MB2088.apcprd06.prod.outlook.com (2603:1096:803:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 03:14:51 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%8]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 03:14:51 +0000
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [PATCH 2/3] f2fs: notify when device not supprt inlinecrypt
Thread-Index: AQHYUu45GoDAOd0+BUSILnKkLO2jc6z1RCGAgAABOZCAAPuzAIAATRAw
Date: Tue, 19 Apr 2022 03:14:51 +0000
Message-ID: <KL1PR0601MB4003A659B51814320E156C35BBF29@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
 <Yl0RmUoZypbVmayj@sol.localdomain>
 <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl3lxMnZ5teL+bkU@sol.localdomain>
In-Reply-To: <Yl3lxMnZ5teL+bkU@sol.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9978c1d6-46ed-4356-69c7-08da21b2c4c2
x-ms-traffictypediagnostic: PU1PR06MB2088:EE_
x-microsoft-antispam-prvs: <PU1PR06MB2088173680F0BB963A1B65CDBBF29@PU1PR06MB2088.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+9AQra5Cn2REruEXFDCmfaAouCU48qPUgTrrJM5AzXEi8rILrM+9X4gPYstIuHodjbxLO5LMxfR4mD4zXAzF1JXg2beCLnbbKbVFksmq3eTJV/+Vi2zcuuu2Rhyyaw2Rm8EeKoX02746PSxh2GP3Yt2JJEhVE4nCdaGayxaHZLo9bKTcMUsHu3+LbkjNgJR2jXNSYqlj0SS1dUckvpWQAM0SgKZLnhfM2lufPlsEgjNKnwjWnR5bBu234u7ElygnIO18rAplAWT99V02TSBeB+FYrecfRhSbHG7t8QSvcdetqDRBuYAz8BaSLzHmSoroLk2TyGFkPzGYGaRtsaEc8wPwshYjbwGnIIcZP7SkGItOh423hfTQSu4zD6zmSci5yn3pn4XvJ4aQ+u6cUwC48PlG1XfB6Q3G0GR8Hpaz3S8N31gTVbfxxhXQuLQv22hCoKVA9J0rodchKxfVxqSZ4FN3aNjAdGbFTPb8iE1SZWcTxV0Gm8NYPcMogBnP8mZEksrBPtrXGICF8pKI6D94QfWXxnT87ajNGLomHDwRnSD9hG8ve08c15OuiC42M+VmXSDEhJPqecs4N94l2wErou7uAkAs2JMvRTXTP0e3X1s5MHpCtXyF/MFP6+ynGzY/VrM1RzXlKI+clV7yJkdPPH4CCYhbTLo4bE44zbAgaXxGAEO6ShheYEck4BZfzzleBmAnbDJTYzwtJU3nwdPWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(38100700002)(38070700005)(508600001)(86362001)(66476007)(64756008)(66556008)(71200400001)(66446008)(66946007)(8676002)(76116006)(4326008)(122000001)(54906003)(55016003)(316002)(6506007)(85182001)(186003)(26005)(7696005)(53546011)(52536014)(83380400001)(9686003)(2906002)(5660300002)(33656002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTNld0hSWU14TFdmZTRaK3g2K0Y0d1ZDRTJRc3hCY3M3dVFGM0txdk0xcXBV?=
 =?utf-8?B?bTBlVG82RGdjWGdKdEVuWFJJb1N6V1U1dkxvUmFwZkhLZG8wMnhsd0ZRRkMw?=
 =?utf-8?B?SVVTYWRpZWtPTDVXeUoweU52eisrajZkcmlHWGlHVGNnQ0w1Q3Jua1huS0NX?=
 =?utf-8?B?QVVHaS9yZlZxeGhERm42NjJ2eVgyZ0xCem9pTlR1MlBIM2hpbUxhZ2tXRFR4?=
 =?utf-8?B?UVhDME0rWFYwQXBWTVlUbWYyc1ZQbk5pc1M1em9ZMmxiREVJMGh6VFJkVkhP?=
 =?utf-8?B?aHZuRE4yQXdCcGsrRGwvYTFtd0ZEa3FGeWJXU0UrWUo5TWJibHAxdTl0VEVN?=
 =?utf-8?B?TGE0RlhsKytpd1ZkL2dWMUliTWRqRmg3dnAzYU1CMG9JNHZGUHVlMS8reWNs?=
 =?utf-8?B?QVFSWVBXS0p0ZGc0ZFJ2Qk8vMjBEWkRaZDFwOEV5T2xjaVVPS2hsaU1OR1dN?=
 =?utf-8?B?dC96aWlielZla3BxS0d2NFlwaGxQWmFDRmM1WGZLQVlJMC9CM2hQVXJNak5R?=
 =?utf-8?B?TStzN0h5MDZuN0FNbExEQTNiNVJvVXdkTFlkT1ZKdXBnMEZIRXlNdU94eFlC?=
 =?utf-8?B?WW9SeFZySTl1eVMvdk9OL1FtbWtZL2FCZ2tkMmFJOTQ0VkJra3lPdWhTRVp3?=
 =?utf-8?B?eitSRnY5dXgvYzNoajk3U3dmVVBmSnlHSlc4a25ZSzQ1NkRlRVZKTGpEUUQ4?=
 =?utf-8?B?dDljSGI4MHBuVndNZ2oyZ3VwVE52TFlKQTZZV3QvTElvTnMyRSs4aFRyaFZZ?=
 =?utf-8?B?Vmw0T0puK3JKQm9heStSbHorSDB0R0ZXOEFIOUlmSU9BNGQxcFcxc0h6Rk51?=
 =?utf-8?B?dW9jNWdGb0VDUm9pTDZhTHpReVFVVjl6NmF3RHU2NnBuRFFjR3RYQmVlWW5s?=
 =?utf-8?B?NTIyWlVlYjdZY0NZR1JTejRLWDBPQzM2QU4yV041OVVjcFdPdHcrVkdXK3Nq?=
 =?utf-8?B?NUlZWVVQN1hidTF5UVNqc0ZFWVpTSXlPTGFMNXAzbHBmanBFTWpFUVBSbTU2?=
 =?utf-8?B?c203NkFtNnhtdmUvdEplYUp6bW1OUk83Zkt0Q1o4Y001Z2tQQWRoN3dlNG5V?=
 =?utf-8?B?cjVDMTl6VFpGQncvU0pOQTlDTi80RXg1TUNMZGJid2c5bWs1ZjdCOFRrYS9m?=
 =?utf-8?B?dTF3OHdMZHhCRkxHSGZHcEJCSWkxRzdwY2pyR1A3K0hXRFRDYlhvWjUrdWM2?=
 =?utf-8?B?UFJWVlBaZFBqUTlMZ2F0VzdPOStrR2pSMncwUXBEYy9rVSsyTDZKMVhHNVEz?=
 =?utf-8?B?TU11WDcwaWhqMXhWMmtmUzVSOFIwY1FyOWtEZG93bjJiQnpLbFBOUGtGWXF5?=
 =?utf-8?B?ejdmeGpvS1ZpejAwaWczZlp4OTkwSkx0RjRlMy85WGwwU3hIZTNVcU1lU1BH?=
 =?utf-8?B?eFVkNGQ4WGpVczRhSHR3dUdzK1JwVEhFU2lQNFI3bjNRR3p1Y1UwaGxMeGNP?=
 =?utf-8?B?c1V4M1pvQ2t1U1NncDVZWVZXeFZLR3RUQkhCZXduN3UvSzVyVkNKMUNuczUr?=
 =?utf-8?B?RVBLWkNacm5OWVpadEVLbFhWVjJxZkl6bExGMmhNZzlod0RkOW8wUjFSVXJR?=
 =?utf-8?B?aHU3M3VtV3doMHZCTUNiYWpvYTNjL2E0bmpUTUxjWTgzbWFxRDZqdHp1UDlM?=
 =?utf-8?B?dEtJM2lhVUhsV0s2RTMrbEpDQzNPSjlOanBPNUt4NjVMbElWNE5GaXZwajc3?=
 =?utf-8?B?bG94N3poWTdycHIvOFVmUWFndEU5U2ZOczBVazZ1Q3JEMExCYjNMdE5CRlVx?=
 =?utf-8?B?ZW5MK21LTTY4Q2pFa3VraVBqTGVuN2c0cTZRRGwzcWExK2FZYmpNeXpOTkRt?=
 =?utf-8?B?L0lxRjRMMUx3ZTBqSDRDS2hHUTJTOHExYmVCejhmWW9TbkRrUXg3Nzhoejhy?=
 =?utf-8?B?ckJlRktOYzRibXUzMzRmZHRFS2NWTk1VSm9mNk9CVjFtY1daRXpIUUduMWpw?=
 =?utf-8?B?cC9DTHR3N0VDd0dOWUcrQ1hsWjFpdklRcWlzZEgyTU5JQUtlQ2dmRE82YlJr?=
 =?utf-8?B?akQzNkFZSXAwSmFndmxBMTdVRk9nZG02SFU4NzhLQjBCZkgzVGxNVXhFUmRl?=
 =?utf-8?B?amtkTGpZYWxUbFA5V1F0WUFQb24rcjJ2QW1JZHJnc1lGaVlmSk4wUDFyM3JX?=
 =?utf-8?B?OW54UEZyTTEwaFQ5NDFFWFI0ZDJXdnJHMURLVmNFd3BlSENTM2JqakRIaW9J?=
 =?utf-8?B?ZUt5UlcwRTdmTFB4dkYwd2kzd3QrK1BpUlZBcWJmd0ZhN3VTRnRHT2xKdWhS?=
 =?utf-8?B?TWkyU1I1anlycmdyMGhXaWUzUC84WWRFZGdiREI0MFA0SHoyRkxrbDNTcmI0?=
 =?utf-8?B?ZE43OTNwdEcwTHJrcnZYak5uTURmaXJUZXJ0OFhVa0JmUGVYRTcxQT09?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9978c1d6-46ed-4356-69c7-08da21b2c4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 03:14:51.3464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9r8qiNOFZkPHDingftjlrnDzh6YLCo1qH/r5lv6pO+++SUjeAUf3yV2E1doqDHOaFFyMDRK4aBn7xWWIGEtJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2088
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
 no trust [40.107.117.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.118 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ngeKW-003Vif-DO
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
From: =?utf-8?B?5bi45Yek5qWg?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBCaWdnZXJzIDxl
YmlnZ2Vyc0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwgMjAyMiA2OjI3
IEFNDQo+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gQ2M6IGphZWdl
dWtAa2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnOyB0eXRzb0BtaXQuZWR1Ow0KPiBhZGlsZ2Vy
Lmtlcm5lbEBkaWxnZXIuY2E7IGF4Ym9lQGtlcm5lbC5kazsgbGludXgtYmxvY2tAdmdlci5rZXJu
ZWwub3JnOw0KPiBsaW51eC1leHQ0QHZnZXIua2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGYyZnM6IG5v
dGlmeSB3aGVuIGRldmljZSBub3Qgc3VwcHJ0IGlubGluZWNyeXB0DQo+IA0KPiBPbiBNb24sIEFw
ciAxOCwgMjAyMiBhdCAwNzozNDo1MkFNICswMDAwLCDluLjlh6TmpaAgd3JvdGU6DQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRXJpYyBCaWdnZXJzIDxlYmln
Z2Vyc0BrZXJuZWwub3JnPg0KPiA+ID4gU2VudDogTW9uZGF5LCBBcHJpbCAxOCwgMjAyMiAzOjIy
IFBNDQo+ID4gPiBUbzog5bi45Yek5qWgIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+DQo+ID4gPiBD
YzogamFlZ2V1a0BrZXJuZWwub3JnOyBjaGFvQGtlcm5lbC5vcmc7IHR5dHNvQG1pdC5lZHU7DQo+
ID4gPiBhZGlsZ2VyLmtlcm5lbEBkaWxnZXIuY2E7IGF4Ym9lQGtlcm5lbC5kazsNCj4gPiA+IGxp
bnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsgbGludXgtZXh0NEB2Z2VyLmtlcm5lbC5vcmc7DQo+
ID4gPiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiA+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzNdIGYyZnM6IG5vdGlmeSB3aGVuIGRldmljZSBub3Qgc3VwcHJ0DQo+
ID4gPiBpbmxpbmVjcnlwdA0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgQXByIDE4LCAyMDIyIGF0IDAy
OjMzOjExUE0gKzA4MDAsIEZlbmduYW4gQ2hhbmcgdmlhDQo+ID4gPiBMaW51eC1mMmZzLWRldmVs
IHdyb3RlOg0KPiA+ID4gPiBOb3RpZnkgd2hlbiBtb3VudCBmaWxlc3lzdGVtIHdpdGggLW8gaW5s
aW5lY3J5cHQgb3B0aW9uLCBidXQgdGhlDQo+ID4gPiA+IGRldmljZSBub3Qgc3VwcG9ydCBpbmxp
bmVjcnlwdC4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8
Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+ID4NCj4gPiA+IFlvdSBkaWRuJ3QgaW5jbHVkZSBh
IGNvdmVyIGxldHRlciBpbiB0aGlzIHBhdGNoc2V0LiAgQ2FuIHlvdSBleHBsYWluDQo+ID4gPiB3
aGF0IHByb2JsZW0gdGhpcyBwYXRjaHNldCBpcyBtZWFudCB0byBzb2x2ZT8NCj4gPg0KPiA+IFdo
YXQgSSdtIHRyeSB0byBtYWtlIGlzIHdoZW4gZGV2aWNlcyBub3Qgc3VwcG9ydCBpbmxpbmVjcnlw
dCwgZG8gbm90IHNob3cNCj4gaW5saW5lY3J5cHQgaW4gbW91bnQgb3B0aW9uLg0KPiA+IFdoZW4g
SSB0ZXN0IGZzY3J5cHQgZmlyc3QsIGl0IG1ha2UgbWUgY29uZnVzZWQuIE5vdCBhIHJlYWwgcHJv
YmxlbSwganVzdCBtYWtlDQo+IHRoaXMgbG9naWNhbCBtb3JlIHJlYXNvbmFibGUuDQo+ID4gRG8g
eW91IHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUgcmV2aXNlZD8NCj4gDQo+IFdlbGwsIEknbSBqdXN0
IG5vdCBzdXJlIHdlIHNob3VsZCBkbyB0aGlzLCBvciBhdCBsZWFzdCBieSBpdHNlbGYsIGdpdmVu
IHRoYXQNCj4gc3VwcG9ydCBmb3IgaW5saW5lIGVuY3J5cHRpb24gaXMgbm90IGFuIGVpdGhlci1v
ciB0aGluZywgYW5kIHRoZSBpbmxpbmVjcnlwdA0KPiBtb3VudCBvcHRpb24gaXMgYWxyZWFkeSBk
b2N1bWVudGVkIHRvIGFwcGx5IG9ubHkgdG8gZmlsZXMgd2hlcmUgaW5saW5lDQo+IGVuY3J5cHRp
b24gY2FuIGJlIHVzZWQuICBTZWUgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mc2NyeXB0LnJz
dDoNCj4gDQo+IAlOb3RlIHRoYXQgdGhlICJpbmxpbmVjcnlwdCIgbW91bnQgb3B0aW9uIGp1c3Qg
c3BlY2lmaWVzIHRvIHVzZSBpbmxpbmUNCj4gCWVuY3J5cHRpb24gd2hlbiBwb3NzaWJsZTsgaXQg
ZG9lc24ndCBmb3JjZSBpdHMgdXNlLiAgZnNjcnlwdCB3aWxsDQo+IAlzdGlsbCBmYWxsIGJhY2sg
dG8gdXNpbmcgdGhlIGtlcm5lbCBjcnlwdG8gQVBJIG9uIGZpbGVzIHdoZXJlIHRoZQ0KPiAJaW5s
aW5lIGVuY3J5cHRpb24gaGFyZHdhcmUgZG9lc24ndCBoYXZlIHRoZSBuZWVkZWQgY3J5cHRvIGNh
cGFiaWxpdGllcw0KPiAJKGUuZy4gc3VwcG9ydCBmb3IgdGhlIG5lZWRlZCBlbmNyeXB0aW9uIGFs
Z29yaXRobSBhbmQgZGF0YSB1bml0IHNpemUpDQo+IAlhbmQgd2hlcmUgYmxrLWNyeXB0by1mYWxs
YmFjayBpcyB1bnVzYWJsZS4gIChGb3IgYmxrLWNyeXB0by1mYWxsYmFjaw0KPiAJdG8gYmUgdXNh
YmxlLCBpdCBtdXN0IGJlIGVuYWJsZWQgaW4gdGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIHdpdGgN
Cj4gCUNPTkZJR19CTEtfSU5MSU5FX0VOQ1JZUFRJT05fRkFMTEJBQ0s9eS4pIGFuZCBub3QgZm9y
IG90aGVyIHJlYXNvbnMNCj4gDQo+IEFuZCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2V4dDQu
cnN0IGFuZA0KPiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0Og0KPiANCj4gCVdo
ZW4gcG9zc2libGUsIGVuY3J5cHQvZGVjcnlwdCB0aGUgY29udGVudHMgb2YgZW5jcnlwdGVkIGZp
bGVzIHVzaW5nIHRoZQ0KPiAJYmxrLWNyeXB0byBmcmFtZXdvcmsgcmF0aGVyIHRoYW4gZmlsZXN5
c3RlbS1sYXllciBlbmNyeXB0aW9uLiAuLi4NCj4gDQo+IElmIHdlIGRvIHdhbnQgdG8gd2FybiB3
aGVuIGlubGluZWNyeXB0IGlzIGdpdmVuIGJ1dCBpbmxpbmUgZW5jcnlwdGlvbiBjYW5ub3QNCj4g
YmUgdXNlZCwgeW91ciBwYXRjaHNldCBpc24ndCBlbm91Z2ggc2luY2UgaXQgb25seSBjb3ZlcnMg
dGhlIGNhc2Ugd2hlcmUgbm8NCj4gZm9ybSBvZiBpbmxpbmUgZW5jcnlwdGlvbiBpcyBhdmFpbGFi
bGUgYXQgYWxsLCBhbmQgbm90IHRoZSBjYXNlIHdoZXJlIHNvbWUgZm9ybQ0KPiBvZiBpbmxpbmUg
ZW5jcnlwdGlvbiBpcyBhdmFpbGFibGUgYnV0IHRoZSBmaWxlc3lzdGVtIGNhbid0IHVzZSBpdC4N
Cg0KVGhhbmtzIGZvciB5b3VyIGV4cGxhbmF0aW9uLCB0aGlzIHBhdGNoc2V0IGhhcyB0b28gbWFu
eSBjYXNlIHRvIGZvcmdldCB0byBoYW5kbGUuLi4NCkJhY2sgdG8gbXkgZmlyc3QgdGhvdWdodCwg
bWF5YmUgdGhlcmUgc2hvdWxkIGhhdmUgb25lIHN5c2ZzIG5vZGUgdG8gaW5kaWNhdGUgdGhlIA0K
ZGV2aWNlIHN1cHBvcnQgaW5saW5lY3J5cHQgb3Igbm90ID8gU28gdXNlciBjYW4ga25vdyBpdCdz
IGRldmljZSBub3Qgc3VwcG9ydCBpbmxpbmVjcnlwdA0KYW5kIG5vdCBmb3Igb3RoZXIgcmVhc29u
cy4NCg0KVGhhbmtzLg0KDQo+IA0KPiAtIEVyaWMNCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
