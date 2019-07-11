Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46796659F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 17:06:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlaeW-00068n-Ud; Thu, 11 Jul 2019 15:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hlaeV-00068O-3H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 15:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvUHy3kLSitfL0cDUVuvWW59o95MY87+PMWiwy9FNgM=; b=S/0T7b/zt6w6ryTYqjsr/DNnrT
 AXJh/Cvt5fcMnOzo55boIzdWlU4nLavckJXlHOd0qYNJduZxDlK/YnccTb1KDGmUhZ7MYk6mNoySo
 D9+SU2+iFYTLzcOyB5X0cD6GoxU8UEkzCWO23PZZTIxJL7bE8lmbmhDTX4Z6EcWxQKTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YvUHy3kLSitfL0cDUVuvWW59o95MY87+PMWiwy9FNgM=; b=U
 Rnye0oXCvHLMRoQTo0BIML5nFx14RgGKcfT1DZLsFpj7LLeWdKPNhhsTEyyl1pdCwaLWOnfCTmhor
 Wfi6jEojHJx60A0pCaN7dS2X4ItCXNtvcv8lribLRoP7ExH5LsvjUVBRHMM3uvRFau3GUJxhzqiuh
 4K/FTnFkGLGBTCL4=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlaeT-00G8Bh-OK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 15:06:31 +0000
Received: by mail-pl1-f194.google.com with SMTP id c2so3158590plz.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YvUHy3kLSitfL0cDUVuvWW59o95MY87+PMWiwy9FNgM=;
 b=Spi+wDLKK2SrXrB01yjuYnsvBiaAVZ0acFDE7RIVXME3HOWEDi4Ocpjb1vfNVLmcQj
 odMnVP78VJxeG0qVhbuwfUATMzDaZykVH7VGrVOT4v4ZAGU48hZr0jLam3i7GKUKDYVr
 jHw4KWvsDtqDXsoerkHTaRIyMTHmnOoprMg30l1GZK0n702zM5g8PVJTYPu6V1dEHbVk
 v9tViPnNq+tBpRo9BPlhFfbQU0Q5v2h8NJevc2pJAmh03gc1lGL6HhlcQhXqcTmYdbjF
 vEUmmPmCblFp/FSeuJZrQGuvE77odFWAv3EJiCSdZ4Yhiq0lNyNDyHC9BFqVrhVx2l9k
 OGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YvUHy3kLSitfL0cDUVuvWW59o95MY87+PMWiwy9FNgM=;
 b=UkqiYgeP+X023sbNP2mEYQb8PotckZDJOMQJ02485vs77tPiAM93VCUwmxuS4JA9fy
 hxSwEvlvBMOWbCeVKK3McoF2gCswvnBbt4hAKLRPsC/69Zo0LhZ3AjXUFO5MOkdzdgSj
 cVJwpFfuLTMpED5ahSn1r8VarqDwrjmwcdycX9EprqRLaKaOqqveKuNPfur5PtYXQIn7
 w26LFjHj+w4XkxWh9pQ+xSCT1IafpgU4RbgvOSCQB0Ex8lxxBTQna0C3XFF9qoRRxVJS
 B2RMS1u2tFkd5KlK7WcIUCaFo8Oq4pXdgAp0gazw5N7BnMHcwWdp5WtQ2y2FNsGg1+Uq
 e/Tg==
X-Gm-Message-State: APjAAAWsxJVBUGr9Rs7jrKMwfmn1FczsuCwkqCaXReMDLAzAC0m31/Fm
 ELhhVu/KdB4jjW4400RU7acL+zKnvA8=
X-Google-Smtp-Source: APXvYqzjT28e0r9NNzy69TDHHb2X2cXzxN/F1aETxCehk7Qpqb7R9AJY3cvumjVSULOb/ee6AZNz/A==
X-Received: by 2002:a17:902:a504:: with SMTP id
 s4mr5124367plq.117.1562857583666; 
 Thu, 11 Jul 2019 08:06:23 -0700 (PDT)
Received: from localhost.localdomain ([121.170.223.70])
 by smtp.gmail.com with ESMTPSA id g62sm5651266pje.11.2019.07.11.08.06.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:06:23 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jul 2019 00:06:17 +0900
Message-Id: <20190711150617.124660-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
X-Headers-End: 1hlaeT-00G8Bh-OK
Subject: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr lookups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It's been observed that kzalloc() on lookup_all_xattrs() are called millions
of times on Android, quickly becoming the top abuser of slub memory allocator.

Use a dedicated kmem cache pool for xattr lookups to mitigate this.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fs/f2fs/f2fs.h  |  6 ++++++
 fs/f2fs/super.c |  8 +++++++-
 fs/f2fs/xattr.c | 33 ++++++++++++++++++++++++---------
 3 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9c6388253c9d2..3046ca2ebd121 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3510,6 +3510,12 @@ void f2fs_exit_sysfs(void);
 int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
 
+/*
+ * xattr.c
+ */
+int __init f2fs_init_xattr_caches(void);
+void f2fs_destroy_xattr_caches(void);
+
 /*
  * crypto support
  */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6d262d13251cf..abb59d9e25848 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3614,9 +3614,12 @@ static int __init init_f2fs_fs(void)
 	err = init_inodecache();
 	if (err)
 		goto fail;
-	err = f2fs_create_node_manager_caches();
+	err = f2fs_init_xattr_caches();
 	if (err)
 		goto free_inodecache;
+	err = f2fs_create_node_manager_caches();
+	if (err)
+		goto fail_xattr_caches;
 	err = f2fs_create_segment_manager_caches();
 	if (err)
 		goto free_node_manager_caches;
@@ -3656,6 +3659,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_segment_manager_caches();
 free_node_manager_caches:
 	f2fs_destroy_node_manager_caches();
+fail_xattr_caches:
+	f2fs_destroy_xattr_caches();
 free_inodecache:
 	destroy_inodecache();
 fail:
@@ -3673,6 +3678,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_checkpoint_caches();
 	f2fs_destroy_segment_manager_caches();
 	f2fs_destroy_node_manager_caches();
+	f2fs_destroy_xattr_caches();
 	destroy_inodecache();
 	f2fs_destroy_trace_ios();
 }
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index e791741d193b8..635b50ea3e5e8 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -22,6 +22,23 @@
 #include "f2fs.h"
 #include "xattr.h"
 
+static struct kmem_cache *f2fs_xattr_cachep;
+
+int __init f2fs_init_xattr_caches(void)
+{
+	f2fs_xattr_cachep = f2fs_kmem_cache_create("xattr_entry",
+			VALID_XATTR_BLOCK_SIZE + XATTR_PADDING_SIZE);
+	if (!f2fs_xattr_cachep)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void f2fs_destroy_xattr_caches(void)
+{
+	kmem_cache_destroy(f2fs_xattr_cachep);
+}
+
 static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 		struct dentry *unused, struct inode *inode,
 		const char *name, void *buffer, size_t size)
@@ -312,7 +329,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 		return -ENODATA;
 
 	*base_size = XATTR_SIZE(xnid, inode) + XATTR_PADDING_SIZE;
-	txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
+	txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
 	if (!txattr_addr)
 		return -ENOMEM;
 
@@ -358,7 +375,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	*base_addr = txattr_addr;
 	return 0;
 out:
-	kvfree(txattr_addr);
+	kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
 	return err;
 }
 
@@ -367,13 +384,11 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
 {
 	struct f2fs_xattr_header *header;
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
-	unsigned int size = VALID_XATTR_BLOCK_SIZE;
 	unsigned int inline_size = inline_xattr_size(inode);
 	void *txattr_addr;
 	int err;
 
-	txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode),
-			inline_size + size + XATTR_PADDING_SIZE, GFP_NOFS);
+	txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
 	if (!txattr_addr)
 		return -ENOMEM;
 
@@ -401,7 +416,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
 	*base_addr = txattr_addr;
 	return 0;
 fail:
-	kvfree(txattr_addr);
+	kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
 	return err;
 }
 
@@ -528,7 +543,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 	}
 	error = size;
 out:
-	kvfree(base_addr);
+	kmem_cache_free(f2fs_xattr_cachep, base_addr);
 	return error;
 }
 
@@ -574,7 +589,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	}
 	error = buffer_size - rest;
 cleanup:
-	kvfree(base_addr);
+	kmem_cache_free(f2fs_xattr_cachep, base_addr);
 	return error;
 }
 
@@ -712,7 +727,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (!error && S_ISDIR(inode->i_mode))
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
 exit:
-	kvfree(base_addr);
+	kmem_cache_free(f2fs_xattr_cachep, base_addr);
 	return error;
 }
 
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
