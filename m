Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EB82A7C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 07:44:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNone-000248-0e;
	Thu, 11 Jan 2024 06:44:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNonc-000242-7b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nS3yEtZzKvSluZ6LIwm28rAt0s8KRshkEHKE0yeCqS4=; b=mUQf041cEO34vR1BHLx8kZz3Tv
 2DhBgrcOc0UC5sD97MqLLScA0xfZuCbPv8BWDy2XPQU8QGDDNMT6Fm5mmOkBgYoEh9/Hx+w7GAkvv
 KJcrVumXq6ESdS5ZSW1kINaycZCjEhzWfVvI/xwyr7/Xxb07Xy9XtSOPESdWtDEmyaQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nS3yEtZzKvSluZ6LIwm28rAt0s8KRshkEHKE0yeCqS4=; b=G
 1iJa4+EubnEZI2X9B0qHSdz1c9GrrHlml2uaWQgeUWvcsGLZdmQBDdVZxscJisfQTL/dfI8JKMi3M
 zWhFWmox7slLhgg8qeFEsDtXI99fgDM+0PIxQ88whjg8lJmD3/MJLTXSVzNvMk47Fb9cwepxDg/Dm
 /3h2nJWKcifoj6RE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNonb-0007Im-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 35863B81ED9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 06:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F69EC433F1;
 Thu, 11 Jan 2024 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704955452;
 bh=Yt2x1VIugdYVXsOxoBOVxcIohw/X1vEQrQchbterPrg=;
 h=From:To:Cc:Subject:Date:From;
 b=LJrCKw9ObJhB5WOPt9fG/KvCfAARHtMVBKRloB6IGXiC2c8QIuZaZqg3vLPBQcmif
 l5Oya0vqJMNBwxbp3Aw3+lJUvgKF/Ns1UWShYNEdcBoLlK9s240rn8GpX0m55Axcnj
 Negd12cyLVdZ587YXF2EpRJea/TU0uM+mQc263D+QYHwNwMVYO7rz4hupiCXThi7CM
 GneEhT6fiFoA6Ke/1hd8cP9R9Ln6by10eQADUy/rIeSacYkKC9YdQslORNGfzDAn6c
 ycUFU9kI/svDBz/4S7CKRo0GBOFOgry8oQRnpTUrfxS/BiQ4KnL8QoY67GJuqaAoqe
 aRUatm4c8/5cw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jan 2024 14:44:06 +0800
Message-Id: <20240111064406.2970205-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: - f2fs_disable_compressed_file - check inode_has_data -
 f2fs_file_mmap
 - mkwrite - f2fs_get_block_locked : update metadata in compressed inode's
 disk layout - fi->i_flags &= ~F2FS_COMPR_FL - clear_ino [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNonb-0007Im-G7
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to cover
 f2fs_disable_compressed_file() w/ i_sem
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

- f2fs_disable_compressed_file
  - check inode_has_data
					- f2fs_file_mmap
					- mkwrite
					 - f2fs_get_block_locked
					 : update metadata in compressed
					   inode's disk layout
  - fi->i_flags &= ~F2FS_COMPR_FL
  - clear_inode_flag(inode, FI_COMPRESSED_FILE);

we should use i_sem lock to prevent above race case.

Meanwhile, this patch adds i_size check to restrict compress inode
conversion condition.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 18 ++++++++++++++++--
 fs/f2fs/file.c |  5 ++---
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 74729db0b381..e2e0ca45f881 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4406,19 +4406,33 @@ static inline int set_compress_context(struct inode *inode)
 #endif
 }
 
+static inline bool inode_has_data(struct inode *inode)
+{
+	return (S_ISREG(inode->i_mode) &&
+		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
+}
+
 static inline bool f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	if (!f2fs_compressed_file(inode))
+	f2fs_down_write(&F2FS_I(inode)->i_sem);
+
+	if (!f2fs_compressed_file(inode)) {
+		f2fs_up_write(&F2FS_I(inode)->i_sem);
 		return true;
-	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
+	}
+	if (f2fs_is_mmap_file(inode) || inode_has_data(inode)) {
+		f2fs_up_write(&F2FS_I(inode)->i_sem);
 		return false;
+	}
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
 	stat_dec_compr_inode(inode);
 	clear_inode_flag(inode, FI_COMPRESSED_FILE);
 	f2fs_mark_inode_dirty_sync(inode, true);
+
+	f2fs_up_write(&F2FS_I(inode)->i_sem);
 	return true;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0e4c871d6aed..5e5df234eb92 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1926,8 +1926,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 
 			f2fs_down_write(&F2FS_I(inode)->i_sem);
 			if (!f2fs_may_compress(inode) ||
-					(S_ISREG(inode->i_mode) &&
-					F2FS_HAS_BLOCKS(inode))) {
+					inode_has_data(inode)) {
 				f2fs_up_write(&F2FS_I(inode)->i_sem);
 				return -EINVAL;
 			}
@@ -4011,7 +4010,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (F2FS_HAS_BLOCKS(inode)) {
+	if (inode_has_data(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
