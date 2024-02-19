Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C1859ABA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 03:29:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbtP1-0007oP-5P;
	Mon, 19 Feb 2024 02:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbtOz-0007oI-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 02:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcbvIWnboZFfFe9LfmvMsZ5TmJ1Ms6fvjfbT8b3gtxw=; b=ii7AzQriCGcjgfMedPO/XKDqfc
 n7+2mKn9aV7Y1i41N32HL8xrCJ22F1DnQaFuLBNn99BFH/8dEcFEASp/VVrxrIUShNlp5wlExMNeg
 uhfvxVRKFKOsEqnJQxoWMrFio1Ycigpzep0rvSpbEW+ZLlUugtvYk26uNAVrx471k2X4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dcbvIWnboZFfFe9LfmvMsZ5TmJ1Ms6fvjfbT8b3gtxw=; b=j
 Q0oRydaTsGY1y0OCGSLaYtcWGqjPsHU44E1uxTE1P/EKDBwwXRW1h9oPkdIDqLyXccj2CsSkdu5NQ
 EKafv9RHYi4medblL+ssRwoqwRlfBUND16o5aLYk7Vsw9F/95Xd4/RGfmFqrLw8RmRjRaSGQdOxPk
 4xtuc8tBDbbYhke8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbtOu-00065D-Ok for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 02:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB4FE60C20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Feb 2024 02:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE51C433C7;
 Mon, 19 Feb 2024 02:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708309731;
 bh=eM91wp5LBAx8zwOBUALHG4hfaSPH2/dYptc//f0MnoY=;
 h=From:To:Cc:Subject:Date:From;
 b=Vt560GmYBuyRJ26CzATnwp7aqyLWr1MABA/yKZVulnb5NFml42f7DtlJwzNNx9ljw
 9ZgBfXul2d4fKm88yTFpdf6SFXvF+x2rQl4YLS1iQbc0Zwcmb+gWRe9ovjRSp4RrNe
 2UakcO/BEC1ho/NcrZfRkftZ22A0x7W9Hsvf7u+1Ogdnhn0qBJnfYurLFhcVCnp1uD
 qHazk3FBCu74DsOIPO2wWvtcCjzFkNi7w5ZSZ+7vdvrYMr3p1gsh7f/Azr2MaQy1jO
 4Ab2QG+DL9wBYPhw6Y9W7L0W4DNdVssJlqSLTeN9umTuf1d6Z0VgUWOH3rwI6TtsKa
 OoAFWVXtFlkZw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Feb 2024 10:28:44 +0800
Message-Id: <20240219022844.3461390-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It needs to check compress flag w/ .i_sem lock, otherwise,
 compressed inode may be disabled after the check condition, it's not needed
 to set compress option on non-compress inode. Fixes: e1e8debec656 ("f2fs:
 add F2FS_IOC_SET_COMPRESS_OPTION ioctl") Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/file.c | 12 ++++++++---- 1 file changed, 8 insertions(+),
 4 deletions(-)
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbtOu-00065D-Ok
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to check compress flag w/
 .i_sem lock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It needs to check compress flag w/ .i_sem lock, otherwise, compressed
inode may be disabled after the check condition, it's not needed to
set compress option on non-compress inode.

Fixes: e1e8debec656 ("f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e1e9b98f4408..62b51ac550f0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4028,16 +4028,20 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 				sizeof(option)))
 		return -EFAULT;
 
-	if (!f2fs_compressed_file(inode) ||
-			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
-			option.algorithm >= COMPRESS_MAX)
+	if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+		option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
+		option.algorithm >= COMPRESS_MAX)
 		return -EINVAL;
 
 	file_start_write(filp);
 	inode_lock(inode);
 
 	f2fs_down_write(&F2FS_I(inode)->i_sem);
+	if (!f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
 		ret = -EBUSY;
 		goto out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
