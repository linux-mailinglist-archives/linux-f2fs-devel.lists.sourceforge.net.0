Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EAAA93B76
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Apr 2025 18:56:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u5p14-0001Zd-Iv;
	Fri, 18 Apr 2025 16:56:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1u5p12-0001ZW-SP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Apr 2025 16:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKlJr23HwQEEM3rBH5QpFzv6RecqhOO8MUz9X5DHGbA=; b=RjgwLMdKAk8K1MYTDvpXFBrX7u
 Dp55qtdg8LQMGK2b4OXGd/iX87arVajyDyI3FvTuf9ou9jvIoSpLTMiW8YNNTuKdOa+9okB5kOvaE
 LiRLbCT9xNYcxvw+g77BRhsQfVVIwDWGL+s8g0TQpTrFjMpYa3q01n5/oLYSorlDWT2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TKlJr23HwQEEM3rBH5QpFzv6RecqhOO8MUz9X5DHGbA=; b=f
 KM2jFq89i4yHJ5fcXGlakHW1Z+g05WkFtUdpwgsSv8yledeDu85a3zMb4YbSoKKi86LGmNbNLEym3
 jfdV1Ob7t37Te735Qe8DpNl4U46U54RIq8p+MBSpDcrk4GzgFB4ZaErWO3U5RNcAyyHPqPsywuA30
 dxNupXKtjTkqBBUY=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u5p0m-0002cE-HP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Apr 2025 16:56:36 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-301e05b90caso1938845a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Apr 2025 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744995370; x=1745600170; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TKlJr23HwQEEM3rBH5QpFzv6RecqhOO8MUz9X5DHGbA=;
 b=I6Fb5S4Jjy6GS0VQb+0KGQCB14t6HOGHyMAHG+/TFqiTBFLSY/9A5aM7YCsv4Kd+1v
 3XbNhdrZBbz+4bxYCd6+EpHd9sdnHNZhomcWVzkc6cCbC0GjRRTxVWCUKlhdENfQ0BjU
 0GnxHoMxsX0D+DHDeLReb3BObLZFRLEEUt17s/FkesIyq2fiY8YzG1V73ybFwOZemvwR
 1MN9XVNLierc4zrg5oqJLX1G6wYUJSI9bKAmReGw1g8UsH/WRdoRfErfI0Q1M0+eOR8u
 kVXkoth42RhVwVM8Wx2ltQZh3Tjyq/VWvwtFraWFIwU66kC3cThaebBSJTInieVCm3ic
 GwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744995370; x=1745600170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TKlJr23HwQEEM3rBH5QpFzv6RecqhOO8MUz9X5DHGbA=;
 b=bcU0t+WzHuEdQ8NmBg2QfzK5/FS+gb7+FhNH+pdztwWot2/5jl55tD4tOH9ZVhyyIq
 FYRqWnqHoFS0WHgbWEOibhsRJSqH7TxGfMll2NqiV1pkHvrT4+Oy9Y9C+tFok2TXil3u
 YsznD7ZkJZxc02LjxgqPyLa+IawPiXXGtrM3C9Z7d/6cSKDn+toBprzcjJQr4WRfwSz9
 d8koJGQGiIBlEhTEmGn9YvlctUnfIsoi/AhP4LjgltzwUU0ICwFZ3LX+p9mfkLpTvrLh
 pMTj6ZyTZTi7eLLQ3sDtDWIYZ+Pd9o7pWJIQV9VkRn64eVIgTm8ffFOIXkVngYy7quhy
 DglQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9NhDKEdej+D2G7B1mZ1JycFC+VKe0aPQUX53YE+kQZAXPTLi79O7Sk/cX4CSm3nbuk/byK7spbTqoqQEF41AY@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwM5HrrihDYPsExluCtgNN4Zphi+KEj5BsV8vr9KwBytaSCW37J
 Hpcspb8n3M2gzi/O97UL5md52wqgpJGyPJesla10rGve9pfmJWXa
X-Gm-Gg: ASbGncvsriV0TNay+ABLhKJa9vhawS3WmtKWe2Z4Q869Hp89X5Pi77ZxWsNeWBS/7pO
 NNDmqR77v/ulmcqUYL8M76yzgVub2YxUvar73slAnyGTppM155iO/+RLeDnOKxhsCExn9fy3IrX
 YhpFRGRG+uGmMOe70W5B1yyQO/360QnRyZtkzH/EOq33oVbwkUTR0u7Kl1K1ytejMS3s/61/9+u
 2sxdch7FWRjVn5+JvtJEDHaYG06/L4pya36ekuZEReRFoPpuE8iNPGZZLFcQYfAEij6ucy5ZgPw
 OcH94Ayf+zY2lKYu1Q8NifTeINyN2gs29Yq14eDh/lhM3t1zf5EE15T8Mfd04m98wcDMTSE85ey
 M3ToBlMHdtipedsjX5axGNPT6+4XEUcU=
X-Google-Smtp-Source: AGHT+IHZqnsqBHDbnZitcF47A1nOMx1QkT4vqNOFU1E1Dta/4pCADVHaAElNjDeS6NuR01p2EKfONw==
X-Received: by 2002:a17:90b:498d:b0:2ff:52e1:c49f with SMTP id
 98e67ed59e1d1-3087bbad6a5mr4354743a91.26.1744995369612; 
 Fri, 18 Apr 2025 09:56:09 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:2bec:a9ba:705:770f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087dee325bsm1658933a91.9.2025.04.18.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 09:56:09 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 18 Apr 2025 09:56:01 -0700
Message-ID: <20250418165601.3050393-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Due to the difficulty of intentionally
 corrupting
 specific metadata on some storage devices like zoned storage devices, it
 is challenging to effectively verify fsck functionality. To facilitate this
 v [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u5p0m-0002cE-HP
Subject: [f2fs-dev] [PATCH] f2fs-tools: introduce fault injection to fsck
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Due to the difficulty of intentionally corrupting specific metadata on
some storage devices like zoned storage devices, it is challenging to
effectively verify fsck functionality. To facilitate this verification,
it is necessary to add a fault injection mode.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c       | 106 +++++++++++++++++++++++++++++++++-------------
 fsck/main.c       |  22 ++++++++++
 fsck/mkquota.c    |   3 ++
 include/f2fs_fs.h |  54 +++++++++++++++++++++++
 man/fsck.f2fs.8   |  36 ++++++++++++++++
 5 files changed, 192 insertions(+), 29 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8155cbd..e879d8c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -16,6 +16,20 @@
 char *tree_mark;
 uint32_t tree_mark_size = 256;
 
+const char *f2fs_fault_name[FAULT_MAX] = {
+	[FAULT_SEG_TYPE]	= "invalid segment type",
+	[FAULT_SUM_TYPE]	= "invalid summary type",
+	[FAULT_SUM_ENT]		= "invalid summary entry",
+	[FAULT_NAT]		= "invalid nat entry",
+	[FAULT_NODE]		= "invalid node block",
+	[FAULT_XATTR_ENT]	= "invalid xattr entry",
+	[FAULT_COMPR]		= "invalid compression type",
+	[FAULT_INODE]		= "invalid inode info",
+	[FAULT_DENTRY]		= "invalid dentry",
+	[FAULT_DATA]		= "invalid data block",
+	[FAULT_QUOTA]		= "invalid quota",
+};
+
 int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u32 blk, int type)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -23,9 +37,9 @@ int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u32 blk, int type)
 	int fix = 0;
 
 	se = get_seg_entry(sbi, GET_SEGNO(sbi, blk));
-	if (se->type >= NO_CHECK_TYPE)
-		fix = 1;
-	else if (IS_DATASEG(se->type) != IS_DATASEG(type))
+	if (time_to_inject(FAULT_SEG_TYPE) ||
+			(se->type >= NO_CHECK_TYPE) ||
+			(IS_DATASEG(se->type) != IS_DATASEG(type)))
 		fix = 1;
 
 	/* just check data and node types */
@@ -168,7 +182,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	sum_blk = get_sum_block(sbi, segno, &type);
 
-	if (type != SEG_TYPE_NODE && type != SEG_TYPE_CUR_NODE) {
+	if (time_to_inject(FAULT_SUM_TYPE) ||
+			(type != SEG_TYPE_NODE && type != SEG_TYPE_CUR_NODE)) {
 		/* can't fix current summary, then drop the block */
 		if (!c.fix_on || type < 0) {
 			ASSERT_MSG("Summary footer is not for node segment");
@@ -189,7 +204,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	sum_entry = &(sum_blk->entries[offset]);
 
-	if (le32_to_cpu(sum_entry->nid) != nid) {
+	if (time_to_inject(FAULT_SUM_ENT) ||
+			(le32_to_cpu(sum_entry->nid) != nid)) {
 		if (!c.fix_on || type < 0) {
 			DBG(0, "nid                       [0x%x]\n", nid);
 			DBG(0, "target blk_addr           [0x%x]\n", blk_addr);
@@ -282,7 +298,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 	struct f2fs_summary *sum_entry;
 	struct seg_entry * se;
 	u32 segno, offset;
-	int need_fix = 0, ret = 0;
+	int need_fix = 0, ret = 0, fault_sum_ent = 0;
 	int type;
 
 	if (get_sb(feature) & F2FS_FEATURE_RO)
@@ -293,7 +309,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 
 	sum_blk = get_sum_block(sbi, segno, &type);
 
-	if (type != SEG_TYPE_DATA && type != SEG_TYPE_CUR_DATA) {
+	if (time_to_inject(FAULT_SUM_TYPE) ||
+			(type != SEG_TYPE_DATA && type != SEG_TYPE_CUR_DATA)) {
 		/* can't fix current summary, then drop the block */
 		if (!c.fix_on || type < 0) {
 			ASSERT_MSG("Summary footer is not for data segment");
@@ -314,7 +331,10 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 
 	sum_entry = &(sum_blk->entries[offset]);
 
-	if (le32_to_cpu(sum_entry->nid) != parent_nid ||
+	if (time_to_inject(FAULT_SUM_ENT))
+		fault_sum_ent = 1;
+
+	if (fault_sum_ent || le32_to_cpu(sum_entry->nid) != parent_nid ||
 			sum_entry->version != version ||
 			le16_to_cpu(sum_entry->ofs_in_node) != idx_in_node) {
 		if (!c.fix_on || type < 0) {
@@ -333,7 +353,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 			DBG(0, "Target data block addr    [0x%x]\n", blk_addr);
 			ASSERT_MSG("Invalid data seg summary\n");
 			ret = -EINVAL;
-		} else if (is_valid_summary(sbi, sum_entry, blk_addr)) {
+		} else if (!fault_sum_ent &&
+				is_valid_summary(sbi, sum_entry, blk_addr)) {
 			/* delete wrong index */
 			ret = -EINVAL;
 		} else {
@@ -397,6 +418,9 @@ err:
 static int sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid,
 						struct node_info *ni)
 {
+	if (time_to_inject(FAULT_NAT))
+		return -EINVAL;
+
 	if (!IS_VALID_NID(sbi, nid)) {
 		ASSERT_MSG("nid is not valid. [0x%x]", nid);
 		return -EINVAL;
@@ -436,6 +460,9 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	int ret;
 
+	if (time_to_inject(FAULT_NODE))
+		return -EINVAL;
+
 	ret = sanity_check_nat(sbi, nid, ni);
 	if (ret)
 		return ret;
@@ -865,7 +892,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 				"end of list", nid);
 		need_fix = true;
 	}
-	if (need_fix && c.fix_on) {
+	if ((time_to_inject(FAULT_XATTR_ENT) || need_fix) && c.fix_on) {
 		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
 		write_all_xattrs(sbi, inode, xattr_size, xattr);
 		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
@@ -907,7 +934,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	if (!compressed)
 		goto check_next;
 
-	if (!compr_supported || (node_blk->i.i_inline & F2FS_INLINE_DATA)) {
+	if (time_to_inject(FAULT_COMPR) || !compr_supported ||
+			(node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		/*
 		 * The 'compression' flag in i_flags affects the traverse of
 		 * the node tree.  Thus, it must be fixed unconditionally
@@ -943,12 +971,13 @@ check_next:
 			f2fs_set_main_bitmap(sbi, ni->blk_addr,
 							CURSEG_WARM_NODE);
 
-			if (i_links == 0 && (ftype == F2FS_FT_CHRDEV ||
+			if (time_to_inject(FAULT_INODE) ||
+				(i_links == 0 && (ftype == F2FS_FT_CHRDEV ||
 				ftype == F2FS_FT_BLKDEV ||
 				ftype == F2FS_FT_FIFO ||
 				ftype == F2FS_FT_SOCK ||
 				ftype == F2FS_FT_SYMLINK ||
-				ftype == F2FS_FT_REG_FILE)) {
+				ftype == F2FS_FT_REG_FILE))) {
 				ASSERT_MSG("ino: 0x%x ftype: %d has i_links: %u",
 							nid, ftype, i_links);
 				if (c.fix_on) {
@@ -1008,7 +1037,8 @@ check_next:
 		if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 			unsigned int isize =
 				le16_to_cpu(node_blk->i.i_extra_isize);
-			if (isize > 4 * DEF_ADDRS_PER_INODE) {
+			if (time_to_inject(FAULT_INODE) ||
+					(isize > 4 * DEF_ADDRS_PER_INODE)) {
 				ASSERT_MSG("[0x%x] wrong i_extra_isize=0x%x",
 						nid, isize);
 				if (c.fix_on) {
@@ -1038,8 +1068,9 @@ check_next:
 			unsigned int inline_size =
 				le16_to_cpu(node_blk->i.i_inline_xattr_size);
 
-			if (!inline_size ||
-					inline_size > MAX_INLINE_XATTR_SIZE) {
+			if (time_to_inject(FAULT_INODE) ||
+					(!inline_size ||
+					inline_size > MAX_INLINE_XATTR_SIZE)) {
 				ASSERT_MSG("[0x%x] wrong inline_xattr_size:%u",
 						nid, inline_size);
 				if (c.fix_on) {
@@ -1056,9 +1087,10 @@ check_next:
 	}
 	ofs = get_extra_isize(node_blk);
 
-	if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
-	    (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
-	     !(c.feature & F2FS_FEATURE_CASEFOLD))) {
+	if (time_to_inject(FAULT_INODE) ||
+		 ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
+		  (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
+		   !(c.feature & F2FS_FEATURE_CASEFOLD)))) {
 		ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
 		if (c.fix_on) {
 			FIX_MSG("ino[0x%x] clear casefold flag", nid);
@@ -1077,7 +1109,8 @@ check_next:
 			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
-		if (blkaddr != NULL_ADDR) {
+		if (time_to_inject(FAULT_INODE) ||
+				(blkaddr != NULL_ADDR)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 					nid, blkaddr);
 			if (c.fix_on) {
@@ -1088,7 +1121,8 @@ check_next:
 				need_fix = 1;
 			}
 		}
-		if (i_size > inline_size) {
+		if (time_to_inject(FAULT_INODE) ||
+				(i_size > inline_size)) {
 			ASSERT_MSG("[0x%x] wrong inline size:%lu",
 					nid, (unsigned long)i_size);
 			if (c.fix_on) {
@@ -1118,7 +1152,7 @@ check_next:
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
 		DBG(3, "ino[0x%x] has inline dentry!\n", nid);
-		if (blkaddr != 0) {
+		if (time_to_inject(FAULT_INODE) || (blkaddr != 0)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 								nid, blkaddr);
 			if (c.fix_on) {
@@ -1728,6 +1762,9 @@ static int f2fs_check_hash_code(int encoding, int casefolded,
 			struct f2fs_dir_entry *dentry,
 			const unsigned char *name, u32 len, int enc_name)
 {
+	if (time_to_inject(FAULT_DENTRY))
+		return 1;
+
 	/* Casefolded Encrypted names require a key to compute siphash */
 	if (enc_name && casefolded)
 		return 0;
@@ -1799,7 +1836,8 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	int fixed = 0;
 
 	if ((name[0] == '.' && len == 1)) {
-		if (le32_to_cpu(dentry->ino) != child->p_ino) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(le32_to_cpu(dentry->ino) != child->p_ino)) {
 			ASSERT_MSG("Bad inode number[0x%x] for '.', parent_ino is [0x%x]\n",
 				le32_to_cpu(dentry->ino), child->p_ino);
 			dentry->ino = cpu_to_le32(child->p_ino);
@@ -1809,13 +1847,16 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 
 	if (name[0] == '.' && name[1] == '.' && len == 2) {
 		if (child->p_ino == F2FS_ROOT_INO(sbi)) {
-			if (le32_to_cpu(dentry->ino) != F2FS_ROOT_INO(sbi)) {
+			if (time_to_inject(FAULT_DENTRY) ||
+					(le32_to_cpu(dentry->ino) !=
+					 F2FS_ROOT_INO(sbi))) {
 				ASSERT_MSG("Bad inode number[0x%x] for '..'\n",
 					le32_to_cpu(dentry->ino));
 				dentry->ino = cpu_to_le32(F2FS_ROOT_INO(sbi));
 				fixed = 1;
 			}
-		} else if (le32_to_cpu(dentry->ino) != child->pp_ino) {
+		} else if (time_to_inject(FAULT_DENTRY) ||
+				(le32_to_cpu(dentry->ino) != child->pp_ino)) {
 			ASSERT_MSG("Bad inode number[0x%x] for '..', parent parent ino is [0x%x]\n",
 				le32_to_cpu(dentry->ino), child->pp_ino);
 			dentry->ino = cpu_to_le32(child->pp_ino);
@@ -1826,7 +1867,7 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	if (f2fs_check_hash_code(get_encoding(sbi), casefolded, dentry, name, len, enc_name))
 		fixed = 1;
 
-	if (name[len] != '\0') {
+	if (time_to_inject(FAULT_DENTRY) || (name[len] != '\0')) {
 		ASSERT_MSG("'.' is not NULL terminated\n");
 		name[len] = '\0';
 		memcpy(*filename, name, len);
@@ -1889,7 +1930,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 			i++;
 			continue;
 		}
-		if (!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid NID/ino 0x%x",
 				    i, le32_to_cpu(dentry[i].ino));
 			if (c.fix_on) {
@@ -1903,7 +1945,9 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 		}
 
 		ftype = dentry[i].file_type;
-		if ((ftype <= F2FS_FT_UNKNOWN || ftype > F2FS_FT_LAST_FILE_TYPE)) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(ftype <= F2FS_FT_UNKNOWN ||
+				 ftype > F2FS_FT_LAST_FILE_TYPE)) {
 			ASSERT_MSG("Bad dentry 0x%x with unexpected ftype 0x%x",
 						le32_to_cpu(dentry[i].ino), ftype);
 			if (c.fix_on) {
@@ -1918,7 +1962,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 
 		name_len = le16_to_cpu(dentry[i].name_len);
 
-		if (name_len == 0 || name_len > F2FS_NAME_LEN) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(name_len == 0 || name_len > F2FS_NAME_LEN)) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid name_len", i);
 			if (c.fix_on) {
 				FIX_MSG("Clear bad dentry 0x%x", i);
@@ -2153,6 +2198,9 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		return 0;
 	}
 
+	if (time_to_inject(FAULT_DATA))
+		return -EINVAL;
+
 	if (!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) {
 		ASSERT_MSG("blkaddress is not valid. [0x%x]", blk_addr);
 		return -EINVAL;
diff --git a/fsck/main.c b/fsck/main.c
index 47ba6c9..29792d8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -91,6 +91,8 @@ void fsck_usage()
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
 	MSG(0, "  --kernel-check checks kernel change\n");
 	MSG(0, "  --debug-cache to debug cache when -c is used\n");
+	MSG(0, "  --fault_injection=%%d to enable fault injection with specified injection rate\n");
+	MSG(0, "  --fault_type=%%d to configure enabled fault injection type\n");
 	exit(1);
 }
 
@@ -263,6 +265,8 @@ void f2fs_parse_options(int argc, char *argv[])
 			{"no-kernel-check", no_argument, 0, 2},
 			{"kernel-check", no_argument, 0, 3},
 			{"debug-cache", no_argument, 0, 4},
+			{"fault_injection", required_argument, 0, 5},
+			{"fault_type", required_argument, 0, 6},
 			{0, 0, 0, 0}
 		};
 
@@ -287,6 +291,24 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 4:
 				c.cache_config.dbg_en = true;
 				break;
+			case 5:
+				val = atoi(optarg);
+				if ((unsigned int)val <= 1) {
+					MSG(0, "\tError: injection rate must be larger "
+							"than 1: %d\n", val);
+					fsck_usage();
+				}
+				c.fault_info.inject_rate = val;
+				c.fault_info.inject_type = F2FS_ALL_FAULT_TYPE;
+				break;
+			case 6:
+				val = atoi(optarg);
+				if (val >= (1UL << (FAULT_MAX))) {
+					MSG(0, "\tError: Invalid inject type: %x\n", val);
+					fsck_usage();
+				}
+				c.fault_info.inject_type = val;
+				break;
 			case 'a':
 				c.auto_fix = 1;
 				MSG(0, "Info: Automatic fix mode enabled.\n");
diff --git a/fsck/mkquota.c b/fsck/mkquota.c
index 2451b58..eb63fc9 100644
--- a/fsck/mkquota.c
+++ b/fsck/mkquota.c
@@ -372,6 +372,9 @@ errcode_t quota_compare_and_update(struct f2fs_sb_info *sbi,
 	dict_t *dict = qctx->quota_dict[qtype];
 	errcode_t err = 0;
 
+	if (time_to_inject(FAULT_QUOTA))
+		return -EINVAL;
+
 	if (!dict)
 		goto out;
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index bb40adc..3e1056c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1476,6 +1476,33 @@ enum {
 	F2FS_FEATURE_NAT_BITS = 0x0001,
 };
 
+/* Fault inject control */
+enum {
+	FAULT_SEG_TYPE,
+	FAULT_SUM_TYPE,
+	FAULT_SUM_ENT,
+	FAULT_NAT,
+	FAULT_NODE,
+	FAULT_XATTR_ENT,
+	FAULT_COMPR,
+	FAULT_INODE,
+	FAULT_DENTRY,
+	FAULT_DATA,
+	FAULT_QUOTA,
+	FAULT_MAX
+};
+
+#define F2FS_ALL_FAULT_TYPE	((1UL << (FAULT_MAX)) - 1)
+
+struct f2fs_fault_info {
+	int inject_ops;
+	int inject_rate;
+	unsigned int inject_type;
+};
+
+extern const char *f2fs_fault_name[FAULT_MAX];
+#define IS_FAULT_SET(fi, type) ((fi)->inject_type & (1UL << (type)))
+
 struct f2fs_configuration {
 	uint32_t conf_reserved_sections;
 	uint32_t reserved_segments;
@@ -1604,6 +1631,9 @@ struct f2fs_configuration {
 		struct f2fs_journal nat_jnl;
 		char nat_bytes[F2FS_MAX_BLKSIZE];
 	};
+
+	/* Fault injection control */
+	struct f2fs_fault_info fault_info;
 };
 
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
@@ -2131,4 +2161,28 @@ static inline void check_block_struct_sizes(void)
 			+ NR_DENTRY_IN_BLOCK * F2FS_SLOT_LEN * sizeof(u8) == F2FS_BLKSIZE);
 }
 
+/* Fault inject control */
+#define time_to_inject(type) __time_to_inject(type, __func__, \
+					__builtin_return_address(0))
+static inline bool __time_to_inject(int type, const char *func,
+		const char *parent_func)
+{
+	struct f2fs_fault_info *ffi = &c.fault_info;
+
+	if (!ffi->inject_rate)
+		return false;
+
+	if (!IS_FAULT_SET(ffi, type))
+		return false;
+
+	ffi->inject_ops++;
+	if (ffi->inject_ops >= ffi->inject_rate) {
+		ffi->inject_ops = 0;
+		MSG(0, "inject %s in %s of %p\n",
+				f2fs_fault_name[type], func, parent_func);
+		return true;
+	}
+	return false;
+}
+
 #endif	/*__F2FS_FS_H */
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index e39a846..3762e6d 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -67,6 +67,42 @@ Enable to show every directory entries in the partition.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-\-fault_injection=%d " enable fault injection"
+Enable fault injection in all supported types with specified injection rate.
+.TP
+.BI \-\-fault_type=%d " configure fault injection type"
+Support configuring fault injection type, should be enabled with
+fault_injection option, fault type value is shown below, it supports
+single or combined type.
+.br
+===========================      ===========
+.br
+Type_Name                        Type_Value
+.br
+===========================      ===========
+.br
+FAULT_SEG_TYPE                   0x000000001
+.br
+FAULT_SUM_TYPE                   0x000000002
+.br
+FAULT_SUM_ENT                    0x000000004
+.br
+FAULT_NAT                        0x000000008
+.br
+FAULT_NODE                       0x000000010
+.br
+FAULT_XATTR_ENT                  0x000000020
+.br
+FAULT_COMPR                      0x000000040
+.br
+FAULT_INODE                      0x000000080
+.br
+FAULT_DENTRY                     0x000000100
+.br
+FAULT_DATA                       0x000000200
+.br
+FAULT_QUOTA                      0x000000400
+.TP
 .SH AUTHOR
 Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.
 Jaegeuk Kim <jaegeuk@kernel.org> reworked most parts of the codes to support
-- 
2.49.0.805.g082f7c87e0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
