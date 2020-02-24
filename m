Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D089C16A4CA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:21:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6BnE-0005VO-PK; Mon, 24 Feb 2020 11:20:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6BnB-0005VC-HA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UcA7TeRs/Qkvm/RQwxM//+d2aC3o1Piv/UmVvaUl+ic=; b=HIx/HZvGR/5Zm65M/cdek3Dlij
 UVmHTfd6+lI+Iy/L9rSPxiZrSnaSiBm5z1bODItkegSYm4NVXUMSs15tgFzTHMbt6xVfxcgTAKNcF
 SLgHW+IlR+SqWNl+zeNp6lGg+U0yUWb9q/JZC+/IiEO61Tcf34rQoG9yZf0VeTo6qP3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UcA7TeRs/Qkvm/RQwxM//+d2aC3o1Piv/UmVvaUl+ic=; b=fPl7/grX1fAd8GY1WZMW0I+vOs
 SV1D2ZzwVHmbMBynxmopQ8559eGQijWybs0IsG7GSUzVdlSTANIo6KMc4nJ9RS1oKNHWFLhTiDrAE
 Ff2TX95VD+ZSWb1Tcgx7AWJL/8gQZDIwnlm4C1CgOm62N7hIb+nRNWNtkw9E4pJsYEVs=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Bn7-00F198-DU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:53 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 868F4C071FC789CF4F46;
 Mon, 24 Feb 2020 19:20:36 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 19:20:28 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 24 Feb 2020 19:20:19 +0800
Message-ID: <20200224112019.93829-5-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200224112019.93829-1-yuchao0@huawei.com>
References: <20200224112019.93829-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Bn7-00F198-DU
Subject: [f2fs-dev] [PATCH 5/5] f2fs: add missing function name in kernel
 message
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

Otherwise, we can not distinguish the exact location of messages,
when there are more than one places printing same message.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/node.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bd264d8cddaf..4a02edc2454b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2231,7 +2231,7 @@ static inline void dec_valid_node_count(struct f2fs_sb_info *sbi,
 		dquot_free_inode(inode);
 	} else {
 		if (unlikely(inode->i_blocks == 0)) {
-			f2fs_warn(sbi, "Inconsistent i_blocks, ino:%lu, iblocks:%llu",
+			f2fs_warn(sbi, "dec_valid_node_count: inconsistent i_blocks, ino:%lu, iblocks:%llu",
 				  inode->i_ino,
 				  (unsigned long long)inode->i_blocks);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 040ffb09a126..951c66d63350 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1187,8 +1187,9 @@ int f2fs_remove_inode_page(struct inode *inode)
 	}
 
 	if (unlikely(inode->i_blocks != 0 && inode->i_blocks != 8)) {
-		f2fs_warn(F2FS_I_SB(inode), "Inconsistent i_blocks, ino:%lu, iblocks:%llu",
-			  inode->i_ino, (unsigned long long)inode->i_blocks);
+		f2fs_warn(F2FS_I_SB(inode),
+			"f2fs_remove_inode_page: inconsistent i_blocks, ino:%lu, iblocks:%llu",
+			inode->i_ino, (unsigned long long)inode->i_blocks);
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
