Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8A46F34E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Dec 2021 19:43:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvONc-0006uG-FL; Thu, 09 Dec 2021 18:42:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mvONa-0006u5-Cl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 18:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gHY0dRvQC5JItuHB0carmdPNQ5S4IcJkVBfqPccw2Ak=; b=Mn0maeNAO7ikAjRQguXojqDlFq
 Wk1+L0fQyQ9Cc3w9CuWDfuUK2TG6quuVO/3O5tJJQX/ma74EL/AzgC6imHxdpjNryeOKTDT0k3ys9
 yvmivGWHdsjBR0OuvhX4QqBpAh+tNpNcBMBUZsnt79sTHBgdn/4QqSlUHYs0xZ6qTKmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gHY0dRvQC5JItuHB0carmdPNQ5S4IcJkVBfqPccw2Ak=; b=i
 /YE7ZTPgKzlmUYmS+GijWSQnYLTmcr5K7QLntmyuHsr2tJv5yeADOTU56qZT48MBoE+tkXeGDWOyJ
 snUc84GEL+X/v2ioT2z0w5Aa2weadp9FHmtqKeYNMuGrR9ihS/aR6aGFlgRKosb63+wnIpvDnb2L+
 6RowfVLYnytYxMhw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvONV-00AHE7-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Dec 2021 18:42:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7A0B2CE27AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Dec 2021 18:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97946C004DD;
 Thu,  9 Dec 2021 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639075356;
 bh=QiKstchJv+BrfI7jqC+XbVfFY9A5AR8xbhxUveQsJ84=;
 h=From:To:Cc:Subject:Date:From;
 b=RsQ6rNaDnRFnzSOu5reHuT5fA0es2TDMLC/VPNkc+94ULWCynlolNYOn/jz4UkaSz
 KcoLCkFBv5CQPqtf3i/tOQVipMZp32kp/BjOw2qUgp4CXPIQGFdxh1cNLy3GhXQRvH
 hirZ2p7YC13HbZBrZ/yCfgWxx6xGGCcYQNVt7zpu0BEGPmLEN1v+qKTSrDSWJ4PvCm
 lJX60yzsL4Zagdhztx9PFehYA8QUAOYV6LiOtkXEtqtBUqKMPQX1mTcodxFuesp82j
 tTdiqmzoG6a8ucKYmIxjLYUvLx7+G6mL4nWaKJKbRuVkTPcyPqt22ATNgZDxFIks+K
 eBlSFnAGbiNng==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  9 Dec 2021 10:42:34 -0800
Message-Id: <20211209184234.2583205-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Android OTA failed due to SBI_NEED_FSCK flag when pinning
 the file. Let's avoid it since we can do in-place-updates. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Change-Id:
 I3fd33c984417c10b38e23de6cec017b03d588945
 --- fs/f2fs/data.c | 7 +++++-- fs/f2fs/file.c | 10 +++++----- 2 files changed, 
 10 insertions(+), 7 [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvONV-00AHE7-Vh
Subject: [f2fs-dev] [PATCH] f2fs: avoid EINVAL by SBI_NEED_FSCK when pinning
 a file
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

Android OTA failed due to SBI_NEED_FSCK flag when pinning the file. Let's avoid
it since we can do in-place-updates.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Change-Id: I3fd33c984417c10b38e23de6cec017b03d588945
---
 fs/f2fs/data.c |  7 +++++--
 fs/f2fs/file.c | 10 +++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a9652a8e669b..40c0d1426a11 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2525,6 +2525,11 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
+	/* The below cases were checked when setting it. */
+	if (f2fs_is_pinned_file(inode))
+		return false;
+	if (fio && is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+		return true;
 	if (f2fs_lfs_mode(sbi))
 		return true;
 	if (S_ISDIR(inode->i_mode))
@@ -2533,8 +2538,6 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (f2fs_is_atomic_file(inode))
 		return true;
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
-		return true;
 
 	/* swap file is migrating in aligned write mode */
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a15f8ba239f0..5ec6bef3937f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3145,17 +3145,17 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
-	if (f2fs_should_update_outplace(inode, NULL)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	if (!pin) {
 		clear_inode_flag(inode, FI_PIN_FILE);
 		f2fs_i_gc_failures_write(inode, 0);
 		goto done;
 	}
 
+	if (f2fs_should_update_outplace(inode, NULL)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (f2fs_pin_file_control(inode, false)) {
 		ret = -EAGAIN;
 		goto out;
-- 
2.34.1.173.g76aa8bc2d0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
