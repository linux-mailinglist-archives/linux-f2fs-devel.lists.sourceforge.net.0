Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACC11AF7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 16:13:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1if3gS-0004jK-5V; Wed, 11 Dec 2019 15:13:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1if3gQ-0004jD-AG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqKwJCIueuo28xIU06u7sEXYmDTXbpz7psaYodCCr5U=; b=XMHaE3Q14YlgE7guv6Wv8pNqW3
 4p4JCAdhiqgOOp71GL6fwAPtIV4Srb6wV1KGaBa6fnsA7jEwm/xkUnDbsOmelqHCSmwL1H78D9nAY
 iNSypRIWPZrJ6hj0Fp4/rGwYsU3Yias207tv/MSfJevU3DQ/oMek6bM0PezHeDfBHvdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lqKwJCIueuo28xIU06u7sEXYmDTXbpz7psaYodCCr5U=; b=Qrm/gX19+wJHJsJ2Wye3pq/vL0
 UoVilFyoI6uy5O2tdEZSoQoG326lFuyH3t2XyvFWen2gMWF2Ox5FZdj+7S2QwxQd58jvTZDA4AMoQ
 PtLTWd6O1UU0C4n+4Tf1HIWbkxS55QzfLoSaju7Oa/dEN3gyMcsI9cjwk6czoAB8q+78=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1if3gP-006LNr-5Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:13:46 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCECD24671;
 Wed, 11 Dec 2019 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576077219;
 bh=xZEIST2/HgaO23PjJOPNxsu/fBMAas1f2zAOn7G+6DI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=177v0ndSHPD3bhqUv0cl5y7e8rPw81zSssIaV4TeDrJ30badgNbLG9AAmyYupqsf6
 8Uq0EJjssbm1jonWq3bhQC8t/bscK3zGyXTGF5c7QbMruS5KD4vAZmIy5Qv9NSXIGd
 5+0Om9kTdVAgIz6KxQWdZt6NKeRJ4H3OePK53IwE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 11 Dec 2019 10:11:15 -0500
Message-Id: <20191211151150.19073-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211151150.19073-1-sashal@kernel.org>
References: <20191211151150.19073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1if3gP-006LNr-5Z
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 099/134] f2fs: Fix deadlock in
 f2fs_gc() context during atomic files handling
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

[ Upstream commit 677017d196ba2a4cfff13626b951cc9a206b8c7c ]

The FS got stuck in the below stack when the storage is almost
full/dirty condition (when FG_GC is being done).

schedule_timeout
io_schedule_timeout
congestion_wait
f2fs_drop_inmem_pages_all
f2fs_gc
f2fs_balance_fs
__write_node_page
f2fs_fsync_node_pages
f2fs_do_sync_file
f2fs_ioctl

The root cause for this issue is there is a potential infinite loop
in f2fs_drop_inmem_pages_all() for the case where gc_failure is true
and when there an inode whose i_gc_failures[GC_FAILURE_ATOMIC] is
not set. Fix this by keeping track of the total atomic files
currently opened and using that to exit from this condition.

Fix-suggested-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/file.c    |  1 +
 fs/f2fs/segment.c | 21 +++++++++++++++------
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f078cd20dab88..9046432b87c2d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1289,6 +1289,7 @@ struct f2fs_sb_info {
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
 	/* for skip statistic */
+	unsigned int atomic_files;              /* # of opened atomic file */
 	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759a..8ed8e4328bd1a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1890,6 +1890,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	if (list_empty(&fi->inmem_ilist))
 		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
+	sbi->atomic_files++;
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
 	/* add inode in inmem_list first and set atomic_file */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8087095814819..7d85784012678 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -288,6 +288,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
 	struct inode *inode;
 	struct f2fs_inode_info *fi;
+	unsigned int count = sbi->atomic_files;
+	unsigned int looped = 0;
 next:
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	if (list_empty(head)) {
@@ -296,22 +298,26 @@ next:
 	}
 	fi = list_first_entry(head, struct f2fs_inode_info, inmem_ilist);
 	inode = igrab(&fi->vfs_inode);
+	if (inode)
+		list_move_tail(&fi->inmem_ilist, head);
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
 	if (inode) {
 		if (gc_failure) {
-			if (fi->i_gc_failures[GC_FAILURE_ATOMIC])
-				goto drop;
-			goto skip;
+			if (!fi->i_gc_failures[GC_FAILURE_ATOMIC])
+				goto skip;
 		}
-drop:
 		set_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
 		f2fs_drop_inmem_pages(inode);
+skip:
 		iput(inode);
 	}
-skip:
 	congestion_wait(BLK_RW_ASYNC, HZ/50);
 	cond_resched();
+	if (gc_failure) {
+		if (++looped >= count)
+			return;
+	}
 	goto next;
 }
 
@@ -327,13 +333,16 @@ void f2fs_drop_inmem_pages(struct inode *inode)
 		mutex_unlock(&fi->inmem_lock);
 	}
 
-	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
 	stat_dec_atomic_write(inode);
 
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	if (!list_empty(&fi->inmem_ilist))
 		list_del_init(&fi->inmem_ilist);
+	if (f2fs_is_atomic_file(inode)) {
+		clear_inode_flag(inode, FI_ATOMIC_FILE);
+		sbi->atomic_files--;
+	}
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 }
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
