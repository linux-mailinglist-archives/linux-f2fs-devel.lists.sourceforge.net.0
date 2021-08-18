Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F03F00FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 11:53:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGIGI-0000fo-LV; Wed, 18 Aug 2021 09:53:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=857e170dd=Damien.LeMoal@wdc.com>)
 id 1mGIGH-0000fI-I2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 09:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzsAq8TZxZc1nFOXM4ySmLlFwqrhuAveaG1hUGP/yrE=; b=R9jqFVftOQfvaYtnKx/3pSRQff
 +4Cpm2vXUW1MDgQDH+GENAbnLyWprKUo+oNAEoWNvSqIxGZazM4LYcSAl9nznDuyJiJMbDCnrJZaZ
 04MewpPHp1/OqeETVGQOCAm5GiEPRSeMwJoDlepQRXHvxqTu4bqqQ04z9R+eJEk8Vt6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UzsAq8TZxZc1nFOXM4ySmLlFwqrhuAveaG1hUGP/yrE=; b=F
 flGDAoESerKhFgKvxRV/hykF7bL91vk5cqCBuvfMF76gmxn7ex65CruPYL61dSMaub52RlliYUyYe
 xvBhISO0jY/5Q0ccWrMQt/r4Vvrh/sbn+VZQtAke4YDi+Gf5i1Gh77/F6439iSxtWTdgujMRHyQed
 b9Jtas7dEPbwtOA0=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGIGB-0001JN-D9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 09:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1629280402; x=1660816402;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=qfIRmLLjnAoqtV5P/F/aSR0QMtHHOSSnogKsBVtiTYY=;
 b=ZnBZZnnAZgUZCybS+yqI+px5TZcUBA/sZarsS2wChP/60/y7x4YU6uGH
 4e9+0amlIKBsr+HN2AwXufgGikpX1QNEpzB5+WWeux4lVxD8ryMFbMSzO
 gHfZ32gFWMwyt9TMKZnh7N657GOyyeleFhkF7FF7+A2YLespP256iX3k7
 9RP3v2/XZauzsaR3NFpy1ccDkUHlBZqVKwaMmq2/mZxp2bCZN+Qj8xz/q
 zM8S2xFtEKLeCPokM0PfGTiPdVluZ/Gc0LoYjbJxl9fqa8NWO8jsGBf1K
 JpLG4YaqJugJt5trZiUEQmF9G7qeJJh251A6H2qVWKelGn7X6vvRAYaPr Q==;
X-IronPort-AV: E=Sophos;i="5.84,330,1620662400"; d="scan'208";a="177628215"
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hgst.iphmx.com with ESMTP; 18 Aug 2021 17:53:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCOPO6LcDsAyS9LNYvDusle69OjBOisY5OJbEV0fL5K21L2untW1n7CtbknYCYhyuHE6PoNrO47T3sFt9BUrwnK1lRtil7EAetpC/7VoarMHRwjMmypmuULa1ykOh7T5asokMa20nc9JlJkKbHhEO8cArkVAo7SdJlIifIaqBthhwTpr1UwP90EqfMl+NxYW3pD9HaNjZw/J0MTMdV9saffKJpysZcp3W3TXT3a4JUTLZ6JEaz/QNAQCZlCZ+A7GmsHtFK6IhHGWLafvt/aXRo0n+mnCjA4X631dUFgFooVCshX1iWuA1meTPT0rP78UD55tUCx11yz4HTgOaLPJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzsAq8TZxZc1nFOXM4ySmLlFwqrhuAveaG1hUGP/yrE=;
 b=IHfDDvjS3ofXrBy7OJkvuxnDaZYslLueNBJ65dqMvW5IhzbLX19pMTKzd37sdovLkYgLdJOP9grq2xoEyQQ5skbQakP5Q0FjAZA0HbKQGyzIaJ4sLZtHItI7Jrf9VJBLPY7oP9rIiFriVwjiYWL4g2c4FmIBWZsOjKgoi1I5xZ2hfra90Ltq3jnLwYnb+CWbFFp9+7MWD8d86ywfcpySMvLlHBToIPQfkHnrpY0l2Mes/f7Nr+JtD7BpEQ/b5xhZ27muHpAr2x1r7PNqQ2cq1QmYIzNjjMrpATgAzJWYDA9ldpa/K9GnVs9UJaJdT1XT6KY6xlrXQH96ERBOd/Mq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzsAq8TZxZc1nFOXM4ySmLlFwqrhuAveaG1hUGP/yrE=;
 b=K/80t+f2Frl94xMJv/+a4DE/nbWcDTIx7f0zl5IbCCeR1oOI4BPtDtTNEozAG4KkFKZ6hJwn1aE2ggbkvFN9qrOI7sxPgJV8hE3kDX2j25m6i7l9W9mbKWVmu20N36LihrauswLiTusKJGY11NeYQx1tt5YPuxUyjWhJmxeOcaQ=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5561.namprd04.prod.outlook.com (2603:10b6:5:12e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 09:53:09 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c%9]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 09:53:09 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Paolo Valente <paolo.valente@linaro.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 0/6] IO priority fixes and improvements
Thread-Index: AQHXjmIw1CLSs99bxUeB3ntO4vk/cw==
Date: Wed, 18 Aug 2021 09:53:09 +0000
Message-ID: <DM6PR04MB7081B903196654C3BB0656E6E7FF9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11abc060-3b9e-44cd-d432-08d9622dfc35
x-ms-traffictypediagnostic: DM6PR04MB5561:
x-microsoft-antispam-prvs: <DM6PR04MB55612C7033B342CBC5AEE506E7FF9@DM6PR04MB5561.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8J9ajsPxS0IyqDjez1+oK3h+fZKDjQL8Drx1FJG+gZzE6VfQ0NdwqBz0CFEbRLIRYWv0iioe7+uUU06vP9wcb7qzYhNJRqkDns5NQuzQs+TcDFuqvCU+O+8nR75YI2WBlmkw+OXL8tObnDi3ajrc7XZSGOvhhFEcLX58hCy0mMRaHkgaM540kgoPx4F92HvlFW3B+XeQDOMuGkGjzVCgi6r+AB7W3rXRVJLIv62yg7svpS1zSgPkxBoNnpEBCqukTPyBbobJow662O/CzjT9OndnMjZcK/b+Tf/BLTWfVKFhcfse1YMTmLI4eD2nwfa4KtRZ5zk8yC2/Nn37Ny0pagyKGavLkbxgxiu1EtNNHi6oPfMoFmQf1PUseXEmrPtuEiIDeEA4kGJn1UxCR2UjA1x5Tn9ERkisxVsGjbsdoSdzXzqWbL1jEGZI3L8mLaEdBrj5qyLkB0Mr+JPuo/2KZhKZ0SIGbpZ9PMaZ9FWLGb8zp/88Iw3UZ4xcyCuJIaODhQSKMBGNDmFZkW+syQ0dz/YcZL6/2iGYX9822cINqkfcs99LLlvDnLS3++A4ny+ene5j832TfAch0X/BJwaei6U9ztuBWGAmrZ/KevYyydKqzTkw6Qd5Aoa/USLjM9cuv1ArERiYxy3sdRqmbGofGT6ZFEQYcwJriZ5aI43/ExYR3klfL6QNPRYJlvcDkkvf9oEtq/sglQ7jrHFf7Orjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(33656002)(26005)(186003)(53546011)(86362001)(6506007)(71200400001)(316002)(122000001)(2906002)(7696005)(110136005)(478600001)(83380400001)(66476007)(9686003)(76116006)(91956017)(52536014)(5660300002)(66946007)(8936002)(8676002)(55016002)(38070700005)(64756008)(66556008)(66446008)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3oUjya4wg3HgrhTGtqoE9CgqiU4veHiIrUV0QaA4/tQD8/Bay7HxfAo49H5p?=
 =?us-ascii?Q?Y1OQXJL4PY+CoLed8wZwnpDOGWwZXp04JNqHHr2EkLkSXy2rSRJ1L3XKnU/L?=
 =?us-ascii?Q?t1dgc5lIounfTv5IFr0Ksh0wXKhinnE//MIfT5Lz2jqE6/Pdz0uMetPf6EzF?=
 =?us-ascii?Q?SvHzg7RDaSF+9Edwp1+HYgXI81U81T/3rV3Rl6/3zAcigDUCl8BTWSZ/rhVO?=
 =?us-ascii?Q?emHRlR/IaMlw0IIaEkaqtCb8QWBzY+MKlen53MLPr1wOfrvWulxyeH0CGyFn?=
 =?us-ascii?Q?ButOBcF+QPbalUiapwc6z4x4Z1yxe3/cgXc9sjY76i8tRuEW4sCHT8G6g13w?=
 =?us-ascii?Q?10XCd3f3tk4Jx0EGjoBJhtQbo2cFtXQIAKjFYErqcvbd0mB1wK3NVvOpmuYv?=
 =?us-ascii?Q?flmoU8nQnnii0laq8crQLq4QNQUCNEuO1GGzPzsp4KdYygZ040AkjlSjzSRw?=
 =?us-ascii?Q?dzvMGgpDXRfcqyfSTphQe/BAhhebz6lAnlB/oLsNjcahSBn+ohpo29YrDaU1?=
 =?us-ascii?Q?O2T53xVCj25zyHmj+/RCxAlWnqo2uoTvEeg1EQoT3s+D5MflZ5s41pIir1lP?=
 =?us-ascii?Q?ZoFFCMncb9B8tAYREqeYhy3wnOjGvH4NpobTDv7f1tE/uyIbIwff14zob7a+?=
 =?us-ascii?Q?rcuVgqGedN7/Mu4V4MFKMFnFkuNmNr1XzBbjmYW4Hs42y8zVQim1d8BNbXFX?=
 =?us-ascii?Q?FODiolExxaUOuquq/waXfK1K4wOl6oRErVKSdqgXlbJ6YJDOmznDV8UzuhRP?=
 =?us-ascii?Q?HPUjLWoDbcclfvo1/k7mnRtasFdGlE2qztp7qJEkYnQYnBXTQPRO9TgvdZVu?=
 =?us-ascii?Q?CVQTi1g6kNJ7HwzPeqctkOS8Qip2W94AZjB+CZv66CX6n6f6G4Q77m+ODUl+?=
 =?us-ascii?Q?WEDpnWzGwbZEI/z4z6c0zwMVuqIMORhGoXyUH17DXuzDytl8u2T6WykAnb01?=
 =?us-ascii?Q?ozkNzQlvMVQpDidLq1QwwUvDR4oj0ycuGHvFjQ66Umz2/GldK0PR4fcIRIlx?=
 =?us-ascii?Q?SS836nXs2UxFcEAq2QbhQhYXesPLwyPBh/T/SOzD8wmiIYSdPdW+6m+QqMme?=
 =?us-ascii?Q?yg5FiptHZoIiMF5SkFnUA02x9ztTM8dSjWb5xshH4P87CZwOWBJCTuXGO1/e?=
 =?us-ascii?Q?qVl1BuVdvItAmw4KBebRYGDhlWz/DT5S58ccAxoOPZKEnhSUetY5TA5OsipX?=
 =?us-ascii?Q?bN7soa7ov5E7y+/ss62CFNrPcBfEpfFMZ2wP7UBD/txKuaNADLnHlBnCoD6u?=
 =?us-ascii?Q?TQfnn2GRdqiCknoA0QacPGuLKobYh3NL8JPCaOO+lxmxvTF5uJOdbIrFKKZF?=
 =?us-ascii?Q?9cVO2cu+y8Qo4vRol4QRtNsOFAti5+0SO3pInsKwGpk/Mg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11abc060-3b9e-44cd-d432-08d9622dfc35
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 09:53:09.2877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7O8UN6j7DgPENxWNsZALMvhmOOlNM7VZnfTbyBVuLETvDL8T0LbPTZfO0j41jBmV8jPdG9WTx3F3/VoN2/LQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5561
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
X-Headers-End: 1mGIGB-0001JN-D9
Subject: Re: [f2fs-dev] [PATCH v4 0/6] IO priority fixes and improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/08/11 12:37, Damien Le Moal wrote:
> This series fixes problems with IO priority values handling and cleans
> up several macro names and code for clarity.

Jens,

Any comment on this ?

> 
> Changes from v3:
> * Split former patch 2 into patches 2, 3 and 4 to facilitate review and
>   have more descriptive commit titles.
> * In patch 5, keep IOPRIO_BE_NR as an alias for the new IOPRIO_NR_LEVELS
>   macro. Change this patch title and commit message accordingly.
> * In patch 6, define IOPRIO_BE_NORM as an alias of IOPRIO_NORM.
> 
> Changes from v2:
> * Fixed typo in a comment in patch 3
> * Added reviewed-by tags
> 
> Changes from v1:
> * Added patch 4 to unify the default priority value used in various
>   places.
> * Fixed patch 2 as suggested by Bart: remove extra parenthesis and move
>   ioprio_valid() from the uapi header to the kernel header.
> * In patch 2, add priority value masking.
> 
> Damien Le Moal (6):
>   block: bfq: fix bfq_set_next_ioprio_data()
>   block: improve ioprio class description comment
>   block: change ioprio_valid() to an inline function
>   block: fix IOPRIO_PRIO_CLASS() and IOPRIO_PRIO_VALUE() macros
>   block: Introduce IOPRIO_NR_LEVELS
>   block: fix default IO priority handling
> 
>  block/bfq-iosched.c          | 10 +++++-----
>  block/bfq-iosched.h          |  4 ++--
>  block/bfq-wf2q.c             |  6 +++---
>  block/ioprio.c               |  9 ++++-----
>  drivers/nvme/host/lightnvm.c |  2 +-
>  fs/f2fs/sysfs.c              |  2 +-
>  include/linux/ioprio.h       | 17 ++++++++++++++++-
>  include/uapi/linux/ioprio.h  | 34 ++++++++++++++++++++--------------
>  8 files changed, 52 insertions(+), 32 deletions(-)
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
