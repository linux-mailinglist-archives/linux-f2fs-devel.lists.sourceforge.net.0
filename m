Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AE1CB847
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 21:27:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jX8ec-0005iU-5j; Fri, 08 May 2020 19:27:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jX8eb-0005iJ-B4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 19:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/n+fvL0Hbascibzpzvsagyy3/Tu/+2iBSS9bDVKIOT4=; b=Isl7K74gqS9nj9odq4GsypdjDV
 T2LQ4XHHBOW3qBn3cR+7ilBl0gPISByBKx337h8WHK6dyVyHGXPpj7G0aOHA2I8cSZAbEGRzIqsjF
 CkMoILJ6w9n9C5eJpgnyUVKJnGsx2GllpyoLCpndsyv1cLTiiTIaG5GMh6GY+eXqgpAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/n+fvL0Hbascibzpzvsagyy3/Tu/+2iBSS9bDVKIOT4=; b=L
 Rk3xPyN++Y7xRQNJ/B/3YubJF5MfOOGHM6XELjlPuF0TU0pVGfRgTpX8O6cXHE3FQND4eiXQNgWS6
 5Bq1H0+VR6E19GMCbyORuCt1DjydJsiDd5oRItRKzb8XDGlLdeHd2GWqEX5mtDFSm/sd9fIsLeAvL
 UcBdFzf1eCZdevlI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jX8eZ-002WjK-BE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 19:27:25 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E095D20CC7;
 Fri,  8 May 2020 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588966033;
 bh=VhqAKcrwPY0cVjT8gdoCJ7J8gaWXKFNI6YLceVclDoY=;
 h=From:To:Cc:Subject:Date:From;
 b=fDj+DMEi/SmQgVWwDwS7YLee4L0T/31dur7XaM2FBscsNSoBZLyJ88HhASvA1cepz
 Bz8CQcGx+XeWTP6pjoPqcHhpIIzs5e/m5G5yZhombwWCdSy7pzfH4uJFDvzHDvaDDp
 nNFUwe47loM8tgvp8WqkChYCEg+e/zf5mXIQCJ4Y=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  8 May 2020 12:27:11 -0700
Message-Id: <20200508192711.146175-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jX8eZ-002WjK-BE
Subject: [f2fs-dev] [PATCH] f2fs: remove blk_plugging in block_operations
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

blk_plugging doesn't seem to give any benefit.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 97b6378554b40..cc9dd3bbf2188 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1169,8 +1169,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	struct blk_plug plug;
 	int err = 0, cnt = 0;
 
-	blk_start_plug(&plug);
-
 retry_flush_quotas:
 	f2fs_lock_all(sbi);
 	if (__need_flush_quota(sbi)) {
@@ -1198,7 +1196,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		f2fs_unlock_all(sbi);
 		err = f2fs_sync_dirty_inodes(sbi, DIR_INODE);
 		if (err)
-			goto out;
+			return err;
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1214,7 +1212,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		f2fs_unlock_all(sbi);
 		err = f2fs_sync_inode_meta(sbi);
 		if (err)
-			goto out;
+			return err;
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1229,7 +1227,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
 		atomic_dec(&sbi->wb_sync_req[NODE]);
 		if (err)
-			goto out;
+			return err;
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1240,8 +1238,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	 */
 	__prepare_cp_block(sbi);
 	up_write(&sbi->node_change);
-out:
-	blk_finish_plug(&plug);
 	return err;
 }
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
