Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA86D0B27
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 18:28:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phv8o-0005sG-9g;
	Thu, 30 Mar 2023 16:28:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phv8n-0005s9-Lx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EkFRCy9DDI8CX6WsddO36xVa2wo8ptGLsLrJQzL4eg4=; b=O6pmGAw1SH1khtXy5aMUO22KX7
 u1zbQQjxcRXOd3y+m0nLKmscAIJVN8XwLw5g21tB4crfp21ffUxnE30mGr/mTJF8dIIDEjdPbADlW
 AJMyjWdPbqlUZjCiZ7QP9vnjIK1+NPY5Wtc/omPIhQ01VL2JwJcNd/X3PlHXl3BPwqzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EkFRCy9DDI8CX6WsddO36xVa2wo8ptGLsLrJQzL4eg4=; b=M
 Z2DA9d5+Lg9H5n+JCyl8EplxUAHgLHmzrvoB5w/yqDW+gXXHCc05ca6jygvUuZdC9b+6PVPxnCNLp
 clwrAsiSnurnrojioSt4ZZal+NkMvWgF70YIl3+m2WCL7cbA+SYRAnhxQsz8r0mqWqj1fB6lhBOyF
 5gStnYVoN2hAhjpE=;
Received: from mail-sgaapc01on2134.outbound.protection.outlook.com
 ([40.107.215.134] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phv8f-0003Io-U5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv2isaB+SSF0dnfb8C5wwDLnEoVesmEPaAbyrlTdNAGWnKsI07NQFBmexO6tKEU60g+PYhSWsIRbyui+zb1qi8xbpN8O07uTYN6ColLY3RyCCJ1V4HY3SXUqz5PURsSndKHCrmgmx1vEUQ3eTSX2gXRsqOkzFBFBcsxl0Zuu5/azNj/sD8i/dvu4XFTu9Ss/d6fYVg2qtqleUxrHvsc3ArxVMlDhH5LxVMlUNj/vVDtZiDnM8YKO+U6STJ1njbszoQP3NTkRcojGvW6jhBATLWm4JGjpJetG47Ms5xA47rHtSKEkOe4kPjaD/WUCXVgQJCcKOapQHpMHP/2IcB5BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkFRCy9DDI8CX6WsddO36xVa2wo8ptGLsLrJQzL4eg4=;
 b=Qyeax//uvuX3eOTca6/Z7i+kgeBhh0DL3JoaKzarkJvP3qlEEynZwcmJl5eBe49ajovSS5d3KeieQ2EX4XHVO+AcB+tfyOmyjx0Zng//ctg7/mbLnzv67kS0/V4/8WRQ15l+V29/CS8xn/9iX1WaDT7xE1NBdPu7eM2HMOIWk6iAvgmgP+Rcg2z9zzuILP7AvKbED/aiw4lNz6aWE6tDHHTBxbZYGPBVkBDjlm9vrZ1aWJ25S1FWcrS0BHHTuRQCXW5F5slj+vL7nICahEHBgi9JEB5F5TF4QPBoNjOwBHBBHdN0m5ZZZLZkaHtBm0W1uGBzuRE6M8ImQAbGf8ze6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkFRCy9DDI8CX6WsddO36xVa2wo8ptGLsLrJQzL4eg4=;
 b=fWb9Aa/xOURsKJXtcFRmvQFok8Kkas1EgStqM4WBeKjFfQISkjgjI55o0ASZ1tBh3GrNYfK9XqmFI8he+E02NnWXWaErgj+hIeVm7BfvIuCB3vxoxlFzNCXpHTxHg5FsKsNJvddGcbiXttrHAry9UdllM6C5RdXJ3Uy1SrFS/oNIXXSUU/ObVy1ia7voxrSnSSD51qyzR8nPOnEq2pkw2W43eKdJbd6kl1qYZzSmUKI+mGB3XdsVesQyVWljcBqx4rycs3PH/3wyGaeKSuDv5X3savM0EArKfg6Tb029q2Y13eW7Lnd6PlAf2mJhU8GOsrzI4Pov5Pw85f7tZy4vXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4009.apcprd06.prod.outlook.com (2603:1096:4:e8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.20; Thu, 30 Mar 2023 16:28:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 16:28:25 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Nick Terrell <terrelln@fb.com>
Date: Fri, 31 Mar 2023 00:28:11 +0800
Message-Id: <20230330162811.18923-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4009:EE_
X-MS-Office365-Filtering-Correlation-Id: 41603b14-f0e0-4488-027f-08db313bc917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CL3dObbQgp61mR1u4K/C+kU8xbFedl5fGaeMcVq5yu05kAKXcApiKdS7e6ZhxgeJMbZAcRh6GyL261ib/JMOU1MB81qdHAeGDaGOD60rQkWvL7tKctkmz0Y3qxJBVsgdnj5ALPD3j2VFmxSitksdUqqI2LJrJpf7scC7CGvVA7PjmLYfH1ABLCpsimclLu+2fHKv6uGk8po7DpbLES9KmRa0VgUdeesmNKS6qaly5rn6lAO9ccawgESwqGPEZi4nRf67YuFoHrtYnxd2k4JyU5sEesw08by2Iy1Gr2PX866XwQloqPdv0CjATaSNiKtX2ISXZrK5ybh0ao/KVrcI2JUyxtCDvLnb4QLp9vqkzag4EOQPgm4e1EVuZ7ZiR9KiWKNdDKGGVK23YUgmDjy2wW9eau0aMw7BeUXPLiwrxFTzY01QyLRgOgAWaKPpDL2O+MgipRlOuFj8QFbt2+WMJzjzBfNGFqiNZrQS2K52D4T8DJP2z7w+hFCIhfoxz2NDDBvP8TcYgpb5qYsBhAnC1qwLs37YXzChl20/kKrQoblrewkHIINQrAygVvwQlQQFjeOXHZzd2c1OJbocZ5St7hY+8lKSXAVRV72BUzhCZQ6vOOjF61H6mBkBYEXAT4G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(2906002)(8936002)(86362001)(66946007)(41300700001)(66556008)(8676002)(66476007)(4326008)(186003)(36756003)(316002)(110136005)(6506007)(1076003)(6512007)(26005)(5660300002)(83380400001)(52116002)(6666004)(6486002)(38350700002)(2616005)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ks/+9vaBcZTZo3l/wGDHnaJT3LQbW6AjDCoD9URcuXBXrgVzGnrIm1+BeOH6?=
 =?us-ascii?Q?+VQ8oItw/XLk3tb5vIGAX1yDBoO1VLtLBbA6Y01JfkJLjTyTrhRH1csbXKIa?=
 =?us-ascii?Q?DuJpwnpUi9bbw/Uh9XJSu/jIEO54ZVaN5+EuCklHLPm+UH+Qkgpom3k0wHTs?=
 =?us-ascii?Q?waOgBg508jNgthZ9Q4+cIbyayzXNhtGeOpFiceGhjLzmEQ0J3W7RPfeDzP08?=
 =?us-ascii?Q?13WtroCTsMr/HiFG2AicYMiCidFrbEKybY3Z7TaEMCZg/LdTuZPteYOZ/jGd?=
 =?us-ascii?Q?Byigu7ss+DIKzKb/VnwEdfo+Z1O2BjhTjWmE40wLhu5c+bR2l8EtAVLUzSXM?=
 =?us-ascii?Q?Hdk6NS8sVJTYD49oMnskxtffV1qYsQZsxbgv0QDHgFIN5w75lyMaVM1+6Um3?=
 =?us-ascii?Q?jwFqu64yA2tOuJCpqUcTe/cCwkIktSoo5L5lWXGFx8cCWHYX8D93btsmwQcP?=
 =?us-ascii?Q?oOqDg7iGrJ2wErMvcv8CLLtz6SLeRNSCp/cEm2lAWgcg9X2cpGPxx5W5sqx4?=
 =?us-ascii?Q?Hefv21RVbKEercgI/E89d/PNOCc89+vxvo3afB2ji3jsgA6HIlQigIHbLjf9?=
 =?us-ascii?Q?sEKSrKlPUj89rnccadCNowuRpCtzZrn1pEluRNXQ51mxgRqpA5MIsdQmz0tf?=
 =?us-ascii?Q?7h/dVUjUwI4sY9eV4BxXzDlZEzJUcd1qShTNij+QIgmoF8m1+yRTSuzMXUB5?=
 =?us-ascii?Q?iA2b8F05rG296Etx3XRPfX7AkZ87EnzNVWTvOlyYOofA4RvgHUI4rh4FJlH/?=
 =?us-ascii?Q?CvWX1HnErzmEMU8arH9RlVJgdr81qaJFY04oSWQwaDx92aCAR09NpSP7src5?=
 =?us-ascii?Q?g3KjCFuguXXi77hWfyxnwn9lcOQWDAt4/t+zZnvoT7k/WHMt6LZ+vJv0S6wz?=
 =?us-ascii?Q?JG4BLNo6GWGf31B0oDQEwBeB1BtQtalUXb5Hc1H4TMfecul5AdYbMuhsYLJ+?=
 =?us-ascii?Q?BnULhTO5ZKXubingvwd0Bcb0q6AuT10IVbKanGktcGPvdE8VLxow1Cqm4yxv?=
 =?us-ascii?Q?YG0jNOqTKyxR8uQ6iizspzbmVnxnrRgLcDE5+7J68e3nI0BhlY5+wWRnwZAp?=
 =?us-ascii?Q?S02SavvQGijnCoEGJU5Ao70Zz65JYuustcD/HMnUxuDhM0Bc67rLVzqJ79oT?=
 =?us-ascii?Q?tlaczljRwpk88nuqnJVQpPbmCSRszZomkbWkq4DTQkvSXmlxO/fK0E6eQ1uE?=
 =?us-ascii?Q?CmYXCDeoABqyQ8+5asLxUWmzNahQ53/kpY9mhZlucoDMcfwBFjlscyOY9vR2?=
 =?us-ascii?Q?qb4PWQMun/uFDFtwS0E2A+5AEDXhAXfrOOxkFI+YriS9utGhhfaY5AaLUDX/?=
 =?us-ascii?Q?lwrXH/uSBF49FcyOOdJq1cFtHNOHfIE4YFshr4sOyJKNNJ9edlL9pU9JzpC+?=
 =?us-ascii?Q?PPgsefLc71ckNWxYfRCKu+uiGcSh7r7nSwMCMpY+Mz5x770n0bwotHppv04m?=
 =?us-ascii?Q?4swTqjWKwUmTe9sNtVdEcrPAfUeeJKc6UANUlQSnk+sZb6tkRzGIjANUxW/f?=
 =?us-ascii?Q?4RCUus7l5TyfzbgwPLw8lgyrQVXTJ6uDe+N8NIpR3zybuwA13wdrpX5mBVrO?=
 =?us-ascii?Q?vCkhjAIDc/On0NEEOG4+h/f0YYWLRX++T5kSadSN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41603b14-f0e0-4488-027f-08db313bc917
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:28:25.1242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An0N5g8+/5RghEe3ozSRhPNNHZx35OJ8FT2UAs0PBT3yl+KjDi3rP3+kxBuFPfWI3VrzmB/E1/PZELPc1IQBTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4009
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3fde13f817e2 ("f2fs: compress: support compress
 level")
 forgot to do basic compress level check, let's add it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/inode.c | 94 +++++++++++++++++++++++++
 include/linux/zstd_lib.h | 3 ++ lib/zstd/compress/clevels.h | 4 -- 3 files
 changed, 67 inse [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.134 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.134 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phv8f-0003Io-U5
Subject: [f2fs-dev] [RESEND] f2fs: add sanity compress level check for
 compressed file
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 3fde13f817e2 ("f2fs: compress: support compress level")
forgot to do basic compress level check, let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/inode.c             | 94 +++++++++++++++++++++++++------------
 include/linux/zstd_lib.h    |  3 ++
 lib/zstd/compress/clevels.h |  4 --
 3 files changed, 67 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bb5b365a195d..e63f75168700 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -10,6 +10,8 @@
 #include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/sched/mm.h>
+#include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -202,6 +204,66 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+static bool sanity_check_compress_inode(struct inode *inode,
+			struct f2fs_inode *ri)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned char compress_level;
+
+	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_compress_algorithm);
+		return false;
+	}
+	if (le64_to_cpu(ri->i_compr_blocks) >
+			SECTOR_TO_BLOCK(inode->i_blocks)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
+			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
+			SECTOR_TO_BLOCK(inode->i_blocks));
+		return false;
+	}
+	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_log_cluster_size);
+		return false;
+	}
+
+	compress_level = le16_to_cpu(ri->i_compress_flag) >> COMPRESS_LEVEL_OFFSET;
+	switch (ri->i_compress_algorithm) {
+	case COMPRESS_LZO:
+	case COMPRESS_LZORLE:
+		if (compress_level)
+			goto err;
+		break;
+	case COMPRESS_LZ4:
+		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
+				compress_level > LZ4HC_MAX_CLEVEL)
+			goto err;
+		break;
+	case COMPRESS_ZSTD:
+		if (!compress_level || compress_level > ZSTD_MAX_CLEVEL)
+			goto err;
+		break;
+	default:
+		goto err;
+	}
+
+	return true;
+
+err:
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
+		  __func__, inode->i_ino, compress_level);
+	return false;
+}
+
 static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -285,36 +347,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
-			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size)) {
-		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"compress algorithm: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_compress_algorithm);
-			return false;
-		}
-		if (le64_to_cpu(ri->i_compr_blocks) >
-				SECTOR_TO_BLOCK(inode->i_blocks)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
-				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
-				  __func__, inode->i_ino,
-				  le64_to_cpu(ri->i_compr_blocks),
-				  SECTOR_TO_BLOCK(inode->i_blocks));
-			return false;
-		}
-		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"log cluster size: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_log_cluster_size);
-			return false;
-		}
-	}
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_log_cluster_size))
+		sanity_check_compress_inode(inode, ri);
 
 	return true;
 }
diff --git a/include/linux/zstd_lib.h b/include/linux/zstd_lib.h
index 79d55465d5c1..ff55f41c73d3 100644
--- a/include/linux/zstd_lib.h
+++ b/include/linux/zstd_lib.h
@@ -88,6 +88,9 @@ ZSTDLIB_API const char* ZSTD_versionString(void);
 #  define ZSTD_CLEVEL_DEFAULT 3
 #endif
 
+/*-=====  Pre-defined compression levels  =====-*/
+#define ZSTD_MAX_CLEVEL     22
+
 /* *************************************
  *  Constants
  ***************************************/
diff --git a/lib/zstd/compress/clevels.h b/lib/zstd/compress/clevels.h
index d9a76112ec3a..b040d9d29089 100644
--- a/lib/zstd/compress/clevels.h
+++ b/lib/zstd/compress/clevels.h
@@ -14,10 +14,6 @@
 #define ZSTD_STATIC_LINKING_ONLY  /* ZSTD_compressionParameters  */
 #include <linux/zstd.h>
 
-/*-=====  Pre-defined compression levels  =====-*/
-
-#define ZSTD_MAX_CLEVEL     22
-
 __attribute__((__unused__))
 
 static const ZSTD_compressionParameters ZSTD_defaultCParameters[4][ZSTD_MAX_CLEVEL+1] = {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
