Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA7868560
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 02:00:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1relpN-0004lQ-Qp;
	Tue, 27 Feb 2024 01:00:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1relpM-0004lK-LZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 01:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKxmywUNfsLZD40OSctqIXSWsaKyd6MY7VQPBYa8mmI=; b=Rx6XeGrjhXhDIzJW8JNygmUAd/
 e+G3fMu6EH3k+zOkcST21aut4XT9TQvVcx8ispUHuj88+cKzfJEGzuTKykC1BCyQFHGp3iFG8ghcH
 LK27uZZUl3jfPanIYwe9N8ADmAp82vEC4YYdSR4+/Z5SgW+fDnzk0ZaEpZo4IuHqCEHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UKxmywUNfsLZD40OSctqIXSWsaKyd6MY7VQPBYa8mmI=; b=izfsLa7Vt+zKxUht8MXLjk7hdq
 e94NSLx+c4gwJ59FSq9Fk/m1LSrzV2S4iaL5u08XNgm607qKquwtF4sxc1fi1lQAaaZhFHVsr6cdP
 QeLiiPR3liA9P9NT7dtSGAu3CEgCDVCm6hMAemFtGZ5yEwsktLtt9ewzE2fsON4vSOf8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1relpI-0008JD-Nv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 01:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5633A61311
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82D9C433C7;
 Tue, 27 Feb 2024 00:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708995598;
 bh=PWnCDVadzwnCzOJQlQa+l48fd4sQecfuYbwfY7CEwaU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=kuCWLFkBYrC5qwm8KigVMjHB13jWyY1zqGAAZKA0HxmFMFZmydp1RcPLppjU8TQGw
 YMJxCMLoUVvpufpXx8ANbyax3TH1UXo4qWeNdaZvQP2Mb4NKsZXRcW1GA2j9bFZIoI
 fvC3/5wW1lx5xB8NplQCwRyqkHYXRyurbr3VE+bJGNyDQbekMDUodCxnYshV3pqzfP
 l0/yZ7rthdNyTfw2cJD7WBay1bte7RMVw0NuPMim4+lGZcVdCeaWv70TUw2XqXGj5R
 OrgeB5EXCV1ZaGVqewaxmzS1t6cF/H7PsbM+GMeSzFLxRgG5hS/qGWrrmJuPrJFAKX
 dJm8YtMhYYsUg==
Date: Mon, 26 Feb 2024 16:59:56 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Zd00DE6mXbt509sX@google.com>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223205535.307307-2-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Even if the roll forward recovery stopped due to any error, 
 we have to fix the write pointers in order to mount the disk from the previous
 checkpoint. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1relpI-0008JD-Nv
Subject: Re: [f2fs-dev] [PATCH 2/5 v2] f2fs: fix write pointers all the time
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Even if the roll forward recovery stopped due to any error, we have to fix
the write pointers in order to mount the disk from the previous checkpoint.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 from v1:
  - preserve error

 fs/f2fs/recovery.c | 15 +++++++--------
 fs/f2fs/super.c    | 11 +++++++----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index b3baec666afe..3078d5613748 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -863,7 +863,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	int ret = 0;
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
-	bool fix_curseg_write_pointer = false;
 
 	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "recover fsync data on readonly fs");
@@ -894,8 +893,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	else
 		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
 skip:
-	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
-
 	destroy_fsync_dnodes(&inode_list, err);
 	destroy_fsync_dnodes(&tmp_inode_list, err);
 
@@ -913,11 +910,13 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	 * and the f2fs is not read only, check and fix zoned block devices'
 	 * write pointer consistency.
 	 */
-	if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
-			f2fs_sb_has_blkzoned(sbi)) {
-		err = f2fs_fix_curseg_write_pointer(sbi);
-		if (!err)
-			err = f2fs_check_write_pointer(sbi);
+	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
+		int err2 = f2fs_fix_curseg_write_pointer(sbi);
+
+		if (!err2)
+			err2 = f2fs_check_write_pointer(sbi);
+		if (err2)
+			err = err2;
 		ret = err;
 	}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d91e57ca6110..77348fd0a42b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4674,11 +4674,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	 * If the f2fs is not readonly and fsync data recovery succeeds,
 	 * check zoned block devices' write pointer consistency.
 	 */
-	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
-		err = f2fs_check_write_pointer(sbi);
-		if (err)
-			goto free_meta;
+	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
+		int err2 = f2fs_check_write_pointer(sbi);
+
+		if (err2)
+			err = err2;
 	}
+	if (err)
+		goto free_meta;
 
 	f2fs_init_inmem_curseg(sbi);
 
-- 
2.44.0.rc1.240.g4c46232300-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
