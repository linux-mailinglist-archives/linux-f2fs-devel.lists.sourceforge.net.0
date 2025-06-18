Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA49ADE3E6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 08:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GRdl8EX8zF9PdweuPgwDLqQwz9RUqDHMrgzDuvgS3Ow=; b=AkWJ1XNtaC8z9e4oJOSdqTOaWl
	q+k50gGopoFaBmWcnvyUVF0r+WBryhJEOujQ8isdncE20fv/OaJnGJKR691i2abHNrcNWnabAe0WN
	HD4jmZp7O72rtO45r7HB/rcDBUkIDYPR/8ip2/DRofZ32MNDoAAgLkwFSxNknFYu6ZJo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRmW0-0002gP-TR;
	Wed, 18 Jun 2025 06:43:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRmVz-0002gH-Ey
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 06:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O1Sy+ZOBmC3HrtjDDWcaLTiWL1b76XfhFybDd7lls28=; b=F3D1bSCad8nAe8PR8Pq1K4tYER
 M/ciLfW3xqdPyoD4RtXJNI/7WKjGfXZ4Sguhzd0XNGT/YyKoy6Wsb9gim92eQbS8u8v/nHYdYnJM6
 F7y63cbbUC5YDKsROPVqIyanusQdkZMNZfuZdifgU8lWGB93R+64dJWOXbLgJ3SOPiug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O1Sy+ZOBmC3HrtjDDWcaLTiWL1b76XfhFybDd7lls28=; b=M
 bLK7Sg3PxWfUsKSbj0WaGsNV7F5ztILKPtbKARL4hmucEBk0ktUj5ZSGyu9tkBIkNMeRCcvo4QcuU
 xdGT+yKecxsx6NLPsCxa9ROc2V4EqkK+3ScsczRrjwfcsgrfuuI9ThHCtOYRw+7FLERFwKgKjSYJ2
 Hb2LfYOoy2t6iKAM=;
Received: from mta21.hihonor.com ([81.70.160.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRmVx-0006mz-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 06:43:18 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bMYz86s4DzYlqL6;
 Wed, 18 Jun 2025 14:40:52 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 14:43:05 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 14:43:05 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 18 Jun 2025 14:43:02 +0800
Message-ID: <20250618064303.2477852-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To prevent scattered pin block generation,
 don't allow non-section
 aligned truncation to smaller or equal size on pinned file. But for truncation
 to larger size, after commit 3fdd89b452c2("f2fs: preve [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uRmVx-0006mz-P3
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: don't allow unaligned truncation to
 smaller/equal size on pinned file
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, wangzijie <wangzijie1@honor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To prevent scattered pin block generation, don't allow non-section aligned truncation
to smaller or equal size on pinned file. But for truncation to larger size, after
commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
we only support overwrite IO to pinned file, so we don't need to consider
attr->ia_size > i_size case.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v3:
- cover attr->ia_size == i_size case
v2:
- add comments and change a proper subject
---
 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..9e0f1c98f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
@@ -1047,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		/*
+		 * To prevent scattered pin block generation, we don't allow
+		 * smaller/equal size unaligned truncation for pinned file.
+		 * We only support overwrite IO to pinned file, so don't
+		 * care about larger size truncation.
+		 */
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size <= i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
