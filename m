Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C726CCB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jul 2019 12:24:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ho3aX-0003MO-Lt; Thu, 18 Jul 2019 10:24:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ho3aT-0003MC-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 10:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zCVXJLWMLSvd/UxXUFTCF9PZM5GdPsrq535ciKm0rZQ=; b=AtD9TGkDTpbL3D5S4mdKe5alXX
 ud38ZJ7obkkFGivTN7HfJ3GFeBCKBRR45IgjSn+W/4JK8OzysszxNaS0eoxIOQqcAe6/0cZ69N4LG
 FN7W/F0uxTNuuHDY/H2c5j+APJz+0cmPpx3RXf77wprj7H0QqSesVHqmnHUfIY5H1y1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zCVXJLWMLSvd/UxXUFTCF9PZM5GdPsrq535ciKm0rZQ=; b=c
 x1t0HmNq/uHQzcUoZw1czC5XPU0jEDNHTqXfPFBur/5Ezdf0qvzwdlu7jV4A/y0sd4vyhfOlAeuPy
 BAxzqnDy4n5bD2yzM6RG6k1W2KvJtHfhHAIh30gO7+iL93PD+vqv2afIVl9fkD8sU9TV1PeSYVjlm
 glE/RsBB61NgAKgk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ho3aR-005dUk-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 10:24:33 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C55CBDD3F6F9763A5C94;
 Thu, 18 Jul 2019 18:24:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Thu, 18 Jul 2019 18:24:09 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 18 Jul 2019 18:24:06 +0800
Message-ID: <20190718102406.55774-1-yuchao0@huawei.com>
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
X-Headers-End: 1ho3aR-005dUk-Gj
Subject: [f2fs-dev] [PATCH] f2fs: separate NOCoW and pinfile semantics
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

Pinning a file is heavy, because skipping pinned files make GC
running with heavy load or no effect.

So that this patch propose to separate nocow and pinfile semantics:
- NOCoW flag can only be set on regular file.
- NOCoW file will only trigger IPU at common writeback/flush.
- NOCow file will do OPU during GC.

For the demand of 1) avoid fragment of file's physical block and
2) userspace don't care about file's specific physical address,
tagging file as NOCoW will be cheaper than pinned one.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c |  3 ++-
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 20 +++++++++++++++++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a2a28bb269bf..15fb8954c363 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1884,7 +1884,8 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 {
-	if (f2fs_is_pinned_file(inode))
+	if (f2fs_is_pinned_file(inode) ||
+			F2FS_I(inode)->i_flags & F2FS_NOCOW_FL)
 		return true;
 
 	/* if this is cold file, we should overwrite to avoid fragmentation */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 596ab3e1dd7b..f6c5a3d2e659 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2374,6 +2374,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOATIME_FL			0x00000080 /* do not update atime */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 
 /* Flags that should be inherited by new inodes from their parent. */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7ca545874060..ed6556f4cba7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1659,6 +1659,20 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
+	if ((iflags ^ oldflags) & F2FS_NOCOW_FL) {
+		int err;
+
+		if (!S_ISREG(inode->i_mode))
+			return -EINVAL;
+
+		if (f2fs_should_update_outplace(inode, NULL))
+			return -EINVAL;
+
+		err = f2fs_convert_inline_inode(inode);
+		if (err)
+			return err;
+	}
+
 	fi->i_flags = iflags | (fi->i_flags & ~mask);
 
 	if (fi->i_flags & F2FS_PROJINHERIT_FL)
@@ -1692,6 +1706,7 @@ static const struct {
 	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
 	{ F2FS_INDEX_FL,	FS_INDEX_FL },
 	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
+	{ F2FS_NOCOW_FL,	FS_NOCOW_FL },
 	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
 };
 
@@ -1715,7 +1730,8 @@ static const struct {
 		FS_NODUMP_FL |		\
 		FS_NOATIME_FL |		\
 		FS_DIRSYNC_FL |		\
-		FS_PROJINHERIT_FL)
+		FS_PROJINHERIT_FL |	\
+		FS_NOCOW_FL)
 
 /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
 static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
@@ -1753,8 +1769,6 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
 		fsflags |= FS_ENCRYPT_FL;
 	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
 		fsflags |= FS_INLINE_DATA_FL;
-	if (is_inode_flag_set(inode, FI_PIN_FILE))
-		fsflags |= FS_NOCOW_FL;
 
 	fsflags &= F2FS_GETTABLE_FS_FL;
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
