Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721531C63
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3wu-0003aY-Uf; Sat, 01 Jun 2019 13:21:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3ws-0003aK-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LqZe62IeNjaqi29uzSfYTuPGE+kw3rZ+5HDSSQD03jE=; b=Pz+fe4hTj5aMPdIwQ8Vy4ks7sb
 ekyA9GbpSteik5vzuCjCKDN8x5lgRKJCORViErupWFfJefe/M+Sy1EcmojZ4azBffZSYJEfWdrYLN
 YDZvKWR3n+OnQoFsguaRe+5M+u22/XtwEkWmxBQ1ZbKJlvN6pdRNvUR34jQeAbHNfdxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LqZe62IeNjaqi29uzSfYTuPGE+kw3rZ+5HDSSQD03jE=; b=RFkS69EJ7CjgnmvK0+lzt+aIX3
 kowHMQU7nUCL87LNTrjxCphRZD6UJN2kv9IPFCwgEjQRlzPSjeptEqTU/mR0UfSuB6IGKHE8DXqJn
 8zJJUrNuUWlwNXz3RWc+7FDIHRGNPYSsVl+J3DFEz0HZpI2g/keVcILfebfTZIO5aBC0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3wr-00ECKz-Bs
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:26 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 260CF2730A;
 Sat,  1 Jun 2019 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395279;
 bh=x8WusflpMqt/AQe0mDJsZNdB1mRr4/b8/mcpBhzwGKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x+y/PvlYkVL1+pZZlSvj9EKqgPFU5sj4lKo8c6HYBCa4xFMv0T0DeakBzB3GCOJdQ
 ovtb/8/gYNPMO+Fjk3/wTCJgbozsHl+pCAKMToXyUA2DhgKEqRmZiwKZFbKxr4c4ZS
 YbSS1w86Vv/QEhzrDgLKkISREpcCUWU+UUjJCHuI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:15 -0400
Message-Id: <20190601131934.25053-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
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
X-Headers-End: 1hX3wr-00ECKz-Bs
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 043/173] f2fs: fix to avoid panic in
 f2fs_remove_inode_page()
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

[ Upstream commit 8b6810f8acfe429fde7c7dad4714692cc5f75651 ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203219

- Overview
When mounting the attached crafted image and running program, I got this error.
Additionally, it hangs on sync after running the program.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
cc poc_06.c
mkdir test
mount -t f2fs tmp.img test
cp a.out test
cd test
sudo ./a.out
sync

- Messages
 kernel BUG at fs/f2fs/node.c:1183!
 RIP: 0010:f2fs_remove_inode_page+0x294/0x2d0
 Call Trace:
  f2fs_evict_inode+0x2a3/0x3a0
  evict+0xba/0x180
  __dentry_kill+0xbe/0x160
  dentry_kill+0x46/0x180
  dput+0xbb/0x100
  do_renameat2+0x3c9/0x550
  __x64_sys_rename+0x17/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The reason is f2fs_remove_inode_page() will trigger kernel panic due to
inconsistent i_blocks value of inode.

To avoid panic, let's just print debug message and set SBI_NEED_FSCK to
give a hint to fsck for latter repairing of potential image corruption.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
[Jaegeuk Kim: fix build warning and add unlikely]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3f99ab2886955..d45ecef751165 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1179,8 +1179,14 @@ int f2fs_remove_inode_page(struct inode *inode)
 		f2fs_put_dnode(&dn);
 		return -EIO;
 	}
-	f2fs_bug_on(F2FS_I_SB(inode),
-			inode->i_blocks != 0 && inode->i_blocks != 8);
+
+	if (unlikely(inode->i_blocks != 0 && inode->i_blocks != 8)) {
+		f2fs_msg(F2FS_I_SB(inode)->sb, KERN_WARNING,
+			"Inconsistent i_blocks, ino:%lu, iblocks:%llu",
+			inode->i_ino,
+			(unsigned long long)inode->i_blocks);
+		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+	}
 
 	/* will put inode & node pages */
 	err = truncate_node(&dn);
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
