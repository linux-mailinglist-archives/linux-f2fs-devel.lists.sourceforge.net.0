Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE747B911
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Dec 2021 04:41:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mzW1m-00017V-BI; Tue, 21 Dec 2021 03:41:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mzW1k-00017O-QG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Dec 2021 03:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/BTlDCZ6qbZVCtwvaxrZdkXEKcosyTTLBD7iUHtHoM=; b=gHU485pWrxM9YERQlAO+BFDG0+
 vNv46DAZ4VZ8D+dAHzHx+yboe3MNWPkbBi/3PS7N7TzCrC0kC4KmQmMCV5/uH38MgAU8wH3yBlGwU
 HXbJ5AgSQNpRDDGET6vvM+xY7o+3NHC2mAh+EdMmgOvlaEHCklZX8Z02ns5ZMinq3Z28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4/BTlDCZ6qbZVCtwvaxrZdkXEKcosyTTLBD7iUHtHoM=; b=ByKCU872eQhURkBf1NliCa6DrI
 3m5+6MWOu1ZLcxQFDpWex0HoUu/4Nm4TpQv0G59zMc3iAkT4sRECXGRu+4RkMzi75ov7ywFVGYvvE
 h3zSd4sos+umnIdE7g3uSkQSdToprzpiTvqtmAIG5Z9DYvK90ViegaQ7DEmDamXAt1sI=;
Received: from mail-sgaapc01on2111.outbound.protection.outlook.com
 ([40.107.215.111] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mzW1g-0002ju-70
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Dec 2021 03:41:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYVgBq6TQrXbCrgY0tP/PBQq335gEgH5oYFAe9ZX8Z6ysabWSpUcZRlFTFkdyr5Rm2YutiXqGMnZXAX700U6OqhFsHAtEHUVtHpi0IrS4ZP60kZ6g/QtmUzWZMLw1R8r8GgiIVMi31bzmsgqkkfJpnxKcob/2zRqIPei+d4362/vEosWR8OGbI2bRdsfA+oH0Q+Hu6r6DKp1yUEjbct2cOHd2S4DZRU6iT0RVmS0KLO9w/m/WntLwGH3UyWxwDOPcDIVOd1se3dmuDOGT82x0Uv+UQA6I8y54sBos3xTr9S6Z6H0/nH7DDVGyi74zpUTLFa6GKJXh5ctRitbF3Us0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/BTlDCZ6qbZVCtwvaxrZdkXEKcosyTTLBD7iUHtHoM=;
 b=BFF9FNnCJsXFYiVtvaWKdeQF6OMy3dyKC2W6LEvep7w8UAb7QvKabFfscpoSdrVL9NQAkM+FTwo7sOH6LXrH+DGFg+clnkEX91A2Rxm1Y+p7OJLD4Sg49/xi5+rhPeEY5UoV3X5l4jFaCaKwrxZTHiGFNMKR5fupzeJ2qqCtc7/1as9MjYFQCafdE06wWPcPh0Nl3kfxeePva/glcagQhE0Pbvmf7iLlP7izghVLL5GzUZOriY3Hi29OoWCMUZr6MxKRLPg+NPgq7plhm+n1yWGI1uT9LBJyqGAFBqHATPQOKEf/rmS8Q7jejmkQPnFnr+VEtKVGsrcOfwnbjzv27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/BTlDCZ6qbZVCtwvaxrZdkXEKcosyTTLBD7iUHtHoM=;
 b=cMXU4MudH39ddXOjYXNKAlAbGBnH62zucngtGLA/D5jOBdn6/PRvKfwc7NyCdCeFn2KPxdjYysbrgM9mIzg/tstyoq/OShdP4QWv3v+fffdWLPKWxIjO+rCdmXIPE+kiH3YUzAnBcext6GqQTjxnCzrooDSKRoHRRZ2Uy7i1/XI=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4419.apcprd06.prod.outlook.com (2603:1096:820:67::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 03:41:10 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 03:41:10 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: f2fs_invalidate_compress_pages sometime take long time to finish
Thread-Index: AQHX517wQjcZzvwaCEKH8jO0Jubkqqw08BcAgAd4tfA=
Date: Tue, 21 Dec 2021 03:41:10 +0000
Message-ID: <KL1PR0601MB4003E9F536D29E68A4D413F7BB7C9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211202092812.197647-1-changfengnan@vivo.com>
 <AN*AbgBBEzBKLVZxgMYcjapv.9.1639646974700.Hmail.changfengnan@vivo.com.@PGFkNTAzZjQwLTNjMDgtZTUyYi0wOGIzLTEwYzEwZWIyNzgxZkBrZXJuZWwub3JnPg==>
In-Reply-To: <AN*AbgBBEzBKLVZxgMYcjapv.9.1639646974700.Hmail.changfengnan@vivo.com.@PGFkNTAzZjQwLTNjMDgtZTUyYi0wOGIzLTEwYzEwZWIyNzgxZkBrZXJuZWwub3JnPg==>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55a2bfda-3ed4-4f94-8f97-08d9c433babf
x-ms-traffictypediagnostic: KL1PR0601MB4419:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB441990518A388ED85A0D54A4BB7C9@KL1PR0601MB4419.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qb3UHm9kCFiXP1i+0w+Zl8H4I0Plf3Q0ERCuO6geoCxikGNnNYDDQZn63VTj1dvC9Xb3iRgyL1lPkUvnmr8Ip0L/GTemH73CFbRXeIm8zml6mrihDMPrnoVTtwW32xcV/sQZ31tivNvQWk58ite/xWV6lbBp4GtoB5fdMbj7ZeeLKp0Xixizzw24cb7QuSD+GZf/9Tqduf8BEF0YqdYoxHdrq/mcM6eisAWCoum5zJbhiYIP+I2InWxaD6mh2UrmszGz5Mi0iDX76r3BVVOiWPKI3222SNc/PToM+YSgNXjciPc1YNIQby9KS9sVTpADCW+xbkc6/mTQ5aIfODYFyD3xmhWItUxk6QkSA7scj7l5FQshV/cNgHYZw2IgQIlt09KhiQ39JcTMBz1LDFLXfEYCWdQlCy24TaYv6OvYn1+w5Ze0uCH3wmqGoWr/AtvscKRMR1ILz1W59x/sMzVIImsQQGOLAZ0loO7AsPEhAGxfF4JFvipsGXxPQhXS3OzVGti0SsldBUHG+evOeCpkDJIDUZBRBTEjN3903BwN2OeDaPxOaiGpWzz2UKa/1bix/amUMqfLd6quCOdbN64YPv+BoWdyJsS+/xcQgP72ybHPKpDk/MkWcTffLtjrJ52f1sIZBq1R+1XBEENGVtfVeA96senqF2njJc3Kd5yYCa/OSY0IyKWqkkq0hUOBX4ow54/lFFcyD+XoavdjpV40tvjYsiUhLycNmg0X6R5DZtsYjVtzzhEl0AIw66wh9SeeIsyHUK9cRtobruUHjYzSAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(8676002)(83380400001)(33656002)(66556008)(9686003)(53546011)(316002)(7696005)(5660300002)(86362001)(6506007)(110136005)(508600001)(71200400001)(64756008)(186003)(26005)(66446008)(55016003)(66946007)(8936002)(966005)(66476007)(122000001)(76116006)(38100700002)(85182001)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGdxSHNIUmdaV2REMDRCT3JjQ0trNGwxd2loTjA5Q3IwVWdOSFVRWXFEdU03?=
 =?utf-8?B?THErRFhpQnZMcU5LSVhNNDZEejFaTml0dEU3ajhIRUZ1TFdXa2twNUZJNk9v?=
 =?utf-8?B?LzlhTWZCNjFwRCtuM21kTDB1c1Q2bVBWS3ZVbmJ2TE1yelVqQjNjUWY5dnpV?=
 =?utf-8?B?Vm05SWVNUTdabWZHRm9YZnd5d1pET3p4QW5LVWlVM0hOYXZ5RkNwMjJDMFZC?=
 =?utf-8?B?WGsyTVUrbjZYRTE3eXJHQ0c1bDJpNkZoV3hxbWp5QjdPSndUVkNyOGg0Sks4?=
 =?utf-8?B?Vzl0b2gyMk8xZ0kvWDJ1UWhjRXh2UDZFQnNPZWljU3RlWm4xc09vc0tKaUVL?=
 =?utf-8?B?bDl0WkhqWmRpVTBQd0ZvOFpib0x0UXhSY1dEVWI5ODBuK0kyUTExUFlidzQx?=
 =?utf-8?B?aExOc0FjTzlZZnQ0LzhDcGczekVocm56UFBOblliTTBocG5hSTVlMjJGcjgr?=
 =?utf-8?B?VTRZeG05N05xU1FqcTlCc1ovRnp6c2F5TkVzSEVWM2RFaExZd0pMUkN1ZVIz?=
 =?utf-8?B?OHpHVGtTRzJDWTFoMVJqWVQ1Mkl5V3ZNeDBSZG5yeXBzZnNGcjJyYkxONFBY?=
 =?utf-8?B?dG1zbTloVGdYK1pkeEhEaUV0eTAvSlpUUy85dm1BaEdOY0ZwRTRrRE80d0Np?=
 =?utf-8?B?WVNQUVM3NjdHRklKQktRYnBFeGo5MFZXKzRhdzNTT1h4Q3Z3Tjh6L1pGMWYx?=
 =?utf-8?B?Ym5nbytybldGNFFsVmsrZnBVL3lUOGF0Mmt6VjlrWU5yT1hDR2ZSVzBNOGgy?=
 =?utf-8?B?YmxQNWZGZGNTV0JwcHhCTFVnNnNTRUgxcGxIc05zYndkSldnbHpKbGZoanNh?=
 =?utf-8?B?T1ZkVWttcTFyRm9OVFloK3B1ZFZodmNRdmQrZHJqRjVrN3VLTHFtSU1TZ1dr?=
 =?utf-8?B?cXRRN3pXUDRwVGZUcmF2VUlZclpIM01TWVJTajA5R3dFUFloRGFROWx3ZjQ2?=
 =?utf-8?B?dGVET2xuTDlPQ2kwRUVNeXBEdE5abWxvSFo4UGM1T3FuR0YzVkc0ZTVoNWJJ?=
 =?utf-8?B?blQ3NUVwRk8yQWl2K2k4ZzY1c2N3WlhoeE0zdlIxT01xOENUblhqNEZYTVF1?=
 =?utf-8?B?cVRPRGpWSDdxdklZWkZTS0ROdWUwZzd2V2VlOG9nVnYzWjE4cXhoUnJINEdF?=
 =?utf-8?B?ZjEvaFh5ZUk1YjJ0SGEwQWx5M1oyV0pUK215ZkpVTjVDb3R6a05yVzNPYjhG?=
 =?utf-8?B?ZkNFTmFPK2RTenhyQ2J5Q0JzVXZpdVZTeFQ5aklPekE2RGxYbU1STGs3dDc5?=
 =?utf-8?B?WG4wWkZXaGNwSjBRbEIvN3hYSFpudWk2ZGtWb25WeE5tTFlhMlliSUlvS1JN?=
 =?utf-8?B?eHl2Nm42YWF5NjdFQW51NWhneFcyWjVkNnNmUHlFT3IxWmZSVHJMSitqcTRv?=
 =?utf-8?B?dmFOUW9vaW0xNGgwNW16QlRDQmFBYlpFM2xzdXEyY3FmOVdjcmRBaHp2Tm41?=
 =?utf-8?B?S3lwTFM5QWp3UG5nZVBGRFlZckx5VVBkU3k2VFNFM1c3QkpDUi9nS0pZcXdQ?=
 =?utf-8?B?NHNTajNhaUFFeDZhNVRCNDBwMWRYNFFsZitDRmI1c0dLb0RkMDhLVXJ4TTRB?=
 =?utf-8?B?SGwrU2ZGQStzSHhNK2toZmk1NmdGTitadUE3d0t1SldvemNPK2JQZlMyaGZT?=
 =?utf-8?B?QUFOYlVjWGZybHJwcFM1Tk5ZZnMzU3NGYVgzYWpZUEs2R0hVWnpIeW5SeHlJ?=
 =?utf-8?B?UlRsNzcrV0YyMXlIbXhUU1BHU3RLbmdTUk5NUHNWVW50ZHNMRnZadGg0R1VR?=
 =?utf-8?B?WDYzK2R1aHhvbzluMXkwK1I1cVNlQWQ2SzNQM0U0d2JkQXFyelVwU2gzWUg3?=
 =?utf-8?B?czcvS0FkUTJaVmN5THAyVVNtbjk5bjd2c1pPd0crcXN5WU9JeENjNS81NXZX?=
 =?utf-8?B?TGthSU8zanM0amRXOS80MHMwSVN6MjYrOCtyWVhIY0J5TVpWMlRiRjE0d1Jv?=
 =?utf-8?B?Umgxb0lKcm90cThWL3paTi9sNUsvQUtPek9FRW9NdlBJMFFQbWVJaHJzN1dR?=
 =?utf-8?B?UUJUYW5RUFVlYTllL24yWG54RDlpYXBQeXVVblVxNVNsbDJub3NGUkNSMkE4?=
 =?utf-8?B?aDVGZ0htNThvSjVmYjJEcEUrZ2xFcndnRG11c1o2c0p2UkhJMWl3ODZvVXcx?=
 =?utf-8?B?aXk4YTNSM1dTczJKR0hkTm9kc1ZZRk9Td1BMRlNtNXBtcFdUR3pwUnN0R3dD?=
 =?utf-8?B?VVE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a2bfda-3ed4-4f94-8f97-08d9c433babf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 03:41:10.2941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pE8luSbk98X6Dno8P2JACt5hR/gAuPdGN8sPUsU0ld6AFioxyn1/VJHjFWDGijaiP+O+phFV+sxwEv5XYUTSbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4419
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
 no trust [40.107.215.111 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.111 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1mzW1g-0002ju-70
Subject: Re: [f2fs-dev] f2fs_invalidate_compress_pages sometime take long
 time to finish
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZiBDaGFvDQo+IFl1DQo+
IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxNiwgMjAyMSA1OjI5IFBNDQo+IFRvOiDluLjlh6Tm
paAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZzsNCj4gbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IGYyZnNfaW52
YWxpZGF0ZV9jb21wcmVzc19wYWdlcyBzb21ldGltZSB0YWtlIGxvbmcgdGltZSB0byBmaW5pc2gN
Cj4gDQo+IE9uIDIwMjEvMTIvMiAxNzoyOCwgRmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPiBXaGVu
IGVuYWJsZSBjb21wcmVzc19jYWNoZSBvcHRpb24sIGluIG15IHRlc3QgZW52cmlvbm1lbnQsIHNv
bWV0aW1lDQo+ID4gZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzIHdpbGwgdGFrZSBsb25n
IHRpbWUgdG8gZmluaXNoLA0KPiA+IGZpbmRfZ2V0X3BhZ2VzX3JhbmdlIHRha2UgbW9zdCB0aW1l
LCBpcyB0aGVyZSBhbnlvbmUgZW5jb3VudGVyIHRoaXMNCj4gPiBwcm9ibGVtIHRvbz8gIEluIG15
IHRlc3QsIEkgaGF2ZSA4IGZpbGVzLCBlYWNoIGZpbGUgc2l6ZSB3YXMgNjRNQiwgZG8NCj4gPiBz
b21lIHNlcSBhbmQgcmFuZG9tIHJlYWQgb3Igd3JpdGUgYW5kIGRyb3AgY2FjaGUsIHdoZW4gZHJv
cCBjYWNoZSwgaXQNCj4gPiBoYXBwbmVzLCBteSBrZXJuZWwgdmVyc2lvbiB3YXMgNS4xMC40My4g
SXMgdGhlcmUgYW55dGhpbmcgdG8gc3VzcGVjdD8NCj4gDQo+IEZlbmduYW4sIGNvdWxkIHlvdSBw
bGVhc2UgdGVzdCBiZWxvdyBwYXRjaD8NCj4gDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2NoYW8vbGludXguZ2l0L2NvbW1pdC8/aD1kZXYmDQo+IGlk
PWE0NDE5YjI5YzQ5MWY0MmViODIzZjI4MWVmMjQyNDQ4Zjg1NzYwZjMNCg0KQWZ0ZXIgdGhpcyBw
YXRjaCBhbmQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDIxMTIx
MzA4NTg1Ny44NTU0LTEtY2hhbmdmZW5nbmFuQHZpdm8uY29tL1QvI3UsDQpUaGUgcHJvYmxlbSBo
YXNu4oCZdCByZXByb2R1Y2UgeWV0Lg0KPiANCj4gPg0KPiA+IFRoYW5rcy4NCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
