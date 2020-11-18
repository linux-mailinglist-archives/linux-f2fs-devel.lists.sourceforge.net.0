Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D942B7674
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 07:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jOO1cTa3IhTjK8+v+MxjMDhxWIrcDHLHNIo1Oc/fbnI=; b=gUGHz8RJ1hAdH+NHaEgveDCc4
	rA4V+yiDJpvaHIaU6Xl3FW1O5n63/PIJbJRN3ayGOKHKwyCfjzDXWOpQePRHv70vUSLxpyWl5Tcyc
	LILGV0bfQB65hgazSZAeBGQAiKhnOWqiHF0uSaQmZkk/rcI9c6bNUWIUFMKMkKvy6Bzlg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfHBX-0003mH-5V; Wed, 18 Nov 2020 06:43:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3a8K0XwYKAMYp304qzs00sxq.o0y@flex--drosen.bounces.google.com>)
 id 1kfHBV-0003m8-09
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DV09QN89xVJWJy2G2Lk6hdWThRemlVWRM2oh2xdx8V4=; b=A90QTs7Jq1y2YNFmiek4HvCI6
 zSZxGrlhXPgVhMyJ/p+5Z3YrTgFGTyzdp+Pqu3+HIJTmx/d4YivsoZu7tXOv1LZMKnwGn2t2bsxvk
 lhvpK1JCM1ckoHOK83jlHrhGIFEgcOeNVHxWa2CuDTL+urMbEGwVTHA7VHfIhczpmfJbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DV09QN89xVJWJy2G2Lk6hdWThRemlVWRM2oh2xdx8V4=; b=Ab4oYyyXp9prdCIzNu8y7TmvG3
 4hO4dQG8cVvx0mLtksMgABRNZVrAavcvRJEiHicquJ76QzKJBKzbD4x20VvVEE5J6Slu1ybjmlDYW
 gNF38ifZpFVAPpWkz46NXUyaxyz4hzO8z7SqZnuXW3xwU3GiGXAtLFCAuPBlWPs0+Gio=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfHBI-002kab-HL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:43:16 +0000
Received: by mail-yb1-f201.google.com with SMTP id e142so889150ybf.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 22:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=DV09QN89xVJWJy2G2Lk6hdWThRemlVWRM2oh2xdx8V4=;
 b=AVBnh8v1C3R+KGtEy4i7FdueXXEomxX/n+pWlo3sCw+oytZ2q9hGno6HSM7JbvFxwz
 OrHKZbOdvixT/eQizY+YzgeKTv0DIhEkVYYhBPU3pPK8sXsDPixDe+iha7Ydrr+JA+tN
 jI2tRDuaXk0i+4VuBZivUjlwtxNDHwWzZnZKS8JjCW74eyusJOGHWsQZGUkYl8gj14UB
 prKHhzqZWojkco+Wv9VgqltNqWvBEtpjgoKPbVXhiabvoPRQBIoUXyShIYeTyNps9HLV
 PvJYtWLReRl8A2jxvzTvygcUveMwL8qxkzhkUktD1hg5glU9IOR39afCciwVwlD3iqYQ
 A12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DV09QN89xVJWJy2G2Lk6hdWThRemlVWRM2oh2xdx8V4=;
 b=cxw9Xkhdrl6/XpW8dKHDy8okMIT//f7bqNFWYs061fSq1R/anMecRF/oHVKN+gW9ww
 9g+otjqKivNkvmunnWkk+EuMwSOayagZxJOQzv9Ihcxa49fqZATcmaHaUNNAczbzyDkn
 modX0UtdtI6mziVn373nbzYdGrnUW2zUuPBTiS07to9IhAZrM3We9izdNsyNqZb/blXO
 4z7jrjZnf090lP7SP2c+MpvT4lOTh1bzSW9bezt9y/i4nhnrHueP6uDSRQ/yBWh7XKMU
 joferorANGmzp5lH4xP7/BV5VknKgLu2bGqRb8eaHrSGDX1hlO86j4dP7ex1PCCQtjSK
 hANg==
X-Gm-Message-State: AOAM532VWAOT8iELwaJ4gT3zN/8GaRKKnuisKAMnkffNKGwq/LQ7ZQ0b
 G7/4GnUtN93XA3pThiK2k0di+ntGpvQ=
X-Google-Smtp-Source: ABdhPJxOd7e3q7u9BtHqGyF6Mlg3/h4hF+stEzn8jpxyxNb8EuNiIyfWe5DKbwvldnocmuozJqNRYtSR7EM=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:e7cd:: with SMTP id
 e196mr4372701ybh.375.1605681771546; 
 Tue, 17 Nov 2020 22:42:51 -0800 (PST)
Date: Wed, 18 Nov 2020 06:42:43 +0000
In-Reply-To: <20201118064245.265117-1-drosen@google.com>
Message-Id: <20201118064245.265117-2-drosen@google.com>
Mime-Version: 1.0
References: <20201118064245.265117-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kfHBI-002kab-HL
Subject: [f2fs-dev] [PATCH v3 1/3] libfs: Add generic function for setting
 dentry_ops
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a function to set dentry operations at lookup time that will
work for both encrypted filenames and casefolded filenames.

A filesystem that supports both features simultaneously can use this
function during lookup preparations to set up its dentry operations once
fscrypt no longer does that itself.

Currently the casefolding dentry operation are always set if the
filesystem defines an encoding because the features is toggleable on
empty directories. Unlike in the encryption case, the dentry operations
used come from the parent. Since we don't know what set of functions
we'll eventually need, and cannot change them later, we enable the
casefolding operations if the filesystem supports them at all.

By splitting out the various cases, we support as few dentry operations
as we can get away with, maximizing compatibility with overlayfs, which
will not function if a filesystem supports certain dentry_operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 71 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..babef1f7b50e 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,74 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
+#endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations generic_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+/**
+ * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
+ * @dentry:	dentry to set ops on
+ *
+ * Casefolded directories need d_hash and d_compare set, so that the dentries
+ * contained in them are handled case-insensitively.  Note that these operations
+ * are needed on the parent directory rather than on the dentries in it, and
+ * while the casefolding flag can be toggled on and off on an empty directory,
+ * dentry_operations can't be changed later.  As a result, if the filesystem has
+ * casefolding support enabled at all, we have to give all dentries the
+ * casefolding operations even if their inode doesn't have the casefolding flag
+ * currently (and thus the casefolding ops would be no-ops for now).
+ *
+ * Encryption works differently in that the only dentry operation it needs is
+ * d_revalidate, which it only needs on dentries that have the no-key name flag.
+ * The no-key flag can't be set "later", so we don't have to worry about that.
+ *
+ * Finally, to maximize compatibility with overlayfs (which isn't compatible
+ * with certain dentry operations) and to avoid taking an unnecessary
+ * performance hit, we use custom dentry_operations for each possible
+ * combination rather than always installing all operations.
+ */
+void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	bool needs_encrypt_ops = dentry->d_flags & DCACHE_NOKEY_NAME;
+#endif
+#ifdef CONFIG_UNICODE
+	bool needs_ci_ops = dentry->d_sb->s_encoding;
+#endif
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
+	if (needs_encrypt_ops && needs_ci_ops) {
+		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+		return;
+	}
 #endif
+#ifdef CONFIG_FS_ENCRYPTION
+	if (needs_encrypt_ops) {
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (needs_ci_ops) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8667d0cdc71e..11345e66353b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3202,6 +3202,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
 extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 				const char *str, const struct qstr *name);
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.29.2.454.gaff20da3a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
