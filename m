Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F02B28B2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 23:42:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdhmI-0007Fa-LH; Fri, 13 Nov 2020 22:42:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdgVM-0006VR-4S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5EdGKuSSjTc6JT/A98i5Gk2BeN8KQ5bwER80vZYgcew=; b=GNknlA50I/ocQ7FuRsOiL5PB8W
 vD1wT1duG5Mi1GUFjA5F33XIlO+kZ5QZy+WRLrTzeoHW8NxQ0QMAawARhp83YX+NphVJtup/Hcs4I
 yNApf9Afc9OQZZHuqUXT2boeLO8L2OSnhlJKMiPp93p64MNZEcxXw9ywPvQ7+c8QmYFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5EdGKuSSjTc6JT/A98i5Gk2BeN8KQ5bwER80vZYgcew=; b=dWguTDVmIR9rszub/t0eJqOiiu
 8ADfLLNHPqRH3roAuVCLEAoqdtOOQdgaVrSY573AR0JbWQyhIwSWAy8WHAgt8c6Viq8O5EV4tGdbj
 W5OU84YqIaKyi2eP/0FTZFbGWVKNHSikxx3s1XvcDnPApJ1JodKBjZrvKs8EJ9Qo0zKg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdgVB-00At4A-A0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:10 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 648E622252;
 Fri, 13 Nov 2020 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605302448;
 bh=ScGzaAW6HXdlD6RQGCPEYgiXqyaD/WPHBs8Mx4EkY0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BNQjGcA09qmTlCvYBv/OxdPDQISeth/aNijXDe8af96kTcI3tDzz4Sa6hDs+FRC7C
 oXGfQ8r4fq1Mo72bcGANbMafbzbBcrT4NXnGHwU7Y1AIxWd26bZQqlfyHf0fUUS2D1
 y1g6EuoDc4yvuQw+CUg1mIvyhLt/5G4hkfQzhZUw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 13 Nov 2020 13:19:16 -0800
Message-Id: <20201113211918.71883-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113211918.71883-1-ebiggers@kernel.org>
References: <20201113211918.71883-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdgVB-00At4A-A0
Subject: [f2fs-dev] [PATCH 2/4] fs-verity: rename fsverity_signed_digest to
 fsverity_formatted_digest
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
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
 Luca Boccassi <luca.boccassi@microsoft.com>,
 Luca Boccassi <luca.boccassi@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-ext4@vger.kernel.org,
 Martijn Coenen <maco@android.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The name "struct fsverity_signed_digest" is causing confusion because it
isn't actually a signed digest, but rather it's the way that the digest
is formatted in order to be signed.  Rename it to
"struct fsverity_formatted_digest" to prevent this confusion.

Also update the struct's comment to clarify that it's specific to the
built-in signature verification support and isn't a requirement for all
fs-verity users.

I'll be renaming this struct in fsverity-utils too.

Acked-by: Luca Boccassi <luca.boccassi@microsoft.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst |  2 +-
 fs/verity/fsverity_private.h           | 17 ++++++++++++-----
 fs/verity/signature.c                  |  2 +-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 895e9711ed881..421b75498d49b 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -372,7 +372,7 @@ kernel.  Specifically, it adds support for:
 File measurements must be signed in the following format, which is
 similar to the structure used by `FS_IOC_MEASURE_VERITY`_::
 
-    struct fsverity_signed_digest {
+    struct fsverity_formatted_digest {
             char magic[8];                  /* must be "FSVerity" */
             __le16 digest_algorithm;
             __le16 digest_size;
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index e96d99d5145e1..75f8e18b44a5b 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -101,12 +101,19 @@ struct fsverity_descriptor {
 					 sizeof(struct fsverity_descriptor))
 
 /*
- * Format in which verity file measurements are signed.  This is the same as
- * 'struct fsverity_digest', except here some magic bytes are prepended to
- * provide some context about what is being signed in case the same key is used
- * for non-fsverity purposes, and here the fields have fixed endianness.
+ * Format in which verity file measurements are signed in built-in signatures.
+ * This is the same as 'struct fsverity_digest', except here some magic bytes
+ * are prepended to provide some context about what is being signed in case the
+ * same key is used for non-fsverity purposes, and here the fields have fixed
+ * endianness.
+ *
+ * This struct is specific to the built-in signature verification support, which
+ * is optional.  fs-verity users may also verify signatures in userspace, in
+ * which case userspace is responsible for deciding on what bytes are signed.
+ * This struct may still be used, but it doesn't have to be.  For example,
+ * userspace could instead use a string like "sha256:$digest_as_hex_string".
  */
-struct fsverity_signed_digest {
+struct fsverity_formatted_digest {
 	char magic[8];			/* must be "FSVerity" */
 	__le16 digest_algorithm;
 	__le16 digest_size;
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 12794a4dd1585..74ae10f04d215 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -44,7 +44,7 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	const struct inode *inode = vi->inode;
 	const struct fsverity_hash_alg *hash_alg = vi->tree_params.hash_alg;
 	const u32 sig_size = le32_to_cpu(desc->sig_size);
-	struct fsverity_signed_digest *d;
+	struct fsverity_formatted_digest *d;
 	int err;
 
 	if (sig_size == 0) {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
