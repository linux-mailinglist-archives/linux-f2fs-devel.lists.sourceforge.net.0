Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2EA7AA0D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 21:07:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0PuW-0008Nw-J2;
	Thu, 03 Apr 2025 19:07:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1u0PuV-0008No-WB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 19:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uG3ed3esnKfGbQQZaL3ctAhwisabm703xo1P589jUwU=; b=LbCU6qR0VlihqdLPY6/zF56Lsl
 K7CdVHS7erRSlSRWKYJ0Sq5xj9YXmaVOe/+H4KHKwQcFDdxnPaXb8ZyG9Vg4NpnHv+ynv9DgvWHps
 oy3vyc4Gth51H6P/4U6ihu+hVhtzJIVzZYLs+Bg/XnF4J2CPt2bemgQou9QBLh03sxT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uG3ed3esnKfGbQQZaL3ctAhwisabm703xo1P589jUwU=; b=LZQtGLgLC0sMEdX7aY+UGhyNyr
 3N1qS1LAHwKUPJfr15G/rqJD0a0bz2kGgbrAblwxG+U/yMsN3K1WxpbA15uiy+QcJuDmerEBHWZM5
 MEi4t45Lh2hgWywzY51UuDD0HY9cpEiE6wWkfjlpl8dilsM5jbWpAJeiaT6Xgy+BNuGM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0PuG-00033s-8z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 19:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E01045C6360;
 Thu,  3 Apr 2025 19:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F93C4CEE3;
 Thu,  3 Apr 2025 19:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707225;
 bh=VYrQO1AyZi43synEQdMcCkeM8IUAyulQVQGQxHIxkpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=txWBqqf7Mr6m828ppTMNKZGv1E9lCM91j9Jam2kESCOOXOZnQEmTNprp0Jlx6H+yM
 Nuv347kppq960edSTNxb3xPqKG9IDR6pv3hmCG3JAXFynx3qfRQuF9boqg1eRDWnZZ
 EiXAF+siurABmist+xQftm/3erQvCPYYqIfV84h5tdTBtK51XrziSNIjlW56pVzR8H
 n1fFBReKgIYLgr2omVyFMPO1sj8g9e6PA9log76W8LCt7GSNWlLbyAPVq9kXrcsHo1
 Te6xmCV56TvT0U6RwNk5Kunqn6y9nmMUhIubkdvEfdt4PWAE19scKUPMnaGVw7Bb3t
 jdTUmdJo7asfw==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  3 Apr 2025 15:05:35 -0400
Message-Id: <20250403190555.2677001-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190555.2677001-1-sashal@kernel.org>
References: <20250403190555.2677001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 e6494977bd4a83862118a05f57a8df40256951c0
 ] syzbot reports an UBSAN issue as below: 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u0PuG-00033s-8z
Subject: [f2fs-dev] [PATCH AUTOSEL 6.12 27/47] f2fs: fix to avoid
 out-of-bounds access in f2fs_truncate_inode_blocks()
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: syzbot+6653f10281a1badc749e@syzkaller.appspotmail.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit e6494977bd4a83862118a05f57a8df40256951c0 ]

syzbot reports an UBSAN issue as below:

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/f2fs/node.h:381:10
index 18446744073709550692 is out of range for type '__le32[5]' (aka 'unsigned int[5]')
CPU: 0 UID: 0 PID: 5318 Comm: syz.0.0 Not tainted 6.14.0-rc3-syzkaller-00060-g6537cfb395f3 #0
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 get_nid fs/f2fs/node.h:381 [inline]
 f2fs_truncate_inode_blocks+0xa5e/0xf60 fs/f2fs/node.c:1181
 f2fs_do_truncate_blocks+0x782/0x1030 fs/f2fs/file.c:808
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:836
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:886
 f2fs_file_write_iter+0x1bdb/0x2550 fs/f2fs/file.c:5093
 aio_write+0x56b/0x7c0 fs/aio.c:1633
 io_submit_one+0x8a7/0x18a0 fs/aio.c:2052
 __do_sys_io_submit fs/aio.c:2111 [inline]
 __se_sys_io_submit+0x171/0x2e0 fs/aio.c:2081
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f238798cde9

index 18446744073709550692 (decimal, unsigned long long)
= 0xfffffffffffffc64 (hexadecimal, unsigned long long)
= -924 (decimal, long long)

In f2fs_truncate_inode_blocks(), UBSAN detects that get_nid() tries to
access .i_nid[-924], it means both offset[0] and level should zero.

The possible case should be in f2fs_do_truncate_blocks(), we try to
truncate inode size to zero, however, dn.ofs_in_node is zero and
dn.node_page is not an inode page, so it fails to truncate inode page,
and then pass zeroed free_from to f2fs_truncate_inode_blocks(), result
in this issue.

	if (dn.ofs_in_node || IS_INODE(dn.node_page)) {
		f2fs_truncate_data_blocks_range(&dn, count);
		free_from += count;
	}

I guess the reason why dn.node_page is not an inode page could be: there
are multiple nat entries share the same node block address, once the node
block address was reused, f2fs_get_node_page() may load a non-inode block.

Let's add a sanity check for such condition to avoid out-of-bounds access
issue.

Reported-by: syzbot+6653f10281a1badc749e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/66fdcdf3.050a0220.40bef.0025.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4d7b9fd6ef31a..9fc07737d8661 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1134,7 +1134,14 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	trace_f2fs_truncate_inode_blocks_enter(inode, from);
 
 	level = get_node_path(inode, from, offset, noffset);
-	if (level < 0) {
+	if (level <= 0) {
+		if (!level) {
+			level = -EFSCORRUPTED;
+			f2fs_err(sbi, "%s: inode ino=%lx has corrupted node block, from:%lu addrs:%u",
+					__func__, inode->i_ino,
+					from, ADDRS_PER_INODE(inode));
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+		}
 		trace_f2fs_truncate_inode_blocks_exit(inode, level);
 		return level;
 	}
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
