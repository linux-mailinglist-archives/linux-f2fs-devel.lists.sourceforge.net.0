Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210E86ACEC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 12:24:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfI31-0003Ag-Kc;
	Wed, 28 Feb 2024 11:24:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=7815a58e9=shinichiro.kawasaki@wdc.com>)
 id 1rfI30-0003AZ-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 11:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqTQ66yq8Y3hxAJV66uLUDNxYGAbm7ulnkoPQuhb1FU=; b=VD1KY8I9pneuBtBbNXTRHzRfvV
 /3CpWvhOWBdlI6aN/PI0OfMJ03hY+XYl6qU+8j0TrC3JsZOnzhrVR4zZUpHL8Hdf0URJvGjh1egUP
 EqsUFf62VbaR0ujxcjoz0VVwLqXrn607lD2SiAsd5X3qrz6l+AnKwIDwZHzb9JE58bDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bqTQ66yq8Y3hxAJV66uLUDNxYGAbm7ulnkoPQuhb1FU=; b=kNVuvBa8XfqwEMerSFaJFm18OC
 U7re56W6wVcT4o2NRWdLvsyJM7fElnzh0hLUGJyT89uSr3n1HmHRp2wyWU59yLct5hwBbdzeatEjW
 +Ue6SR3LnUlPASoILMF8Jla/60giUZCygUJoplizXmt2/3DHceLYvL+BwRE6giVmb//k=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfI2w-0004Bk-9L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 11:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1709119462; x=1740655462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4x4WP9X4XPCPDsLvsBf9ax8ny4y2mMJQ4Fwi8nhZINU=;
 b=b8XZVa5i+vs+PWq9zB3o1rYyZFa+89Bd9Ibf4XEVH7qU2GNrKXDd5Ni+
 QL255mOq/L7ArMLq66GxXUublxX7aTIJYPHl9cImyFCnpz/9I1OW9OksE
 wJfuCxJEQi/injCtEbrr5D6xxx83Tthm1TycT7FF+fEyp87jSUggPLxVv
 kY1rA6UKCM/RQjRrxtrOJBWIbj9RUH452xjsr8jQHqvo3jq6tE1sEE04X
 aJTFZ1dytf42RYG10RWDYZasu851o5VhF9KLoPfpbRoIfC6LYMhFe1sa+
 QHiYc1SpNVu+eVh91PzdEJD42B9RhshjASqTGbPLM6zshX59MFgh4UZ2J g==;
X-CSE-ConnectionGUID: KtVY7lKeSiKUqyGP9Xs3kQ==
X-CSE-MsgGUID: +i7inA86Sbm5Z5ACrfUAkA==
X-IronPort-AV: E=Sophos;i="6.06,190,1705334400"; d="scan'208";a="10357348"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2024 19:08:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsoaC64E04pc1Zyi0GPR0S97y5mIyYzVl0P9EpRHqi3Gubu15f1gIYzuyx3TPSS7GTIXyCVg8VSB2fYMnbzPH5WbhNOIQWiL4eJqaaINhKDfZbgzMWRsGqNBaxy9J4VKggUSMS8VRnjHMwcAErwktV9ixKwPhaYc0y4qQQRGoHRkLBi+Q9740wjMdeZsJBwnPDJ9D2DeX5K7fGHJGwlGOgeQV8yZcu6RbhVDsKA9IE5IhpuzYcVfb7jS9Z0LzDtKgT1WbkDB8vXoAwZ7Vwi1J17oJ4lyyPtqUtNWQcp9zKfVzyPLLWPfYXxAwwKJ4f/KoD7DiUVzBxP5OLyf8gY13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqTQ66yq8Y3hxAJV66uLUDNxYGAbm7ulnkoPQuhb1FU=;
 b=DPeTUmsEZqCY2E+VnX+OhFoJPOOf1wdjNQ7yKJpfvuKW84vjwjPkWU7QDlxMn/1yaq53pv+X36g/P3Tj+0zYBsQsHNS1xYbtQg090BaLnYlUi69lUhhFrQ8yL2/xs/7ZZZagyyiLOq6SYgXb8c7bHUtw1hFjhmOmLGnQtPDL/nCvvlVC96tRGKOC+RsDShYIrX7X0MzZ6MhA71xTOHVDDqR41eRsXOkXnJh6faAeiXsdPesyX01DdxgoMU+bpNAysPNgv2SH2AWsN1BxXG7hiaoiAN2PkU0bP4bnqderm4+GDUoDR+7PBDqQPdP0QoIljjApJVHNrXTqf/pE8NiQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqTQ66yq8Y3hxAJV66uLUDNxYGAbm7ulnkoPQuhb1FU=;
 b=gnqRyvdW95tFy7+3Whc8fZc7+wZ4AeVbOpC3ECzO6aWnN8/krGjM2O3a4MH9q2886L7mqMomfCIc1ZPogMqHFBDszqG6+O5mjcPO8i8cEFKjAUoaleV2CGLaLvEtIIKzNdB7vfiGFoWVSvaPMknhesaYcwHAuSIgInPnsx3NaYI=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CH0PR04MB8001.namprd04.prod.outlook.com (2603:10b6:610:fe::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.39; Wed, 28 Feb 2024 11:08:26 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b%4]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 11:08:26 +0000
To: Yi Zhang <yi.zhang@redhat.com>
Thread-Topic: [bug report]WARNING: CPU: 22 PID: 44011 at fs/iomap/iter.c:51
 iomap_iter+0x32b observed with blktests zbd/010
Thread-Index: AQHaYovQw4Cp4i7GhUK8xyPo7C3fjLEfp86A
Date: Wed, 28 Feb 2024 11:08:26 +0000
Message-ID: <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
In-Reply-To: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CH0PR04MB8001:EE_
x-ms-office365-filtering-correlation-id: 6a1e1670-b593-4a13-b2a6-08dc384d9623
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4Ng9z8CyAjEAbwVSkuNw3wb+ObbkYWyGhkwY+NGKm098CusMo+9GlHqp1mtSw11yMsvfq3eKGwzl9eySY00J2D7l8RHVDOy1Ej3Yitsi2dobyoUNLBWapTeQP5RhkOe+4N3Ax4GtUpv0uiSuuGvph/66RgitX26oGXUTIRhLw95asgGPAm+semVDEvA+LI/b/xBsFGqhlNv6PujiZs+HzxqJ6zcEdZWl2fg8v3J1aLFrpMvUKnOkgCjZ41QZw8k8G60sgw77fgJpvDP44qmvMjRNWfDB2FQ2RNHU0D1+hmY7/oI0zN5F/WCTYU2ATrBqOJxd8Tf/V6d+BqeE/fy2EWCXXtFJOc2Mv8te1iom7MpTZV6DsHhwVHwR6WToU5et440dd//iBulPWPOuYQ5gcG2BtsgZNDzjMOi/lhCCmwT5oNWOP7Pn/I+t/l04sZoxQIAIaYYYhdqW1CUN0ro3fhfl2We4e9ynXgYAgqc4PjACwYju2uoIE20rsvBF8OH1VVexMj3o+OPkb8AOhDRI5qDXcBWwgogDQEnwtLTHdMPz3QT5dxX7EDtV6lHY/bF6n5aXobTUWxkT64WamIwTZIOyaNHD4A1Nxoa6HGtxVSF7t3hZF+5PQrGdTNdeuXg1ES0ybzUNhhCuGwy/H0YxNDNz74A3OUTSMKZjDWy23B4RZoVqPm0WgDvHI4H9SIrXaJkUNHuRJQ+449qHaYhTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yGidABvWHRCX3HUPyTjp7P+90b/zRKlsWCZOCSDuQqcDujU2cLVwPc7m89bl?=
 =?us-ascii?Q?EedqioFXra9WSTJ8PsaDFIUcXwbhwQvDMUqIsPoRVyahY82O0vtpqr5WmeCj?=
 =?us-ascii?Q?S+NiP8xk9G4tO6ghu7l2lOvJfKLSKrFCZ4CSKCkOA4hpWYcBCvQdfRf9ZVbu?=
 =?us-ascii?Q?k6ZqjzuFSyO9MwJ7CHEf206H6mMlvssNQ9ga0j+n5USF1dPx74Bz6pyV/XPD?=
 =?us-ascii?Q?kuKcIW4i/BNYEz1lvPeVq8ed/J417fzkRei4cfg5+x0i4azLix17LKkz5V/o?=
 =?us-ascii?Q?A/GJuME+bDbV9X+5kZceMNWydyMW5W6wma/Y6qWQ3AfZIPjDCBx38djuBOq6?=
 =?us-ascii?Q?5/ypX3dVuou2wbwGpd0eGBScQ6A/b2EH131g8oKx1a47Zy1/Onlf3ypPi4Vy?=
 =?us-ascii?Q?d4lNa9XS2rQUc6REDlrM9BCCScqmSteEpNhJAD1rx5v/z0VloyqYPhNE2Yer?=
 =?us-ascii?Q?gjRiH6cHOXg5Ax92mn8z8gnLVzgDNHMuIO50vAflECB8+tX1Z7U9q1DJaj5l?=
 =?us-ascii?Q?vEqlctctI0/adxK+O7CVBwhrylboXpzY4xb89+cUcP3no/OZBeMaCnAVTB+0?=
 =?us-ascii?Q?VwtANjiYPPvNkZfEk6IL9QOoowedxHRwTJUSMDB6rfc21FpgJ8jFAkdQOgCg?=
 =?us-ascii?Q?GsHwC86bcdv1d/JPZDRQlWmowiqDsHsU32xtZGALSkEmPuyDZ9X7TGqX9yiE?=
 =?us-ascii?Q?zirgTSfXD4LerIaFrTwSK1A84nR8xkfPKM9ilwa/iWXLkF3kW1IbnjPb1IZC?=
 =?us-ascii?Q?mqs0+MHhtk4h4kSs7vlUrADyEkwC1aVjrrRGxZ7pBqcaaoRGs1PdRzqrP0vq?=
 =?us-ascii?Q?JiT1xxwk1FDJvEMW5f66ms4rME5tO+j04IMzARXJYu1DS32/PLgX3KNkXR+J?=
 =?us-ascii?Q?a8w4y13KO+ufWvAQbMyAb2pOdJ4gZb2ge0zla7ArgN8VcTwIQskWcXxRPOhc?=
 =?us-ascii?Q?mafLj3MijYFiOAoywd9k7TIuk0eQUdzawDE+teNFHjnMr8OIgCxvwmKCpY8X?=
 =?us-ascii?Q?wYWDp3cOjOx5/cctvEktJpCEudkBWniI5ODeOeb6lk2VBhSJZwWP1a79U8X8?=
 =?us-ascii?Q?AHW7r5ICdDvzfQtWXJB0v8wmpSXznlJdc0o1mHXgKpkNwv8V4w7ynkCJDONk?=
 =?us-ascii?Q?DteuShoGNPGFA/WZxk9i8mjTAiTwrj1PFLVxyYrgI9HaNMSHtRcf67wm0MR5?=
 =?us-ascii?Q?IA/s7z2pEbOwDoUBM1L2qvyQLCXiedyD7fLPcjzy1T+mtCdjHhbBmMc7mpOA?=
 =?us-ascii?Q?e2Td0WmnW2UwsoKO2J+jGui9xUrj4tN8TG47VMTnu7Xp1uSS+8NWcUI0yWsa?=
 =?us-ascii?Q?NmzzrLIatoURhk2IjEeSuXrDgqSBINkSuMyT1gFiHPHHGPNUjIZxnH0aPBVP?=
 =?us-ascii?Q?pR6ePpU6gV7BzTTqy9tCfDtQzZN5tPiFw+IZZ+Tk+ovaXQ6TbnUkXHiKtVjs?=
 =?us-ascii?Q?B/YXey3NbX4HfMZDw8oIhNloziwwhm9Nk49PIl2u//fh+lzVjujkqqEbmCtt?=
 =?us-ascii?Q?MltUD1rjtTcdIBfz38dw/5e63HRtiA6VI/D71rkrMP2vwVBjY8CQx9dycCZZ?=
 =?us-ascii?Q?7QtQnr9hM8InGuDPct7zmCN9qTPV55ll/cqSoQ9iAOMQwbAsyoR/Sqe32EFO?=
 =?us-ascii?Q?THvkJssRCgr/4uXAe9TqEgs=3D?=
Content-ID: <19FBFA86EDEFBB4CA461BFC624DA84F8@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wrWHEk0Ks7WyVYpoIDWxAB8osa6CFfq2CxoEhOZW+ZMeGYwOGFWI5ZAgaa37HasEOYPRuJam0QI1jLQebwkuKyBAMQjeli9UTnx10nE9QOWENztRaqXyZ+BamiBK5Ys/do6EOwPiugoWB4tW5oCXsIyA9pxGlZ1kEjn4ObvcxvoslEdcAdsQXLRkP2h+3HYfcsR7x8PlDSG9pBw75ouHYwWIPLzSX7+ynz6wIXEWHIQzXo3N5+YVtsl8G2P8lpcsvCuHBLg1Sg1/hTUlxo2GqRodnN3MXTlFMg+J5IXDcltYxEslmp8U5T/zV3NywS7jS1zxRYVfcg355t0vv3QloYyrDms9uqMb2GepHRG2iXRv3Uo8UZjYBHXwgVv6JkS7WyEg+hKYtbzx7ofjHW10tnjztUc0DHLjoTfSYCab1SJYI1YlA9kEF74qrLV2+lkIfoxmOQaOSkLS4vQuDi4OJbk82wOy8y0Auyc0srJpvnSK1I0AC7ah3lJwl8O4oha46GcX4i2sqgVaKtZfkxuUmyjYMmn35+kY7sqNig3VpNWy2RO0Fw6hUPQw0+cW3U9ffBpUdI7vw9F/MhlVzE8XBrNmefqoo97yoqnTNN0RHyP/SpSMMOSbyEmdvkITp05+
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1e1670-b593-4a13-b2a6-08dc384d9623
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 11:08:26.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DCB+zNu2XeZmhmlnwn23Ko+5kQNCvgu3cHZvpL3SCK6vk7ZX2vo3HJJ5hlOuIcWm4azAe4O3cqKRQcwE9K7tWtGJOmTt++8MWTEOAVqvIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8001
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Feb 19, 2024 / 00:58,
 Yi Zhang wrote: > Hello > I reproduced
 this issue on the latest linux-block/for-next, please > help check it and
 let me know if you need more info/test, thanks. [...] > [ 4381.278858] [
 cut here ] > [ 4381.283484] WARNING: CPU: 22 PID: 44011 at fs/iomap/iter.c:51
 > iomap_iter+0x32b/0x350 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [68.232.143.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfI2w-0004Bk-9L
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Feb 19, 2024 / 00:58, Yi Zhang wrote:
> Hello
> I reproduced this issue on the latest linux-block/for-next, please
> help check it and let me know if you need more info/test, thanks.

[...]

> [ 4381.278858] ------------[ cut here ]------------
> [ 4381.283484] WARNING: CPU: 22 PID: 44011 at fs/iomap/iter.c:51
> iomap_iter+0x32b/0x350

I can not recreate the WARN and the failure on my test machines. On the other
hand, it is repeatedly recreated on CKI test machines since Feb/19/2024 [1].

  [1] https://datawarehouse.cki-project.org/issue/2508

I assume that a kernel change triggered the failure.

Yi, is it possible to bisect and identify the trigger commit using CKI test
machines? The failure is observed with v6.6.17 and v6.6.18 kernel. I guess the
failure was not observed with v6.6.16 kernel, so I suggest to bisect between
v6.6.16 and v6.6.17.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
