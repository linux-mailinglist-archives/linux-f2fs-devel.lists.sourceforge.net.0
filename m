Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACED31CD1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:24:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX40A-0001Kd-72; Sat, 01 Jun 2019 13:24:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX409-0001KX-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z9fMz6EkatilESeqe6dZ4FkOF3XoJJuA5lTuiHoXpPQ=; b=knG5QlrNUsdsS3STVDzh6RD8ih
 Rokyo9o+OWI/Hky+ozfEE283JMBlFGK/UXb1jFiDqSmahtol6UxWS5lqbkTPWrDtRwlMuF6oU0jxF
 jo/3oFiNPYYPuZIYd8l7nFa6m3IARyJgAMSpcwulpotjhYAFL5LLmKQWqmauIT3HygFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z9fMz6EkatilESeqe6dZ4FkOF3XoJJuA5lTuiHoXpPQ=; b=Uxbr+veI1p2B7Exs77Zp80Cx9T
 ygB28rAmyf6eZ78I9HZQD1IBE8U41ib0XfWo+cu7JW75H1HTBEpUDJjcXawNKqGD3ioSBtSoK6NTl
 IgXjEAwft+gAG5bxRVPzTG463SWEv1xXnzzJ8aIarvDs1pvP6SGQWS0P+GB6W/v/8TNU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX408-0058zo-4Y
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:24:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8ED127358;
 Sat,  1 Jun 2019 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395482;
 bh=CnYtyKFPz7zE+XtWLlfig+4Gu1FfBpSVh+Gp+ChrUo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Aqa+FgyvAKqJ52SQUAFcSGmmOFmV5K10/PAcv3CfDug0xCeO5NV8clTftSehUP5ly
 UsNQh9BDZShpIluMXjD8lIe3T3tCqslHxr9ytpomE5eQUjbfJWOy0YWS8fS7n3AesX
 hNeAk/+XJgFHYwJv9FecaoGeW3+kCQVviqeM983Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:22:34 -0400
Message-Id: <20190601132346.26558-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132346.26558-1-sashal@kernel.org>
References: <20190601132346.26558-1-sashal@kernel.org>
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
X-Headers-End: 1hX408-0058zo-4Y
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 27/99] f2fs: fix to avoid panic in
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
index 6ea445377767d..65a82c5bafcbe 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -445,7 +445,15 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	get_node_info(sbi, dn.nid, &ni);
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
