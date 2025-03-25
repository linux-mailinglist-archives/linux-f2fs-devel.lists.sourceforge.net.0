Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 033DBA6EB38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 09:13:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twzPr-000848-Pa;
	Tue, 25 Mar 2025 08:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twzPp-00083s-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c+IaKosktQJXFOO/bxUaLhrdECpW86LX9tZb0KrWZxc=; b=a1tjOTFnEByaIYxSs8YRQOZogF
 TSQQXtMcS/5XpMv+NqVnVEVMaj3OjhJ7qmrH+D+bSzu5tkdXXPyQuj5j2TF+vk3PRsjhJ7Jlk28zC
 lOe0afjLQzm9bYSG4NwSr7iiPSMYfu+z469LNbDCtpd1AD3ijU0rWFqRsSsOdFMo9NtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c+IaKosktQJXFOO/bxUaLhrdECpW86LX9tZb0KrWZxc=; b=Z
 9qtPaU+3nqFuasoOTjg/MLwIxtw75pokFtD75isFtkCNHpPZSzv94X9NtaQ9/6CN786Kqy1523dsA
 jlzubIJU6ZAsZWHSYzwW2YBk232MYFZiRYYJEdWKOMxcfYoPA4Gkc2BYMhi519lI4v8K9A3hRothg
 U6DgKnddUOj6JrlY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twzPl-0001zM-3t for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64A4761587
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 08:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B29AC4CEE8;
 Tue, 25 Mar 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742890406;
 bh=LtRdniLcPqa7ao3nLrAh74t9DlpseprTi8ntyDAeLik=;
 h=From:To:Cc:Subject:Date:From;
 b=MyEVArTWZinYlc0UyKhExD7y6Zsq8cAsvxIG1OUzHrmWdb5qzOErLKCig3Ry+zNDO
 yhdqtSPQxB2x7YwGCI3sOYVbrAGUsweAt4Sk8IY867ibaDUatPNFzkApDxnBv9qIJQ
 ky/O85t3knHqdBB+Lq4rNf+n2sFmFFwwJHG5S0uLjJi1jKAbL+6jLFgfSVnVd46KmC
 tVKuOrrrOpMe3n5JkJaHZw0yj7ukc5dBqmzKjCLQ7hWqTgGcwX468a+WxsHCM5Rwue
 KHmXaKQXfFXXU5XQh0gkzD9KF/qrIrgXGktvb9P+n4JiMlk3kxM3ZeXIpN/kDRwngX
 cUSw9Ua2YAweA==
To: jaegeuk@kernel.org
Date: Tue, 25 Mar 2025 16:13:21 +0800
Message-ID: <20250325081321.3296714-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch uses i_sem to protect access/update on
 f2fs_inode_info.flag
 in finish_preallocate_blocks(), it avoids grabbing inode_lock() in each open().
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - get rid of read lock during
 querying FI_OPENED_FILE once we held inode lock. fs/f2fs/file.c | 37
 ++++++++++++++++++++ 1 file changed [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twzPl-0001zM-3t
Subject: [f2fs-dev] [PATCH v2] f2fs: add a fast path in
 finish_preallocate_blocks()
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

This patch uses i_sem to protect access/update on f2fs_inode_info.flag
in finish_preallocate_blocks(), it avoids grabbing inode_lock() in
each open().

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- get rid of read lock during querying FI_OPENED_FILE once we held
inode lock.
 fs/f2fs/file.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..a71946976761 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -554,19 +554,21 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
 
 static int finish_preallocate_blocks(struct inode *inode)
 {
-	int ret;
+	int ret = 0;
+	bool opened;
 
-	inode_lock(inode);
-	if (is_inode_flag_set(inode, FI_OPENED_FILE)) {
-		inode_unlock(inode);
+	f2fs_down_read(&F2FS_I(inode)->i_sem);
+	opened = is_inode_flag_set(inode, FI_OPENED_FILE);
+	f2fs_up_read(&F2FS_I(inode)->i_sem);
+	if (opened)
 		return 0;
-	}
 
-	if (!file_should_truncate(inode)) {
-		set_inode_flag(inode, FI_OPENED_FILE);
-		inode_unlock(inode);
-		return 0;
-	}
+	inode_lock(inode);
+	if (is_inode_flag_set(inode, FI_OPENED_FILE))
+		goto out_unlock;
+
+	if (!file_should_truncate(inode))
+		goto out_update;
 
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
@@ -576,16 +578,17 @@ static int finish_preallocate_blocks(struct inode *inode)
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-
-	if (!ret)
-		set_inode_flag(inode, FI_OPENED_FILE);
-
-	inode_unlock(inode);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	file_dont_truncate(inode);
-	return 0;
+out_update:
+	f2fs_down_write(&F2FS_I(inode)->i_sem);
+	set_inode_flag(inode, FI_OPENED_FILE);
+	f2fs_up_write(&F2FS_I(inode)->i_sem);
+out_unlock:
+	inode_unlock(inode);
+	return ret;
 }
 
 static int f2fs_file_open(struct inode *inode, struct file *filp)
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
