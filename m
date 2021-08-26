Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C313F8C81
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Aug 2021 18:52:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJIc7-00048t-4m; Thu, 26 Aug 2021 16:52:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mJIc5-00048X-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 16:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h4km+co2cPM9RnoyNeQobKcFrCQT/hwF89pGgh7GPhE=; b=P7YPYcdU3Xo2TEPBBkLhcfo9yj
 CfEIDEGb3Rd8cb7q1/X1K8Re/aIJJslP7xqNMpUhcgsq/3FE/M/p+e4ydNS25AdFcWM3sqMqtePyq
 bhvfgxF2V2qDdofkXH5i9Q6g39oY0Rdmuaa4aLeMvBgzfhK2ZpoFolyMbo0hiBdM3l+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h4km+co2cPM9RnoyNeQobKcFrCQT/hwF89pGgh7GPhE=; b=iF2+pFujFxwG/gBUWQlEkFFDdL
 azl2Fxmhdff5gV7OtIYwXal0IjOPyyFxtk/1CU82Og5aYS+4/F/jg3wE6jpFDIDaw27FEVRKFUagv
 mYpeYSPhU6GgYZsWkizkIB4Y26KUWGc4RTWEtqp1ab81wwGeZwciYnEN/1xXVD6g3mHA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJIc3-0002cJ-5z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 16:52:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E4B560F6F;
 Thu, 26 Aug 2021 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629996737;
 bh=guErEWGgIDqVdyfI48N0DvYQV67NWP3/SnLf44qfyPE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TWyi+FVi1qU8QTruMGbCChcl56G2e9GzyTo2mCeFA7wsMRPleNRV+awoOyDlLZZLG
 N95jEpV1PbA7PxYp5JvewfhZTAvAbVwCRETXysbtZhrJhpjCWIXg7cEIadmrJlaydv
 VkEMg7sfIX28Kp99UVA8dCUI5m0NuHIVtGtg6+t59neNK4ZmBt3Z3SNB6VPp3/lA/1
 +lkrDk2yzCpCT/CTpSlYJkYAu5IIyJ3X/9N3LxEGll16F4puyRidWghvcm2aIY8n8O
 XTJtdlR9WWwvrzlqps9asL7TnJrLlV53Yvn8Bpt77Bw6F+GkLeIN/0K1M4imY8s92a
 6AFm9sPIyIw6Q==
Date: Thu, 26 Aug 2021 09:52:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YSfGwKtGhutsTJ8x@google.com>
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
 <YSa3DPBIFZ5P17vt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSa3DPBIFZ5P17vt@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mJIc3-0002cJ-5z
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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

From 64fe93a7f9c35c2b5a34cfa3cf84158852c201be Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 19 Aug 2021 14:00:57 -0700
Subject: [PATCH] f2fs: guarantee to write dirty data when enabling checkpoint
 back

We must flush all the dirty data when enabling checkpoint back. Let's guarantee
that first by adding a retry logic on sync_inodes_sb(). In addition to that,
this patch adds to flush data in fsync when checkpoint is disabled, which can
mitigate the sync_inodes_sb() failures in advance.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Change log from v2:
- repharse the patch description a bit
- fix retry condition check

 fs/f2fs/file.c  |  5 ++---
 fs/f2fs/super.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cc2080866c54..3330efb41f22 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -263,8 +263,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	};
 	unsigned int seq_id = 0;
 
-	if (unlikely(f2fs_readonly(inode->i_sb) ||
-				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+	if (unlikely(f2fs_readonly(inode->i_sb)))
 		return 0;
 
 	trace_f2fs_sync_file_enter(inode);
@@ -278,7 +277,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
 
-	if (ret) {
+	if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
 		return ret;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 49e153fd8183..b8fecf4f37e0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2088,8 +2088,17 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
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
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
