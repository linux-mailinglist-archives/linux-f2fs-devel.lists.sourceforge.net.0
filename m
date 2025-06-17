Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABFADC00A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 05:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O92X9I9MfXbR9n9e0JxST19agWREmRbc7XHd0PUGxMI=; b=j7WJEXoAI+Dol3kso2UwaPGcbF
	yqpvzsYnunMTfwx6oJk+jrd/D6YKwnw7nlvdLIWLoBp/+iNg9jDqMyeadMMLewRbZ8InB6JTiMD1z
	dRV23OsvZj+hybtiboasaNRzLigNcAbrIbUzgpFzxiYFktcrCILZIJj36MAGbGPOKvjk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRNRu-0002rn-OL;
	Tue, 17 Jun 2025 03:57:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRNRs-0002rd-JA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 03:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ay6fsQ580aW62kw0MNHEMoFjCJ86eqkXcPJUfV6Ad5I=; b=k8bsaKH420eGlH6e4N0HYsdrec
 jD0bQVVoIoDyZ11aCrHcK35rYPx/6uneZvgr+Y4vu2q1H8arpnB68ehanNPM8btzSI+mxN7xWfRWA
 uuasmFrGEaDQnz3VdYYeKNLlmIMMzm4DFlPu/vrlkgz2HgnmzYA40PxCpChSw91ZijDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ay6fsQ580aW62kw0MNHEMoFjCJ86eqkXcPJUfV6Ad5I=; b=Z6rSo2tZ44mtmT8V3aTlnv9JdW
 YV90iQFofPas71zlh/XvIWPssi+aGKcqOWbnN3ZxRxhxl/iJYpdXhBAW30ca9mVUgZcLrQ/B6MUrf
 IQKrGQ7po2znT8sWN+SU6kXiBqXR8KiqALNioWMSlgBbvmQIn4aLjC6Xcgup82015ptI=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRNRr-0006nn-SJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 03:57:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=ay6fsQ580aW62kw0MNHEMoFjCJ86eqkXcPJUfV6Ad5I=;
 b=bEJAHNOUXsB8Mmkz8PTL3aV7F0n6fmiPnwJknFvw+W89NSEFd0+aKjE4QXIEDtPFHUPIASOJZ
 e5yqOfJxm5nezQk6JUT1EXIc5p/OLmpQyfWCCwsCzw0UwSdIGdRt/gLVgNp0yQxuFZOfIXS0TFp
 MxEKHoTxEU/qJjgSjEm/XEg=
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bLtLW45nSzYmQJw;
 Tue, 17 Jun 2025 11:55:15 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:16 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 11:57:16 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 17 Jun 2025 11:57:11 +0800
Message-ID: <20250617035711.2342823-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617035711.2342823-1-wangzijie1@honor.com>
References: <20250617035711.2342823-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After introduce sbi in f2fs_setattr(), cleanup F2FS_I_SB.
 No logic change. Signed-off-by: wangzijie <wangzijie1@honor.com> ---
 fs/f2fs/file.c
 | 13 ++++++------- 1 file changed, 6 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uRNRr-0006nn-SJ
Subject: [f2fs-dev]  [PATCH 2/2] f2fs: cleanup F2FS_I_SB in f2fs_setattr()
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

After introduce sbi in f2fs_setattr(), cleanup F2FS_I_SB. No logic change.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 72f7d1b4a..4ca1c2dfc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1029,7 +1029,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	if (unlikely(IS_IMMUTABLE(inode)))
@@ -1074,12 +1074,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	}
 	if (i_uid_needs_update(idmap, attr, inode) ||
 	    i_gid_needs_update(idmap, attr, inode)) {
-		f2fs_lock_op(F2FS_I_SB(inode));
+		f2fs_lock_op(sbi);
 		err = dquot_transfer(idmap, inode, attr);
 		if (err) {
-			set_sbi_flag(F2FS_I_SB(inode),
-					SBI_QUOTA_NEED_REPAIR);
-			f2fs_unlock_op(F2FS_I_SB(inode));
+			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+			f2fs_unlock_op(sbi);
 			return err;
 		}
 		/*
@@ -1089,7 +1088,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		i_uid_update(idmap, attr, inode);
 		i_gid_update(idmap, attr, inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-		f2fs_unlock_op(F2FS_I_SB(inode));
+		f2fs_unlock_op(sbi);
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
@@ -1150,7 +1149,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	/* inode change will produce dirty node pages flushed by checkpoint */
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
