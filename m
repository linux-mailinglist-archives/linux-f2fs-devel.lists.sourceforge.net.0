Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC207A87E14
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 12:53:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4HRU-0008Nk-Gt;
	Mon, 14 Apr 2025 10:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4HRT-0008NW-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 10:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5BMwUIMGU3cR6zd4dIn6JUCDdm7FE1MWoQaM0BR4ODI=; b=MCYE2joSJqLPqTTLiPfHNBJmHB
 YTosXlxMGtqDIS5S+DdfQyHP0YiRJZiqx9MGFsCMktteJ0Tg2zWJClzVGTcY7k3tVsO2TXc+z3MkA
 yuwh7B0xWf7VnXEaj3chOObKt5KTm3MyIaYCsa4TkSGOZkw93pQvGhPTlBWLLv6gVZGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5BMwUIMGU3cR6zd4dIn6JUCDdm7FE1MWoQaM0BR4ODI=; b=AoOmM7JzA3zE4Jn221FjLM/vN+
 X01itHubiy3XxpRsD2w655osQ9pNL30ESr2BhuNL/XpE/RYUvbMZjEMfgm2cKJyCTrRRnvJMG5+Y1
 fboK9HRSE1O1a1oBIJbEChp6y7R7MXxvWqctiQPUQ+TSOan4jjbYEdZXxuHimOoXVljo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4HRE-0005Tn-2B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 10:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA9084A48B;
 Mon, 14 Apr 2025 10:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52312C4CEE5;
 Mon, 14 Apr 2025 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744627990;
 bh=XJlZfQW1aybX0kMKYGtaAugSD+bmBNoAEbWNwMsoH2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kuVMIAAHd3Udrv0tceg5VNIgKRV9mU0g7FyAysdm0ComUD4peaghAVgMdMnSgLSnn
 50QPu3XPPDp2L8nOHIKWymBK8dlABV96vC94oaagBnq6w63LyKUDmP7dqzvVJP4Q3T
 db4vyDSdv3QGxlYLW5rg28mdU34Xz3XAo0JhM8GLAuiHZB5PQ6853P0vxmD3ZPL5ho
 8FMSqgl6Lm00zRtQ1wsnU2i2zSrGlnuJ91lnecOL6fxqHRNHiUr9xOG5yNJkL2y8GF
 szpo4bPo3Q5GX2cqSmcXlSODR8E4aGK674xI3G+Tle1Ua06R+50Zi8KbaEsm1bL3vm
 5PqDwwYM/OJVQ==
To: jaegeuk@kernel.org
Date: Mon, 14 Apr 2025 18:52:37 +0800
Message-ID: <20250414105237.728522-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250414105237.728522-1-chao@kernel.org>
References: <20250414105237.728522-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jan Prusakowski reported a f2fs bug as below: f2fs/007 will
 hang kernel during testing w/ below configs: kernel 6.12.18 (from
 pixel-kernel/android16-6.12)
 export MKFS_OPTIONS="-O encrypt -O extra_attr -O project_quota -O quota"
 export F2FS_MOUNT_OPTIONS="test_dummy_encryption, discard, fsync_mode=nobarrier
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4HRE-0005Tn-2B
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to detect gcing page in
 f2fs_is_cp_guaranteed()
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
Cc: Jan Prusakowski <jprusakowski@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jan Prusakowski reported a f2fs bug as below:

f2fs/007 will hang kernel during testing w/ below configs:

kernel 6.12.18 (from pixel-kernel/android16-6.12)
export MKFS_OPTIONS="-O encrypt -O extra_attr -O project_quota -O quota"
export F2FS_MOUNT_OPTIONS="test_dummy_encryption,discard,fsync_mode=nobarrier,reserve_root=32768,checkpoint_merge,atgc"

cat /proc/<umount_proc_id>/stack
f2fs_wait_on_all_pages+0xa3/0x130
do_checkpoint+0x40c/0x5d0
f2fs_write_checkpoint+0x258/0x550
kill_f2fs_super+0x14f/0x190
deactivate_locked_super+0x30/0xb0
cleanup_mnt+0xba/0x150
task_work_run+0x59/0xa0
syscall_exit_to_user_mode+0x12d/0x130
do_syscall_64+0x57/0x110
entry_SYSCALL_64_after_hwframe+0x76/0x7e

cat /sys/kernel/debug/f2fs/status

  - IO_W (CP: -256, Data:  256, Flush: (   0    0    1), Discard: (   0    0)) cmd:    0 undiscard:   0

CP IOs reference count becomes negative.

The root cause is:

After 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block
migration"), we will tag page w/ gcing flag for raw page of cluster
during its migration.

However, if the inode is both encrypted and compressed, during
ioc_decompress(), it will tag page w/ gcing flag, and it increase
F2FS_WB_DATA reference count:
- f2fs_write_multi_page
 - f2fs_write_raw_page
  - f2fs_write_single_page
   - do_write_page
    - f2fs_submit_page_write
     - WB_DATA_TYPE(bio_page, fio->compressed_page)
     : bio_page is encrypted, so mapping is NULL, and fio->compressed_page
       is NULL, it returns F2FS_WB_DATA
     - inc_page_count(.., F2FS_WB_DATA)

Then, during end_io(), it decrease F2FS_WB_CP_DATA reference count:
- f2fs_write_end_io
 - f2fs_compress_write_end_io
  - fscrypt_pagecache_folio
  : get raw page from encrypted page
  - WB_DATA_TYPE(&folio->page, false)
  : raw page has gcing flag, it returns F2FS_WB_CP_DATA
  - dec_page_count(.., F2FS_WB_CP_DATA)

In order to fix this issue, we need to detect gcing flag in raw page
in f2fs_is_cp_guaranteed().

Fixes: 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block migration")
Reported-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4f70755c30cc..0df60c3ca533 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -54,7 +54,7 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 	struct f2fs_sb_info *sbi;
 
 	if (fscrypt_is_bounce_page(page))
-		return false;
+		return page_private_gcing(fscrypt_pagecache_page(page));
 
 	inode = mapping->host;
 	sbi = F2FS_I_SB(inode);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
