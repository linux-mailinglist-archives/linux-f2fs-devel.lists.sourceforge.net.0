Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE649A57BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 02:30:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2gJO-0005iU-4i;
	Mon, 21 Oct 2024 00:30:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t2gJF-0005h8-ER
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N6WNHgH/odqbb+BsbJZfbCPrXfC9i4dZxq+SImrG6rI=; b=S/yldlEUNkMYbubNSSHxHDEbkx
 0eGq2NwNLCwyxrehfH6E/l7MaK8v7R2/ngCkkTvvq71zW0r/BDOrgxRn93LJMNmb30sJZaYFZ4F3T
 S8AnFJSDZb4std2OGPMJ+G1eWesIk+bRNi+EBoGBb+SUi+EiUJkIepToRutlxQYVbZe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N6WNHgH/odqbb+BsbJZfbCPrXfC9i4dZxq+SImrG6rI=; b=YCsr5ZKpl7IsM2BHQAVcSXZpi7
 WCHC52xb5S94M7mqyBbb0uS+Y2Nu/Pw0LdY0c+fDnqVYx23N4C29RcxxWr0m675z0z6g9H/PAw7zL
 TEoswAaHb99KVCk/IL+YVef1peIL+0pEL1dHNVkAdBUQM4EQFcvduO7KBdIgShuFS0Ow=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2gJE-0003tZ-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 15C675C58A3;
 Mon, 21 Oct 2024 00:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B69C4CEE5;
 Mon, 21 Oct 2024 00:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729470597;
 bh=4c2g2/aBZcJU5enMBJmjzSkc9cpjlgUBMmCuy/77kP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m8OKhyqDcGs17zHcb6Jt5UVhwFuor56sLp5dULk3zv8sIxETjWHOz+V/XWOF//bH6
 jGmc4mj20oXisgOVLQ1YneJQIhD74LNkVdnk9C1bZi/p3GKS2CnpWzPX+j7BUymCpt
 lYDXsl14clCrOdfkOE1F0ZUPjvPqycmkUWRtfVUAjkwCgMkr63QrYMYxdHEJrgvjbR
 iFCKhpv1BK1ZZkmKPADL9f/DIlqTHNAyCQ2TH+nVQed+4vEYhvkER5MuWXnFpVTzwJ
 ztD1BC6CsgZqsYd7mA5RbvuXJDPo701tTn82k2meXAAacdHBASCiusVzqTuYmbIs5d
 ot9NliUxFaahw==
To: linux-kernel@vger.kernel.org
Date: Sun, 20 Oct 2024 17:29:32 -0700
Message-ID: <20241021002935.325878-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
References: <20241021002935.325878-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the lower
 level __crc32c_le() library function is optimized for each architecture,
 make crc32c() just call that instead of taking an inefficient and error-prone
 detour through the shash API. 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2gJE-0003tZ-HJ
Subject: [f2fs-dev] [PATCH 12/15] lib/crc32: make crc32c() go directly to lib
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the lower level __crc32c_le() library function is optimized for
each architecture, make crc32c() just call that instead of taking an
inefficient and error-prone detour through the shash API.

Note: a future cleanup should make crc32c_le() be the actual library
function instead of __crc32c_le().  That will require updating callers
of __crc32c_le() to use crc32c_le() instead, and updating callers of
crc32c_le() that expect a 'const void *' arg to expect 'const u8 *'
instead.  Similarly, a future cleanup should remove LIBCRC32C by making
everyone who is selecting it just select CRC32 directly instead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc32c.h |  7 ++--
 lib/Kconfig            | 10 ++----
 lib/Makefile           |  1 -
 lib/libcrc32c.c        | 74 ------------------------------------------
 4 files changed, 8 insertions(+), 84 deletions(-)
 delete mode 100644 lib/libcrc32c.c

diff --git a/include/linux/crc32c.h b/include/linux/crc32c.h
index 357ae4611a453..47eb78003c265 100644
--- a/include/linux/crc32c.h
+++ b/include/linux/crc32c.h
@@ -1,12 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_CRC32C_H
 #define _LINUX_CRC32C_H
 
-#include <linux/types.h>
+#include <linux/crc32.h>
 
-extern u32 crc32c(u32 crc, const void *address, unsigned int length);
+static inline u32 crc32c(u32 crc, const void *address, unsigned int length)
+{
+	return __crc32c_le(crc, address, length);
+}
 
 /* This macro exists for backwards-compatibility. */
 #define crc32c_le crc32c
 
 #endif	/* _LINUX_CRC32C_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 07afcf214f353..b894ee64ff957 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -296,18 +296,14 @@ config CRC7
 	  the kernel tree does. Such modules that use library CRC7
 	  functions require M here.
 
 config LIBCRC32C
 	tristate "CRC32c (Castagnoli, et al) Cyclic Redundancy-Check"
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	help
-	  This option is provided for the case where no in-kernel-tree
-	  modules require CRC32c functions, but a module built outside the
-	  kernel tree does. Such modules that use library CRC32c functions
-	  require M here.  See Castagnoli93.
-	  Module will be libcrc32c.
+	  This option just selects CRC32 and is provided for compatibility
+	  purposes until the users are updated to select CRC32 directly.
 
 config CRC8
 	tristate "CRC8 function"
 	help
 	  This option provides CRC8 function. Drivers may select this
diff --git a/lib/Makefile b/lib/Makefile
index 773adf88af416..15646679aee21 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -161,11 +161,10 @@ obj-$(CONFIG_CRC_ITU_T)	+= crc-itu-t.o
 obj-$(CONFIG_CRC32)	+= crc32.o
 obj-$(CONFIG_CRC64)     += crc64.o
 obj-$(CONFIG_CRC32_SELFTEST)	+= crc32test.o
 obj-$(CONFIG_CRC4)	+= crc4.o
 obj-$(CONFIG_CRC7)	+= crc7.o
-obj-$(CONFIG_LIBCRC32C)	+= libcrc32c.o
 obj-$(CONFIG_CRC8)	+= crc8.o
 obj-$(CONFIG_CRC64_ROCKSOFT) += crc64-rocksoft.o
 obj-$(CONFIG_XXHASH)	+= xxhash.o
 obj-$(CONFIG_GENERIC_ALLOCATOR) += genalloc.o
 
diff --git a/lib/libcrc32c.c b/lib/libcrc32c.c
deleted file mode 100644
index 649e687413a0c..0000000000000
--- a/lib/libcrc32c.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* 
- * CRC32C
- *@Article{castagnoli-crc,
- * author =       { Guy Castagnoli and Stefan Braeuer and Martin Herrman},
- * title =        {{Optimization of Cyclic Redundancy-Check Codes with 24
- *                 and 32 Parity Bits}},
- * journal =      IEEE Transactions on Communication,
- * year =         {1993},
- * volume =       {41},
- * number =       {6},
- * pages =        {},
- * month =        {June},
- *}
- * Used by the iSCSI driver, possibly others, and derived from
- * the iscsi-crc.c module of the linux-iscsi driver at
- * http://linux-iscsi.sourceforge.net.
- *
- * Following the example of lib/crc32, this function is intended to be
- * flexible and useful for all users.  Modules that currently have their
- * own crc32c, but hopefully may be able to use this one are:
- *  net/sctp (please add all your doco to here if you change to
- *            use this one!)
- *  <endoflist>
- *
- * Copyright (c) 2004 Cisco Systems, Inc.
- */
-
-#include <crypto/hash.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/crc32c.h>
-
-static struct crypto_shash *tfm;
-
-u32 crc32c(u32 crc, const void *address, unsigned int length)
-{
-	SHASH_DESC_ON_STACK(shash, tfm);
-	u32 ret, *ctx = (u32 *)shash_desc_ctx(shash);
-	int err;
-
-	shash->tfm = tfm;
-	*ctx = crc;
-
-	err = crypto_shash_update(shash, address, length);
-	BUG_ON(err);
-
-	ret = *ctx;
-	barrier_data(ctx);
-	return ret;
-}
-
-EXPORT_SYMBOL(crc32c);
-
-static int __init libcrc32c_mod_init(void)
-{
-	tfm = crypto_alloc_shash("crc32c", 0, 0);
-	return PTR_ERR_OR_ZERO(tfm);
-}
-
-static void __exit libcrc32c_mod_fini(void)
-{
-	crypto_free_shash(tfm);
-}
-
-module_init(libcrc32c_mod_init);
-module_exit(libcrc32c_mod_fini);
-
-MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
-MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations");
-MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
