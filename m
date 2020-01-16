Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C713E4FD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2020 18:12:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1is8gg-0003JA-7f; Thu, 16 Jan 2020 17:12:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1is8ge-0003J0-OT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZHFlC7H3u+HxnSJk9H8fbvKceWoZ7YM5WZEw53E6dGY=; b=l/E/LuIfWEMj+f2bQ+y6uMZWGK
 Mo3wEqQtFdmPmafvYeFbnVXYMhWKJ8Fjlw84jhpGVuW5j7dVt0jLZWw5r8a9mlg2esEmc1VFQVuKW
 aRSkOgbq6SKmghKhk4hdF7UGQoH0OGLke7nY0BB/a7GfV6aF6UkENi4p3rOyE0T1eG+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZHFlC7H3u+HxnSJk9H8fbvKceWoZ7YM5WZEw53E6dGY=; b=cAvucNwhtEKZzFLZXveoOTG226
 EbZOUxgeazcMkJ4Fv5FeeWrDxV0EWtTC+2615yvUBQHbQlq3qZoRWIuabySqJ5VP9Yk9uQtVHn0oO
 g3jDeH1LvySf/B2N1XOHJYU4ECoVecCtXHYGB2LRSIjtdEHTFFZU+h5clkoETA3wg6+U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1is8gd-006kZV-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:12:04 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5925524696;
 Thu, 16 Jan 2020 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194718;
 bh=82bJvPDnc5G4xgw16Uc87CO0wdYNO9sE+vaqbaDhJas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pupw2R84sojUTP7T7avYluQoBBQnbTfUyrWIqKu2FWTD4nvP63safLWrdITKm10w3
 brlbqVY29cX2Pbkc2X+5OYLJWKJ+vY0IcIiuJEm79Ea/qTYbHNhddg5LfY4huaSehD
 gn6uPjHAaW475k6M/KvoDWf19LGnESgmk8oWqFwY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:03:12 -0500
Message-Id: <20200116170509.12787-291-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1is8gd-006kZV-Kc
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 554/671] f2fs: fix to avoid
 accessing uninitialized field of inode page in is_alive()
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

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 98194030554cd9b10568a9b58f5a135c7e7cba85 ]

If inode is newly created, inode page may not synchronize with inode cache,
so fields like .i_inline or .i_extra_isize could be wrong, in below call
path, we may access such wrong fields, result in failing to migrate valid
target block.

Thread A				Thread B
- f2fs_create
 - f2fs_add_link
  - f2fs_add_dentry
   - f2fs_init_inode_metadata
    - f2fs_add_inline_entry
     - f2fs_new_inode_page
     - f2fs_put_page
     : inode page wasn't updated with inode cache
					- gc_data_segment
					 - is_alive
					  - f2fs_get_node_page
					  - datablock_addr
					   - offset_in_addr
					   : access uninitialized fields

Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/dir.c    | 5 +++++
 fs/f2fs/inline.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index cd611a57d04d..8692cfa89a1c 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -572,6 +572,11 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
+
+		/* synchronize inode page's data from inode cache */
+		if (is_inode_flag_set(inode, FI_NEW_INODE))
+			f2fs_update_inode(inode, page);
+
 		f2fs_put_page(page, 1);
 	}
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 3fe0dd531390..c1ba29d10789 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -578,6 +578,11 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 	/* we don't need to mark_inode_dirty now */
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
+
+		/* synchronize inode page's data from inode cache */
+		if (is_inode_flag_set(inode, FI_NEW_INODE))
+			f2fs_update_inode(inode, page);
+
 		f2fs_put_page(page, 1);
 	}
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
