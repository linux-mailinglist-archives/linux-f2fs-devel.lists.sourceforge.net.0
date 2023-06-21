Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5F737F1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 11:44:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBuOA-0004Vv-8O;
	Wed, 21 Jun 2023 09:44:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBuO5-0004Vd-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61qsHPL9l+AXF2KqV6W2Ye3iAmr2tEYdR7s7KAdyGgY=; b=mh+BRas1cNJqpRr9NPIeWyKaF8
 6SYlrEymdDi3BQNsos6qMWFtisY1hKubL90VRMAfzxadlknWJd5Zne/UiD6ZXhBr5LJQyQqvFSzx1
 IMSU0FTpa78T2CuJ3pwCm1UV7LuSK0TrgrXLMg+H3CwfqKDqNw8CLgW2VPef/aZmsu3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61qsHPL9l+AXF2KqV6W2Ye3iAmr2tEYdR7s7KAdyGgY=; b=WMpySfTIQhyRRAh5oimevTiY/n
 wzKiImxPJUoQeqpc7JYxnXSAzXi6BknwZ/a5XZYO42fYxEGdqgWWPLt6EYZ0dL+GU0EQGbdy7iN2E
 B/5HjG+WvYzWbBJ3L0WElny1SvLGN2j6yxrKHHs3SogMmWQ36o8dmOvZxi69S/q6OAJY=;
Received: from mail-tyzapc01on2042.outbound.protection.outlook.com
 ([40.107.117.42] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBuO6-00AWmH-9f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpOOxGN8adkzPYlNfA/PlnZ7AO9/10uqnR7B4Uah8n34YJgBtFnlp6jh4xlNh10YT+jevzBCCUHLVDeErvuh7Dpm1zBNQjqltmKRPwbbk5TNZGbUR76v1A8/sLdzWOHOgjPBXVL+1CXnDTWQ6eGt2OiAflmzTDVtSNC3Iv6JxGJWNuGQ2dKfBzqzhzYGqb3hKLp32/AYgBRGGwEiewjtBTO0vYVlTnltVmRpoMOWOtlR2WwJLx+v1I1Nuuu+ikh/tNBCxeDDcnOShpgRdJIMyxENA8FEHlj3og2XBTBF3ILX8k1Htsn8mm2RHjTNgNv1T69y3b3T0RAO/pbjinL6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61qsHPL9l+AXF2KqV6W2Ye3iAmr2tEYdR7s7KAdyGgY=;
 b=e9fFW6VCGjOY8kJkG2lzIYVosMDyrROOhQTexMQFbfUDF/uHkRFD6nhNF8IkZ/b5NxEoD7BquAeoHQBO7AjAlDwNl5jhFt2hrCQrXrLPkGOEDWqfF+ZyQ2pPs8CA9VN8o/DiebXb3GJsJNQYFSFTAww0ovth8nYkaXVcsNyN9cM7RGm+RoC2HUTM2AwJ5Kknb9i5vQaWV7Z4rBPhbLdwt01+QT+9stz/kV4X/4O1MwZL66ysRUxr0m9jF+zJBcoM1OSm8MnBCku4KTlMX1QWn5+Fp+60cdM+zJRDjqL+Wryrl1LmMyKWs8h3WtJn0WKxWMb/Tbcho43gEXOWp3jm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61qsHPL9l+AXF2KqV6W2Ye3iAmr2tEYdR7s7KAdyGgY=;
 b=mO0P2XWFa6rwhebzwTnqP8letWnaC7ryyTRVX6Z+XqOq3S8njCizY9Z8vZ7kBS1PjvStEdzsVWsGjdUGXlr9PBB3MUPnydmBMoeGmI1p5FpuRx5lrqG+6yHOSq40kuP2mp0isc+89EVmN/i0LIQAbFE1qutAlJDquJ49rRIjhFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by TY0PR02MB5621.apcprd02.prod.outlook.com (2603:1096:400:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 09:44:15 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 09:44:15 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Jun 2023 17:43:59 +0800
Message-Id: <20230621094359.3827832-2-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621094359.3827832-1-heyunlei@oppo.com>
References: <20230621094359.3827832-1-heyunlei@oppo.com>
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|TY0PR02MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: e4481946-ce16-40af-8646-08db723c139e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elEWdIjebv8DKt3mhr8EMms/vvIf/8BrMm6nlKdXyxGGk5YMnSILEDcbCetdOIYVw81nNi07yHxsssK4epcS/XuLkJnJhgx/qzmGL/YLKSEdqexKw7CIMeoaHZUGcWm28EFn9Asg0cUl5ZmMChdRj2kxz3pI1egvCODcqa609+vlr6xkClY2ZjQaosbqNAHQFlh+pWcs08DE1LgmQxWs6643TovVhMFbn+NYDda2l/PiFQjDQmOhHYT7OXBituhRG94ctyR8lNsq5wmOOQFtARwBayoMlPOP4v7e46GzZoLgGZpOHcEwdnmuXmCcuMyKjZIvkgDD4r/vpdG9UoihhuwRZSAC8r83UsEWWMoYzsoHVqqyFazuix+eOQc7J2xn/x1swcKXnY0bBJrpmutPBeWhnUFqSfN66yG4lj19c4BVbaFgmIZumvaaI7SO60GVGh1z97YAwMjl100o3Kj12f4VZPRrWnE8TQ1sFKHPHya0W2FTPowvMx38ZjT3SAASV9Ep6IOtnvnynQN0l6IjBzbR2tqvwgEFDd6YIEVHoUi5dl42MTxEMYl8vu3uYkmwdOskeyfSm0DrgcTmMgaWzpsZ+oAgzF4AFJ2IGkT1dJn0aCsAeYMhcp4qKb+AYhhA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199021)(38350700002)(38100700002)(36756003)(86362001)(8676002)(66476007)(4326008)(66556008)(66946007)(316002)(41300700001)(26005)(1076003)(6486002)(107886003)(6512007)(6666004)(5660300002)(6506007)(8936002)(186003)(2616005)(2906002)(4744005)(478600001)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q/xOF+7Al0xrKJLbyqdi05RJYUvfUTJc2cKOXjWwI8k5xx64ozCH/7gnr2YI?=
 =?us-ascii?Q?AjhTVp5IlDY9I8AyT+GHkJVRx+ydWeI7ckHJYYgUkoCzFC38GWNeA03HZTxB?=
 =?us-ascii?Q?pKqQxdPMZ0ZE+z8d0kCI5SfTuLeLodNV0/ydWM1t439D80w1+8Fhpp8rW70g?=
 =?us-ascii?Q?QWFYCQbFy56zhaOSkYvhgd1u30kub87siIbvCrDtlsGPRT1iC4PA4GQwvfFv?=
 =?us-ascii?Q?BTJqyEAkK2Kt2Gf9UC9Xz3yZW+CTPaGUHYJinW8uAMGP3Cd8x4LzlEzC+e0l?=
 =?us-ascii?Q?DxbgGbz1Zd7PsY2zfmqr63PvzR5R8n30XCwBTrJXp4vNuFBaz1ZZ9pNv2lpr?=
 =?us-ascii?Q?8lAVJM2cmE6T+IjTWy0aKO8xqTm9Q7hdJKPAC8GM9vAO/WE81+olQf7oJHxO?=
 =?us-ascii?Q?Regy185H6Z3YZYFcj8thT+dYU6YWpI+kGo27cfGj19iFHLt9/L8tM4w3xIHF?=
 =?us-ascii?Q?duO4c4ltanHlS8jJs3spgfKfs5d2Hx80xo8T1PCkdxGnskovDXNNLf/MqHaV?=
 =?us-ascii?Q?pn5ow4iZ15Q0GTQ6hFMAiNGbolvbxUgRKiWpAH/zpebz51Rqvs3jzb3S+m6G?=
 =?us-ascii?Q?lpbMXlC/U6DbL6mTQurygpAHu9xnJXcye+TW6846DW3YUZZ99kB81GqUlsIj?=
 =?us-ascii?Q?XIUJmoF5wt9it/NIjNjAx32V5Hz56BnwhM/AVt1pQ1rWw4LFqWxU/59K6owq?=
 =?us-ascii?Q?ZZOfAT02oNQncwNGygOIfHgjI6yGzzR0CDHywC/MnRDBqIeViC22ekJnE6Wk?=
 =?us-ascii?Q?P4lEyP23CXu2BsnlGXju68rIv8RHKncYyKHJUSDmRSwbnHBtXit9YwfGN+kh?=
 =?us-ascii?Q?np1THafzSc/J/5wkM5oVweY5L+GwS0ImOx7YesHpKirWmrGRGGjqVqOOSW7l?=
 =?us-ascii?Q?GEK4527IPZFCTQuJDK1kww/ngZ5AM2ra/3gh6d9Twx8OxQ4krr2Mu6x3ZcTr?=
 =?us-ascii?Q?a8K8JKaa0OAY+I5+hNWlKWx7oGswQ8EuLWwFWHWqPmX2uRYWdS8BXsJ7l4fY?=
 =?us-ascii?Q?AlQry+Og+Zn2G0CJU7JLrFaOAOqVFbLS6RA5L8dWRImXi21yZEQdH0aT2n7E?=
 =?us-ascii?Q?R4jpZV42X47fsdX2IA2JXaBjUJoeSNgQjapDjH6w19DQGY+FhHEzRRVbg45b?=
 =?us-ascii?Q?5uMLGZM8uitJl25skX8/+n6+AK+wju1VFPlevynHcB/mHZscgXx13YSUfPzp?=
 =?us-ascii?Q?k6i1eUaaVLRL6gwzLl1Y+kSbjf4VTaXQ5jqIG4555Va5dR9NVQwEBzk9UAlH?=
 =?us-ascii?Q?oIaS+rm75YJE8DozgxYzycmADzImU6a7dQWCda769APtKdxfU+DdJkMKKIan?=
 =?us-ascii?Q?Ol/KPs8Dc427tjASO1FFJkCfhWo6nZEWUjrGokq/fPpKlvMVWEfTkovu0S1a?=
 =?us-ascii?Q?/1G1K3GrSQkjDfY/4mS/fSTYMA4afbsaXv0h8cICYdcIlHeUxa+TUEU0FOGZ?=
 =?us-ascii?Q?mWsoGn8psnUeOY5neRCGzJF5/z/nc8uWxO3YQGKHKDhle35B2w7Kd7T8Q3re?=
 =?us-ascii?Q?Wlygd1eJKu28n7ZsnARyNbilHGhKIda/X42XiezvGu6x7oNp+0bVf1J5TG+F?=
 =?us-ascii?Q?rTRxyeh/brtcXX1T84IhnRXwpAYhy09XtNr87vl8?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4481946-ce16-40af-8646-08db723c139e
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:44:15.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Lis4yQ9ZKKiyfoFLeKc9pe0Nl5DYhGRn5LHrR/hFXL1FA4FpXEQ7CglP+30gsEqJIBOef6REJ8wdti3EgB1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5621
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If move file range success, it should remove old data from
 src and dst page cache. Signed-off-by: Yunlei He <heyunlei@oppo.com> ---
 fs/f2fs/file.c | 3 +++ 1 file changed,
 3 insertions(+) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index 4adcf62e2665..25ef36f2376a 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -2897, 6 +2897,
 9 @@ static int f2fs_move_file_range(struct file *file_i [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBuO6-00AWmH-9f
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
index 4adcf62e2665..25ef36f2376a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2897,6 +2897,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			f2fs_mark_inode_dirty_sync(dst, false);
 		}
 
+		truncate_pagecache_range(src, pos_in, pos_in + len - 1);
+		truncate_pagecache_range(dst, pos_out, pos_out + len - 1);
+
 		f2fs_update_time(F2FS_I_SB(src), REQ_TIME);
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
