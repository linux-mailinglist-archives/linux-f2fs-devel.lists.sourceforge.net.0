Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611D1252C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 21:10:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfe0-0000iX-Ex; Wed, 18 Dec 2019 20:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ihfdy-0000hx-EY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Um6j33Kg0NXBwrW76ltQ7j4RHv7kLcSQ7n92iD3iBg=; b=fQz14oOqIjdXasSfvtjWp4uTBx
 piGyLCR32U1+ghDbg5xCy+n4lEUNF+H4/8bxn5J5WlReAQQ0befhHV/O0hF3cQ3lqxFy4GnhXP1Hp
 K3UNgmo1cUjO1Qg95Ntyn1w+aQwRxAzMB5C0byx2ahBo0oWkPpstRI3nW0n56JLbcqX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Um6j33Kg0NXBwrW76ltQ7j4RHv7kLcSQ7n92iD3iBg=; b=aS+5KBCzTa0t9vZaghPEBOzuXe
 ACt0jvyheErRke9N8sjoud85ZqfXxe42jtac0wz6cr/f4ohF2ycthL1gDNm31mjvDDR8IsZJeV28c
 3QMmnZ5ZAxP94AFsDCsIHvhZ5SUYedY5mSL/BjtLvLcrGUb6erVMoSppAOyKj5IIfo+E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfdu-0091lK-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:02 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D46424650;
 Wed, 18 Dec 2019 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576699789;
 bh=W2uMCJVpanpiKWXRI26gL3PaRjh3Wk4iqNVcFWlQmck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WVjdznsmLsk/6M4cPCUDn12ivFAgiZtOffllkTOac3FUEK7TFFywLr1VDRClqt9+w
 1YzwlwVqy7o22UsjdZ8ZDAwei9fYhCoiu671cqccIBcH6I6VbzT0l/BO2ZGuc1ju2L
 ciRzz/1K9crParmMGPVjXxrFj+19geCADZpNzZwg=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Dec 2019 12:09:46 -0800
Message-Id: <20191218200947.20445-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191218200947.20445-1-jaegeuk@kernel.org>
References: <20191218200947.20445-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ihfdu-0091lK-Sw
Subject: [f2fs-dev] [PATCH 3/4] f2fs: declare nested quota_sem and remove
 unnecessary sems
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

1.
f2fs_quota_sync
 -> down_read(&sbi->quota_sem)
 -> dquot_writeback_dquots
  -> f2fs_dquot_commit
   -> down_read(&sbi->quota_sem)

2.
f2fs_quota_sync
 -> down_read(&sbi->quota_sem)
  -> f2fs_write_data_pages
   -> f2fs_write_single_data_page
    -> down_write(&F2FS_I(inode)->i_sem)

f2fs_mkdir
 -> f2fs_do_add_link
   -> down_write(&F2FS_I(inode)->i_sem)
   -> f2fs_init_inode_metadata
    -> f2fs_new_node_page
     -> dquot_alloc_inode
      -> f2fs_dquot_mark_dquot_dirty
       -> down_read(&sbi->quota_sem)

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9e85894d12c9..e6fb4b52eb91 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2158,7 +2158,7 @@ static int f2fs_dquot_commit(struct dquot *dquot)
 	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
 	int ret;
 
-	down_read(&sbi->quota_sem);
+	down_read_nested(&sbi->quota_sem, SINGLE_DEPTH_NESTING);
 	ret = dquot_commit(dquot);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
@@ -2182,13 +2182,10 @@ static int f2fs_dquot_acquire(struct dquot *dquot)
 static int f2fs_dquot_release(struct dquot *dquot)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
-	int ret;
+	int ret = dquot_release(dquot);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_release(dquot);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
@@ -2196,29 +2193,22 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
 {
 	struct super_block *sb = dquot->dq_sb;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int ret;
-
-	down_read(&sbi->quota_sem);
-	ret = dquot_mark_dquot_dirty(dquot);
+	int ret = dquot_mark_dquot_dirty(dquot);
 
 	/* if we are using journalled quota */
 	if (is_journalled_quota(sbi))
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
 
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_commit_info(struct super_block *sb, int type)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int ret;
+	int ret = dquot_commit_info(sb, type);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_commit_info(sb, type);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
