Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA6AE1D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2019 03:14:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7Uk3-000549-36; Tue, 10 Sep 2019 01:14:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i7Uk0-00053w-OD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 01:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VP0N2DbSVB/G2p359hCOix1PGJUZLBRSx1EjmjS+VNM=; b=GOkQZUxOfsxkGVnAdJA5efmSVu
 eVymqYN01bbEp5DlwGEs2z/JDc5YsIvh//9FVkAnjV3ovozkBmOGxkX5760SOxPJ8svrkf5gRwzTZ
 ZKf0kilNeF80udTx4K5cMZ7S7E1RzBxxwZpNFEgqOchBTBje9QqHHEiXUodJWFKyjiZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VP0N2DbSVB/G2p359hCOix1PGJUZLBRSx1EjmjS+VNM=; b=T
 YMSo+ifUHJBbDiO87so6jj3eJoeLCFQIkoeXW1U/rTZGJjaVB8gy6cmYQsLp9Wuuz91JCMk6rcTuM
 iQuy2Z3Rdle7cAAhbCeEQ3wS3lZRlV5Ddf4yNo1HwY9iLVSy9j4k1SduNXU5VCeMRmqDBb4JnyUEZ
 idEzCyLT35z4A2ls=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7Ujy-00GEEz-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 01:14:44 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 79E7E2D5954FCE6DA913;
 Tue, 10 Sep 2019 09:14:33 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 10 Sep 2019 09:14:24 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 10 Sep 2019 09:14:16 +0800
Message-ID: <20190910011416.28768-1-yuchao0@huawei.com>
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
X-Headers-End: 1i7Ujy-00GEEz-Eg
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid accessing uninitialized
 field of inode page in is_alive()
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

If inode is newly created, inode page may not synchronize with inode cache,
so fields like .i_inline or .i_extra_isize could be wrong, in below call
path, we may access such wrong fields, result in failing to migrate valid
target block.

Thread A				Thread B
- f2fs_create
 - f2fs_add_link
  - f2fs_add_dentry
   - f2fs_init_inode_metadata
    - f2fs_add_inline_entry
     - f2fs_new_inode_page
     - f2fs_put_page
     : inode page wasn't updated with inode cache
					- gc_data_segment
					 - is_alive
					  - f2fs_get_node_page
					  - datablock_addr
					   - offset_in_addr
					   : access uninitialized fields

Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- update inode page before f2fs_put_page()
 fs/f2fs/dir.c    | 5 +++++
 fs/f2fs/inline.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 7afbf8f5ab08..4033778bcbbf 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -682,6 +682,11 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
+
+		/* synchronize inode page's data from inode cache */
+		if (is_inode_flag_set(inode, FI_NEW_INODE))
+			f2fs_update_inode(inode, page);
+
 		f2fs_put_page(page, 1);
 	}
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 16ebdd4d1f2c..896db0416f0e 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -589,6 +589,11 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 	/* we don't need to mark_inode_dirty now */
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
+
+		/* synchronize inode page's data from inode cache */
+		if (is_inode_flag_set(inode, FI_NEW_INODE))
+			f2fs_update_inode(inode, page);
+
 		f2fs_put_page(page, 1);
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
