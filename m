Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4845E668
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 04:02:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqRVd-0000nF-QP; Fri, 26 Nov 2021 03:02:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mqRVb-0000n4-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 03:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tWVfxJAyJEwaHfkw0BLOvUOCHmcQrLPXntU2sJBSkKQ=; b=I0VEPi3l5lc1/cLhV9n6i7UYBC
 EWRAvw38SL1fePNILNeGCEpI+zngRueewptnpLchpi4Za72HSr3CmLBBfHSUxC/OPnn+enOw+xqhY
 jw+vrYkynwX6vBcZwJx7y3OlJ6cS8QkZFcSZEXOA5wB4dITyDstSUM1QXwlxS1eB9wDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tWVfxJAyJEwaHfkw0BLOvUOCHmcQrLPXntU2sJBSkKQ=; b=iPquZ3tlUjLlLUaJzIJ/Y9Rany
 yTo+xDl9cvfk14LXYCcC6eia9NcQ59ld0FIw6jwI+t8fLzZdyJmYvuDuYooXUTdVTVjU2tM416l7P
 xoe8QMwZ0xir4g3brBuwnGE0tzFTBSpLNA8GxRve+EU+IiKFbLQ8xYH35xVumxWEe/rc=;
Received: from mail-psaapc01on2114.outbound.protection.outlook.com
 ([40.107.255.114] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqRVZ-009YjO-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 03:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX+ue9wFIUWYthhqy3aDcUFbb3sDsWZHtQ0tT515kuPOJMdy/IgH4mXWfMaDzwh3OSiEODq7+dHPjSeGFA+CT//S8ALvsQITqh3QuX54RgSDpvv6dWCV814NRPJ1o3dWbSkNs+bFVZoc6ft1t32WgaiS5RayEIgWFPp7p3eWWEo4NYhgi0wgj2qck50XoGw8dbjCamkbbXHWKPTWMh9TXS96LoJ/Tm8yuK3s8/XFWVyas5PxRNTjL4OAlEUTWHGI2LA20pA72T5q+04hCFXTH2eGtDhgoKfido66UVtF6j3JXetPvCB8wRlDymlpZr2KF+OXlINuoUWDEgB2Dx+pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWVfxJAyJEwaHfkw0BLOvUOCHmcQrLPXntU2sJBSkKQ=;
 b=GAlzYpmVGVPCdkCe6IoV050YZSwLPKgyXdl5qlyamgMFgrOojoxUPmzvX4EUFg0/XIUH1zmqk1IqHhAnArMZiEOhtfIPHeDDazTfzQJFPVaFk5gv1dqkRd8PUFReI7SxNYWo+i7xiGUPyAJz5v909SDRNzYMbw94kqKfdRIw3Bgz0edd2t0bF7TlsJV44e2iI753sGJ0rf5dJErHnuXhWIf448Skzh5WfOnsfwHRjpfJfhD8/F7C/awQQ6G0N86yV5chrdBZ2Ty3llofOjUfC5uP4Y78lniKKjr6I1+Px7ShCW1BI2EkuS64KTzPxbnFg/fc7eVi5evIPlBCFDbMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWVfxJAyJEwaHfkw0BLOvUOCHmcQrLPXntU2sJBSkKQ=;
 b=T6klWwvqtWsZoymgG9wIJIUcRCj++17pzBTchyOp+3FQS8/Q5DiW5PlEdIz4R9ukItIEvlcbuQLZS4871mGaTZad+eaYYLMn5DKblmIOMlruzT7UR+aWMuUMzap5sbpaQdR7PWY9SFk6e4AX3LQnBnpCe61LJvzdx0qr7nLI8sk=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4052.apcprd06.prod.outlook.com (2603:1096:820:2f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 03:02:27 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 03:02:27 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop compressed
 page cache
Thread-Index: AQHX4Q7S93pDb1d7S0uCDiq5qD0NTqwUXFyAgAC3AmCAAA1sAIAAAOWA
Date: Fri, 26 Nov 2021 03:02:27 +0000
Message-ID: <KL1PR0601MB4003F565A77473ED2330C731BB639@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211124083929.259433-1-changfengnan@vivo.com>
 <20211124083929.259433-2-changfengnan@vivo.com>
 <AI2AswABE2wldWuXsm4geaoQ.9.1637853316644.Hmail.changfengnan@vivo.com.@PGZmZmE2ZjgyLTIyYTktYjE5ZC01YmMyLTJlNzlmZDE4MjBiN0BrZXJuZWwub3JnPg==>
 <KL1PR0601MB4003860E394F4796A2128C97BB639@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <APsA8wCXE*EmijJwHbYMfKoT.9.1637895500761.Hmail.changfengnan@vivo.com.@PDVmMWU1Y2U4LTdhOTAtOGEzNy1jYWUyLTc1ZjNhMTQwMTMyY0BrZXJuZWwub3JnPg==>
In-Reply-To: <APsA8wCXE*EmijJwHbYMfKoT.9.1637895500761.Hmail.changfengnan@vivo.com.@PDVmMWU1Y2U4LTdhOTAtOGEzNy1jYWUyLTc1ZjNhMTQwMTMyY0BrZXJuZWwub3JnPg==>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08666f0c-ed91-4b9c-ea7c-08d9b0892dc8
x-ms-traffictypediagnostic: KL1PR0601MB4052:
x-microsoft-antispam-prvs: <KL1PR0601MB405261650FBDC8D1756C597FBB639@KL1PR0601MB4052.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaOwgqcL62kWyVZeQ8TbDMgbz7PjjvFgitTLaj++fcxmGpXrR7kiHZn43e9uQMm7MBjGXy22ViGDLxHFDGFEUePqtqmzy9F3C/AiCOtFbPwOHGFiGew93HxId89cwA5B4JbcozL+pmLVGSD3VpbklvzFdTVUG1nycfBDcOgFvxTgJe8v0IbbHbDowPBcdZycPmxd0CO4TBVT//5a1rqlytoTy2mnX664+F1BxmoMQ4w+Lcco8CPEb57R+X4XCNZNqcEGHvXZtBfe4zMED+v2qcLMAbi7CYAik1U9EBxc1iaG20229rrEUhc2xbg2fAHD6dsEDwy6JOzB+2r89bShykIVUCDWpVEdIfsGrlG7Uf9L5SwvDttaejqUdMfBfRTxBw3jpXElGDx6Bm31R7Sb3dqGoNhvKsaO5CmLfLDX9zjedM/LbKvOur5dg0sqY0VsNliv0EvVSAAOvDYScLtFgjyFugfCBZjcNH0ZJeWo2Pme6xovwKXGdUBUphU64wXdR1+Rf63zbnu8KwB03Ra+HM9NGF2YbuwOL+i3u0HBKxM1trZAQgdwKHY3v92PSyH62fcO3EHunVSqpcPsbFCpXeLCE0aihgAg7zCkgnKAJILny/esJGXtaNqUO48myF0uCkQaI3No38+OoNRrImVkG7a0ujocUnWUVu4O4EUokMDL9+N544uLDnVktZbNSvpL5YzXfT8/8xqPduAzkgKhsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(2906002)(316002)(508600001)(38070700005)(86362001)(8936002)(4326008)(52536014)(8676002)(5660300002)(26005)(66476007)(76116006)(71200400001)(64756008)(83380400001)(66556008)(66446008)(6506007)(53546011)(9686003)(55016003)(7696005)(85182001)(186003)(33656002)(122000001)(38100700002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3hhU3NTYWkzY05JV1VRbm9XUFJhSTA0NHp0SzlVUTN3V0FZL21LMktxeXl5?=
 =?utf-8?B?R1lLMEFrVkUyUksybWtjaUd3RWFUMGNXdkFYa2JDeG4wL3duVW9hUVB6UHdK?=
 =?utf-8?B?S1ByOEtaWkVBc0VBMkhEUS9leFNYdUREbUJDa2JvZHgxU0MrdlFLMW8zOGVi?=
 =?utf-8?B?cDR3THowdVp2WEVCSkNyNXJGU2dteGlaR0xnQVV0QXdrSVcxOGpEMmxMZENm?=
 =?utf-8?B?b1VQT3VWZXB4WU1NbmJlL3ZXSDhCL2ZUWjhZN21FQjhEMVY4dS9QYS9kOTlU?=
 =?utf-8?B?S0tqalJsZ1lQTWVMVkdUcEJkSjh1UWdtMTNEWE83TDFXNVNWc091MGxPUlpO?=
 =?utf-8?B?a3pXK1ZFa3UyYzBBc3VTQlVreEJURVpBblNqcmtPWllPTHRjdDNwRHdwNEJq?=
 =?utf-8?B?WTV0SDNBNGdpWHZLdDhKUWg0L3ZiSTd3OHF6OURyZ0FkeDYwN0l1dmtyenFi?=
 =?utf-8?B?OHZNNzZiQkREUXYyYnlZZHBuWENoZ2NBZnhsUERkOGkySHNPeDF2M3JaRGJi?=
 =?utf-8?B?cG16bGo4UUxFYWprS0ZJWFJYQzNUdWg1Z1ZJR1p0RzhFTCtwUk1keWkyaW5Y?=
 =?utf-8?B?QmN3eUY0VkFXN04yaW44VlU1TXB0VTdMRUYxaTVBSHZiYjFKaFNITkN4dmd5?=
 =?utf-8?B?NDR5MEtBR0Y3ZmVmRGhRMWpLcUt6SHdxcm12c3phVGJ5TXdKdTdFY1AyWHo4?=
 =?utf-8?B?V015ZHN1cjJlNExBMEpmekpyZmYxa3pnRGFvODVoQkdjbUQwSXhCWEQrRjlq?=
 =?utf-8?B?Qk50QkpNVUpQam1yRUVpTE1mSWw1TWU1K1RkZ09EWHhwUlhWOHlSdFptVG4z?=
 =?utf-8?B?ZTNqdkJ2YllCbjd3VFJVc3F3d2hwWTVGWmNqN0drYzRjNHVYbWk3Z1RwMEFL?=
 =?utf-8?B?QmpQdXhqQm1ZUTl0Y3VsWituQnQ5cjdLais3ajlCRlFKa1d0S2hUcVM4UFd4?=
 =?utf-8?B?dTBvWkR2VS96cC9ITDF4YXd2TlFZTTBrWXBXdTJvcTAwYTZRZThDaUtNNjZz?=
 =?utf-8?B?dVpJR1QzaWwwV0dxSVRpNGFhVGZ3anFuYVp5c0pEcnhQV0Zvd0ZvOWxCNUNi?=
 =?utf-8?B?ZldhYTh3NHRNVCsyVnlvQzJDekYxZEYxYnlVWlVldzcrMm90U2JsbThFbm0y?=
 =?utf-8?B?bkwyM1NWSmR6Nmd3YU00RHhzOTU0dTFmZzdoTFpJbnRDU2VDUU1vakYzbmtR?=
 =?utf-8?B?MHZtM3I5aTNHdzBzV0FYY1BpbnVJZE9vcU5nL0pFS3NYQkYvOWtKUTJaT1BD?=
 =?utf-8?B?VkVPOHNUZTFMZmdRM2tUb2QyZjMvZUpSL1FNanlwbW5tYmJIdHByTWk5cGlQ?=
 =?utf-8?B?SExqaUVSeXpKbHAwd1pzN2lDS291MjhndUdCOGlrODQrMDJBMVpLV0t4dGFz?=
 =?utf-8?B?Q3YvMVlVMzc1eGorN2V4dFNLYXN0QldUeHgzT2pLUllRVmFlMmUyTGZVd2hQ?=
 =?utf-8?B?bmgxSXVxQ1J0RllRbXhISlEyeVhVQkdTTGJUV1NNZUhzWHhGN2g4Mks1czl6?=
 =?utf-8?B?S3dzUXZQM0lQNGJSK1huUWkxS1FQWVJXSU15UEFnUUQ1aEhQNXV2eCtkNTFM?=
 =?utf-8?B?MXpjSmVPSXVOcUVHeHVpbHoxNXdMS2RlRUxwZ1NZMjVLQUI4d2F4TjcyTUFl?=
 =?utf-8?B?Nk1ncHozSE1LOEhkcldNMVUrRTNtYlhFQWdHNko4NFdYM3o2SjVYQVRRbEZV?=
 =?utf-8?B?ZzlVbC9aeG5HeE1vSllXSWs5ZjE4bVp6OWx6WW1QYzVlanRLZEVWdTltL2Fz?=
 =?utf-8?B?QzBqZFVmZEo4UXJKVml2d2Q4bEdBbStYNVRWR2dRSUtPMzY4bFF0aFgyb2NK?=
 =?utf-8?B?aHFzZFh1Wm9tekgxM2tNbXByRmtvdU1RRGh4SjlweUVKYmxUWXo2YWdlbTJO?=
 =?utf-8?B?b3NSdC8rcDJlU1VCdVMyWkIrMGtpa0hNUmU2Unl3ZDhSem5mR1JXYW9Jd2NH?=
 =?utf-8?B?ZGtNQmQ0K2JmM0wyZC9XOEtXMGFlME9yVzJJckwzazl0VVNLQStoZUd6U29l?=
 =?utf-8?B?ck1XYktNbCs0UzU0ekFvbzRvb0w5N0tUdkRnM0RxUkIrdXM5QW5GcUN2Ym9I?=
 =?utf-8?B?cmR6MWtmOVJJN1h3V3NlemtaWjh6aHM4M04wSG5La0J1L3BiSGIxTlhFMk1U?=
 =?utf-8?B?NlJlTEQzbk1hUitnZWVWRDY3N01Sd09SSnAwNmV3OUNQWVo3WmVnU1psTXFw?=
 =?utf-8?Q?kx+8sKcIz0WJ9W9JOZrGCBg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08666f0c-ed91-4b9c-ea7c-08d9b0892dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 03:02:27.2655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EITcdGDclBK3ABEM6puxEWkKHV5IMVR0hVV6l22C9Yiih0aDQzM7JGroVRPnaQrHaDUnjKAMncP0PexMGvKzPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4052
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.114 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mqRVZ-009YjO-Ea
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZiBDaGFvDQo+IFl1DQo+
IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjYsIDIwMjEgMTA6NTggQU0NCj4gVG86IOW4uOWHpOal
oCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnDQo+IENjOiBsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDIvMl0gZjJmczogc3VwcG9ydCBQT1NJWF9GQURWX0RPTlRORUVEIGRyb3ANCj4gY29tcHJlc3Nl
ZCBwYWdlIGNhY2hlDQo+IA0KPiBPbiAyMDIxLzExLzI2IDEwOjE0LCDluLjlh6TmpaAgd3JvdGU6
DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBj
aGFuZ2ZlbmduYW5Adml2by5jb20gPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9m
DQo+IENoYW8NCj4gPj4gWXUNCj4gPj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI1LCAyMDIx
IDExOjE1IFBNDQo+ID4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGph
ZWdldWtAa2VybmVsLm9yZw0KPiA+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGYyZnM6IHN1cHBvcnQgUE9T
SVhfRkFEVl9ET05UTkVFRCBkcm9wDQo+ID4+IGNvbXByZXNzZWQgcGFnZSBjYWNoZQ0KPiA+Pg0K
PiA+PiBPbiAyMDIxLzExLzI0IDE2OjM5LCBGZW5nbmFuIENoYW5nIHdyb3RlOg0KPiA+Pj4gUHJl
dmlvdXNseSwgY29tcHJlc3NlZCBwYWdlIGNhY2hlIGRyb3Agd2hlbiBjbGVhbiBwYWdlIGNhY2hl
LCBidXQNCj4gPj4+IFBPU0lYX0ZBRFZfRE9OVE5FRUQgY2FuJ3QgY2xlYW4gY29tcHJlc3NlZCBw
YWdlIGNhY2hlLCB0aGlzIGNvbW1pdA0KPiA+Pj4gdHJ5IHRvIHN1cHBvcnQgaXQuDQo+ID4+Pg0K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29t
Pg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxMCArKysrKysrKy0t
DQo+ID4+PiAgICBmcy9mMmZzL2YyZnMuaCAgICAgfCAgNyArKysrLS0tDQo+ID4+PiAgICAyIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYyBp
bmRleA0KPiA+Pj4gZmI5ZTUxNDlhZjVkLi43ZWM1ZTNjMjU5MGIgMTAwNjQ0DQo+ID4+PiAtLS0g
YS9mcy9mMmZzL2NvbXByZXNzLmMNCj4gPj4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYw0KPiA+
Pj4gQEAgLTg0Miw3ICs4NDIsNyBAQCB2b2lkIGYyZnNfZW5kX3JlYWRfY29tcHJlc3NlZF9wYWdl
KHN0cnVjdCBwYWdlDQo+ID4+ICpwYWdlLCBib29sIGZhaWxlZCwNCj4gPj4+ICAgIAkJV1JJVEVf
T05DRShkaWMtPmZhaWxlZCwgdHJ1ZSk7DQo+ID4+PiAgICAJZWxzZSBpZiAoYmxrYWRkcikNCj4g
Pj4+ICAgIAkJZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc2JpLCBwYWdlLA0KPiA+Pj4gLQkJ
CQkJZGljLT5pbm9kZS0+aV9pbm8sIGJsa2FkZHIpOw0KPiA+Pj4gKwkJCQkJZGljLCBibGthZGRy
KTsNCj4gPj4+DQo+ID4+PiAgICAJaWYgKGF0b21pY19kZWNfYW5kX3Rlc3QoJmRpYy0+cmVtYWlu
aW5nX3BhZ2VzKSkNCj4gPj4+ICAgIAkJZjJmc19kZWNvbXByZXNzX2NsdXN0ZXIoZGljKTsNCj4g
Pj4+IEBAIC0xNjU5LDYgKzE2NTksNyBAQCBzdGF0aWMgdm9pZCBmMmZzX3B1dF9kaWMoc3RydWN0
DQo+ID4+PiBkZWNvbXByZXNzX2lvX2N0eA0KPiA+PiAqZGljKQ0KPiA+Pj4gICAgc3RhdGljIHZv
aWQgX19mMmZzX2RlY29tcHJlc3NfZW5kX2lvKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eA0KPiA+
Pj4gKmRpYywgYm9vbA0KPiA+PiBmYWlsZWQpDQo+ID4+PiAgICB7DQo+ID4+PiAgICAJaW50IGk7
DQo+ID4+PiArCW5pZF90IGlubyA9IGRpYy0+aW5vZGUtPmlfaW5vOw0KPiA+Pj4NCj4gPj4+ICAg
IAlmb3IgKGkgPSAwOyBpIDwgZGljLT5jbHVzdGVyX3NpemU7IGkrKykgew0KPiA+Pj4gICAgCQlz
dHJ1Y3QgcGFnZSAqcnBhZ2UgPSBkaWMtPnJwYWdlc1tpXTsgQEAgLTE2NjYsNiArMTY2Nyw5IEBA
DQo+ID4+IHN0YXRpYw0KPiA+Pj4gdm9pZCBfX2YyZnNfZGVjb21wcmVzc19lbmRfaW8oc3RydWN0
IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsIGJvb2wNCj4gZmFpbGVkKQ0KPiA+Pj4gICAgCQlpZiAo
IXJwYWdlKQ0KPiA+Pj4gICAgCQkJY29udGludWU7DQo+ID4+Pg0KPiA+Pj4gKwkJaWYgKGRpYy0+
Y3BhZ2VfY2FjaGVkKQ0KPiA+Pj4gKwkJCXNldF9wYWdlX3ByaXZhdGVfZGF0YShycGFnZSwgaW5v
KTsNCj4gPj4NCj4gPj4gSSBkaWRuJ3QgZ2V0IHRoZSBwb2ludCwgd2h5IHNob3VsZCB3ZSBzZXQg
aW5vIGludG8gcmF3IHBhZ2UncyBwcml2YXRlIGZpZWxkPw0KPiA+IFllcywgYmVjYXVzZSByYXcg
cGFnZSB3aWxsIGFkZCBpbnRvIHBhZ2UgY2FjaGUsIGFuZA0KPiA+IFBPU0lYX0ZBRFZfRE9OVE5F
RUQ6DQo+ID4gaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2V2ZWMNCj4gPiAgICAtPl9faW52YWxpZGF0
ZV9tYXBwaW5nX3BhZ2VzDQo+ID4gICAgICAtPmludmFsaWRhdGVfaW5vZGVfcGFnZQ0KPiA+ICAg
ICAgICAtPmludmFsaWRhdGVfY29tcGxldGVfcGFnZSAgLy8gY2FsbCB0cnlfdG9fcmVsZWFzZV9w
YWdlIHdoZW4NCj4gPiBwYWdlIGhhcyBwcml2YXRlIGRhdGENCj4gPg0KPiA+IFNvLCBpZiByYXcg
cGFnZSBkb24ndCBoYXZlIHByaXZhdGUgZGF0YSwgaXQgd2lsbCBub3QgY2FsbA0KPiBmMmZzX2lu
dmFsaWRhdGVfY29tcHJlc3NfcGFnZXMuDQo+ID4gVGhpcyBjb21taXQgdHJ5IHVzZSBwcml2YXRl
IGRhdGEgdG8gY29ubmVjdCByYXcgcGFnZSB3aGljaCBjb21wcmVzc2VkIHBhZ2UNCj4gaGFzIGJl
ZW4gY2FjaGVkLg0KPiANCj4gT2gsIHl1cCwgaG93IGFib3V0IGNhbGxpbmcgZjJmc19pbnZhbGlk
YXRlX2NvbXByZXNzX3BhZ2VzKCkgZGlyZWN0bHkgaW4NCj4gZjJmc19maWxlX2ZhZHZpc2UoKSBm
b3IgUE9TSVhfRkFEVl9ET05UTkVFRCBjYXNlPyBpdCBjYW4gYXZvaWQgdW5uZWVkZWQNCj4gdXNl
IG9mIHByaXZhdGUgZmllbGQgc3BhY2UuDQoNCg0KR29vZCBpZGVhLCBJIHdpbGwgbW9kaWZ5IGxp
a2UgdGhpcy4NCg0KVGhhbmtzLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gPg0KPiA+Pg0KPiA+PiBU
aGFua3MsDQo+ID4+DQo+ID4+PiArDQo+ID4+PiAgICAJCS8qIFBHX2Vycm9yIHdhcyBzZXQgaWYg
dmVyaXR5IGZhaWxlZC4gKi8NCj4gPj4+ICAgIAkJaWYgKGZhaWxlZCB8fCBQYWdlRXJyb3IocnBh
Z2UpKSB7DQo+ID4+PiAgICAJCQlDbGVhclBhZ2VVcHRvZGF0ZShycGFnZSk7DQo+ID4+PiBAQCAt
MTc3MiwxMCArMTc3NiwxMSBAQCB2b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlKHN0
cnVjdA0KPiA+PiBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRyKQ0KPiA+Pj4gICAg
fQ0KPiA+Pj4NCj4gPj4+ICAgIHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QNCj4gPj4+IHBhZ2UNCj4gPj4gKnBhZ2UsDQo+ID4+
PiAtCQkJCQkJbmlkX3QgaW5vLCBibG9ja190IGJsa2FkZHIpDQo+ID4+PiArCQkJCXN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljLCBibG9ja190IGJsa2FkZHIpDQo+ID4+PiAgICB7DQo+ID4+
PiAgICAJc3RydWN0IHBhZ2UgKmNwYWdlOw0KPiA+Pj4gICAgCWludCByZXQ7DQo+ID4+PiArCW5p
ZF90IGlubyA9IGRpYy0+aW5vZGUtPmlfaW5vOw0KPiA+Pj4NCj4gPj4+ICAgIAlpZiAoIXRlc3Rf
b3B0KHNiaSwgQ09NUFJFU1NfQ0FDSEUpKQ0KPiA+Pj4gICAgCQlyZXR1cm47DQo+ID4+PiBAQCAt
MTgwNCw2ICsxODA5LDcgQEAgdm9pZCBmMmZzX2NhY2hlX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QN
Cj4gPj4gZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBwYWdlICpwYWdlLA0KPiA+Pj4gICAgCX0N
Cj4gPj4+DQo+ID4+PiAgICAJc2V0X3BhZ2VfcHJpdmF0ZV9kYXRhKGNwYWdlLCBpbm8pOw0KPiA+
Pj4gKwlkaWMtPmNwYWdlX2NhY2hlZCA9IHRydWU7DQo+ID4+Pg0KPiA+Pj4gICAgCWlmICghZjJm
c19pc192YWxpZF9ibGthZGRyKHNiaSwgYmxrYWRkciwNCj4gPj4gREFUQV9HRU5FUklDX0VOSEFO
Q0VfUkVBRCkpDQo+ID4+PiAgICAJCWdvdG8gb3V0Ow0KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgNCj4gPj4+IGFjNmRkYTZjNGM1YS4uMTI4
MTkwYjBjNzM3IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oDQo+ID4+PiBAQCAtMTU1MSw2ICsxNTUxLDcgQEAgc3RydWN0IGRlY29t
cHJlc3NfaW9fY3R4IHsNCj4gPj4+ICAgIAkgKi8NCj4gPj4+ICAgIAlyZWZjb3VudF90IHJlZmNu
dDsNCj4gPj4+DQo+ID4+PiArCWJvb2wgY3BhZ2VfY2FjaGVkOwkJLyogaW5kaWNhdGUgY3BhZ2Vz
IGNhY2hlZCBpbiBjb21wcmVzcw0KPiA+PiBtYXBwaW5nKi8NCj4gPj4+ICAgIAlib29sIGZhaWxl
ZDsJCQkvKiBJTyBlcnJvciBvY2N1cnJlZCBiZWZvcmUgZGVjb21wcmVzc2lvbj8NCj4gPj4gKi8N
Cj4gPj4+ICAgIAlib29sIG5lZWRfdmVyaXR5OwkJLyogbmVlZCBmcy12ZXJpdHkgdmVyaWZpY2F0
aW9uIGFmdGVyDQo+ID4+IGRlY29tcHJlc3Npb24/ICovDQo+ID4+PiAgICAJdm9pZCAqcHJpdmF0
ZTsJCQkvKiBwYXlsb2FkIGJ1ZmZlciBmb3Igc3BlY2lmaWVkDQo+ID4+IGRlY29tcHJlc3Npb24g
YWxnb3JpdGhtICovDQo+ID4+PiBAQCAtNDA4NSw3ICs0MDg2LDcgQEAgdm9pZCBmMmZzX2Rlc3Ry
b3lfY29tcHJlc3NfY2FjaGUodm9pZCk7DQo+ID4+PiAgICBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
Q09NUFJFU1NfTUFQUElORyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOw0KPiA+Pj4gICAgdm9p
ZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
DQo+ID4+PiBibG9ja190DQo+ID4+IGJsa2FkZHIpOw0KPiA+Pj4gICAgdm9pZCBmMmZzX2NhY2hl
X2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdA0KPiA+Pj4g
cGFnZQ0KPiA+PiAqcGFnZSwNCj4gPj4+IC0JCQkJCQluaWRfdCBpbm8sIGJsb2NrX3QgYmxrYWRk
cik7DQo+ID4+PiArCQkJCXN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLCBibG9ja190IGJs
a2FkZHIpOw0KPiA+Pj4gICAgYm9vbCBmMmZzX2xvYWRfY29tcHJlc3NlZF9wYWdlKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgc3RydWN0DQo+ID4+PiBwYWdlDQo+ID4+ICpwYWdlLA0KPiA+Pj4g
ICAgCQkJCQkJCQlibG9ja190IGJsa2FkZHIpOw0KPiA+Pj4gICAgdm9pZCBmMmZzX2ludmFsaWRh
dGVfY29tcHJlc3NfcGFnZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+Pj4gbmlkX3Qg
aW5vKTsgQEAgLTQxMzcsOCArNDEzOCw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9faW5pdA0KPiA+
PiBmMmZzX2luaXRfY29tcHJlc3NfY2FjaGUodm9pZCkgeyByZXR1cm4gMDsgfQ0KPiA+Pj4gICAg
c3RhdGljIGlubGluZSB2b2lkIGYyZnNfZGVzdHJveV9jb21wcmVzc19jYWNoZSh2b2lkKSB7IH0N
Cj4gPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFn
ZShzdHJ1Y3QgZjJmc19zYl9pbmZvDQo+ICpzYmksDQo+ID4+PiAgICAJCQkJYmxvY2tfdCBibGth
ZGRyKSB7IH0NCj4gPj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2Vk
X3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+Pj4gLQkJCQlzdHJ1Y3QgcGFnZSAq
cGFnZSwgbmlkX3QgaW5vLCBibG9ja190IGJsa2FkZHIpIHsgfQ0KPiA+Pj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBmMmZzX2NhY2hlX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvDQo+
ID4+PiArKnNiaSwNCj4gPj4gc3RydWN0IHBhZ2UgKnBhZ2UsDQo+ID4+PiArCQkJCXN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljLCBibG9ja190IGJsa2FkZHIpIHsgfQ0KPiA+Pj4gICAgc3Rh
dGljIGlubGluZSBib29sIGYyZnNfbG9hZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLA0KPiA+Pj4gICAgCQkJCXN0cnVjdCBwYWdlICpwYWdlLCBibG9ja190IGJsa2Fk
ZHIpIHsgcmV0dXJuIGZhbHNlOyB9DQo+ID4+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19p
bnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzKHN0cnVjdA0KPiA+Pj4gZjJmc19zYl9pbmZvICpzYmks
DQo+ID4+Pg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
