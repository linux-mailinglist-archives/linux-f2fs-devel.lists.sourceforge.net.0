Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83BA96841
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Apr 2025 13:57:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7CFW-0006xh-TB;
	Tue, 22 Apr 2025 11:57:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7CFV-0006xV-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 11:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n4yc+a9VfKFRxa0AYSXo7YxA9m11WkSZhheY6eDmzKk=; b=iamHamjxNQCzd596qJzqr06TUa
 8X+k5uMWjZzCLuf0JgUJFyIhDvtcBYsXToyDDy3fXRY7UgoGzFcgFGQeD6PwrR5IAKVZgvoptoOYk
 Rwabqju0h+Is7X5LVbeNjk/upWeaGoaognW3Mg9LeOvQtcTPJ4m2MuSEd0bL5QuB1CQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n4yc+a9VfKFRxa0AYSXo7YxA9m11WkSZhheY6eDmzKk=; b=i
 SRHjZoKvcKh+H3uow96ZqOVLB5LHiImgOWRUBEY+RarFntJhoMoDAgiJjMzSpRyKaTAFL0AGIMPiC
 Cy/rCzx6RVXidfFRn0zl4CCHksOMdyZ6p6biqSaJOHVQA6j7FAHVa5LBPDdXY88eFsHZC0gpuLj72
 QPPqcNpcfXN8i8AA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7CFG-0001w3-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 11:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 16F1961365
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Apr 2025 11:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9036C4CEE9;
 Tue, 22 Apr 2025 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745323007;
 bh=AXrhhHlWNAtGFoAIFWHnKBM9EQYCCzf/HjO5YRahPEc=;
 h=From:To:Cc:Subject:Date:From;
 b=pL2hMj4bs9wyntPdv5CpWVUNCVU23EW1Xe09MhmfHX8gvM0iAQzfxfYYkYIW3SbHJ
 nhfjDdF+rtCOkIUkTvYPcuzUzeMovLzGeNAmEtJGnb4FDWv6HcjVqSw1Nkz6lm/sP5
 ZnU5yj0RqhBDe9f1Fm+cWanKLMXVJ6EtjPm3dP0c9kFvyTmCWuX/9OsRBdz5oVOs5j
 79t7e+9R7zcuIV5DH1H/FggKStsjUrcchTG8MgfdjiG8CcxOvF0qe0GTDPCxxgHCMY
 NfwGlz1ye957hTAgkhgZYYX/N+DcZgDZvOZ4rH1k7cdEJ/t7RG+3D66zU6EQaZJ3J9
 vPIo/ZuUKeC8Q==
To: jaegeuk@kernel.org
Date: Tue, 22 Apr 2025 19:56:38 +0800
Message-ID: <20250422115638.123455-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [ cut here ] WARNING: CPU: 3 PID: 579 at
 fs/f2fs/segment.c:2832
 new_curseg+0x5e8/0x6dc pc : new_curseg+0x5e8/0x6dc Call trace:
 new_curseg+0x5e8/0x6dc f2fs_allocate_data_block+0 [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7CFG-0001w3-Lf
Subject: [f2fs-dev] [PATCH] f2fs: fix to bail out in get_new_segment()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

------------[ cut here ]------------
WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832 new_curseg+0x5e8/0x6dc
pc : new_curseg+0x5e8/0x6dc
Call trace:
 new_curseg+0x5e8/0x6dc
 f2fs_allocate_data_block+0xa54/0xe28
 do_write_page+0x6c/0x194
 f2fs_do_write_node_page+0x38/0x78
 __write_node_page+0x248/0x6d4
 f2fs_sync_node_pages+0x524/0x72c
 f2fs_write_checkpoint+0x4bc/0x9b0
 __checkpoint_and_complete_reqs+0x80/0x244
 issue_checkpoint_thread+0x8c/0xec
 kthread+0x114/0x1bc
 ret_from_fork+0x10/0x20

get_new_segment() detects inconsistent status in between free_segmap
and free_secmap, let's record such error into super block, and bail
out get_new_segment() instead of continue using the segment.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c       | 6 +++++-
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 34382447f717..037d06d58fda 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2842,7 +2842,11 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 got_it:
 	/* set it as dirty segment in free segmap */
-	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
+	if (test_bit(segno, free_i->free_segmap)) {
+		ret = -EFSCORRUPTED;
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_FREE_BITMAP);
+		goto out_unlock;
+	}
 
 	/* no free section in conventional device or conventional zone */
 	if (new_sec && pinning &&
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index c24f8bc01045..5206d63b3386 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -78,6 +78,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
 	STOP_CP_REASON_NO_SEGMENT,
+	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
