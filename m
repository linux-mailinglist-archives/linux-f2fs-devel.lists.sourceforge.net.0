Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BC9628A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 16:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i05ES-0002c9-Ql; Tue, 20 Aug 2019 14:35:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i05ER-0002bk-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 14:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z06T9hO7bTxWyoyX/dSfetpi+Qe9g6w/6kPYgi1ryGg=; b=l2hMXXeNRGknHOoJmGIXImseNn
 HiCLKHfQ6EHzWMPSYMy1ZvXaboqMDdjLKfvjJmrBFx5k5oXwMIRCm/1j+0yA6mr3gnwhk8nP0s+wJ
 lmO4C0oC5L3pjEP3hGjqdSA5wKgMCq+mGJSxfwajKlOoSUSyD1juAhGju6dPWlHO6D/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z06T9hO7bTxWyoyX/dSfetpi+Qe9g6w/6kPYgi1ryGg=; b=J
 l4AZcjRcKmT4joBdD4dvSOhWvccMS9WJi47PZNprEBg/c6ZssPWsyOGcU+NjURXbcOxw8eKzL2FU6
 iyHuZdWenfDm1S7VLCJV7tv1ecrQY80N7yfGtOdU18x8QEBnUtjcmtnXxxvE/azVk1PV60hHSj45y
 JlZGdqJmfJivkcig=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i05EP-009b6j-9r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 14:35:31 +0000
Received: from localhost.localdomain (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0421214DA;
 Tue, 20 Aug 2019 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566311723;
 bh=KZ3+f1X6H8F4tdCkHq5J6hMugLIxLtLvPMyf8pCWZmE=;
 h=From:To:Cc:Subject:Date:From;
 b=lbMQfYwzX02ZUEfPxZ55RFYYjFcsyixNVlUY5BzWkjRyFeFFIuG1Wj8KYaU6Bh+Ey
 6U04GCgMt+xEeNt61/UuAEfkx6nZWPxKva44w2TXBEkMDNy81Ou229IhCcBlII+hTF
 pi0FXkeQ9rna58o/2kEaCIwaoM2USVYrAG9O0PDY=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Aug 2019 22:34:22 +0800
Message-Id: <20190820143422.3458-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i05EP-009b6j-9r
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid corruption during inline
 conversion
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

From: Chao Yu <yuchao0@huawei.com>

- f2fs_setattr
 - truncate_setsize (expand i_size)
  - f2fs_convert_inline_inode
   - f2fs_convert_inline_page
    - f2fs_reserve_block
    - f2fs_get_node_info failed

Once we fail in above path, inline flag will remain, however
- we've reserved one block at inode.i_addr[0]
- i_size has expanded

Fix error path to avoid inode corruption.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c   | 8 ++++++--
 fs/f2fs/inline.c | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2284ec706a40..05d60082da3a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -812,7 +812,8 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
-		bool to_smaller = (attr->ia_size <= i_size_read(inode));
+		loff_t old_size = i_size_read(inode);
+		bool to_smaller = (attr->ia_size <= old_size);
 
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		down_write(&F2FS_I(inode)->i_mmap_sem);
@@ -835,8 +836,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 			/* should convert inline inode here */
 			if (!f2fs_may_inline_data(inode)) {
 				err = f2fs_convert_inline_inode(inode);
-				if (err)
+				if (err) {
+					/* recover old i_size */
+					i_size_write(inode, old_size);
 					return err;
+				}
 			}
 			inode->i_mtime = inode->i_ctime = current_time(inode);
 		}
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 78d6ebe165cd..16ebdd4d1f2c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -131,6 +131,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	err = f2fs_get_node_info(fio.sbi, dn->nid, &ni);
 	if (err) {
+		f2fs_truncate_data_blocks_range(dn, 1);
 		f2fs_put_dnode(dn);
 		return err;
 	}
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
