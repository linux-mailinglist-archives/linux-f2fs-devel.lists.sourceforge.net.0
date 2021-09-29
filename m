Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581F41CB8F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Sep 2021 20:12:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVe44-0000Yc-M3; Wed, 29 Sep 2021 18:12:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mVe43-0000YR-CO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Sep 2021 18:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nsNTwFWS2WL84yBzPap7vLIN/SvfzO3gu+2ROTwIrU4=; b=YbWCshaITha1MMYQbSG0N31vBT
 EtULlqCFU4xeFS3l+7fG9jReAyFi5LCR0FUnn8kwwnN36JrD+TBHNLZyl7TtwooLL9VixFL4UE2Iz
 WxIQuwV6f24fI8/dn5WY/l3Ez4CVBu5o1C3BAqrwujxyVoqTIY79wRzeYgGArUqgmytA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nsNTwFWS2WL84yBzPap7vLIN/SvfzO3gu+2ROTwIrU4=; b=k
 RxwBkrfaVSY8UnWNQHRk8hsin3QEifMkurk8dNPyPRVMUMk/2BoiMDag7cnkQC/pEMs8ty6JvWStS
 SEt9vX2bYklf55sPfOg8ddNJhgQtBAROy9e86jOeuekCQ0aD9IOfss/dmbkU1uBE64rQ4bwMLAqUE
 78Oy3qGtlKSL8R8I=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mVe3y-0003sH-3z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Sep 2021 18:12:19 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2688813pji.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Sep 2021 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nsNTwFWS2WL84yBzPap7vLIN/SvfzO3gu+2ROTwIrU4=;
 b=GzCC7m5OFeNibX4Qx6lXnns5xRE9dfTsVqF2xzaaPupnPngd3FDrTFT/JWUcXCkS5U
 nEcFO6IwHImK9Lx7c70h2EowfW0K1OPrfVLQrtD6vYttFqeR3CFqPVNE80nT36xTDSpT
 ArNAwPpe1CbPtNxhqKLekth84ZVCm80Izqr9oyDjpqXTPESRtKTWQohiJj2ipQUlAJLM
 xQve1Xh3q73M2oc/vPaAnS2vs/PNxVSvXPcD1hVaz4hozpjwrn2Z6IbKVkKi5Ul+l4rj
 DpkJkXoy6TboZQvu4uxm5H9+yuTxrliPzCUYUXwx+v11ZLxhj+OU4VtauWfzfMQzQ4Ui
 5XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nsNTwFWS2WL84yBzPap7vLIN/SvfzO3gu+2ROTwIrU4=;
 b=JSY3klO9e5cJDVSEoX0oJCEWR1SH6KDVy7SP7Bx4mp/0L7tF9HpsGCk0qNk8yWs50t
 2d5vlhOVy3Bj5KvCzDLBBs22ztbJAuaTLk9pUJmhag/pc6diiMVvpiEa6kpPKv88lNqM
 dQevPHqJ2eLYwY2cK7al/wKjCndWG+Rv4ElfcA9G3W32ceAOF8g4Ny60MwAjy4uzjmpc
 LhoFPYon0yBASFcihbeppdoTYvfUn33fk0T7EM4BqE+MRTL5q2vQvB8nHYA2UgI8K6N6
 k13qjV0EDNyZVaYiS+vf+XzxLWq+l478F5C9Zxk41EAe2yXx23YmnZyz2g1vdJdrgg1h
 /bWA==
X-Gm-Message-State: AOAM531dFmpLiTP0UfegsROS7G5VdmshxAlKXh9ZqTsdA16xqn/8hmme
 TDOWfYfRunPupER9AdWCpz8=
X-Google-Smtp-Source: ABdhPJxcGQRUfOL4wmQdebAGp+vh4DcWuX/Vn21S3pRhwHwt+Mo8dnkgkmkmAl3sKa8cQoHQ3JXW4A==
X-Received: by 2002:a17:90b:104d:: with SMTP id
 gq13mr8071774pjb.101.1632939128197; 
 Wed, 29 Sep 2021 11:12:08 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:dbe5:409c:18b6:140e])
 by smtp.gmail.com with ESMTPSA id s10sm2527108pjn.38.2021.09.29.11.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 11:12:07 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 29 Sep 2021 11:12:03 -0700
Message-Id: <20210929181203.1606675-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added two options into "mode=" mount option
 to make it possible for developers to simulate filesystem
 fragmentation/after-GC
 situation itself. The developers use these modes to understand filesystem
 f [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mVe3y-0003sH-3z
Subject: [f2fs-dev] [PATCH v5] f2fs: introduce fragment allocation mode
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
developers to simulate filesystem fragmentation/after-GC situation
itself. The developers use these modes to understand filesystem
fragmentation/after-GC condition well, and eventually get some
insights to handle them better.

"fragment:segment": f2fs allocates a new segment in ramdom position.
		With this, we can simulate the after-GC condition.
"fragment:block" : We can scatter block allocation with
		"max_fragment_chunk" and "max_fragment_hole" sysfs
		nodes. f2fs will allocate 1..<max_fragment_chunk>
		blocks in a chunk and make a hole in the length of
		1..<max_fragment_hole> by turns	in a newly allocated
		free segment. Plus, this mode implicitly enables
		"fragment:segment" option for more randomness.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v5: get back to original two modes.
v4: implicitly enabled "fragment:segment" option only in
    "fragment:rand_block".
v3: divided "fragment:block" mode and fixed a race condition related to
    making chunks.
v2: changed mode name and added sysfs nodes to control the fragmentation
    pattern.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 16 ++++++++++++++++
 Documentation/filesystems/f2fs.rst      | 18 ++++++++++++++++++
 fs/f2fs/f2fs.h                          | 19 +++++++++++++++++--
 fs/f2fs/gc.c                            |  5 ++++-
 fs/f2fs/segment.c                       | 20 ++++++++++++++++++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/super.c                         | 10 ++++++++++
 fs/f2fs/sysfs.c                         | 20 ++++++++++++++++++++
 8 files changed, 104 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index f627e705e663..b268e3e18b4a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -512,3 +512,19 @@ Date:		July 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can	control the multiplier value of	bdi device readahead window size
 		between 2 (default) and 256 for POSIX_FADV_SEQUENTIAL advise option.
+
+What:		/sys/fs/f2fs/<disk>/max_fragment_chunk
+Date:		August 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	With "mode=fragment:block" mount options, we can scatter block allocation.
+		f2fs will allocate 1..<max_fragment_chunk> blocks in a chunk and make a hole
+		in the length of 1..<max_fragment_hole> by turns. This value can be set
+		between 1..512 and the default value is 4.
+
+What:		/sys/fs/f2fs/<disk>/max_fragment_hole
+Date:		August 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	With "mode=fragment:block" mount options, we can scatter block allocation.
+		f2fs will allocate 1..<max_fragment_chunk> blocks in a chunk and make a hole
+		in the length of 1..<max_fragment_hole> by turns. This value can be set
+		between 1..512 and the default value is 4.
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 09de6ebbbdfa..4294db649fa8 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -201,6 +201,24 @@ fault_type=%d		 Support configuring fault injection type, should be
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
+			 "fragment:segment" and "fragment:block" are newly added here.
+			 These are developer options for experiments to simulate filesystem
+			 fragmentation/after-GC situation itself. The developers use these
+			 modes to understand filesystem fragmentation/after-GC condition well,
+			 and eventually get some insights to handle them better.
+			 In "fragment:segment", f2fs allocates a new segment in ramdom
+			 position. With this, we can simulate the after-GC condition.
+			 In "fragment:block", we can scatter block allocation with
+			 "max_fragment_chunk" and "max_fragment_hole" sysfs nodes.
+			 We added some randomness to both chunk and hole size to make
+			 it close to realistic IO pattern. So, in this mode, f2fs will allocate
+			 1..<max_fragment_chunk> blocks in a chunk and make a hole in the
+			 length of 1..<max_fragment_hole> by turns. With this, the newly
+			 allocated blocks will be scattered throughout the whole partition.
+			 Note that "fragment:block" implicitly enables "fragment:segment"
+			 option for more randomness.
+			 Please, use these options for your experiments and we strongly
+			 recommend to re-format the filesystem after using these options.
 io_bits=%u		 Set the bit size of write IO requests. It should be set
 			 with "mode=lfs".
 usrquota		 Enable plain user disk quota accounting.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c24f03e054cb..6b574c3d426e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1285,8 +1285,10 @@ enum {
 };
 
 enum {
-	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
-	FS_MODE_LFS,		/* use lfs allocation only */
+	FS_MODE_ADAPTIVE,		/* use both lfs/ssr allocation */
+	FS_MODE_LFS,			/* use lfs allocation only */
+	FS_MODE_FRAGMENT_SEG,		/* segment fragmentation mode */
+	FS_MODE_FRAGMENT_BLK,		/* block fragmentation mode */
 };
 
 enum {
@@ -1757,6 +1759,9 @@ struct f2fs_sb_info {
 
 	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
 
+	int max_fragment_chunk;			/* max chunk size for block fragmentation mode */
+	int max_fragment_hole;			/* max hole size for block fragmentation mode */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
@@ -3517,6 +3522,16 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
+#define DEF_FRAGMENT_SIZE	4
+#define MIN_FRAGMENT_SIZE	1
+#define MAX_FRAGMENT_SIZE	512
+
+static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG ||
+		F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK;
+}
+
 /*
  * checkpoint.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2c18443972b6..72cfad99bbbe 100644
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
+	if (f2fs_need_rand_seg(sbi))
+		p->offset = prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
+	else if (test_opt(sbi, NOHEAP) &&
 		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
 		p->offset = 0;
 	else
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..d648297a0132 100644
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
+	if (f2fs_need_rand_seg(sbi))
+		return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
 
 	/* if segs_per_sec is large than 1, we need to keep original policy. */
 	if (__is_large_section(sbi))
@@ -2681,6 +2684,9 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	curseg->next_segno = segno;
 	reset_curseg(sbi, type, 1);
 	curseg->alloc_type = LFS;
+	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
+		curseg->fragment_remained_chunk =
+				prandom_u32() % sbi->max_fragment_chunk + 1;
 }
 
 static int __next_free_blkoff(struct f2fs_sb_info *sbi,
@@ -2707,12 +2713,22 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
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
+		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK) {
+			/* To allocate block chunks in different sizes, use random number */
+			if (--seg->fragment_remained_chunk <= 0) {
+				seg->fragment_remained_chunk =
+				   prandom_u32() % sbi->max_fragment_chunk + 1;
+				seg->next_blkoff +=
+				   prandom_u32() % sbi->max_fragment_hole + 1;
+			}
+		}
+	}
 }
 
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 89fff258727d..46fde9f3f28e 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -314,6 +314,7 @@ struct curseg_info {
 	unsigned short next_blkoff;		/* next block offset to write */
 	unsigned int zone;			/* current zone number */
 	unsigned int next_segno;		/* preallocated segment */
+	int fragment_remained_chunk;		/* remained block size in a chunk for block fragmentation mode */
 	bool inited;				/* indicate inmem log is inited */
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 49e153fd8183..495a76e77927 100644
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
@@ -3515,6 +3523,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
 	sbi->migration_granularity = sbi->segs_per_sec;
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
+	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
+	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a1a3e0f6d658..54fc600a07b3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -551,6 +551,22 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "max_fragment_chunk")) {
+		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
+			sbi->max_fragment_chunk = t;
+		else
+			return -EINVAL;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "max_fragment_hole")) {
+		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
+			sbi->max_fragment_hole = t;
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
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -859,6 +877,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
+	ATTR_LIST(max_fragment_chunk),
+	ATTR_LIST(max_fragment_hole),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.33.0.685.g46640cef36-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
