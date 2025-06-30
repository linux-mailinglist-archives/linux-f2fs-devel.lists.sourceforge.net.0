Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3262AEE5AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 19:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0iFcn0vZvQQVzYLDAGVVMBsMRfQ7PnXBAQ8OxG74xY=; b=UJfIIsRNM2P9q0+hRFapppq0WY
	09mzs04YhUjcyLAl4jsyYUH1YQyTzTD9++3UnBMaGIsootS5oSc+8hVoI2+uPObfaBQiKhfXXPD/a
	IYqWPPZevZw+c0+Y10a75r6vTdhZnP05CZk5ljeEMZO7DzssDEPQkEbrgAo9REYYNm8E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWIEy-0002OO-8n;
	Mon, 30 Jun 2025 17:24:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uWIEu-0002OG-6J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IcjF+brdXeKLDdvKuGuHOcn92jlIJ3BY+HwGD/HnzdU=; b=Kag2TGFPPnE9qJhwRbhVSNxkbG
 jG2Kx91aRnD4XNpqtYK5/zLmfsKoDmqb7S/z3UBnlmFw+u9MomMaBBLoZXdKvmdNy/BTlXgKTwdQU
 jiJAieN14leSC+n4F3Up+4wBjo+9vTps2DxCIzu7OOFxQ6S0scgqITs2sb12S8GuNHzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IcjF+brdXeKLDdvKuGuHOcn92jlIJ3BY+HwGD/HnzdU=; b=E1OdzT3jU3fxZYb0WpF8qgpg4a
 jvD0zHHgJ4+inNs1ucpGMOHF8PSYJEz8FSv19OGQ5J8cQeKSsDgZl7oNDQcIppncM/84zNbodUPj/
 0c4qexofXLWy+V7s1wmm6EUC/z26Qq+qEYKL/YfIvOG6Wek1rVVovoLG1aVKYHor1yyA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWIEt-0005op-OJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 640EA5C6461;
 Mon, 30 Jun 2025 17:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB53C4CEEF;
 Mon, 30 Jun 2025 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751304249;
 bh=05eIsjfDMuZi5Fi3Zt00IWUTPN1TFM68UljYfUCnOjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EyfFghiRLoFUvHJsn4kFSOQqXBFgD1XAtC4khHBTP+zdrMHIIh1l567vYkMbaVN2S
 skBXd85PTVk811uNOQWb6aBwVgO73NidRwFgE3DCHYE1VnBYtpiG0qQYBpa/pn3cM+
 1TstBKj9aPXtTCNQQjnCsqHMAQqQHPiMz13rhVmAYMSWB1SUI/ClQtAI2m5j05WcTe
 Zd4JXUSl0O3KZiHabGxqc2hBtS/l3GM8+pIQ+Azusy2yQa2FzAYwSbsCZxWLsNARXG
 dooaqhZSyCMHclyMgWPuvGONFdVL8zECb1BFAtZqrV9udkuvhAoTLHAqJOywENfuPa
 RkTUuaQWZZPVw==
To: fsverity@lists.linux.dev
Date: Mon, 30 Jun 2025 10:22:23 -0700
Message-ID: <20250630172224.46909-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630172224.46909-1-ebiggers@kernel.org>
References: <20250630172224.46909-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: crypto/hash_info.c just contains a couple of arrays that map
 HASH_ALGO_* algorithm IDs to properties of those algorithms. It is compiled
 only when CRYPTO_HASH_INFO=y, but currently CRYPTO_HASH_INFO de [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWIEt-0005op-OJ
Subject: [f2fs-dev] [PATCH 1/2] lib/crypto: hash_info: Move hash_info.c into
 lib/crypto/
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

crypto/hash_info.c just contains a couple of arrays that map HASH_ALGO_*
algorithm IDs to properties of those algorithms.  It is compiled only
when CRYPTO_HASH_INFO=y, but currently CRYPTO_HASH_INFO depends on
CRYPTO.  Since this can be useful without the old-school crypto API,
move it into lib/crypto/ so that it no longer depends on CRYPTO.

This eliminates the need for FS_VERITY to select CRYPTO after it's been
converted to use lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig                     | 3 ---
 crypto/Makefile                    | 1 -
 lib/crypto/Kconfig                 | 3 +++
 lib/crypto/Makefile                | 2 ++
 {crypto => lib/crypto}/hash_info.c | 0
 5 files changed, 5 insertions(+), 4 deletions(-)
 rename {crypto => lib/crypto}/hash_info.c (100%)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 3ea1397214e02..5d4cf022c5775 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1420,13 +1420,10 @@ config CRYPTO_USER_API_ENABLE_OBSOLETE
 	  already been phased out from internal use by the kernel, and are
 	  only useful for userspace clients that still rely on them.
 
 endmenu
 
-config CRYPTO_HASH_INFO
-	bool
-
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "arch/arm/crypto/Kconfig"
 endif
 if ARM64
diff --git a/crypto/Makefile b/crypto/Makefile
index 5098fa6d5f39c..816607e0e78ce 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -202,11 +202,10 @@ obj-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 # generic algorithms and the async_tx api
 #
 obj-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
-obj-$(CONFIG_CRYPTO_HASH_INFO) += hash_info.o
 crypto_simd-y := simd.o
 obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 
 #
 # Key derivation function
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 3305c69085816..cce53ae15cd58 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -3,10 +3,13 @@
 menu "Crypto library routines"
 
 config CRYPTO_LIB_UTILS
 	tristate
 
+config CRYPTO_HASH_INFO
+	bool
+
 config CRYPTO_LIB_AES
 	tristate
 
 config CRYPTO_LIB_AESCFB
 	tristate
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index a887bf103bf05..533bb1533e19b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -6,10 +6,12 @@ quiet_cmd_perlasm = PERLASM $@
       cmd_perlasm = $(PERL) $(<) > $(@)
 
 quiet_cmd_perlasm_with_args = PERLASM $@
       cmd_perlasm_with_args = $(PERL) $(<) void $(@)
 
+obj-$(CONFIG_CRYPTO_HASH_INFO)			+= hash_info.o
+
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
 # chacha is used by the /dev/random driver which is always builtin
 obj-y						+= chacha.o
diff --git a/crypto/hash_info.c b/lib/crypto/hash_info.c
similarity index 100%
rename from crypto/hash_info.c
rename to lib/crypto/hash_info.c
-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
