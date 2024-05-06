Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C318BCC30
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:42:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vnp-0002M9-H5;
	Mon, 06 May 2024 10:42:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vne-0002LH-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61yaauQLX1xW6A03+Mrdh7LSN+wCYJc2rD+SN/uGjhs=; b=asNYk/Fz6XptEkqrW5n+JSUTdd
 QtRNblWfqAZ3YXSUZAvxVFAuYyJ8/no8MfFIcDQQPxbTTjfCrj0pWZImu+b5YXJ/zCpIyJve9at/t
 lr+TG33p7h9un8dh0POo6ene8ycLKGWTgK1F3/wwhooDJYKW2KwARN8Ed32nUhctnteQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61yaauQLX1xW6A03+Mrdh7LSN+wCYJc2rD+SN/uGjhs=; b=kUTebHJxubvOt042B9jjtTnYs8
 IYsVV5aGUsrlRwQwdk9aZX1OSNLH3vvE8zwxAGPqnvyHW3tDYSmGMbk6bUUJqrHxZwrE5zKOnDvTA
 EIMR8J6hGBTn7v+eOocrPeWCmWChptJ90fzeuI0DB1lRPHglC/QggF6F+TizEXFMG8Z0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vne-0004oG-KL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4918D611A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4204C4AF68;
 Mon,  6 May 2024 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992136;
 bh=dv1pEoHOwA1g/+IAGWZ5yWzazulJlprTYfwb5ytZma8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=siwn/DFOz2c0A0TUxgsNXWaLaIGaw/YomjZgU9pII4NXQGaBu7ptzSDjO8ZevIJ3A
 Lr1MALFUgBfjLt8s+WkXAJiEagLVemd+FTxA4jg0D+Frk4DlO+5f1pMiOy6jxPlXcP
 X2hF33+AJEHfLETLOng+0Gy2+r4cQtVgf9Xu7p+kUnwNKn1ZIC88/kPuajQ4PaBRKq
 gLuaXHNax7qElwja1IWVrvChIDMVwPw6C/4197HiMFonxZMmJ/cnEKcpqq9uaECq7U
 3AyXhD3c0yn51BoAuaczk6CadFECQhl+8n0feyhIVOxGgiOqN47JYKO/vuBa69M5vM
 liVDrIv21Ys/g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:41:40 +0800
Message-Id: <20240506104140.776986-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506104140.776986-1-chao@kernel.org>
References: <20240506104140.776986-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs image may be corrupted after below testcase: - mkfs.f2fs
 -O extra_attr,compression -f /dev/vdb - mount /dev/vdb /mnt/f2fs - touch
 /mnt/f2fs/file - f2fs_io setflags compression /mnt/f2fs/file - dd [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vne-0004oG-KL
Subject: [f2fs-dev] [PATCH 5/5] f2fs: compress: don't allow unaligned
 truncation on released compress inode
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

f2fs image may be corrupted after below testcase:
- mkfs.f2fs -O extra_attr,compression -f /dev/vdb
- mount /dev/vdb /mnt/f2fs
- touch /mnt/f2fs/file
- f2fs_io setflags compression /mnt/f2fs/file
- dd if=/dev/zero of=/mnt/f2fs/file bs=4k count=4
- f2fs_io release_cblocks /mnt/f2fs/file
- truncate -s 8192 /mnt/f2fs/file
- umount /mnt/f2fs
- fsck.f2fs /dev/vdb

[ASSERT] (fsck_chk_inode_blk:1256)  --> ino: 0x5 has i_blocks: 0x00000002, but has 0x3 blocks
[FSCK] valid_block_count matching with CP             [Fail] [0x4, 0x5]
[FSCK] other corrupted bugs                           [Fail]

The reason is: partial truncation assume compressed inode has reserved
blocks, after partial truncation, valid block count may change w/
.i_blocks and .total_valid_block_count update, result in corruption.

This patch only allow cluster size aligned truncation on released
compress inode for fixing.

Fixes: c61404153eb6 ("f2fs: introduce FI_COMPRESS_RELEASED instead of using IMMUTABLE bit")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3f0db351e976..ac9d6380e433 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -952,9 +952,14 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				  ATTR_GID | ATTR_TIMES_SET))))
 		return -EPERM;
 
-	if ((attr->ia_valid & ATTR_SIZE) &&
-		!f2fs_is_compress_backend_ready(inode))
-		return -EOPNOTSUPP;
+	if ((attr->ia_valid & ATTR_SIZE)) {
+		if (!f2fs_is_compress_backend_ready(inode))
+			return -EOPNOTSUPP;
+		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
+			(attr->ia_size %
+			F2FS_BLK_TO_BYTES(F2FS_I(inode)->i_cluster_size)))
+			return -EINVAL;
+	}
 
 	err = setattr_prepare(idmap, dentry, attr);
 	if (err)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
