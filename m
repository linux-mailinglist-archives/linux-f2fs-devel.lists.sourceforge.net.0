Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3F1413A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 22:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V93RWR6SmtoeGq3Jx1f9v4QoJHCSXxPD2TRvSpj+NBA=; b=gZqlK5EuIZ5PPpprO1+8DgRQk
	N3NbZI7FgxrPTNDv7b+e1h6KlchV4oWjI7A36bC7hxP7PW81NVBCL8v6u5yX/Ty+LNPhgzoJxekXL
	KCSIiwbN2ZOP+EwKKqT5fMpMtNuy/9KPfpGnngUSSg1bkxSwAEpnb4L6nCVamnuIW+5TE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isZTg-0008UB-Mx; Fri, 17 Jan 2020 21:48:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3YyoiXgYKADgXlimYhaiiafY.Wig@flex--drosen.bounces.google.com>)
 id 1isZTf-0008Tu-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ijaPqYX9QMZlgJNEqLIabbahqNoro6V7G/0uSLsc++o=; b=B8n5gMycFK2XNEXbsC3r9QeyV
 lQ8eAruAmO8FLYYlFDyvGLuMSAQLZq9ernu2TwBqErna0ZSqpGkwyNsQ/KPV9dd1jniU3rEdpmuDm
 6ii0Si1LrPZRBPCsmSyWqg9UkRANbh/UcrANLUFXpYfAjFSBK8uuHIgHjtpNZybE49s9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ijaPqYX9QMZlgJNEqLIabbahqNoro6V7G/0uSLsc++o=; b=PuDtz4qjRiSAmW+TKTBcPoP6hg
 ZxnVWIfv7+AZDjnsMrrMmiM9VTNJtsGrw/qAV4HBZiWPsDJOE2BiTQJKFQ8RWlFE52Z2yQC89Vmd8
 iWM7wBmjQS/m4CesyFDVL+OXLeIwVYbBKcnNMonH+S26IzB1UqrUVY0ONEV0MlXS+kUk=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isZTb-00BhYc-Jj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:48:27 +0000
Received: by mail-il1-f202.google.com with SMTP id o13so19746974ilf.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 13:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ijaPqYX9QMZlgJNEqLIabbahqNoro6V7G/0uSLsc++o=;
 b=WHQxC8Nh4cFd+mKz0Z5y8hCNfaRWaIIItg6rAD4vRRKh08n1rF1ROJp9bdNhKHjJEe
 dB+QzSzQk+37KIA3xLEYSV5jYc4LXnUAkScu6uDLEfQxiLJhWSUqLkSk9o/lj3OGUOFv
 x7d1El6VyYGxobDvLS1U1KrD73lJ1hHS4/+7B8qljX4+5zRjTKVAcKRaD+DQJ+DOSszS
 Quz0IYsmfSMa9Ytm8SlgE4uCUjy38oOsimu9gdN9/5CWb0bp8uDvRUzsZv7KYdIVZQFk
 3LnqAgjGyE/d2ro52ABbHg/HE7dIctRYBIsBeLkMsAqgNdPO0t9LQXQxfHUAMHwqtmvi
 0wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ijaPqYX9QMZlgJNEqLIabbahqNoro6V7G/0uSLsc++o=;
 b=KgefBLysFzO8r+RDUhA7nFGS08mx5sJJiend9KiUbl/S4KdubIOwj41i1w2L+b+O3D
 I7m+ioAVLdT8Znm12lzKQH5T5yQqW7VF7GzfQSaSDsEtaXDMlCh/EE68kgzWowHV08uS
 JLjdSjg3+DKtfLAcuXIOysRhFOLYIbP65FpV36fEcOSV/xuW2MKOxe04I6rEPOGnCHOi
 sb0dk7JSgXXfFDxTqElpkWO9RXrOO6L6DvkBrOBXtajINA4sekswv5biLEuGOUj1jDr6
 6UxohldsFRtQbtX2wRBoABK6XQ9/7sT4Xe1esBbluBecSsWIbcsbN0PnbIBhFnz61Ylu
 4RtA==
X-Gm-Message-State: APjAAAVyllZRSA9hhnwkeTRoz4JqRIazK3qUT6FHN2gmI0J7UCn2ISHt
 eyxP4ozY0+P+xKJuhPv+DUU/msdb+BQ=
X-Google-Smtp-Source: APXvYqzKuQnOCxtPcdxY/PuMxbANDvGzPhycQ/4MRG+yecKcHD6KYxDk5xX57ii8X1oM1NolqUYQnxR+7ug=
X-Received: by 2002:a63:3756:: with SMTP id g22mr47225338pgn.375.1579297379818; 
 Fri, 17 Jan 2020 13:42:59 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:39 -0800
In-Reply-To: <20200117214246.235591-1-drosen@google.com>
Message-Id: <20200117214246.235591-3-drosen@google.com>
Mime-Version: 1.0
References: <20200117214246.235591-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isZTb-00BhYc-Jj
Subject: [f2fs-dev] [PATCH v3 2/9] fscrypt: Don't allow v1 policies with
 casefolding
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Casefolding currently requires a derived key for computing the siphash.
This is available for v2 policies, but not v1, so we disallow it for v1.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/policy.c      | 28 ++++++++++++++++++++++++++++
 fs/inode.c              |  3 ++-
 include/linux/fscrypt.h | 11 +++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f1cff83c151ac..2cd9a940d8f46 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -124,6 +124,12 @@ static bool fscrypt_supported_v1_policy(const struct fscrypt_policy_v1 *policy,
 					policy->filenames_encryption_mode))
 		return false;
 
+	if (IS_CASEFOLDED(inode)) {
+		fscrypt_warn(inode,
+			     "v1 policy does not support casefolded directories");
+		return false;
+	}
+
 	return true;
 }
 
@@ -579,3 +585,25 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	return preload ? fscrypt_get_encryption_info(child): 0;
 }
 EXPORT_SYMBOL(fscrypt_inherit_context);
+
+int fscrypt_ioc_setflags_prepare(struct inode *inode,
+				 unsigned int oldflags,
+				 unsigned int flags)
+{
+	union fscrypt_policy policy;
+	int err;
+
+	/*
+	 * When a directory is encrypted, the CASEFOLD flag can only be turned
+	 * on if the fscrypt policy supports it.
+	 */
+	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
+		err = fscrypt_get_policy(inode, &policy);
+		if (err)
+			return err;
+		if (policy.version != FSCRYPT_POLICY_V2)
+			return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/fs/inode.c b/fs/inode.c
index 96d62d97694ef..8f6267858d0c1 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -20,6 +20,7 @@
 #include <linux/ratelimit.h>
 #include <linux/list_lru.h>
 #include <linux/iversion.h>
+#include <linux/fscrypt.h>
 #include <trace/events/writeback.h>
 #include "internal.h"
 
@@ -2252,7 +2253,7 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	return 0;
+	return fscrypt_ioc_setflags_prepare(inode, oldflags, flags);
 }
 EXPORT_SYMBOL(vfs_ioc_setflags_prepare);
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 1dfbed855beeb..2c292f19c6b94 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -142,6 +142,10 @@ extern int fscrypt_ioctl_get_policy_ex(struct file *, void __user *);
 extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
 extern int fscrypt_inherit_context(struct inode *, struct inode *,
 					void *, bool);
+extern int fscrypt_ioc_setflags_prepare(struct inode *inode,
+					unsigned int oldflags,
+					unsigned int flags);
+
 /* keyring.c */
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
@@ -383,6 +387,13 @@ static inline int fscrypt_inherit_context(struct inode *parent,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_ioc_setflags_prepare(struct inode *inode,
+					       unsigned int oldflags,
+					       unsigned int flags)
+{
+	return 0;
+}
+
 /* keyring.c */
 static inline void fscrypt_sb_free(struct super_block *sb)
 {
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
