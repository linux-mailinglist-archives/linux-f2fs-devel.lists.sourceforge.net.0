Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C4748FBA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jul 2023 23:29:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHA40-000317-Rg;
	Wed, 05 Jul 2023 21:29:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qHA3l-00030f-4r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 21:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d8NO4xkAfstSNOz0My9I9JHFpGGag9zbISHH0chkM0I=; b=jvUZ5f/t+sG6IMpOYmX7Ahh/LQ
 sQYoqPnviMLozFEZCwikNZhJIkfCD7dgmIax52FQ2JaAEXykPsj85ZkAo/UV8awzYytJ9rJy9i9KX
 ZAa/yriqERLv61tbqz/eUhUZBSzH1OQryKFwnlsfGXMiu2G3qsWPW1UV/POEge3dtGvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d8NO4xkAfstSNOz0My9I9JHFpGGag9zbISHH0chkM0I=; b=TAunBD6sTID58jaRKJgb9T3O4e
 JIIA5BGZANrYB3mI99a4GFokVBpyTiVJZJnnljUlBWDmuQvLzEuzyCO/87pFljdIwkldf66UJhn6J
 nO5CcrQONSEk4cViEzE6D5hLOctdroexxNninHk8Z3VU71fnWI7NKcjtb2/BElo/9UCw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHA3k-007cIi-9h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 21:29:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF2056170C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Jul 2023 21:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C7BC433C8;
 Wed,  5 Jul 2023 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688592546;
 bh=xOkkwOdBv689nQOayvOBFXHmw5DdnGT8JKgKnkkvuFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AOP+FAGRKJRn7YZ3KsFIw2oMNsfUDJ9o3vX+EifphUso/1a3seW4TLdo+bR/GXaoH
 nluhA1sXVj/rbTYs9NZ8p5CC5/1jXygBxXQJBGprnZQYAlAJq6BsPrvDUYwBBGVhpy
 dGe4RcBK3V/KqvY49lZiwHgU8kfORsLDXu3cSVVd8FqLA0NEejbHhASBF2KN9qX4yE
 rTc4NgeNLP9MNjUvcKCQrnz1gKOvdGGblzCskXhbmn9o+dyIQnUpKdP5HNH9VHIkMR
 Ddyq6V0TMAleFw8nPfyAPNWUvYshOnH2OmAtARlIw7zIcPDH0y2H8G62z7Z0gFAASq
 lP6ApEGDaSxTA==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Date: Wed,  5 Jul 2023 14:27:42 -0700
Message-ID: <20230705212743.42180-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705212743.42180-1-ebiggers@kernel.org>
References: <20230705212743.42180-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Since
 CONFIG_FS_VERITY
 is a bool, not a tristate, fs/verity/ can only be builtin or absent entirely; 
 it can't be a loadable module. Therefore, the error code that gets returned
 from the fsverity_init( [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHA3k-007cIi-9h
Subject: [f2fs-dev] [PATCH 1/2] fsverity: simplify handling of errors during
 initcall
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
Cc: linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since CONFIG_FS_VERITY is a bool, not a tristate, fs/verity/ can only be
builtin or absent entirely; it can't be a loadable module.  Therefore,
the error code that gets returned from the fsverity_init() initcall is
never used.  If any part of the initcall does fail, which should never
happen, the kernel will be left in a bad state.

Following the usual convention for builtin code, just panic the kernel
if any of part of the initcall fails.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h | 11 ++++------
 fs/verity/init.c             | 24 +++------------------
 fs/verity/open.c             | 18 +++++-----------
 fs/verity/signature.c        | 42 ++++++++++++------------------------
 fs/verity/verify.c           | 11 ++--------
 5 files changed, 28 insertions(+), 78 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 49bf3a1eb2a02..c5ab9023dd2d3 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -118,8 +118,7 @@ void fsverity_free_info(struct fsverity_info *vi);
 int fsverity_get_descriptor(struct inode *inode,
 			    struct fsverity_descriptor **desc_ret);
 
-int __init fsverity_init_info_cache(void);
-void __init fsverity_exit_info_cache(void);
+void __init fsverity_init_info_cache(void);
 
 /* signature.c */
 
@@ -127,7 +126,7 @@ void __init fsverity_exit_info_cache(void);
 int fsverity_verify_signature(const struct fsverity_info *vi,
 			      const u8 *signature, size_t sig_size);
 
-int __init fsverity_init_signature(void);
+void __init fsverity_init_signature(void);
 #else /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
 static inline int
 fsverity_verify_signature(const struct fsverity_info *vi,
@@ -136,15 +135,13 @@ fsverity_verify_signature(const struct fsverity_info *vi,
 	return 0;
 }
 
-static inline int fsverity_init_signature(void)
+static inline void fsverity_init_signature(void)
 {
-	return 0;
 }
 #endif /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
 
 /* verify.c */
 
-int __init fsverity_init_workqueue(void);
-void __init fsverity_exit_workqueue(void);
+void __init fsverity_init_workqueue(void);
 
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index 0239051510355..bcd11d63eb1ca 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -33,28 +33,10 @@ void fsverity_msg(const struct inode *inode, const char *level,
 
 static int __init fsverity_init(void)
 {
-	int err;
-
 	fsverity_check_hash_algs();
-
-	err = fsverity_init_info_cache();
-	if (err)
-		return err;
-
-	err = fsverity_init_workqueue();
-	if (err)
-		goto err_exit_info_cache;
-
-	err = fsverity_init_signature();
-	if (err)
-		goto err_exit_workqueue;
-
+	fsverity_init_info_cache();
+	fsverity_init_workqueue();
+	fsverity_init_signature();
 	return 0;
-
-err_exit_workqueue:
-	fsverity_exit_workqueue();
-err_exit_info_cache:
-	fsverity_exit_info_cache();
-	return err;
 }
 late_initcall(fsverity_init)
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 1db5106a9c385..6c31a871b84bc 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -408,18 +408,10 @@ void __fsverity_cleanup_inode(struct inode *inode)
 }
 EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
 
-int __init fsverity_init_info_cache(void)
+void __init fsverity_init_info_cache(void)
 {
-	fsverity_info_cachep = KMEM_CACHE_USERCOPY(fsverity_info,
-						   SLAB_RECLAIM_ACCOUNT,
-						   file_digest);
-	if (!fsverity_info_cachep)
-		return -ENOMEM;
-	return 0;
-}
-
-void __init fsverity_exit_info_cache(void)
-{
-	kmem_cache_destroy(fsverity_info_cachep);
-	fsverity_info_cachep = NULL;
+	fsverity_info_cachep = KMEM_CACHE_USERCOPY(
+					fsverity_info,
+					SLAB_RECLAIM_ACCOUNT | SLAB_PANIC,
+					file_digest);
 }
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 72034bc71c9d9..ec75ffec069ed 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -109,43 +109,29 @@ static struct ctl_table fsverity_sysctl_table[] = {
 	{ }
 };
 
-static int __init fsverity_sysctl_init(void)
+static void __init fsverity_sysctl_init(void)
 {
-	fsverity_sysctl_header = register_sysctl("fs/verity", fsverity_sysctl_table);
-	if (!fsverity_sysctl_header) {
-		pr_err("sysctl registration failed!\n");
-		return -ENOMEM;
-	}
-	return 0;
+	fsverity_sysctl_header = register_sysctl("fs/verity",
+						 fsverity_sysctl_table);
+	if (!fsverity_sysctl_header)
+		panic("fsverity sysctl registration failed");
 }
 #else /* !CONFIG_SYSCTL */
-static inline int __init fsverity_sysctl_init(void)
+static inline void fsverity_sysctl_init(void)
 {
-	return 0;
 }
 #endif /* !CONFIG_SYSCTL */
 
-int __init fsverity_init_signature(void)
+void __init fsverity_init_signature(void)
 {
-	struct key *ring;
-	int err;
-
-	ring = keyring_alloc(".fs-verity", KUIDT_INIT(0), KGIDT_INIT(0),
-			     current_cred(), KEY_POS_SEARCH |
+	fsverity_keyring =
+		keyring_alloc(".fs-verity", KUIDT_INIT(0), KGIDT_INIT(0),
+			      current_cred(), KEY_POS_SEARCH |
 				KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE |
 				KEY_USR_SEARCH | KEY_USR_SETATTR,
-			     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
-	if (IS_ERR(ring))
-		return PTR_ERR(ring);
-
-	err = fsverity_sysctl_init();
-	if (err)
-		goto err_put_ring;
-
-	fsverity_keyring = ring;
-	return 0;
+			      KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
+	if (IS_ERR(fsverity_keyring))
+		panic("failed to allocate \".fs-verity\" keyring");
 
-err_put_ring:
-	key_put(ring);
-	return err;
+	fsverity_sysctl_init();
 }
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 433cef51f5f6b..904ccd7e8e162 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -346,7 +346,7 @@ void fsverity_enqueue_verify_work(struct work_struct *work)
 }
 EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
 
-int __init fsverity_init_workqueue(void)
+void __init fsverity_init_workqueue(void)
 {
 	/*
 	 * Use a high-priority workqueue to prioritize verification work, which
@@ -360,12 +360,5 @@ int __init fsverity_init_workqueue(void)
 						  WQ_HIGHPRI,
 						  num_online_cpus());
 	if (!fsverity_read_workqueue)
-		return -ENOMEM;
-	return 0;
-}
-
-void __init fsverity_exit_workqueue(void)
-{
-	destroy_workqueue(fsverity_read_workqueue);
-	fsverity_read_workqueue = NULL;
+		panic("failed to allocate fsverity_read_queue");
 }

base-commit: ace1ba1c9038b30f29c5759bc4726bbed7748f15
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
