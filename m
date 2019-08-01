Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162A7D36E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 04:56:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ht1Gu-0007yS-M1; Thu, 01 Aug 2019 02:56:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=109dec6c4=Damien.LeMoal@wdc.com>)
 id 1ht1Gs-0007yH-R7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 02:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jm/QhMzvJ+15YRbIuTIydMFT7RnZ200oaDGxfs1cPIw=; b=hif9Q3VSZBG31+mkBYrnbivall
 tfJ7DdgQECCApydmtsWiHqQ0hIylwxkllt+fyi/AWooyQgHsINRaEsb/OyEY9sR2Kt8TPGoTuEq9S
 rwMONXIg7AZiSonELEIwJqm4uJmeGePUPshMkk6pJMUpzrAP0rx1bhLCQhfAmc26XzDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jm/QhMzvJ+15YRbIuTIydMFT7RnZ200oaDGxfs1cPIw=; b=F
 tRiOg+rBeGGnpcP3dvgZcWlvBCkd0ikSL24bdQ88JD2fRY8TqSrZjk/zNBYHdoz65O5OqQw5itDTz
 qrauOwo7MPwUDgXkJz2kWSSwZjIrkF2kLzu6W9+C5sXDmMR12S+aGdut9lFQMkUtr1o1jitfI+GEY
 kdN+6ZprwdZ/fxRM=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ht1Gm-006S67-9U
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 02:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564628204; x=1596164204;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=JfVCByx2TmpDzwtm70Z7KoWEu+l3ZRcFdLiZqof088o=;
 b=aSPMQjlvbyjh7ZIsAIH1rWwcRtfk8VDVHWH43xiYG3jlIxB4s0LSxwu8
 Ogd7glC4FYbamjVyP4htrhA2feilBJHrNDlh53FfR8jPrHdanfEkprpxZ
 ccKOWWF+GJfU6aHAee4Yrm4OBYky2Oqz54CINp4jVvmKr5sIlwxWYLAhn
 36xhJ7hVs34nHL85CnzmKWAU5TGYycJ3FdF4prDUSLkTaDPLiw6WMJ9wC
 6mLmBrkdHwklYFTvJOsVX+1uUFa+N+fUIxS07YlRjzlcV4F1ZVz3OdibK
 Grhv5Qprz9GLwXPrYHntuuLKSkwqKIAV7RRiDXs40AxfM+0pRkHmXYd8S g==;
IronPort-SDR: QzGslIrYXnEmUqBjbgtdeWzud9By932ypbciK5o0ZCHOeJpGkHbZBgE2zQ+7XlE80bBWeLijAt
 yN0y/UBEcwno2SIUaOqM/nFnNz1Q656siIfVflbOL+DE2v6tD+zPe1MynYnuz3nL5pvDMzKcg3
 WEmnAy3Z8mcDiLzmcMMqosmMSdutxjKYM2EdMWraMmDFXablbspkL4tAO2XiC7xVH80qcV6Bz5
 lV2kKZ+doNlzVpsbUaZo3bYaSY8zg756ZeKDPIpYqeQej9JvwRlhcuvepbeI6OO3zl0sxI1QH/
 m50=
X-IronPort-AV: E=Sophos;i="5.64,332,1559491200"; d="scan'208";a="115657901"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
 by ob1.hgst.iphmx.com with ESMTP; 01 Aug 2019 10:56:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db2hE7mQy0CDF+B+0XGWSbGdblzqY5C58vzuhi5NFAzfhbtMjWcKN4a3mYYZ3ZnW0JcmyTYso0ykisw/NHRXbAyyy1zd/7vkvqf+Ozj5aZwOqnOS6DPtZnugMHZtfsedAo5pCexPppfJMUEFlGinfKHw3o/UK5ivufRYvDlcSG+QGc06v2Pkw1O0j4iLn3fE7y8yL62MRwT17JUuBy2HIHfi+Es6UHPvLBhXAqnnZko7SnWEj/cD7vx3Ci7B/f2Wzr+OqQkOMwL6h7EbPODdx8g/cLDpVO9lwt1O36HnHQKIRbohOe02QfmxHlolCRnditWAPzDo00E7fxfdXyDLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm/QhMzvJ+15YRbIuTIydMFT7RnZ200oaDGxfs1cPIw=;
 b=U7oZ8EKTCZOYeDl2s05cqHc+Tg7KH1iibWLQLx5Tur4uYsymZiulgxm5Kj7230akHUYHRMuD97/6isP0ZzK5tsQNoPyjMHAPiIGR+LIwU8m548sdCvHoFb5MinIoT5E/UzhuY0XHrpUXaAUIEOMdNc+ChEmpr/Jvh/3o0sSi3zOFjh19XFc0NLEOW+80nwDicGJz1yisNAV05gTsO0rJm81kbrr1cStspb09Z6Ymu8r842ygAA36z6z+Jbh/1P1hzZAMfUqQ75icvrK2VlfhPtVELa/a8kSv0H86V0PNgm3JHx/9ONEe8eROg3yDpatXURPr/nXDXpxKZWoUBhwTtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wdc.com;dmarc=pass action=none header.from=wdc.com;dkim=pass
 header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm/QhMzvJ+15YRbIuTIydMFT7RnZ200oaDGxfs1cPIw=;
 b=TH1bnNynsIynxWzdO6pqozlAZVwcq2clD+XMsc9V8NbyP5CpwKw86swp0Fpp1TsWTFLrN+GXZgBxpTNZxdhkWpVqqvtkuQZH9Ebtpje/rRk3vGbmhar7SPOUjkiNvxuTo2BjEQiOj4VtBUD2Mf4onxoow+oENga3ah7Y0lcg4oI=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB4502.namprd04.prod.outlook.com (52.135.238.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 1 Aug 2019 02:56:37 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 02:56:37 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [f2fs-tools][PATCH] Throw an error when zone device info not
 found
Thread-Index: AQHVSAghuBi/RFZAv065oA6TAAkkyw==
Date: Thu, 1 Aug 2019 02:56:37 +0000
Message-ID: <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190801012617.2472-1-f2fsnewbie@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad1bad6-b7fc-420d-e479-08d7162bded0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR04MB4502; 
x-ms-traffictypediagnostic: BYAPR04MB4502:
x-microsoft-antispam-prvs: <BYAPR04MB450224E5DC0C2B646199B379E7DE0@BYAPR04MB4502.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(189003)(199004)(186003)(99286004)(76176011)(229853002)(478600001)(26005)(476003)(256004)(14454004)(6436002)(54906003)(14444005)(8936002)(53936002)(33656002)(3846002)(71190400001)(52536014)(53546011)(71200400001)(305945005)(68736007)(6506007)(86362001)(446003)(64756008)(7696005)(486006)(66556008)(6116002)(7736002)(91956017)(25786009)(81166006)(8676002)(76116006)(81156014)(66446008)(66946007)(110136005)(4326008)(2906002)(102836004)(9686003)(2501003)(5660300002)(66476007)(66066001)(74316002)(6246003)(316002)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4502;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OyETQSXUrpGhb25KA/lEkBBq5K4YBHxq2KNx1PNbPrUd9v5FtrQ/y3b1Fi9co/oT05tcv6tF/UgBUSDXLUzhY7i7Obiu2jClL6oW44IH2gzNHJHWKu8o0GK6TKebNiolMQNsAR+RO1Xdl9fQBrV0eooorUSsZF2/EF9PnhoHYcOg/BX/0sxpB3ZFP2mvVNm7mGVVba0R0S1qzqM9Q2pi+41V7szOdfQ2PJ+QsiO6qyGJEML1E5SIWt1ZcfuuHzolE+ga/e6ScobYYeDLZHjN0Ue2yOVz4rIEEf8h+Xfem2ZAFAw8lKxjyN/A6LHg4VAvWxW51NQV6Voa6W+8hvInPBMlanbdBSdzcBuTH6f53bwPel/U7zaaMR14/mHzQdDPYZ9vv8R9nC0wKYdQ5nvn61wVfyL3uPud11/hFG68Lng=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad1bad6-b7fc-420d-e479-08d7162bded0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 02:56:37.2372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4502
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ht1Gm-006S67-9U
Subject: Re: [f2fs-dev] [f2fs-tools][PATCH] Throw an error when zone device
 info not found
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/08/01 10:26, Surbhi Palande wrote:
> From: Surbhi Palande <csurbhi@gmail.com>
> 
> When the -m option is specified to format a Zoned device,
> do not fall back to the non-zoned mode in case information
> about the device is not found.
> 
> Explicitly specify this error to the user.
> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> ---
>  lib/libf2fs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 6b5badf..2ea405e 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -16,6 +16,7 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <fcntl.h>
> +#include <libgen.h>
>  #ifdef HAVE_MNTENT_H
>  #include <mntent.h>
>  #endif
> @@ -1140,7 +1141,12 @@ int f2fs_get_device_info(void)
>  		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
>  		c.secs_per_zone = 1;
>  	} else {
> -		c.zoned_mode = 0;
> +		if(c.zoned_mode != 0) {
> +			MSG(0, "\n Error: %s is not zoned (-m option)", c.devices[0].path);

May be spell out "is not a zoned block device" to be clear ?

> +			MSG(1, "\n /sys/block/%s/queue/zoned not found \n",
> +					basename(c.devices[0].path));

If this file does not exist, then the kernel is simply too old. It does not
necessarily mean that the device is not a zoned block device. It simply mean
that the device type cannot be determined. And if "zoned" file exist and says
"none", this message would be confusing. So maybe remove it ?

> +			return -1;
> +		}
>  	}
>  
>  	c.segs_per_zone = c.segs_per_sec * c.secs_per_zone;
> 

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
