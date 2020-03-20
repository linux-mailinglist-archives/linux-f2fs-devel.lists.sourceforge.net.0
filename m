Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F718CB5C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 11:18:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFEjv-0000KU-P7; Fri, 20 Mar 2020 10:18:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jFEju-0000KH-6n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 10:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qy05V+crAyGOfCPgUxow/btJ44h/9A0dR99BiDdCuP4=; b=Hz01G5qjjSnN2F9xQEW9a8lrwc
 NgCikM+Tpcb6rwsHXIBa5Q5n+NP/fVeq/GAtR2DSwygenterOpr4OH+Uqj0nETF4gqWtzEXIlq7SD
 f+1CY7+YzIA2/HeGxlbmaGGeSMWGuglLRZNuIxS6UnrU73RZfjsP+be4ngLpxxYhDqIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Qy05V+crAyGOfCPgUxow/btJ44h/9A0dR99BiDdCuP4=; b=C
 F4668nw+kaLhIahwsyNCKK1bGX8VpFJxBCrBtsgFNflsgvUiY8TWqygt3Cux5+hoeE8t4dcvOClcZ
 Ro92969eg4Vig8xusLqu9sKNz2KvtUZMcyXK0yXo8MOvoTBzzzPp79MVe3KPQ2WOLlTHawT9Te+2A
 6EnDcx2m7SnT0Nqs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFEjs-009uWS-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 10:18:54 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 077008B8674EF2BC430E;
 Fri, 20 Mar 2020 18:18:43 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Mar 2020 18:18:33 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 20 Mar 2020 18:18:31 +0800
Message-ID: <20200320101831.70611-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jFEjs-009uWS-Qm
Subject: [f2fs-dev] [PATCH] f2fs: clean up f2fs_may_encrypt()
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

Merge below two conditions into f2fs_may_encrypt() for cleanup
- IS_ENCRYPTED()
- DUMMY_ENCRYPTION_ENABLED()

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/dir.c   |  4 +---
 fs/f2fs/f2fs.h  | 13 +++++++++----
 fs/f2fs/namei.c |  4 +---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 0971ccc4664a..2accfc5e38d0 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -471,7 +471,6 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			struct page *dpage)
 {
 	struct page *page;
-	int dummy_encrypt = DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(dir));
 	int err;
 
 	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
@@ -498,8 +497,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (err)
 			goto put_error;
 
-		if ((IS_ENCRYPTED(dir) || dummy_encrypt) &&
-					f2fs_may_encrypt(inode)) {
+		if (f2fs_may_encrypt(dir, inode)) {
 			err = fscrypt_inherit_context(dir, inode, page, false);
 			if (err)
 				goto put_error;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 09db79a20f8e..fcafa68212eb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3946,15 +3946,20 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
-static inline bool f2fs_may_encrypt(struct inode *inode)
+static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	umode_t mode = inode->i_mode;
 
-	return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
-#else
-	return false;
+	/*
+	 * If the directory encrypted or dummy encryption enabled,
+	 * then we should encrypt the inode.
+	 */
+	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
+		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
 #endif
+	return false;
 }
 
 static inline bool f2fs_may_compress(struct inode *inode)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b75c70813f9e..95cfbce062e8 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -75,9 +75,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 
 	set_inode_flag(inode, FI_NEW_INODE);
 
-	/* If the directory encrypted, then we should encrypt the inode. */
-	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
-				f2fs_may_encrypt(inode))
+	if (f2fs_may_encrypt(dir, inode))
 		f2fs_set_encrypted_inode(inode);
 
 	if (f2fs_sb_has_extra_attr(sbi)) {
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
