Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDFFAE93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 11:31:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUpvt-00030O-4G; Wed, 13 Nov 2019 10:31:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1iUpvq-0002zy-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 10:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0hWESrXhpDR8PYtmaILM/kyIF86cSW5zKG0si7lewO8=; b=Dmcz3T81qq1zFalz2ABQWvQfmn
 yG3NZBpgMNxMeBKQ9g1fnOvgWzKwovUUR13W84Mojw6/Jw6aNudInvat5OpdR6OWQeLCAST/wlyhI
 CcstWr6QMKEmI3CdC6TZRxoYpZDF7AuvnOp0BI9Xl+3ExRFnS2OLcDEkkYqX9aalG+I0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0hWESrXhpDR8PYtmaILM/kyIF86cSW5zKG0si7lewO8=; b=Oq+mKL07Hp07ClExSu7JtDYwiZ
 49b/MhushZjnX1exq12vaezffq/SV2Lzlzf7O9iC78LCyrM/LEPhL2PzEWI+u7P1fThOCVcQNg4b4
 Pl8F2Hmy0F442lRoegF7Oy/Ww5QY6OBkq8eArcmSSNMY9pPFyCS5PtbsXH2pTr/N92yI=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUpvo-0018pr-Na
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 10:31:26 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id E84936076A; Wed, 13 Nov 2019 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573641075;
 bh=/66u/Suwke1zMwFS5nxwNNZ4s1ARpfkENpmO/QNhmqc=;
 h=From:To:Cc:Subject:Date:From;
 b=digNYMjFWitCsyccmtWHbZy+Wl3FPbhHCkc04ykeQHVdbgbpoBjd+SLYHQddEAQhd
 EISsWtZd7FOyQWURZPFkasw5sKjrRg5qjkyibho2tRqjHDMURjD8pDeTLWIZIL8KYo
 N2Hvc2VQFhUW4FN4kAWb5cVpWPl+qeOl/soCgXt0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D3A160592;
 Wed, 13 Nov 2019 10:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573641074;
 bh=/66u/Suwke1zMwFS5nxwNNZ4s1ARpfkENpmO/QNhmqc=;
 h=From:To:Cc:Subject:Date:From;
 b=Nr5MnjmbZ5sAfMwxAqXAepG0Es1g8ocLUj/anOxjmBb5lZxdQDdhAFyjmJDcFwJ9E
 HNpWSGu/noC7Tut/mKqQLFn4bETwV0P3sh2JeVO7/QSvsRO4/y8lHu1cILolmJadIq
 vOB70Rs3CFL0UxxSxdvmWPfvaFHvCTbDYVvQ7kv8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D3A160592
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 13 Nov 2019 16:01:03 +0530
Message-Id: <1573641063-21232-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iUpvo-0018pr-Na
Subject: [f2fs-dev] [PATCH] f2fs: Fix deadlock in f2fs_gc() context during
 atomic files handling
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
---
v2:
- change fix as per Chao's suggestion
- decrement sbi->atomic_files protected under sbi->inode_lock[ATOMIC_FILE] and
  only when atomic flag is cleared for the first time, otherwise, the count
  goes to an invalid/high value as f2fs_drop_inmem_pages() can be called from
  two contexts at the same time.

 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/file.c    |  1 +
 fs/f2fs/segment.c | 21 +++++++++++++++------
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c681f51..e04a665 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1297,6 +1297,7 @@ struct f2fs_sb_info {
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
 	/* for skip statistic */
+	unsigned int atomic_files;              /* # of opened atomic file */
 	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f6c038e..22c4949 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1919,6 +1919,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	if (list_empty(&fi->inmem_ilist))
 		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
+	sbi->atomic_files++;
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
 	/* add inode in inmem_list first and set atomic_file */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index da830fc..0b7a33b 100644
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
@@ -296,22 +298,26 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
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
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
