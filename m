Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D86FD60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 12:04:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpVB3-0006go-AS; Mon, 22 Jul 2019 10:04:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hpVB2-0006gV-86
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 10:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Br8BR6GsCpiHMU+0ijvptsyd9y2aedVTzvowwxIxWQ4=; b=UvmfXX6QgRhosybcF8lbcMers6
 wjIo6czli64ylGt1b2MOzpE3rOouJ7P0t3n0c8aLM2W1MKBWzc985ThuOJDKJCqf8P3VSkhIvxe6y
 ++utRDhiIxbWKB+7pa5IBOhxgMEWxzFLIckfiLHqZHzUlI2t3rcJk04kqkHO0/AWejmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Br8BR6GsCpiHMU+0ijvptsyd9y2aedVTzvowwxIxWQ4=; b=O
 UOVos2mJs4Imj73Hx21aS+a70Yy2kKM+V4NaBYBSUYjuGmU9LvLgq/S5JTRdCTgbJc4H/Vkd4egx5
 6BMCOyS65M2yRSB0zrnpEt9PLJbAcZN8H+H3e4eCmTNvdjcLdZXvatu2dU10IFK2LKEdMNQNo8gNW
 GYvtxpLA38ESmRuY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpVB0-00AaUc-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 10:04:16 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D4D54B4D1110DC8883F8;
 Mon, 22 Jul 2019 18:04:05 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 22 Jul 2019 18:03:55 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 22 Jul 2019 18:03:50 +0800
Message-ID: <20190722100350.117428-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hpVB0-00AaUc-Oh
Subject: [f2fs-dev] [PATCH] f2fs: support fiemap() for directory inode
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

Adjust f2fs_fiemap() to support fiemap() on directory inode.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c   | 2 +-
 fs/f2fs/inline.c | 8 +++++++-
 fs/f2fs/namei.c  | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 15fb8954c363..0f1dc65c9d43 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1539,7 +1539,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		goto out;
 	}
 
-	if (f2fs_has_inline_data(inode)) {
+	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode)) {
 		ret = f2fs_inline_data_fiemap(inode, fieinfo, start, len);
 		if (ret != -EAGAIN)
 			goto out;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 3613efca8c00..8c0712154fb1 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -704,7 +704,13 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
-	if (!f2fs_has_inline_data(inode)) {
+	if ((S_ISREG(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
+				!f2fs_has_inline_data(inode)) {
+		err = -EAGAIN;
+		goto out;
+	}
+
+	if (S_ISDIR(inode->i_mode) && !f2fs_has_inline_dentry(inode)) {
 		err = -EAGAIN;
 		goto out;
 	}
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 09fb4f31576e..7560c7ed38b1 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1254,6 +1254,7 @@ const struct inode_operations f2fs_dir_inode_operations = {
 #ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
 #endif
+	.fiemap		= f2fs_fiemap,
 };
 
 const struct inode_operations f2fs_symlink_inode_operations = {
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
