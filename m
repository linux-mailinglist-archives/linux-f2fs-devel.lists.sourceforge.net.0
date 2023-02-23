Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E66A00DE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Feb 2023 02:48:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pV0is-0000Fn-0R;
	Thu, 23 Feb 2023 01:48:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1pV0iq-0000Fh-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Feb 2023 01:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yTCD3dhNq5AjqdkUTaZlH6R5cy8DnWCm2It+N2m8hok=; b=e7Q+sUCPdi8LFqW4wh1zNOK3kd
 p3IrTodacXPhsx7BMYL4xNrFSm0FNRI62Gj7zFUdP4bsdjCBy8gcm0AGETB/KUbYQKbHEbB6kzg2N
 UaieKR/IHks7TZ0jg6zGA9TU7LPB/oUVPly0SkmHYJjZT1C+EE5OdU3JVrRQt5SF7UFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yTCD3dhNq5AjqdkUTaZlH6R5cy8DnWCm2It+N2m8hok=; b=T
 zw1sVJZCoR89mMSY1m91VZCYiR5rkbmhdsgaT+dCJoVD2VkGGEYbJ4Gmdo9VJKTiS7PPD3bCUUtw/
 RhKTASL+wMblIphqiKeZ4BvYFyOpQfnwtLJ1szsudbBRMIE5QJLWr4tGeJvEaFhMq46vfGHw558UN
 aD9Ne0C61eFvdexY=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pV0im-00E4Du-4l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Feb 2023 01:48:35 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PMZzX0DWLzKmLv;
 Thu, 23 Feb 2023 09:23:36 +0800 (CST)
Received: from huawei.com (10.67.175.88) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 23 Feb
 2023 09:28:27 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 23 Feb 2023 01:25:13 +0000
Message-ID: <20230223012513.1781735-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.88]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 26b5a079197c ("f2fs: cleanup dirty pages if
 recover
 failed"), f2fs_sync_inode_meta() is only used in checkpoint.c,
 so f2fs_sync_inode_meta()
 should only be visible inside. Delete the decl [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pV0im-00E4Du-4l
Subject: [f2fs-dev] [PATCH -next] f2fs: make f2fs_sync_inode_meta() static
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: lizetao1@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After commit 26b5a079197c ("f2fs: cleanup dirty pages if recover failed"),
f2fs_sync_inode_meta() is only used in checkpoint.c, so
f2fs_sync_inode_meta() should only be visible inside. Delete the
declaration in the header file and change f2fs_sync_inode_meta()
to static.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/f2fs/checkpoint.c | 2 +-
 fs/f2fs/f2fs.h       | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c3e058e0a018..57e8ca187dc7 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1133,7 +1133,7 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
 	goto retry;
 }
 
-int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
+static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 {
 	struct list_head *head = &sbi->inode_list[DIRTY_META];
 	struct inode *inode;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..3c95c8b75a23 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3737,7 +3737,6 @@ void f2fs_set_dirty_device(struct f2fs_sb_info *sbi, nid_t ino,
 					unsigned int devidx, int type);
 bool f2fs_is_dirty_device(struct f2fs_sb_info *sbi, nid_t ino,
 					unsigned int devidx, int type);
-int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi);
 int f2fs_acquire_orphan_inode(struct f2fs_sb_info *sbi);
 void f2fs_release_orphan_inode(struct f2fs_sb_info *sbi);
 void f2fs_add_orphan_inode(struct inode *inode);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
