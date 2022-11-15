Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF01629E61
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 17:03:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouyPS-0003IW-Ta;
	Tue, 15 Nov 2022 16:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ouyPR-0003IQ-Fw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 16:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4d3B/PGtTQYXHQ7OKboe22V9b3Gf8sq3dbcehpWreHY=; b=ZArbF6sqsE6HxOsucW+6VP4vN1
 q2aWQjg9JFdGn+PVP1OLFR3kEcKnrMgAMmxiz0G4xraBW6L0jJGDyP0/cpDcQqPXa3IB0XQFlJv5l
 Yv31GT7CuiVDyGp4sJqyq7T7VaeH87p+KrHmhe/3e+yXs2syUFVzfvIEKjsFad6hShWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4d3B/PGtTQYXHQ7OKboe22V9b3Gf8sq3dbcehpWreHY=; b=ZsSAFwLw45yBHRjzubgOiHF9VW
 WURGi8T+00cmaCi1YAaNCvGQIwRCh5TH6gdP1Dm07zvg1NioUc+IOSA7FKdI5gihUAfyl02CeG5qn
 6IYnDUocrevWCZr5xeIZ4FYJjeBWI26oSOLQAbDJQ44L+jjd9jtZuaBdITjzinUv5AYM=;
Received: from mail-sgaapc01on2060.outbound.protection.outlook.com
 ([40.107.215.60] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouyPL-009G8h-F7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 16:03:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNjpofMxR9/+cJ3X0rmERLvA56pfjGT//mNeou+pD86LeHP4lskx/dMJkWqU+p9WC54N5ZO56iaIBaAoWxgESpMOc83huOhGrhelx4/31ZDg9azcVV+bHrXVEdgnJNSiAXf3CcQK0pLoiikqPis3CeanaMxJUfJidWLYaG3X3sLd6olF78JaYXxpQT7FDr17Bz50fIIhIJvp8uLscC7KvDA8HOE2Aq6ABKum4vg3/wWqxGa27Oq8mtshGIvfEWXCUHA1tZ0Uypn45CpFjWOcZhbvWViUNFb8ukP2Zz2RVFu6BjB2ROhEXv7CNla3Y1Z4hWCWS/ZznMQekmgAfZtjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d3B/PGtTQYXHQ7OKboe22V9b3Gf8sq3dbcehpWreHY=;
 b=ZvVzH8Ur7IMhNOKkpiqB8NqlYZx1lq5nEm0JTDGOHiMaCTqMHGES3C6uUVeYMyexLLcsNvdMLZvtk8vpbUUBy3cxRseQaTTRfDinlTdCuF3lD5uqrn+hYNup8zNP9AqR0MG1Qe0+EXYFMNwax/ARtqCEVC1ZuSvX572+oN4UuG1i5Bj2Q6oeRkWr3+HX5F0h9EKBCbbVvD55E/AE9LCYRw4MTty0YJUJT+fcQU/GfKtcftVPotRA/ZgZj2epb1SGMIlAtGy2hhOoHGR+EP0+mpjtMUtVkz2XmCXPaQqRKH3u9pk2X/yr6lvP2G5pMgOWBFQo0Y8Qf6uldVFU7fIfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d3B/PGtTQYXHQ7OKboe22V9b3Gf8sq3dbcehpWreHY=;
 b=h3waAbtv0OQOwEzT9SqvlFgrUGq8giVPI53pwNE7Q9GozRC4nUD7h4niRDVnenNEAKT9of686Wxk3dKilPFYT6A8pX+kzEnqCsKTC/P6HGCkoHH2RbeW522Hz9pKSH9IYPi+epj7BiFY3evBLqNdJnX87Dsw6GnihR7FZF8fykM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TY0PR02MB5765.apcprd02.prod.outlook.com (2603:1096:400:1b4::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 16:03:20 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 16:03:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 16 Nov 2022 00:01:55 +0800
Message-Id: <20221115160155.1037163-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f508dea8-5dc3-e29e-0d8b-4d64735817ac@kernel.org>
References: <f508dea8-5dc3-e29e-0d8b-4d64735817ac@kernel.org>
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TY0PR02MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 69757fa1-8061-4761-a11c-08dac722ea99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUMRc9Il0z6uAJkqERNY6+gMDk9QIOPNL/EpAfMLDyNTGWMuP6O332EZYGyP8Q6/lFICvyAcWYLjntMsp+CjPqc3aXcJMmzH0S398m2bMPABmFlr6bQj20yumxACuPMb8Dsji1yr0BQ9v9939AMNfOTK4Anx9f93bHx+Pwt7sQMsbUH0KKeHmDuZSCKDFnvw18gLx9JwapAducczFnWNjDpVC3SB5o822GXH4ionnz9G6vr+D92jNKCs9hTyePMGxUKlB+DN+4gO+rriozPqP5nRKWLf8D6G86p4Rggbq0sdycZxOVuuL1kINPiSTvXph1qLOYNyi9YbXJl6i1QpYJ6th/yvo61vy5zv89KrKh2lKKO+jlV3Z9ogb4XAXkXjzN6cBkZK4h9w4GAm445V5V0YkldSssDuWli4zlCzUF6bGATGo50oeX2A2L8ytlhhTg1bnY3wsEt7MzlwNmJ7BcttKMsfZAxeA0cg8FCpddp2IyKYmeHjWQ1B1opPDLsXzwQgTEBNlkdqx/KxOKAv+CJIc4NKsJSciMjhDMZIZBOArHwaqKoiD7TyNexlCtdXk7zcQmOuhPIlDJoehHPXtYN/XQiKZc/t5J0Wc8cb47A+PZtJoIebpD90bkvfqRVGHVRXgyM7PtNxqcuhl9QbNlLTO/3P/6VkkS6Zof0Ryl1atYqY050vtwGfLE3volhxaUh6DzTW7WmUlnhzAfqwsbMf8H3xT3q45c4fXJcDt2v4fjUJhBFSpZ2YMhZb2j7p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(6486002)(52116002)(6666004)(107886003)(478600001)(66476007)(316002)(66946007)(66556008)(6512007)(26005)(6506007)(8676002)(41300700001)(4326008)(86362001)(38100700002)(38350700002)(186003)(2616005)(83380400001)(1076003)(8936002)(2906002)(5660300002)(36756003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2AaElL+qqPCs+nDYDln7uxaT9rHV3wPW5Z46jRx3LUGLRd17ov/PhICVYOVQ?=
 =?us-ascii?Q?cgXS8DFpSRCiKb0QDIc78J6zq0VXtDgtGHT7nVx9HGBp+bW94XjD59jJ1H+V?=
 =?us-ascii?Q?4UMwjjrc78WBfZel+xigaMes/kWw5SY0mQ/13fJ5mEg2u21HMj7vLfqmKZ5n?=
 =?us-ascii?Q?nCW603wZwXSlO6GC2XmPFVP2bl+DuMC8vDDiwgVBBm4gBtpd9d1T4NC+3H3z?=
 =?us-ascii?Q?AmNh791yNlU5eZKxkDNTUVd597pvJcbAVzjTqgz+xXaV2juhhdpZBH2cdbUk?=
 =?us-ascii?Q?/jO/A9TJpLyhEzKWJ3QcXsJjpXTuYtQXYvq/zPa47W++nIGsgy+LGl5NZUqX?=
 =?us-ascii?Q?t7dkNXysyriEsjSDnmrJ8Eox3VlzIkh4F8A9FqzZFE/zLp+M0zZiJOSsCsLm?=
 =?us-ascii?Q?VUJhfH6Bo0wpagZH3S+KHwOlW3JTTzrbvmxlrJ6Mfh6QVxXf6LoaG6pkg9Xz?=
 =?us-ascii?Q?ydwD/FY3fd7IAo+dNtHJDArsKR4ht40/DBwklCt1Ra2B/aPtSDRTxsm0yf7x?=
 =?us-ascii?Q?XcNm8Bt5u5AH7dc9E/w1moeKdN40yqj7NTAB8FHN2v9gJxIeiVACvTlcOaVW?=
 =?us-ascii?Q?l5UO+LvRcl+Ap/CGpM0JLB8bYahEuRUofs5bgGmQXYSK8sHIjJjhPOrk5XnB?=
 =?us-ascii?Q?UnkiFQRxadC+oPBzWI7qTUi5msdsxyEWR9YSdU/uyA4idqhkKkKeRTBbJ6TU?=
 =?us-ascii?Q?SzZi255BVlM8WSfieIOb9X3N+aDES4t1x4Yw3y20W7B1q5WPgMxSPUwXYeq3?=
 =?us-ascii?Q?Zx4BTuk7B8iGePRBwbEAUIshHV+4svkTivm5n5nOX0BhT2pqDVegl7kSp9CY?=
 =?us-ascii?Q?50Nd0DIAASFBFGZoOWbM92BYluKQLYy+o8hL8isqaoA1ulh2aZdsIa92PoEf?=
 =?us-ascii?Q?iYLAvo/+RTErnxvl/Y3QxnmOHDed4qHse4eIRr7untA+LalnrqA7vNcUxuWB?=
 =?us-ascii?Q?+6SYM8sQ34Dc1w9icBRO4ixNPFYWAvI2l9pY8r0SI63XKi0GmzUZaPjqc8bk?=
 =?us-ascii?Q?knxCct2JGBwzqXhsop0FARqN6Y+Qg/apVzAWfeNviLbASJyyJNGG0jotb9SV?=
 =?us-ascii?Q?b0P6iIF1kRAoMEvmjT1TuGMZHOXlGRUTKrebMAfpg2WQwQ42R/mp4ZW3zX3u?=
 =?us-ascii?Q?Q2/zkz/gC4xYqP01aiAHpGE9D23EzB69dUuSTTfZuQesRt2FRGvRH5F7yVMF?=
 =?us-ascii?Q?Gsqn2E8BsiJn44Dant9e+TZuAFZ1gMy3nkRFFdgmipc8wwKkr+7ha6GFnuJ3?=
 =?us-ascii?Q?6xbt+UAGpXF9qwdvvAK7sLmVgXdhyZYF3hmFrWt+g8SWl3U1VYVTLK2k0vFD?=
 =?us-ascii?Q?TWK9eC4Xibnte2SK3ZkLJVlvI+R3eUb21L9qA6NN73sZnR0t3DYSl7SsDUKY?=
 =?us-ascii?Q?y008YVdKqzb4r85PvLYc7D8HCqE4yOwy6HVBEc0PsYhkrHNPDaVBbQ9/b/q/?=
 =?us-ascii?Q?q5qNG4coJCSuVnOg5x2FTRfAy8HW7WoOBTbewBhi98WrFKSf7uYLYlXPm7ua?=
 =?us-ascii?Q?ZcULe0ApVo8udt/XVcQAPIy26OmRAzobGf2jh3K6TRCnLi55gmAFA71DLsBG?=
 =?us-ascii?Q?wjkk3cTgIBhMOYp2lH2IJRZ4XGpTC6w5bIr5e+DK?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69757fa1-8061-4761-a11c-08dac722ea99
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:03:20.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReeByN0GveTnIiJ7ZpCj2htj2rDuDPdfvEydh3d3aeD3QEuObiRsSQwjum+4Mv+FZcA3vI0WiMCjnQu+DzlvsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5765
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If compress_extension is set,
 and a newly created file matches
 the extension, the file could be marked as compression file. However, if
 inline_data is also enabled, there is no chance to check its ext [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.60 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.60 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ouyPL-009G8h-F7
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to enable compress for newly
 created file if extension matches
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If compress_extension is set, and a newly created file matches the
extension, the file could be marked as compression file. However,
if inline_data is also enabled, there is no chance to check its
extension since f2fs_should_compress() always returns false.

This patch moves set_compress_inode(), which do extension check, in
f2fs_should_compress() to check extensions before setting inline
data flag.

Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h  |   1 +
 fs/f2fs/namei.c | 336 ++++++++++++++++++++++++------------------------
 2 files changed, 171 insertions(+), 166 deletions(-)
---

Hi, Jaegeuk, Chao,

How about adding a bool `may_compress' in set_compress_new_inode, set
`my_compress` according to several conditions. If it is false, clear
F2FS_COMPR_FL.

And set_compress_context is also changed to clear F2FS_NOCOMP_FL,
otherwise, if F2FS_NOCOMP_FL is inherited from parent and hit
compress_extension, both F2FS_NOCOMP_FL and F2FS_COMPR_FL are set.

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6a8cbf5bb1871..a3420fbb29214 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4355,6 +4355,7 @@ static inline int set_compress_context(struct inode *inode)
 		F2FS_I(inode)->i_compress_flag |=
 				F2FS_OPTION(sbi).compress_level <<
 				COMPRESS_LEVEL_OFFSET;
+	F2FS_I(inode)->i_flags &= ~F2FS_NOCOMP_FL;
 	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e104409c3a0e5..36ec5cf7cf859 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -22,8 +22,170 @@
 #include "acl.h"
 #include <trace/events/f2fs.h>
 
+static inline int is_extension_exist(const unsigned char *s, const char *sub,
+						bool tmp_ext)
+{
+	size_t slen = strlen(s);
+	size_t sublen = strlen(sub);
+	int i;
+
+	if (sublen == 1 && *sub == '*')
+		return 1;
+
+	/*
+	 * filename format of multimedia file should be defined as:
+	 * "filename + '.' + extension + (optional: '.' + temp extension)".
+	 */
+	if (slen < sublen + 2)
+		return 0;
+
+	if (!tmp_ext) {
+		/* file has no temp extension */
+		if (s[slen - sublen - 1] != '.')
+			return 0;
+		return !strncasecmp(s + slen - sublen, sub, sublen);
+	}
+
+	for (i = 1; i < slen - sublen; i++) {
+		if (s[i] != '.')
+			continue;
+		if (!strncasecmp(s + i + 1, sub, sublen))
+			return 1;
+	}
+
+	return 0;
+}
+
+int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
+							bool hot, bool set)
+{
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	int hot_count = sbi->raw_super->hot_ext_count;
+	int total_count = cold_count + hot_count;
+	int start, count;
+	int i;
+
+	if (set) {
+		if (total_count == F2FS_MAX_EXTENSION)
+			return -EINVAL;
+	} else {
+		if (!hot && !cold_count)
+			return -EINVAL;
+		if (hot && !hot_count)
+			return -EINVAL;
+	}
+
+	if (hot) {
+		start = cold_count;
+		count = total_count;
+	} else {
+		start = 0;
+		count = cold_count;
+	}
+
+	for (i = start; i < count; i++) {
+		if (strcmp(name, extlist[i]))
+			continue;
+
+		if (set)
+			return -EINVAL;
+
+		memcpy(extlist[i], extlist[i + 1],
+				F2FS_EXTENSION_LEN * (total_count - i - 1));
+		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
+		if (hot)
+			sbi->raw_super->hot_ext_count = hot_count - 1;
+		else
+			sbi->raw_super->extension_count =
+						cpu_to_le32(cold_count - 1);
+		return 0;
+	}
+
+	if (!set)
+		return -EINVAL;
+
+	if (hot) {
+		memcpy(extlist[count], name, strlen(name));
+		sbi->raw_super->hot_ext_count = hot_count + 1;
+	} else {
+		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
+
+		memcpy(buf, &extlist[cold_count],
+				F2FS_EXTENSION_LEN * hot_count);
+		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
+		memcpy(extlist[cold_count], name, strlen(name));
+		memcpy(&extlist[cold_count + 1], buf,
+				F2FS_EXTENSION_LEN * hot_count);
+		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
+	}
+	return 0;
+}
+
+static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
+				struct inode *inode, const unsigned char *name)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	unsigned char (*noext)[F2FS_EXTENSION_LEN] =
+						F2FS_OPTION(sbi).noextensions;
+	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
+	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
+	bool may_compress = false;
+	int i, cold_count, hot_count;
+
+	if (!f2fs_sb_has_compression(sbi) || !name)
+		return;
+	if (!S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
+		return;
+
+	/* Inherit the compression flag in directory */
+	if (fi->i_flags & FS_COMPR_FL)
+		may_compress = true;
+
+	/* Start to check extension list for regular file */
+	if ((!ext_cnt && !noext_cnt) || S_ISDIR(inode->i_mode))
+		goto set_compress;
+
+	/* Don't compress hot files. */
+	f2fs_down_read(&sbi->sb_lock);
+	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	hot_count = sbi->raw_super->hot_ext_count;
+	for (i = cold_count; i < cold_count + hot_count; i++)
+		if (is_extension_exist(name, extlist[i], false)) {
+			may_compress = false;
+			f2fs_up_read(&sbi->sb_lock);
+			goto set_compress;
+		}
+	f2fs_up_read(&sbi->sb_lock);
+
+	/* Don't compress unallowed extension. */
+	for (i = 0; i < noext_cnt; i++) {
+		if (is_extension_exist(name, noext[i], false)) {
+			may_compress = false;
+			goto set_compress;
+		}
+	}
+
+	/* Compress wanting extension. */
+	for (i = 0; i < ext_cnt; i++) {
+		if (is_extension_exist(name, ext[i], false)) {
+			may_compress = true;
+			goto set_compress;
+		}
+	}
+
+set_compress:
+	if (may_compress)
+		set_compress_context(inode);
+	else if (fi->i_flags & F2FS_COMPR_FL)
+		fi->i_flags &= ~F2FS_COMPR_FL;
+}
+
 static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
-						struct inode *dir, umode_t mode)
+						struct inode *dir, umode_t mode,
+						const char *name)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	nid_t ino;
@@ -114,12 +276,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
 
-	if (f2fs_sb_has_compression(sbi)) {
-		/* Inherit the compression flag in directory */
-		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
-					f2fs_may_compress(inode))
-			set_compress_context(inode);
-	}
+	/* Check compression first. */
+	set_compress_new_inode(sbi, dir, inode, name);
 
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
@@ -153,40 +311,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	return ERR_PTR(err);
 }
 
-static inline int is_extension_exist(const unsigned char *s, const char *sub,
-						bool tmp_ext)
-{
-	size_t slen = strlen(s);
-	size_t sublen = strlen(sub);
-	int i;
-
-	if (sublen == 1 && *sub == '*')
-		return 1;
-
-	/*
-	 * filename format of multimedia file should be defined as:
-	 * "filename + '.' + extension + (optional: '.' + temp extension)".
-	 */
-	if (slen < sublen + 2)
-		return 0;
-
-	if (!tmp_ext) {
-		/* file has no temp extension */
-		if (s[slen - sublen - 1] != '.')
-			return 0;
-		return !strncasecmp(s + slen - sublen, sub, sublen);
-	}
-
-	for (i = 1; i < slen - sublen; i++) {
-		if (s[i] != '.')
-			continue;
-		if (!strncasecmp(s + i + 1, sub, sublen))
-			return 1;
-	}
-
-	return 0;
-}
-
 /*
  * Set file's temperature for hot/cold data separation
  */
@@ -217,124 +341,6 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
 		file_set_hot(inode);
 }
 
-int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
-							bool hot, bool set)
-{
-	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
-	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
-	int hot_count = sbi->raw_super->hot_ext_count;
-	int total_count = cold_count + hot_count;
-	int start, count;
-	int i;
-
-	if (set) {
-		if (total_count == F2FS_MAX_EXTENSION)
-			return -EINVAL;
-	} else {
-		if (!hot && !cold_count)
-			return -EINVAL;
-		if (hot && !hot_count)
-			return -EINVAL;
-	}
-
-	if (hot) {
-		start = cold_count;
-		count = total_count;
-	} else {
-		start = 0;
-		count = cold_count;
-	}
-
-	for (i = start; i < count; i++) {
-		if (strcmp(name, extlist[i]))
-			continue;
-
-		if (set)
-			return -EINVAL;
-
-		memcpy(extlist[i], extlist[i + 1],
-				F2FS_EXTENSION_LEN * (total_count - i - 1));
-		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
-		if (hot)
-			sbi->raw_super->hot_ext_count = hot_count - 1;
-		else
-			sbi->raw_super->extension_count =
-						cpu_to_le32(cold_count - 1);
-		return 0;
-	}
-
-	if (!set)
-		return -EINVAL;
-
-	if (hot) {
-		memcpy(extlist[count], name, strlen(name));
-		sbi->raw_super->hot_ext_count = hot_count + 1;
-	} else {
-		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
-
-		memcpy(buf, &extlist[cold_count],
-				F2FS_EXTENSION_LEN * hot_count);
-		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
-		memcpy(extlist[cold_count], name, strlen(name));
-		memcpy(&extlist[cold_count + 1], buf,
-				F2FS_EXTENSION_LEN * hot_count);
-		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
-	}
-	return 0;
-}
-
-static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
-						const unsigned char *name)
-{
-	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
-	unsigned char (*noext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).noextensions;
-	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
-	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
-	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
-	int i, cold_count, hot_count;
-
-	if (!f2fs_sb_has_compression(sbi) ||
-			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
-			!f2fs_may_compress(inode) ||
-			(!ext_cnt && !noext_cnt))
-		return;
-
-	f2fs_down_read(&sbi->sb_lock);
-
-	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
-	hot_count = sbi->raw_super->hot_ext_count;
-
-	for (i = cold_count; i < cold_count + hot_count; i++) {
-		if (is_extension_exist(name, extlist[i], false)) {
-			f2fs_up_read(&sbi->sb_lock);
-			return;
-		}
-	}
-
-	f2fs_up_read(&sbi->sb_lock);
-
-	for (i = 0; i < noext_cnt; i++) {
-		if (is_extension_exist(name, noext[i], false)) {
-			f2fs_disable_compressed_file(inode);
-			return;
-		}
-	}
-
-	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
-		return;
-
-	for (i = 0; i < ext_cnt; i++) {
-		if (!is_extension_exist(name, ext[i], false))
-			continue;
-
-		/* Do not use inline_data with compression */
-		stat_dec_inline_inode(inode);
-		clear_inode_flag(inode, FI_INLINE_DATA);
-		set_compress_context(inode);
-		return;
-	}
-}
-
 static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 		       struct dentry *dentry, umode_t mode, bool excl)
 {
@@ -352,15 +358,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
 	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, dentry->d_name.name);
 
-	set_compress_inode(sbi, inode, dentry->d_name.name);
-
 	inode->i_op = &f2fs_file_inode_operations;
 	inode->i_fop = &f2fs_file_operations;
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
@@ -689,7 +693,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -760,7 +764,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode, dentry->d_name.name);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -817,7 +821,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -856,7 +860,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
