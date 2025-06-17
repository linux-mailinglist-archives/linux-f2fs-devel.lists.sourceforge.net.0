Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9DADC009
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 05:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cu4pLN/Jvmq55zEkLMWUMqrNv50pnWla7ZJnlifZc4U=; b=FZUku0Pk0CF/sDTjNTTd4jKODu
	7o6qczfiXRx0eABVI28FAKjfnbNpZdrWdasx9u4Hp8jntv3KRe1spgrd2wsH38f9gLszNOtMvT6DK
	VArdAo/V84C58RQJufgGlFo0fSV3XcN3Lm3NnmYlflp4DxlC1tk2KplTe8JtnRrz9jG4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRNRw-0001nd-9W;
	Tue, 17 Jun 2025 03:57:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRNRv-0001nS-91
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 03:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQ4h6xE1BxoaHS1tYsBNcu+zl23Qpsd5NFifqwvsavw=; b=apx2xO9wEl2qBXZjtC1EjzVE+E
 K5EwLPMLIUraARCffSh9ip0uZ45vcaqSqNMzMubo0jrTqn152bm8LCrcj6E9hNHN3v+Rej4meHrM+
 O9UXNbcynswsS4Jjtn6dN00oCxe4kbjybPDw0dOldQ+mTJI10z2rC3bWr91ZrS9QjhiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yQ4h6xE1BxoaHS1tYsBNcu+zl23Qpsd5NFifqwvsavw=; b=K
 iuMcLoZqa/sq1i9IrxucI1NvHV+IMjFDKCqxa8DSYdS0XTAKlJYB4qj5UBong4ODGRheN7GW1+VZB
 3IDTmhhaz2LPS31HDRM3jlF+i13CU9RcWEu/s7cvqugfVg0XaTrjzllwOgHEizIJdXlQu66dSZ3kV
 eXddtNGIkSjHJTl8=;
Received: from mta21.hihonor.com ([81.70.160.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRNRu-0006oA-PJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 03:57:27 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bLtLG1szQzYkxrF;
 Tue, 17 Jun 2025 11:55:02 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:14 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:13 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 17 Jun 2025 11:57:10 +0800
Message-ID: <20250617035711.2342823-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To prevent non-section-aligned size pinned file generated
 from truncation, add check condition in setattr. Signed-off-by: wangzijie
 <wangzijie1@honor.com> --- fs/f2fs/file.c | 6 ++++++ 1 file changed,
 6 insertions(+)
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [81.70.160.142 listed in wl.mailspike.net]
X-Headers-End: 1uRNRu-0006oA-PJ
Subject: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size pinned
 file generation
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

To prevent non-section-aligned size pinned file generated from truncation,
add check condition in setattr.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..72f7d1b4a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
@@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size < i_size_read(inode) &&
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
