Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66B748FBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jul 2023 23:29:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHA43-0003U4-Ba;
	Wed, 05 Jul 2023 21:29:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qHA3z-0003Tw-47
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 21:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nMBQZnUHMFmpNm6Zl4bhzga1Bz+Jz/pWm90a0erZgw0=; b=E4DO/nJ5gxh+iXuXuZlGC/FtX9
 7Ij+7uiA5xZWMasml56/YJ8VBy5G71E2NQpZxN2SKrfxdI0hy9Q1xvBAwdm9/TIG3O4xfWZVEWYiJ
 fBKftVI8CQO5Wl1SiZCNmTz+WbWJ6bZR8aPFWjQdI9sKjJMncUcW7ZpPNI3hQEGhcGD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nMBQZnUHMFmpNm6Zl4bhzga1Bz+Jz/pWm90a0erZgw0=; b=ODJMw7tJfWbM22ngm7XaoJYDFY
 inyPuoYCfeD1oPNIahTgqPJeFnQJHMqsegJLcax72AqY4LAJBftR2NYvLiwNs3/zIfOVlvDfXxEb9
 0VSpmmsSrhfekQw9lfMPsk7zLI8p89wJ7qLjfyDsZAAAwzn4FMC4cXnSsd363rTvgOgw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHA3k-0007FT-IR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 21:29:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F187761769
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Jul 2023 21:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486A1C433C9;
 Wed,  5 Jul 2023 21:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688592546;
 bh=KcNEa0zEiaEU6adJH2JZRqZUV1g2aY4t4BXK14QkSmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rs6e5/ndV1WaPwfswIkjuHGZxkg5AVKmKpXjLnwXxXibLnuHHJEhP1lX0FWTpn9HB
 Hq1GyTvdKLiXXCLsBW8oHJLz/ufssuniOOad3yvjnkre0e8v6X/mRKGN4SgMCeM4kR
 4RkmA2kjsip5GEeN1sdYhXtD/DLl83n8dt9jrQsGIFTqqkHh1fgSDkzYUoUdz6LXfg
 NWwlkAKgodqMpO0oW0cUfiMiXpIl4Mlud0zxy+0EwFPpnrBjfJTRRGP0rZVD6AzRBQ
 hSqLswU0tITxTNlv4bVlwjrMUbBL50XwtDDRTf3iaYvcJPFHpeesbkqu8RHeQeK1bS
 TqIhNxqR27m5g==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Date: Wed,  5 Jul 2023 14:27:43 -0700
Message-ID: <20230705212743.42180-3-ebiggers@kernel.org>
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
 Content preview: From: Eric Biggers <ebiggers@google.com> Currently the
 registration of the fsverity sysctls happens in signature.c,
 which couples it to CONFIG_FS_VERITY_BUILTIN_SIGNATURES.
 This makes it hard to add new sysctls unrelated to builtin signatures. 
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
X-Headers-End: 1qHA3k-0007FT-IR
Subject: [f2fs-dev] [PATCH 2/2] fsverity: move sysctl registration out of
 signature.c
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

Currently the registration of the fsverity sysctls happens in
signature.c, which couples it to CONFIG_FS_VERITY_BUILTIN_SIGNATURES.

This makes it hard to add new sysctls unrelated to builtin signatures.

Also, some users have started checking whether the directory
/proc/sys/fs/verity exists as a way to tell whether fsverity is
supported.  This isn't the intended method; instead, the existence of
/sys/fs/$fstype/features/verity should be checked, or users should just
try to use the fsverity ioctls.  Regardlesss, it should be made to work
as expected without a dependency on CONFIG_FS_VERITY_BUILTIN_SIGNATURES.

Therefore, move the sysctl registration into init.c.  With
CONFIG_FS_VERITY_BUILTIN_SIGNATURES, nothing changes.  Without it, but
with CONFIG_FS_VERITY, an empty list of sysctls is now registered.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  1 +
 fs/verity/init.c             | 32 ++++++++++++++++++++++++++++++++
 fs/verity/signature.c        | 33 +--------------------------------
 3 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index c5ab9023dd2d3..d071a6e32581e 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -123,6 +123,7 @@ void __init fsverity_init_info_cache(void);
 /* signature.c */
 
 #ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
+extern int fsverity_require_signatures;
 int fsverity_verify_signature(const struct fsverity_info *vi,
 			      const u8 *signature, size_t sig_size);
 
diff --git a/fs/verity/init.c b/fs/verity/init.c
index bcd11d63eb1ca..a29f062f6047b 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -9,6 +9,37 @@
 
 #include <linux/ratelimit.h>
 
+#ifdef CONFIG_SYSCTL
+static struct ctl_table_header *fsverity_sysctl_header;
+
+static struct ctl_table fsverity_sysctl_table[] = {
+#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
+	{
+		.procname       = "require_signatures",
+		.data           = &fsverity_require_signatures,
+		.maxlen         = sizeof(int),
+		.mode           = 0644,
+		.proc_handler   = proc_dointvec_minmax,
+		.extra1         = SYSCTL_ZERO,
+		.extra2         = SYSCTL_ONE,
+	},
+#endif
+	{ }
+};
+
+static void __init fsverity_init_sysctl(void)
+{
+	fsverity_sysctl_header = register_sysctl("fs/verity",
+						 fsverity_sysctl_table);
+	if (!fsverity_sysctl_header)
+		panic("fsverity sysctl registration failed");
+}
+#else /* CONFIG_SYSCTL */
+static inline void fsverity_init_sysctl(void)
+{
+}
+#endif /* !CONFIG_SYSCTL */
+
 void fsverity_msg(const struct inode *inode, const char *level,
 		  const char *fmt, ...)
 {
@@ -36,6 +67,7 @@ static int __init fsverity_init(void)
 	fsverity_check_hash_algs();
 	fsverity_init_info_cache();
 	fsverity_init_workqueue();
+	fsverity_init_sysctl();
 	fsverity_init_signature();
 	return 0;
 }
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index ec75ffec069ed..b95acae64eac6 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -24,7 +24,7 @@
  * /proc/sys/fs/verity/require_signatures
  * If 1, all verity files must have a valid builtin signature.
  */
-static int fsverity_require_signatures;
+int fsverity_require_signatures;
 
 /*
  * Keyring that contains the trusted X.509 certificates.
@@ -93,35 +93,6 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	return 0;
 }
 
-#ifdef CONFIG_SYSCTL
-static struct ctl_table_header *fsverity_sysctl_header;
-
-static struct ctl_table fsverity_sysctl_table[] = {
-	{
-		.procname       = "require_signatures",
-		.data           = &fsverity_require_signatures,
-		.maxlen         = sizeof(int),
-		.mode           = 0644,
-		.proc_handler   = proc_dointvec_minmax,
-		.extra1         = SYSCTL_ZERO,
-		.extra2         = SYSCTL_ONE,
-	},
-	{ }
-};
-
-static void __init fsverity_sysctl_init(void)
-{
-	fsverity_sysctl_header = register_sysctl("fs/verity",
-						 fsverity_sysctl_table);
-	if (!fsverity_sysctl_header)
-		panic("fsverity sysctl registration failed");
-}
-#else /* !CONFIG_SYSCTL */
-static inline void fsverity_sysctl_init(void)
-{
-}
-#endif /* !CONFIG_SYSCTL */
-
 void __init fsverity_init_signature(void)
 {
 	fsverity_keyring =
@@ -132,6 +103,4 @@ void __init fsverity_init_signature(void)
 			      KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
 	if (IS_ERR(fsverity_keyring))
 		panic("failed to allocate \".fs-verity\" keyring");
-
-	fsverity_sysctl_init();
 }
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
