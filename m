Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2131CD3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:24:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX40C-0003pu-6A; Sat, 01 Jun 2019 13:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX40B-0003po-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRID4Uf2ITtdDCjX0TdB/Y4YZ/uQR9TQztGgJ8purPI=; b=f6iT8O9N9cMYa7AQXsdjFb/lO+
 VfU5IQ4FIhjesN9pEt5v4oWOhAs4bpkS7jDKjjGkqcff+ek3keTIEQntIzNnzUt2KTAogROFPZMTj
 fJhqTXTj8LoAIe5sZt3U2V6OK6IPk0CUhVhoYsg4iP2L12SZc7OERtTpfZOcJ8n0EYqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRID4Uf2ITtdDCjX0TdB/Y4YZ/uQR9TQztGgJ8purPI=; b=JbIpHdrV812S9mIfq7Ew/4MTA3
 DyVxLMNsamZytvWNzf8VadcTdqgaKWlMSZFwFZj0N/MoJCIyigwacygwfjGPqzxxQ13y/PJmH/IST
 Dn7nFZCYaF0XBRPaL52ttTV0WRYcJ+Ia2yca3QBnU1lDBkCXu4nZIH7Gizx1gA0XLkJk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX40A-00ECkm-6c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:24:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0618D27355;
 Sat,  1 Jun 2019 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395484;
 bh=AkOn2ipxa+P1naMqDjVhF/at0UJoRCL8+OY8kflwL6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FId1KReKVKNj1Hxq10LrvwYJqnKdeus+gvuafTloB1o/VabdDpImYE0HdmIPb6wAM
 FwNQ4NsCgzkMTy+P7vfAXFxXGuyC/UrmlN/GKxiiH4foIAoQEbsdRELURLnSPnhLgU
 4mqfrymXDjE1CHoaTE4JIITfmt93Bwg1SbbB9Of0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:22:36 -0400
Message-Id: <20190601132346.26558-29-sashal@kernel.org>
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
X-Headers-End: 1hX40A-00ECkm-6c
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 29/99] f2fs: fix to avoid panic in
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
index 634165fb64f15..daa136ec3b1ec 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1539,6 +1539,7 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
+void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...);
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
@@ -1547,9 +1548,17 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 	f2fs_bug_on(sbi, sbi->total_valid_block_count < (block_t) count);
-	f2fs_bug_on(sbi, inode->i_blocks < sectors);
 	sbi->total_valid_block_count -= (block_t)count;
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
 
@@ -2371,7 +2380,6 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 
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
