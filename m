Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577BA5F25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 04:06:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4yDY-0001fd-1d; Tue, 03 Sep 2019 02:06:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i4yDV-0001fQ-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 02:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jlBfzEE1xznvvs671cEZSKtumkqn5+SOmlYhH0g3eUk=; b=gwMk8dEB9btAuHHRouzvB85jdW
 MmERNVDFTI7Qir0Fi/x1Jv4/mM9ZWG4iR4uTCV2LF2ha6QLUSnJ4XqnbIeUziA3h4IdnuthuP3IqU
 7ii/Vf33OsZMSfd9laW+IIlgpl3jX1yBT65Xyu/wF1jq8LD2PNUsrPnY237wn4ua5AIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jlBfzEE1xznvvs671cEZSKtumkqn5+SOmlYhH0g3eUk=; b=ip3Nbjascn9ZnGjskvGwiQEFuc
 rz2uaw6+NzJJbNwkYTJRh7oDT9oSyygdmXxomNrdGppPojIM7rHUqgLccpL7WqGx2NL/FACBjYz2l
 +IQdU0Y99wr403dJLE0fSN/DrmvEWfB1sZskC9/3kKg1c6x76yoa5euUPyBOqAyEg9t0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4yDS-007qdz-OW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 02:06:44 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2BC6DC61656970BAF950;
 Tue,  3 Sep 2019 10:06:35 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Sep 2019 10:06:30 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 3 Sep 2019 10:06:26 +0800
Message-ID: <20190903020626.93020-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190903020626.93020-1-yuchao0@huawei.com>
References: <20190903020626.93020-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i4yDS-007qdz-OW
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: convert inline_data in prior to
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

In below call path, we change i_size before inline conversion, however,
if we failed to convert inline inode, the inode may have wrong i_size
which is larger than max inline size, result inline inode corruption.

- f2fs_setattr
 - truncate_setsize
 - f2fs_convert_inline_inode

This patch reorders truncate_setsize() and f2fs_convert_inline_inode()
to guarantee inline_data has valid i_size.

Fixes: 0cab80ee0c9e ("f2fs: fix to convert inline inode in ->setattr")
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6528216ab832..10927a0b8df3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -814,14 +814,24 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
-		bool to_smaller = (attr->ia_size <= i_size_read(inode));
+		loff_t old_size = i_size_read(inode);
+
+		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
+			/*
+			 * should convert inline inode before i_size_write to
+			 * keep smaller than inline_data size with inline flag.
+			 */
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
@@ -829,21 +839,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
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
-				if (err)
-					return err;
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
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
