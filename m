Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB226D223
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 06:13:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIlIp-0002xA-Av; Thu, 17 Sep 2020 04:13:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kIlIc-0002vL-JH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EyjFKoST5U0kuWnqnUhGCsU4YqesdRAlUpxPIzb2lI0=; b=evpX8Ww6C2pgSPLLKrUGZgjUU4
 pfUWyg4Y94yJAe9ZDmeT+KbUynKXc/UGATTYfnxSZLTfVOZ+NcGKk1XRpFPpvY3tF74ch0QnrbjR6
 /nTcRRH/Qxi3SaWPJrYDhbzHROCDrhdOb8abrFuOqlDQQPZOss0ANby5bvmEqFoxAMOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EyjFKoST5U0kuWnqnUhGCsU4YqesdRAlUpxPIzb2lI0=; b=RC7k4wEPod9JhqEud0SWJ/qBIH
 1BGK+F0n6BNb+fVZcwK2ifYY21OUawaIjuiJbNHwDZ9D3GCaJo1zXoucS81tX2itKDCT7A+9rz+Wl
 01oE2hW/TS2lUzRbVUqSwtWjio7cmuavLWmYzP46F4ySV05bho27vhx7gojut21Ro0/A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIlIY-00DZe7-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:34 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF604221E7;
 Thu, 17 Sep 2020 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315990;
 bh=7wQf9Y1Ge/SR2fWtRDGBHBDQ9VcJIvgAiZJHiDlXVEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuwrpsyKR6Az33Os8au9dNORztVK5lPaO//5B4B9GGkqISAfjzCoMKvSaFMdYkK+H
 cTfwdylHR5zS/tWU4yj+Sm4uxrUgf/O1/jB19DUFCvaoNPk/KtcTePbae7Dup7hHHg
 AlchzaMoe4dDGfi2GfcedI9GWx9Qsvh1eLld4LG4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 16 Sep 2020 21:11:33 -0700
Message-Id: <20200917041136.178600-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIlIY-00DZe7-Ar
Subject: [f2fs-dev] [PATCH v3 10/13] fscrypt: make "#define fscrypt_policy"
 user-only
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The fscrypt UAPI header defines fscrypt_policy to fscrypt_policy_v1,
for source compatibility with old userspace programs.

Internally, the kernel doesn't want that compatibility definition.
Instead, fscrypt_private.h #undefs it and re-defines it to a union.

That works for now.  However, in order to add
fscrypt_operations::get_dummy_policy(), we'll need to forward declare
'union fscrypt_policy' in include/linux/fscrypt.h.  That would cause
build errors because "fscrypt_policy" is used in ioctl numbers.

To avoid this, modify the UAPI header to make the fscrypt_policy
compatibility definition conditional on !__KERNEL__, and make the ioctls
use fscrypt_policy_v1 instead of fscrypt_policy.

Note that this doesn't change the actual ioctl numbers.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h  | 1 -
 include/uapi/linux/fscrypt.h | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 355f6d9377517..ac3352086ee44 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -97,7 +97,6 @@ static inline const u8 *fscrypt_context_nonce(const union fscrypt_context *ctx)
 	return NULL;
 }
 
-#undef fscrypt_policy
 union fscrypt_policy {
 	u8 version;
 	struct fscrypt_policy_v1 v1;
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 7875709ccfebf..e5de603369381 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -45,7 +45,6 @@ struct fscrypt_policy_v1 {
 	__u8 flags;
 	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 };
-#define fscrypt_policy	fscrypt_policy_v1
 
 /*
  * Process-subscribed "logon" key description prefix and payload format.
@@ -156,9 +155,9 @@ struct fscrypt_get_key_status_arg {
 	__u32 __out_reserved[13];
 };
 
-#define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy)
+#define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy_v1)
 #define FS_IOC_GET_ENCRYPTION_PWSALT		_IOW('f', 20, __u8[16])
-#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy)
+#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy_v1)
 #define FS_IOC_GET_ENCRYPTION_POLICY_EX		_IOWR('f', 22, __u8[9]) /* size + version */
 #define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
 #define FS_IOC_REMOVE_ENCRYPTION_KEY		_IOWR('f', 24, struct fscrypt_remove_key_arg)
@@ -170,6 +169,7 @@ struct fscrypt_get_key_status_arg {
 
 /* old names; don't add anything new here! */
 #ifndef __KERNEL__
+#define fscrypt_policy			fscrypt_policy_v1
 #define FS_KEY_DESCRIPTOR_SIZE		FSCRYPT_KEY_DESCRIPTOR_SIZE
 #define FS_POLICY_FLAGS_PAD_4		FSCRYPT_POLICY_FLAGS_PAD_4
 #define FS_POLICY_FLAGS_PAD_8		FSCRYPT_POLICY_FLAGS_PAD_8
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
