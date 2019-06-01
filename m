Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A049231BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3uZ-0000sP-AG; Sat, 01 Jun 2019 13:19:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3uY-0000sD-50
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4ASZ48ZAMq2msKJlgXiq/AJQaa4wm1s+Lw4m6TAz3M=; b=KQZI1SFTL2b9CGuqjMLD3T6rwk
 k9fUotgAQhSRMaElBJWXrpyjJw2DbUAXo6jPHS+3F5XVXbyWWknP4znrCrYqM7kBIEzZSZZ8Q7oo2
 azoQQEVnzPDNYzkko4pd8X0vY99aUiZLh91h/L5AdsQQTFqLdNcTV1l7DGp0GN8s5MVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z4ASZ48ZAMq2msKJlgXiq/AJQaa4wm1s+Lw4m6TAz3M=; b=klMzdffgA4YWF8SMkT6tdVhe+w
 I0tGKf2EY/z/VeoJyqR1AkTzqiRgbpZIiO+ojvIlRfYxUYbWsFbuHREOLLpauHd2Xjjtj++i4UMHH
 eCrJndl5ByecUW/KxXFogpaGD1CxdjcqA7CrW/QZNFZkCYnhKeV2F4gnIssUmkpqPE+s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3uW-00Ebuo-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:19:02 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 604C2272B4;
 Sat,  1 Jun 2019 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395128;
 bh=3jTmvq2cT+ZvZ9zG11JxSNmqh8KZfuc/h9w6ZwZ3sbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LPvYAmnk9Fmvw0Fxv5oL04qCYvWiPuhKHRZeGtPE1jUA0kLOwfIkkUnD+FnEdwg/f
 UlfclVpUHixm5ZbPuW/SS/1uelzTooL3AK/BFBf51knWCwJwF7Fh6dCeYkABNhP0MW
 9+7gBgE2D8DdpEwKSJe6tv2wf4q2Y4xJ5VezKS/c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:27 -0400
Message-Id: <20190601131653.24205-51-sashal@kernel.org>
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
X-Headers-End: 1hX3uW-00Ebuo-Pn
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 051/186] f2fs: fix to avoid panic in
 dec_valid_node_count()
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

[ Upstream commit ea6d7e72fea49402aa445345aade7a26b81732e3 ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203213

- Overview
When mounting the attached crafted image and running program, I got this error.
Additionally, it hangs on sync after running the this script.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
mkdir test
mount -t f2fs tmp.img test
cp a.out test
cd test
sudo ./a.out
sync

 kernel BUG at fs/f2fs/f2fs.h:2012!
 RIP: 0010:truncate_node+0x2c9/0x2e0
 Call Trace:
  f2fs_truncate_xattr_node+0xa1/0x130
  f2fs_remove_inode_page+0x82/0x2d0
  f2fs_evict_inode+0x2a3/0x3a0
  evict+0xba/0x180
  __dentry_kill+0xbe/0x160
  dentry_kill+0x46/0x180
  dput+0xbb/0x100
  do_renameat2+0x3c9/0x550
  __x64_sys_rename+0x17/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The reason is dec_valid_node_count() will trigger kernel panic due to
inconsistent count in between inode.i_blocks and actual block.

To avoid panic, let's just print debug message and set SBI_NEED_FSCK to
give a hint to fsck for latter repairing.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
[Jaegeuk Kim: fix build warning and add unlikely]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 10240fbdd396d..e2cf567dcbd7c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2029,7 +2029,6 @@ static inline void dec_valid_node_count(struct f2fs_sb_info *sbi,
 
 	f2fs_bug_on(sbi, !sbi->total_valid_block_count);
 	f2fs_bug_on(sbi, !sbi->total_valid_node_count);
-	f2fs_bug_on(sbi, !is_inode && !inode->i_blocks);
 
 	sbi->total_valid_node_count--;
 	sbi->total_valid_block_count--;
@@ -2039,10 +2038,19 @@ static inline void dec_valid_node_count(struct f2fs_sb_info *sbi,
 
 	spin_unlock(&sbi->stat_lock);
 
-	if (is_inode)
+	if (is_inode) {
 		dquot_free_inode(inode);
-	else
+	} else {
+		if (unlikely(inode->i_blocks == 0)) {
+			f2fs_msg(sbi->sb, KERN_WARNING,
+				"Inconsistent i_blocks, ino:%lu, iblocks:%llu",
+				inode->i_ino,
+				(unsigned long long)inode->i_blocks);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			return;
+		}
 		f2fs_i_blocks_write(inode, 1, false, true);
+	}
 }
 
 static inline unsigned int valid_node_count(struct f2fs_sb_info *sbi)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
