Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050793C86D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 20:40:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX3NZ-0001kY-Da;
	Thu, 25 Jul 2024 18:39:52 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sX3NY-0001kS-D9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 18:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ett5PzhDuG419l00fA1V98eEF8nQ7SW/myeQLHm7Kmg=; b=OrJASHpEn8xWJck/enci1AL0LE
 ByJWhgx1sWn4Vc0k66UdpHbBXKUvsyfR3Zv2ufk9+QHBFQQN6cJIe71m7pmJWQnvZp61WrH4P0z6e
 IuwPmDEDip6CZaUfsQRffJeE0HYu/mOiZA0PLSSReZ/SHgiRRjtNL1jVjztgNkJFMz1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ett5PzhDuG419l00fA1V98eEF8nQ7SW/myeQLHm7Kmg=; b=G
 aaAagLEEtq9bFSK0sg0eg0NnaI58hmBMWq6RZiIja1r10UfK5zyAPEFjIx8DunpIYgPZ1Zm5Oz3Fp
 Gx5IlmTK4CRGTNkgYYT8taQJ9MqQ0hh5kKxEsQPHFWrNZW2dcNz7KMTccDCRtnAOKguBOwZW1aItL
 fDht2wsn6N05PFaU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX3NW-0002b8-NH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 18:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0B2C6CE11C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jul 2024 18:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406FAC116B1;
 Thu, 25 Jul 2024 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721932783;
 bh=xKTlnWYyf5DCq8YNjso4UaUHl1+arRmwm8nOCn7EuSw=;
 h=From:To:Cc:Subject:Date:From;
 b=I4Qrc7c21I07tMbEeiO7L/Y+viG05osGtekqrAiJh5DPWB1y6Zdws7cYbtsYD6m/8
 aSiuk/qL6okgt58rZCoeIxd6opTHtoPf8PLUdqOSzbcNzm7g/sv7R7ExNnC6wvHJq8
 HEg+SibUCLJh4M04NrBTucEdvJF+05cwufjfYjEtF1AS8CBjCQKcvN62Hz3KITsXAn
 qDNoj76P1+WYEoXghJYIarWNTnJf/j+ni5MBjBIo4B6g1VxLKUKnBNGktt//Rr7wph
 gvB+kzJuehwgQPDzbyObTR2NKt5eICujIMEsKEWw7w0MoOhcp3iYWwq06Y8eBHZwO7
 4WVD6VT4Vvn5g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 25 Jul 2024 18:39:41 +0000
Message-ID: <20240725183941.655356-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fsck/inject.c
 | 28 +++++++++++++++ 1 file changed, 15 insertions(+), 13 deletions(-) diff
 --git a/fsck/inject.c b/fsck/inject.c index 2a21dae293f6..4ffdfd0f0b5d 100644
 --- a/fsck/inject.c +++ b/fsck/inject.c @@ -211, 6 +211,
 8 @@ int inject_parse_options(int
 argc, char *argv[], struct i [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX3NW-0002b8-NH
Subject: [f2fs-dev] [PATCH] inject.f2fs: fix some build errors
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/inject.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 2a21dae293f6..4ffdfd0f0b5d 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -211,6 +211,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 
 	while ((o = getopt_long(argc, argv, option_string,
 				long_opt, NULL)) != EOF) {
+		long nid, blk;
+
 		switch (o) {
 		case 1:
 			c.dry_run = 1;
@@ -265,10 +267,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			MSG(0, "Info: inject nat pack %s\n", pack[opt->nat]);
 			break;
 		case 9:
-			opt->nid = strtol(optarg, &endptr, 0);
-			if (opt->nid == LONG_MAX || opt->nid == LONG_MIN ||
-			    *endptr != '\0')
+			nid = strtol(optarg, &endptr, 0);
+			if (nid >= UINT_MAX || *endptr != '\0')
 				return -ERANGE;
+			opt->nid = nid;
 			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
 			break;
 		case 10:
@@ -280,10 +282,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			MSG(0, "Info: inject sit pack %s\n", pack[opt->sit]);
 			break;
 		case 11:
-			opt->blk = strtol(optarg, &endptr, 0);
-			if (opt->blk == LONG_MAX || opt->blk == LONG_MIN ||
-			    *endptr != '\0')
+			blk = strtol(optarg, &endptr, 0);
+			if (blk >= UINT_MAX || *endptr != '\0')
 				return -ERANGE;
+			opt->blk = blk;
 			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
 			break;
 		case 12:
@@ -432,7 +434,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 
 	if (!strcmp(opt->mb, "checkpoint_ver")) {
-		MSG(0, "Info: inject checkpoint_ver of cp %d: 0x%llx -> 0x%lx\n",
+		MSG(0, "Info: inject checkpoint_ver of cp %d: 0x%llx -> 0x%"PRIx64"\n",
 		    opt->cp, get_cp(checkpoint_ver), (u64)opt->val);
 		set_cp(checkpoint_ver, (u64)opt->val);
 	} else if (!strcmp(opt->mb, "ckpt_flags")) {
@@ -510,7 +512,7 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	int ret;
 
 	if (!IS_VALID_NID(sbi, opt->nid)) {
-		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+		ERR_MSG("Invalid nid %u range [%u:%"PRIu64"]\n", opt->nid, 0,
 			NAT_ENTRY_PER_BLOCK *
 			((get_sb(segment_count_nat) << 1) <<
 			 sbi->log_blocks_per_seg));
@@ -627,7 +629,7 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		sit->valid_map[opt->idx] = (u8)opt->val;
 	} else if (!strcmp(opt->mb, "mtime")) {
 		MSG(0, "Info: inject sit entry mtime of block 0x%x "
-		    "in pack %d: %lu -> %lu\n", opt->blk, opt->sit,
+		    "in pack %d: %"PRIu64" -> %"PRIu64"\n", opt->blk, opt->sit,
 		    le64_to_cpu(sit->mtime), (u64)opt->val);
 		sit->mtime = cpu_to_le64((u64)opt->val);
 	} else {
@@ -752,11 +754,11 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		    opt->nid, le32_to_cpu(inode->i_links), (u32)opt->val);
 		inode->i_links = cpu_to_le32((u32)opt->val);
 	} else if (!strcmp(opt->mb, "i_size")) {
-		MSG(0, "Info: inject inode i_size of nid %u: %lu -> %lu\n",
+		MSG(0, "Info: inject inode i_size of nid %u: %"PRIu64" -> %"PRIu64"\n",
 		    opt->nid, le64_to_cpu(inode->i_size), (u64)opt->val);
 		inode->i_size = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "i_blocks")) {
-		MSG(0, "Info: inject inode i_blocks of nid %u: %lu -> %lu\n",
+		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
 		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
 		inode->i_blocks = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "i_extra_isize")) {
@@ -835,7 +837,7 @@ static int inject_node(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	int ret;
 
 	if (!IS_VALID_NID(sbi, opt->nid)) {
-		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+		ERR_MSG("Invalid nid %u range [%u:%"PRIu64"]\n", opt->nid, 0,
 			NAT_ENTRY_PER_BLOCK *
 			((get_sb(segment_count_nat) << 1) <<
 			 sbi->log_blocks_per_seg));
@@ -865,7 +867,7 @@ static int inject_node(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		footer->flag = cpu_to_le32((u32)opt->val);
 	} else if (!strcmp(opt->mb, "cp_ver")) {
 		MSG(0, "Info: inject node footer cp_ver of nid %u: "
-		    "0x%lx -> 0x%lx\n", opt->nid, le64_to_cpu(footer->cp_ver),
+		    "0x%"PRIx64" -> 0x%"PRIx64"\n", opt->nid, le64_to_cpu(footer->cp_ver),
 		    (u64)opt->val);
 		footer->cp_ver = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "next_blkaddr")) {
-- 
2.46.0.rc1.232.g9752f9e123-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
