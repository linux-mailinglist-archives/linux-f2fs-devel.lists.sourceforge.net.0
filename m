Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75217249B49
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 12:58:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8LnG-0002a9-1g; Wed, 19 Aug 2020 10:58:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=4936ee857=shinichiro.kawasaki@wdc.com>)
 id 1k8LnE-0002Zk-D7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 10:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mxq8fycZEth7Fdo3PVuRa/3A4CEuiwBvMlRGJfDkN7A=; b=CU7Jx13Tb7HvVtt0BLGs27wdNu
 mV6ByeyrjKmzcgdHdE4my2S8uKc8I29J3MPff54+S7R7Ca2ADz2YNQkUW3kLHezymlOlfyD+o5Y0P
 Sr/RJFlHeQkinG5BHx/ntVPLqYwquJw7CwuonhDT2C1L1kcJkSGtj0GI+xulHaV3i2zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mxq8fycZEth7Fdo3PVuRa/3A4CEuiwBvMlRGJfDkN7A=; b=W9s4O5YKWnkTo/F0yt7U5ZRaC3
 8f+zgLGU+DPhn2LUe/wX9fyyXoHXOii7fXzyOCbKXoy5SjviLLYRFSj0BQqSACGkynOGncufM9yA6
 4Gah8tbM8PJMENCIhaAbndmEkYksEQXXrN8YODQ9Udz2a7Zh4lEjXQRC0X4zt01Yx6j8=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Ln9-00CJCj-22
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 10:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597834688; x=1629370688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NQRiTT9VW1gkKwNwV7jP2MoQARAM3Uj9BGOdTvCUg1g=;
 b=WB0lsbtmJoeS2lS06ZgSBkfPM9nubOPNU/XEyJrn+CaZGZ5Lyu8N/xn5
 WhiUUjBT3pqe4sZ/7B6LZLmvlsFpo/UeocUYmSy9wOQnX2kaLrcKBkehO
 fvEGSx5x6bF+EKxNRjLrB1FQ8uVaBIN80S+FelLMpAKweOHY9SdzO+ieE
 NWX3DMGNeZi6k2agKo9nNZtWkNgMS3aqaTt11XgrnjbeI6hWTcJqacnfo
 /krP1lp4FSUHoYI2NmrA72S36SipM/dFfCspgvET/9ppLHVSfPMM1OgVi
 3AF+3CaWlzBqcEoeJCWMfmXIfNTnrHNtwLhA9vj9ex9PTeZq/3Uw3DhG4 Q==;
IronPort-SDR: oe157wVrSdgnBrUZ/7sGjBODGHvH1J+C/GCeUIOJN/FcqoyhIQd/sypOhrl7Jo2M4jTYnvrRxI
 qqPR51gUI1lRy31eKfMnqTbwZCfUYs97Shh7ZyqygYx6gU0hQ5pnMuWahhxOuY9WbKgyus0O3o
 /qwCG5E82o6Uhq56lTrT0TEkeM+x3xBb4SXdYz6H+UudEWuE0jZ4t2XVHoHK6sSKEzCCsil2RT
 bdcdrIQ7TaH4QQ1YpHlDQlnhDRtXkw2o0a1jgcZDMXT018l2cog2S911YPi6bfWRypadPAOmNH
 B7Y=
X-IronPort-AV: E=Sophos;i="5.76,331,1592841600"; d="scan'208";a="248489933"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2020 18:57:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgzJE8XzxwPj2M6cePPdZ+gX8LrKch88C9knkQEs5+sCYd3uQOHdpcuEoS/EX4J1mQNEyZSFGMIKmdeYHlckQSPIOZq9tu8LXMU87t2zaCoKsEdD0zjMfudcvEsse59ukstUpSXF/xrfXMz7YLnliafJdU8u9xKgE7u1O9HOrVBR/k/oI1dOamHucx3G/Jj0RMKAsXaROMejwEQVwIDs9i1HpQnVP+Iyw415sfQPQvmLTDZLWyolDu+5m72HelKMTSiIPUVb8ACUTmdm/6AqKNyHA1Om9Ii6c8FHPnaEgkcl7ldupMRDcvpOlrBdcyhWaKVgd1/ccpMz4HVZVHkGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxq8fycZEth7Fdo3PVuRa/3A4CEuiwBvMlRGJfDkN7A=;
 b=mqLKMYLniFWsaa32QLyroS0bUmy1KNK7FsZfYvZeUtNncr4lKT89IC+HxPTjmvB6QfMSU4o/D05wN/u/RsSZVQVeUapGPhbgHUYPz2Wrp/VQpiC6NFBwFCwVR2VjprgxRknmLajiCLpqPcXgOONg/j9zG3mcBETn+JGIkB+p502AJTNNuF7Hoey1/mtl/1E+mN7tD2F+nQ9prj6dkGbEsjGNAbUJYntYr5QZ7xwXaynt5n89Mqubxg1B9TPoP1MNdc8w9FAl6TMk6MKIAzIzCvB/RbmUZCT38PcpQO/9QzGpj5ssAhNdsGRDAIonKMHEsZeK1499i5ZH717z7+h+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxq8fycZEth7Fdo3PVuRa/3A4CEuiwBvMlRGJfDkN7A=;
 b=XYTGcTD30R1Y2LapQD5f++6U6mew33pzyZ7J+uNMfUov0jcuIQTakp9HuwZBxB2Dju/41iOl+vF/gwyU9QSgtxG4ywU6YFhvhhFyZz9bibk+hfrOwmXv+kZnUIdyAU5qHOZ1SqHHz36Rv2nNsqr+kd+zxt3bz4vKrZPexoUCVN8=
Received: from BYAPR04MB3800.namprd04.prod.outlook.com (2603:10b6:a02:ad::20)
 by BYAPR04MB4309.namprd04.prod.outlook.com (2603:10b6:a02:fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 10:57:50 +0000
Received: from BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::418d:9e8f:c1e4:8291]) by BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::418d:9e8f:c1e4:8291%6]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 10:57:50 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH] f2fs: Fix type of section block count variables
Thread-Index: AQHWdcjvURDJJwzMDUGl6+VBoeAHjak/Q5QA
Date: Wed, 19 Aug 2020 10:57:50 +0000
Message-ID: <20200819105748.plywpksq3cgm3j24@shindev.dhcp.fujisawa.hgst.com>
References: <20200819013448.148302-1-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20200819013448.148302-1-shinichiro.kawasaki@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4400276-0979-4ebf-ce8d-08d8442eb6fc
x-ms-traffictypediagnostic: BYAPR04MB4309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB430953DD6DF83D20709DC971ED5D0@BYAPR04MB4309.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XQuAGZ9RYIVJcSaoXk3DqhMgFbdflNkwF4d3Qw5WarvUrAQYaXmRhpTCLqorwx4dq/BZtQ6fd2ahj11yXODTqlAv8tCetTHnQ5hWhg3EcCQ4d0AoC65GUGI5X9Cicr114SiuK0JOCu/Imijcha3WYDfWZIDQ1J0E5MRHIhLgD76of7+0oWUCV7d1D7gZ6CxPIGlxPAGS/cFM5SaWbT6KejJ41HA4P9THpSmG/dwcrZRm6hrhCUgAiIv+9DFIWBwS11CpJLbK4ASfX3HxVFPnDS8xX/Etirzsi8EpZEze1SLULeyW46IZ0Jok8pgQK+HsRpXkxjUv7RiBUXAvEFZOMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB3800.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(83380400001)(26005)(71200400001)(86362001)(4744005)(8936002)(1076003)(186003)(6512007)(9686003)(6506007)(44832011)(66946007)(66556008)(66476007)(76116006)(2906002)(4326008)(91956017)(64756008)(66446008)(316002)(478600001)(110136005)(8676002)(6486002)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: u7VCgv2uOyu+r87v4OIu9V6IqRYDu+TPCleLGJHs70oR+6OF1iy4jEjO4NzQuMKv0OVuKDy2Q8JyJhllOwzmER4lrb06tFf6/S84VmtUyLWRHR+2wDvlyRerZQ7Ul7uJ+I4vvOHqFqqUVCY6DLb+zdYVQt3QEzYOaZbVOdyz8YZsY7AddaqawZaDNV6kZytw60GNFqLKvUYIx+IFKgF4J/PfM/Cg7guNscIIaSt9M20+lP0pU4gqSnTVcDw17Xp6Aockb1LEw7p7Y0S83m8woMb56CznmVD/JvfHqd7kVmClFka5ofMpUzPHkXwgC/SBu/0GSiBsOt3iTccIgbrSurXiInAyO60Yz7ssk7Kv6VqHXX9jrJweTLwZHxQq1L/7D/I9FfKN9hipnSwnLIKDYlh+6nNHTGvQT8YO/KeUsI3Mp1sxJCuA8NQmGtX9Z4tNogPv4N4O3SQ/rFCttpo3qsJ7KIQPgaDjEmPss5gtiB+vKWnEwQfbg+iFgws2JQVAWUfqQfzGCj7cMzVF6v+Ub7c1jGMGR5YKiqV+nHKi/XOpiHGLgSfYzTGffHE52BfQTp54KC4Y1VssIeWg8rlG0fr7e0ioyZ/uKkFK8f4wD1EAhZ/GynwD5Ze8wbgCHOn9lQbCogQT/E8RAqf2Z5xblA==
Content-ID: <2629E62F4E84DA4B9493BAEF2369EB46@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB3800.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4400276-0979-4ebf-ce8d-08d8442eb6fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 10:57:50.1101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4g1lqPJXBf3EeOg02D0PX0sonH7f/CEnjMwunI/Uv5hRse12+GBiaXAr6WP+ZU5LKyi74reIDiaaFLRC7DXSWTgfJ9bOB8dmaPrsOoOUUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4309
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k8Ln9-00CJCj-22
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix type of section block count
 variables
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Aug 19, 2020 / 10:34, Shin'ichiro Kawasaki wrote:
> Commit da52f8ade40b ("f2fs: get the right gc victim section when section
> has several segments") added code to count blocks of each section using
> variables with type 'unsigned short', which has 2 bytes size in many
> systems. However, the counts can be larger than the 2 bytes range and
> type conversion results in wrong values. Especially when the f2fs
> sections have blocks as many as USHRT_MAX, the count is handled as zero.

I made a mistake in the commit message line above. Not 'USHRT_MAX' but
'UHSRT_MAX + 1' is the number to be zero after type cast to unsinged short.

Jaegeuk, if the patch is good enough for you to pick up, could you help to
edit the line as follows?

> sections have blocks as many as USHRT_MAX + 1, the count is handled as 0.
>                                          ^^^^                          ^

In case this patch needs update to v2, I will update the commit message.
Sorry about this confusion.

-- 
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
