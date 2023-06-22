Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC073A5D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 18:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCN0J-00017S-Ph;
	Thu, 22 Jun 2023 16:17:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qCN0H-00017L-PQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 16:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SUgRU4Lh+anYyhlpU8OjM7HlytBsIPlTH83+HRomeE=; b=BnvzWdFz1CVeyazsPp9LB0EY2P
 2/aLv3R7RKFvUtusd+dUukpH34bUffWOL6kPlpYRGWYbiLSjCr/nNqjFpcODYyjC4ngBcT9U+ie0u
 8LqjOPdZY9giYaDdBB/D/hXWJlWo4IZLpYYuSEnRTqoPTQbQ2nuL31+zIv1TgEhG8iAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3SUgRU4Lh+anYyhlpU8OjM7HlytBsIPlTH83+HRomeE=; b=CByrXmIkp3eONYS9V34N5g40DU
 +b8xW8R4TGBSqfGYxaKy4rq8+Gio/D3sFtgn7Y8/PFwbJFgTj/OV/dUxpHSa3Y93Wa+7znncjXCxg
 HdGz5Fr6xpuD2wwTxqeqNJ07/XWxOY7zOMlpQRtIGKbJ3os7uLogHI5L8f//yxyYfYXY=;
Received: from mail-tyzapc01on2074.outbound.protection.outlook.com
 ([40.107.117.74] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCN0A-0000Ii-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 16:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G762HZ/+Id5rxxfMLTugcntanCrNxIpER5uPcIb/5cZlG+N5wm9xwB7gABM/MtcpTcQmYm/uIyYXe2GU/iS2AwYHPGRpJ0VdYr/coJAm/pH5ovBZZfZJKfTrANVLiUFi1nznRBzly+4XjbdDiGTW1+lJmeczx5BMS9lO2NjZgPrQJN57QDhuB5YE0tGjkkNPjqS0Az/gLL16kQ4wKdsV0a+A1Eur5pkPaxqai1TMwI3zoo2gxgIOtObaEqA7afo2AJ3/pnqcZOXCPyiXxfhQgwxuV51waPjqlRvXrgWGwugGUIdeHL8+qOKKp+v3auVkT4gaVQpKafjnsoLNkOBQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SUgRU4Lh+anYyhlpU8OjM7HlytBsIPlTH83+HRomeE=;
 b=mv8Diu3JV/WPT6gdYxowAKpglssKt7pGSq6PCxIqDp4wvHdWVzg9cbHlLjrqfg9JzdR2ZHpgxLyTWthfur4SCCziu2GQWfNaUFkGoC/gFt+pB2Ss5uAftGBsRREgth5O3oMzbA90mMnqwKQ3GNQezGrKpwPR1JnYWDe6R5/fJr+LCfT6boUDhysuGWkFK8FTAku2bdJoZj1HiL2uQXrOBTwMD2HG7to3yCI2newsnlhkRvXBZ4bSTUyG5RZVZrF0tbFL/4uJ3OFZzJPyFixg/D/BQ7zzo/5NhiEasYEsMsx62/BNtB04F86/2Ap7v57Mw/OsEe6QrYWdofiRDAAbrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SUgRU4Lh+anYyhlpU8OjM7HlytBsIPlTH83+HRomeE=;
 b=tcYEI77D8qnqnsapdSNTebCZU1/JuJ0vf4Xa9CfVtPL2HTo+If4KFg9QiFNNwadR/R0yj8yPKbJkaX27ltulNNZAo8H+LLk6uOgXNt8gqlUpptRub/cmTUrSrgbjPU8+MHiDZNWCkBrZ8zmLS3XE1zTnGKoRUh3NKBStKSOLcJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 16:17:34 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 16:17:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 23 Jun 2023 00:16:47 +0800
Message-Id: <20230622161647.742012-2-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622161647.742012-1-heyunlei@oppo.com>
References: <20230622161647.742012-1-heyunlei@oppo.com>
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b25d98d-1dd3-41ea-acb8-08db733c2f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YjRuVNIbwUEhO5cbC1NuHcUuqeHE4woNXZT4umuyYUfuDIGk+RY5PV0hQnIECEfrRiSYqtrokGat+cf0qZ5Clh7LLeanfNfe2BXEqzNP2flmUR8wprGy0rhgC4v3eNhVpKGRD/I9MnlyisiWS6ZfdusimipcQnE0KMLC8/yKBCzluTFfmd/Ctn/e5KlktnDMp43gtOCKGbDxcofAFMzgVO3l+d/1jMk7ZwktS/h6/vW8p+2+l6+kWaqd03MyFW7Nruo2X3AlB43vISJk6CiJaMIowhMea+fRD9K8sCWI4YrZQfMd3BizNdUgVUtBF17puKimBJbVMraI2Qxb6XQSJ9PK726/oVlV+H/l5npZaXBp70P6Y6Mz/MySWzf5xr9WdgGLuxxTbtaRL1Xkeo0OmsjkAGcMCz1KkBsKXQZOe+1HVh2Cl6jFtmZCR+gkuSbme+WK8PAZD7lATitVGsgBFVcE2oYdURVrcBHtrMqDqi3UWvI4eRDW/qYDu7Wda0x3Pl7vxJ40Awppxf/ZicbFs6YwiMqdeQQB6BJ2nM6FKF3lXO0Z0ji9G1ty4ePXBWqOD1TXPObDc884Wmo2ZZb/0ilge7mpRKfv7zRdOeaGIyTYpe3flJpTl4YpXUhSKMEG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(5660300002)(478600001)(66476007)(66556008)(66946007)(52116002)(4326008)(6666004)(6486002)(316002)(36756003)(86362001)(2616005)(83380400001)(1076003)(26005)(6512007)(6506007)(186003)(38100700002)(107886003)(4744005)(8936002)(2906002)(8676002)(41300700001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkKgDOJOSAUwcdbUe7E7P5J8iWm4KCdyCtkqA/Ncb4XTeuGzqHOkoZl/PIhG?=
 =?us-ascii?Q?0XqoeQsHhvu3Lt1tiZAlxmikshemhQMeKTV2rmBEHbl54MggHiSZcAGdsmr0?=
 =?us-ascii?Q?mWg7k3WQaXDOuFoPtqlX2k4xkJ0VBADv6G1F7rnpIzQkZYyZ9LAGdWqkkINj?=
 =?us-ascii?Q?MvL2RTWgRdCfbhNhWOX21oSJO7AZoYewHba1CIHanqt586botp2lCoMDRdTB?=
 =?us-ascii?Q?QqQC2ym6jwzxzfeXnYZT7wSr4cFX3z7a4dUcy/sElYFp30PcLWGay/LonIQ7?=
 =?us-ascii?Q?xXt0A8JLN1w+H788hbLVsnAP9km+Ehz8kbn0MuTs2YyHQpdQ5nm8j/wesbom?=
 =?us-ascii?Q?rdSmvcBEtqDzofReZw9Fp6gqnFHcomXwqOcle1+4DRnuLeRFvQvxohMC6YLU?=
 =?us-ascii?Q?2ErH85sVS5wtJ3F+DxBvrrZGCo1ZuwRxkyS2z3jFLlb5yFNzK5emg5/qdK4B?=
 =?us-ascii?Q?My+o3zGjivO3PVs2q1V9EMyw+dhOKTXDMCbQ3uxDmBH0NFxPVb9iL9kXhpx3?=
 =?us-ascii?Q?qVozFuh+ZKOcuvt8GBSmEl+kOEqQzLzcjI5jCS/xo7y610b+ujtYARmCBipE?=
 =?us-ascii?Q?Z+8qB9hKnkSiGeoYT9JWpr+5xr8ZJUYtSD2yslqfovlRk6oIVwaAR1jckRw+?=
 =?us-ascii?Q?YF1vlMvkDBsCAaikA6ducF0zAVc+tbyqnugMeIoBFmbuwPdxOQqe0AqXk9FH?=
 =?us-ascii?Q?0M8sM4S55IBRiksAUZJQho5fM3Y4PJDB0Itk7VZjrTzhe0kC9m50udS73WqQ?=
 =?us-ascii?Q?u/f4oagdv8LKdIdbDvBY8A/guDjzliMkbOYZQtcNDVCBppzmKgWxTUqZhIEj?=
 =?us-ascii?Q?qOWSeM3nIO8W2pEF0PNH/YAuBJDaenhJLRgPOZXaCTC2M3R4OProFOVRIre1?=
 =?us-ascii?Q?jUKdF4Bkq6OaCO0dsKwOaiyqFP2pT4eqJYVgxWWuGXFArOauUqe0eHre9C13?=
 =?us-ascii?Q?27C8mddZJLpoqYC3+3l7Flh4tZ5K4m3XMN7pmXMOFTscAxXuE3Dw18Z3rD4t?=
 =?us-ascii?Q?+i3SADjGD5osRE1UyfKlcjsXQxmu/yXMAq5GckYHaWd2ODFzoHHFQi4h77k0?=
 =?us-ascii?Q?T2cuXW8SAydrxQc2+tGcZvdNp0atr6KCS1CR7w0jzJj+jf3E7FVcuaewTago?=
 =?us-ascii?Q?kR0/iCps22r2OVEhWYTgV95rD/voYqHQ7CapeWi1xd12TSeW72GYi0h2+GG1?=
 =?us-ascii?Q?ilNav7P2O5YW0wgRB7VSyp8v213Svwrgy6dT1xc0SrtI/u9aEMICEG5FjzLj?=
 =?us-ascii?Q?LdJaXv6wcFMH4mF/WWpaTYrHvefzwZAJktqLgFV0Sat1vcHhv1etWUXor89R?=
 =?us-ascii?Q?lCI301H6UM6m8xQCTZlxzsfsJtBejaQASzeFLKauQCF7zXRj4dJ4CvFuwVHc?=
 =?us-ascii?Q?rBNNQSjW8bMIORd364/BoOP8cmW8yyWoIjV482k7XTfu0Ba9z4AUTjxUypqP?=
 =?us-ascii?Q?tujHibW8D2x8+5jEpJB0hVmeEUGLnTRdgE45S6iDSCbrXXk8qWsGum2ukhMK?=
 =?us-ascii?Q?jyvjhe3qwNrnp6n33KrDyJ/jcfHp35YtesTWQeE03b4czmPL++P3stWBF7NR?=
 =?us-ascii?Q?CL/2bSbnXSiWkYF5pNjG/BymMncLFkP92yEfEeYV?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b25d98d-1dd3-41ea-acb8-08db733c2f66
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 16:17:33.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkIoWyPlhfTrHhdg9pQaPNBPSuWA4phTy0Pr3W2UJ7lWC+q2wtEl+xlZyzA0Jw1U8fY2C1CElipPgD7NyTd0Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If move file range success, it should remove old data from
 src and dst page cache. Signed-off-by: Yunlei He <heyunlei@oppo.com> ---
 fs/f2fs/file.c | 3 +++ 1 file changed,
 3 insertions(+) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index e59fc8faa035..4bece7c56656 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -2896, 6 +2896,
 9 @@ static int f2fs_move_file_range(struct file *file_i [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qCN0A-0000Ii-Ua
Subject: [f2fs-dev] [PATCH 2/2] f2fs: truncate pages if move file range
 success
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If move file range success, it should remove old data from
src and dst page cache.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e59fc8faa035..4bece7c56656 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2896,6 +2896,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			f2fs_mark_inode_dirty_sync(dst, false);
 		}
 
+		truncate_pagecache_range(src, pos_in, pos_in + len - 1);
+		truncate_pagecache_range(dst, pos_out, pos_out + len - 1);
+
 		f2fs_update_time(sbi, REQ_TIME);
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
