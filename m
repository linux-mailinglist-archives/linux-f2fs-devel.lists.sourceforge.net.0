Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C874937D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 04:06:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHEO8-0005Ol-1E;
	Thu, 06 Jul 2023 02:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qHEO3-0005Oa-Rx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 02:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fGvu5z4a31Ssw4eZs4SnqP1D9TYmwqNiigGDm4gmwxI=; b=YUI3StMqN5fqC8Q8kJVldUdyIZ
 vtIDUV1OjsyJ3osaR2k2g040MOc6EX5vdfP53vh/Xs/YrgAXfimyC7O5dGl495W7N0jRdlJXv2Ves
 6qF09fQo5pR2vdrMOn7iF7XXOaEBA2uvAFEnmM+w0O2dMq1MGB2Wv5XOBoqWI5ig0ghI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fGvu5z4a31Ssw4eZs4SnqP1D9TYmwqNiigGDm4gmwxI=; b=W
 Fwin6blRTBQgJxi83Bf2I9iX8tzdm6Q4ApMP45DgdiTz12vswMbA2muducpplY2S4fCo6wpEqcNcz
 dalg8z1MUO6Ou3GiqaSaKm6U6KOpmBMCpsas1cgGA8arGo1up9KcwYqKcxpIqFDXbZvBROShIobKN
 Q/+bKZcEhGqAddjQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHEO3-007yNx-5z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 02:06:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 943CA617DA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jul 2023 02:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE69C433C7;
 Thu,  6 Jul 2023 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688609181;
 bh=iwuSru53wlGdhxWaHtyELnJ/GKgelakvMYZf6Rep1b4=;
 h=From:To:Cc:Subject:Date:From;
 b=JKFbxrMt/mE2WXgdMg0XGZXYtLCCczvhrwVrEMVa2fO+vZLCVfVrfK+FrGta6RKjl
 kWNvznbJ+ZBT4TDn3jbTm5vICLLlQ74nA3oZWcsMSFfUpj0zaBzPIC2OsBbaMSZOjK
 K7BU2QTfF/HrZwRXG16rM2RFy3r3XU7b6i2SAznCh5MthvS1ULxPDls4c1JMH6Fm8R
 sZWZbO6UvmAfjuynAJdbhdQLZK65ePuhy9bYAIZKWZwJ64jMB4JMQulExORDVAP/as
 ITglnMvaAs2ZvwqCerDF3xoV9fmODThb8QswxnrI5zmUMdYj4QIvDJptawWfPNgQal
 L62k2zZAmRQDw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Jul 2023 10:06:14 +0800
Message-Id: <20230706020614.2950782-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Compression option in inode should not be changed after they
 have been used, however, it may happen in below race case: Thread A Thread
 B - f2fs_ioc_set_compress_option - check f2fs_is_mmap_file() - check
 get_dirty_pages()
 - check F2FS_HAS_BLOCKS() - f2fs_file_mmap - set_inode_flag(FI_MMAP_FILE)
 - fault - do_page_mkwri [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHEO3-007yNx-5z
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to avoid mmap vs
 set_compress_option case
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

Compression option in inode should not be changed after they have
been used, however, it may happen in below race case:

Thread A				Thread B
- f2fs_ioc_set_compress_option
 - check f2fs_is_mmap_file()
 - check get_dirty_pages()
 - check F2FS_HAS_BLOCKS()
					- f2fs_file_mmap
					 - set_inode_flag(FI_MMAP_FILE)
					- fault
					 - do_page_mkwrite
					  - f2fs_vm_page_mkwrite
					  - f2fs_get_block_locked
					 - fault_dirty_shared_page
					  - set_page_dirty
 - update i_compress_algorithm
 - update i_log_cluster_size
 - update i_cluster_size

Avoid such race condition by covering f2fs_file_mmap() w/ i_sem lock,
meanwhile add mmap file check condition in f2fs_may_compress() as well.

Fixes: e1e8debec656 ("f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix potential deadlock.
 fs/f2fs/f2fs.h |  3 ++-
 fs/f2fs/file.c | 23 ++++++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c7cb2177b252..d372bedb0fe4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4483,7 +4483,8 @@ static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
 static inline bool f2fs_may_compress(struct inode *inode)
 {
 	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
-		f2fs_is_atomic_file(inode) || f2fs_has_inline_data(inode))
+		f2fs_is_atomic_file(inode) || f2fs_has_inline_data(inode) ||
+		f2fs_is_mmap_file(inode))
 		return false;
 	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 093039dee992..d9073afe021f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -526,7 +526,11 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
 
 	file_accessed(file);
 	vma->vm_ops = &f2fs_file_vm_ops;
+
+	f2fs_down_read(&F2FS_I(inode)->i_sem);
 	set_inode_flag(inode, FI_MMAP_FILE);
+	f2fs_up_read(&F2FS_I(inode)->i_sem);
+
 	return 0;
 }
 
@@ -1919,12 +1923,19 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			int err = f2fs_convert_inline_inode(inode);
 			if (err)
 				return err;
-			if (!f2fs_may_compress(inode))
-				return -EINVAL;
-			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
+
+			f2fs_down_write(&F2FS_I(inode)->i_sem);
+			if (!f2fs_may_compress(inode) ||
+					(S_ISREG(inode->i_mode) &&
+					F2FS_HAS_BLOCKS(inode))) {
+				f2fs_up_write(&F2FS_I(inode)->i_sem);
 				return -EINVAL;
-			if (set_compress_context(inode))
-				return -EOPNOTSUPP;
+			}
+			err = set_compress_context(inode);
+			f2fs_up_write(&F2FS_I(inode)->i_sem);
+
+			if (err)
+				return err;
 		}
 	}
 
@@ -3976,6 +3987,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	file_start_write(filp);
 	inode_lock(inode);
 
+	f2fs_down_write(&F2FS_I(inode)->i_sem);
 	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
 		ret = -EBUSY;
 		goto out;
@@ -3995,6 +4007,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		f2fs_warn(sbi, "compression algorithm is successfully set, "
 			"but current kernel doesn't support this algorithm.");
 out:
+	f2fs_up_write(&F2FS_I(inode)->i_sem);
 	inode_unlock(inode);
 	file_end_write(filp);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
