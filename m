Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E33F7C7D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Aug 2021 20:58:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIy64-000439-3c; Wed, 25 Aug 2021 18:58:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mIy62-00042w-Nz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 18:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLij9JXIQFxUcB6cZli9TE9DqsP/Ai0bv78Lg1l5b8k=; b=Wp6f+5pzUeTH2IiSbDkoxaeDoI
 KAVZfKOc9jJQwZoYgDcCRX8Jj7C1NbJkEgkUOgh+4w5njnqSzpEKBmwz5NK4g9c/FjacHu2Z9+wnF
 M0TjbGyfIleoxVe8XSwWQvGhu9tEGsCbzk13vlNziX9Qq03W9clf9zyFVOR3kDm70R3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hLij9JXIQFxUcB6cZli9TE9DqsP/Ai0bv78Lg1l5b8k=; b=h
 ydTkSNB/5iy0l6QpE4FKzZC3gq0yA/jzlBBofTuVMMyvOFDfMBfYzPsYK/rs1LbL6X5pNepH1Ll7z
 LBHMCva3L+L/vQ5jf6LAcEevIxoR1hKELO/LQNWp/bRSmmf1DnjRs9sm0a15ZGmZWHXBaqX/YTaBI
 +9E+FibM3tQvDAGc=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mIy61-000vTN-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 18:57:58 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so517610pjt.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Aug 2021 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hLij9JXIQFxUcB6cZli9TE9DqsP/Ai0bv78Lg1l5b8k=;
 b=gpjcIr4rozu0rHf/2Q2/UxLfe/Z7pkMwI8LI8Uqg00xoeEiwWwRzLe6Xffurze16Ft
 88BllI6ZS5CFwskyKUfJa73CZCJ0x15Lt+1vEQyx94gJWt7bR9CKS/rlGJkxXGpvN2n9
 vONRYqrcRStyYrm6IRclA68Zh9Y+lSvv8Nns8nOjAHwvA6i/0vqvO7fUXsDBLy5d1xJk
 E16XiNrV8Fly2WPrIuOlDsLUwrBuLNXCYatMuQuLOh6nF9bf9s7BEAsZoZfdybg3Gsas
 daOfYDJpbETLt8LmXKhrOSu+YbukIsvi5A4y4UIY8QOI3M6iz25Wk0Xko9DSCoKNmlFQ
 c2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hLij9JXIQFxUcB6cZli9TE9DqsP/Ai0bv78Lg1l5b8k=;
 b=J5J5nBNDsSAKNm1KCzwqKfiu34AQvOHS5uca3eJ5v9SwQgzoK8QOGvGQVDB6cgVl+2
 SseFQNFdwmP2xtgCoQkaF0CS3ilABDckpSuXff4f2opL0Ry9GOLT9HWbqv382YdwXK9w
 xjLtRW+vfajMPKZ197qg+a3swxyGtfuETW37akDI98Qp1TMsjj4/b9G3VYpYXH9SsBPW
 lJNqhb4nPKlb4JpBiTMVvW2VlY215ukcvkUqBSR867IdIOI0vHnTZEDngPsdF/tO6mnj
 wgJyIVUYqzz/WkkxPmGnEj8qQwgMK+FHpYNSAIAg6IIR0JVPzWpZJ+o1QN0RMvZihiuC
 aStg==
X-Gm-Message-State: AOAM530ne8iwOLBfhxFMm7FW/m7A2EBxLRlTlpYotgN8g2g4kfoRKB9G
 VOvXJissFahk9dTk82DKQ4g=
X-Google-Smtp-Source: ABdhPJw+6XVGm6rVKeeHB0z1TS5p8E4xhsAubWffKfqLsJ26M4vr5z87ubtO/Q5FurlwHhVLk+dQ6Q==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id
 d23-20020a170902b717b029011afae3ba7cmr114796pls.28.1629917871990; 
 Wed, 25 Aug 2021 11:57:51 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:211e:7c1e:c467:6ea4])
 by smtp.gmail.com with ESMTPSA id i1sm6449322pjs.31.2021.08.25.11.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:57:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 25 Aug 2021 11:57:47 -0700
Message-Id: <20210825185747.1627497-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added two options into "mode=" mount option
 to make it possible for developers to make the filesystem fragmented or
 simulate
 filesystem fragmentation/after-GC situation itself. The developers use thes
 [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mIy61-000vTN-Qm
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce fragment allocation mode
 mount option
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

Added two options into "mode=" mount option to make it possible for
developers to make the filesystem fragmented or simulate filesystem
fragmentation/after-GC situation itself. The developers use these modes
to understand filesystem fragmentation/after-GC condition well,
and eventually get some insights to handle them better.

"fragment:segment": f2fs allocates a new segment in ramdom position.
                    With this, we can simulate the after-GC condition.
"fragment:block"  : We can scatter block allocation with
                    "fragment_chunk_max" and "fragment_hole_max" sysfs
                    nodes. f2fs will allocate 1..<fragment_chunk_max>
                    blocks in a chunk and make a hole in the length of
                    1..<fragment_hole_max> by turns in a newly allocated
                    free segment.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: changed mode name and added sysfs nodes to control the fragmentation
    pattern.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 18 ++++++++++++++++++
 Documentation/filesystems/f2fs.rst      | 16 ++++++++++++++++
 fs/f2fs/f2fs.h                          | 16 ++++++++++++++++
 fs/f2fs/gc.c                            |  5 ++++-
 fs/f2fs/segment.c                       | 17 +++++++++++++++--
 fs/f2fs/super.c                         | 11 +++++++++++
 fs/f2fs/sysfs.c                         | 20 ++++++++++++++++++++
 7 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index f627e705e663..dba3997895ef 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -512,3 +512,21 @@ Date:		July 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can	control the multiplier value of	bdi device readahead window size
 		between 2 (default) and 256 for POSIX_FADV_SEQUENTIAL advise option.
+
+What:		/sys/fs/f2fs/<disk>/fragment_chunk_max
+Date:		August 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	With "mode=fragment:block" mount option, we can scatter block allocation.
+		Using this node, f2fs will allocate 1..<fragment_chunk_max> blocks in a chunk
+		and make a hole in the length of 1..<fragment_hole_max> by turns in a newly
+		allocated free segment. This value can be set between 1..512 and the default
+		value is 4.
+
+What:		/sys/fs/f2fs/<disk>/fragment_hole_max
+Date:		August 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	With "mode=fragment:block" mount option, we can scatter block allocation.
+		Using this node, f2fs will allocate 1..<fragment_chunk_max> blocks in a chunk
+		and make a hole in the length of 1..<fragment_hole_max> by turns in a newly
+		allocated free segment. This value can be set between 1..512 and the default
+		value is 4.
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 09de6ebbbdfa..d2ddc1273f67 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -201,6 +201,22 @@ fault_type=%d		 Support configuring fault injection type, should be
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
+			 "fragment:segment" and "fragment:block" are newly added here.
+			 These are developer options for experiments to make the filesystem
+			 fragmented or simulate filesystem fragmentation/after-GC situation
+			 itself. The developers use these modes to understand filesystem
+			 fragmentation/after-GC condition well, and eventually get some
+			 insights to handle them better.
+			 In "fragment:segment", f2fs allocates a new segment in ramdom
+			 position. With this, we can simulate the after-GC condition.
+			 In "fragment:block", we can scatter block allocation with
+			 "fragment_chunk_max" and "fragment_hole_max" sysfs nodes. f2fs will
+			 allocate 1..<fragment_chunk_max> blocks in a chunk and make
+			 a hole in the length of 1..<fragment_hole_max> by turns in a newly
+			 allocated free segment. With this, the newly allocated blocks will
+			 be scattered throughout the whole partition. Please, use these
+			 options for your experiments and we strongly recommend to re-format
+			 the filesystem after using these options.
 io_bits=%u		 Set the bit size of write IO requests. It should be set
 			 with "mode=lfs".
 usrquota		 Enable plain user disk quota accounting.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c24f03e054cb..4e591fc75ee7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1287,6 +1287,8 @@ enum {
 enum {
 	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
 	FS_MODE_LFS,		/* use lfs allocation only */
+	FS_MODE_FRAGMENT_SEG,	/* segment fragmentation mode */
+	FS_MODE_FRAGMENT_BLK,	/* block fragmentation mode */
 };
 
 enum {
@@ -1757,6 +1759,10 @@ struct f2fs_sb_info {
 
 	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
 
+	int fragment_chunk_max;		/* the maximum chunk size for fragment:block allocation mode */
+	int fragment_hole_max;		/* the maximum hole size for fragment:block allocation mode */
+	int fragment_remained_chunk;	/* remained size to make a full chunk */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
@@ -3517,6 +3523,16 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
+#define DEF_FRAGMENT_SIZE	4
+#define MIN_FRAGMENT_SIZE	1
+#define MAX_FRAGMENT_SIZE	512
+
+static inline bool f2fs_fragment_mode(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG ||
+		F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK;
+}
+
 /*
  * checkpoint.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2c18443972b6..14046fb19a20 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/sched/signal.h>
+#include <linux/random.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -257,7 +258,9 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 		p->max_search = sbi->max_victim_search;
 
 	/* let's select beginning hot/small space first in no_heap mode*/
-	if (test_opt(sbi, NOHEAP) &&
+	if (f2fs_fragment_mode(sbi))
+		p->offset = prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
+	else if (test_opt(sbi, NOHEAP) &&
 		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
 		p->offset = 0;
 	else
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..0063c8ce18ac 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -15,6 +15,7 @@
 #include <linux/timer.h>
 #include <linux/freezer.h>
 #include <linux/sched/signal.h>
+#include <linux/random.h>
 
 #include "f2fs.h"
 #include "segment.h"
@@ -2630,6 +2631,8 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 	unsigned short seg_type = curseg->seg_type;
 
 	sanity_check_seg_type(sbi, seg_type);
+	if (f2fs_fragment_mode(sbi))
+		return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
 
 	/* if segs_per_sec is large than 1, we need to keep original policy. */
 	if (__is_large_section(sbi))
@@ -2707,12 +2710,22 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
 static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
 				struct curseg_info *seg)
 {
-	if (seg->alloc_type == SSR)
+	if (seg->alloc_type == SSR) {
 		seg->next_blkoff =
 			__next_free_blkoff(sbi, seg->segno,
 						seg->next_blkoff + 1);
-	else
+	} else {
 		seg->next_blkoff++;
+		/* To allocate block chunks in different sizes, use random number */
+		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK) {
+			if (--sbi->fragment_remained_chunk <= 0) {
+				sbi->fragment_remained_chunk =
+				    prandom_u32() % sbi->fragment_chunk_max + 1;
+				seg->next_blkoff +=
+				    prandom_u32() % sbi->fragment_hole_max + 1;
+			}
+		}
+	}
 }
 
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 49e153fd8183..112b50bed186 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -817,6 +817,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
 			} else if (!strcmp(name, "lfs")) {
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
+			} else if (!strcmp(name, "fragment:segment")) {
+				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_SEG;
+			} else if (!strcmp(name, "fragment:block")) {
+				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_BLK;
 			} else {
 				kfree(name);
 				return -EINVAL;
@@ -1897,6 +1901,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, "adaptive");
 	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
 		seq_puts(seq, "lfs");
+	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG)
+		seq_puts(seq, "fragment:segment");
+	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
+		seq_puts(seq, "fragment:block");
 	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
 	if (test_opt(sbi, RESERVE_ROOT))
 		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
@@ -3515,6 +3523,9 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
 	sbi->migration_granularity = sbi->segs_per_sec;
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
+	sbi->fragment_chunk_max = DEF_FRAGMENT_SIZE;
+	sbi->fragment_hole_max = DEF_FRAGMENT_SIZE;
+	sbi->fragment_remained_chunk = DEF_FRAGMENT_SIZE;
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a1a3e0f6d658..42c41efd21d3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -551,6 +551,22 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "fragment_chunk_max")) {
+		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
+			sbi->fragment_chunk_max = t;
+		else
+			return -EINVAL;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "fragment_hole_max")) {
+		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
+			sbi->fragment_hole_max = t;
+		else
+			return -EINVAL;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -781,6 +797,8 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fragment_chunk_max, fragment_chunk_max);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fragment_hole_max, fragment_hole_max);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -859,6 +877,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
+	ATTR_LIST(fragment_chunk_max),
+	ATTR_LIST(fragment_hole_max),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.33.0.259.gc128427fd7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
