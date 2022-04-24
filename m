Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB950CEF9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Apr 2022 05:31:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1niSxw-0008MN-Av; Sun, 24 Apr 2022 03:31:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1niSxu-0008MH-P6
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diP8120XUHNZXfZrOJvvwR1fB0r6l3E7oEaHl4OkuVs=; b=nBP0R/hAaqNoFWcm3AgUXdjv6t
 +r78Qzsizi2yH3Ga3zKV3VKH8O7siXYVv8viZGpXrNS2A7nXHYyAxI+pxgCbgctiEAqf0cVgqrcXl
 Yn6ETm1/fInUntpwf9SeCAjYK/WpKNbDeG2B3uZWdL0omKrtbKeYvUEtc6WbPzA/OSGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=diP8120XUHNZXfZrOJvvwR1fB0r6l3E7oEaHl4OkuVs=; b=GH6P8KHGBBJ0omloF15Smbf8AD
 fviimWV07yygivDffoUSxxeuypAxyW0Ie9A1+ls4IEdxzZmTCt1ezfLUsIC1qm5bKnZdTo42MUYgF
 PNZ9GUpMCELt0OBfDIjfogwxyHNTakHkGQcy3FY2FBCMdOeZgMlbppoObqWUgV81ZYmo=;
Received: from mail-psaapc01on2117.outbound.protection.outlook.com
 ([40.107.255.117] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1niSxp-0082JO-HS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOME/efRcphwZtdkBK5JFnSERM8N/agm+bh6cKwKIHbRD5JoQJX/VGLjVYq+9miVdgidMy2Ueq2uvVqwE3UChDLFXib0H3Mz/TrGZ0U1DJq9/7EnYV0QaPlZ2BLazrCiBFzJAmu0zVlg/wNCFtjudjEIk/drQW3h+Rdl53jSaJzRTkZbG7q7bZm0Q0SUVu+G7zABVRN3Dj4jwGvkzV6TSUjBtukZAvp2G/qF20S159vIZnGGfv9nzsO0P1L428bt/mcdHn5Vbeo6i0Kg/iajEjN5T8zWjjiIo3U5oX1v8jE2ZVMjhlEo5D6zOL7XOexFw3gncb2985p+BL7BiqTIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diP8120XUHNZXfZrOJvvwR1fB0r6l3E7oEaHl4OkuVs=;
 b=lrON3NlfZXyVzdoKSDJxPBskgxyAFBcTcoM1lqBJfT+kExu+FP351EYKml/R2Iv5wekgvrwt7dkWAE4OS/lfsmmdTWi/XWYtD1eNTnZXmG+EZZ7m3CLhD/ik9Ck7kNk5x10ppOg4fT4hmh5aj6nOXp8lo9svfllsyLy6D+gq/CawKJa4AASKgX9f7mp1jL9I8gOvEqfDs6/PSIr6LQLQGGP1drT4ib83XQPeE8nU+MmFgiCWdt6fa5ufL44LNSJtT2FhOM80VMpI1SYZaqjqowIZaC+ul3YBBUbiZDfn9VDKSgNDeco4pN3Ofl3o3alOzyj2v5L9mEd6LhAUA38tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diP8120XUHNZXfZrOJvvwR1fB0r6l3E7oEaHl4OkuVs=;
 b=jNiQen4k9vh0olt7oOHQtHrvWNXO9XBwU6XEdBOVphyL5k3W2nnTjQhYKTGC90TUIKJoVjwqTW4vrt8Hs3/RerpeLzLnTDJLKwSVe+aCMYxYti/B6o6jYP9bTePmEdqQgXmy4KXaWQHFSWmkuRwN1VXVDMqCreTfb31+Ez0nzT0=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SG2PR06MB2811.apcprd06.prod.outlook.com (2603:1096:4:1b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Sun, 24 Apr 2022 03:25:28 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%9]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 03:25:28 +0000
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: support follword recovery for compressed files
Thread-Index: AQHYV4poRslbmRMwuk2XbwyMNq0mIKz+ZjDg
Date: Sun, 24 Apr 2022 03:25:28 +0000
Message-ID: <KL1PR0601MB40034CC86323B11A9F3C7812BBF99@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220424032127.435309-1-changfengnan@vivo.com>
In-Reply-To: <20220424032127.435309-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58dd1137-d4d4-4d2b-5fc2-08da25a21461
x-ms-traffictypediagnostic: SG2PR06MB2811:EE_
x-microsoft-antispam-prvs: <SG2PR06MB281176EA46F38995DD3012FBBBF99@SG2PR06MB2811.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MbBRlP6Zu82bYgR+c0Ms7hi5+JJKN0ym2dGRkWRoAVU4WIh56+NTd0QhSBVnVX46FEF318O5TlHYMROiBtCpoylWrHUYocRpsy3c4LLEOW0+/G6V/bIqhmhMxBrZK0M438iC1i/oiBARK3X1kdc6E9VsvYb/jqksxRvbBEfd7oz992O5zrAdko5xyIM5SsIgPBIR0zrDlH0vkcFz3Ol5dBD+fYBqBbfKlYm+gBukJ/Xgb2hnCHDQqdwh/HcQlu5N+exOBekFEreAij8+wKu+wu1dKTzWtHPT5ZS1yyyLCfVN9jGLd6DuOaKzGqMhxsbTmgnVohC1JoLAcf6gvIDwxjK+0IMbCbVrSEqMEhP7jn976aQbHGfSuEjWpwps1zh5EzISEo6WGCwAv6yFXm4X/jjML2mvTAm8gZWvzDZzTBGDc4Hfd9nlpgaiRRPuFCRuXyvtLBjIFQMmjMrn1c7+USEYmX+R1Z7Tr5WJ7aF9BzQgnr/o8ytsvGfQsy4ACh6WZqXtKUvyDXbFLttajXvvIkjcdFGMfcKbPewMKfJ8YhjYCmSqg3e2xuZFfOIjbme4fGhFRnVDdx/VWBoUlAMrdo6EE4nRwTN0+rDXVCxXqVQzGnTbQRoIuXE1s9UZR8mu3NEK47BK28prYlKRF/X/4Dg38K61K5ybI7kQxjzBpQ+YjiVYJ4D27uLrt4a9+KtzpoDhZVB9rhU3mR5oJ2cwCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(76116006)(122000001)(6506007)(71200400001)(66946007)(508600001)(55016003)(110136005)(316002)(38100700002)(38070700005)(53546011)(9686003)(26005)(186003)(85182001)(83380400001)(7696005)(86362001)(66556008)(8676002)(66476007)(66446008)(64756008)(5660300002)(33656002)(4326008)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZTVkbG0yZ1RZbWhHdkpJbzdzMks3bEpiOHZlWG1KakZ0QUVad1BpTUxwSXpX?=
 =?gb2312?B?blZhSVNML2VlbjBqNVRSMjJIOWRqciszYlZ2UEFsNFFwY051UWYyYTJIdWRM?=
 =?gb2312?B?bDBZNXYvallsNytrM0taQ3h6S2RMRWU0bUp3cm1lZjJvZ29SS3hJMDhkQy9E?=
 =?gb2312?B?aDROeHEya0pmOTQyWDJ1NC9TdWRRMkwweFQ4Rkh2YXJhbWhrRFA0ZURaNU94?=
 =?gb2312?B?cXFaWHpTdzNHYlgzTjNSUllJNG45b3ZMMXB6S0c1d1VsY0grTjZacTVCdTdr?=
 =?gb2312?B?RW1mSXliNHJiS1lJbUxucmtpL1d0eURRS2Jnd0g5WkFQa2FwTG9FaEx1T2VD?=
 =?gb2312?B?L1M5NVkydjFTZmplTFNrR0J2ZzZxRGhLL3AzWURUK0t3SE5CV0xrT2hiN1VM?=
 =?gb2312?B?NHBPOUVGNEwyRjcvZmVqNi91TjBCbFN0WjZUVUNsbWpDWit2REtoVUVEMkFs?=
 =?gb2312?B?M1ROeThmUlZCbzdlUUw4b09udUVGVWY4cGFjT1pjNi96d1ljNXU0STlHRm1i?=
 =?gb2312?B?Z1RpeFdSZnVvTTlibnpMeGNGbFh5VDF6RTBYTGQ1cWhsenpUU0NPVkIycita?=
 =?gb2312?B?djd0R1R4dHNzOXZSTmE1Tmx4cGVvanhRRkpFb3pQTmFYR2YxeXZtclJyTVNm?=
 =?gb2312?B?U3JHblZvcGkwM3htbG4xSXZDWk01VjlMZ2pTWWw5UGxaaVRxNCtRWGdVYXFL?=
 =?gb2312?B?bERTZmZmc2FmeDdzNVUydEJabG8yTTFxSnZTbzRwQ2RoYVNVNURjZ0ZOQmc4?=
 =?gb2312?B?cG8rRjdwSDh3cXp2ZzY0aUJFZDFHcDE0SmVMMjZRY25xMlA2RFh2MDJKUmRk?=
 =?gb2312?B?TFN6UGhIUzc5QVhzcGlnUG1LelZENXdvV2x1MDV6ZCtvYmtUL29CbDM1d0tC?=
 =?gb2312?B?eUdXdVIwVlBBcUZLcnQ5NnFONG9hTFV1b0x6bHNTREd2WmZhN3JKdzFoQ1Bq?=
 =?gb2312?B?eFBqeSt0UzIzd2svZFpac0gzZE4xSWZEcVNFYWZSQkxEcjRZTkpLRlE4c1M3?=
 =?gb2312?B?NnQzdnJiaVZmaU1ZQm5naVVVTHZ5NmlGK0Nxa0pJRDdwM096OEJqMThOVExo?=
 =?gb2312?B?N1VGUElxbTdmY2MrUGp0dmhXenJaYktwUVVwZ1VZektoTEF4V2x4TXY0RUs2?=
 =?gb2312?B?YWpmS0c1Zkc3OVV2NStQYXZLc3ZEWFl0akc0Y3E1Y0ZJV3gyTUhLT2pKRG1y?=
 =?gb2312?B?VTdIRzRpdThyVzhodXVNYzc0ak5PTVg5dUlYcGgxaHZ2clNlekhxQVJnNWpR?=
 =?gb2312?B?cGtsU2xQWVEvVzJDY24zQzRvRmFWR0R3RCtLbys2S1dCSXg1UWNDOUdjZjl0?=
 =?gb2312?B?Smk5SUk1a1MvaFJMTzI4WjEzenQ0T1ZMTjZISFJORHA5UzVndVNMRHZnTFNI?=
 =?gb2312?B?S2szbllHQ3hNVlNTNmlGbmxCTnlHSU1jd0NJV3JvSXVNNXJ4anNoengzUlJz?=
 =?gb2312?B?R25wT1plSTEzMUVWcGdJclFjWk50djFYbmJiUXFhVC8wZytBZmNrSFlZYkZ6?=
 =?gb2312?B?VjZUQ1Z3K29ILzJvS09yeUNqRFFpSXJuYlRocUh1ZFNuSXhIUkJSUE1qRmg5?=
 =?gb2312?B?TVJjeW9rcFFXMjZPWnJrT1JGb0V5cEdVZU55WkJxb2xuYTVUTTczakswK3pl?=
 =?gb2312?B?WlM3SG5XbWkrTmtsUm9qQkxmc1dmS0xwbzl2R1F1dHBHd1kzbVhtRERmRDhv?=
 =?gb2312?B?SEdublVRb1prbXZ5N2l0Sjczd1dqNFc5aG54U2xVUThNY08zb2x1MlJnWVMz?=
 =?gb2312?B?T1BaTXpVYjNhTXFUU20wb1IvMlBLSllDZmVvMXloVU5sNDhlS202OG84d1Bh?=
 =?gb2312?B?RVQzcHZvNGU3d0ZHMjFvejV5K0RvRU5nTmM1Qk1UN2JGQmFXM0VOblFORndH?=
 =?gb2312?B?QkFyT3pldkZ3OEl4NWNrMXVURkdldERIVGxEaHR1VUxNQVdJQWJOTVNEL3dE?=
 =?gb2312?B?eXMzNXZWNEo5N3BHNUJLR3VZazFUdm5VaWx3T1dxOGRFTzVmeTJpV3ZXMlN5?=
 =?gb2312?B?MjZTdlVkZmNqMHZRV2FuWlpsdmJIZ2E2VkwyU3JSbyswekNLVUJwVEc4YWNx?=
 =?gb2312?B?SnpQdER3RUtuMEVmMWt2eDhmWTRTYndrUzJkMjZWQ3JUTml2a1A3eVFneHRv?=
 =?gb2312?B?S2hnSE1wSFhlZU1Dd2xqSU1HSVpsY1psUjE0YVAvUVRWdzQ1cVRZamhmWHdC?=
 =?gb2312?B?TmNkanJiNzEyQTdEYXJxV2VRZ2hzVm13eUFnK0dmQWlWMjlPUGxNc3pYaENs?=
 =?gb2312?B?Si9NM3hCTVl6NWxZSjV6blN0Z0ZxenRhTTBlempCTlBQYnpZU0kzS1RRUjZn?=
 =?gb2312?B?b3BkTlpFcHFBZkx3cEtNOVpqS0swa29KS0ZKd1FhSmpKc2hCb0Q0QT09?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58dd1137-d4d4-4d2b-5fc2-08da25a21461
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 03:25:28.3201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSYvH56yP23q9Kf+szufSDcQwkKiSBrq54rKat/5GIBTmD0fMpPOdMHfEteCcdrAoLClBgELDRulAEhRetctjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2811
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Please ignore this... I'll send a new version. Thanks. > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.117 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.117 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1niSxp-0082JO-HS
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: support follword recovery for
 compressed files
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
From: =?gb2312?B?s6O37+mq?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGxlYXNlIGlnbm9yZSB0aGlzLi4uDQpJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbi4NCg0KVGhhbmtz
Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206ILOjt+/pqg0KPiBTZW50
OiBTdW5kYXksIEFwcmlsIDI0LCAyMDIyIDExOjIxIEFNDQo+IFRvOiBqYWVnZXVrQGtlcm5lbC5v
cmc7IGNoYW9Aa2VybmVsLm9yZw0KPiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQ7ILOjt+/pqg0KPiA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiBTdWJqZWN0OiBb
UkZDIFBBVENIXSBmMmZzOiBzdXBwb3J0IGZvbGx3b3JkIHJlY292ZXJ5IGZvciBjb21wcmVzc2Vk
IGZpbGVzDQo+IA0KPiBUcnkgc3VwcG9ydCBmb2xsd29yZCByZWNvdmVyeSBmb3IgY29tcHJlc3Nl
ZCBmaWxlcywgdGhpcyBpcyBhIHJvdWdoIHZlcnNpb24sDQo+IG5lZWQgbW9yZSB0ZXN0IHRvIGlt
cHJvdmUgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2Zlbmdu
YW5Adml2by5jb20+DQo+IC0tLQ0KPiAgZnMvZjJmcy9ub2RlLmMgICAgIHwgIDcgKysrKysrKw0K
PiAgZnMvZjJmcy9yZWNvdmVyeS5jIHwgMTAgKysrKysrKysrLQ0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYyBpbmRleA0KPiBjMjgwZjQ4MmM3NDEuLjUwMjEx
ZThlN2VjMyAxMDA2NDQNCj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMNCj4gKysrIGIvZnMvZjJmcy9u
b2RlLmMNCj4gQEAgLTI4MDMsNiArMjgwMywxMyBAQCBpbnQgZjJmc19yZWNvdmVyX2lub2RlX3Bh
Z2Uoc3RydWN0IGYyZnNfc2JfaW5mbw0KPiAqc2JpLCBzdHJ1Y3QgcGFnZSAqcGFnZSkNCj4gIAkJ
CWRzdC0+aV9jcnRpbWUgPSBzcmMtPmlfY3J0aW1lOw0KPiAgCQkJZHN0LT5pX2NydGltZV9uc2Vj
ID0gc3JjLT5pX2NydGltZV9uc2VjOw0KPiAgCQl9DQo+ICsJCWlmIChmMmZzX3NiX2hhc19jb21w
cmVzc2lvbihzYmkpICYmIHNyYy0+aV9mbGFncyAmDQo+IEYyRlNfQ09NUFJfRkwNCj4gKwkJCSYm
IEYyRlNfRklUU19JTl9JTk9ERShzcmMsIHNyYy0+aV9leHRyYV9pc2l6ZSwNCj4gaV9sb2dfY2x1
c3Rlcl9zaXplKSkgew0KPiArCQkJZHN0LT5pX2Jsb2NrcyA9IHNyYy0+aV9ibG9ja3M7DQo+ICsJ
CQlkc3QtPmlfY29tcHJlc3NfYWxnb3JpdGhtID0gc3JjLT5pX2NvbXByZXNzX2FsZ29yaXRobTsN
Cj4gKwkJCWRzdC0+aV9jb21wcl9ibG9ja3MgPSBzcmMtPmlfY29tcHJfYmxvY2tzOw0KPiArCQkJ
ZHN0LT5pX2xvZ19jbHVzdGVyX3NpemUgPSBzcmMtPmlfbG9nX2NsdXN0ZXJfc2l6ZTsNCj4gKwkJ
fQ0KPiAgCX0NCj4gDQo+ICAJbmV3X25pID0gb2xkX25pOw0KPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9yZWNvdmVyeS5jIGIvZnMvZjJmcy9yZWNvdmVyeS5jIGluZGV4DQo+IDNjYjdmOGE0M2I0ZC4u
YzAxZDNhM2U1NDEwIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL3JlY292ZXJ5LmMNCj4gKysrIGIv
ZnMvZjJmcy9yZWNvdmVyeS5jDQo+IEBAIC02MzYsNyArNjM2LDYgQEAgc3RhdGljIGludCBkb19y
ZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiBzdHJ1Y3QgaW5vZGUgKmlu
b2RlLA0KPiANCj4gIAkJc3JjID0gZjJmc19kYXRhX2Jsa2FkZHIoJmRuKTsNCj4gIAkJZGVzdCA9
IGRhdGFfYmxrYWRkcihkbi5pbm9kZSwgcGFnZSwgZG4ub2ZzX2luX25vZGUpOw0KPiAtDQo+ICAJ
CWlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihzcmMpICYmDQo+ICAJCQkhZjJmc19pc192YWxp
ZF9ibGthZGRyKHNiaSwgc3JjLCBNRVRBX1BPUikpIHsNCj4gIAkJCWVyciA9IC1FRlNDT1JSVVBU
RUQ7DQo+IEBAIC02NjksNiArNjY4LDExIEBAIHN0YXRpYyBpbnQgZG9fcmVjb3Zlcl9kYXRhKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4gc3RydWN0IGlub2RlICppbm9kZSwNCj4gIAkJICog
YW5kIHRoZW4gcmVzZXJ2ZSBvbmUgbmV3IGJsb2NrIGluIGRub2RlIHBhZ2UuDQo+ICAJCSAqLw0K
PiAgCQlpZiAoZGVzdCA9PSBORVdfQUREUikgew0KPiArCQkJaWYgKGYyZnNfY29tcHJlc3NlZF9m
aWxlKGlub2RlKSkgew0KPiArCQkJCXJlY292ZXJlZCsrOw0KPiArCQkJCWYyZnNfdXBkYXRlX2Rh
dGFfYmxrYWRkcigmZG4sIGRlc3QpOw0KPiArCQkJCWNvbnRpbnVlOw0KPiArCQkJfQ0KPiAgCQkJ
ZjJmc190cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZSgmZG4sIDEpOw0KPiAgCQkJZjJmc19yZXNl
cnZlX25ld19ibG9jaygmZG4pOw0KPiAgCQkJY29udGludWU7DQo+IEBAIC03MDIsNiArNzA2LDEw
IEBAIHN0YXRpYyBpbnQgZG9fcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwN
Cj4gc3RydWN0IGlub2RlICppbm9kZSwNCj4gIAkJCWYyZnNfcmVwbGFjZV9ibG9jayhzYmksICZk
biwgc3JjLCBkZXN0LA0KPiAgCQkJCQkJbmkudmVyc2lvbiwgZmFsc2UsIGZhbHNlKTsNCj4gIAkJ
CXJlY292ZXJlZCsrOw0KPiArCQl9IGVsc2UgaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2Rl
KSAmJg0KPiArCQkJCShkZXN0ID09IENPTVBSRVNTX0FERFIpKSB7DQo+ICsJCQlyZWNvdmVyZWQr
KzsNCj4gKwkJCWYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4sIGRlc3QpOw0KPiAgCQl9DQo+
ICAJfQ0KPiANCj4gLS0NCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
