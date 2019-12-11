Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432F11B0D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 16:27:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1if3tE-0001C3-BC; Wed, 11 Dec 2019 15:27:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1if3tC-0001Bv-Vx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iYi+WBVaaMW72Oxj5ZgiKAAN+sIkkUhoVmzB5FUzi14=; b=Q6WbzQXq/kq1vHa2Z5a5ns5KbA
 Ots9DH40PCgUduiAfv34VsKJufuBTlLZVXpJKq9EwDgUFDwp9cCJmYfsjDL0nPh7sDm3pXWc/eNrl
 QhaswglMK9AYVD/bBSn2gO1RH+RB+Fnqyv01umvyFOrni8QLa4rgFPJRwusBUF6ibrz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iYi+WBVaaMW72Oxj5ZgiKAAN+sIkkUhoVmzB5FUzi14=; b=P+hXQ4WnEBC8L+kyorPZgFDRlc
 afufm7/F0ytiSXQvEPWV9BtXKjZetBFBzTm995MVNefteIxWj1oURkL62J/0f6WB8k6CosuFL2/hc
 RRE7fPpSUWIz0a2CL8Sy6snewFroxrg7dCZuJ7fOODq11+uRAWqPDltx1Y+LK9sTzw7M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1if3t9-001DgJ-C2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:26:58 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E8CA24658;
 Wed, 11 Dec 2019 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078009;
 bh=o9oNc69DmTqn3hH7gqvokMwckcvcCRhoSdzLpmEDsi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUfbNxOKNYQWcawp0YZ14MZv9NrmlGiYAUkW0yKw46X2rXbssy3IVCCU3Npka1jBV
 5hB3oOEXotqC0SEHrHSRlDYUAqMXXRIbLQe/uX5nJPZOnZk1kG9g8XWox/3YS87qS/
 nIGcjSFTAQ2oLsXnCvWdYtGanx0NDlAZcXXUysjM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 11 Dec 2019 10:25:29 -0500
Message-Id: <20191211152643.23056-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152643.23056-1-sashal@kernel.org>
References: <20191211152643.23056-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1if3t9-001DgJ-C2
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 05/79] f2fs: fix to update time in
 lazytime mode
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

[ Upstream commit fe1897eaa6646f5a64a4cee0e6473ed9887d324b ]

generic/018 reports an inconsistent status of atime, the
testcase is as below:
- open file with O_SYNC
- write file to construct fraged space
- calc md5 of file
- record {a,c,m}time
- defrag file --- do nothing
- umount & mount
- check {a,c,m}time

The root cause is, as f2fs enables lazytime by default, atime
update will dirty vfs inode, rather than dirtying f2fs inode (by set
with FI_DIRTY_INODE), so later f2fs_write_inode() called from VFS will
fail to update inode page due to our skip:

f2fs_write_inode()
	if (is_inode_flag_set(inode, FI_DIRTY_INODE))
		return 0;

So eventually, after evict(), we lose last atime for ever.

To fix this issue, we need to check whether {a,c,m,cr}time is
consistent in between inode cache and inode page, and only skip
f2fs_update_inode() if f2fs inode is not dirty and time is
consistent as well.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h  | 23 +++++++++++++++--------
 fs/f2fs/inode.c |  6 +++++-
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 34e48bcf50874..72d154e71bb56 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2578,6 +2578,20 @@ static inline void clear_file(struct inode *inode, int type)
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline bool f2fs_is_time_consistent(struct inode *inode)
+{
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time, &inode->i_atime))
+		return false;
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &inode->i_ctime))
+		return false;
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &inode->i_mtime))
+		return false;
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 3,
+						&F2FS_I(inode)->i_crtime))
+		return false;
+	return true;
+}
+
 static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
 {
 	bool ret;
@@ -2595,14 +2609,7 @@ static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
 			i_size_read(inode) & ~PAGE_MASK)
 		return false;
 
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time, &inode->i_atime))
-		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &inode->i_ctime))
-		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &inode->i_mtime))
-		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 3,
-						&F2FS_I(inode)->i_crtime))
+	if (!f2fs_is_time_consistent(inode))
 		return false;
 
 	down_read(&F2FS_I(inode)->i_sem);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 540d45759621a..a01be7d8db867 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -614,7 +614,11 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 			inode->i_ino == F2FS_META_INO(sbi))
 		return 0;
 
-	if (!is_inode_flag_set(inode, FI_DIRTY_INODE))
+	/*
+	 * atime could be updated without dirtying f2fs inode in lazytime mode
+	 */
+	if (f2fs_is_time_consistent(inode) &&
+		!is_inode_flag_set(inode, FI_DIRTY_INODE))
 		return 0;
 
 	/*
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
