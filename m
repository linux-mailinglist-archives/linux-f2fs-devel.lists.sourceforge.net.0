Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088B3047A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 20:11:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Tkd-0001HQ-5A; Tue, 26 Jan 2021 19:11:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=653b9936d=Chaitanya.Kulkarni@wdc.com>)
 id 1l4Tkc-0001HJ-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qycwswdKEkfSrfBGHipxmgVrIyfCcU42WNDTcdPx4d0=; b=FoP05sCVLRx5OM3u60mossDcH9
 Vd7IM2PjX3oYt/IqL4tIT1hfLxNMweVZ68R+zzBDjgjdmPeRhMsNd6jLUEaISRiTDMdKaLkqWzCh5
 NlLiIJZgcR28+r9M937WemDcaBef3nTNKT83uZIeWp3JZr55iTA2FXgGmIGybT2wey6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qycwswdKEkfSrfBGHipxmgVrIyfCcU42WNDTcdPx4d0=; b=a
 aJQatxRI1jqepW4MlpodnSfib0h5fpE/yfGXdQYnAbP9BGilq98KLoW/fDFQK9zJn2CG96v7b5vox
 o3eHpiXmsjCu9j8Vh3Jd5jyqZoPJFjVIiFh2ZEwVQvoDyJpc3YSQmiuxt3g4tdCRZ89U+k1OZRv+e
 vgEByY6QbVIVm12A=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4TkT-007hRn-3I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611688293; x=1643224293;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=qycwswdKEkfSrfBGHipxmgVrIyfCcU42WNDTcdPx4d0=;
 b=nv381jdnD5PVXteNA1pnmlTphGQP4HlBwOcS3R1zIiv3MqMZ6+ZrmLSt
 1kLYJzvEKZoJOr3su9MDUNp8YrMm+RKCWI8qpdL9Q25vbaDq7RnmDRjCW
 XeJOwFuQQ3cvzff/dZdcINzxt6BVBAhyWmSLayM8y4rXHmc+J2viLQNEr
 I+Vz9MtvXbI7BAU25kYh81MpS1CVKCNtr26caYLjUdWAGtOOt+X4LlErX
 Cd/hm1eFyvrxgqxZ7C/PXryAI0FikELbpQKFPiK3YhxmGSDUmn33B7juq
 9Y1qeFEMOBNKQuSxzUTNe+DUpEgDVFAA9wT0qUpieZNaoi59KsW5hjRdM A==;
IronPort-SDR: 9HrUbYLhXi0toG9lWlwQ111gEyZxDJnP776ZlBI/cre4cQGC66/tHZrdY7ZvWcqdOjH+D5ze95
 TutGps+CGm7uVKGD0TBGMIxCHZaRwQ2282KRgGnO8QjYDXcobHE2JLuN3rLmPY26qVPY71dw2T
 xqwzF7u4UA970Aq9SJcl+hjCqMuKKB/HnPRXjP5saZOGBNz3yhO/SfEQcgeExO4Kb7r+E+ykAQ
 XGdNVbr1RVUUvi6jx8UTeQYFRxjs7dpADtExt4fiyOZFM46D3Ck3Dq5JvR6FXIld2yEROAKZYH
 dzQ=
X-IronPort-AV: E=Sophos;i="5.79,377,1602518400"; d="scan'208";a="159553899"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2021 03:11:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1UdTxzrjUs4pfZi48MQJ6Pv/CbpbAa+Wh3SZ8JXHI2+1zKEKiuTx5IPbv3T9//EIWegRwhHfZAsNwMlAQTtd0BObrY3Mt2kTbTDnoLPL1Wmqxzlm26Ueiep1q/ifZIQnF1ZeqzfTnZMlFBJa93hAz6h4sVhByHprsF4OlJqB5UQU7FZ2P1Ahh4IT4JJRv+5Dh1+92jPwigb69Bd+qZJQ6JYnUehfFJGftte3T6EwlmBRxpd+qvFib61c63GPJpyTtnvazAD4QgoofKSwlkSDUx427HlzrfrxalJcDEN39FeVwlwzkJ8s0sERWS0FSQx1cBpdkVGjt6xSbTsZw8q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qycwswdKEkfSrfBGHipxmgVrIyfCcU42WNDTcdPx4d0=;
 b=PkBkS+/ZzTepagg6yZMWS21S2ogWWy0E94Lx2s6Ie2VfFSM36aNDIl29Rh401i0vSCR0EDF1sAZpMrgqOkm/GTEF94yE28M6mKFLXWlXtdzBx159eiygch6xD76XxOkvxTkaIL+/IXsEjlbJD8wZ49eFGpLhuB4HbpNj4L9BekYX8ppcdbQ1BllchLKJch7K7+uZbaxKFv1W/TJDVTOrAUxKLRKQK/RiD+RetBOYqrRY+UWWrz2fOuvLRPY+WXWGGunQtsk02Vvqu7q7PFEkMLrQGBEv/ZXfm/JFcX5AI7G8JIH43KVn/fkT4YSOVh43a410o6a0KqTvfK7Mv6WI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qycwswdKEkfSrfBGHipxmgVrIyfCcU42WNDTcdPx4d0=;
 b=PrVh+41fYjjTea3vPDoMebpSZh/LOBX+Wy5D7i2YyXFwnEktcnu04SFNCPZgwromMFrPzERw99RGdu2i3N+UOCF33YF6Gnm289xkUWn7uihL6uhwqUolBOdp661zHcnM7MY+4INjSee6xVFJa4rizpquDOZIx8NDnbSCYPpAdfs=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by SJ0PR04MB7262.namprd04.prod.outlook.com (2603:10b6:a03:292::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 19:11:18 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3784.016; Tue, 26 Jan 2021
 19:11:18 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
 <song@kernel.org>
Thread-Topic: [PATCH 02/17] btrfs: use bio_kmalloc in __alloc_device
Thread-Index: AQHW8/R60f6RE8OXIUCkbvhVzCX0Mg==
Date: Tue, 26 Jan 2021 19:11:18 +0000
Message-ID: <BYAPR04MB4965808085867317CEDE615186BC9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:8802:270c:4b00:b091:5edc:1473:bf45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa00d4b4-9e05-4e1e-33e9-08d8c22e28dc
x-ms-traffictypediagnostic: SJ0PR04MB7262:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR04MB7262B19D21BE2A31F5E3BD6386BC9@SJ0PR04MB7262.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2KZA1/rEr/W1lpsd1PINRSs1f7HpMDml5NjuyzUcogKy1mCT3fgeDTpF1FIazWAF8MR+Yd77vp/F11XUtpv4hlThBYYPia3DmQ3A0TjfFC3J2cJF+KKjRN2E9Tm8nWK52cTa6a7EPO7VSVnqQErVZjbOGFbPuWeUnlVkO0SJ8CYaG1DNLb21CabGvBVe3IsaV5GSQZBROQTlzVK8iza7zdXyXqkCCeOOhHuJzC1eVj2COw1C25soX+k/CX4rzrvgMO0TE64hT07HISuBgQPH/h7MD8gwNSXWJ7OlYni5WZxKiT7usYVgJNc3IxG5cjHtnTy89noCKjl1EqsF6pmTZ5Ai2ujRbw1TrlyHA+3XFnf1FpT/Qr+35LLAPDF1bM0Slawui5uIfyO9Zso13TkCpa2row9Nceqzhaqd9NlOxz9evZLDBqSN+GmxWoIUcnmqJSKRI+ifYMag5l+7vv51aEg8h7xD36SCxPYGVJJx5LKFwkUvdDykR3BcdLZ0yU2uTuTITD8PlslERMvihzVByw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(558084003)(52536014)(186003)(33656002)(7696005)(8936002)(53546011)(6506007)(8676002)(110136005)(9686003)(316002)(64756008)(66556008)(5660300002)(55016002)(54906003)(66946007)(66476007)(66446008)(4326008)(76116006)(71200400001)(2906002)(7416002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?d4ptxX6mZEPBGIZsteWKaLZjzSo1m+Lq7aENEzkgzE+r+P9kNQHhSVi1ehRM?=
 =?us-ascii?Q?RMLcPq2hxicyKbHz+eg+N+ogzO9lhKeNRPhcPnLHWgdf7QfWGmIt2THZ8Fw3?=
 =?us-ascii?Q?6S78Vl8duyVcvcecfD5nQy4TwkCdlwFeoBVONhhsfO7sK1cG880KqU9UTi/G?=
 =?us-ascii?Q?oiatjNa4LLxdzYXulB5dVOrifgDo7omNXmOdISIK/wwGMWMzTUqBHftGHQqb?=
 =?us-ascii?Q?zk3qx5Mh8mXAqrXa3W6ZFVuGW9TBRzJvPG1iOXRKAnArShWTbqDFhSXG1hoy?=
 =?us-ascii?Q?WIZHCGn8KSyKiEZXkNVlSFKxV17kfwTXzKk7NNtP4gTf6U6n1zQS1dXSWkhn?=
 =?us-ascii?Q?Yl0iClvJsO+6dqGmA6WYOKm/u9Zp5OedUru6UgVMKWYARWer7jvh4kpjLfVT?=
 =?us-ascii?Q?jNNLn06mRoEVmZcG6rjqqf5+tpX7XpNEzc2yQ1+4R2gGH3p43HylRaDbOhl2?=
 =?us-ascii?Q?Lb19ODYgIlpXUbk0tgTZ8jN0J50YN1EVSazlk6hjdC673/LMlx/MSYgI21zQ?=
 =?us-ascii?Q?W/dvD6CTswOGwZ8vdTTq+/6F+plGhCuqfJobVaqyCjTVzpeWDWWvgb61/xTF?=
 =?us-ascii?Q?O7ZU72VgeL0o+xyrwiSDlGEayXnCsivG3sH21/Gy589h8UI08L646cL6A/T4?=
 =?us-ascii?Q?dHSPBbHgBX6fowOnMoN0YrgG87OzCbN4XxNm/ABh1QekfQ7l+9Zgjhe2mu5B?=
 =?us-ascii?Q?/e2goxVgjfFAILuB79AinYBOwGSf9KVTlLwwPlJTh+IdW6+8o7QzJREpaIgH?=
 =?us-ascii?Q?2IxE7UeVmoDOhw4GCxJR2Room/m20b+K15If9Brbnv5ETahJvVeT+4Fvga7k?=
 =?us-ascii?Q?kFle1+xQ9qSBL3qCsR844RUQv+fmwkDLQxBcWJjW/uqnci5ls5Y9sA/Pq3u6?=
 =?us-ascii?Q?Xe1bz6CLthQv1PiaZGp4jwHKU+riFE8/z6aGlKffeOiruP0v2pJapm00K23Z?=
 =?us-ascii?Q?DMBCjL327szzR5Nku5yRBJZ1p8HSqozCpp32w8zzQwbpSRNJMKboeugOafYn?=
 =?us-ascii?Q?iyDKdxmH4Eb1cuNL6Cf0b94NpxR2YdspdcERHuyLjyZzgoxcE/ENl5YsNLbp?=
 =?us-ascii?Q?7G9h33NyV4Lir4m0h2OvTVl+59AmQe/tvhNz5aOqgQurle+SKteGNpSyVNLz?=
 =?us-ascii?Q?hpWu2csTD3cO/KMFJSiB4RSVnIQ67Hb/Rg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa00d4b4-9e05-4e1e-33e9-08d8c22e28dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 19:11:18.1689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NW/d4FbXu1icGoh8C9XQmW4dRM0JEd+cBUzwUw/wAHLhcJ6XSs3gYponomIRJGMZ8CrpHOU6ygsZgtqzLCnAa5EXK3aXQckWIRUfscUiJ7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7262
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.154.45 listed in list.dnswl.org]
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l4TkT-007hRn-3I
Subject: Re: [f2fs-dev] [PATCH 02/17] btrfs: use bio_kmalloc in
 __alloc_device
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
Cc: Mike Snitzer <snitzer@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Coly Li <colyli@suse.de>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/26/21 7:04 AM, Christoph Hellwig wrote:
> Use bio_kmalloc instead of open coding it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
