Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6154CFCA8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 12:23:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRBSy-0000aZ-4l; Mon, 07 Mar 2022 11:23:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nRBSv-0000aP-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 11:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuZ2uZPapY1PZzCDiSMv21U2ZS9tD0Uwx69gYrFjRiA=; b=fj7wj3x+j6fDBk9+8NRxmxhYtk
 MxnnkBOD0Q0YkL9bc9ALzlMqCzteSXJmoPkdCV4zAlfxplmtlqSgKYqNytQfjVXWWpezcgvjTGQAD
 9zdt7L3UHh/9KyS9R3Sx4yLVqoCK5ZiAbdMJTXjHx17q/MvXum36mBpo83ZKeBqSUusY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TuZ2uZPapY1PZzCDiSMv21U2ZS9tD0Uwx69gYrFjRiA=; b=RGyJrnbASI+YgYj2d2CZ8tSwZl
 e6DT8gOAYFHAFLgsN6a4MB0ZZiu+nb8vXQ8vqnk+E9HPopssTcXJpKPPss9x4n9rQFg4O1kPvNEpz
 hUEA7UZTRGNBwBweoGJf5Rew3nIGnnDlfcl6T+/H4HnDxNdq/s2ZpAuymuzg+sJN9xQk=;
Received: from mail-eopbgr1300125.outbound.protection.outlook.com
 ([40.107.130.125] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRBSr-007KQi-8D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 11:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS6s/p9X8SyIjgj2/idGA4FxeqCJ23ULD3uHndND4I1MMn0cTE4FSKtDJ2aVtSrbFPPg4Sr59sWxD5KJu6RTZEsFAKm+/9aVmnWpoUtzfCsdIp6AK11c/OO243MYVDW/n8rgBxI7opE19DOa8DyEvaYOcZpJvZkWoyw4JOgzfKwEiKs0W1B+e17+bj+u0hoxC6T85YLQnetaXy4WaxFGajWP18BBxHykfWkhZgR/eGR1X2Pu6XJD5y+Kbsw1LNtMskcvc6MAN4EBOiN/3piE/CpAxpQ6gnS59tHyiDVu++LkIizLcxw6SxTm8PJdAKSKt0uhFzox4DBaN8ub8Rkd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuZ2uZPapY1PZzCDiSMv21U2ZS9tD0Uwx69gYrFjRiA=;
 b=brb20icxpvmNasxRH8bmrqMT90GBpf0AdNjdzS5S1Ee1iCw2tHhfVv7IZaQN+I+wyD1yo7ruwkEnC5Izah1vHJwDhrrmOVvSpAM6ibrLH8jOjJCyjvSJC3k3SZhSInuoi+eQGzzVS5hoGEvj8RfXdmJI6B5L4VgqIENPWYJpMFQIEf0NRjZ1tRPUaz1nwgLdCj6zaxaXv18ZsvRBHxpkgBiTmu0Lwdni/g+efUcv3pTZUcaGNVkzuSVK7ectJnUjqrgFcC3/BNRtERLW5zKRYb5jCX+5kIctrDgQv2G+7jh6y5PBCIwzHvry96eTkAejaFc138HYkXdn08ay+yPIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuZ2uZPapY1PZzCDiSMv21U2ZS9tD0Uwx69gYrFjRiA=;
 b=dthosvufxrWcDNMKHl5JtStACL89dYkQ4dTKiHD3EW6/aM85j67mlDWK/mkQ1u9dbYQtu3txSlMMh8s/s4Cru6oFio71LY/TKtg068CVsyOHPE8GXLEfjEHHhChu3/FqBmd1eBzoXsMFVP7FUpDzena0Z2jEf/4sSnIsjXm+2gc=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SG2PR06MB2442.apcprd06.prod.outlook.com (2603:1096:4:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Mon, 7 Mar
 2022 11:07:41 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%8]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:07:40 +0000
To: Chao Yu <chao@kernel.org>, Fengnan Chang <fengnanchang@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: fix compress file start atomic write may cause
 data corruption
Thread-Index: AQHYMEWV1GPMOM+dJ0u8RV72JQzQt6yzKM6AgABlLGCAAC30AIAACWJg
Date: Mon, 7 Mar 2022 11:07:40 +0000
Message-ID: <KL1PR0601MB4003900FB74F94306BA32EA6BB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20220305040019.225150-1-fengnanchang@gmail.com>
 <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
 <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <a9cbd24b-9da8-9f92-dd20-39f3a4fa5732@kernel.org>
In-Reply-To: <a9cbd24b-9da8-9f92-dd20-39f3a4fa5732@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89131093-a037-4d2b-128d-08da002ab278
x-ms-traffictypediagnostic: SG2PR06MB2442:EE_
x-microsoft-antispam-prvs: <SG2PR06MB2442358E7E5576CDF038E610BB089@SG2PR06MB2442.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0uon6pfozuCIrBvfb7lSG7EkRwQ+kiCr34CTvTtGy2t+FbOyzapRtf4yzpq2AJ9wPBvotSa3Gplf70RUbrBU937JWUt3Ci5TtinbKoVPrVD203GbGojD0uJ+r2lsA9qzDYcpcP29Hl33WrQYKU9otqPDdDOKLm4RMPYY0MihVPuc3TU0r5fQhd69M+3XhrXuPei8mZhWLGM6w7lWqUVBMNCzlD1UM3qrK/hVMl4J6OS0VhfEgSHFkc4hx7Qe95AFIvi18jvsKD9+/szGARvBOj6k/yxVxHx6QmTPGtWt6qgluurAI03eo222m4G/vPnyvCOuJLePVI44Z1TE/jmUKnxk4DAZPumCCCvEcj2DQ9ZHgx+/e1ybj3foV9jRH/fJh1klMRpL0bJcTAopdx9K5HO/aNTlffonjbjclFPT9GwLMT0a0+Pd4Tetfgfci1AYan3Xvt8HH8x79yVoxC71tlro2VuRpPuzbIKIGlukJZOdo9S9QKGY+UYaP6N5xStBJBhPLCR8Baw/amR2R7f8HrFzcCpvo9n9TCzeFDL01wq+qLG3NOxIp2TnxuQJa0uPhQWVwXiB7kMLHMjxxjiz7iodMNKz+wu4BGDDXEuAqsDmebWdSnR4c724gruT/yoizQgoych2aKFgPxn5eXDM6YcuxmQuPkYGNpcLR3q9XECoTtpBhGXvoaCWmv7GayINcaTCw4CK26hs7TM6J2K6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(64756008)(66446008)(66556008)(76116006)(9686003)(66946007)(4326008)(38070700005)(186003)(6506007)(53546011)(508600001)(7696005)(71200400001)(110136005)(316002)(83380400001)(55016003)(86362001)(38100700002)(122000001)(5660300002)(85182001)(2906002)(33656002)(52536014)(8936002)(26005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2hCVzVVaEhOekhGbmlqRWNUaUxOZnVBbEVrSDFaMDVFRUVXODl2dnYwbzRC?=
 =?utf-8?B?K2wyZzBzWmFpZnIwMVdqbDl4S3BuMTVsNGdlczZ5bzNpUnppR3NGRUVwODQ2?=
 =?utf-8?B?SUN1WXY4L0lzN1Y0dmc1ZEIvMENWcEtPdkw2Y25ldXV4VkRObkNVdkM2d2Qy?=
 =?utf-8?B?M3J6TW9RNWJvK1dCLzE5K0NOeGtqTWk5aHNUN2NOWTQ0Z2plS1BQWTZpb1ls?=
 =?utf-8?B?cm4ybEN2YWh3NWREeVhNcTM4eXk1TmRMa0YzNGdPRkZ0dHJYTk5ZdDNKZlV6?=
 =?utf-8?B?OElTeXB1Rk53UXY1eWNEb3BzbEdpSnpEUHJVcDc1cU5DZVIwa1RudjZUcWVw?=
 =?utf-8?B?K2xkUE1Xa2gvMzcrL2QvS1k0RVZYcGp5VnUvN1hDZDJLSXRhU3YzV3ZKSWRZ?=
 =?utf-8?B?Q0hETlVldnVtLzRRRXVRZHFlbXBUb3pjcGVyNzM1aDdMTkFlYjl1dXd0SVh6?=
 =?utf-8?B?ZTVzZTJvQnZwUmVtdE1BUWIwb0VCWU5KVFhMQ014VjdaV3RIUDdodWlXUU5x?=
 =?utf-8?B?b0NhK254VHNqQjVHVjhrY1FlVHZTTGJzY3RtbDU0WmZYR0NZYXloZHBOWVZs?=
 =?utf-8?B?ZGxWVnN1ZWFvMUdGbXZneWJ0eVhXWTBpZWtQamdLQis5V0V4OXBwWnJybUs0?=
 =?utf-8?B?Zkl3ZzVqeUJ3VEJCZWNCK1ZXTS9sNjY0RTVwNWpZbnVJT25aZ1lCcW9wWlpT?=
 =?utf-8?B?WFo5NnpDUVI4RldNbEtFTmI2RnhlOHJjSUNudnlyY2cxNnVWakRSdHk2Mm5C?=
 =?utf-8?B?VEY2N3NrR2tpeGFIVENJWlFHbkxZbk9hWThvenlkTG41SU83bDVtOVVZRnU1?=
 =?utf-8?B?YkZ5dlUvVkJsa0dZMW5pbC9ZNHJVRkdqdmdaVVRxNGJINkVQK2x4M3R6N0sr?=
 =?utf-8?B?L2xZWjJJVjhTYlZkQzU4ME01S3BpTHNSa1g1WkRBL08rem5wSkhWa05nNkNu?=
 =?utf-8?B?NVVNNXlEeEpXcTdHeS82ZEh5NmVLRHZjUndNS2JBa3hjSkZmMTdGclNYUENi?=
 =?utf-8?B?dStFMm9OUTZuL2UrWVo3b0dUT2pCTnY2QkFPOW5CV0N6UjBBR1dneFpwR0tI?=
 =?utf-8?B?WDZaRDNwbkVwUHhiRjdwTy91YmVyNDQ0aXZsUDNUczBRUE5Mc2xyQi82eW9B?=
 =?utf-8?B?aWJaMmtjcnhjMzFuUVdqdHpBdXZYNTMyZVJGYjV2Z1pFTG1ETG40UlZJTkh1?=
 =?utf-8?B?YXcxZmpGTGkxQUxCS0tXa04wVTZueWp3eGZvVitXaXdINm8vOHFsL0tvQ3pk?=
 =?utf-8?B?SEgrc2Y2ZUxHTXhBM2VXa0xic2FhTlBnS3BjWThUbmpNS21KRVlLV2dEaEQw?=
 =?utf-8?B?SDd4TkNHUUIwbWJ3SWV0ZHpnOTEyN3V2bVB4Z2w4UjFtSlJtaHFRaGoreTVM?=
 =?utf-8?B?ZGlGekZ2M1lIbmp4U3IvUEQ1SDA2QnlXZUtHUzJmNFdMMzJZSnJKK1l4S1RX?=
 =?utf-8?B?WG9kaHA3ZG15ai9MUE1pS1JGaXVqWC9icitoVTFIZTE4N3lwREFTc3pRcVV2?=
 =?utf-8?B?Qm1YU2FFTjcxNkZwVTcrL0RkM3FVZkdFL2pJNkpwYUFJNTkvd1FyMkNoL3Bv?=
 =?utf-8?B?bWQ4UUVNQXpVdDZCM1RsNVB3eGM3UU9DTjBtT0hmM05IWkx4ZnVXdXlreTRs?=
 =?utf-8?B?ZndKMnZ5ZXZxWmpSbnJmYWVGbHZ2QlZBRmh4SVkxYitSdG1mbVRmcmFuZWc3?=
 =?utf-8?B?QlpmYk1NNitTcXRva3dIRUlWR0g4OE9TY3VWL2I1MGFGUWxnUWxsZHNZOFAr?=
 =?utf-8?B?QktJM0dUWitWeFZsNHZHNnZ3VlQzc1hJK2J4QmNxMHRRQ3VYVFlhUkxlUjN0?=
 =?utf-8?B?dE80dWoyK0VIQTZ3dkFiU2dTZmlVakt1d0REZDZOdlVtd1QyTzEzVUVER0R2?=
 =?utf-8?B?UVRpdVJDRGdnZ1ZxWHNoNCtZMFhrWTYzNmcyZ1NjRUVzaXN4WitTQkJUd1pL?=
 =?utf-8?B?SGh2NTVNUEJwMEF6MVVaVFh1UTBzTEwzQ0NqYURDMWlnYkR4ZXBEUExtSE5l?=
 =?utf-8?B?UEtyNjM2czBvczJBamx4eGNYbU82S0xJVnUvOVVtaDUwS0NEQXo5RjRMZDlk?=
 =?utf-8?B?a2Fra0VSdXRTeVVXTjUwV3NubmFpdjNidTc2Z1QzRmZtVHA5a1RrOTF2Y1c3?=
 =?utf-8?B?Q1M4bnFTY0Z5T3U3eXFsek5iNlpZMUF3ZzVKZUIzR0dXbkJFdkZiWC9pYXA1?=
 =?utf-8?B?aUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89131093-a037-4d2b-128d-08da002ab278
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 11:07:40.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0/Bk1Xv9eGGE9YGw9xpdDTPpTvWBM+jYIt+OPV7SB9iHLvATU/CmgzGGrT+lIKXsmu4W1vL7+Bgy41UgRlOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2442
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
 no trust [40.107.130.125 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.125 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nRBSr-007KQi-8D
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic
 write may cause data corruption
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggNywgMjAyMiA2OjMwIFBNDQo+IFRvOiDluLjl
h6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IEZlbmduYW4gQ2hhbmcNCj4gPGZlbmduYW5j
aGFuZ0BnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIXSBmMmZz
OiBmaXggY29tcHJlc3MgZmlsZSBzdGFydCBhdG9taWMgd3JpdGUgbWF5IGNhdXNlDQo+IGRhdGEg
Y29ycnVwdGlvbg0KPiANCj4gT24gMjAyMi8zLzcgMTU6NTQsIOW4uOWHpOaloCB3cm90ZToNCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggNywgMjAyMiA5OjQzIEFN
DQo+ID4+IFRvOiBGZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21haWwuY29tPjsgamFlZ2V1
a0BrZXJuZWwub3JnDQo+ID4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsg5bi45Yek5qWgDQo+ID4+IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+DQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUkZDIFBBVENIXSBmMmZzOiBmaXggY29tcHJlc3MgZmlsZSBzdGFydCBhdG9taWMg
d3JpdGUNCj4gPj4gbWF5IGNhdXNlIGRhdGEgY29ycnVwdGlvbg0KPiA+Pg0KPiA+PiBPbiAyMDIy
LzMvNSAxMjowMCwgRmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPj4+IFdoZW4gY29tcHJlc3NlZCBm
aWxlIGhhcyBibG9ja3MsIHN0YXJ0IGF0b21pYyB3cml0ZSB3aWxsIGJlIGZhaWxlZCwNCj4gPj4+
IGJ1dA0KPiA+Pg0KPiA+PiBZb3UgbWVhbiBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUgd2ls
bCBzdWNjZWVkLCBidXQgY29tcHJlc3NlZA0KPiA+PiBmbGFnIHdpbGwgYmUgcmVtYWluZWQgaW4g
aW5vZGU/DQo+ID4NCj4gPiBZZXMuDQo+ID4NCj4gPj4NCj4gPj4+IHN0aWxsIHNldCBGSV9BVE9N
SUNfRklMRSBmbGFnLCBpZiB3cml0ZSBwYXJ0aWFsIGNsdXN0ZXIgYW5kIGNvbW1pdA0KPiA+Pj4g
YXRvbWljIHdyaXRlIHdpbGwgY2F1c2UgZGF0YSBjb3JydXB0aW9uLg0KPiA+Pg0KPiA+PiBDb3Vs
ZCB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB3aHkgZGF0YSB3aWxsIGJlIGNvcnJ1cHRl
ZD8NCj4gPg0KPiA+IFN0ZXAgMToNCj4gPiBDcmVhdGUgYSBjb21wcmVzc2VkIGZpbGUgLHdyaXRl
IDY0SyBkYXRhICwgY2FsbCBmc3luYygpLCB0aGVuIHRoZSBibG9ja3MgYXJlDQo+IHdyaXRlIGFz
IGNvbXByZXNzZWQgY2x1c3Rlci4NCj4gPiBTdGVwMjoNCj4gPiBpb3RjbChGMkZTX0lPQ19TVEFS
VF9BVE9NSUNfV1JJVEUpICAtLS0gdGhpcyBzaG91bGQgYmUgZmFpbCwgYnV0IG5vdC4NCj4gPiB3
cml0ZSBwYWdlIDAgYW5kIHBhZ2UgMy4NCj4gPiBpb3RjbChGMkZTX0lPQ19DT01NSVRfQVRPTUlD
X1dSSVRFKSAgLS0gcGFnZSAwIGFuZCAzIHdyaXRlIGFzIG5vcm1hbA0KPiA+IGZpbGUsDQo+ID4g
U3RlcDM6DQo+ID4gZHJvcCBjYWNoZS4NCj4gPiBSZWFkIHBhZ2UgMC00ICAgLS0gU2luY2UgcGFn
ZSAwIGhhcyBhIHZhbGlkIGJsb2NrIGFkZHJlc3MsIHJlYWQgYXMNCj4gbm8tY29tcHJlc3NlZCwg
cGFnZSAxIGFuZCAyIHdpbGwgYmUgY29tcHJlc3NlZCBkYXRhIG9yIHplcm8uDQo+ID4NCj4gPiBB
bmQgYmVmb3JlIGYyZnM6IGNvbXByZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3aGVuIHJld3Jp
dGUgd2hvbGUNCj4gPiBjbHVzdGVyKSwgZXZlbiBTdGVwIDIgaXMgbm90IHJpZ2h0LCBidXQgd2hv
bGUgY2x1c3RlciB3aWxsIG1hcmsgZGlydHkgaW4NCj4gd3JpdGVfYmVnaW4sIGFuZCB3aG9sZSBj
bHVzdGVyIHdpbGwgYmUgcmUtd3JpdGUgYXMgbm8tY29tcHJlc3NlZCBjbHVzdGVyLCBzbw0KPiBp
dCdzIG9rLg0KPiANCj4gQWgsIGFmdGVyIDdlYWI3YTY5NjgyNyAoZjJmczogY29tcHJlc3M6IHJl
bW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZQ0KPiB3aG9sZSBjbHVzdGVyKSwgd2UgZXhw
ZWN0IHRoYXQgZjJmc193cml0ZV9jYWNoZV9wYWdlcygpIHdpbGwgYmUgY2FsbGVkLCBhbmQNCj4g
ZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSgpIGNhbiByZWFkIGFuZCBzZXQgZGlydHkg
bGVmdCBwYWdlcyBvZg0KPiBjb21wcmVzc2VkIGNsdXN0ZXIuDQo+IA0KPiBIb3dldmVyIGF0b21p
YyBjb21taXQgZmxvdyB3b24ndCBjYWxsIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMoKS4uLg0KPiAN
Cj4gQW55d2F5LCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgYW5kLCBjb3VsZCB5b3UgcGxl
YXNlIGFkZCBhYm92ZQ0KPiBjb21tZW50cyBpbnRvIGNvbW1pdCBkZXNjcmlwdGlvbiBvZiB0aGlz
IHBhdGNoPw0KDQpZZXMsIEknbGwgYWRkIG1vcmUgY29tbWVudHMgaW4gbmV4dCB2ZXJzaW9uLiAN
CkFuZCBJIHdhbnQgdG8ga25vdyB3aHkgYXRvbWljIHdyaXRlIG5lZWQgZGlzYWJsZSBjb21wcmVz
c2VkIGZpbGUsIEkgZGlkbid0IHNlZSBhbnkgc3BlY2lhbCBpcyBpbmNvbXBhdGlibGUgd2l0aCBj
b21wcmVzc2lvbi4NCg0KVGhhbmtzLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gPg0KPiA+Pg0KPiA+
PiBUaGFua3MsDQo+ID4+DQo+ID4+PiBGaXhlczogNGM4ZmY3MDk1YmVmIChmMmZzOiBzdXBwb3J0
IGRhdGEgY29tcHJlc3Npb24pDQo+ID4+PiBGaXhlczogN2VhYjdhNjk2ODI3IChmMmZzOiBjb21w
cmVzczogcmVtb3ZlIHVubmVlZGVkIHJlYWQgd2hlbg0KPiA+Pj4gcmV3cml0ZSB3aG9sZSBjbHVz
dGVyKQ0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGZlbmduYW5j
aGFuZ0BnbWFpbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGZzL2YyZnMvZGF0YS5jIHwgNCAr
LS0tDQo+ID4+PiAgICBmcy9mMmZzL2ZpbGUuYyB8IDMgKystDQo+ID4+PiAgICAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleA0KPiA+Pj4gNmI1
ZjM4OWJhOTk4Li41Y2JlZTRlZDA5ODIgMTAwNjQ0DQo+ID4+PiAtLS0gYS9mcy9mMmZzL2RhdGEu
Yw0KPiA+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMNCj4gPj4+IEBAIC0zMzU4LDggKzMzNTgsNyBA
QCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsDQo+ID4+PiBz
dHJ1Y3QNCj4gPj4gYWRkcmVzc19zcGFjZSAqbWFwcGluZywNCj4gPj4+ICAgIAkJaW50IHJldDsN
Cj4gPj4+DQo+ID4+PiAgICAJCSpmc2RhdGEgPSBOVUxMOw0KPiA+Pj4gLQ0KPiA+Pj4gLQkJaWYg
KGxlbiA9PSBQQUdFX1NJWkUpDQo+ID4+PiArCQlpZiAobGVuID09IFBBR0VfU0laRSAmJiAhKGYy
ZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSkNCj4gPj4+ICAgIAkJCWdvdG8gcmVwZWF0Ow0KPiA+
Pj4NCj4gPj4+ICAgIAkJcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9k
ZSwgcGFnZXAsIGRpZmYgLS1naXQNCj4gPj4+IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2Zp
bGUuYyBpbmRleCBjZmRjNDFmODdmNWQuLjI2YTY0OGVmOWUxZg0KPiA+Pj4gMTAwNjQ0DQo+ID4+
PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0KPiA+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMNCj4gPj4+
IEBAIC0yMDA5LDcgKzIwMDksOCBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3N0YXJ0X2F0b21pY193
cml0ZShzdHJ1Y3QNCj4gPj4+IGZpbGUgKmZpbHApDQo+ID4+Pg0KPiA+Pj4gICAgCWlub2RlX2xv
Y2soaW5vZGUpOw0KPiA+Pj4NCj4gPj4+IC0JZjJmc19kaXNhYmxlX2NvbXByZXNzZWRfZmlsZShp
bm9kZSk7DQo+ID4+PiArCWlmICghZjJmc19kaXNhYmxlX2NvbXByZXNzZWRfZmlsZShpbm9kZSkp
DQo+ID4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4+DQo+ID4+PiAgICAJaWYgKGYyZnNfaXNf
YXRvbWljX2ZpbGUoaW5vZGUpKSB7DQo+ID4+PiAgICAJCWlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQVRPTUlDX1JFVk9LRV9SRVFVRVNUKSkNCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
