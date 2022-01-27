Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 368FF49E2F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 13:59:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nD4NM-0003vI-G5; Thu, 27 Jan 2022 12:59:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nD4NL-0003v5-FI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 12:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ak9MOR7ZzPC77kSv5bLfqf3pHnrLZ9/7UmbnWF3iLj8=; b=J4T9NMH9qCoq9md1BjhyVyrfJE
 9DF40ZEgFZd+hnKv6qk8H7ePqZTvyWSp+G2dHPoxjPlSc4FwJzjRxcxClSutd49kK2bUw2VXAgk54
 3VyYX57rxp5SwrzO7HKkaIsFfiIiberHtWy2dyzXmp8AmKzLMQFsNooUXV0r4AWOIF1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ak9MOR7ZzPC77kSv5bLfqf3pHnrLZ9/7UmbnWF3iLj8=; b=T
 kqJEcpVu0iQCXx2lyoWFSXIUM9Qh3dxf1qs6r7rRnLCW/XkL38NjCSFWHZvFys+P4znkhTPf77lpQ
 qlWYC3L+WHl1TIPu/r3FBWQw93fyBWHLVC3J/eUse3C9z0mmTxbs9XJVRBBj1CUE2Hjfp7bRwzHyw
 SdNEaYqB4T8Q01OE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nD4ND-0006mp-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 12:59:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8339B82192;
 Thu, 27 Jan 2022 12:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5167BC340E8;
 Thu, 27 Jan 2022 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643288363;
 bh=0Sr9yEBbyUIa84z9osp9RUNqV4/8hEQ36jN422D9FyQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HaZxcMlxAwG6MbSRF74ldQs97krXMn+dNkSP91l92KotkmIX84fLP7T9166SzEexW
 H41o9eJgktAzFdB2200ZR8qX0loHjFdYIBQViweYgvtKpA90eoNBzY5qOReYjd+C6H
 GMshApd3F0aOlQTNqHntXfnZg9o4PU+5HBnnTzZ39ZoVjp1p7kRk2bFK9XWbebpU6l
 Ya9zj8AQRxWx08TuGAM7FPBalX0sVb+V+0I5CgFbOHZ9RH4ysbv3vL52ICSQt6Z1a3
 jj+tbieE7842qQPNQPgwFNKIobBO6fkU4Z/Bt7FsQiTdxP+qCDEstw9gPKzdDDHWQp
 OLoglSxDFHMoQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 27 Jan 2022 13:44:49 +0800
Message-Id: <20220127054449.24711-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Quoted from Jing Xia's report, there is a potential deadlock
 may happen between kworker and checkpoint as below: [T:writeback]
 [T:checkpoint]
 - wb_writeback - blk_start_plug bio contains NodeA was plugged in writeback
 threads - do_writepages -- sync write inodeB,
 inc wb_sync_req[DATA] - f2fs_write_data_pages - f [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nD4ND-0006mp-Qw
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, Jing Xia <jing.xia@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Quoted from Jing Xia's report, there is a potential deadlock may happen
between kworker and checkpoint as below:

[T:writeback]				[T:checkpoint]
- wb_writeback
 - blk_start_plug
bio contains NodeA was plugged in writeback threads
					- do_writepages  -- sync write inodeB, inc wb_sync_req[DATA]
					 - f2fs_write_data_pages
					  - f2fs_write_single_data_page -- write last dirty page
					   - f2fs_do_write_data_page
					    - set_page_writeback  -- clear page dirty flag and
					    PAGECACHE_TAG_DIRTY tag in radix tree
					    - f2fs_outplace_write_data
					     - f2fs_update_data_blkaddr
					      - f2fs_wait_on_page_writeback -- wait NodeA to writeback here
					   - inode_dec_dirty_pages
 - writeback_sb_inodes
  - writeback_single_inode
   - do_writepages
    - f2fs_write_data_pages -- skip writepages due to wb_sync_req[DATA]
     - wbc->pages_skipped += get_dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() returns one
  - requeue_inode -- requeue inode to wb->b_dirty queue due to non-zero.pages_skipped
 - blk_finish_plug

Let's try to avoid deadlock condition by forcing unplugging previous bio via
blk_finish_plug(current->plug) once we'v skipped writeback in writepages()
due to valid sbi->wb_sync_req[DATA/NODE].

Fixes: 687de7f1010c ("f2fs: avoid IO split due to mixed WB_SYNC_ALL and WB_SYNC_NONE")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jing Xia <jing.xia@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 6 +++++-
 fs/f2fs/node.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 76d6fe7b0c8f..932a4c81acaf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3174,8 +3174,12 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	/* to avoid spliting IOs due to mixed WB_SYNC_ALL and WB_SYNC_NONE */
 	if (wbc->sync_mode == WB_SYNC_ALL)
 		atomic_inc(&sbi->wb_sync_req[DATA]);
-	else if (atomic_read(&sbi->wb_sync_req[DATA]))
+	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
+		/* to avoid potential deadlock */
+		if (current->plug)
+			blk_finish_plug(current->plug);
 		goto skip_write;
+	}
 
 	if (__should_serialize_io(inode, wbc)) {
 		mutex_lock(&sbi->writepages);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 556fcd8457f3..69c6bcaf5aae 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2106,8 +2106,12 @@ static int f2fs_write_node_pages(struct address_space *mapping,
 
 	if (wbc->sync_mode == WB_SYNC_ALL)
 		atomic_inc(&sbi->wb_sync_req[NODE]);
-	else if (atomic_read(&sbi->wb_sync_req[NODE]))
+	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
+		/* to avoid potential deadlock */
+		if (current->plug)
+			blk_finish_plug(current->plug);
 		goto skip_write;
+	}
 
 	trace_f2fs_writepages(mapping->host, wbc, NODE);
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
