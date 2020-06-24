Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1720696F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 03:22:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnu70-000735-R8; Wed, 24 Jun 2020 01:22:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jnu70-00072z-C9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 01:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3D2Pjzl6zLc6+mLJTP+WGzveq780PCi0s+2HpfDKIdg=; b=QYMV1EsYOhRiO9l6XH3x21j79J
 8qDr9iolP4xwaiq4zJMYxAIF/nKwrAKQr7cmuMxaHYs9+g0pkofSj0+iConXC432yYSFs1ughBzMq
 qRZJatqZWZZvbBWCwlF4NPBC6zGAbU7OcbpuSBXDHo+QhrpGYO3+gTTWl67SX8MCEU4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3D2Pjzl6zLc6+mLJTP+WGzveq780PCi0s+2HpfDKIdg=; b=T
 h8qzPWD3wY/Sen7dxiQpsd9hTfTReJEQZHk12m/lHlNYKlC8U5qKmM4uBVmQrglkwV6MM/r9fm2D/
 eCNVfPe1BrleovE6qaYCXSRe10/IP4r8IYXJLzifjrlS+mJge5nh4aeLmWaBYGl3XLbDV2nEOlEmW
 UehpJ2l1PTVj/vaM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnu6u-00GXZ5-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 01:22:02 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A54C72098B;
 Wed, 24 Jun 2020 01:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592961710;
 bh=q4Pi3kNmO4FJ+5AKsS68CryMsRDMWC3DAutTzeZ9fAw=;
 h=From:To:Cc:Subject:Date:From;
 b=PrCwI/LGSBreBr49BTTIywyZJN9Dvn7jpBRbXUfo97cuaDA0tll3lTbCSa8SyErdt
 XuDZKR49M8rDSLypdOALdd8kR/vt0GIEwvgIbUhLmZmbruoNlznbt+oR0advniYmzz
 GeZivfeGLVLerbasPB+phfMIVySvy24cSljoJUSU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 23 Jun 2020 18:21:48 -0700
Message-Id: <20200624012148.180050-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
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
X-Headers-End: 1jnu6u-00GXZ5-3Y
Subject: [f2fs-dev] [PATCH] f2fs: avoid readahead race condition
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

If two readahead threads having same offset enter in readpages, every read
IOs are split and issued to the disk which giving lower bandwidth.

This patch tries to avoid redundant readahead calls.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c  | 15 +++++++++++++++
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dfd3225153570..1886d83bc5f15 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2292,6 +2292,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
+	bool drop_ra = false;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -2302,6 +2303,17 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
+	/*
+	 * Two readahead threads for same address range can cause race condition
+	 * which fragments sequential read IOs. So let's avoid each other.
+	 */
+	if (rac && readahead_count(rac)) {
+		if (F2FS_I(inode)->ra_offset == readahead_index(rac))
+			drop_ra = true;
+		else
+			F2FS_I(inode)->ra_offset = readahead_index(rac);
+	}
+
 	for (; nr_pages; nr_pages--) {
 		if (rac) {
 			page = readahead_page(rac);
@@ -2368,6 +2380,9 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	}
 	if (bio)
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
+
+	if (rac && readahead_count(rac) && !drop_ra)
+		F2FS_I(inode)->ra_offset = -1;
 	return ret;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7fb2a1a334388..753782426feac 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -809,6 +809,7 @@ struct f2fs_inode_info {
 	struct list_head inmem_pages;	/* inmemory pages managed by f2fs */
 	struct task_struct *inmem_task;	/* store inmemory task */
 	struct mutex inmem_lock;	/* lock for inmemory pages */
+	pgoff_t ra_offset;		/* ongoing readahead offset */
 	struct extent_tree *extent_tree;	/* cached extent_tree entry */
 
 	/* avoid racing between foreground op and gc */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7326522057378..80cb7cd358f84 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1015,6 +1015,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	/* Will be used by directory only */
 	fi->i_dir_level = F2FS_SB(sb)->dir_level;
 
+	fi->ra_offset = -1;
+
 	return &fi->vfs_inode;
 }
 
-- 
2.27.0.111.gc72c7da667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
