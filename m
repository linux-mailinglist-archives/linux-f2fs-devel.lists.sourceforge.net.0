Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AD3AF6A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jun 2021 22:07:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvQCj-0007FW-9a; Mon, 21 Jun 2021 20:07:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=7999a36ce=Aravind.Ramesh@wdc.com>)
 id 1lvQAQ-0007BG-33
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 20:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEUD1Pu0Sgml8T8txiXrX1GcfB8jgftz/qmrHGIr6rM=; b=ULZ2l+tDC/pLUyozpjl+WcR74f
 p6GzpSDmW5smhFOVWlv+gd4CYjp7LLbIP27zkb2AC3Ye39shE+iGQ6Kdg142OkqcjSe9hSA/8n1oC
 465vYY6okAroomyICS+SfEAdc4UeEIAkIu0jNcDEMWJpc2NePQiWb5LVYUaaLrapFgMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YEUD1Pu0Sgml8T8txiXrX1GcfB8jgftz/qmrHGIr6rM=; b=ebB9vE3uqAsVR2e42NFg0qkyR8
 B9vcmVhTe0Sb3cKLqvz8cmX+ijNMDkysV0h/czWTCJDCGtRBo2m1F7+VaBCa9ENp5dPCevN0fWAZv
 0buhF9jfBJigaMYuWK2f5+uroksv/9wYgdthHJX0tFL9JomANsUNErgFoRjiwXdD/DpE=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvQA5-0001l9-6C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 20:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624305933; x=1655841933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JOnij7RgE7gRcMyShLxRxGR/OaJPYZ3HCfZx815IYaU=;
 b=pxVCuD4Zl5o4Z37sDl+I5rRbb8Rz76An59969gUKIZA9RIOvOBdlydbW
 TCWrp+5kSC9nYPSOfTPHlW3kwdV3FmsodtTfDcLqAJvSk+tNxXj2mlpng
 ZU9g/LRZGp6iFKdxjsGfQezZq264r2NsSnPUXI2SomnU1Z4Sdby44iwtu
 mvPJL0w+BSd6KO46T86zgJVsVmMrHMfggpuN4tclIE1/stVQfzou63leL
 zS34s1FKVk2OBNlVoVwyCqT8iQoWO7mHDJQlkXjVwKFeOWF+SQK/5Sbbv
 it2ZbPJOZqFbWlbu7HajAuXjPexYCwoKowh/kcd06TC77iixUwpnLBbnJ g==;
IronPort-SDR: wOS1E/uo/h3nZsNA1qTFeM6O3STBnOgqvq0CP6Gxuw5h/QtigVLabCoWNLCzsMSYSartGq89et
 bVsbiT1WoQ2vEbqaMVS6SjE5rtXk+TsgFgtS3vus2e5nyNqGS7VNetCB4i+7adHfX/UXkBiK1R
 FlxJwtfhq3AXP16hX9gy0Aqpre3GhbjA+DDBngfxNN1n2sig4h2AxlWHreuQ9Wk0yu7h2on1TQ
 F+2YesVEI487c5peyPtaR8W7ETZ2akyDSghVvGWvm+Ih2YCrWBRj/dVV3MbsXoVYINtvGlDL8D
 +Ew=
X-IronPort-AV: E=Sophos;i="5.83,289,1616428800"; d="scan'208";a="276302411"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2021 03:43:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaXTfUrq6+xOcNQAkFuX7dkIw9AOSmre1riOeUWJJpqJ0mLCxEEallpt150L/FmbAMlITbe7hQjS1RdgKuu4rjr8shB2qYL84xAP6amRCMatO654kcODLPqmqfn2PMys7kknJ46X3Bms7jMsCCNJg2Ycf5BszJaaR7puKNs8r7pl0co7NfKg2/lkrE6x/9c+zUlpOsFmeVKcVQef8YksKvxgCbSxbM/i6EunzXxGAe7WkYHZOgUV+6S0cGD0X8KWzOyBC//cUqa4M8Uc7B4E5ptTBi0gzMMUhxM/SxHBiF+L+B/psBs9WD0+wiGtIjISJano+xWO6CQLSinmabVMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEUD1Pu0Sgml8T8txiXrX1GcfB8jgftz/qmrHGIr6rM=;
 b=dJBS8Fc5z+8fvbGdqb5QR03MC7omekudHtM2VIv0eL0f4hEFWpzjEY4P72SUPe5L+tt42051xOlwakHTTfbKIKgbMatdgZI4UwiMULbO77X5iYGWUF09W3EbQ84Lt+fqH4R/oNnQgL+WTGMKgEh2ZHaKXGRqg8cP+kPdaj9zReQEK52VF2rjin+Z9CDT/1pm55YJSBbRkeZI8jUM/1hsYyel/UESAYqpPxUIeUzqLu72nVkXfiTx/GV77qW15ZbzCoZks4UphzcaWC41qn63duRl1Z4a3VlnXBN6SBU5WuFwtY2AbaO9xbjqiqZqlSZ1CG7tzegbK6hmhGnhcCJyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEUD1Pu0Sgml8T8txiXrX1GcfB8jgftz/qmrHGIr6rM=;
 b=PTRNbHJDy6DGYdfw05ypgTxXGrHv8E8DB+qXTva+emLjEfKNFfQsCMicLbsdyuxzBe+B9ZaBiR67nCMXbLjIO1DI6RSwHqElkVPWkndIVJxIdmVDtzwVmz757qzPvhSohN6cpSy1KlQJbmVHSZhU2mhy9nF6TInsoCp77QXRqw0=
Received: from BYAPR04MB4056.namprd04.prod.outlook.com (2603:10b6:a02:b4::22)
 by BYAPR04MB5814.namprd04.prod.outlook.com (2603:10b6:a03:111::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Mon, 21 Jun
 2021 19:43:42 +0000
Received: from BYAPR04MB4056.namprd04.prod.outlook.com
 ([fe80::fc71:bcb6:e18d:6973]) by BYAPR04MB4056.namprd04.prod.outlook.com
 ([fe80::fc71:bcb6:e18d:6973%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 19:43:42 +0000
From: Aravind Ramesh <Aravind.Ramesh@wdc.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
Thread-Index: AQHXYuWEBwnGsNzOBUCqy1RKV/gfXKsewbww
Date: Mon, 21 Jun 2021 19:43:42 +0000
Message-ID: <BYAPR04MB405637307829953851645A098C0A9@BYAPR04MB4056.namprd04.prod.outlook.com>
References: <20210616192558.1655258-1-aravind.ramesh@wdc.com>
In-Reply-To: <20210616192558.1655258-1-aravind.ramesh@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.184.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b17b49a2-d99c-4b6c-df01-08d934ecdfcf
x-ms-traffictypediagnostic: BYAPR04MB5814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5814FD09F9AE01562D3213818C0A9@BYAPR04MB5814.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aS/912/rbmawaKGxL3gYgD4RoYilelyznQ/oKmosRO+B6V57BoW/GEeupo2X14BoTzuyRRlBAS5fSbtf66VQdnQvVAJ18+5QpS1Hcex/psRF1LXnZD9aJwRmPUDIYulqmc4w6w/ozCXWNTZ3+Wb+QZzp8zZGOA/yeYYdfGVeKplFyQRWBs74AKf9phSBpYIeXJ4hjhRZatbVdMHRv6PUNlEKK8MvnxYJ0rffZ3G0hSfSPHiT8mU9Vp1HiBcvJhnCk59xXUr50uxZkHhArMWsMCn+beo8A0Cec1uwEhlOocvBrKxtPuWKGasxs6uC/eIWRyuRSsgxCvDKQIoTHG8Y7frbdHUBZ0VkJtM92cYiaKwQefMVTDparXVJNUtqViMq/Rx53XWVE9bFYR5La4FHPChfK+RES1g7MWpaby5NkLe51unVYDWzPMYtFguoHNeiT9BOBz32JyXrNlgj19EfL1DkH31dxgN1i1AaWwxCN//RHVsn2We5dbI2vZQZplaHxFWzxYbakpBWwy+X5u7TpN1E2Y1MfCKQzxaBUn/2bUV0+0jOwE5jKmv5sysd835Tva8g7x2W5E1PZ9eueBBA/wE+zY8SP9iTOy+HEjjv/Gw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4056.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(5660300002)(52536014)(6506007)(53546011)(9686003)(4326008)(7696005)(71200400001)(8676002)(8936002)(2906002)(6916009)(26005)(38100700002)(122000001)(83380400001)(86362001)(66946007)(66476007)(478600001)(54906003)(76116006)(66446008)(55016002)(64756008)(316002)(66556008)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ooTd4l0EpqgWMakZPiJNGujS5rS0Z+3wS8ZSUo1sTTT4o94wnjSMbGWCjZex?=
 =?us-ascii?Q?rXUTE4KcQX+6VwwcnJ6n9JASg74SWGzWRskLsC5CuE2mQoWtxMgqq+FJ5YQD?=
 =?us-ascii?Q?1k5BL9jxAfhXhV5srFSNVfFuQmPQnjNQlU/uJEw1lpQ2va7/3N+/6mdTdM32?=
 =?us-ascii?Q?gqr+aISVw0YPD5H2yqOZAQNUaqP6v6s6is2dmSbcGII6VjIbRE0ZhLINqWat?=
 =?us-ascii?Q?vH3BbSvFUzsUeGmribkmaUQLpveTJhPLGGtpIIGmzLMyFLsaIvnkDgF6icpT?=
 =?us-ascii?Q?zaQFQ02pvY+BErXfRBuFYeCjWSEwcnZWP5NIXMsws75qkHhtOSa34SzMhfdC?=
 =?us-ascii?Q?g9YW6ts1ymIXohknTJiYwcJQi/oVKKOQfeI+kIuvzpvIiXX8GdFoY4+PLM+s?=
 =?us-ascii?Q?v+dvuWjMtYlL10MmGp24oI1RaYQRx5145lwk9akFWQ5kNcECSS90K24xZDE7?=
 =?us-ascii?Q?qgEuFtfcjvVQIXXuQcIpqV38W3qWY8dalsEOfTpeQ8RyTwE84CF0AN5hhgZD?=
 =?us-ascii?Q?6DglyI98xLusjPmLxc4sBotI9Cve7K9z3SfaU6ePbOOLsoOiq2nWxGH9aZL+?=
 =?us-ascii?Q?VWIlfbTiLhUZK5BE5ded+xN0cSwzyBR94CkBPlxgOOvGlauLhyczhWvRi10+?=
 =?us-ascii?Q?8D7NUwrv5gNhE5SK78lWyMgFRzeKve9J4FFNI6AO/+8OKFFa9ecLl47Pg5WZ?=
 =?us-ascii?Q?xOSA5COL0RRUqv+XAGzRV2YnbTJoC3q5fvB+eMVTNDAVYRDv5e7p9gZ7oRUM?=
 =?us-ascii?Q?9/sUWXY4mbR94906lt6CgwW7uCcpXlwOXY18o5p8lHx4DnUFreT3q2SY39Dt?=
 =?us-ascii?Q?3k5zIQ9WSjSHdN12f4tR62CAcTOcRatrBweTuzx6OE1iZlADTA4ng7e/KdOj?=
 =?us-ascii?Q?mlp3jwg9rtS0pUU6ieyJ1BO8/nMFLw0odGRIFvsNaQEJjHayh2YuhTabnlHa?=
 =?us-ascii?Q?w5UFedGsFcd3ZtCw7mrne6qRzDAQ+eXBEdjaeC5kxUVumtnqq4upYGguUoe2?=
 =?us-ascii?Q?Q35B5KbDiAN8oT81TIAioml1ISeVSJ4mdgO+kXwydfnYfJ5dWpNPhv5Kmds5?=
 =?us-ascii?Q?tTBktPtluC7pgEHwVMZ9D8klNA0vktx3+5tR+rBuajft2eJOAqkb/DfxQ5GX?=
 =?us-ascii?Q?ll+34dgTpL6TQmVNZv2WK+efqO0xykIPtzJyR2AW8FNep1LKE6HuYlBRtIsq?=
 =?us-ascii?Q?EwgWwthn2fWaUd9Us4v8TzBWn3ejGPWdgWuL4yM5X0rzxa6ir9BVfv7GbzAy?=
 =?us-ascii?Q?m9Ac8oq+v2FYntKyRS+h+nzS2sb/oLv1C5kSYBTMLVUa9WJh4K2cljXgZ+xF?=
 =?us-ascii?Q?TmJbRHWZzYhrD1ybUyi1tbwX?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4056.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17b49a2-d99c-4b6c-df01-08d934ecdfcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 19:43:42.0764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdug+UsM2UYFicRDBAl3nSE1M84B+HcKk89vR0UFYj3e6GP6vmy5yrKKUjTDkyafPcESu3hw1p4aHf4XbjOmeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5814
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [68.232.143.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lvQA5-0001l9-6C
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Kim,

Could you please pull this ? 
I will send a v2 if any review comments are there, please let me know.

Thanks,
Aravind

> -----Original Message-----
> From: Aravind Ramesh <aravind.ramesh@wdc.com>
> Sent: Thursday, June 17, 2021 12:56 AM
> To: linux-f2fs-devel@lists.sourceforge.net
> Cc: jaegeuk@kernel.org; Aravind Ramesh <Aravind.Ramesh@wdc.com>
> Subject: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with zoned block
> device zones
> 
> For a volume using a zoned block device without conventional zones (e.g. a NVMe
> ZNS drive), a regular block device must be used to store metadata so that in-place
> metadata writes can be executed. The zoned block device cannot contain any
> metadata blocks requiring in-place update (e.g. bitmap blocks). When formatting a
> volume that contains host managed zoned block devices, make sure that the
> conventional device used to store metadata is large enough to avoid write errors.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> ---
>  mkfs/f2fs_format.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c index 3565bd3..2132852
> 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -440,6 +440,21 @@ static int f2fs_prepare_super_block(void)
>  					main_blkzone);
>  			return -1;
>  		}
> +		/*
> +		 * Check if conventional device has enough space
> +		 * to accommodate all metadata, zoned device should
> +		 * not overlap to metadata area.
> +		 */
> +		for (i = 1; i < c.ndevs; i++) {
> +			if (c.devices[i].zoned_model == F2FS_ZONED_HM &&
> +				c.devices[i].start_blkaddr < get_sb(main_blkaddr))
> {
> +				MSG(0, "\tError: Conventional device %s is too
> small,"
> +					" (%"PRIu64" MiB needed).\n",
> c.devices[0].path,
> +					(get_sb(main_blkaddr) -
> +					c.devices[i].start_blkaddr) >> 8);
> +				return -1;
> +			}
> +		}
>  	}
> 
>  	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
> --
> 2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
