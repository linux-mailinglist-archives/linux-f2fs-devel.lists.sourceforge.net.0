Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA184E1C35
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Mar 2022 16:11:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nVxDm-0005xP-3U; Sun, 20 Mar 2022 15:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nVxDl-0005xD-6U
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Mar 2022 15:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8IJ5ZQTbEK10KMmlDFbWkHlDqRF1LKVAV8jEQSUhpo=; b=OLEUVVjopsRGgGHE+IE0YfIbv3
 oFE0er8pCrSf6EkqUc81oq/F8bn3koWVOo7byAqqSUDj+TtIjK0tc1xCn2XM+TGVsOyIonTzcQuKi
 SLo7yScmLmpMr37B7L1kKPhAbwSg6Yb6IMSqLuEVaslk+G+Cli58B10vVW6U1QgLImNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m8IJ5ZQTbEK10KMmlDFbWkHlDqRF1LKVAV8jEQSUhpo=; b=PiXIxYizf6NF2Vk7L5dNI46wjF
 nECOMOp26nkEDZj0u3V2B6ZSP7PnhxCsnv9hx5suue+sfz95uZa0ftEWWl7ZVoHcxAysm6lTB5D56
 lKyjVs0j1aesc2ILujGVhacRqUL8Jg/sQqHIecgfrFnsQCvclEfmWexliLY+0SA8l63s=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nVxDe-0001Lh-SE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Mar 2022 15:11:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2F5D7CE1011;
 Sun, 20 Mar 2022 15:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F7FC340F0;
 Sun, 20 Mar 2022 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647789094;
 bh=OGIR071Y0nLBUXvDFQftBvvXHEEgWc0ChPdtkIhsxP4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=StwmJyUjjHSSJgWmfbb5r/m5tA4lnYXYYAR+T9PrZVdAbf+vqacRr/PlZbkCU7//1
 dlKqVZnhmJbquf/OTzb4d20x4wcj7PXLyH4TvZE9122hITcBtjrtUnRtT5FwWGA/b3
 XFk9+Au4cEeznI/L2lBUnH/uMmHxLaQrKMhP3lJZhFgfUypFuJ7DUE/r6YscviKfc0
 0M2ETvt+F2XhpcP5USrY6zIbnrtcMaGBlQXkQm5Va4bSxluR7Yh6kwitgzsoXFKhU3
 +xtFX36NnWX+6O3PUY4aTJFpkHlK5i1leIFP0UvihUKj7vKanNK2EYAK93y/u3nh0u
 Wdx37vfZ7o0KQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 20 Mar 2022 23:11:19 +0800
Message-Id: <20220320151119.837552-3-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220320151119.837552-1-chao@kernel.org>
References: <20220320151119.837552-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, during foreground GC, if victims contain data
 of pinned file, it will fail migration of the data, and meanwhile i_gc_failures
 of that pinned file may increase, and when it exceeds threshol [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nVxDe-0001Lh-SE
Subject: [f2fs-dev] [PATCH 3/3] f2fs: give priority to select unpinned
 section for foreground GC
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, during foreground GC, if victims contain data of pinned file,
it will fail migration of the data, and meanwhile i_gc_failures of that
pinned file may increase, and when it exceeds threshold, GC will unpin
the file, result in breaking pinfile's semantics.

In order to mitigate such condition, let's record and skip section which
has pinned file's data and give priority to select unpinned one.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/gc.c      | 53 ++++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/segment.c |  8 +++++++
 fs/f2fs/segment.h |  2 ++
 3 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6a7e4148ff9d..b4e559030d99 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -646,6 +646,34 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
 	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
 }
 
+static void pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+
+	set_bit(GET_SEC_FROM_SEG(sbi, segno), dirty_i->pinned_secmap);
+	dirty_i->pinned_secmap_cnt++;
+}
+
+static bool pinned_section_exists(struct dirty_seglist_info *dirty_i)
+{
+	return dirty_i->pinned_secmap_cnt;
+}
+
+static bool section_is_pinned(struct dirty_seglist_info *dirty_i,
+						unsigned int secno)
+{
+	return pinned_section_exists(dirty_i) &&
+			test_bit(secno, dirty_i->pinned_secmap);
+}
+
+static void unpin_all_sections(struct f2fs_sb_info *sbi)
+{
+	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+
+	memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
+	DIRTY_I(sbi)->pinned_secmap_cnt = 0;
+}
+
 /*
  * This function is called from two paths.
  * One is garbage collection and the other is SSR segment selection.
@@ -787,6 +815,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
 
+		if (gc_type == FG_GC && section_is_pinned(dirty_i, secno))
+			goto next;
+
 		if (is_atgc) {
 			add_victim_entry(sbi, &p, segno);
 			goto next;
@@ -1202,8 +1233,10 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	}
 
 	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
+		if (gc_type == FG_GC) {
 			f2fs_pin_file_control(inode, true);
+			pin_section(F2FS_I_SB(inode), segno);
+		}
 		err = -EAGAIN;
 		goto out;
 	}
@@ -1352,8 +1385,10 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		goto out;
 	}
 	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
+		if (gc_type == FG_GC) {
 			f2fs_pin_file_control(inode, true);
+			pin_section(F2FS_I_SB(inode), segno);
+		}
 		err = -EAGAIN;
 		goto out;
 	}
@@ -1485,6 +1520,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 							gc_type == FG_GC) {
 				f2fs_pin_file_control(inode, true);
 				iput(inode);
+				pin_section(sbi, segno);
 				return submitted;
 			}
 
@@ -1766,9 +1802,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		ret = -EINVAL;
 		goto stop;
 	}
+retry:
 	ret = __get_victim(sbi, &segno, gc_type);
-	if (ret)
+	if (ret) {
+		/* allow to search victim from sections has pinned data */
+		if (ret == -ENODATA && gc_type == FG_GC &&
+				pinned_section_exists(DIRTY_I(sbi))) {
+			unpin_all_sections(sbi);
+			goto retry;
+		}
 		goto stop;
+	}
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
 	if (gc_type == FG_GC &&
@@ -1811,6 +1855,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
 
+	if (gc_type == FG_GC && pinned_section_exists(DIRTY_I(sbi)))
+		unpin_all_sections(sbi);
+
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 012524db7437..a5aa7a102105 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4736,6 +4736,13 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
 	dirty_i->victim_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
 	if (!dirty_i->victim_secmap)
 		return -ENOMEM;
+
+	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!dirty_i->pinned_secmap) {
+		kvfree(dirty_i->victim_secmap);
+		return -ENOMEM;
+	}
+	dirty_i->pinned_secmap_cnt = 0;
 	return 0;
 }
 
@@ -5324,6 +5331,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 
+	kvfree(dirty_i->pinned_secmap);
 	kvfree(dirty_i->victim_secmap);
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5c94caf0c0a1..fd6f246e649c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -294,6 +294,8 @@ struct dirty_seglist_info {
 	struct mutex seglist_lock;		/* lock for segment bitmaps */
 	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
 	unsigned long *victim_secmap;		/* background GC victims */
+	unsigned long *pinned_secmap;		/* pinned victims from foreground GC */
+	unsigned int pinned_secmap_cnt;		/* count of victims which has pinned data */
 };
 
 /* victim selection function for cleaning and SSR */
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
