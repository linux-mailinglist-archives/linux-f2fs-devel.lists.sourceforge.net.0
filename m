Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6373A377EF4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 11:07:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1ss-00058w-C6; Mon, 10 May 2021 09:07:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=7576b64e4=shinichiro.kawasaki@wdc.com>)
 id 1lg1sq-00058p-ID
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sex0v1gsZvk8XOJyZ/Y/HxarOH0crtpNyYV+RjRYvuc=; b=VZ2s0hao1PegMB6dXR76U+5d5i
 3zpnBm4LU8ZnaLnbsAupJGxohJf1jmHh7VmNV/eG7S3jbSlROSr4D/Lon4+2O2rc1TG+4zFz8knR5
 odtNDxF61kbwLXuvk9Emetr9EWEpuzm1UyR74+8XDsgkyDru3AYSb6J9YMQ3xWgI75bE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sex0v1gsZvk8XOJyZ/Y/HxarOH0crtpNyYV+RjRYvuc=; b=IUS3NsgnJM4qlUalZq6YORyrUp
 tR8a39nTczzdPrpnxmTnk+Mhqeh5ELw9HX3upy/9FAddgYC1fiVPRtNXDlSoyBIj03IU+VtqlnPpZ
 /3TpUDARGeTn+1JJcmYQa5e6i1NlWxwCiVihvc/FdfAMQdBLQVj0w9OFYeC1fINj7GK0=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg1sj-0002Sm-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620637639; x=1652173639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BpyKod2PmcI92qLRIOlz4w9ZPJpY7CfJ6IHgZOtIDy0=;
 b=G4Bxe6lTaoIFOkn+i/k7MVSjSSbmDzvegfcQZSp5588c+4hU4x4/qIw2
 vlaOV56BZfNL+nMOnPjrACSaj2eqqBHwW0eKiECCR+40hyg04LTznXr9g
 OOvgLeAv1z1OSOO/lj5vMFQ/mlyyIdgVG+qbqFVxVhjQmiZJwx1asOeuR
 titkGsFnam0d8cOr12Wld4Ob/VAcJoMxhMugvLFA8KAXAliJ4jy+IT2I8
 vpGPRnUXOdAEqPxPJL8FE6umeN5g6t+xs4w9HzWkSgeEO0qduaWBMylgd
 BH5MFaB5fJxaeKcrYD1QjZa4VX7UeLaYMoPw0x+CkSj3wBSzpt13MbgYt A==;
IronPort-SDR: prbvfi7+CaoCIeSYzaxXE9j7Jdm7B9Lq3xLXbu8l6THaXFTHVERy3k7SG3KGkpiAD3YeZrRj2x
 m2D1j5RLUWCzlQleDXedlqrM7dNVgqWANro4k+5YqTdu8X6FD4I1FFfNCpweDufdXoALqW0WZA
 ZbADAnE7JDHVACw7PHGREidwcPUo1hQwlcbRwsst9bGsE21UZ9+mWRfmTiGVekVb7NZTJW000n
 ohQ9XHQAjEQ4guluIQ/4cwaGhzz1Mjs4pLY/7mH6wSvFZVkCnx3mYt1Corn4G4LZW/vUTmccbz
 dX0=
X-IronPort-AV: E=Sophos;i="5.82,287,1613404800"; d="scan'208";a="271604266"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hgst.iphmx.com with ESMTP; 10 May 2021 16:46:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+XujZx0S8zW704O4Qk+lGp4iOltYUoXg7dlETGjE6jSLsVNeH0SUnjh6A/aBpAWM1z81Lq0b7QQwTkRaL46mSCsQw7KEDHAZxQ0kWtGeN94RXQqfisDgf/r4mtf88BihTR++yR4nEhuc3TvY0VLVcdeAyUA/Vd5en7J75vcs7gmPsYPi71yDBSuvIK1ZlZNhDEDKtTohFJppoMP6KZywUsd3H98oj9Rw5LRczpzzcRhtvb16HSMHHgWeRdsms/yQdvZm+z9xGL59e5epnNTapPm2xQnlMYo9vIKuxcMmBto33N7MNqx7YWsrssktIzG9SP+sd+LtrdpBQnUdh4bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sex0v1gsZvk8XOJyZ/Y/HxarOH0crtpNyYV+RjRYvuc=;
 b=EM+YG4Wd54kKnuJEUt88cGCmN3qpi8v8q54IqPv2q/AccBD8l+C8l/rpln/3VvYIQNUDgUfitwfQmiR8W+jY/tmDgvseBwtu2xPZorZF8tJX8RJJHwcyh9QzIUKFhK5oUv1X8r7/evXEjVad6GKMLMtialkZTI7dkZi6Rk1s5noZsOoflxxXOWiXMzCzAwSD7wQP/MninkOwroFLl+TzK6vuzfqoQUlPJZfxFdgIbTsHW0OqJVW2XDa/Svie1qFdlCINFfY0CMqHhcnUzJ9YAOBM0Amcz0pMDT/TlngMNPIHtDY/hbq/2e4FhTqoLA9j24xg/CS4MZPuWwerW8BzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sex0v1gsZvk8XOJyZ/Y/HxarOH0crtpNyYV+RjRYvuc=;
 b=WH4Iuo6R5/Mu7dRfJA7I21zuLQEFlYNQbP3vaPe9wyPy5Da/QX6/4DL0jMuY4EJuEb0QEqAHA5lr5HCV2VyzmnMeYU+dUZqh4DAX5uhzqABOwBBxj48BiLieFUMDI2K5estF8VFkc2sIavBxtgaehH9ORZT358S+xRlWvQOYKrs=
Received: from BYAPR04MB3800.namprd04.prod.outlook.com (2603:10b6:a02:ad::20)
 by BYAPR04MB5605.namprd04.prod.outlook.com (2603:10b6:a03:112::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 08:46:09 +0000
Received: from BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::6052:9dde:2486:109e]) by BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::6052:9dde:2486:109e%5]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 08:46:09 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block devices
Thread-Index: AQHXRWdzDMxZE6LdfUmUVNLtlhDALKrcSmOAgAAco4A=
Date: Mon, 10 May 2021 08:46:08 +0000
Message-ID: <20210510084607.ayajkbiyccsasl7q@shindev.dhcp.fujisawa.hgst.com>
References: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
 <726b7f8d-bbad-f940-c06e-056103025a47@huawei.com>
In-Reply-To: <726b7f8d-bbad-f940-c06e-056103025a47@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c8a14e-e17e-4f37-e07b-08d913900ea0
x-ms-traffictypediagnostic: BYAPR04MB5605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB56056F1411699079CAEF66EBED549@BYAPR04MB5605.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P0ldEfHtnKeO9pvYOUA/cG489N50pHsactJEDnjiZ+9cW2HlCChgvSy+9ws1+9LFXc6EdUXy4AWQfDEJ3q91FLEn6WC3I3Xi+TKUw22iOzPJxklNhx33TQjQthOnjc6dtFRz8SeMV+MzkFvi3SagaeVE7TdgKPD5UqOembnFXQVdtR4UGJxMsyyNEiSTeorZ7aOti3LkBaw4yHnMe8yftl7FwwDTve2D66+b0JyaRS18AXCR2ScqLQmlyujt/tWEwI/1d7ryRiqi5kHbZ9IjwiNM2/X3UOB0nQ++boN6r/Nk4Bg1oYL0SxpetUjqFdKg+wspRsZ7XnBEwJnhQSnEvPnAQKVAPhbRz56M/l4k+oxVWmqMyl54s695Qd5SP8Z0lFDFwGi4/shfKGbphoXrWV97lVCVgP54+3kLTKlGWBa9E4iBQzNFmEJXpgilV7WHrsDwNRZWNaKIfQxrXhJq0OAmyLZZLcLZYU6/+3lX4sjvUMR+fQ3BUjWQlHK6PGUmrIG80W1U4WFXm3eEDiEgCHFx1gl/PvHRzoR3nTQn2kTqvT6+vH61g6Tmx/S6t0nKPa5k8djKP3qhloxCmzT2ww04GDO+oG09k+iMAeMkIHM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB3800.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(316002)(6512007)(8676002)(86362001)(6486002)(26005)(9686003)(83380400001)(122000001)(1076003)(38100700002)(66476007)(64756008)(53546011)(66556008)(186003)(2906002)(66446008)(5660300002)(76116006)(66946007)(8936002)(91956017)(478600001)(71200400001)(54906003)(6916009)(4326008)(6506007)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?13GlNRFhlwU0ZQn68/sl+rqFcG7Zu49TeAlwC5j8LuOT3aaDd5jFSaxVLRsY?=
 =?us-ascii?Q?RUrqxjTGuR1l2FpiMuPZzzMtVC4u6HAUdRZnwTkTgDA11oHEqxc/u2zMAZyL?=
 =?us-ascii?Q?E45O7VPp6XpcWQipD0p6e+3URewMbLYV4xfvJYgfh3ZDaHyW60aR9xIWIIil?=
 =?us-ascii?Q?ViVL3+dMnsZvC+33mBgh6CTmFZWC3aP9o6ZolNLNCuiiNChCdbWqTMpHdcJ2?=
 =?us-ascii?Q?dHGbFIgg9B5bWcihqJ/gMyLmaeuy+eupvQz4Z0hQPIobp6MV2CLzXMJ40nkF?=
 =?us-ascii?Q?jOnC7lGlHTspjIwcSXIDkL9oXJntHhXWTufJ2UwjD/Kzliu5YL9RDJAbjo/6?=
 =?us-ascii?Q?x3QW0w3n2zbLOBF9pm/1wQ3EeCqec2X121RXjORU34h6G1IzZtRsij2fiOpk?=
 =?us-ascii?Q?/NZIR1jo6jcI3pStM+D48igydmUWarMCy3Efyv1/MNez5Eg+yx6cWCUJhj4O?=
 =?us-ascii?Q?eGefa+PXuiNTfV8zUd+xk9SNVhncY52aL0EBiPEwF9Xt7VPznR85PVJ1F/Ci?=
 =?us-ascii?Q?oTvQBVcoPibcuydZkCdWlfjsglW1/CVbL6u2dtmiyC/veRw/jozMzjjPXAoz?=
 =?us-ascii?Q?no9Qw84ICOq052hatUvd/EFlTYnpaO8aWDCj2TuvCFzxLa7GNC1vZYUTqHPF?=
 =?us-ascii?Q?QDnvwEb1L9a8l0T8OSySiG7DN+tC/ZELIU8xnEtqyt2+P24PJ5dchJzDWBG4?=
 =?us-ascii?Q?ur2snxHcSat+/Yfan0ykYqntpvkfAyKRdozkt0o7T5xdeapgl67M4v4AYhaQ?=
 =?us-ascii?Q?fAN2stgIoQi2TEzx68ytE4O9o9DgzV3LdKILSoJ3bBDfHj5247sY46gZdArD?=
 =?us-ascii?Q?B+nb2s+BKRhOMg+Vmzni154tqBQO+eNsJN3JRSuBgM9vkqau5N8XDS9dXrsD?=
 =?us-ascii?Q?RfE6skVIlVbVdCKDcj32qzMMrGwBVprw4+MNkSCTxd/+EMPQjz89YKOL0dNH?=
 =?us-ascii?Q?UsDuRq9+n9f+8CD0wVJbaNumShWkMzmKSsCLzcaga8Ye2RoD1elBe5f3AJ37?=
 =?us-ascii?Q?b3soErEj9rVs3bOpNe+gb0jooDIK5CW/40KfsdLUq9XmX5hZZMzAQBjA4Pz0?=
 =?us-ascii?Q?hevreDcwcH7LJH00LhPq/7TRDHVuGcEZKUh1hq9YTfwALAJ6QjTa7r3dKY3N?=
 =?us-ascii?Q?r95QRACbguVmXdpEnYixmGE2WW3oapKjYv80UBll4fQDmJJ6KNlAhASuHOug?=
 =?us-ascii?Q?oBqDU9GhZoc1x3sxuqlmkCLz/ZfoADuzyIqI2yLD++99O6NOJT/T11CY2bTN?=
 =?us-ascii?Q?aueZF86/86mYhR27QbPgEL1iYPEMlnk7Wi2lBf1bGRgcWQP9GmDkHZOBLgAU?=
 =?us-ascii?Q?t2crFhWa+ladLDPHPLkX8wKc3yP5wW6IJqhZOZE+Qhwmyg=3D=3D?=
Content-ID: <ABF2EA5CCADC174B98124866FFE7F1FE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB3800.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c8a14e-e17e-4f37-e07b-08d913900ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 08:46:08.8999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KDlt9FfbWeUXkU6iBKU8zDJt9nH/TzXJXqjwWW2moM9cwyXirBVdsBXfsFKi7G9slgXeDtjNjQGitnROZC5boRprDB48sLEhSll5GiWDNwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5605
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lg1sj-0002Sm-Rd
Subject: Re: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block
 devices
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

On May 10, 2021 / 15:03, Chao Yu wrote:
> On 2021/5/10 14:40, Shin'ichiro Kawasaki wrote:
> > When f2fs is set up on zoned block devices, swap files on the file-
> > system causes unaligned write command errors. The kernel writes to the
> > swap files directly without the assistance of the filesystem then
> > it can not fulfill sequential write requirements of zoned block devices.
> > 
> > To avoid the errors, prevent swap file activation when the filesystem
> > enables block zoned device support.
> > 
> > Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
> > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > Cc: stable@vger.kernel.org # v5.4+
> > ---
> >   fs/f2fs/data.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 96f1a354f89f..51a832efd8cd 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -4050,6 +4050,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> >   	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> >   		return -EROFS;
> > +	if (f2fs_sb_has_blkzoned(F2FS_I_SB(inode))) {
> 
> Should be f2fs_lfs_mode()? because all LFS mode instances will suffer
> the same problem?

Hi Chao, thanks for the comment.

The problem this patch addresses is the unaligned write command error that
unique to zoned block devices. Non-zoned, regular block devices do not require
sequential write and do not report the error, even when kernel does
non-sequential write to the swap files.

My understanding is that LFS mode instances allow the non-sequential write to
swap files. At least, I was able to create a swap file with f2fs LFS mode on
a non-zoned device, and observed the swap file worked as swap without error.

    In this trial, I did not pin the swap file before swapon. Depending on the
    steps to prepare the swap file, the file map to blocks was unaligned to
    sections. When the file map was unaligned, swapon failed with message
    "Swapfile does not align to section". When the map was aligned, swapon
    succeeded. After that, swap file was in pinned status.

If such swap file usage with LFS mode is not expected, I will modify the patch
with f2fs_lfs_mode(). It will avoid the unaligned write command error also.

-- 
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
