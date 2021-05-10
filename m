Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E875E37844A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 12:51:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg3VK-00013x-22; Mon, 10 May 2021 10:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=7576b64e4=shinichiro.kawasaki@wdc.com>)
 id 1lg3VG-00013G-4b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 10:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XXmPe+bRufqCKIAApWu5KRgoLE8x9p1TS/vo3bR1QNo=; b=TuV8025aWqx9+0ymnGgnZGNt9T
 IqSh1qNzRMhMxq6Z690+HqJmvRxwgRLRx1wkZQ1ztmo8eCkEKW57PurOrM7W5e+eI+4cYT6r1S6xy
 4Vggl57kEtzxGXjG9WQD+DkqMLVNK+Zm2v/2TEmK953ANOBjx6sImUgaWJFhbwCZx7ms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XXmPe+bRufqCKIAApWu5KRgoLE8x9p1TS/vo3bR1QNo=; b=l8+Z9/Lb1CeSYgEPR955DkSMTJ
 EtVZEl/deBatTbUqp1GxlcpNbvwPLJeRiv9d0NVY+MWtq9ue/+4N/2i85Ytt05mrk6ORVgnZ9+Uae
 ZHUXHJZODD/4EfJ+wWVzk/kZikrApDhl6R2aeyYNgz+hDbTMG6I0PEShOIYdgqWX8c50=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg3VA-001MU5-6J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 10:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620643864; x=1652179864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+hBiE4oJBQ9KCtSss16Hx9vpi+g3u4uR7ipH95ev+50=;
 b=nPY213mhwHYjt2oH2HYNxVA1eFJ3o6zGgmsaEoOmKoyIg86aeLXRRxsJ
 dZW54JY2CClTSKEXCY90ETWQd8nhWBP1uDDWg1a5BzyULP0FAZ6J5Ngtq
 d+v3bdSmA8Jeg/fYt6lWhYvkgZYj9cc1H6FOKqOVWmqdjzLZgOpSon/tj
 2i+6rj8xV7DpRKNq2jBAqbKSE9EqwFTk/dQZJsdVJhCMbjStM0ZCO9Btd
 47neybV+xO2Pl91A7Z0/T5EF0mY1sfhjbbqIqpuAj9Qq9yQIJb+xSQngD
 2fksePV0I8FRsmozujC8Troe4Am4TSYfGr98TI9mUahs11jX3qsadOKbc A==;
IronPort-SDR: rzZMmTSENS3nKyXS8zbwnXxq4LmLXEWae60tyogFdPA/n9HtGOgB3HZ6gJj1pPEmM66NuTyQZl
 n0JJPWjAnDVBn+nT/wUk2c3YTeNMgZj63N5zj2iHE+lgnGdCAn6DFxLY29CFka+fRiEog30084
 P+BSdr7FWsdWRHLWSl0qz+DOTQB42fBVQydNqsYT60FyG0JLu7ovsGsqRK4wmgSAwckvP2/5Za
 mpmnxLNmJcDIDhcidywoKqXosAbScByXzUs2FkAuXwuR/vQAKr7MjLbOlPhDoXY/S6vklT3FyL
 RrA=
X-IronPort-AV: E=Sophos;i="5.82,287,1613404800"; d="scan'208";a="168168837"
Received: from mail-bn1nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hgst.iphmx.com with ESMTP; 10 May 2021 18:35:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY9Seql6S3CuWmO0mwW/HAOOBnCfkburo75V8oSzvbt29FEkzuBG1lCtYNwiMhnA/oersmnmvcIXuTJ2jPUKag2f9snzHN+ll/mYMBJJYxRZW+pUGN4uhms+E0kqlMyGlMfNahEsRvSCuCfOHV8llqT98D6EdsnJqfuO/pj60p7X6UNhER6lxj/CK4MCJBAzOU9KDhi5leB/RP14YMBiv1uwFZ2ZSpT0jYj9M6hzBQWrqQOZK4ZESym8Me+2U2QRNyx67PuW5PttucdJM8wldmiqXKdOSjw4sp7pq7iViTWUflGRidd87o5WMtwWdz9WqfIFfba1zsfPhlJT8fTQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXmPe+bRufqCKIAApWu5KRgoLE8x9p1TS/vo3bR1QNo=;
 b=hNd3FJrjwQyroyqM63uCZnZyvIH002domHBOo0INF/r7LJURVxxtQyoxrBscTOy54b8T9ueNrvZNwJAr6VjaKyukJPbW7HlbkpL1n2GKRdN+vJapW5CqPlzzIi1Citk9+v+BO4AbfNMZxrvZ94NAXmsUsfr9BcmEMEVWTDz1Z4ddsFrDOMAXWwh9nHKJCGpUk3s2kIk8u+C2uEbHt0FGW9Ffg8UN27yO5ensJLAg0NRB4cYZc9rMI1HsiqDX0bfsM9Tjd4d/URCPS9V0T8qmla26xcJAndl9E4shaAdYm/oSz4uFzjuoh1ml4x+Bo27kZsirArBvRnYSubdB5l+GNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXmPe+bRufqCKIAApWu5KRgoLE8x9p1TS/vo3bR1QNo=;
 b=ltQxOVsJs31uBzLo8EiUCiCqN2oz4fk7twzM65JIILICiDnjNJKVw9fuSFTxqEOxD1+80cLLWOmwn3/HMMoS5vz8pbz+ub9U+6jZiZjkq5j9L1cwh6L2OTXLy+jC6r5gYz5v0TFawlnh0kbtO9xsYGpGLyoJGq1rT+eDvK9EGnc=
Received: from BYAPR04MB3800.namprd04.prod.outlook.com (2603:10b6:a02:ad::20)
 by BY5PR04MB6628.namprd04.prod.outlook.com (2603:10b6:a03:228::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 10:35:22 +0000
Received: from BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::6052:9dde:2486:109e]) by BYAPR04MB3800.namprd04.prod.outlook.com
 ([fe80::6052:9dde:2486:109e%5]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:35:22 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block devices
Thread-Index: AQHXRWdzDMxZE6LdfUmUVNLtlhDALKrcSmOAgAAco4CAAAS9AIAAGccA
Date: Mon, 10 May 2021 10:35:21 +0000
Message-ID: <20210510103520.ablivr2b3f3bz6c7@shindev.dhcp.fujisawa.hgst.com>
References: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
 <726b7f8d-bbad-f940-c06e-056103025a47@huawei.com>
 <20210510084607.ayajkbiyccsasl7q@shindev.dhcp.fujisawa.hgst.com>
 <7c26c024-1fdf-565f-53a3-b41b37c2009d@huawei.com>
In-Reply-To: <7c26c024-1fdf-565f-53a3-b41b37c2009d@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9b27deb-6959-433a-efd7-08d9139f507f
x-ms-traffictypediagnostic: BY5PR04MB6628:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6628EF4F158C7AD5628268E3ED549@BY5PR04MB6628.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zEu/QVd2TrAxmZcTjRr7BroancHCd4sCTgRS23h6hfgdQJIGD+zqyW0dnTLS1uMsW6CaGSDtd6MxWfGSmhUHbMbIa31dAwJwSlkcOCS+82ydlOVmfMDq/K20hYAfyHCerlAi+du9NcV1+UIpXb5OjyLZ3un+Y4QnZshV/DzmMVmXfY7zFtV2wmRB5W6Fu9pE0s4e38XSFY61l9pr79Xyoe9A4ojVbSXYJrFKV4GNXsEet86TJ49Dadvscp5WHMAZETIthKXe0biwuYuCXl1WAsArXOfdPzXDJ4LrDA8KpXm33SzHphKqUnp+QYKd5NqBDa62zg3igjbD/So8UcspURkRfwgL/xNWrCw6Zg96dTTW026C3IeQA8k8SSpem84xM8ME55L+5E5B6XsqB5BYxA0S7iYrMIkeME9Q2hF6y/p61LzoGhnxF5OBMaBML6F00ge5x9P04ak6hU2TuRoRDlBbFTuxmwbyLyxvzfkdnScUdvB4mFbJ4VWGWHEtfVnySyrCzL9M9Gc1Ei1seyXQjk82ixc77iGXqpLAJdZgEQLSxi5XXXirXdscGNdAkZUd5NLUpphDCZaWxrWQEDrqtMGH5L0gV25GRotHqG7aTD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB3800.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(66446008)(4326008)(5660300002)(66476007)(9686003)(66556008)(64756008)(8676002)(6512007)(71200400001)(66946007)(6916009)(76116006)(8936002)(316002)(54906003)(1076003)(91956017)(6486002)(44832011)(83380400001)(478600001)(53546011)(26005)(186003)(6506007)(38100700002)(122000001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VOYwnZu8k0QmwERlZEOIIIhdgkliXkOZEYkoHhIA2KUEVfXQS0eCM8In9FxW?=
 =?us-ascii?Q?DV38v7jbnxWiWCbkryFZQfO2eM9bTwwen1kufZSHeutEl7GbqUI2eEOpgEzL?=
 =?us-ascii?Q?1RJ54ySmQmsjvZ+09atumM0L0AjWnVrdtGkE02J0UugoE8Ujc0EM8VR1N9Dc?=
 =?us-ascii?Q?JgvEkC6jxpf5eyXXJGZVX7k3DxqAwiy+xoElb3zlAE6LAnES6NYBMVTIocVr?=
 =?us-ascii?Q?JsQwyDBYKH0jLKw6PEPKfdgLF2d2G61ZGgdxrUXKFt3ryk/xhBlDzv9SE8Y5?=
 =?us-ascii?Q?qk3qlVIYWMPjAGbsguZRl6YY+uvJxu9NPjP/vJAMxwfL91M4jv4ZQrc6XDRA?=
 =?us-ascii?Q?vUq2DhXbS+1S1lNsco7LG8XMtqIs8dVeZKFKBjc9ema0jLl/WqXU3O070U/w?=
 =?us-ascii?Q?9Ij6+KbwQDs/YGgtteF8CJFLWEmsyh6T5Ic88GLxFHmqgPGkX2rOURjXqQEV?=
 =?us-ascii?Q?hlZ/oe6JtI+sHDaqSLkJjMWB9a04Gxn5a5SL42cooXdoviFH/bKD6y7Sbmv5?=
 =?us-ascii?Q?v4K4KYYDwqwZGID9QpM+vtwc5v3qLs8z+lndQC8EIU4ukwWnzRE6e/+NM0n1?=
 =?us-ascii?Q?rmwm14NeFCJCUMK+sRa7aQKOr9zkrf4Ry3OUWCyEL3tjlDNCH92Lvllpaozs?=
 =?us-ascii?Q?Vse4rXOBiI5/w6BELn4r44fNluSiRd0/m2uSApayGUrv7TW75C6V36BBSHYF?=
 =?us-ascii?Q?LOUosKvUKKVhbW+Yqevhzyc8TbXo0lEUrL95rBhcEBK+DOWnKSlXyEXnKxA7?=
 =?us-ascii?Q?2TvS40Kyq9j831vpf5I/eoA1unGB38Mi1QRkMvpcJ3JYwTPR26U6qkpRJKdG?=
 =?us-ascii?Q?k1FBEvDhbEJKksfgfZWVYa88dVON1hLNOxjuJRvQdDrBjDT4V5SErLqVkThn?=
 =?us-ascii?Q?QCQFElQMtB6iQYDfwFoJsa7glHebMCmzvpI2ZiUAae2tvWOeK94BDXqDqgFc?=
 =?us-ascii?Q?EX4KzdpoPx3IyzOSsmXhjgkQzddzpYDHkhYHL9KJLTT3ch3ZfH2yO2M9qxhA?=
 =?us-ascii?Q?PGqWyWLgWzt77H4gTlszPDZ9XtkyfAoHV7emf83xDX9OszOM3Lh8Zk2e+DmA?=
 =?us-ascii?Q?P6h25Iwe5Z6iIzsPxJnSGb7hLAWEXlTT82kBt4dyaW2rt/VVkD0Cz2M1UlBc?=
 =?us-ascii?Q?erRjeWHbdVMlmfwjjD+G8p6qs59oEWz6Il0nXuP+1rOCNmo/Us9WLPN2+JKc?=
 =?us-ascii?Q?lyvM99q9G+yu/0Lk09GJvHBvG+dxx+B7iegjrLB2vL69vJl4QKgpyqMBp70O?=
 =?us-ascii?Q?NmfSfob/8TtmMxxkB8OoJxfLEDxd9QSGAK2xjluiaRVRAFAbFgt+pBTdiJM9?=
 =?us-ascii?Q?Vy9+Jebx8INa1WTQWZldHc83RUk03H8rc7UEMZ/hxlPsgQ=3D=3D?=
Content-ID: <1FCF0F23029D574B850C794366DBA2AF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB3800.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b27deb-6959-433a-efd7-08d9139f507f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 10:35:21.6358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ly6zA9RlQPl2DrmTrvdoZMvp26esBTL+dMMJlqpz+dLtilPQpzKDqe7hADXhbAWiADIqVE0SfqT+Lbr0LW0oml5MQvJZE035oemeXHM1N3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6628
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
X-Headers-End: 1lg3VA-001MU5-6J
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

On May 10, 2021 / 17:03, Chao Yu wrote:
> Hi Shinichiro,
> 
> On 2021/5/10 16:46, Shinichiro Kawasaki wrote:
> > On May 10, 2021 / 15:03, Chao Yu wrote:
> > > On 2021/5/10 14:40, Shin'ichiro Kawasaki wrote:
> > > > When f2fs is set up on zoned block devices, swap files on the file-
> > > > system causes unaligned write command errors. The kernel writes to the
> > > > swap files directly without the assistance of the filesystem then
> > > > it can not fulfill sequential write requirements of zoned block devices.
> > > > 
> > > > To avoid the errors, prevent swap file activation when the filesystem
> > > > enables block zoned device support.
> > > > 
> > > > Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
> > > > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > > > Cc: stable@vger.kernel.org # v5.4+
> > > > ---
> > > >    fs/f2fs/data.c | 6 ++++++
> > > >    1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > index 96f1a354f89f..51a832efd8cd 100644
> > > > --- a/fs/f2fs/data.c
> > > > +++ b/fs/f2fs/data.c
> > > > @@ -4050,6 +4050,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> > > >    	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> > > >    		return -EROFS;
> > > > +	if (f2fs_sb_has_blkzoned(F2FS_I_SB(inode))) {
> > > 
> > > Should be f2fs_lfs_mode()? because all LFS mode instances will suffer
> > > the same problem?
> > 
> > Hi Chao, thanks for the comment.
> > 
> > The problem this patch addresses is the unaligned write command error that
> > unique to zoned block devices. Non-zoned, regular block devices do not require
> > sequential write and do not report the error, even when kernel does
> > non-sequential write to the swap files.
> > 
> > My understanding is that LFS mode instances allow the non-sequential write to
> > swap files. At least, I was able to create a swap file with f2fs LFS mode on
> > a non-zoned device, and observed the swap file worked as swap without error.
> 
> Yes, it won't return any error because swap manager knew the L2P mapping info,
> and just read or write to LBA bypassing f2fs directly.
> 
> But, IMO, it (swap manager triggers IPU) breaks LFS mode's semantics which
> only allow sequential write.

Thanks for sharing your thoughts. I agree with your opinion above.

> 
> > 
> >      In this trial, I did not pin the swap file before swapon. Depending on the
> >      steps to prepare the swap file, the file map to blocks was unaligned to
> >      sections. When the file map was unaligned, swapon failed with message
> >      "Swapfile does not align to section". When the map was aligned, swapon
> >      succeeded. After that, swap file was in pinned status.
> 
> I guess pin feature conflicts with LFS mode...
> 
> So that I guess checking f2fs_lfs_mode() here will be more precious, right?

Okay, will post v2 with f2fs_lfs_mode().

-- 
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
