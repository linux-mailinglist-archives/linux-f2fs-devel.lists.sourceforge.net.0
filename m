Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F58BDB42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 May 2024 08:20:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s4EBq-0002Oj-4h;
	Tue, 07 May 2024 06:20:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s4EBo-0002OU-R9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 May 2024 06:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bfxxyWQhfG9FdpCKhm1qyFHK2qjaRz2A678DYw4pVMQ=; b=fNqLylJChQUQzB1IEnsVzq7yOb
 sjC2VJytO5E3r9uPH0HCe7YnayS8IB4ySF4iE8+TxpbSzhaLjVLVq7hbnczCsBNhnn4P5SDOOnRU8
 UZzlKI5i8D1izHfGObVYxHLak0JbX/dQUzr9h2C5EfWR7bcnGwTZR4IGuk0gOO/vnMbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bfxxyWQhfG9FdpCKhm1qyFHK2qjaRz2A678DYw4pVMQ=; b=F
 znVkF6jS/S1XGfjN2vMkAfT7KLps/7tVvGBu3+IKE2+Eoygky+/B5NF3+i+rREgNpHTjTxTZMDx8y
 ItBjiTBSj5ezthjiTS21jaDV3qRgchcoiZ8EeuYM9WHCkDdnevPtawsO1P0Of1+jvfih9jc6iD5Ar
 G0ug+vWuRwo0WIyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s4EBo-0005TG-UC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 May 2024 06:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 913F761493
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 May 2024 06:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB70C2BBFC;
 Tue,  7 May 2024 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715062826;
 bh=xpV/nMuQfBh/yww28aaTVU+mxRQ+Qd7MQI6xXDS/QtE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ny7IEwlYDjKPkuW7sQuFVUIV+twKDFaKkaFI2EnsKMZSNDGHsiOACxYZ3ZsLjPkPQ
 xsn2thhcDhBtKKqB5c3woONt7bKMxoQpZgrJ6uCO8m3rLKewTLNraO+ecg+Y2PVgat
 14HASIEVf1zQ9AgNsDUYBsSUq4YQFKjqZKUCYqlKNQkRptsE/8gvN94g9l7OTglt8Q
 iYJ4ZkSE4MfK8FuvV5eFRZf0vn5zNYv/lnqUC0fT7jNuOHhSyee5cikPkpbmda6Ixg
 QAFO7Q0WPiOccyX0l9h8MxQQE1S0UsC57UcFJ0bmShmAEeyqW5QPgUDHaakJLywy9W
 kX4zhkpynMiKg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  7 May 2024 14:20:19 +0800
Message-Id: <20240507062019.1097683-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs image may be corrupted after below testcase: - mkfs.f2fs
 -O extra_attr,compression -f /dev/vdb - mount /dev/vdb /mnt/f2fs - touch
 /mnt/f2fs/file - f2fs_io setflags compression /mnt/f2fs/file - dd [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s4EBo-0005TG-UC
Subject: [f2fs-dev] [PATCH v2 5/5] f2fs: compress: don't allow unaligned
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
v2:
- fix compile warning reported by lkp.
 fs/f2fs/file.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3f0db351e976..0c8194dc6807 100644
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
+			!IS_ALIGNED(attr->ia_size,
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
