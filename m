Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756DE10BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2019 06:10:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iN7yy-0003ej-0j; Wed, 23 Oct 2019 04:10:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=19241ea77=shinichiro.kawasaki@wdc.com>)
 id 1iN7yw-0003eb-Ui
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 04:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DtpGK2X1S7cOsqpmLK9PNuAmSiheUSZfneHPh9nxH0=; b=NH+CTgsk2Ya1a2FZbnEkqm0D24
 BRMbJNP0KA3mzQKTuB3oreSGPrdgpE9oBx1rH5DFCJInzRQHEz9jyRkA9AQRu6+YnWjSv6j9V+b0I
 SZGtVEvEpop8fiGAQv7n+OJ+/qkwy3Yb7LRBcSHxULN5H+4nnC6TC1Ob7u4+idTNVQmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+DtpGK2X1S7cOsqpmLK9PNuAmSiheUSZfneHPh9nxH0=; b=UmG0nmY9V1feONyCR9DT2MMPIz
 dwZpGzxdQi89gfI4eYKYgLMcQlYFVXgQ7XnLBSQ/XnjNRsDWSGHv8ID7JXv8LxWVgOhBx5zinCZ0b
 hKF705g0OnqUD1oiWQYYrYj316Dt+8/1kOQ0vCWkZcIXH0OHFqBJI3tasqgfesFPqE7g=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iN7yq-00HV9U-JB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 04:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571803841; x=1603339841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ksxm6Jk43zBm0iQzghAiQVqVRtxXfpdsmnZ8svBCGhc=;
 b=I316rMP3qt2RMGQdXHUuCu1cFnCW4YmRDvO/hasVGg/ry2Hi/vLWPJhA
 NGm3hx3INnejlShafeaiba1plP2Q20UUaqrnQfteeliFhSRFK6butZu/h
 kfjoyIftnyjjfnOY8SFGZLfxnC2VCTvTte5N8ub6IQrqX7T8NNGThHt5B
 oGk7ZnyrCXVowxxENOnQywJtPvxJGlieAW+MOA5CVRy8VkYEG9LFsHnfJ
 TcT9Rwzfaoa1qbQ69SMjhOmPhfvKiZqKHBQ7qXGW90AElC169LuQ8Uisx
 3p9ZCpmUG2fg1VQECjmQwKd7Yl64EkTi6kI83QVBxotmhxSqphOh7a2mn Q==;
IronPort-SDR: UX451AtLpn/9gsd9EKni+mhIVhn09JhNPQfHzqZ3brE5q3XmPd4aSp+mHGECss1tlSUUPz1Rbl
 JXIMWXOg7qw4Yd8/VlJRZKHIMy5NHC6u22aL+c8jSpWsxloXxz+XH6k58mJGwwZRM3YcBPNlIn
 7s4eOiySBZvwEFFMC+bfVzuB5lSGpfYioXpwTzQzl2yrilHaqU91uajeGtmUFDUKl4S96Y842F
 qCseJ1gWwxUj7fBXG6DpTyUxsltV/F0jsJb7ZVdkko0JibXU3jy7Wov4Dr3bbILiqzk1yCf5ak
 ov0=
X-IronPort-AV: E=Sophos;i="5.68,219,1569254400"; d="scan'208";a="121890465"
Received: from mail-dm3nam03lp2058.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.58])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2019 12:10:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCSRpYhOtH6W9lKmy2IpBRXdUuhO4o8NvIW9SrbDHk0XS+7KgNicwzDrUzYucN4ZenebPpF/t3TdH0YNNjLpKG5oDHT1UWf9U++ZrOhN8M/olFga2Yzfw5f6LW4HE3d8dUyJRJVHkj/sHjaK4Ta06Wnpo6kxo1uDF49aMkLnk9gGe7M37YA7aAkxT7U7O5LJzPmG8B72eBK8K+ro1QFxAqzGfRg3dwZ0jfpTgceyegiQirg6OpoRRT/eaUCuSymW1J1gK0D1ZF+y3g4pPoTmhmqlketl0NTGJP8YzK2WHOB6RqBIK//pbgeLRP7019rPNqX65dRhijUjdf2s5C6J/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DtpGK2X1S7cOsqpmLK9PNuAmSiheUSZfneHPh9nxH0=;
 b=MUHZWkJ6FUnCEWVswrd5oxo38hklMe9rKMG2JepSsk/43Zy6FnXfsZl6zuAHMDHT2OvxpD3xz7Wg1ZZD4AbUB7C0Mfrn6M9vu41X3wkH+KGBHB6m4N49E5LgRRS2/VqULE4teLfBTdOscG8PTyy0knNZ5uEdqQu/iyfeVio82hVE6mS4CjxEJ3MGLwo4Tk0XUGp5qUcI5sQqyMGZ/f+kfxdRECzBx33cCwstM3Dd3TsKan58y2OUh/xdVxaDyB75uGcqWnno0Tuzv6erdFekMqmYqHwSoD563gy8gfOs7u89q8ffwbmAlviPHmjO7j9kUm2DSRPh9Ce4/fCUgcw45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DtpGK2X1S7cOsqpmLK9PNuAmSiheUSZfneHPh9nxH0=;
 b=Gox+YQ73AAtWWraIeUGNwNmNlqDy9RLPj3Kh/4Avheb1VvMWlEpJwN8gXPPWE/tDqB4vw3nv+3GWIOL2ewmVWbykHEUMJbvqcrRgugSmYLJSk3xneZJwMvCL/lJcp20wNTkb+vSZTaYh+EIj5I1nf36JHyZFc2yg2zYktV107wg=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2315.namprd04.prod.outlook.com (10.167.17.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 04:10:27 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7%9]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 04:10:27 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v5 3/8] libf2fs_zoned: Introduce f2fs_reset_zone() helper
 function
Thread-Index: AQHVhX6RBrzr/U/GJUe2iQmUaWuWdqdmaewAgAE6roA=
Date: Wed, 23 Oct 2019 04:10:27 +0000
Message-ID: <20191023041025.pvk653egqgzeiccr@shindev.dhcp.fujisawa.hgst.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-4-shinichiro.kawasaki@wdc.com>
 <f83595f2-38b4-037e-1854-58dbb000be3a@huawei.com>
 <BYAPR04MB5816DA3BF24489E360E9E969E7680@BYAPR04MB5816.namprd04.prod.outlook.com>
 <44355087-2e78-2d26-3d8b-fd17be43c181@huawei.com>
In-Reply-To: <44355087-2e78-2d26-3d8b-fd17be43c181@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ca5bfe6-5b76-4827-3fe0-08d7576eefb2
x-ms-traffictypediagnostic: CY1PR04MB2315:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2315B67F5311183743FFF005ED6B0@CY1PR04MB2315.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(199004)(189003)(4326008)(99286004)(86362001)(6246003)(6916009)(486006)(476003)(44832011)(11346002)(446003)(6506007)(102836004)(76176011)(26005)(6116002)(53546011)(186003)(3846002)(71200400001)(8936002)(6436002)(71190400001)(6486002)(229853002)(7736002)(305945005)(8676002)(256004)(2906002)(81166006)(81156014)(9686003)(6512007)(14454004)(478600001)(25786009)(76116006)(54906003)(5660300002)(66066001)(66556008)(66476007)(64756008)(66446008)(66946007)(316002)(91956017)(1076003)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2315;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q3lLKCs5Rhla1V44imu2xUxBcdDFS44vtZn2r30D8a0iWz7KLRywnBRwQY2OnqDbvSgdhR181vooD58AAANA6+pd/mMvZwDDxCOW4MfnFv47tDdUJybY3ZMZuaAc2KVkagEwM+KRAm5MbnCUq+jNi5vneupqgUP7y3+pTP3Eg4F/ibkL0qaPpZD3lPog4cJ/LWU6yJUGvsm6VWZI4xVmhQwamtN/BFPS3a3yF4cTKfyaxj3/PtG2wCwiVVifFamPfNbLrurwSIORMo81q9V/zKOpg2LavlmcumcVio3BSgQFzzCiHkadruvOncrLGkVnQZbXButXFmDH3yrmwzWDtBemDk2vUO8PldxjkwIyTA8FE792TT3gEptqz6MXlFyfObYBzewb8VpuutEY90Yb4avJIh6new4vcqyJlJmMDzlzczRGd3tL+kH94+qp9QJl
Content-ID: <6FF14F0976FC4446A42F96E3688A6A9E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca5bfe6-5b76-4827-3fe0-08d7576eefb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 04:10:27.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XRvEGokxiW5hh/rvXaCLXVrHKKxKPFCqPzxRv8nVzeUDm9P1j6WTfFib0vv6w3KeqCRJUjQKPtlmQstlB2ax7594o7o3+z1xqXeh3sIFmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2315
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iN7yq-00HV9U-JB
Subject: Re: [f2fs-dev] [PATCH v5 3/8] libf2fs_zoned: Introduce
 f2fs_reset_zone() helper function
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Oct 22, 2019 / 17:24, Chao Yu wrote:
> On 2019/10/22 17:10, Damien Le Moal wrote:
> > On 2019/10/22 17:59, Chao Yu wrote:
> >> On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
> >>> To prepare for write pointer consistency fix by fsck, add
> >>> f2fs_reset_zone() helper function which calls RESET ZONE command. The
> >>> function is added to lib/libf2fs_zoned which gathers zoned block device
> >>> related functions.
> >>>
> >>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> >>> ---
> >>>  include/f2fs_fs.h   |  1 +
> >>>  lib/libf2fs_zoned.c | 26 ++++++++++++++++++++++++++
> >>>  2 files changed, 27 insertions(+)
> >>>
> >>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> >>> index 1f7ef05..a36927b 100644
> >>> --- a/include/f2fs_fs.h
> >>> +++ b/include/f2fs_fs.h
> >>> @@ -1303,6 +1303,7 @@ extern int f2fs_report_zone(int, u_int64_t, void *);
> >>>  typedef int (report_zones_cb_t)(int i, void *, void *);
> >>>  extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
> >>>  extern int f2fs_check_zones(int);
> >>> +int f2fs_reset_zone(int, void *);
> >>>  extern int f2fs_reset_zones(int);
> >>>  
> >>>  #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
> >>> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> >>> index 10d6d0b..1335038 100644
> >>> --- a/lib/libf2fs_zoned.c
> >>> +++ b/lib/libf2fs_zoned.c
> >>> @@ -388,6 +388,26 @@ out:
> >>>  	return ret;
> >>>  }
> >>>  
> >>> +int f2fs_reset_zone(int i, void *blkzone)
> >>> +{
> >>> +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
> >>> +	struct device_info *dev = c.devices + i;
> >>> +	struct blk_zone_range range;
> >>> +	int ret;
> >>> +
> >>> +	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
> >>> +		return 0;
> >>> +
> >>> +	/* Non empty sequential zone: reset */
> >>> +	range.sector = blk_zone_sector(blkz);
> >>> +	range.nr_sectors = blk_zone_length(blkz);
> >>> +	ret = ioctl(dev->fd, BLKRESETZONE, &range);
> >>> +	if (ret != 0)
> >>
> >> As you did in other zoned block device code, errno would be preferred as return
> >> value?

Yes, should return -errno. This made me think that it's the better to print
errno in ERR_MSG below. Will reflect these changes in the next version.

> >>
> >>> +		ERR_MSG("ioctl BLKRESETZONE failed\n");
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >>>  int f2fs_reset_zones(int j)
> >>>  {
> >>>  	struct device_info *dev = c.devices + j;
> >>> @@ -491,6 +511,12 @@ int f2fs_check_zones(int i)
> >>>  	return -1;
> >>>  }
> >>>  
> >>> +int f2fs_reset_zone(int i, void *blkzone)
> >>> +{
> >>> +	ERR_MSG("%d: Zoned block devices are not supported\n", i);
> >>
> >> Minor thing:
> >>
> >> "device is"?
> > 
> > 	ERR_MSG("%d: Unsupported zoned block device\n", i);
> > 
> > may be better.
> 
> Looks better.

Thanks. Will reflect in the next version. Same change will be applied to
1st and 2nd patches for f2fs_report_zones() and f2fs_report_zone().

> 
> > 
> > Note that we should never hit this anyway since the validity of the set
> > of devices used should have been checked way before we start resetting
> > zones.
> 
> Yup.
> 
> Thanks,
> 
> > 
> >>
> >>> +	return -1;
> >>> +}
> >>> +
> >>>  int f2fs_reset_zones(int i)
> >>>  {
> >>>  	ERR_MSG("%d: Zoned block devices are not supported\n", i);
> >>
> >> "device is"?
> > 
> > Same as above.

Not only f2fs_reset_zones() but also f2fs_check_zones() have the same
ERR_MSG string. I will replace the message string of these functions
with suggested one in this 3rd patch.

Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
