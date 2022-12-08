Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A50326467DF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 04:36:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p37hT-0007aF-25;
	Thu, 08 Dec 2022 03:35:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p37hR-0007a9-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 03:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JB1gcAUyNuhjqohDtkMpQnavP3XGkDplS+IqSU9x0qI=; b=PdZIUIqABsg4m8kzrPGnQPnnDB
 I4Cb3lC9Xg546s/rzg4dyf0B4+uh6snSLohTS7dAb0fa3ZvWBceUM7yoAbjpYZ6gYSVmcmeBEuRcq
 KxzGzjjSVW20QgScxCB4IkOm4jp5+iVU4GvVOwIC1fKGoBulYKZwyGr/Ilp5tiAHXaO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JB1gcAUyNuhjqohDtkMpQnavP3XGkDplS+IqSU9x0qI=; b=c
 pVAsxeLZh005rC3/t5KVjqq5sTdOj7bkxFfowwCknvYj9C/4ibTT0wKnO6DM7q7xFn5zTJGVRlvPi
 8ixgiv83kHs6jYGByQd4ktpZaXqIyXlLtntQ1TXTaMGkz68oDNAol96ENnOlMEHaU6d9dkm/LsSKS
 aI79XuElGfOGaJno=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p37hO-009rGU-3u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 03:35:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C268BB8212D;
 Thu,  8 Dec 2022 03:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E955C433C1;
 Thu,  8 Dec 2022 03:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670470541;
 bh=3b5O7KzxVK5v6Enic7QwsmTYpgriCPuNr5Ncf/UzA1o=;
 h=From:To:Cc:Subject:Date:From;
 b=XoOO2i7k4RlhGjMK+25Qipm85wYb5Nt2nMYBaI742so57TB4+HJfQy3F1+ZHMX2aQ
 yC4iZ6LjqH04uZOh99NpALbH2ZCJ/J+t96CEjX7WzV4hPkur5QCNsq+T3rUIoJoy1n
 uD6sNcrSBKfIh2CaxSGLey5b5CVT1AY8KANXREyPvkWSOTm93FeUQUZs9aLAgq/89E
 W9ptvHu2sMFUlSjhPcpmKr2ddo7R9meyKnDG1oywJNjFpaOAG5k0xaqRyFkFqVc6Wv
 J37oGR4xUZNpUbTvGhx7Qz8tPb1l6Z0mm9JzZJbMyXk7zYMk1Bx9MFC2fZMsttNIM3
 9utjFcMXzdbHg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed,  7 Dec 2022 19:35:23 -0800
Message-Id: <20221208033523.122642-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> An issue that arises
 when migrating from builtin signatures to userspace signatures is that
 existing
 files that have builtin signatures cannot be opened unless either
 CONFIG_FS_VERITY_BUILTIN_SIGNATUR [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p37hO-009rGU-3u
Subject: [f2fs-dev] [PATCH] fsverity: don't check builtin signatures when
 require_signatures=0
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
Cc: Victor Hsieh <victorhsieh@google.com>, Jes Sorensen <jsorensen@meta.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Luca Boccassi <bluca@debian.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

An issue that arises when migrating from builtin signatures to userspace
signatures is that existing files that have builtin signatures cannot be
opened unless either CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled or
the signing certificate is left in the .fs-verity keyring.

Since builtin signatures provide no security benefit when
fs.verity.require_signatures=0 anyway, let's just skip the signature
verification in this case.

Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/signature.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 143a530a80088..dc6935701abda 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -13,8 +13,8 @@
 #include <linux/verification.h>
 
 /*
- * /proc/sys/fs/verity/require_signatures
- * If 1, all verity files must have a valid builtin signature.
+ * /proc/sys/fs/verity/require_signatures.  If 1, then builtin signatures are
+ * verified and all verity files must have a valid builtin signature.
  */
 static int fsverity_require_signatures;
 
@@ -54,6 +54,20 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 		return 0;
 	}
 
+	/*
+	 * If require_signatures=0, don't verify builtin signatures.
+	 * Originally, builtin signatures were verified opportunistically in
+	 * this case.  However, no security property is possible when
+	 * require_signatures=0 anyway.  Skipping the builtin signature
+	 * verification makes it easier to migrate existing files from builtin
+	 * signature verification to userspace signature verification.
+	 */
+	if (!fsverity_require_signatures) {
+		fsverity_warn(inode,
+			      "Not checking builtin signature due to require_signatures=0");
+		return 0;
+	}
+
 	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;

base-commit: 479174d402bcf60789106eedc4def3957c060bad
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
