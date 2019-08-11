Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24089484
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwvWl-0001u7-0Z; Sun, 11 Aug 2019 21:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hwvWk-0001tu-3C
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMbx9fximKHyX/z5NXAX8pjLJE0zCa9hK+3o3jZmfkk=; b=XsSlFzXEFSFr7WNOYt6AVoyCyn
 LTR2lAsGb3JeumIFj6aWzxQ1hU6d4LLr4LOfO+zfMc6Oj1juPfIc9S9kTsitbpO7JWmFjVVKK1UI+
 xLKGeF77HC+O8mpaWzrG/uIbf08cOMes+uk0OiKPvHgyWZ8SHjrQx+RYvIW2VZ1SaM4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FMbx9fximKHyX/z5NXAX8pjLJE0zCa9hK+3o3jZmfkk=; b=GUjOo9v05TekQyfr7Fd171rpT0
 5FkJcd2wqyTdStUrTTYLprQvEtorWDeaTs5jXUY1CWcVcjEeHg7hWJdK6zVM13rjvqgsC2sBFsMN/
 Z6BKkaEG/8hU6IHVlaud6Uc0plL1XdGxRtz4z0ANykWyS7O/JiQOiRkZiNUPIMTfPlXA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwvWg-0022Ou-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:21 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8EEE2085B;
 Sun, 11 Aug 2019 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565559432;
 bh=jLSRndS90GZ1sS5nNH8viZnBJzvjYmn5wdaigS/eBOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zXNM5iORw1W3gqfwS4dRHQM5oTQW4JpvBOt9qx/RkXXhm/+qlhiuvoOMgKnPClO/F
 iu1M7eO0iSxh2ichFx9CUOQMUB7gmhmbSzVBOpx3WSxi7luktLQgJJIjpjP3ks/YuF
 plLF6RnO9ZoGWqRyhEbFBqZYpQCJz97ubZTca+RA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 11 Aug 2019 14:35:53 -0700
Message-Id: <20190811213557.1970-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
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
X-Headers-End: 1hwvWg-0022Ou-Eq
Subject: [f2fs-dev] [PATCH 2/6] ext4: skip truncate when verity in progress
 in ->write_begin()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When an error (e.g. ENOSPC) occurs during ext4_write_begin() when called
from ext4_write_merkle_tree_block(), skip truncating the file.  i_size
is not meaningful in this case, and the truncation is handled by
ext4_end_enable_verity() instead.  Also, this was triggering the
WARN_ON(!inode_is_locked(inode)) in ext4_truncate().

Fixes: ea54d7e4c0f8 ("ext4: add basic fs-verity support")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index b2c8d09acf652..cf0fce1173a4c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1340,6 +1340,9 @@ static int ext4_write_begin(struct file *file, struct address_space *mapping,
 	}
 
 	if (ret) {
+		bool extended = (pos + len > inode->i_size) &&
+				!ext4_verity_in_progress(inode);
+
 		unlock_page(page);
 		/*
 		 * __block_write_begin may have instantiated a few blocks
@@ -1349,11 +1352,11 @@ static int ext4_write_begin(struct file *file, struct address_space *mapping,
 		 * Add inode to orphan list in case we crash before
 		 * truncate finishes
 		 */
-		if (pos + len > inode->i_size && ext4_can_truncate(inode))
+		if (extended && ext4_can_truncate(inode))
 			ext4_orphan_add(handle, inode);
 
 		ext4_journal_stop(handle);
-		if (pos + len > inode->i_size) {
+		if (extended) {
 			ext4_truncate_failed_write(inode);
 			/*
 			 * If truncate failed early the inode might
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
