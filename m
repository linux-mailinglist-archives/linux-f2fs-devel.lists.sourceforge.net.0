Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3F4040CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Sep 2021 00:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sZJpjL+7N7QiVJcWmB8P3JzLvMsWuaQIYB3GDQ00glg=; b=UISIp7UVeZVHnddbU7oXfrzfa5
	LxVTJrZEOEtc8vt//1+trgTHDWXxPslXxVnpsqqs+XZuwuSbJGgoDrWfJN+pKv9Mxv2HTnvUJiUwq
	S22oMqihHY6sE3WQXEpz3PQPM6Ib0UvXn6lL7oKfiHxd4ElVdbEY07zN3hJC3ar1DOgw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mO5ce-0003im-LU; Wed, 08 Sep 2021 22:00:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mO5cd-0003ie-01
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 22:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JLa8YbqoPwiQg/Jd2draf5B5imcsgqzUVQSjEjmRPBs=; b=cleTiCcXOycxuKBlgFGcot2QPa
 0uOYX2gDPEhhpoq1pYf/dRievjfsdE5K/eVLVBHPBOTfEJlHGIm3cACEUpTSqaGY5D8piPy9jzCiC
 k3ZEIQBY2qucalb5w86db4lhLWs0CRND94QKRGWLwwCbrnjDFfWyzGN+YzvNfSERxbMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JLa8YbqoPwiQg/Jd2draf5B5imcsgqzUVQSjEjmRPBs=; b=e
 C06dZ+LLGrJhQYjauw42skkfixaidEPx0sZVG12ZWR0DNcXn5n9ZVQjim18KAJhJUUlA2Ca9gQ+gn
 W3NkheMQtDusbipuRINxE3ugzdizCw7SXuxSrDyVNKoy6epzYjFRGh+AJf38naUiYR4rGiqARyMfZ
 phQiZgr26YBIzAnI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mO5cZ-00042H-GN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 22:00:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F77D61102;
 Wed,  8 Sep 2021 22:00:24 +0000 (UTC)
To: stable@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  8 Sep 2021 15:00:20 -0700
Message-Id: <20210908220020.599899-1-jaegeuk@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
X-Headers-End: 1mO5cZ-00042H-GN
Subject: [f2fs-dev] [PATCH] f2fs: guarantee to write dirty data when
 enabling checkpoint back
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

commit dddd3d65293a52c2c3850c19b1e5115712e534d8 upstream.

We must flush all the dirty data when enabling checkpoint back. Let's guarantee
that first by adding a retry logic on sync_inodes_sb(). In addition to that,
this patch adds to flush data in fsync when checkpoint is disabled, which can
mitigate the sync_inodes_sb() failures in advance.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c  |  5 ++---
 fs/f2fs/super.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c74b2997197..6ee8b1e0e174 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -259,8 +259,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	};
 	unsigned int seq_id = 0;
 
-	if (unlikely(f2fs_readonly(inode->i_sb) ||
-				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+	if (unlikely(f2fs_readonly(inode->i_sb)))
 		return 0;
 
 	trace_f2fs_sync_file_enter(inode);
@@ -274,7 +273,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
 
-	if (ret) {
+	if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
 		return ret;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c52988067887..476b2c497d28 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1764,8 +1764,17 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
+	int retry = DEFAULT_RETRY_IO_COUNT;
+
 	/* we should flush all the data to keep data consistency */
-	sync_inodes_sb(sbi->sb);
+	do {
+		sync_inodes_sb(sbi->sb);
+		cond_resched();
+		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
+
+	if (unlikely(retry < 0))
+		f2fs_warn(sbi, "checkpoint=enable has some unwritten data.");
 
 	down_write(&sbi->gc_lock);
 	f2fs_dirty_to_prefree(sbi);
-- 
2.33.0.153.gba50c8fa24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
