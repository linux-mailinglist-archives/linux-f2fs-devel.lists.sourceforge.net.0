Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D576FDA6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 11:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRrLS-0003WZ-4X;
	Fri, 04 Aug 2023 09:43:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=573aff2c0=shinichiro.kawasaki@wdc.com>)
 id 1qRrLQ-0003WP-W0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 09:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+9+L+i7pupyf2SHjS5nPajVKSLNkhBi3BRgNI+FPXIc=; b=TesApBUrVtDXBO/8LJmIeBfLr+
 uPciPhLxl6PGF2dsO0ZGlQiWfKyW+a7QRGJnHXxQQCnwQyENLqOyUxXDCfzuLvEqN+li96GaVfd0k
 XfAdb+7dBiEbgupB/zYBwbrJpziLFChr7TJJe2YgVBjYpaXJ23jBIJ6yKYPC822uEfGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+9+L+i7pupyf2SHjS5nPajVKSLNkhBi3BRgNI+FPXIc=; b=TWBVu6rDW/sxsJwenmiCE1lm2M
 g1N9gGpvfZJ8pfaQsskckUvvPXORHOryWfnqdkDSG24EVQp0yEgKZTf3a3Y8Czsg2s4EprCCeCUPM
 pa0PJjkeSRpB+vtl4r1m855KIgmxEh7s6WghOzw0/lxp0EXskCM/xWUk17Y2UJjQzHuU=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRrLN-0002mN-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 09:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1691142217; x=1722678217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7uLW3S0dzF9wDTZ987N2PWPfn5def70S6WnBOGWo2UY=;
 b=Fd/oEX5zAxc+WBLNE2Fx2FGS3rWCOnkiR2kVI02AsPzt9KUcOkmwkIDS
 SDwLOAZJuFViR6wxkWfpaOHq/LBMorerIyrU12DSGVyTKPMaLFtwD0wDy
 XoXwuKAApUn8a+P6daUIyRPHZbIlUQtwf7mf/xjv7BYqLuJQfHsiClUUi
 ZgdujEiv8b/nW3bSQi5GDCcYavtxNR/lRA4DA3W0ICPtNHUc8tKA9fcdr
 hk/kXNyga0zBL2C+rzODSH+koCyMMKs7kZ45IU8a7e9202eddQ/hC2rsQ
 lootzFq/sLbK91YT5auHMme3Ti8Du/kXT2WPq5VKVEOA02HwKjnlrlEOf A==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684771200"; d="scan'208";a="244706199"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2023 17:43:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaY+PFZ/igCtR1XSXI3yY/rCwY2OXRGJcKYGd+HKkoGMz0P3hzcK8crBOSMFkQGQ1i9k6K+N1Hj0ntsyZqLtTm5faHEzJh0G5aFGTG2rhvnC74t0l+Z/+L4KAPCwvjgT70vSZQZwURbsujv47umb27l/RV5V8WUSbr6/rjHtsIXj62Prp/EHbUTBNsSUpJYCI0nw3revke7ZoeZuIQfvTa+LsMhElhC9NQsBwyrVVgtJN0+SVufxYXD6ef7fYpmqeihXICRAAXIF2/m3TCQ61wbRMgBMU55YP+wLvORpx91y6aoKc6LuNAUl7uVORcq2Hc+lAcC5q7D987s19HPb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9+L+i7pupyf2SHjS5nPajVKSLNkhBi3BRgNI+FPXIc=;
 b=Y4H/vFvaMlMVU5kPHZ3uUmhfZZRT25b5FmMK8OIUvaV3vwLtGbioLoNzwAkQBCMj2r5fwnnYEhQlHCR+fRhaNfHreLQArmnXvkfxdVY4rk8dt1qrn4GCXU1wb+78JNULjPQpQBWZ1Oeu/GfEX91I5iwanm+U1FZVcSyzDVIz+iFODouFn+1AoSXhjBrEArm3PxKbYgO5yP1rKu7RPDP95XDUPWMtuv9/SprI2TXSGawpXVyhRsM03Zr0Tnf6xdHc8mGOjvWpd3FLbhYBPPGw4f3wVhgIC5Tc56JI0wlBACXexkrU8+uxvzUASXJDZ27pdj1+/RPWcXOGRVLTkqi2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9+L+i7pupyf2SHjS5nPajVKSLNkhBi3BRgNI+FPXIc=;
 b=GRdVH40kTuRcG5O/B+BRcDysv2KeX9R/zApo8EFhZoUuy2IeomCNl5TvyDLJUyyUG2bo40rTBl9kFaxks90kSTkpfZV7d2KZPiddQS0ArwXDOUY6u6Fnguc/Ly//sENFtRuclW9tZloTaL+zZmLscQVzTCauClGFTgl82Y5MfeI=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SJ0PR04MB7407.namprd04.prod.outlook.com (2603:10b6:a03:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 09:43:30 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::f92a:6d40:fe94:34e9]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::f92a:6d40:fe94:34e9%7]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 09:43:29 +0000
To: Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
Thread-Index: AQHZxrgf6qH53kn8JkyhsDXhIB6WQw==
Date: Fri, 4 Aug 2023 09:43:29 +0000
Message-ID: <fafcfeosil5yqwn2wcdx33im2mq4xkejw6bx7h2in3ay5h6znj@facx4rrg4p65>
References: <20230523123521.67656-1-chao@kernel.org>
In-Reply-To: <20230523123521.67656-1-chao@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SJ0PR04MB7407:EE_
x-ms-office365-filtering-correlation-id: 42a68433-86f4-4c63-e86a-08db94cf4287
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BanmOEEJ+n0+4aZeZsOGol7RgXMwmQihw1xKNkhtvXn+UMXTMFbenhzij1KrtzIHHoMSVOe2JiOn+CUQUWISSiSaRiCRF+Q/JpkhiuPCkzSmaTVAPoQ8WOcVwl0O9uB/XgoeuoPn9C9wxXt5nydp59Q7cvjYpx+lP718kOyzoC1BleZEezH/daNeVs+yRoIXrtU7MWkIYBYuk6j7P0frNJMRfOOtVuFM6vc+UmUUtJVb6X69hthkbG7DorgzGmGKU5pNjAvHmCwlXgK9gsHMMNDqrnZhH0Dncg0tt/4vcZOqp8l0TNCy+Ph3CgvewvoDPp/9DBNaIxc4RvtQ3Q+kCDMbgOyB6qUSD9Q0H8eQoQCIsaxhDG9dCKCznitgQnufXdaTT75J+4fOEAcXdh7DnWPMuvOagzZmKA8kzBesEZJguJ51YN0rOT8QT4+rpK+/2ESXJP7zIwxTqkypllZ420o1dc+FaLP7m5IxujWoG5Wp1H2HvXOZDKKxtdYvV+mvr1wub0MUoiw17IIL2ZVmeM0a/zqJhxcNrWxYVrqWxbR362I3nQATuaRHWY4VkFF4LLFLfvbEKPTAuGPCxQk/yhuAhy84ZVpd7/3aBPIjXM8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(1800799003)(186006)(451199021)(8676002)(26005)(6506007)(83380400001)(4326008)(2906002)(66476007)(316002)(91956017)(76116006)(66946007)(5660300002)(6916009)(66446008)(64756008)(66556008)(44832011)(8936002)(41300700001)(966005)(71200400001)(6486002)(9686003)(6512007)(478600001)(54906003)(82960400001)(38100700002)(122000001)(33716001)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?djvawz61gVFzjEnnXl6JQ+8FTftpY3KIBtYOiJkDq4A9cBcI/fi4t/qgq7Dd?=
 =?us-ascii?Q?XlBkBdns7rexfAFLmY/Nv4KNsrU38cp8IjZXqiU59x8VgezJJ92BTL8hyYJu?=
 =?us-ascii?Q?P8w2w4mccLHXJK/cWTJ4dP+xlu71mZSeMzi94A8Lxg+v8f66diirtunbeIMg?=
 =?us-ascii?Q?wIZDzzjZUqdZEg7WM4SD2XMV1/rEuTSPHev5VLeo1iO+Gcqwkyk9vauW4/wh?=
 =?us-ascii?Q?bzfh9C1UZrOChp6ykP1Qv6GKCnqeHn2Kv/QFMGTB6cNb3EovtIYKrZKs8+i5?=
 =?us-ascii?Q?Qccz5zUu931vRh3aFYJ/XjZ+UlTHFmrS8Mpa3h+lbNnbDZUebYCA/ZK0wnKS?=
 =?us-ascii?Q?JLoTU/QsYZ6GuFCG8Is6YgbVejvO3reCyS20VKt78pQkmhc/pFKuPF9Bo6QF?=
 =?us-ascii?Q?2i0Kj2B2pfAdo19TvlUywMsixjCELNqCjUlatz+9gURBBYGhkFbgz8JWdvmx?=
 =?us-ascii?Q?olKv1YYdgDZG04Z2YRg980d28ftbbna7wONOuXAdSzGwLWKwacamEV8ws8+P?=
 =?us-ascii?Q?UDvaH5khOpmWvJjkowNX1Ok2e5IEr3BRdp84JIiP0nLXsObv9xCJ7nIp0hW9?=
 =?us-ascii?Q?0fTvYiu7W6By0+ZjteWJcnXx+znxMWEEhrBfW6VdH+sxJDNXCFf0uzWPcTE8?=
 =?us-ascii?Q?AyX/MxD5xGEEVPmXxZ5I5mKk/2z7b/BNhaFgQZ8lR5SMz4nL7lrCytIitmiB?=
 =?us-ascii?Q?012Zl6sxh7SVBD7vwQwXAI0LdDLFCfuME861kdTZEmPiPZYPXQpU1HuVqLcO?=
 =?us-ascii?Q?mjjAlaWko5Ok22wmgdKnG8w1wA6IBkBsOSHvjqeQPcP58G2tIELJibj4AWXk?=
 =?us-ascii?Q?e+JYGvkiJAwSsBpP1+krBp9bWVv7fhWk1UBQkrZ1zlzuCLzIZKk5aPWnbo6O?=
 =?us-ascii?Q?XbAdsM8FrLsQHVb/ywCQwgW0Q08pX6+B1HxUcq5UVuSXDbfW2t32TY1h0OD5?=
 =?us-ascii?Q?B4eOvf6S+f1tKEzBW8y0uiKPJfHnGN4dsS7cMu1Y0GB4dwD8Ymp1RgT+JxyB?=
 =?us-ascii?Q?lNXaruObXHzLNASUfMsfvpxvIfQOJSU9RTuFv5/0hEq5ltCu9flVzP1EPCsn?=
 =?us-ascii?Q?Tk0wl/kDtmOfV464h+g97q+yaINaDPoFiguTZGji3oNiZxhJGvoTpp+Fw+X8?=
 =?us-ascii?Q?Xa5UFcZfANwW1AcV1GBQLl5oZx06O/WWyEbhkRHs/93IqAy0+ehcBzGXShVb?=
 =?us-ascii?Q?YKfJOlgkMHCE25SzUhP0mBDx8Q8+45SHjqh/80De66bqEFzRnew0nqSyqPA9?=
 =?us-ascii?Q?lejF6enKJp2Y7IjH7SPRXQZNViRGo7Zhsg1aNwFgYEQNA4oED0cy/7ZvWvn6?=
 =?us-ascii?Q?jeHni3zh4c9JSOiBNylDnQkr63DvE+8Dml6oAyxspLZB5ogNLBDYk9lr99EC?=
 =?us-ascii?Q?wbBRZVk10dMbBVSagiEeWtOgEBQR2zuBISNsMDp/XtxaTlOM7sjcCTT0puZQ?=
 =?us-ascii?Q?v/yy7TeahXbaytyfyrSoghtlcODC457M+Mhs7VBnp8uG/s1ooeaq2+t/xR9+?=
 =?us-ascii?Q?mOkEnqlOZiYbHMvwLPLnj+/eNeOtIYUWnQSlivri8cL/fbMQX9TG0m/lUfwS?=
 =?us-ascii?Q?nctM+nzcZqsXvVXKNCC2mdv77Vbn7Xb8li33NMn+dzg/C67OtCg7RFUhhp9A?=
 =?us-ascii?Q?6blUv3O5Bs4ey2XSA0l4N1A=3D?=
Content-ID: <10056D781578164BBEDC84B92D0631DA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9EiGAfTzZaHV59PVS8ThxCCF4C8WHn/TPXZQGgalTX1wszYmLZebZV0Jll9mN6p53SsxmY47P1eBKJ2KoYw4YWyA3HzfrnSPOlL4FSzae1pMsH14F1BcZfDjeeSZgV8wABVYJftAQE8E8we//5JXT+h+YfZFyltQiGsemPyzlhVkxa/wYIfTNqqtg7zf+iyYKRTnlqVMlkX8O/uGdEtYeGACA/3WLHgFUZrNXs2zxNuhFeyqlX8J4TiUmKy4ItJ2ipq/JeWqVAOr211GF87auu5yL34wLX8W2RZZi5clYhB4dFin0vXrqA4jsh7TV4Uz+lMNl8a14olathJiQvkraWxxVODW700sLzLWyuKxFkc0HEpmYcLrLFtbwUtp2yUpJE2+tE+mksF8OD5G2sXLoxlUbw0M/iEXTH+el9AKjbsKa9E4D5q3izeeihqDCSSE5ZecIuFJZGPrdGSs5CIaqWb4Yz8WsGuP7lNeZWHO/vQ70elWhQk+YMOBWoURn0Hg/H/kY0pnHSfUM+fBt3GHFtOQxzatV4fdA0KSMmSeNQZOD5F2hc34gjDq1yt0WHjCtLfjtt/AqTv8+7UvHd2f7zYHLmKDCRbnHXaXVc+/jAoGInuQO1/feqQWyGUACcPqkq6jd6EOcY36VDpSBOPPi6vXpsLk5S7TgKtWmvcMl3Jort0VazI8yOJIYenaqnKHRE8eNf3emy0+C8JkxW7Zsn2KzaQl6th482Q6WHZ23OcmP2TdcxCMEjOfDHdT3avTc9WjCf+BgzrqCy4zNGAWEN71qeYoNY9pwU+u8aBad+6n1/QcF4KcXurVsjF5geUIbJooGQLHCulNjdIZN2t4WeblIUcmyxKzAYzFIN+Nk78=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a68433-86f4-4c63-e86a-08db94cf4287
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 09:43:29.8320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J14OrSV7rG0u5+7JM46BQCTqLAAZFsvMtCqCiehg8v6xGYI6m97TBhKMytDy4B4NPuor0hs3iGT4b518TiZsAwSy9BYiVYCmvxRkRacI4DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7407
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On May 23, 2023 / 20:35,
 Chao Yu wrote: > Use sbi->log_sectors_per_block
 to clean up below calculated one: > > unsigned int log_sectors_per_block
 = sbi->log_blocksize - SECTOR_SHIFT; Hello Chao, When I ran workloads on f2fs
 using v6.5-rcX with fixes [1][2] and a zoned block devices with 4kb logical
 block size, I observe mount failure as follows. When I revert this commit,
 the failure goes awa [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRrLN-0002mN-Sf
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On May 23, 2023 / 20:35, Chao Yu wrote:
> Use sbi->log_sectors_per_block to clean up below calculated one:
> 
> unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;

Hello Chao,

When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
devices with 4kb logical block size, I observe mount failure as follows. When
I revert this commit, the failure goes away.

[  167.781975][ T1555] F2FS-fs (dm-0): IO Block Size:        4 KB
[  167.890728][ T1555] F2FS-fs (dm-0): Found nat_bits in checkpoint
[  171.482588][ T1555] F2FS-fs (dm-0): Zone without valid block has non-zero write pointer. Reset the write pointer: wp[0x1300,0x8]
[  171.496000][ T1555] F2FS-fs (dm-0): (0) : Unaligned zone reset attempted (block 280000 + 80000)
[  171.505037][ T1555] F2FS-fs (dm-0): Discard zone failed:  (errno=-5)

The patch replaced "sbi->log_blocksize - SECTOR_SHIFT" with
"sbi->log_sectors_per_block". However, I think these two are not equal when the
device has 4k logical block size. The former uses Linux kernel sector size 512
byte. The latter use 512b sector size or 4kb sector size depending on the
device. mkfs.f2fs obtains logical block size via BLKSSZGET ioctl from the device
and reflects it to the value sbi->log_sector_size_per_block. This causes
unexpected write pointer calculations in check_zone_write_pointer(). This
resulted in unexpected zone reset and the mount failure.

I think this patch needs revert. What do you think?

[1] https://lkml.kernel.org/linux-f2fs-devel/20230711050101.GA19128@lst.de/
[2] https://lore.kernel.org/linux-f2fs-devel/20230804091556.2372567-1-shinichiro.kawasaki@wdc.com/

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
