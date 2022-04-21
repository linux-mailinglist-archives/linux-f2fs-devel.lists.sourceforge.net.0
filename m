Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E450A4FE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 18:06:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhZJu-00031M-6c; Thu, 21 Apr 2022 16:06:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nhZJs-00031C-I0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 16:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=41kN55QSH1Ax2Txdf1K7qT3TMBmRq5VaoT5UUl6yWHQ=; b=geMBj3zGYej+DOh5knN+BKXRnt
 4rGonDdE33Rc4y095j7TW7volx9rBTTgGJpMiKy72oSb5Or5+A7xaiu28ltpvkkiQIuYUTYRCFSJW
 kbCyqkNQvG35kGMMXGtM3FfKTBgCcbOCVPdR0/ow1/2MPxqPBhI6OgTTBpWdyihThBBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=41kN55QSH1Ax2Txdf1K7qT3TMBmRq5VaoT5UUl6yWHQ=; b=dUCL4Zl8GiDkfj3Wy2bmFSPOg+
 a+srKEMlNMYzKrwPXhZGvIe3IqDsw3GS1aGuvDk+BDRBoLNrKjM1W9qBcfagxRDkOnA6D9loDvxNK
 K6SFxwMUdQ7doXzHeYJPsUyNCwQbAM+Cq0O5ivMFWFpbaewhV/jRN36XFrcO+eO1OsYU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhZJp-0005y4-TO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 16:06:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE85261CDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 16:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1128BC385A1;
 Thu, 21 Apr 2022 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650557159;
 bh=VVe3j0YQ+Cidqf5v6vAbgMUL/5uLwWmI3G/CApfYCig=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=or6jC1vCCTurM4j5pClK6zvbFvQ2JvEIHkWSQciAvTyrHMZH8A5ukoCq0d2uORHS+
 BoxqGZp5c/YzEIBmg6T2J0jl5mBLpcxvD8exCYcKF4U9G3tzLwSFidg2Yo3RNoSkVQ
 1zGz0d3nuSK9ZGPC34/U3Km7oIjxm8Bngpn/SS770L868tlhrUYGjAp6mEXzueWadX
 THAO6YSe9zyY4IpJnXAoTkS4UbsSblME3HHt33iGRDgPVOAoMuYcFeu28eqtcaslQe
 YKDLZC5SE79CxEi5swtmi3De4ZnNj2MceQ1W3C7EwRTL53PAfvOG3CPYCrr8R5zEmT
 aPZDZUP050OjA==
Date: Thu, 21 Apr 2022 09:05:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YmGA5X4mtmXc3p/m@google.com>
References: <20220419215703.1271395-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419215703.1271395-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The block layer for zoned disk can reorder the FUA'ed IOs.
 Let's use flush command to keep the write order. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- change log from v1: - minor clean up 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhZJp-0005y4-TO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use flush command instead of FUA
 for zoned device
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

The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
command to keep the write order.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 change log from v1:
  - minor clean up

 fs/f2fs/file.c | 3 ++-
 fs/f2fs/node.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f08e6208e183..eae2e7908072 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -372,7 +372,8 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
 	clear_inode_flag(inode, FI_APPEND_WRITE);
 flush_out:
-	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
+	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
+	    (atomic && !test_opt(sbi, NOBARRIER) && f2fs_sb_has_blkzoned(sbi)))
 		ret = f2fs_issue_flush(sbi, inode->i_ino);
 	if (!ret) {
 		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c45d341dcf6e..144f9f966690 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1631,7 +1631,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		goto redirty_out;
 	}
 
-	if (atomic && !test_opt(sbi, NOBARRIER))
+	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
 		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
 
 	/* should add to global list before clearing PAGECACHE status */
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
