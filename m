Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 014BC31BF6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:18:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3uP-00006r-06; Sat, 01 Jun 2019 13:18:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3uM-000061-IX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=68Iq+gBdGQoW1eb9XmhuGu0flPz/GyBr12VjQN28gYI=; b=hGtpTmMRkHwoYO9kNgvmmi6v7E
 C91yLKdUoLElP5gKCuo2AK/lnuyaYybi1LxfGvBuQt3w0CbnfSXuwHjQA1jQ4Aw0lKbNP3SQfwFkW
 c3kxvxhbJnQKnaAwTR4n/tiPyI+rrdje0VZNV/o6mZVuK27HnfemQpQ6EzhO56cT/G78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=68Iq+gBdGQoW1eb9XmhuGu0flPz/GyBr12VjQN28gYI=; b=hStZVuQLM02+TGGIbyNx0zbKVM
 ijDbzXkMUud+mWNdhjerOlnf6H/MZNYz+gs9K5oyKR7mcIqKCJc0NO+jQpOD9DQ/CdD+t/DA+/Ulc
 0ILJUJV8lnl92m9EyVB2uX+vgoJaJsT1hxvdMhljqmxcKIluQ2btDLR/s6pvI1m7O0ow=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3uK-0057ky-E8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED2A525525;
 Sat,  1 Jun 2019 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395119;
 bh=3o3SBFUyYIaUH0Vtf6qpRLkCC1rsUfor6gX+JaS2tgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=McQ3j7umZhnrq7zCQ0PsR++5YR1WF/g8bo7kEflaZwSOuPntP0xPvrx70KczUOOpi
 eGMKp1Pj4xoB9ypXKoE1/IdfRSZkWlYjaLjFwjcunownV6Th223HNnGEjoPqqPTKM4
 Y6IY1O5MpgafLTablxIBraDUBo0cFXZE2fg0nkEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:19 -0400
Message-Id: <20190601131653.24205-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3uK-0057ky-E8
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 043/186] f2fs: fix to avoid panic in
 do_recover_data()
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

[ Upstream commit 22d61e286e2d9097dae36f75ed48801056b77cac ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203227

- Overview
When mounting the attached crafted image, following errors are reported.
Additionally, it hangs on sync after trying to mount it.

The image is intentionally fuzzed from a normal f2fs image for testing.
Compile options for F2FS are as follows.
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_CHECK_FS=y

- Reproduces
mkdir test
mount -t f2fs tmp.img test
sync

- Messages
 kernel BUG at fs/f2fs/recovery.c:549!
 RIP: 0010:recover_data+0x167a/0x1780
 Call Trace:
  f2fs_recover_fsync_data+0x613/0x710
  f2fs_fill_super+0x1043/0x1aa0
  mount_bdev+0x16d/0x1a0
  mount_fs+0x4a/0x170
  vfs_kern_mount+0x5d/0x100
  do_mount+0x200/0xcf0
  ksys_mount+0x79/0xc0
  __x64_sys_mount+0x1c/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

During recovery, if ofs_of_node is inconsistent in between recovered
node page and original checkpointed node page, let's just fail recovery
instead of making kernel panic.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e3883db868d81..73338c432e7e4 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -546,7 +546,15 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		goto err;
 
 	f2fs_bug_on(sbi, ni.ino != ino_of_node(page));
-	f2fs_bug_on(sbi, ofs_of_node(dn.node_page) != ofs_of_node(page));
+
+	if (ofs_of_node(dn.node_page) != ofs_of_node(page)) {
+		f2fs_msg(sbi->sb, KERN_WARNING,
+			"Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
+			inode->i_ino, ofs_of_node(dn.node_page),
+			ofs_of_node(page));
+		err = -EFAULT;
+		goto err;
+	}
 
 	for (; start < end; start++, dn.ofs_in_node++) {
 		block_t src, dest;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
