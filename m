Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF365BEE8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jan 2023 12:29:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCfTn-0005C1-Lo;
	Tue, 03 Jan 2023 11:29:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yuwei.Guan@zeekrlife.com>) id 1pCfTm-0005Bn-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 11:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+hbJMZgro+yDnnS7dcLQezoUfN2iLWX2xhJgPFJ1+k=; b=YaVRNZFG5MoPVjvAdJAendU8jl
 3rMIvLm7mivDCkA1LEMezGaX8dVOPrfQ3ksdxPhaU+pYlJ5lSpG8hyEDbwWzuwnJK3bxRDCVupTqU
 INU2CRE2cWkBDFIiRfsGFDU2K1/blb6GaTSMDQL/4pkww+X3w9udzctsITObPLLyMS7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1+hbJMZgro+yDnnS7dcLQezoUfN2iLWX2xhJgPFJ1+k=; b=gBKFK6M7tVefgdj73qRNXhDmu2
 w5aTpmbkvn606LaT5ml5GgFBK0eE05oX3/LuvWYL474kDWOslXJviVx3TjB4JSpitapY9UqEX+6Gh
 YN1ocYRqdRHyTWvRV6jmFjUavvpRyaCQmSVSIyfRTXTG5+AI1p46oKwHkdr+V4voEMeY=;
Received: from mail-psaapc01on2093.outbound.protection.outlook.com
 ([40.107.255.93] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCfTd-0005vR-2n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 11:29:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REWzGkejoyY5gQ/86jAStmvLKPbz9cyClgLbLa72erZ68sz2VX8dX0rCGxstjAdqvzR2biBZdTeG3LQ49mdZX5LXiDIXOpfVO3UKuQmHdYl3uFHF9cKprvfu3gs5jRp9rVH4MXrELqT4eOSfQQmDvFH5BuYDIc34ZycXtsnlJ2uUc7QM9CY31Rw4y2VinVR4a0YPdDrMi8hZ3f8odFc7MH0Qkd8CNUpgX74NDNwXKzIxOCevcg110IEUezGzJWaeVjstAtKLlAaqEmcTfnOAHXKWpkUMCOMSCahWhvSzJh48pMcxnnHpeMjPmFYw+NkThr24wBgtTJALNY8RfF4Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+hbJMZgro+yDnnS7dcLQezoUfN2iLWX2xhJgPFJ1+k=;
 b=CmoAumzNg01Q7YzInYaJ5zHn63ks+MdhkwycjbQqSEPV/hAIYd/xqatoHXLQmgTehvWVjG9NwyuCvWc6UcXljtbLCsATfqABoQxoe3izanmevH0R1kT8Dn1ShQY4y3Lhj5+yVgaUKqgvfzyyt8c2bja5SJxBKKkHelko378IiVsSjrcPtjx+LybUjw18H4MUk7m9M/h/FUHWqJ9mZ8rrt3DVZbE4BFW+dUZVJoipyUyeOHXcA5KrMiislx9ufdiaAo/upvC/o9vtua6gsy8tFb4kAeSGOQFuuYu4o9OBToKFIWsgSwehWVfy+JbErEG9ZIW5lvjakFDUFPiqH9a/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 145.14.71.66) smtp.rcpttodomain=kernel.org smtp.mailfrom=zeekrlife.com;
 dmarc=bestguesspass action=none header.from=zeekrlife.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geely.onmicrosoft.com; 
 s=selector2-geely-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+hbJMZgro+yDnnS7dcLQezoUfN2iLWX2xhJgPFJ1+k=;
 b=Ej1dMEMZuSIo9MNIZeNdGA7gne3nN6HVrp2BoJHvEbKZUqnPtc6e3a4OIyyJmfvORctEZ0nFKTUZTPKAj7GrSEjDkKXqfs9eyXv4b5dL8kXLkfbh5uxvPufn3f3hsFmd1D0NUrWAReNtTh0ge66dFlVEnNGQ16bkSagVNYWUqJw=
Received: from TY2PR06CA0047.apcprd06.prod.outlook.com (2603:1096:404:2e::35)
 by SEZPR02MB5829.apcprd02.prod.outlook.com (2603:1096:101:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 11:28:53 +0000
Received: from TYZAPC01FT031.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:2e:cafe::c2) by TY2PR06CA0047.outlook.office365.com
 (2603:1096:404:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 11:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 145.14.71.66)
 smtp.mailfrom=zeekrlife.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=zeekrlife.com;
Received-SPF: Pass (protection.outlook.com: domain of zeekrlife.com designates
 145.14.71.66 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=145.14.71.66; helo=CN-BJI-EXP58.Geely.Auto; pr=C
Received: from CN-BJI-EXP58.Geely.Auto (145.14.71.66) by
 TYZAPC01FT031.mail.protection.outlook.com (10.118.152.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Tue, 3 Jan 2023 11:28:52 +0000
Received: from CN-BJI-EXP64.Geely.Auto (10.186.65.77) by
 CN-BJI-EXP58.Geely.Auto (10.186.65.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 Jan 2023 19:28:36 +0800
Received: from CN-BJI-EXP64.Geely.Auto ([::1]) by CN-BJI-EXP64.Geely.Auto
 ([fe80::98fc:ab7:7b38:dd47%8]) with mapi id 15.01.2176.014; Tue, 3 Jan 2023
 19:28:36 +0800
From: =?utf-8?B?566h546J5LyfKOerueWumCk=?= <Yuwei.Guan@zeekrlife.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v3] f2fs: deliver the accumulated 'issued' to
 __issue_discard_cmd_orderly() to meet the max_requests limit
Thread-Index: AQHZDtY1kK3k6y3j1EWxvg9ki6uGo65ttckAgB744bA=
Date: Tue, 3 Jan 2023 11:28:36 +0000
Message-ID: <e377b58f396741fe980556a25326a201@zeekrlife.com>
References: <20221213093419.134-1-Yuwei.Guan@zeekrlife.com>
 <ff5f1e9d-1f44-5a3b-4b76-d3cfa877b18b@kernel.org>
In-Reply-To: <ff5f1e9d-1f44-5a3b-4b76-d3cfa877b18b@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.186.26.32]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT031:EE_|SEZPR02MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: eec62e72-63d5-4868-9eb9-08daed7db175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ph4d8K1CzaMgxzAPT9R9KGtYMvksBfzo/HeLLsnqrZLrh58Xa8xwa4nL90m41P7IUrdKjcT/Nvwfq+/SVAtVjKHog2+Hakcn+oGMulY47actjgu7pEdYHiprNMsiw8lzMfIHUOGoJ+i4+/qfVZGekIMz+LGvvDPV//QmX8DSspPDqqsggN9RrJelhu5he4k210xdaj8p5ZNxBKqauQ/kU6/X+SB3czvt58N4iYcatP0XFjmOX9dmQO02clTJFdJtsbC+ryfus0KyAqe/rIqrSBwwkeQqDdFEgtUgCSulluOBT1uAsZgRffUZG3CmvAR9xLrD/6pY4k1O2y7R/98RiHJuaG5VYgftHeP4sSXqLvlwv/wKKjaTqYQRCmW9ZZIfF5wkbbWcIkSc05W6KuPuDTupYyLCrGlQeVT7C6xJeLgGvDvbBUEhzwScUV+CMa2eabwUKv31/0AUO47eJb0CAO3wPDtDA5Ll8ynOSpOl86X+D7w/QKEhtA+r7zfMR12sVyabnyHszdQY3oUHbVqgTyByOakBIngTnMaQdDNUTsQBi20Z5XKoOm7rriJ7SgObUgxW+t4TSbd54xmdU4KP5yo2pQDP4RK1nv/xfIM9yseVPHwXfQ0niU0YbSe2/3nWa24Ahbg3cnIktlroh2nEVr4vvenfRdZ9/PsUUtlWQC4+gBcyxR2UNd59HV7VHXWdFS8ACCvPx0yiKVGJYFkaVsrq15abRFAmaFDlf8MFvcjUJiFd1a/ZMvoOpFlAQmO5/v8P7Ftw3jHYB5U3FXMYJQ==
X-Forefront-Antispam-Report: CIP:145.14.71.66; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CN-BJI-EXP58.Geely.Auto; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(2616005)(36860700001)(336012)(47076005)(83380400001)(40480700001)(86362001)(40460700003)(82310400005)(356005)(81166007)(82740400003)(36756003)(85182001)(2906002)(70206006)(54906003)(110136005)(36906005)(41300700001)(70586007)(8676002)(8936002)(316002)(5660300002)(4326008)(108616005)(53546011)(26005)(186003)(24736004)(478600001)(22166006)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: Zeekrlife.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 11:28:52.2505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eec62e72-63d5-4868-9eb9-08daed7db175
X-MS-Exchange-CrossTenant-Id: 6af81d03-dafe-4d76-a257-3cc43cb0454f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6af81d03-dafe-4d76-a257-3cc43cb0454f; Ip=[145.14.71.66];
 Helo=[CN-BJI-EXP58.Geely.Auto]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5829
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > > On 2022/12/13 17:34, Yuwei Guan wrote: > > Any of the
 following scenarios will send more than the number of > > max_requests at
 a time, which will not meet the design of the > > max_requests lim [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.93 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.93 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pCfTd-0005vR-2n
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: deliver the accumulated 'issued' to
 __issue_discard_cmd_orderly() to meet the max_requests limit
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 
> 
> On 2022/12/13 17:34, Yuwei Guan wrote:
> > Any of the following scenarios will send more than the number of
> > max_requests at a time, which will not meet the design of the
> > max_requests limit.
> >
> > - Set max_ordered_discard larger than discard_granularity from userspace.
> > - It is a small size device, discard_granularity can be tuned to 1 in
> >    f2fs_tuning_parameters().
> >
> > We need to deliver the accumulated @issued to
> > __issue_discard_cmd_orderly() to meet the max_requests limit.
> >
> > BTW, convert the parameter type of @issued in __submit_discard_cmd().
> >
> > Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> > Cc: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> For the code part, it looks good to me.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
Hi Jeageuk,

Could you help to review this commit.

Thanks.
> Thanks,
> 
> > ---
> >   fs/f2fs/segment.c | 24 +++++++++++-------------
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > a9099a754dd2..5268938466f5 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1097,8 +1097,7 @@ static void __update_discard_tree_range(struct
> f2fs_sb_info *sbi,
> >   /* this function is copied from blkdev_issue_discard from block/blk-lib.c
> */
> >   static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >                                               struct discard_policy *dpolicy,
> > -                                             struct discard_cmd *dc,
> > -                                             unsigned int *issued)
> > +                                             struct discard_cmd *dc,
> > + int *issued)
> >   {
> >       struct block_device *bdev = dc->bdev;
> >       unsigned int max_discard_blocks = @@ -1379,8 +1378,8 @@ static
> > void __queue_discard_cmd(struct f2fs_sb_info *sbi,
> >       mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
> >   }
> >
> > -static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> > -                                     struct discard_policy *dpolicy)
> > +static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> > +                                     struct discard_policy *dpolicy,
> > +int *issued)
> >   {
> >       struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >       struct discard_cmd *prev_dc = NULL, *next_dc = NULL; @@ -1388,7
> > +1387,6 @@ static unsigned int __issue_discard_cmd_orderly(struct
> f2fs_sb_info *sbi,
> >       struct discard_cmd *dc;
> >       struct blk_plug plug;
> >       unsigned int pos = dcc->next_pos;
> > -     unsigned int issued = 0;
> >       bool io_interrupted = false;
> >
> >       mutex_lock(&dcc->cmd_lock);
> > @@ -1415,9 +1413,9 @@ static unsigned int
> __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> >               }
> >
> >               dcc->next_pos = dc->lstart + dc->len;
> > -             err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > +             err = __submit_discard_cmd(sbi, dpolicy, dc, issued);
> >
> > -             if (issued >= dpolicy->max_requests)
> > +             if (*issued >= dpolicy->max_requests)
> >                       break;
> >   next:
> >               node = rb_next(&dc->rb_node); @@ -1433,10 +1431,8 @@
> > static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info
> > *sbi,
> >
> >       mutex_unlock(&dcc->cmd_lock);
> >
> > -     if (!issued && io_interrupted)
> > -             issued = -1;
> > -
> > -     return issued;
> > +     if (!(*issued) && io_interrupted)
> > +             *issued = -1;
> >   }
> >   static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
> >                                       struct discard_policy *dpolicy);
> > @@ -1464,8 +1460,10 @@ static int __issue_discard_cmd(struct
> f2fs_sb_info *sbi,
> >               if (i + 1 < dpolicy->granularity)
> >                       break;
> >
> > -             if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
> > -                     return __issue_discard_cmd_orderly(sbi, dpolicy);
> > +             if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
> > +                     __issue_discard_cmd_orderly(sbi, dpolicy, &issued);
> > +                     return issued;
> > +             }
> >
> >               pend_list = &dcc->pend_list[i];
> >

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
