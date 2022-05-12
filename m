Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942852568A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 22:50:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npFlc-0005dR-9d; Thu, 12 May 2022 20:50:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npFla-0005dL-T1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 20:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a5h3RRM7xDEmtp0InjQu5vEd1il2yPnpRUhd9lz0XXQ=; b=aeDkL8M7EGkkJWBR16LnadAE49
 T7FOvjPy9ltMxrMIEtdqLuAk9/bIGLYGXQKpVNqUoObPluYT0NgLSqAcK2d343hVyR1SKdpaE+pIG
 5dVdwLlEOLstZ0rUYlQh7Vg4w1DuZT1Ehed5bZqS3uoZ2j9Nm8h/cI3K9dKV27JZjOaQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a5h3RRM7xDEmtp0InjQu5vEd1il2yPnpRUhd9lz0XXQ=; b=RSETpGX8lOEVAZK3lQ5zdInsMH
 02fcDN7IAB/NpAlTZjYcLvbfgLflxJCqMKW2TRNlxJBU87t26eVqa7Dj/rkxx9pAdno8CDAWdvbxO
 FcZNYZZh8I/I+Umz3V5yCJYZUQnszlcRq55wZ0lI8QWH3Gy2YsX6k5bGrSTzQOoskr1U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npFlX-0005w6-RO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 20:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D1AE61E72
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 20:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93C8C385B8;
 Thu, 12 May 2022 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652388621;
 bh=s6aW6e11wP98+FSUafeJLEk+hn3qZAdUCOod1nr9YxM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=q/lqGLktXhJSyaNmkh061WnB/Mg8XM1/+GKfi+xFJWWfRXJ1DFuT2I8Plt7e/z5ow
 FR9P2Qtj8RMHzjF8dlfE26Xn7+pGC/QnaZ0IdBXBbhVe3wQme++KIQOH03OuZTPEd1
 9eN6ISBOXB5LViOtNCqzb7inke1dCJwhW7g4y2oX5Oiih2WP3f5WmCR/FyH2eylweb
 JIBZNnDkfSD8NIoKEkSUImhTk1NQlcfFnuv4UTcr2NIoLzuGKhHB6ypq8fWHtvNNgd
 ugWNsc2S/aHW1w4wPRBDIOfIHgqbJ/2b7/yktJrk0eSSYN2ak74EpzJJLGwww0z4hf
 x6pnfF0eojnHA==
Date: Thu, 12 May 2022 13:50:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Yn1zC6MUZOEbSlWK@google.com>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220506232032.1264078-4-jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The f2fs_gc uses a bitmap to indicate pinned sections, but
 when disabling chckpoint, we call f2fs_gc() with NULL_SEGNO which selects
 the same dirty segment as a victim all the time, resulting in check [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npFlX-0005w6-RO
Subject: Re: [f2fs-dev] [PATCH 4/5 v2] f2fs: do not stop GC when requiring a
 free section
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
segment as a victim all the time, resulting in checkpoint=disable failure,
for example. Let's pick another one, if we fail to collect it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - refactor the code path to avoid ambiguous condition like BG_GC/sec_freed

 fs/f2fs/f2fs.h              |  1 +
 fs/f2fs/file.c              | 12 ++++++++----
 fs/f2fs/gc.c                | 14 +++++++++-----
 fs/f2fs/segment.c           |  3 ++-
 fs/f2fs/super.c             |  3 ++-
 include/trace/events/f2fs.h | 11 ++++++++---
 6 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9920b2d6af8f..492af5b96de1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1271,6 +1271,7 @@ struct f2fs_gc_control {
 	bool no_bg_gc;			/* check the space and stop bg_gc */
 	bool should_migrate_blocks;	/* should migrate blocks */
 	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
+	unsigned int nr_free_secs;	/* # of free sections to do GC */
 };
 
 /* For s_flag in struct f2fs_sb_info */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d0547bef0851..216081ea8c81 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1650,7 +1650,8 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
 			.init_gc_type = FG_GC,
 			.should_migrate_blocks = false,
-			.err_gc_skipped = true };
+			.err_gc_skipped = true,
+			.nr_free_secs = 0 };
 	pgoff_t pg_start, pg_end;
 	loff_t new_size = i_size_read(inode);
 	loff_t off_end;
@@ -2350,7 +2351,8 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
 			.no_bg_gc = false,
-			.should_migrate_blocks = false };
+			.should_migrate_blocks = false,
+			.nr_free_secs = 0 };
 	__u32 sync;
 	int ret;
 
@@ -2391,7 +2393,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 			.init_gc_type = range->sync ? FG_GC : BG_GC,
 			.no_bg_gc = false,
 			.should_migrate_blocks = false,
-			.err_gc_skipped = range->sync };
+			.err_gc_skipped = range->sync,
+			.nr_free_secs = 0 };
 	u64 end;
 	int ret;
 
@@ -2837,7 +2840,8 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	struct f2fs_gc_control gc_control = {
 			.init_gc_type = FG_GC,
 			.should_migrate_blocks = true,
-			.err_gc_skipped = true };
+			.err_gc_skipped = true,
+			.nr_free_secs = 0 };
 	int ret;
 
 	if (!capable(CAP_SYS_ADMIN))
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e275b72bc65f..10b24b0f13a5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -147,6 +147,7 @@ static int gc_thread_func(void *data)
 
 		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
 		gc_control.no_bg_gc = foreground;
+		gc_control.nr_free_secs = foreground ? 1 : 0;
 
 		/* if return value is not zero, no victim was selected */
 		if (f2fs_gc(sbi, &gc_control))
@@ -1761,6 +1762,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	unsigned int skipped_round = 0, round = 0;
 
 	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
+				gc_control->nr_free_secs,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
 				get_pages(sbi, F2FS_DIRTY_IMETA),
@@ -1823,12 +1825,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	if (gc_type == FG_GC)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
-	if (gc_control->init_gc_type == FG_GC)
-		goto stop;
-
-	if (!has_not_enough_free_secs(sbi,
-			(gc_type == FG_GC) ? sec_freed : 0, 0))
+	if (gc_control->init_gc_type == FG_GC ||
+	    !has_not_enough_free_secs(sbi,
+				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
+		if (gc_mode == FG_GC && sec_freed < gc_control->nr_free_secs)
+			goto go_gc_more;
 		goto stop;
+	}
 
 	/* FG_GC stops GC by skip_count */
 	if (gc_type == FG_GC) {
@@ -1849,6 +1852,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		if (ret)
 			goto stop;
 	}
+go_gc_more:
 	segno = NULL_SEGNO;
 	goto gc_more;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b4f2b1d2cca..0a4180f64291 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -404,7 +404,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 				.init_gc_type = BG_GC,
 				.no_bg_gc = true,
 				.should_migrate_blocks = false,
-				.err_gc_skipped = false };
+				.err_gc_skipped = false,
+				.nr_free_secs = 1 };
 			f2fs_down_write(&sbi->gc_lock);
 			f2fs_gc(sbi, &gc_control);
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a28c27eed6d0..63daae67a9d9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2080,7 +2080,8 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 			.victim_segno = NULL_SEGNO,
 			.init_gc_type = FG_GC,
 			.should_migrate_blocks = false,
-			.err_gc_skipped = true };
+			.err_gc_skipped = true,
+			.nr_free_secs = 1 };
 
 		f2fs_down_write(&sbi->gc_lock);
 		err = f2fs_gc(sbi, &gc_control);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 54ec9e543f09..16c67ede85b6 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -645,18 +645,21 @@ TRACE_EVENT(f2fs_background_gc,
 TRACE_EVENT(f2fs_gc_begin,
 
 	TP_PROTO(struct super_block *sb, int gc_type, bool no_bg_gc,
+			unsigned int nr_free_secs,
 			long long dirty_nodes, long long dirty_dents,
 			long long dirty_imeta, unsigned int free_sec,
 			unsigned int free_seg, int reserved_seg,
 			unsigned int prefree_seg),
 
-	TP_ARGS(sb, gc_type, no_bg_gc, dirty_nodes, dirty_dents, dirty_imeta,
+	TP_ARGS(sb, gc_type, no_bg_gc, nr_free_secs, dirty_nodes,
+		dirty_dents, dirty_imeta,
 		free_sec, free_seg, reserved_seg, prefree_seg),
 
 	TP_STRUCT__entry(
 		__field(dev_t,		dev)
 		__field(int,		gc_type)
 		__field(bool,		no_bg_gc)
+		__field(unsigned int,	nr_free_secs)
 		__field(long long,	dirty_nodes)
 		__field(long long,	dirty_dents)
 		__field(long long,	dirty_imeta)
@@ -670,6 +673,7 @@ TRACE_EVENT(f2fs_gc_begin,
 		__entry->dev		= sb->s_dev;
 		__entry->gc_type	= gc_type;
 		__entry->no_bg_gc	= no_bg_gc;
+		__entry->nr_free_secs	= nr_free_secs;
 		__entry->dirty_nodes	= dirty_nodes;
 		__entry->dirty_dents	= dirty_dents;
 		__entry->dirty_imeta	= dirty_imeta;
@@ -679,12 +683,13 @@ TRACE_EVENT(f2fs_gc_begin,
 		__entry->prefree_seg	= prefree_seg;
 	),
 
-	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nodes = %lld, "
-		"dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
+	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nr_free_secs = %u, "
+		"nodes = %lld, dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
 		"rsv_seg:%d, prefree_seg:%u",
 		show_dev(__entry->dev),
 		show_gc_type(__entry->gc_type),
 		(__entry->gc_type == BG_GC) ? __entry->no_bg_gc : -1,
+		__entry->nr_free_secs,
 		__entry->dirty_nodes,
 		__entry->dirty_dents,
 		__entry->dirty_imeta,
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
