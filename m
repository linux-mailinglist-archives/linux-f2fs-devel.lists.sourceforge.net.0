Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CCA3A70
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 17:35:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3iva-0003cj-Md; Fri, 30 Aug 2019 15:35:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i3ivZ-0003cW-FG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 15:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Si2i7EXDftwIggSo2njpLYSA0aS7LvYjLM5r0CkYBWA=; b=flQ1zpvD14nxPBnx+6Yzd/L1PA
 g8vjUQWcb0KEEV7DUJqnhh4jVYknFZhZEfV1Vh3VVPekTz/P9hwhOm5vwTauPs96Eaex/9Gd6un6U
 xgbPU5Fhgn66b9yaXTBBH9dzI63zQgUBNKvjJhh/sC3+SFazvbpB1TDNml144aGDnwGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Si2i7EXDftwIggSo2njpLYSA0aS7LvYjLM5r0CkYBWA=; b=c
 /dlce4rFlO4GmZ6bYZ5JGNkTEeujMs1zfz38ziwDQC+q0v6r3uVNGZsTsNw9FNR3ZStTvgKR6iV3i
 uZConcUWHkNapB+64u1M8dIyozfTeBB9UFKt7lQ39u/uk5dnU3QfeJLh4zrc1hVhBEK6gtvKQFrSX
 nx1z8fHb/Ao+IT08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3ivV-009Qql-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 15:35:05 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26EA222CE9;
 Fri, 30 Aug 2019 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567179296;
 bh=0P5/A4E3ITJuLBmanZPd1xmp88+n1aduGgzUAT69uPw=;
 h=From:To:Cc:Subject:Date:From;
 b=JOQ6DBCLyfEl6sGy9wdcfYMYD9p2/AH+RTWcIGCZ8cEfMR3bCAQP7a/qFxiqFfvMm
 5W3mbVu8ERCXb5lM+YQNKa4orsJKS5VUcGtivkHrwjcZtysCu3ktg+du/QAUK6xux/
 J/vCSQ2ldLBb3JyQEuxyUW5vhH7IyZblg4fqtE6A=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Aug 2019 08:34:53 -0700
Message-Id: <20190830153453.24684-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
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
X-Headers-End: 1i3ivV-009Qql-Qr
Subject: [f2fs-dev] [PATCH] f2fs: convert inline_data in prior to
 i_size_write
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

This can guarantee inline_data has smaller i_size.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 08caaead6f16..a43193dd27cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -815,14 +815,20 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		loff_t old_size = i_size_read(inode);
-		bool to_smaller = (attr->ia_size <= old_size);
+
+		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
+			/* should convert inline inode here */
+			err = f2fs_convert_inline_inode(inode);
+			if (err)
+				return err;
+		}
 
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		down_write(&F2FS_I(inode)->i_mmap_sem);
 
 		truncate_setsize(inode, attr->ia_size);
 
-		if (to_smaller)
+		if (attr->ia_size <= old_size)
 			err = f2fs_truncate(inode);
 		/*
 		 * do not trim all blocks after i_size if target size is
@@ -830,24 +836,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 		 */
 		up_write(&F2FS_I(inode)->i_mmap_sem);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-
 		if (err)
 			return err;
 
-		if (!to_smaller) {
-			/* should convert inline inode here */
-			if (!f2fs_may_inline_data(inode)) {
-				err = f2fs_convert_inline_inode(inode);
-				if (err) {
-					/* recover old i_size */
-					i_size_write(inode, old_size);
-					return err;
-				}
-			}
-			inode->i_mtime = inode->i_ctime = current_time(inode);
-		}
-
 		down_write(&F2FS_I(inode)->i_sem);
+		inode->i_mtime = inode->i_ctime = current_time(inode);
 		F2FS_I(inode)->last_disk_size = i_size_read(inode);
 		up_write(&F2FS_I(inode)->i_sem);
 	}
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
