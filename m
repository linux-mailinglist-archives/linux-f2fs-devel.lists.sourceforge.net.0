Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99210F76C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mxon73Cd+prmpskVSoEJT5A2WyqZaO5FNU5WbtXoVZE=; b=PjaRxE7igdkAN5TvodLQpXI8R
	kAeuh8b9W6YAX4uHCiQvEN27BMW4swDs4aPIEouIbuX5l5NjAMKSuxO5CZE9ffgdcMCmH1eDxzKe0
	Za5QLBEbxpTpIA8gR+A93FGVg0kZVuaeI1QFjGJh7F5ev71bFqfgEa/yqxiCwgJulEKOE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0u1-0001Ho-EN; Tue, 03 Dec 2019 05:39:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3eu7lXQYKAOMIWTXJSLTTLQJ.HTR@flex--drosen.bounces.google.com>)
 id 1ic0u0-0001Hc-EY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zioOGuJqnVPXe7Qe2SnSM0LE+ZxE0SKC1ZdBPwMzHHM=; b=LdJi4Yz7zPrcPcHcI0dum4MWF
 HrMPjcKn0mMMTKF4Rg3kp8WxTGSPTqm8cwn+PctJNeAv1m1KqBdtJzv3v9dYeouPRmns/G1RPWn9i
 rrIrjHrUDjmQc0rByHWOlk0DGh3i5XboWbBfmCcP0/bYwB88rWyoha6tRuWR96O2PgZNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zioOGuJqnVPXe7Qe2SnSM0LE+ZxE0SKC1ZdBPwMzHHM=; b=SNsdRSpcYuQck41MfPEyxkOKZY
 D75piUOSHN7TgHkgbzqtDL4ogKRKvmfstN7FHo3jEjx98lDnOq6jE37a1QnBhdoxYrxVWlJdRpB5/
 RjqivuzNJU2NxtWN24IQ4ZylzK0YG5XUJAuwyjvP64FrzfTOIYvNAPi5fmNl8fzkPZSU=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0tz-001gXN-6P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:39:12 +0000
Received: by mail-pl1-f202.google.com with SMTP id be1so1181198plb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zioOGuJqnVPXe7Qe2SnSM0LE+ZxE0SKC1ZdBPwMzHHM=;
 b=Vi7RSXxGowYOEm1R7PqAvvobd49Ow6l4LUuP+EyQ8x3TZm7tmSuo7w72xlUfos80tZ
 E/5xpFoQ2wLEqy3sJx6GTasTyPD8TUZAvrKp4r5T0yV1jwHmX+TJe1LWpY208PzxANGu
 ut5I1Zdm3X6yUrK3XUXnrofTbSEcTJfH5v7UnTEBqOPCK7VLMb4+XLPA7r9Qjv9XMHVe
 bWves33Lu3GThFsqT1xtk/MGO/+WzHg4eXBqx/6CVZSf9UYCyUHFwBkAdhuz0Y7U38+n
 Z0AY+6+IDGq3SiysmR0NHMCVZsgVSj58gcf1kCj0taMnx+Y5pxB4I/Abvbm2KLXatHqP
 Kz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zioOGuJqnVPXe7Qe2SnSM0LE+ZxE0SKC1ZdBPwMzHHM=;
 b=Ux8oU+7V2U3TOq7FTZSmk48DrUKwpfFlilov25NXyC2nSyOFnIS751S0QW+NWlYKo9
 LwtnKJnS2ivXQ1B+AfTV16YZPY14XsxR8aFXeq6AfhEgXjYgff71VjYJxLDfUnFKCcsz
 5YHx9wXqoEugJb3eHrX19O4KBk2n2l039033GDIUHQM7iw9AkcfKaY9RYSOalRnOZs/o
 3jkF1hIVhByqOSOPp7JXXCXDDiLhbX/78F8Iy8wdj0SverGSMhVlE2HNxs8/QXXSjMc+
 OMXE/EriJRc2GT6xy7BIt3GXhc1F3CgSgx61NgoVsE7fd1UcJoS5atg9LEtViJQLnzeb
 8dHg==
X-Gm-Message-State: APjAAAX/kuQf/koHd1FQ0q+K2YwVdwQ1SbzYsXjyxHzF2F8/pbqDuT/9
 8C4BKYpWGj9hynteQ0LtQo6JCoAujyA=
X-Google-Smtp-Source: APXvYqwLhVT0aPs7pDtnMOWvm8ceiekoDOnf+r3AdcXHnYtS4fRpDhrmnGvkSNzLuI9YnCQKTgC4a5Cp4Jk=
X-Received: by 2002:a63:6507:: with SMTP id z7mr3034832pgb.322.1575349882981; 
 Mon, 02 Dec 2019 21:11:22 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:43 -0800
In-Reply-To: <20191203051049.44573-1-drosen@google.com>
Message-Id: <20191203051049.44573-3-drosen@google.com>
Mime-Version: 1.0
References: <20191203051049.44573-1-drosen@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic0tz-001gXN-6P
Subject: [f2fs-dev] [PATCH 2/8] fscrypt: Don't allow v1 policies with
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

Casefolding requires a derived key for computing the siphash.
This is available for v2 policies, but not v1, so we disallow it for v1.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/policy.c      | 26 +++++++++++++++++++++++---
 fs/inode.c              |  8 ++++++++
 include/linux/fscrypt.h |  7 +++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 96f528071bed..94d96d3212d6 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -67,9 +67,9 @@ static bool supported_iv_ino_lblk_64_policy(
  * fscrypt_supported_policy - check whether an encryption policy is supported
  *
  * Given an encryption policy, check whether all its encryption modes and other
- * settings are supported by this kernel.  (But we don't currently don't check
- * for crypto API support here, so attempting to use an algorithm not configured
- * into the crypto API will still fail later.)
+ * settings are supported by this kernel on the given inode.  (But we don't
+ * currently don't check for crypto API support here, so attempting to use an
+ * algorithm not configured into the crypto API will still fail later.)
  *
  * Return: %true if supported, else %false
  */
@@ -97,6 +97,12 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 			return false;
 		}
 
+		if (IS_CASEFOLDED(inode)) {
+			fscrypt_warn(inode,
+				     "v1 policy does not support casefolded directories");
+			return false;
+		}
+
 		return true;
 	}
 	case FSCRYPT_POLICY_V2: {
@@ -530,3 +536,17 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	return preload ? fscrypt_get_encryption_info(child): 0;
 }
 EXPORT_SYMBOL(fscrypt_inherit_context);
+
+int fscrypt_set_casefolding_allowed(struct inode *inode)
+{
+	union fscrypt_policy policy;
+	int ret = fscrypt_get_policy(inode, &policy);
+
+	if (ret < 0)
+		return ret;
+
+	if (policy.version == FSCRYPT_POLICY_V2)
+		return 0;
+	else
+		return -EINVAL;
+}
diff --git a/fs/inode.c b/fs/inode.c
index fef457a42882..b615ec272a1e 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -20,6 +20,7 @@
 #include <linux/ratelimit.h>
 #include <linux/list_lru.h>
 #include <linux/iversion.h>
+#include <linux/fscrypt.h>
 #include <trace/events/writeback.h>
 #include "internal.h"
 
@@ -2245,6 +2246,13 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
+	/*
+	 * When a directory is encrypted, the CASEFOLD flag can only be turned
+	 * on if the fscrypt policy supports it.
+	 */
+	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL))
+		return fscrypt_set_casefolding_allowed(inode);
+
 	return 0;
 }
 EXPORT_SYMBOL(vfs_ioc_setflags_prepare);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e13ff68a99f0..028aed925e51 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -127,6 +127,8 @@ extern int fscrypt_ioctl_get_policy_ex(struct file *, void __user *);
 extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
 extern int fscrypt_inherit_context(struct inode *, struct inode *,
 					void *, bool);
+extern int fscrypt_set_casefolding_allowed(struct inode *inode);
+
 /* keyring.c */
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
@@ -361,6 +363,11 @@ static inline int fscrypt_inherit_context(struct inode *parent,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_set_casefolding_allowed(struct inode *inode)
+{
+	return 0;
+}
+
 /* keyring.c */
 static inline void fscrypt_sb_free(struct super_block *sb)
 {
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
