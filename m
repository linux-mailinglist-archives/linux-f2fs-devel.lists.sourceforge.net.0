Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3C1E1E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 11:21:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdVmS-0002k0-H4; Tue, 26 May 2020 09:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1jdVmR-0002jq-3P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 09:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uJvO1RYRFLEAA4kQRQWPjzUgKH2XLmKf4lk7j6VuS+o=; b=OoW1Qdo6mtzUiT1lzK4AgbqJr9
 D7sHIDdjoW7vYbilkIpViP72CU9MPnd76HJ7hy40OXWF83iSfl5SNeroZQfJ5xMcagYKYvB7iATOj
 cKetey9F2TX3t7VJ62cVMg3OgvAKcNln8WgSqWq1J64KTG0PczsiBTpkB0ayYjnVB7iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uJvO1RYRFLEAA4kQRQWPjzUgKH2XLmKf4lk7j6VuS+o=; b=VCaBEVNE1hzasbrQeLqZMQI9ip
 Lujq66puX39pb3PlNmHjf7yeYNerCm/O80D66EasQWvOoamMQjBy9EYm4lwCyKeK+g29va6qPST26
 3k+69350OhZlZLjDvmsBTKiAI4On36OM4H8ZdkR/3XkMxq5RXcGhNNb8Y9eEqEVkQHB8=;
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jdVmI-00GRvk-Ul
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 09:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1590483952; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=I9/IcOkNR2xlPJoIq0/M1fupdwsgV0VjnPLTitB5jFxQpboCw+aawumps9i5GZ/zTZm1ed22/9NMMNukrjg+6ObkOw0PjlsMQUl+K6+YUYuaxT04Es5rYiU1Z5LZk/ocsutUqk/yuPzgLJg7Rvnvu4aNICRETSF4UxzKJmAPbJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1590483952;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=uJvO1RYRFLEAA4kQRQWPjzUgKH2XLmKf4lk7j6VuS+o=; 
 b=fnWzi9K4CGOpPBNvnaqoY1LvIXj7UxSaQHCWKMMeeVLKNj4FBD+VKEwuXnYwnrFCb5nDaH9Df+7ZK8llSm+TSoPHOuYJpfLmSjVCD+OSeyU7wGpcaOpDMS9gr3XkiNVs3U9k3aQ5zZdYUx6SFk6oV7y5wjPLgGrOVsPXRvSzhnk=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590483952; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=uJvO1RYRFLEAA4kQRQWPjzUgKH2XLmKf4lk7j6VuS+o=;
 b=a10Kz5pP1+zgWICoKahMMh794XvLNg8FB92eJ7hmGFMy9hkYcNF5vidxz7jc0vvh
 3Si3Y/F342DKimzwVsXbbAeFwskokeo7g1Ce+7EDN4AKkTS71vEkoU4PbACd7Ud8GWn
 jfH30h99ZTjRkYQuPrzUG9I4lYdnNNuJWFcxyGhg=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1590483950204376.61715353941804;
 Tue, 26 May 2020 17:05:50 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20200526090543.23184-1-cgxu519@mykernel.net>
Date: Tue, 26 May 2020 17:05:43 +0800
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.243 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdVmI-00GRvk-Ul
Subject: [f2fs-dev] [PATCH] f2fs: code cleanup by removing ifdef macro
 surrounding
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Define f2fs_listxattr and to NULL when CONFIG_F2FS_FS_XATTR is not
enabled, then we can remove many ugly ifdef macros in the code.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/file.c  | 2 --
 fs/f2fs/namei.c | 8 --------
 fs/f2fs/xattr.h | 6 +-----
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6ab8f621a3c5..330397a2fc12 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -968,9 +968,7 @@ const struct inode_operations f2fs_file_inode_operations = {
 	.setattr	= f2fs_setattr,
 	.get_acl	= f2fs_get_acl,
 	.set_acl	= f2fs_set_acl,
-#ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-#endif
 	.fiemap		= f2fs_fiemap,
 };
 
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index f54119da2217..2091d17ff26b 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1287,9 +1287,7 @@ const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link       = f2fs_encrypted_get_link,
 	.getattr	= f2fs_getattr,
 	.setattr	= f2fs_setattr,
-#ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-#endif
 };
 
 const struct inode_operations f2fs_dir_inode_operations = {
@@ -1307,9 +1305,7 @@ const struct inode_operations f2fs_dir_inode_operations = {
 	.setattr	= f2fs_setattr,
 	.get_acl	= f2fs_get_acl,
 	.set_acl	= f2fs_set_acl,
-#ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-#endif
 	.fiemap		= f2fs_fiemap,
 };
 
@@ -1317,9 +1313,7 @@ const struct inode_operations f2fs_symlink_inode_operations = {
 	.get_link       = f2fs_get_link,
 	.getattr	= f2fs_getattr,
 	.setattr	= f2fs_setattr,
-#ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-#endif
 };
 
 const struct inode_operations f2fs_special_inode_operations = {
@@ -1327,7 +1321,5 @@ const struct inode_operations f2fs_special_inode_operations = {
 	.setattr        = f2fs_setattr,
 	.get_acl	= f2fs_get_acl,
 	.set_acl	= f2fs_set_acl,
-#ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-#endif
 };
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index 938fcd20565d..d43c0761302d 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -136,6 +136,7 @@ extern void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
 #else
 
 #define f2fs_xattr_handlers	NULL
+#define f2fs_listxattr		NULL
 static inline int f2fs_setxattr(struct inode *inode, int index,
 		const char *name, const void *value, size_t size,
 		struct page *page, int flags)
@@ -148,11 +149,6 @@ static inline int f2fs_getxattr(struct inode *inode, int index,
 {
 	return -EOPNOTSUPP;
 }
-static inline ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer,
-		size_t buffer_size)
-{
-	return -EOPNOTSUPP;
-}
 static inline int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
 #endif
-- 
2.20.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
