Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6854DA805FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Apr 2025 14:22:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u27yY-00039c-Ur;
	Tue, 08 Apr 2025 12:22:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u27yX-00039L-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 12:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LmkCu8qWIN6cBjzReQV2DOlwYBiTmQn/Zyoh/tZ9qtM=; b=cTaGzZ1kAKtDt3f8YyOUfwdEuz
 0kSBvYQLXVi+k0S0fTBMtpLctkXgbKAWWa9mzT8ZDpoyYtu8MNTs+gO61quUPlWPPkMdngxum0veD
 u2jkqm88C7yHX3oN6nr1ryhOblbdDMdIZQTiEfOmH9Qe6UfgtxTpvLRcmlGgsXU6vaJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LmkCu8qWIN6cBjzReQV2DOlwYBiTmQn/Zyoh/tZ9qtM=; b=I
 Kf2kEQWdwR2k3v4WeYKknbPEbhSZ5hgEPP+QXVh5zFkfkSKMAz63Qzu80OM9Z+S9hhiiiRiPOwmPn
 Guw0JgFma1iGKcHMal45Y+KTWeNpO//ti8XJ0LSXcBkaTfv3TT3E9fOqrv6PYMh8rrANxvi2IoYRz
 M2bMMQ7+NEbKuZUQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u27yI-0005Lb-58 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 12:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1518344D12;
 Tue,  8 Apr 2025 12:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99143C4CEE5;
 Tue,  8 Apr 2025 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744114939;
 bh=r2J6vA7Dd75tuAR7ijQs2wxGAzGC/OLb0q2cwN2w/Vg=;
 h=From:To:Cc:Subject:Date:From;
 b=chjWMUocta0tzTN0SAp03bxejynsdX+/U50ioCAtzzi6ktkupEeZKKISJkBTXGEPN
 2yn3YCU0TtGhzGKavdjBFzGtPdlaqCawLEfvy5hmtzj5aaL3WbaAIwILLiLa7V8CTL
 HwYuHqZ0+flTfr4ZY0aPbJvcXmwbHxuyUe5M3xaq7xobzoG0iPQysuxYFssxZGsbGJ
 3VcmNqvGFd7jcXAEOafcFOcyi5WqFkQ3IVSbQ7ElbWFtEttOUADDG7a0G/x5I4ERlG
 zGGxXGEbkdkHn5lkNTdwaR0n3NRmHujSk7g/I6zaaxXXs1NB3Ap3AyhYJT7fBfNg7I
 1A0qDt0iMe83Q==
To: jaegeuk@kernel.org
Date: Tue,  8 Apr 2025 20:22:08 +0800
Message-ID: <20250408122208.2297777-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported a f2fs bug as below: [ cut here ] kernel BUG
 at fs/f2fs/f2fs.h:2521! RIP: 0010:dec_valid_block_count+0x3b2/0x3c0
 fs/f2fs/f2fs.h:2521
 Call Trace: f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs [...] 
 Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u27yI-0005Lb-58
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 sbi->total_valid_block_count
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reported a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/f2fs.h:2521!
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Call Trace:
 f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
 truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
 truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
 f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
 f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
 f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
 notify_change+0xbca/0xe90 fs/attr.c:552
 do_truncate+0x222/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3466 [inline]
 do_open fs/namei.c:3849 [inline]
 path_openat+0x2e4f/0x35d0 fs/namei.c:4004
 do_filp_open+0x284/0x4e0 fs/namei.c:4031
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_creat fs/open.c:1522 [inline]
 __se_sys_creat fs/open.c:1516 [inline]
 __x64_sys_creat+0x124/0x170 fs/open.c:1516
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94

The reason is: in fuzzed image, sbi->total_valid_block_count is
inconsistent w/ mapped blocks indexed by inode, so, we should
not trigger panic for such case, instead, let's print log and
set fsck flag.

Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Reported-by: syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/67f3c0b2.050a0220.396535.0547.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f8f7ec4c644c..9915f31ee2d1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2526,8 +2526,14 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK;
 
 	spin_lock(&sbi->stat_lock);
-	f2fs_bug_on(sbi, sbi->total_valid_block_count < (block_t) count);
-	sbi->total_valid_block_count -= (block_t)count;
+	if (unlikely(sbi->total_valid_block_count < count)) {
+		f2fs_warn(sbi, "Inconsistent total_valid_block_count:%u, ino:%lu, count:%u",
+			  sbi->total_valid_block_count, inode->i_ino, count);
+		sbi->total_valid_block_count = 0;
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+	} else {
+		sbi->total_valid_block_count -= count;
+	}
 	if (sbi->reserved_blocks &&
 		sbi->current_reserved_blocks < sbi->reserved_blocks)
 		sbi->current_reserved_blocks = min(sbi->reserved_blocks,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
