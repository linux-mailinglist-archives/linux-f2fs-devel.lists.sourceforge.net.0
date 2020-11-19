Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB382B8B76
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Nov 2020 07:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tIC5FJzgrVH8BvFn4xM/3cJE7YRYPziTjw2hfyX1k7k=; b=TtOr2fJcn5SZAdufH/Jw3CSWW
	9DrRVH+YZp9+D+h4NpE1UA+QGnNsoXpzzo6RGuTpdaZLtyp24q7q0HPYI5UMTnwPc8NQFN1T+Fkt3
	TaW6dVThhJRukepi8Zs+CXT0DpqASHHv+CUqtQ6q/drf22718PRWI/pe2hJox8xxy5ozo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfdFW-0005UF-SK; Thu, 19 Nov 2020 06:16:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3BQy2XwYKAPgiwtxjslttlqj.htr@flex--drosen.bounces.google.com>)
 id 1kfdFW-0005U8-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Nov 2020 06:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=; b=Zfbk5wy7Fgi0lPRvyr3Tf6Nku
 kI+ynr4Ey2CEkJhxiMRm+hfDVwRTnsBt9lsu7rNxv8wWfWJy8cD+i9K36mDI8+sBj0jKOpwechkCk
 eD7Y66P94lJgXkezjuwmaAZdoIsC/64p1ECwPO8gqeEOpWZCFqFwJPTWOIASgfm3QWxSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=; b=QFvNujMVX7i/x8kvM9J2JTXVyS
 hED3dbReMCJYoj8S15AJapiaiFHeoPUx2oSAGpXXSDthrJTdm6sMzoyfA/2mbrRgVDRx5Y1SkszGD
 uIBuTOhaIDHuhIH3wZs19oOj78N2XX2D3eY/E1EwcZxkZmXhT11V5HmTJBpXbTzT3VZM=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfdFS-006BaF-0R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Nov 2020 06:16:54 +0000
Received: by mail-pf1-f201.google.com with SMTP id w79so3061751pfc.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Nov 2020 22:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=;
 b=UdP4FsE2zGsI55Kgb/EznglwdoUlp7MKg1jEtYwlhVFENpfj/8/I9ohE9BAL2ok5SW
 7LgqtKDD3wIFaZhPkypkIZridSnJI2/sFOORkqVJhHxiDVFZfQYtobc0z/NeGKeNjp7a
 8Ywz9XEZBJpIHnJQetyCPYSVPN6b4Ue7u6CSNyVzNotQA5MaDINRMdi3n2uijg1PWolD
 7KTinqSAcCMZE+PPmmm4zGpXuTr+BC5rbOh1izgdk3cRqU7hpK0JuOKTt0gS/3RP6t8p
 fNXDYX0i3U/yDTdywJCCUDm6eZHZgOToG1BPc8KI7hooQ3KATbgwTbzLOVBLV1OX6kOg
 LZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=;
 b=PCpJCz277aWfrOdkNQTepcawY57BgflAyR6id2qOCuguaAxDbyvzQCx7CfVgsxFuDd
 DAfx8DuX0fkhCYUb8cLEFeBtpJ+sUPWCGsysuDG+j3kidSrBdAy2u2f96s4bxA/vcBzl
 O8DyL/5tzVmkuxK/IqAYJrBfv0OUmBwtySMcdwtHTfj89SbI6G9QT6aYL4NnHZUe6Co7
 Ov8mnC6HP2NhENfccsz4zpjveHKfB8glc5eK8bpmcH6KFwuaD4TfZmj2V70VEcm2L0w/
 VoI8t0eDaflFeEKgeILHXixrpmeRx3xYmT27rG6D4LVY2AM7sqrA+UcLul9mFzjTMSzH
 Dsww==
X-Gm-Message-State: AOAM530tGWVAMmSL421At+Y1NosMYbPUdBMQGZbTa16h9UlWicwqrTUz
 I1jcd9whBXQMNoTqlE6zva0O5SOXM8w=
X-Google-Smtp-Source: ABdhPJwSZBXfCOhHL8thch2tn2Vt6bs0hCoBOuuaINL7+x5ApwyTNO3KvT5pdGIltwoPqZXkM0FWkysQ8RM=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a0c:a681:: with SMTP id
 t1mr9304343qva.16.1605766149235; 
 Wed, 18 Nov 2020 22:09:09 -0800 (PST)
Date: Thu, 19 Nov 2020 06:09:02 +0000
In-Reply-To: <20201119060904.463807-1-drosen@google.com>
Message-Id: <20201119060904.463807-2-drosen@google.com>
Mime-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kfdFS-006BaF-0R
Subject: [f2fs-dev] [PATCH v4 1/3] libfs: Add generic function for setting
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
Cc: Daniel Rosenberg <drosen@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
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
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/libfs.c         | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 71 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..bac918699022 100644
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
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
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
