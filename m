Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 378CC3E4C77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 20:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDAQT-0003jr-NU; Mon, 09 Aug 2021 18:55:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mDAQS-0003je-62
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 18:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JFDH27KaX6Bplb2L7zfn1uM94mEXFuq9PmXIqO+M6UA=; b=BtgvRcOpvKQ7d74mfCiBmf4DPR
 lzGrbHg55AL7JMIgqIMwzIXbZG7VTvxethlLrt2CttV5OVdVtEkH3FFYzLdaR7rFZXWZh6E+NFZ4a
 uyubaEfyqyNE/TWO0IXmL204bOofoD8qJUxONFmrDswZWFvOUb5qTa1gGwcQ3H6pZtwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JFDH27KaX6Bplb2L7zfn1uM94mEXFuq9PmXIqO+M6UA=; b=D
 DMnuh/dZ2wCWGtgTGXkAGfnlwn04gCdjOlmE8DMhpqCQC/5rvtjRgeo/s8cNH7CEJ62o89PCN+vtB
 WoWCEXtgQoekc32F+UVJkS51qKXjYw39LGdjqyo3TY04afQz379K7xaHPxrS/zhCco8EnfJ14xrDK
 KkpgXQm/qC1xdiyc=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mDAQQ-0004wK-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 18:55:04 +0000
Received: by mail-pj1-f46.google.com with SMTP id ca5so29462784pjb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Aug 2021 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFDH27KaX6Bplb2L7zfn1uM94mEXFuq9PmXIqO+M6UA=;
 b=nH2TlYoyJUgJy+JqjE6y9+n4UUrV8cMI0ihfDwkJCmFkrZkprgA7WYAQwM888kf38k
 Eaqpe5gVdqGTMSOabpHBXDSp39LzAEkeoYJ6qkDCUV0TZYG+1zMlhQdwmOqE+EK9gVB+
 62iOR5Qn3VtVXBL80xPmXlSqD6iKxQkaN9QzYKUm1jXco4UDYd1sOh1CAnTCwCDIlJ7e
 iYuEMNHhTQd1KKLOj++2ujqjQ09e+9HAcTOmx1BqZQm1MROJnAxqzKF907SBhM3q6ONA
 zFTO33l+LZgWwMP4gc6+PXut5JG3nkvcNg7gcvxzeq/nLlssoNYRwK7ZVkIjVkUln/0U
 l5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFDH27KaX6Bplb2L7zfn1uM94mEXFuq9PmXIqO+M6UA=;
 b=CqEI1TBtBeSumWcTGgbW5WRalkbrUAhkfUpDUyIs7pBIPOZWi1s3sssWHm+Ks4sSxN
 4tJUCJZT1rkVr9m9/HnkF93zDvAMeyfsXLX7NPOuVsuCu2GCZewgGMJLPzvDKoAkSGXQ
 Z5JCAwG9bJ+fVVrV6Lz3eCqn8m0X5HbYp9Jsm4utuM8IiT20DYXttXcFr6XvsQeckNNr
 aEMMV6E+HQSJytZrad1dvNyeAMOYXtHlOTAcR4jGAx5BXjCnjx25vUG2FNCd73B2f4lo
 9EZE+0ulMET1jAB2xhhdf+62B50ZXZlJ2sE8sDckbDTTlE5XIJV0IbwpWuae8kIVOulH
 dbgA==
X-Gm-Message-State: AOAM531w1jqnszehgqiA+JojVcL2NSPf4jh6QG99mTB9j3/Rgo9P47Kz
 fy9QkN+0tkydr8lILw+4ftg=
X-Google-Smtp-Source: ABdhPJw6wo9UfsueK7zwUEdBiXyulhloHoo7tJOOi5G/w3ZOB2vQO6EzIikD7FHEdW9/vLMUElFGhQ==
X-Received: by 2002:a17:90a:2a8e:: with SMTP id
 j14mr567651pjd.208.1628535296794; 
 Mon, 09 Aug 2021 11:54:56 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b4fb:63af:3274:9f8d])
 by smtp.gmail.com with ESMTPSA id 81sm21575374pfv.185.2021.08.09.11.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 11:54:55 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Aug 2021 11:54:49 -0700
Message-Id: <20210809185449.2565768-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.46 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDAQQ-0004wK-Eg
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce blk_alloc_mode mount option
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
v2: changed the <num> initialization way.
---
 Documentation/filesystems/f2fs.rst | 16 ++++++++++
 fs/f2fs/f2fs.h                     | 20 +++++++++++++
 fs/f2fs/gc.c                       |  5 +++-
 fs/f2fs/segment.c                  | 12 ++++++++
 fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ff9e7cc97c65..a0ca963fda20 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -312,6 +312,22 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 Documentation/block/inline-encryption.rst.
 atgc			 Enable age-threshold garbage collection, it provides high
 			 effectiveness and efficiency on background GC.
+blk_alloc_mode=%s	 Control block allocation mode. This is a developer option
+			 for experiments to simulate filesystem fragmentation and
+			 after-GC situation. The developers use this mode to understand
+			 filesystem fragmentation and after-GC condition well, and
+			 eventually get the insight to handle them better.
+			 This supports "normal", "seg_random" and "blk_random:<num>" modes.
+			 In "normal" mode (default), f2fs allocates blocks in the normal way.
+			 In "seg_random", f2fs allocates a new segment in ramdom position.
+			 With this, we can simulate the after-GC condition.
+			 In "blk_random:<num>", we can make f2fs allocate only 1..<num>
+			 blocks in a row and forcibly change the segment randomly.
+			 You can set the <num> within 1 .. 512 number.
+			 With this, the newly allocated blocks will be scatter throughout
+			 the whole partition and we can simulate filesystem fragmentation
+			 condition. Please, use this option for your experiments and we
+			 strongly recommand a filesystem format after using this option.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fccee18ab776..aed09e8c0fce 100644
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
@@ -3619,6 +3624,21 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
+#define MIN_BLK_ALLOC_RANDOM	1
+#define MAX_BLK_ALLOC_RANDOM	512
+
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
index 9ead6d2e703b..ef14f3e8b29a 100644
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
+				if (size < MIN_BLK_ALLOC_RANDOM)
+					size = MIN_BLK_ALLOC_RANDOM;
+				else if (size > MAX_BLK_ALLOC_RANDOM)
+					size = MAX_BLK_ALLOC_RANDOM;
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
+	F2FS_OPTION(sbi).blk_alloc_random_max = MAX_BLK_ALLOC_RANDOM;
+	sbi->blk_alloc_remained = MAX_BLK_ALLOC_RANDOM;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
 
-- 
2.32.0.605.g8dce9f2422-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
