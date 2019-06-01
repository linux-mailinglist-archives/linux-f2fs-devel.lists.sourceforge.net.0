Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A031BFB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:19:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3uW-00009p-5I; Sat, 01 Jun 2019 13:19:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3uT-00008L-0w
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCHAdCNjtU0iJC7vYTEDG5jwDyk5US/YE8GSq0U659s=; b=cz833c7UPLfDud05zoReDjP1Gx
 BZeXgSZEgME9nAgnS8xuXbosvlxlD95cNqzf9Lwr4GAv0l+VF4hmOIJcyByqVkk2DPr2yhi+Z7GhY
 gqK3e9I9XCWR4SNDTM4nBEopbkhkvpqmKBtFu7rl8MPVu9WOoIBD+tND+4gXzB/2+/yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FCHAdCNjtU0iJC7vYTEDG5jwDyk5US/YE8GSq0U659s=; b=HeDQ6bIn4wflBye4TKGIHw4DlP
 cJ8E9SlSTLjnwRIpXosWZyV5TRYlMaV5DL0sZuqHnSTzfJBraw4ZD15Shz4sU6xU2Z6i88zreXTVD
 wcOR8rOOlcNWQDz1nAWg3ow4NMErQqM7yQxB/dSX990un0I+YmUsQqxfoipaiX8A5weE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3uR-00EBxk-ME
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:56 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51605251C3;
 Sat,  1 Jun 2019 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395125;
 bh=J2yOwORdmrecDjLFH3ISsJjO+lk7FMepCgKXfVDcXOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWi2OVM3QKGbPaVHURootw6iJvIUYFHMW8Tnlhp9V0uwrAjtJjyJkdeQuWUicio9K
 KqJdyw3Qdlh6aShSloqENrySy3qj0fQ0QnYAa8w+TaHESpiHfziPhbALsW+fiVWq+I
 ANC9Q0/livnlwQJ5zLZNTC1qMBTSJZkQ7jL01QA8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:25 -0400
Message-Id: <20190601131653.24205-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3uR-00EBxk-ME
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 049/186] f2fs: fix to avoid panic in
 dec_valid_block_count()
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

[ Upstream commit 5e159cd349bf3a31fb7e35c23a93308eb30f4f71 ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203209

- Overview
When mounting the attached crafted image and running program, I got this error.
Additionally, it hangs on sync after the this script.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
cc poc_01.c
./run.sh f2fs
sync

 kernel BUG at fs/f2fs/f2fs.h:1788!
 RIP: 0010:f2fs_truncate_data_blocks_range+0x342/0x350
 Call Trace:
  f2fs_truncate_blocks+0x36d/0x3c0
  f2fs_truncate+0x88/0x110
  f2fs_setattr+0x3e1/0x460
  notify_change+0x2da/0x400
  do_truncate+0x6d/0xb0
  do_sys_ftruncate+0xf1/0x160
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The reason is dec_valid_block_count() will trigger kernel panic due to
inconsistent count in between inode.i_blocks and actual block.

To avoid panic, let's just print debug message and set SBI_NEED_FSCK to
give a hint to fsck for latter repairing.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
[Jaegeuk Kim: fix build warning and add unlikely]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7bea1bc6589fd..74f06f12110f1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1789,6 +1789,7 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
+void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...);
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
@@ -1797,13 +1798,21 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 	f2fs_bug_on(sbi, sbi->total_valid_block_count < (block_t) count);
-	f2fs_bug_on(sbi, inode->i_blocks < sectors);
 	sbi->total_valid_block_count -= (block_t)count;
 	if (sbi->reserved_blocks &&
 		sbi->current_reserved_blocks < sbi->reserved_blocks)
 		sbi->current_reserved_blocks = min(sbi->reserved_blocks,
 					sbi->current_reserved_blocks + count);
 	spin_unlock(&sbi->stat_lock);
+	if (unlikely(inode->i_blocks < sectors)) {
+		f2fs_msg(sbi->sb, KERN_WARNING,
+			"Inconsistent i_blocks, ino:%lu, iblocks:%llu, sectors:%llu",
+			inode->i_ino,
+			(unsigned long long)inode->i_blocks,
+			(unsigned long long)sectors);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return;
+	}
 	f2fs_i_blocks_write(inode, count, false, true);
 }
 
@@ -2817,7 +2826,6 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
-void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...);
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
