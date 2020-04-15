Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E31341A9D45
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:44:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgTR-0003dF-NZ; Wed, 15 Apr 2020 11:44:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgTR-0003d3-2E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lp3b5/ViHX/6EL+tEiN98P5XEFu9YWOiBOb4l9XQZY8=; b=G96ta/9vf+2iH3Ay1eGLu8Fr2C
 lLOhR8TulC0rs89U3DeUXPqpHxtmuHLvU0w//rRp8HXa5mefSkS95bvMUogywjiHrDybYPRYItkXq
 RIxRWga4/HL7pNyGBzlx9Ci0IpywOkpXHkxLGCuIMJxSHam40DqBHQrSIIvom8NGKOjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lp3b5/ViHX/6EL+tEiN98P5XEFu9YWOiBOb4l9XQZY8=; b=WpXnao2xbm9OJlDshrVUFCkYt1
 ZMBrq6lT2Z+lySUWVI7MW3Ewagb0XlGdfFdTsKY7+Kyw3jJerjeSZDhDz42HAAS+GTGTJAexNhQQ1
 Zuu0n6N8xFXPmLIldt3YrfZ9FWh9Prm9M/Tz/GCY84ElXlEmTJKMDYSbmTkdgXGuozsY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgTO-00GU0Q-4X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:44:55 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF16F20768;
 Wed, 15 Apr 2020 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951088;
 bh=aVfigafMAvv1hgwZCshZyIH+wEjppUtP4c/qdhe1li8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NBY1kkjINEGxyARbbaM9Df0l9lZwIsMnAkZXJsT3jLO1c43hI5tx8AZAAcmjg+aZK
 4KERsWhqil5jAu2B5L+yl6kEwuhRRl+uyUevExfcb2WTqb0hKwuAsiYX8u4O7xnwUk
 p34OMG1DF6Hxu8q5kD98WLdwWPV3k9t2dUjyot1s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:43:22 -0400
Message-Id: <20200415114442.14166-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgTO-00GU0Q-4X
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 05/84] f2fs: fix the panic in
 do_checkpoint()
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sahitya Tummala <stummala@codeaurora.org>

[ Upstream commit bf22c3cc8ce71454dddd772284773306a68031d8 ]

There could be a scenario where f2fs_sync_meta_pages() will not
ensure that all F2FS_DIRTY_META pages are submitted for IO. Thus,
resulting in the below panic in do_checkpoint() -

f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
				!f2fs_cp_error(sbi));

This can happen in a low-memory condition, where shrinker could
also be doing the writepage operation (stack shown below)
at the same time when checkpoint is running on another core.

schedule
down_write
f2fs_submit_page_write -> by this time, this page in page cache is tagged
			as PAGECACHE_TAG_WRITEBACK and PAGECACHE_TAG_DIRTY
			is cleared, due to which f2fs_sync_meta_pages()
			cannot sync this page in do_checkpoint() path.
f2fs_do_write_meta_page
__f2fs_write_meta_page
f2fs_write_meta_page
shrink_page_list
shrink_inactive_list
shrink_node_memcg
shrink_node
kswapd

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c | 16 +++++++---------
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/super.c      |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a0eef95b9e0ed..410f5c2c6ef17 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1250,20 +1250,20 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
 	f2fs_unlock_all(sbi);
 }
 
-void f2fs_wait_on_all_pages_writeback(struct f2fs_sb_info *sbi)
+void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 {
 	DEFINE_WAIT(wait);
 
 	for (;;) {
 		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
 
-		if (!get_pages(sbi, F2FS_WB_CP_DATA))
+		if (!get_pages(sbi, type))
 			break;
 
 		if (unlikely(f2fs_cp_error(sbi)))
 			break;
 
-		io_schedule_timeout(5*HZ);
+		io_schedule_timeout(HZ/50);
 	}
 	finish_wait(&sbi->cp_wait, &wait);
 }
@@ -1384,8 +1384,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* Flush all the NAT/SIT pages */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
-	f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
-					!f2fs_cp_error(sbi));
 
 	/*
 	 * modify checkpoint
@@ -1493,11 +1491,11 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* Here, we have one bio having CP pack except cp pack 2 page */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
-	f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
-					!f2fs_cp_error(sbi));
+	/* Wait for all dirty meta pages to be submitted for IO */
+	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
 
 	/* wait for previous submitted meta pages writeback */
-	f2fs_wait_on_all_pages_writeback(sbi);
+	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 
 	/* flush all device cache */
 	err = f2fs_flush_device_cache(sbi);
@@ -1506,7 +1504,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* barrier and flush checkpoint cp pack 2 page if it can */
 	commit_checkpoint(sbi, ckpt, start_blk);
-	f2fs_wait_on_all_pages_writeback(sbi);
+	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 
 	/*
 	 * invalidate intermediate page cache borrowed from meta inode
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9046432b87c2d..1a8b68ceaa62f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3185,7 +3185,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi);
 void f2fs_update_dirty_page(struct inode *inode, struct page *page);
 void f2fs_remove_dirty_inode(struct inode *inode);
 int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type);
-void f2fs_wait_on_all_pages_writeback(struct f2fs_sb_info *sbi);
+void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type);
 int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi);
 int __init f2fs_create_checkpoint_caches(void);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ea8dbf1458c99..28441f4971b8d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1105,7 +1105,7 @@ static void f2fs_put_super(struct super_block *sb)
 	/* our cp_error case, we can wait for any writeback page */
 	f2fs_flush_merged_writes(sbi);
 
-	f2fs_wait_on_all_pages_writeback(sbi);
+	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 
 	f2fs_bug_on(sbi, sbi->fsync_node_num);
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
