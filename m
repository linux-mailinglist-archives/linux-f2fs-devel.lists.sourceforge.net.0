Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88A45B83E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Nov 2021 11:20:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mppO4-0007Vi-UO; Wed, 24 Nov 2021 10:20:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mppO3-0007Vb-1f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 10:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uSGbydk77lYY4f/96RoGJXt3he+O4YCgV+pcrTPQ61c=; b=UCNzuek56g9A9KWGCzZtVhBE6Y
 6be9KJ/EdK8DJMFcbyjrqzFJ0l6gpJcVxhHhrXZkkOgiFdzHBMMa2wo3V3Un82iIuCfHfB13wMNmz
 HaKu13iQZVfQiLJx7zGMHCbol60b2YqnOhcDP5hEuIK017fhxvx8An+e9l0qayPSnLfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uSGbydk77lYY4f/96RoGJXt3he+O4YCgV+pcrTPQ61c=; b=bfVzXckyuT5yZAuJG1Hr1I7HYP
 fATiky1J5TGpJHv4zVhXxvjqgf0OY7D/kAnDZrrk25XvTsFNf/2QKP4SXeXdiaWdG4Ktja2nZ+HUs
 7NjCC6zxszk9TOHL/+8fE0YKyBFOOzztXj5of7Yca0sGRkBdQkhh1cQ2ngaWgn35qME0=;
Received: from mail-eopbgr1300117.outbound.protection.outlook.com
 ([40.107.130.117] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mppO0-007HBK-Vm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 10:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9zAY4u/CDyAbR20ie5HGEWmGqpui3VJpav2wxvCR2hlWX6tvDVTJhdZFPFDxW6rkCtOjj7fZc0NxRoWwOwpDbrxYjsBdxvKkO9T3iW9BBTeDhB43rG43A9coysGAxOpPd//VqX9MosYej6qhkf2pFFNcevTGvqVDwcDx6GOSZZJCtXoCKg0NOXQ9cRP2UQApIp/Ps+cH3uHLPGArMJ6RIwCQJ2a+R0cvXd0vb6wUxIbSm6E1RDTADsoFhrycmN+WqKAgt/bJth+EHd4qoxuXMxyh8OOi2qUDNLRIa7lLRvoUu8BklnSX0X5Bwn5qWVRU8wZhcDNw/x7IOI0FVirUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSGbydk77lYY4f/96RoGJXt3he+O4YCgV+pcrTPQ61c=;
 b=AaSp/WRbOawHbUn0tLfaVW1d3xTUYlgVOwP0IQU58C9N4r8AbLD7FmuTGbRLTalarNOXfRR/xiO+aQsoVrMeB1YGPxQ+FDT6w+rrGiQPo0qqEeEUObV0NSSOe5wrNkHObMLgWL/9KQPgAT27WiDjaDFQp2gWB15+9lfN/yPe5c6ZNGCgdrP9SYHQZgI1fVJ9JkTSylGBml427F75YJoV075wzAQrG5NaiwHXDsRMaMITuub81MmVY5x9EpIxbu7E3Eh8plmL/FVMaW8C5uwCN4H0kX4ZnC5zTTizRrKXz0A0Da2wd7hZDnrI4O1+yLDcyGRpoYiwcHpx9+lP0Bvuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSGbydk77lYY4f/96RoGJXt3he+O4YCgV+pcrTPQ61c=;
 b=CacfUlMgg/5mAnI96UVaq9/fxFnrlQ/UrFtTupEeHUb4GpTK5s5ekp2WwvC+VL4CJmuZMmr9xGy3GFpVoODuuFJWR2sCRPMLBr1Gj736dC1LefwYU3rTW7HstzGEEyCZgGrIUhtAktXUNLjSgW69LBCwJ0785eMRypPgxJH5u0s=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4483.apcprd06.prod.outlook.com (2603:1096:820:72::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 10:20:11 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.021; Wed, 24 Nov 2021
 10:20:10 +0000
From: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [PATCH 1/2] f2fs: fix remove page failed in invalidate compress
 pages
Thread-Index: AQHX4Q7RVWqdipI2ok6ntODDXOslrKwSdscw
Date: Wed, 24 Nov 2021 10:20:10 +0000
Message-ID: <KL1PR0601MB400376A6150202C9C5ED162DBB619@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211124083929.259433-1-changfengnan@vivo.com>
In-Reply-To: <20211124083929.259433-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf25b9e2-a45c-44b3-0831-08d9af33ff36
x-ms-traffictypediagnostic: KL1PR0601MB4483:
x-microsoft-antispam-prvs: <KL1PR0601MB4483F3C83CDAB4914333668EBB619@KL1PR0601MB4483.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1eMIub9vvUSauanAHpiktHTAOQIEL/GDzb59gHcPMz8YvAmT0KAEfpWQ9G+jXaUXB+NK8kUNhY8t4Yuydb2B/3Pq80HxWym6HnmJ2+jTlp+k4gGQQT4jSI356KpVDc4PypNC83L0ccRw+7J1Kxl19vDCag6VoxL54Y1xmC8a0qGcYvQbb7hWxR5VP/mt6TqNvDXNdGPcOWrs46wOWL8WbWnyKBcuBBbGb5rpv8q6IK7du5YVLsnOEsVpDBvO/tupvonm2Xe1JVHG5lJBiRHD3DnHuCG/bNlscq5CvfsWPseKntAPaGZc4zlTnx+zTQkrkZNiQ8o50eUm5nY9Bo30ALONhywTsuvmGSa0d5dfXHdYuxC8p8LU2rhh7A4GMyyjcZZj4qxniDDdD6ouNPCn3Wy5skIE2Ojk6ClpeC0pgFTnoZ/uTZOt0lbeF5EK+oHBF9XHSYMg0ehbSp/Le1xt2tuQFJqjHKO6u6Vt0vRUv+WHd3zPUShfPEnMRULP/89m0n5Ff/isFZ5ZAxy2OwX/wyIJwDXS1ObOABD/Yp9VIGUtZVxhZq0WG35Hhk+qWBuNTTRPB7d3l9ejNeBL4UpoHUrVgi7nXlNHAEptADf+OmhO9yEd81eNtnPdzJg0KhFjbv8gkpvNRHbuS8e0RnMirV22ROn5B2DiFfppsey8D3CRugYSRqs9TPstpykrEIp5oVaSF0uAmVgOmulPx12uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(38070700005)(508600001)(5660300002)(6506007)(52536014)(53546011)(76116006)(33656002)(9686003)(8676002)(66446008)(66946007)(64756008)(26005)(66556008)(66476007)(86362001)(71200400001)(55016003)(186003)(83380400001)(85182001)(4326008)(110136005)(316002)(8936002)(38100700002)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NExZd2FxQWNwSTZKcUltLzU1eWx4ODF1Z1hXUUVJb2kwVmJIL0d0RVpVR0Nt?=
 =?gb2312?B?QjBIYko5dlMrVE5lalVkNHNjY2lzSUt5RnZJLys0eEdFRzFBT1duNW82UklN?=
 =?gb2312?B?a2VFemlEYW5pSHpJS3dZVHpLR0lPZm9ud2ZZV0lSMWZPaVVad0dNQm5kTW82?=
 =?gb2312?B?cjFsOXlHMUx4Y3VrdGRoWCtkZks5ZllFbVZkS0Rqa0FJdGt4ejE3VEJ2YlQ4?=
 =?gb2312?B?RlYvTUZNbHZCVCtuTW9qMXJqaENMaVNJaFNzbnpFblJnKzU3ZDdnaWRyaDFa?=
 =?gb2312?B?SGZtR2JNaUgxWDBEWk1YUGI3cGpYaU0wdXFYNGlMRE1GbWJjMmZEN2ppa0JL?=
 =?gb2312?B?VFd3b0JzbW5VeFVNNzlHUzcwaXllNk94VFZuUHZPQ3pkZkJtbWsybUxsNUx0?=
 =?gb2312?B?ckoyOVVnTlo5WlBTcG1vRGI5dkoxK3hIRVpSWFcwcmY3b3RHeUtIZUJHSUYz?=
 =?gb2312?B?QnZBVVpoVFN3SVlTcnlCdGgxV2pvdWorcW9US1VPWkhhc2Y2QVcyT2UwZG8r?=
 =?gb2312?B?eGN4Wkl4N2tJTWtzZkVaVmZaZ2x1dmtlUnpVV1NidUZTY2dubTdWbTVXQUVu?=
 =?gb2312?B?TGtNVjZFQkdiLzY5NUJTczg5ckNKRTVVUU5QWEVtRVdXVFdQMDJHUjZoVnZM?=
 =?gb2312?B?M1pxb1I0NnIrYkdVcG5oRGVhMEI0UXpEU0xhS1R1U3Y3czBEWnBUL1JsUGs0?=
 =?gb2312?B?VXlzRHdCbHpFcjJZakQ2U3llQjdYTGg4S1hnUFV5Sit1bUtXMjEyVldBYkdo?=
 =?gb2312?B?b3UzUnBITVJreGFZSGlyNkc2ZHNaemM1b3lGRldXUnV2dDl5NDFrSCtXbU10?=
 =?gb2312?B?UHNOOWdhbnRjSXBFdERrTSs5WFRnZWd3NVByc1o4djlsR1lDNVNDWFV6UlVR?=
 =?gb2312?B?V01UTkd0cmVTcVRCYU42L0tnVlAxTHdOV2dINDhJeHZBaHVwZFZRZmxjQ053?=
 =?gb2312?B?YUlvTlM5WlRudDJIUG9CNVZHTGRZZXMrcGNWMUgwNDNZdUYyUm5KL1lwWk83?=
 =?gb2312?B?ditDMUltekNEd1pNbFNSZ2xMUjR2K2oxMk9jc2tvUDFlZXZnWUt1OWRrRy9K?=
 =?gb2312?B?S0w4VzZTUjFKK0dabXRSOW1JeitaV0lkcW1yZXM1RXhOVXNNVFBEWE91TEVG?=
 =?gb2312?B?dmhQQW1iamIva25VdkpoeDQrKzFnSE9kZ1N6andhd1gwUld1bm93RnNNUHRi?=
 =?gb2312?B?WS8rR3B3NCtaMW0veWl5ZzVTZ21XdzlwUTFEazZHdWpIejhLWmMrbDBldzVM?=
 =?gb2312?B?cTB6ZXlKakJyMmdTZkh3dEZEL29SUWJ5clprZm5HOVJHSG16M21YdzVrT2pp?=
 =?gb2312?B?SmwreUU5SnZOUUk3ZTJtM1duUHZrK2VXcXptV2cvNlpoZENablV2cWNRT2Ru?=
 =?gb2312?B?bkFUdCtObVg0dE1ReUpMU29WWGtla0JIOGhCWFQ5YktVZXp2Ry9xVjlvd3BH?=
 =?gb2312?B?aUZURVdoamVLN3lZcGk2aGJYOU1KalRDdVo5aHlpV2VKTkwrS1Z1ckp2RlBM?=
 =?gb2312?B?K3ZIR2piSTdiczBkeDFhY0JWNk1uM2lQR29DVnRNNnRHdXd4c1dQU3JSZ050?=
 =?gb2312?B?NEZyZk5qclY4OVZmWC82eTIvdkUxTVFySTFVaXMvZ0dydnd2TXc0cWZPMFJN?=
 =?gb2312?B?V21kam5vRmFTZVUwbEcyLytpaXVteW5aOCtDeVV1b2dQbzJNdi9xcGllVUtn?=
 =?gb2312?B?cUFkTjkyMllQTlN2VU1BR0o2OG9SZFp0ejUyWVY3KzR6U2xMcXlKeVYxQVFw?=
 =?gb2312?B?ZUFWMHhPZW1xaXdjV3NPcWZ2dnhZRVdwMmF0MEVyNlk2MGZGSHoxMzJFMEk2?=
 =?gb2312?B?QmpGbFRNZzd0ZnFmekVxNGloalUyOHlvMEU1bFFSaTZXdVkrNzdoTENxZDcv?=
 =?gb2312?B?cTZKcjFhbnVDS3BoRyt1amtRZ0tiQ2k5bHJTZlNQdHJReHVZRndmTHVXbVRE?=
 =?gb2312?B?T1FERjRxV1hJT0d5b1NUMTU1YVpFNE84dVc0VXMxbGdwL1ZuQi91UFJDdVF4?=
 =?gb2312?B?V09jbW40clFUOXJNWnB2YlNaaTQ3RmpMRHMrNlBXbEdDRnVJL0FuYjNPYnhk?=
 =?gb2312?B?MHFSWTFTV1RkNU9JWnFFcXpSbU9aVGdaRmRzVkNUNlFzZkVyNUZ5V1JYTVNU?=
 =?gb2312?B?ZzZFQm9aa3RWcmtySFE0Z2Nxa3BmQm9uWTNNWG8rcmJUMzdyUWhKcmRVN0k0?=
 =?gb2312?B?YlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf25b9e2-a45c-44b3-0831-08d9af33ff36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 10:20:10.5866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnCFWfyatGBlFRdY+jR8pPuOcaPa5MZiRQY7H4ziiqhNrjbIUSR4R/Q1OSl9VRk7Ld1gACxEDJJ5bSf0LBAYfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4483
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Do we have some limit that we must use exported symbol to
 make f2fs must can load as a module? If no,
 maybe we can just use truncate_inode_page
 to replace generic_error_remove_page ? > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.117 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mppO0-007HBK-Vm
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix remove page failed in
 invalidate compress pages
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG8gd2UgaGF2ZSBzb21lIGxpbWl0IHRoYXQgd2UgbXVzdCB1c2UgZXhwb3J0ZWQgc3ltYm9sIHRv
IG1ha2UgZjJmcyBtdXN0IGNhbiBsb2FkIGFzIGEgbW9kdWxlPyBJZiBubywgbWF5YmUgd2UgY2Fu
IGp1c3QgdXNlIHRydW5jYXRlX2lub2RlX3BhZ2UgdG8gcmVwbGFjZSBnZW5lcmljX2Vycm9yX3Jl
bW92ZV9wYWdlID8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiCzo7fv
6aoNCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNCwgMjAyMSA0OjM5IFBNDQo+IFRvOiBq
YWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2VybmVsLm9yZw0KPiBDYzogbGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7ILOjt+/pqiA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBmMmZzOiBmaXggcmVtb3ZlIHBhZ2UgZmFpbGVkIGluIGlu
dmFsaWRhdGUgY29tcHJlc3MgcGFnZXMNCj4gDQo+IFNpbmNlIGNvbXByZXNzIGlub2RlIG5vdCBh
IHJlZ3VsYXIgZmlsZSwgZ2VuZXJpY19lcnJvcl9yZW1vdmVfcGFnZSBpbg0KPiBmMmZzX2ludmFs
aWRhdGVfY29tcHJlc3NfcGFnZXMgd2lsbCBhbHdheXMgYmUgZmFpbGVkLCBzZXQgY29tcHJlc3Mg
aW5vZGUgYXMgYQ0KPiByZWd1bGFyIGZpbGUgdG8gZml4IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiAtLS0NCj4gIGZzL2Yy
ZnMvaW5vZGUuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jIGluZGV4IDBm
OGIyZGYzZTFlMC4uN2VhNzY3ODRlZmNjDQo+IDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2lub2Rl
LmMNCj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jDQo+IEBAIC01MTYsNiArNTE2LDcgQEAgc3RydWN0
IGlub2RlICpmMmZzX2lnZXQoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwNCj4gdW5zaWduZWQgbG9u
ZyBpbm8pDQo+ICAJfSBlbHNlIGlmIChpbm8gPT0gRjJGU19DT01QUkVTU19JTk8oc2JpKSkgeyAg
I2lmZGVmDQo+IENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9ODQo+ICAJCWlub2RlLT5pX21hcHBp
bmctPmFfb3BzID0gJmYyZnNfY29tcHJlc3NfYW9wczsNCj4gKwkJaW5vZGUtPmlfbW9kZSB8PSBT
X0lGUkVHOw0KPiAgI2VuZGlmDQo+ICAJCW1hcHBpbmdfc2V0X2dmcF9tYXNrKGlub2RlLT5pX21h
cHBpbmcsDQo+ICAJCQlHRlBfTk9GUyB8IF9fR0ZQX0hJR0hNRU0gfCBfX0dGUF9NT1ZBQkxFKTsN
Cj4gLS0NCj4gMi4zMi4wDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
