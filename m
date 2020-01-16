Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A413F8C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2020 20:21:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isAhf-0000dW-CA; Thu, 16 Jan 2020 19:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1isAhe-0000dP-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 19:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tiVD/CWJAz6wUbslbVU5bSilCuVisNhM+BroVd9v+i4=; b=L7iZCZ96ydv+/OH9ROHTC5+2Ui
 78I14REQaOMmd+JRVVEH2scC9VFlIrDqWx4L6hsbr7hulz2qaGvaTSh7xU7M0BJcepiXR3ubNvWHt
 FuvO0nKkMrGbHDkTU7QgGe8WT0uCIIPcOUk3KozUVFMB1Di/zt9j8F75fu8DlKLw8OjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tiVD/CWJAz6wUbslbVU5bSilCuVisNhM+BroVd9v+i4=; b=E
 JTR6+n31bQ+6D10EJseiWHzCbrj/jCUiMNe+3tbPmGzkNJiBAgTTeiL25KiRBeX9X0p/YzAfyWZi4
 Y0Hf53QHSi/wW1o7wseKaA0Xl79wHhrgPIhBUhNz6ZoOhFpAvEov8t5fhiV7672mGFGymOHr3ti09
 9hKMmaeCyhEvY/xY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isAhc-009pPu-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 19:21:14 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E2D820661;
 Thu, 16 Jan 2020 19:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579202466;
 bh=rUr1wlexBA7T5J5m/OSW8iFgPsbrK8hJ/8NOCZzbZK8=;
 h=From:To:Cc:Subject:Date:From;
 b=2o/B2tfu8Tgm7+qJkztQ+IGIiSVLQQD4L+vz4mFLQQhxf/05CdxlNQXabL5dVTBRE
 kEfexecpizCN0hk37ZSmvwuUVv+OLvaeWfK50X4ddeBfHKX66XFfOlGUhdJ4n1ut+1
 uXug04sCgFEERthHjP/SNqZMkyCDOjxtcExOMNdA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 16 Jan 2020 11:20:08 -0800
Message-Id: <20200116192008.35766-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isAhc-009pPu-Qd
Subject: [f2fs-dev] [PATCH] fscrypt: reserve flags for hardware-wrapped keys
 feature
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
Cc: Barani Muthukumaran <bmuthuku@codeaurora.org>,
 Gaurav Kashyap <gaurkash@codeaurora.org>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Reserve flags for the hardware-wrapped keys feature which is being
worked on [1].  FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY will denote that the
encryption policy needs a hardware-wrapped key to be unlocked.
FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED will denote that the key being added is
a hardware-wrapped key.

This reservation is tentative, and these codepoints may be reused if the
feature is not upstreamed.

[1] https://android-review.googlesource.com/c/kernel/common/+/1200864

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 5 +++--
 fs/crypto/keyring.c                   | 5 ++++-
 fs/crypto/policy.c                    | 4 +++-
 include/uapi/linux/fscrypt.h          | 9 ++++++---
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 9c53336d06a438..4c443d7b1fc6b5 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -639,7 +639,8 @@ follows::
             struct fscrypt_key_specifier key_spec;
             __u32 raw_size;
             __u32 key_id;
-            __u32 __reserved[8];
+            __u32 flags;
+            __u32 __reserved[7];
             __u8 raw[];
     };
 
@@ -658,7 +659,7 @@ follows::
 
     struct fscrypt_provisioning_key_payload {
             __u32 type;
-            __u32 __reserved;
+            __u32 flags;
             __u8 raw[];
     };
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 098ff2e0f0bb41..fc27f5d08d7dbe 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -477,7 +477,7 @@ static int fscrypt_provisioning_key_preparse(struct key_preparsed_payload *prep)
 	    payload->type != FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER)
 		return -EINVAL;
 
-	if (payload->__reserved)
+	if (payload->flags)
 		return -EINVAL;
 
 	prep->payload.data[0] = kmemdup(payload, prep->datalen, GFP_KERNEL);
@@ -606,6 +606,9 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 	if (!valid_key_spec(&arg.key_spec))
 		return -EINVAL;
 
+	if (arg.flags)
+		return -EINVAL;
+
 	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
 		return -EINVAL;
 
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f1cff83c151acf..36a2bb077b6910 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -139,7 +139,9 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 		return false;
 	}
 
-	if (policy->flags & ~FSCRYPT_POLICY_FLAGS_VALID) {
+	if (policy->flags & ~(FSCRYPT_POLICY_FLAGS_PAD_MASK |
+			      FSCRYPT_POLICY_FLAG_DIRECT_KEY |
+			      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64)) {
 		fscrypt_warn(inode, "Unsupported encryption flags (0x%02x)",
 			     policy->flags);
 		return false;
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 0d8a6f47711c32..fad624a4c5feda 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -19,7 +19,8 @@
 #define FSCRYPT_POLICY_FLAGS_PAD_MASK		0x03
 #define FSCRYPT_POLICY_FLAG_DIRECT_KEY		0x04
 #define FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64	0x08
-#define FSCRYPT_POLICY_FLAGS_VALID		0x0F
+#define FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY	0x10
+#define FSCRYPT_POLICY_FLAGS_VALID		0x1F
 
 /* Encryption algorithms */
 #define FSCRYPT_MODE_AES_256_XTS		1
@@ -116,7 +117,7 @@ struct fscrypt_key_specifier {
  */
 struct fscrypt_provisioning_key_payload {
 	__u32 type;
-	__u32 __reserved;
+	__u32 flags;
 	__u8 raw[];
 };
 
@@ -125,7 +126,9 @@ struct fscrypt_add_key_arg {
 	struct fscrypt_key_specifier key_spec;
 	__u32 raw_size;
 	__u32 key_id;
-	__u32 __reserved[8];
+#define FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED			0x00000001
+	__u32 flags;
+	__u32 __reserved[7];
 	__u8 raw[];
 };
 

base-commit: 2d8f7f119b0b2ce5e7ff0e8024b0763bf42b99c9
-- 
2.25.0.rc1.283.g88dfdc4193-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
