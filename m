Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 758EF2CE032
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 21:55:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkvdn-0002j7-UO; Thu, 03 Dec 2020 20:55:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kkvdm-0002j0-NH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 20:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JUhMJgxcz5WQkdY44aokDUTPMW+aWanq2GtfxQ3kft8=; b=DsMmwybq2FHUwt/OhCnRg2hCSI
 jMBfRGWD7twEjaTDTQ6UdCt8mXpi9Q9lL9onu4FQvqOjbL3uIl3xsHY/Lj0Jk88SJpHp3ywNG8Bsa
 +bkE3nmfFFDPtVjUptKrZtluLnLVcWFsLAvDgMp65PupC66XpSZiIMg0BTWtQx1vDZy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JUhMJgxcz5WQkdY44aokDUTPMW+aWanq2GtfxQ3kft8=; b=Y
 yjh87DyXM0h3EK3t2FBOMXcjlT5iYHnTHySy+9zTNctgu8MzaupH2LJUdOOjd7FFUifFtzFqoQozN
 +EpWZLGizOYL83akd4HhKG+LNIwZYz3W2uOpqj2Zy3BGCuohakn+CyD3bOeYIi/efQ7TfOcHHnXbQ
 ZGb1/Ow1wSN2F1yQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkvde-00E1Xw-7R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 20:55:50 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  3 Dec 2020 12:55:21 -0800
Message-Id: <20201203205522.891082-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kkvde-00E1Xw-7R
Subject: [f2fs-dev] [PATCH 1/2] f2fs: don't allow any writes on readonly
 mount
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

generic_make_request: Trying to write to read-only block-device dm-5 (partno 0)
WARNING: CPU: 7 PID: 546 at block/blk-core.c:2190 generic_make_request_checks+0x664/0x690
pc : generic_make_request_checks+0x664/0x690
lr : generic_make_request_checks+0x664/0x690
Call trace:
 generic_make_request_checks+0x664/0x690
 generic_make_request+0xf0/0x3a4
 submit_bio+0x80/0x250
 __submit_merged_bio+0x368/0x4e0
 __submit_merged_write_cond.llvm.12294350193007536502+0xe0/0x3e8
 f2fs_wait_on_page_writeback+0x84/0x128
 f2fs_convert_inline_page+0x35c/0x6f8
 f2fs_convert_inline_inode+0xe0/0x2e0
 f2fs_file_mmap+0x48/0x9c
 mmap_region+0x41c/0x74c
 do_mmap+0x40c/0x4fc
 vm_mmap_pgoff+0xb8/0x114
 vm_mmap+0x34/0x48
 elf_map+0x68/0x108
 load_elf_binary+0x538/0xb70
 search_binary_handler+0xac/0x1dc
 exec_binprm+0x50/0x15c
 __do_execve_file+0x620/0x740
 __arm64_sys_execve+0x54/0x68
 el0_svc_common+0x9c/0x168
 el0_svc_handler+0x60/0x6c
 el0_svc+0x8/0xc

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/inline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 92e9852d316a..d09a0bdc0197 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -188,7 +188,8 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	struct page *ipage, *page;
 	int err = 0;
 
-	if (!f2fs_has_inline_data(inode))
+	if (!f2fs_has_inline_data(inode) ||
+			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
 		return 0;
 
 	page = f2fs_grab_cache_page(inode->i_mapping, 0, false);
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
