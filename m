Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E050948A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 03:12:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhLMo-0003ma-6A; Thu, 21 Apr 2022 01:12:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nhLMm-0003mU-AW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 01:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mS0PvV3F8cqET1Pnkz4aMpPTuSfNRYjXA8QwHLJ/Pa4=; b=TVxLJIGRtC4uUo7qSnV/uegYkj
 w2itumtPCHnVcI7ObPQrwdvH6uxxXaS0OmME6Uen3Uda9Fu1rF4zEDXdb9a7C7FcJEvGabzQ7omMK
 cloN/oCVi/LoJt/kE1SyzLzhOUQAJ2oH8BOvadI0RpBqdfJbTJQfLoATSLIF5MmtprIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mS0PvV3F8cqET1Pnkz4aMpPTuSfNRYjXA8QwHLJ/Pa4=; b=j+xfSbN96zpoiZqQgh0N+GZ1Ts
 SkI9pIyN1GXVPCgp6WwVUmpUBWax+9DiFK+q33DFDoC2GeDaE7IkoTbB+LdkRvDJM9L2JodFFrdhd
 6r7dKY9nDgmCDvII2zmCCEAZniGQosh88SaQ3P/LQa8jagjDENQy0NmvUuAT4sM/RJHc=;
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhLMh-0005fW-Q3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 01:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1650503532; x=1682039532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mS0PvV3F8cqET1Pnkz4aMpPTuSfNRYjXA8QwHLJ/Pa4=;
 b=WR6NsP8Q9t53V/2hnoui+Lm2JeavSQq9KrBP7yGMafD3++1wT4Q7/bhS
 jZo5sjgM5v+KdTsiL4Z84mkqQ9rlHT5ZLcG+QigS7wavezYgciNw6Bkmq
 N7vYjHy6wEs2fvHssv5CA8DhOEDQT07tA2liopH4TOFUEBB2qTSyg2r+b
 Lh4R/hSPe1+UXPZqUQSKsRkHuI6DpZwHvXFQ/W0/g65Zrv7aFmzHUrP6t
 P/E9AcBA/agRbsIZfDYDSnzkYjyqYCjlMfcUZyddITaiwOye+uW7oT/ST
 1NDJ4S5ylcTBgGdEvxK6RXwpJw2KMefADgQke5odwx3MQ+v6MZd2J+UqG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="54356804"
X-IronPort-AV: E=Sophos;i="5.90,277,1643641200"; d="scan'208";a="54356804"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 10:12:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjKJ0RUoilwZRUFLBSo5MiEHvciLQpmwE7kD42g329sagixF3zPdhTgBT+S7tUrCEarLNfblgarnW7pv0Yu26yt8ncr52UJVc/o7FvthlZRR8gi1UzP8VIPsDRcZSYMQZKnmFNNc7b4UG4r4XaHmld4126ysDzMYkGFek6KEGBCId/W6ox5XYt7S4gypfRfKbWUmVLl0w/dQYwi2t6d2Ao9kdCGU+3BWERPjgCwE/CKLn6Zda/1evksut26dmBL+vvH+fkqEJbMyb5r1I+1k19hzONnsG4No0rblE6rkJod+nepagnHDJg2RNAXef9jLrJq2TczSSAVxhvCfWW9tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS0PvV3F8cqET1Pnkz4aMpPTuSfNRYjXA8QwHLJ/Pa4=;
 b=ds7GFgUOVwABkrwkaZSjlwrDhKSck+ixQoxuJmf9ul0eQ6GwBb+LawlWS9+KztmUi8IPZPyupeD+RVA7zrGuPZIBlGGDjoJE0QRYc0ZdEfXIjqgOl7bcWnzvCVp3rNWW/zJIikUIL2EDQHH7f8somAOmqDn0K4uS+f0XLd1xGdX1U1zhqgN6DwQovShHawJGAgZfM33OmW1rr2sYOEWnHhoCgMNJxGwYVhHdmurEoYEmIusCi17jMxPbF7F2lSw0QgYscIg8fcseRHAIyHAid+TVmz+U3JjzpQhW8lQyLZZgh7yGz/iasUE8sWvddKsFAaEzAANcuqEepyEJYUcgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS0PvV3F8cqET1Pnkz4aMpPTuSfNRYjXA8QwHLJ/Pa4=;
 b=kblL3avbz16lV6En4rcAU2m0X4TAwn01Xk1rdOc3tdXjXgCvkwkyCaHDNdJMeElhYKRrNq2z6V2SqU7pTJVPoxbL9GsYJW7cv6fCmtFsTnepM+vETw1jfMFxru5JZWbAKruAKta76niNhROumhYGLx2QkbuogyqUw/c4dBXZQL4=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by TY3PR01MB10060.jpnprd01.prod.outlook.com (2603:1096:400:1df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 01:11:57 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 01:11:57 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Dave Chinner <david@fromorbit.com>
Thread-Topic: [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
Thread-Index: AQHYU9rGMcoXoXAhFUC0+s6Sqe+NAqz3RT4AgADPzgCAAUU2AIAASLwA
Date: Thu, 21 Apr 2022 01:11:57 +0000
Message-ID: <6260BDB8.3020001@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <20220419140508.b6c4uit3u5hmdql4@wittgenstein> <625F6FE6.4010305@fujitsu.com>
 <20220420215252.GO1544202@dread.disaster.area>
In-Reply-To: <20220420215252.GO1544202@dread.disaster.area>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b106fc63-0dd4-41f5-804d-08da2333ee23
x-ms-traffictypediagnostic: TY3PR01MB10060:EE_
x-microsoft-antispam-prvs: <TY3PR01MB10060303458DBC5072B163B1CFDF49@TY3PR01MB10060.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HK5vpFVvybv3nKj/C1u2xGCP6sc4TDAU/GaZgnE1Eu+ovPqFh3Eq77joKZQVvZXqkpoTrqA6gWfB8/pb1WbpscQBbvCj0vEmxh/1nWrH5P/u+4PPzLwoIR7mMGqVL07VTE/GHZkX0qqj52Cb/E9STd9ANp0gwljY+oZoi0Up8Dx0oUbIyC9tUW9xTRR8f/xayBkgafULCQlPSvf0ysUIZPtOrPFYZU3fB16ytjItXyxW42RVSp2xXP+CSazI+lwG8B6Rr9+1yyDW8GDvHCT4VJsep5QmrZKfAbVjXuh3VphV/vpbEg4teuFhqBv/hdzvu6n+n8Gv8CRvWv25pcSbHnD/5NY35p3fYkdVY4+ZDqvTuKhCL3iablaAetLqBu+iE+0AIhX7JsW8zkpLgBT5/U7VKHRs19Pllkw0VHaepr7FTqCxlBbw9gdFW+8w+ZFiqzfl/+wa+0/GJy2dol5gNZyRyVeq/EpSBPGSseTxjvzAlWRERc7Lv8spF7RTeFQapi74FdRYVIUOX7wQqTRILdy6PKLnrIg92of0WlFx3APJgTlFoAkg+8hrAxKk1SF2E0CMyoXFV9p7HBGfL50mQpSmEGvVIzXe1v3S0PeoEUjXvzhZ9KaNtTquAxWxev+DrXtvrmKb1PZsvkHcA8YkWRHuqdciSFNkvAZ2Auc8LyyR7dl04H3zAz3YJK5a8mfYEEFUZl5oxM03MkVtdCbV8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB4427.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(85182001)(6916009)(122000001)(66476007)(54906003)(76116006)(66946007)(91956017)(64756008)(2616005)(4326008)(8676002)(66556008)(66446008)(508600001)(33656002)(71200400001)(83380400001)(26005)(38100700002)(87266011)(7416002)(316002)(8936002)(82960400001)(45080400002)(186003)(86362001)(36756003)(38070700005)(2906002)(6506007)(6486002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Y1N3cjF3MHdNSFgveDNZbmtnTG0zd0YyOUJ5WnVDUzVjd0JWa3FCWFgxZ0hL?=
 =?gb2312?B?dXRQL3FaZnJpUEhrdGF2dkJROGUxZVA4cEFTdVczWGcyWG5kSitLSU8vV2d4?=
 =?gb2312?B?cDRqWHFzWnc4VkhISEMzNy9WTnlSZ3cvTHRUNVpQbVN0c05qcUR2SjNCTUp3?=
 =?gb2312?B?N2l0RVlRTnQwZDBoMTh1VHR0YXFpWUE3OVlwTmMrZHBWT0tEbks0dFpxV0ZK?=
 =?gb2312?B?bi81WHk5VnN1MW9GZHNaUFh1dHU2ZG82eXI0Zzc2cDJQNjEyTDlEQnBUVTU2?=
 =?gb2312?B?eFJrMW96d2dYOVFtS0dLczNjVlJKeVhTQUtEa2tZejVkVHc2cXZiS0VocE81?=
 =?gb2312?B?d0pJUzZURmhzcFIzOFA4TnBhSzYvUEkxd2ExZEdSQ3VLWURlRVZKQjBYVjF4?=
 =?gb2312?B?UHg0WVRidHBCcU5WdVlBaGVMejl0S1hxdEtHR0ZjT3UrNXRrRVBlQ1FGQ1Vu?=
 =?gb2312?B?YTJLTkpOT3h5RmV5Qkt4c0ZJN1dMbVA5a1REdmUwc2wwOUFKcFRpWElJNXpv?=
 =?gb2312?B?enFKZ21hd3ZnZUJ6UnNGanZSSlhHWUVSS3BZL0pRWFc2UFdYL2E5MXFIWGJn?=
 =?gb2312?B?OXdxL2xUV3JpRldQTkxibUQ1M3dBdC9rZ1o1K1VNbGtzeVJZVTRLMUFvYyty?=
 =?gb2312?B?VStvdVF0b3dBblg5OG11VkRKMms4TFdsNHFCdzRqdzJuN1MvVkhDWnF1MXph?=
 =?gb2312?B?NGR0WXkxWHRrTkRjcTJvK3BWb1lQdHM2R0ZHK0kwSFAvb1JhM1M3UGEzeHEx?=
 =?gb2312?B?UE9oaCtPYXpkYXF0TTBINWpLdGdLcmZVcnBYMW5vTjI1akN3c3VpejdOVzJn?=
 =?gb2312?B?TmxIOW1lSzZDSjNwWmxGWndkS3hCRXY2ck04bWRYWndvWklEd1ZYU0FUR2lr?=
 =?gb2312?B?d3JKeEg1UkVoa050VnQ1YjNIb1VNMnZvNlMvYm1Ea0p4OGM2QTV3YzlwVEhk?=
 =?gb2312?B?bVVTMW0zeURjNlF3YkhzQUcwK21abysyZzlVN2FaV1RTQ3NYVFgxaGQ4c254?=
 =?gb2312?B?QndCZFFRZm81UmxrYlp2dHlseFFTWWdpUGQvWnNYWWtTTG1obFRPK1g2QWJ5?=
 =?gb2312?B?aEdnbWVMWTgyRW5OOWFvRXlVNjVPVDNRaEVKNml5d09GeUZNOEZzL3ZhRVhD?=
 =?gb2312?B?aVBJOVNlTmw2enJBMXhINFRORThrNzM4aEJkOGprM3ZFZG5Yd3d4NThhSXZi?=
 =?gb2312?B?b0x5bm5HNFZIMXhNb20vN3RXRy9wSUpqYlFUcXVMazNQOG5ISXFjVzViWmZT?=
 =?gb2312?B?WGd0cnpOdS9Zek8zMWt4dHlYc1A5Yzd5SjRRMHdmUUxKVEZ0eXlhRm9rVUhs?=
 =?gb2312?B?aVZmMVhzQkp6N3o5YkxFZ0tud1NRWEVicnZxMHA2VnZWVHFkYzJ2WVFoWndq?=
 =?gb2312?B?M2dCcU8yQjZuem9kcHZkdUsxQXErclFuQ1B0YUE0eHlXeVd1NFB3MGtzdXhY?=
 =?gb2312?B?R0lNeldaVmRGVTg0RFZ2ZE4rNGtHREFmK0dTOTV2Z0lOT3NZRE5UeU9CNnFi?=
 =?gb2312?B?emI0UkNIdExnK0FDUGt3Z3VFWW5zQm04SWhINjJTT1pqTTAwaFNFcTRJekJR?=
 =?gb2312?B?cDZzZFhZbmdIMWsyOGIzQS81Wk1uNVNyT28wSitsQjZ0eDhOYlMzZmRFc3Ry?=
 =?gb2312?B?ZDB3UUFYVndjdnpHQXhhaVZYb09DQS9oeURnRmJYdHpPdlVmc3JZeEtKWDFq?=
 =?gb2312?B?ZVlmRjZwM1F0WUg4ZVBrT0g2TXpMMXBLVDVxUmZDQ2dvc1duMmcydE9oRE05?=
 =?gb2312?B?OG1UTmZpcG94VEZ5WDhWdEI0dGt5WXkzeGpwdXZkNWd3bC9yRmtURDRaU2hk?=
 =?gb2312?B?UXJ0bUs5M0JWbkFyMG1remZ4cFZvR3hySk1tMUJBTVZ5L1lOdWsxbkRHVlJP?=
 =?gb2312?B?LzFUUk94Yi9EM0crY1p0dTlSYVNpdjNTRStzNi9GeVdtajJ0WXM0UjdXMnk4?=
 =?gb2312?B?QytscUZmRWxzV2E2empxa1hkTGpEMHMrNDRqaGhEamFHaEJ1dE5CQjMwYUgz?=
 =?gb2312?B?N0VsVFFpeFBKajc3QXl4anZXWkVKYU53Z2IrekExT0kvcjJXSzZBSHpwZERT?=
 =?gb2312?B?Z0Z1aEtaWTVsVmVaNCtua2w3cGtYaFBVK3gxSHpubXFpQmFKZXRYQWx2M2Ry?=
 =?gb2312?B?ZEYvNkNOUjYxcXNLampDVFBySEJHYTFwVk42bmp0bDJFSithVmRnUWxRNUxP?=
 =?gb2312?B?YU9XZWNSTmYyUERqKzU2WWR3M0c4YkNjWHpSYWVwUnFzcG56cmtlRHg2dEhu?=
 =?gb2312?B?NW1oUGVhNFI4ODBDQndIbEJCT1JnWFRPMVNRSzh3Zmx3VGpKWGllRktXQXQr?=
 =?gb2312?B?Q1ljakJVeGRSQytWcjJ6RGFHMmdWOUlCZjRhZTBaakIyb3RWUXhHNGhERmR2?=
 =?gb2312?Q?dmKDMqUd2uw8eEvUwQoUPdCeHn+Ja2ZTfdaSE?=
Content-ID: <91BC94D3CE65E147B59FDAB845BA23A2@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b106fc63-0dd4-41f5-804d-08da2333ee23
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 01:11:57.1642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAMKYS38UFeDmC3Cg/C/VTHBkWzi8GV5+0kB48iS5bwX0EMIhMyeTUxsWtxT9Qp8/tspeEFQWtEPEWfkOYCSwbqFUEP65cYDRHaoKcp/u5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10060
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  on 2022/4/21 5:52, Dave Chinner wrote: > On Wed, Apr 20, 2022
 at 01:27:39AM +0000, xuyang2018.jy@fujitsu.com wrote: >> on 2022/4/19 22:05,
 Christian Brauner wrote: >>> On Tue, Apr 19, 2022 at 07:47:07 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.159.83 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1nhLMh-0005fW-Q3
Subject: Re: [f2fs-dev] [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
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
Cc: Christian Brauner <brauner@kernel.org>,
 "djwong@kernel.org" <djwong@kernel.org>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

on 2022/4/21 5:52, Dave Chinner wrote:
> On Wed, Apr 20, 2022 at 01:27:39AM +0000, xuyang2018.jy@fujitsu.com wrote:
>> on 2022/4/19 22:05, Christian Brauner wrote:
>>> On Tue, Apr 19, 2022 at 07:47:07PM +0800, Yang Xu wrote:
>>>> This has no functional change. Just create and export inode_sgid_strip api for
>>>> the subsequent patch. This function is used to strip S_ISGID mode when init
>>>> a new inode.
>>>>
>>>> Acked-by: Christian Brauner (Microsoft)<brauner@kernel.org>
>>>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>>>> ---
>>>>    fs/inode.c         | 22 ++++++++++++++++++----
>>>>    include/linux/fs.h |  3 ++-
>>>>    2 files changed, 20 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/fs/inode.c b/fs/inode.c
>>>> index 9d9b422504d1..3215e61a0021 100644
>>>> --- a/fs/inode.c
>>>> +++ b/fs/inode.c
>>>> @@ -2246,10 +2246,8 @@ void inode_init_owner(struct user_namespace *mnt_userns, struct inode *inode,
>>>>    		/* Directories are special, and always inherit S_ISGID */
>>>>    		if (S_ISDIR(mode))
>>>>    			mode |= S_ISGID;
>>>> -		else if ((mode&   (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)&&
>>>> -			 !in_group_p(i_gid_into_mnt(mnt_userns, dir))&&
>>>> -			 !capable_wrt_inode_uidgid(mnt_userns, dir, CAP_FSETID))
>>>> -			mode&= ~S_ISGID;
>>>> +		else
>>>> +			inode_sgid_strip(mnt_userns, dir,&mode);
>>>>    	} else
>>>>    		inode_fsgid_set(inode, mnt_userns);
>>>>    	inode->i_mode = mode;
>>>> @@ -2405,3 +2403,19 @@ struct timespec64 current_time(struct inode *inode)
>>>>    	return timestamp_truncate(now, inode);
>>>>    }
>>>>    EXPORT_SYMBOL(current_time);
>>>> +
>>>> +void inode_sgid_strip(struct user_namespace *mnt_userns,
>>>> +		      const struct inode *dir, umode_t *mode)
>>>> +{
>>>
>>> I think with Willy agreeing in an earlier version with me and you
>>> needing to resend anyway I'd say have this return umode_t instead of
>>> passing a pointer.
>>
>> IMO, I am fine with your and Willy way. But I need a reason otherwise
>> I can't convince myself why not use mode pointer directly.
>
> You should listen to experienced developers like Willy and Christian
> when they say "follow existing coding conventions".  Indeed, Darrick
> has also mentioned he'd prefer it to return the new mode, and I'd
> also prefer that it returns the new mode.
OK. I just don't know  the "follow existing coding conventions" reason. 
Now, I know and understand.
>
>> I have asked you and Willy before why return umode_t value is better,
>> why not modify mode pointer directly? Since we have use mode as
>> argument, why not modify mode pointer directly in function?
>
> If the function had mulitple return status (e.g. an error or a mode)
> the convention is to pass the mode output variable by reference and
> return the error status. But there is only one return value from
> this function - the mode - and hence it should be returned in the
> return value, not passed by reference.
>
> Passing by reference unnecessarily makes the code more complex and
> less mainatainable.  Code that returns a single value is easy to
> understand, is more flexible in the way callers can use it and it's
> simpler to maintain.
OK,  it sounds reasonable and will use return value.

ps: Of course, I will remember this in my mind. Thanks for your replay.

Best Regards
Yang Xu

>
> Cheers,
>
> Dave.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
