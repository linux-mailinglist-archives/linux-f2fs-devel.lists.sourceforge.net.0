Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5E78BC52
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 03:06:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qanBC-0005ux-08;
	Tue, 29 Aug 2023 01:06:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3b0TtZAYKANo9NKOAJCKKCHA.8KI@flex--drosen.bounces.google.com>)
 id 1qanBA-0005ui-GC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JojpSJEunAsaT6ZuFK+fdZlpfIZZTPA48dGgoFsyiWQ=; b=fLjQPZONOHZG1jg89SZgh9G3X6
 fSCSOjjNj4C0h9iqi3tUcPG06SAyLr+H4bhqNe3y3X29PU1BVdvoYh49gapz5V9RjcamV49wGbBdk
 aSyfux/iI7Zvb/rtlsHXvhxGTAupzBHETkZ9Ujq+s5+r5DjvVfj3PbeRwgJLlSH240Is=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JojpSJEunAsaT6ZuFK+fdZlpfIZZTPA48dGgoFsyiWQ=; b=nLLcIFkNstB2nyffhg6ZQc50UM
 182g3D8clTJtycMHRIvl8u6w1BVQwuL8dJp43nu6E93pI9av9JAoUV+PMtzmMoshTY10ap12dUaai
 cD+WSo35CLW8BQzVOehpXkS/LP8eMZXF4iyhWgeLKEXf67xAN+006XQ+ggSgucKqmKqI=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qanB7-0007HI-LD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:06:00 +0000
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-d74829dd58fso4660551276.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 18:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693271152; x=1693875952;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JojpSJEunAsaT6ZuFK+fdZlpfIZZTPA48dGgoFsyiWQ=;
 b=S0hEIeDJerVoUzOzjgZnNJvBXKxeQZjThaBl0zO4xUtEyJ8gX466khyoLJH38sQ1YM
 00Gla8W/sPMkl6xfi4LNTP4zH9r5v7L3KjhmG/Qna5IZkuA2iRCN9ObuQm60/iExbcgd
 MU6tbiI1cEvU1egQR0IRg/gy+rjU1oInW2WvpEKUd68PdoajXaoqkUr5LCvowRr7iIyj
 xfPL+dW1LdpqJgXLkVy2S5/hcFhdpYkZF0f3zEkvjdPggWLpiztz+rzR32z3eQKyvg6W
 Cz3tVb9H4+qmSqyDyp2Rit4fR8yHfJ2R2hHzITJ7Msw/weE+OJhstsovcPTXz3JLY5fn
 3Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693271152; x=1693875952;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JojpSJEunAsaT6ZuFK+fdZlpfIZZTPA48dGgoFsyiWQ=;
 b=SHIsV2y+EVn75SN5zSui0QsLWfwCcYDeOwv9+nP24u2qAS5UvQ48MNZnZ/K98lDUAz
 7w7JuuQ/zZO4bbYvYGuipOiO9d/epMmmzm0hycm8MD+ZmYcC9bgaZmXT60lLNur6yWab
 KztxFfds8d5nPSdJmEcpN2Jeb1f66gkbVgx5pIhWQ8vG+JL5j5kWD2+3+p7f8Yjm2elf
 s5uElSHwPSi5lK/0RNTprXzZnW+88HjpG5MCvaV5AhT3+92E/JiNgtdSyKX5GeLK+yuc
 QJfto1QHie+TDMX71C/b8nxKtj4qJzZxyFyZuxT+DQA7Cql5PdQsWhTRraqbxtIvaaRF
 u9hQ==
X-Gm-Message-State: AOJu0Yy+ARpY/8qtXcSY6/ZPz9bL4gm9XOISDnhZ0co8GoIJPSsZANaN
 u/MhoY8WgPozFt7OR+KjJTASwf1JFOLmvunw8Y6JsD8TR7bLUhMkmCaVRrco32o0aIsKJiXh24Z
 HAhJfNf9/07bmTuhxV/GNPV+ivSeWaNF6JIiYZXR9/O13RokvyILJbfD20g7UHWV2KrD3gcYP6u
 rSHTNCCHg=
X-Google-Smtp-Source: AGHT+IHhSQSlxcDRUykDuxf9e6DlzXQ6U9dAXvdP70dYdNTrWq6GoHCWu1FosPU5rAjYBNr6xwKvRmYswoI=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:d11f:7395:bc0b:a192])
 (user=drosen job=sendgmr) by 2002:a25:ce14:0:b0:c15:cbd1:60da with SMTP id
 x20-20020a25ce14000000b00c15cbd160damr761215ybe.6.1693271151952; Mon, 28 Aug
 2023 18:05:51 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:05:34 -0700
In-Reply-To: <20230829010536.3044883-1-drosen@google.com>
Mime-Version: 1.0
References: <20230829010536.3044883-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230829010536.3044883-6-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This splits off access to the summary block's journal and
 footer into a macro call, as their location is dependent on block size. Because
 of this you should use F2FS_BLKSIZE instead of sizeof(struct s [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qanB7-0007HI-LD
Subject: [f2fs-dev] [PATCH v3 5/7] f2fs-tools: Refactor Summary block struct
 and friends
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This splits off access to the summary block's journal and footer into a
macro call, as their location is dependent on block size. Because of
this you should use F2FS_BLKSIZE instead of sizeof(struct summary_block)

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/f2fs.h        |  4 +--
 fsck/fsck.c        | 12 +++----
 fsck/mount.c       | 54 ++++++++++++++---------------
 fsck/resize.c      |  2 +-
 include/f2fs_fs.h  | 86 +++++++++++++++++++++++++++++++++-------------
 mkfs/f2fs_format.c | 16 ++++-----
 6 files changed, 107 insertions(+), 67 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 0b136b0..a0fca45 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -608,8 +608,8 @@ static inline int inline_xattr_size(struct f2fs_inode *inode)
 }
 
 extern int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid, struct f2fs_nat_entry *ne);
-#define IS_SUM_NODE_SEG(footer)		(footer.entry_type == SUM_TYPE_NODE)
-#define IS_SUM_DATA_SEG(footer)		(footer.entry_type == SUM_TYPE_DATA)
+#define IS_SUM_NODE_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_NODE)
+#define IS_SUM_DATA_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_DATA)
 
 static inline unsigned int dir_buckets(unsigned int level, int dir_level)
 {
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 769ee65..e605d3c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -172,7 +172,7 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 		se = get_seg_entry(sbi, segno);
 		if(IS_NODESEG(se->type)) {
 			ASSERT_MSG("Summary footer indicates a node segment: 0x%x", segno);
-			sum_blk->footer.entry_type = SUM_TYPE_NODE;
+			F2FS_SUMMARY_BLOCK_FOOTER(sum_blk)->entry_type = SUM_TYPE_NODE;
 		} else {
 			ret = -EINVAL;
 			goto out;
@@ -297,7 +297,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 		se = get_seg_entry(sbi, segno);
 		if (IS_DATASEG(se->type)) {
 			ASSERT_MSG("Summary footer indicates a data segment: 0x%x", segno);
-			sum_blk->footer.entry_type = SUM_TYPE_DATA;
+			F2FS_SUMMARY_BLOCK_FOOTER(sum_blk)->entry_type = SUM_TYPE_DATA;
 		} else {
 			ret = -EINVAL;
 			goto out;
@@ -3299,16 +3299,16 @@ int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 				se->type = i;
 			ret = -1;
 		}
-		if (i <= CURSEG_COLD_DATA && IS_SUM_DATA_SEG(sum_blk->footer)) {
+		if (i <= CURSEG_COLD_DATA && IS_SUM_DATA_SEG(sum_blk)) {
 			continue;
-		} else if (i > CURSEG_COLD_DATA && IS_SUM_NODE_SEG(sum_blk->footer)) {
+		} else if (i > CURSEG_COLD_DATA && IS_SUM_NODE_SEG(sum_blk)) {
 			continue;
 		} else {
 			ASSERT_MSG("Incorrect curseg [%d]: segno [0x%x] "
 				   "type(SSA) [%d]", i, curseg->segno,
-				   sum_blk->footer.entry_type);
+				   F2FS_SUMMARY_BLOCK_FOOTER(sum_blk)->entry_type);
 			if (c.fix_on || c.preen_mode)
-				sum_blk->footer.entry_type =
+				F2FS_SUMMARY_BLOCK_FOOTER(sum_blk)->entry_type =
 					i <= CURSEG_COLD_DATA ?
 					SUM_TYPE_DATA : SUM_TYPE_NODE;
 			ret = -1;
diff --git a/fsck/mount.c b/fsck/mount.c
index 162d742..93373c6 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1588,7 +1588,7 @@ static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 	int nid_bitmap_size = (nm_i->max_nid + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
 	struct f2fs_summary_block *sum = curseg->sum_blk;
-	struct f2fs_journal *journal = &sum->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(sum);
 	nid_t nid;
 	int i;
 
@@ -1773,7 +1773,7 @@ static int check_nat_bits(struct f2fs_sb_info *sbi,
 					8 + F2FS_BLKSIZE - 1);
 	unsigned char *nat_bits, *full_nat_bits, *empty_nat_bits;
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	uint32_t i, j;
 	block_t blkaddr;
 	int err = 0;
@@ -1974,12 +1974,12 @@ void reset_curseg(struct f2fs_sb_info *sbi, int type)
 	struct summary_footer *sum_footer;
 	struct seg_entry *se;
 
-	sum_footer = &(curseg->sum_blk->footer);
+	sum_footer = F2FS_SUMMARY_BLOCK_FOOTER(curseg->sum_blk);
 	memset(sum_footer, 0, sizeof(struct summary_footer));
 	if (IS_DATASEG(type))
-		SET_SUM_TYPE(sum_footer, SUM_TYPE_DATA);
+		SET_SUM_TYPE(curseg->sum_blk, SUM_TYPE_DATA);
 	if (IS_NODESEG(type))
-		SET_SUM_TYPE(sum_footer, SUM_TYPE_NODE);
+		SET_SUM_TYPE(curseg->sum_blk, SUM_TYPE_NODE);
 	se = get_seg_entry(sbi, curseg->segno);
 	se->type = type;
 	se->dirty = 1;
@@ -2002,10 +2002,10 @@ static void read_compacted_summaries(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 
 	curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	memcpy(&curseg->sum_blk->journal.n_nats, kaddr, SUM_JOURNAL_SIZE);
+	memcpy(&F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk)->n_nats, kaddr, SUM_JOURNAL_SIZE);
 
 	curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
-	memcpy(&curseg->sum_blk->journal.n_sits, kaddr + SUM_JOURNAL_SIZE,
+	memcpy(&F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk)->n_sits, kaddr + SUM_JOURNAL_SIZE,
 						SUM_JOURNAL_SIZE);
 
 	offset = 2 * SUM_JOURNAL_SIZE;
@@ -2088,7 +2088,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			blk_addr = GET_SUM_BLKADDR(sbi, segno);
 	}
 
-	sum_blk = malloc(sizeof(*sum_blk));
+	sum_blk = malloc(F2FS_BLKSIZE);
 	ASSERT(sum_blk);
 
 	ret = dev_read_block(sum_blk, blk_addr);
@@ -2098,7 +2098,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 		restore_node_summary(sbi, segno, sum_blk);
 
 	curseg = CURSEG_I(sbi, type);
-	memcpy(curseg->sum_blk, sum_blk, sizeof(*sum_blk));
+	memcpy(curseg->sum_blk, sum_blk, F2FS_BLKSIZE);
 	reset_curseg(sbi, type);
 	free(sum_blk);
 }
@@ -2122,7 +2122,7 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
 
 	sum_blk = get_sum_block(sbi, segno, &type);
 	memcpy(&sum_blk->entries[offset], sum, sizeof(*sum));
-	sum_blk->footer.entry_type = IS_NODESEG(se->type) ? SUM_TYPE_NODE :
+	F2FS_SUMMARY_BLOCK_FOOTER(sum_blk)->entry_type = IS_NODESEG(se->type) ? SUM_TYPE_NODE :
 							SUM_TYPE_DATA;
 
 	/* write SSA all the time */
@@ -2164,7 +2164,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 	SM_I(sbi)->curseg_array = array;
 
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
-		array[i].sum_blk = calloc(sizeof(*(array[i].sum_blk)), 1);
+		array[i].sum_blk = calloc(F2FS_BLKSIZE, 1);
 		if (!array[i].sum_blk) {
 			MSG(1, "\tError: Calloc failed for build_curseg!!\n");
 			goto seg_cleanup;
@@ -2334,7 +2334,7 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	for (type = 0; type < NR_CURSEG_NODE_TYPE; type++) {
 		if (segno == get_cp(cur_node_segno[type])) {
 			curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
-			if (!IS_SUM_NODE_SEG(curseg->sum_blk->footer)) {
+			if (!IS_SUM_NODE_SEG(curseg->sum_blk)) {
 				ASSERT_MSG("segno [0x%x] indicates a data "
 						"segment, but should be node",
 						segno);
@@ -2349,7 +2349,7 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	for (type = 0; type < NR_CURSEG_DATA_TYPE; type++) {
 		if (segno == get_cp(cur_data_segno[type])) {
 			curseg = CURSEG_I(sbi, type);
-			if (IS_SUM_NODE_SEG(curseg->sum_blk->footer)) {
+			if (IS_SUM_NODE_SEG(curseg->sum_blk)) {
 				ASSERT_MSG("segno [0x%x] indicates a node "
 						"segment, but should be data",
 						segno);
@@ -2367,9 +2367,9 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	ret = dev_read_block(sum_blk, ssa_blk);
 	ASSERT(ret >= 0);
 
-	if (IS_SUM_NODE_SEG(sum_blk->footer))
+	if (IS_SUM_NODE_SEG(sum_blk))
 		*ret_type = SEG_TYPE_NODE;
-	else if (IS_SUM_DATA_SEG(sum_blk->footer))
+	else if (IS_SUM_DATA_SEG(sum_blk))
 		*ret_type = SEG_TYPE_DATA;
 
 	return sum_blk;
@@ -2519,7 +2519,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	struct f2fs_sit_block *sit_blk;
 	struct seg_entry *se;
 	struct f2fs_sit_entry sit;
@@ -2685,7 +2685,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
 	sit_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(sit_blk);
 	/* remove sit journal */
-	sum->journal.n_sits = 0;
+	F2FS_SUMMARY_BLOCK_JOURNAL(sum)->n_sits = 0;
 
 	ptr = fsck->main_area_bitmap;
 
@@ -2726,7 +2726,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
 static int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct f2fs_sit_block *sit_blk;
 	unsigned int segno;
@@ -2760,7 +2760,7 @@ static int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
 static int flush_nat_journal_entries(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	struct f2fs_nat_block *nat_block;
 	pgoff_t block_addr;
 	int entry_off;
@@ -2995,7 +2995,7 @@ static void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, i);
-	struct f2fs_summary_block buf;
+	char buf[F2FS_BLKSIZE];
 	u32 old_segno;
 	u64 ssa_blk, to;
 	int ret;
@@ -3031,10 +3031,10 @@ bypass_ssa:
 
 	/* update new segno */
 	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-	ret = dev_read_block(&buf, ssa_blk);
+	ret = dev_read_block(buf, ssa_blk);
 	ASSERT(ret >= 0);
 
-	memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
+	memcpy(curseg->sum_blk, buf, SUM_ENTRIES_SIZE);
 
 	/* update se->types */
 	reset_curseg(sbi, i);
@@ -3064,7 +3064,7 @@ void zero_journal_entries(struct f2fs_sb_info *sbi)
 	int i;
 
 	for (i = 0; i < NO_CHECK_TYPE; i++)
-		CURSEG_I(sbi, i)->sum_blk->journal.n_nats = 0;
+		F2FS_SUMMARY_BLOCK_JOURNAL(CURSEG_I(sbi, i)->sum_blk)->n_nats = 0;
 }
 
 void write_curseg_info(struct f2fs_sb_info *sbi)
@@ -3092,7 +3092,7 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 					struct f2fs_nat_entry *raw_nat)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	int i = 0;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
@@ -3109,7 +3109,7 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	struct f2fs_nat_block *nat_block;
 	pgoff_t block_addr;
 	int entry_off;
@@ -3153,7 +3153,7 @@ void update_nat_journal_blkaddr(struct f2fs_sb_info *sbi, u32 nid,
 					block_t blkaddr)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	int i;
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
@@ -3314,7 +3314,7 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
diff --git a/fsck/resize.c b/fsck/resize.c
index 2fd3941..6c3f4bd 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -222,7 +222,7 @@ static void move_ssa(struct f2fs_sb_info *sbi, unsigned int segno,
 		ASSERT(ret >= 0);
 		DBG(1, "Write summary block: (%d) segno=%x/%x --> (%d) %x\n",
 				type, segno, GET_SUM_BLKADDR(sbi, segno),
-				IS_SUM_NODE_SEG(sum_blk->footer),
+				IS_SUM_NODE_SEG(sum_blk),
 				new_sum_blk_addr);
 	}
 	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 4c213dd..fc65670 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -620,8 +620,8 @@ enum {
 /*
  * Copied from fs/f2fs/segment.h
  */
-#define GET_SUM_TYPE(footer) ((footer)->entry_type)
-#define SET_SUM_TYPE(footer, type) ((footer)->entry_type = type)
+#define GET_SUM_TYPE(sum) (F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type)
+#define SET_SUM_TYPE(sum, type) (F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type = type)
 
 /*
  * Copied from include/linux/f2fs_sb.h
@@ -630,6 +630,7 @@ enum {
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* 12 bits for 4096 bytes */
 #define F2FS_BLKSIZE			(1 << F2FS_BLKSIZE_BITS)/* support only 4KB block */
+#define F2FS_MAX_BLKSIZE		16384
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
@@ -1253,13 +1254,15 @@ struct nat_journal_entry {
 
 static_assert(sizeof(struct nat_journal_entry) == 13, "");
 
+/*
+ * Layout is as follows:
+ * struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
+ * __u8 reserved[NAT_JOURNAL_RESERVED];
+ */
 struct nat_journal {
-	struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
-	__u8 reserved[NAT_JOURNAL_RESERVED];
+	struct nat_journal_entry entries[0];
 };
 
-static_assert(sizeof(struct nat_journal) == (F2FS_BLKSIZE / 8) - 7, "");
-
 struct sit_journal_entry {
 	__le32 segno;
 	struct f2fs_sit_entry se;
@@ -1267,20 +1270,28 @@ struct sit_journal_entry {
 
 static_assert(sizeof(struct sit_journal_entry) == 78, "");
 
+/*
+ * Layout is as follows:
+ * struct sit_journal_entry entries[SIT_JOURNAL_ENTRIES];
+ * __u8 reserved[SIT_JOURNAL_RESERVED];
+ */
 struct sit_journal {
-	struct sit_journal_entry entries[SIT_JOURNAL_ENTRIES];
-	__u8 reserved[SIT_JOURNAL_RESERVED];
+	struct sit_journal_entry entries[0];
 };
 
-static_assert(sizeof(struct sit_journal) == (F2FS_BLKSIZE / 8) - 7, "");
-
+/*
+ * Layout is as follows:
+ * __le64 kbytes_written;
+ * __u8 reserved[EXTRA_INFO_RESERVED];
+ */
 struct f2fs_extra_info {
 	__le64 kbytes_written;
-	__u8 reserved[EXTRA_INFO_RESERVED];
+	__u8 reserved[0];
 } __attribute__((packed));
 
-static_assert(sizeof(struct f2fs_extra_info) == (F2FS_BLKSIZE / 8) - 7, "");
-
+/*
+ * This struct's used size depends on F2FS_BLKSIZE. DO NOT use sizeof
+ */
 struct f2fs_journal {
 	union {
 		__le16 n_nats;
@@ -1294,16 +1305,22 @@ struct f2fs_journal {
 	};
 } __attribute__((packed));
 
-static_assert(sizeof(struct f2fs_journal) == (F2FS_BLKSIZE / 8) - 5, "");
-
-/* 4KB-sized summary block structure */
+/*
+ * Block-sized summary block structure
+ * Layout of f2fs_summary block is
+ * struct f2fs_summary entries[ENTRIES_IN_SUM];
+ * struct f2fs_journal journal;
+ * struct summary_footer footer;
+ *
+ * Do NOT use sizeof, use F2FS_BLKSIZE
+ *
+ */
 struct f2fs_summary_block {
-	struct f2fs_summary entries[ENTRIES_IN_SUM];
-	struct f2fs_journal journal;
-	struct summary_footer footer;
+	struct f2fs_summary entries[0];
 };
-
-static_assert(sizeof(struct f2fs_summary_block) == F2FS_BLKSIZE, "");
+#define F2FS_SUMMARY_BLOCK_JOURNAL(blk) ((struct f2fs_journal *)(&(blk)->entries[ENTRIES_IN_SUM]))
+#define F2FS_SUMMARY_BLOCK_FOOTER(blk) ((struct summary_footer *)&((char *)\
+					(&(blk)->entries[0]))[F2FS_BLKSIZE - SUM_FOOTER_SIZE])
 
 /*
  * For directory operations
@@ -1511,9 +1528,15 @@ struct f2fs_configuration {
 	compress_config_t compress;
 
 	block_t curseg_offset[NR_CURSEG_TYPE];
-	struct f2fs_journal sit_jnl;
-	struct f2fs_journal nat_jnl;
 	struct f2fs_summary sum[NR_CURSEG_TYPE][MAX_CACHE_SUMS];
+	union {
+		struct f2fs_journal sit_jnl;
+		char sit_bytes[F2FS_MAX_BLKSIZE];
+	};
+	union {
+		struct f2fs_journal nat_jnl;
+		char nat_bytes[F2FS_MAX_BLKSIZE];
+	};
 };
 
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
@@ -2003,6 +2026,23 @@ static inline void check_block_struct_sizes(void)
 	/* Check SIT Block Size */
 	assert((SIT_ENTRY_PER_BLOCK + 1) * sizeof(struct f2fs_sit_entry) > F2FS_BLKSIZE);
 	assert(SIT_ENTRY_PER_BLOCK * sizeof(struct f2fs_sit_entry) <= F2FS_BLKSIZE);
+
+	/* Check NAT Journal Block Size */
+	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
+			+ offsetof(struct f2fs_journal, nat_j)
+			+ NAT_JOURNAL_ENTRIES * sizeof(struct nat_journal_entry)
+			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+
+	/* Check SIT Journal Block Size */
+	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
+			+ offsetof(struct f2fs_journal, sit_j)
+			+ SIT_JOURNAL_ENTRIES * sizeof(struct sit_journal_entry)
+			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+
+	/* Check Info Journal Block Size */
+	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
+			+ offsetof(struct f2fs_journal, info)
+			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
 }
 
 #endif	/*__F2FS_FS_H */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 50890c8..740e752 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -927,8 +927,8 @@ static int f2fs_write_check_point_pack(void)
 	sum_compact_p += SUM_JOURNAL_SIZE;
 
 	/* hot data summary */
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-	SET_SUM_TYPE((&sum->footer), SUM_TYPE_DATA);
+	memset(sum, 0, F2FS_BLKSIZE);
+	SET_SUM_TYPE(sum, SUM_TYPE_DATA);
 
 	sum_entry = (struct f2fs_summary *)sum_compact_p;
 	memcpy(sum_entry, c.sum[CURSEG_HOT_DATA],
@@ -946,8 +946,8 @@ static int f2fs_write_check_point_pack(void)
 	}
 
 	/* Prepare and write Segment summary for HOT_NODE */
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-	SET_SUM_TYPE((&sum->footer), SUM_TYPE_NODE);
+	memset(sum, 0, F2FS_BLKSIZE);
+	SET_SUM_TYPE(sum, SUM_TYPE_NODE);
 	memcpy(sum->entries, c.sum[CURSEG_HOT_NODE],
 			sizeof(struct f2fs_summary) * MAX_CACHE_SUMS);
 
@@ -960,8 +960,8 @@ static int f2fs_write_check_point_pack(void)
 	}
 
 	/* Fill segment summary for WARM_NODE to zero. */
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-	SET_SUM_TYPE((&sum->footer), SUM_TYPE_NODE);
+	memset(sum, 0, F2FS_BLKSIZE);
+	SET_SUM_TYPE(sum, SUM_TYPE_NODE);
 
 	cp_seg_blk++;
 	DBG(1, "\tWriting Segment summary for WARM_NODE, at offset 0x%08"PRIx64"\n",
@@ -972,8 +972,8 @@ static int f2fs_write_check_point_pack(void)
 	}
 
 	/* Fill segment summary for COLD_NODE to zero. */
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-	SET_SUM_TYPE((&sum->footer), SUM_TYPE_NODE);
+	memset(sum, 0, F2FS_BLKSIZE);
+	SET_SUM_TYPE(sum, SUM_TYPE_NODE);
 	cp_seg_blk++;
 	DBG(1, "\tWriting Segment summary for COLD_NODE, at offset 0x%08"PRIx64"\n",
 			cp_seg_blk);
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
