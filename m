Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5C3E3173
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 23:53:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mC7mX-0002In-Kl; Fri, 06 Aug 2021 21:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1mC7mW-0002Ie-CR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 21:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RutxsrGFq4wLvMg0gjjT3e2ZEmBLiSblhcYV8FIMQa4=; b=lfnaWkonOwryY8aFixc+mJ113X
 fzRSgxEFR6sGTwXHdSjiF3JmYT366FCiCg5jMN4eYT8Gehap+Mmmszh0WYyfiix8maNu/O2gRFKq3
 mc6XpcJqqcOaD366VWIuFAz47MqYLKD2rhsFtEp/jhbon94FXbYqXLZFWM64rzvIdL/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RutxsrGFq4wLvMg0gjjT3e2ZEmBLiSblhcYV8FIMQa4=; b=X
 KE4JlnuyddTiibEEG9fOK9COPxjcET+KD6YNPXMo/qKUYxT1vGKkHhSr5dCPYuRDFbTcKW9ItaB39
 HtijzGi5eNxneuJCjrXskvE5lGkL3R+W+ereZ7h9BYGc+SWAYm8Db4GAQ8IPP1Gq7Jnop3jorAvW8
 DuRKtjn698/mmrdI=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mC7mR-0003su-SM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 21:53:32 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so24694791pjb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Aug 2021 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RutxsrGFq4wLvMg0gjjT3e2ZEmBLiSblhcYV8FIMQa4=;
 b=ONO2acq/6Q1yJCbWPs3wgpqKqtjFqtwAZ55Q6DorUZGlravykkSge50US36jvOhEz0
 emnPanf58Ogj2kiSAxbkhC7XbggLrvkGPPLGOAhmcfdUQRAcVQ091wdtQGZG6LLh9g++
 8XCicMNewVPOPUIe9R21mbl4OAkir9rhimFscQYsyqnrqmPG2NA7yN1m3n5Tx3SPkpIn
 RHkH54j+Et9p44rBf6m4y41vGDh8aI9wAoUXi2CVOEXA7dTtfxb03IXOLwFDMa7ZCxnF
 vj703BhiS/oolsN5Pn9V/Fz1F4ufAZDogEHJu03XMcOfDNBhbg2QXgbYYlvV1cwh8c7p
 T4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RutxsrGFq4wLvMg0gjjT3e2ZEmBLiSblhcYV8FIMQa4=;
 b=Lbuj+5VGLHLraX+q4Z/HYJbzLxaC1dr5ZIDcrHRQzYlYHDm+Hzt9xMMeYYuY1+1k15
 ++PfDujJu8sZtCcbU5uYDM7IQPaD4ofWyZl79jXvOR9vFme+yIbCTjGeRcHkd5EXPPPY
 opWt11O1/4LmIf/O20DxwS/zycxeirhYdUyYmA/Nm2tmb/O+psn7LRLJqzLbqMOQaY8N
 2lkP0V5+M8HnqozSSkxhBxvCpBUPar/Uuk1JtO4oRvDbPZCBDQtqi29Prst0voLP247a
 I/lgIE5tvs9dOcCGMXkTktasP0rtzlXYhwCVV5Zkpb9qD0egJjZj/Jo5xvCsDSOwRjBP
 kF4A==
X-Gm-Message-State: AOAM530QbMusQnDArdJJJWbZ3DhSVTeXNkfvHKSwyCgfn+XE+prJzL7X
 mu+UUXIv16Fqxqvv68FyqtQ=
X-Google-Smtp-Source: ABdhPJyOWfbdzWVGUwlRdWgXxjG8k3A68KoJVGcmMT47i1YA3eR9uH06ws6OhT9JpuDZ2OkUhpyLpQ==
X-Received: by 2002:a17:902:c404:b029:12c:4e68:ba6e with SMTP id
 k4-20020a170902c404b029012c4e68ba6emr8178884plk.39.1628286802172; 
 Fri, 06 Aug 2021 14:53:22 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:8903:771d:9f7c:b057])
 by smtp.gmail.com with ESMTPSA id v16sm3718451pje.24.2021.08.06.14.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:53:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  6 Aug 2021 14:53:18 -0700
Message-Id: <20210806215318.1165945-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.48 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mC7mR-0003su-SM
Subject: [f2fs-dev] [PATCH] f2fs: introduce blk_alloc_mode mount option
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

Added a mount option to control block allocation mode for filesystem
developer to simulate filesystem fragmentation and after-GC situation
for experimental reasons to understand the filesystem behaviors well
under the severe condition. This supports "normal", "seg_random" and
"blk_random:<num>" options.

"normal" (default): f2fs allocates blocks in the normal way.
"seg_random": f2fs allocates a new segment in ramdom position.
              With this, we can simulate the after-GC condition.
"blk_random:<num>": We can make f2fs allocate only 1..<num> blocks
                    in a row and forcibly change the segment randomly.
                    With this, the newly allocated blocks will be scatter
                    throughout the whole partition and we can simulate
                    filesystem fragmentation condition.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst | 16 ++++++++++
 fs/f2fs/f2fs.h                     | 17 +++++++++++
 fs/f2fs/gc.c                       |  5 +++-
 fs/f2fs/segment.c                  | 12 ++++++++
 fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++++++
 5 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ff9e7cc97c65..c2d09fa98f9f 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -312,6 +312,22 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 Documentation/block/inline-encryption.rst.
 atgc			 Enable age-threshold garbage collection, it provides high
 			 effectiveness and efficiency on background GC.
+bl_alloc_mode=%s	 Control block allocation mode. This is a developer option
+			 for experiments to simulate filesystem fragmentation and
+			 after-GC situation. The developers use this mode to understand
+			 filesystem fragmentation and after-GC condition well, and
+			 eventually get the insight to handle them better.
+			 This supports "normal", "seg_random" and "blk_random:<num>" modes.
+			 In "normal" mode (default), f2fs allocates blocks in the normal way.
+			 In "seg_random", f2fs allocates a new segment in ramdom position.
+			 With this, we can simulate the after-GC condition.
+			 In "blk_random:<num>", we can make f2fs allocate only 1..<num>
+			 blocks in a segment and forcibly change the segment randomly.
+			 You can set the <num> within 1 .. <blocks per segment> number.
+			 With this, the newly allocated blocks will be scatter throughout
+			 the whole partition and we can simulate filesystem fragmentation
+			 condition. Please, use this option for your experiments and we
+			 strongly recommand a filesystem format after using this option.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fccee18ab776..bdd33d78d9fc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,9 @@ struct f2fs_mount_info {
 	int compress_mode;			/* compression mode */
 	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
 	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
+
+	int blk_alloc_mode;		/* block allocation mode */
+	int blk_alloc_random_max;	/* the maximum chunk size for block random allocation mode */
 };
 
 #define F2FS_FEATURE_ENCRYPT		0x0001
@@ -1740,6 +1743,8 @@ struct f2fs_sb_info {
 
 	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
 
+	int blk_alloc_remained;			/* remained block count for this block allocation period */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
@@ -3619,6 +3624,18 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
+enum {
+	BLK_ALLOC_MODE_NORMAL,		/* normal block allocation mode */
+	BLK_ALLOC_MODE_SEG_RANDOM,	/* make segment allocation random */
+	BLK_ALLOC_MODE_BLK_RANDOM,	/* make block allocation random */
+};
+
+static inline bool f2fs_need_seg_random(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_SEG_RANDOM ||
+		F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM;
+}
+
 /*
  * checkpoint.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9dce44619069..571b50322e6e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/sched/signal.h>
+#include <linux/random.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -256,7 +257,9 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 		p->max_search = sbi->max_victim_search;
 
 	/* let's select beginning hot/small space first in no_heap mode*/
-	if (test_opt(sbi, NOHEAP) &&
+	if (f2fs_need_seg_random(sbi))
+		p->offset = prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
+	else if (test_opt(sbi, NOHEAP) &&
 		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
 		p->offset = 0;
 	else
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f9b7fb785e1d..6dff2d36ad6b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -15,6 +15,7 @@
 #include <linux/timer.h>
 #include <linux/freezer.h>
 #include <linux/sched/signal.h>
+#include <linux/random.h>
 
 #include "f2fs.h"
 #include "segment.h"
@@ -2587,6 +2588,8 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 	unsigned short seg_type = curseg->seg_type;
 
 	sanity_check_seg_type(sbi, seg_type);
+	if (f2fs_need_seg_random(sbi))
+		return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
 
 	/* if segs_per_sec is large than 1, we need to keep original policy. */
 	if (__is_large_section(sbi))
@@ -3150,6 +3153,15 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 static bool __has_curseg_space(struct f2fs_sb_info *sbi,
 					struct curseg_info *curseg)
 {
+	/* To allocate block chunks in different sizes, use random number */
+	if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM) {
+		if (--sbi->blk_alloc_remained < 0) {
+			sbi->blk_alloc_remained = prandom_u32() %
+				F2FS_OPTION(sbi).blk_alloc_random_max;
+			return false;
+		}
+	}
+
 	return curseg->next_blkoff < f2fs_usable_blks_in_seg(sbi,
 							curseg->segno);
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9ead6d2e703b..801981547fe0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -155,6 +155,7 @@ enum {
 	Opt_atgc,
 	Opt_gc_merge,
 	Opt_nogc_merge,
+	Opt_blk_alloc_mode,
 	Opt_err,
 };
 
@@ -231,6 +232,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_atgc, "atgc"},
 	{Opt_gc_merge, "gc_merge"},
 	{Opt_nogc_merge, "nogc_merge"},
+	{Opt_blk_alloc_mode, "blk_alloc_mode=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1173,6 +1175,40 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_nogc_merge:
 			clear_opt(sbi, GC_MERGE);
 			break;
+		case Opt_blk_alloc_mode:
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+			if (!strcmp(name, "normal")) {
+				F2FS_OPTION(sbi).blk_alloc_mode =
+					BLK_ALLOC_MODE_NORMAL;
+			} else if (!strcmp(name, "seg_random")) {
+				F2FS_OPTION(sbi).blk_alloc_mode =
+					BLK_ALLOC_MODE_SEG_RANDOM;
+			} else if (!strncmp(name, "blk_random:", 11)) {
+				const char *num = name + 11;
+				long size;
+
+				ret = kstrtol(num, 10, &size);
+				if (ret) {
+					kfree(name);
+					return ret;
+				}
+				if (size < 1)
+					size = 1;
+				else if (size > sbi->blocks_per_seg)
+					size = sbi->blocks_per_seg;
+
+				F2FS_OPTION(sbi).blk_alloc_mode =
+					BLK_ALLOC_MODE_BLK_RANDOM;
+				F2FS_OPTION(sbi).blk_alloc_random_max =	size;
+				sbi->blk_alloc_remained = size;
+			} else {
+				kfree(name);
+				return -EINVAL;
+			}
+			kfree(name);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1919,6 +1955,14 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
 		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
 
+	if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_NORMAL)
+		seq_printf(seq, ",blk_alloc_mode=%s", "normal");
+	else if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_SEG_RANDOM)
+		seq_printf(seq, ",blk_alloc_mode=%s", "seg_random");
+	else if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM)
+		seq_printf(seq, ",blk_alloc_mode=%s:%d", "blk_random",
+				F2FS_OPTION(sbi).blk_alloc_random_max);
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	f2fs_show_compress_options(seq, sbi->sb);
 #endif
@@ -1947,6 +1991,9 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).compress_ext_cnt = 0;
 	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
+	F2FS_OPTION(sbi).blk_alloc_mode = BLK_ALLOC_MODE_NORMAL;
+	F2FS_OPTION(sbi).blk_alloc_random_max = sbi->blocks_per_seg;
+	sbi->blk_alloc_remained = sbi->blocks_per_seg;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
 
-- 
2.32.0.605.g8dce9f2422-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
