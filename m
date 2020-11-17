Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD892B58C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 05:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rd2TebA6A+g+pzEz5UKziaYQ2UilHwqlNsF09tXKq8Y=; b=bjjZ5Ko4JH04R2g1XwHLUeZ52
	1uUoxdhAKgU3rcqEcSCkTDjSv8sFW6lPuZGYpWB3oExGgr0bSN822zWa4LI+1/eG17Cax3YE8YZSI
	nP/JxSXh3RfNHlxbxQG5MNTMkARRUCdXd+tFINuoPzWTZ06YXSgTVpAY+qPqochIDAjD4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kesZJ-0002go-RC; Tue, 17 Nov 2020 04:26:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3iEuzXwYKAO8UifjVeXffXcV.Tfd@flex--drosen.bounces.google.com>)
 id 1kesZH-0002gd-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=; b=afmV0GgmfwQUPQ37aUgnQ07zI
 J/b1D91rrFaVw7KV6gF9Zi2v3lWUk3PAmuPKNiNGDRa5vEhsZCVprL85nwnatEXuWth+kTMhyuRAO
 yXTc4T5D+MWox+GGdoiloz3yPBgxNBfUiUDf0VGHDpWdErZHoqQPRD26OmY5XCbflqTJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=; b=ZXkG1pvhDxt4mCE9/2E71IScIj
 Dhw6rm2zaerqs2xWCnSgG7R44sjXHc1Piz3/tFylntoPZPI399ZkgHqwOk5W3gMQVVABAjw58OQpd
 LnEUjgtNh1h/ZbKjKHRIpG/kG9VY6z9XLMpOXa101g3U1hpHUhB1SssblWAh4XpY9uH0=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kesZF-00Gm0q-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:26:11 +0000
Received: by mail-yb1-f202.google.com with SMTP id u37so23605627ybi.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Nov 2020 20:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=;
 b=shg3+cQ9HKM0nPNtrMQTh+D5eQYXxiRjQHiCYna15DnDwGSI4q6hNF86FmwmCYrJ09
 0uszwptNamjvsfa2d+Ebp170YA7jdMrfds4LdsowSETcYPuptonfbiP7v8hpd4Y0MZkg
 TcH5aai3GlIlPjDRJOutLlBhbMbEKGMg5F5w3kD5/X0fqC2FyU3uSCyFeDu5RIXt/ixa
 9s2Vzm7JxAfAo2lWEtY1zChL12tD9p7+0mwGYHx+TBdw2Ath0P70x0MCBOufxM8RBgRH
 D/gZzY+rDOJ3wmUNZ5lYBs7E1V5A8uxoYtCXmruoFljhdbJ8IaBIehg5VrO1VZ4lsbQk
 6BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=;
 b=hEmdkcuKmRRPvqeUvqEs5pZ/0Mcq1XHgaDyYeBUAWepGou/qz29a2Cw2kT7qsa7Ppg
 3tW6WXhOqtxt8fn49S9sLbiamDUtfqRlVWI2nyXZDuRYXDvTWSZqU9oxsfHrOD+WwwJV
 0F2uZ2j+jAhS/K5VIqHbQWREDxqnDNWfVc/7qB9zh9XAJ9SEHZo7H3PMzRCgNNNKjhem
 P1QbPepBbJECkwzFfiaYs6eCV9TtbvymzjY/oo9kkLpzdBWaKXtM5TDv22ddSWAWPeEk
 glpBQ/XIOFcwJHp5v3z95OfMs3EwLonpzLztyYDu9QQWDrapnjZ5l09B+Sl0LmajM7DI
 VtPg==
X-Gm-Message-State: AOAM530C7LPt1coU5USPva09VUHKxA1EOqn0ne0wgp2Xo8uBIj5WO3Mj
 aBALnR59tfueOJQe79bJywcJWdPzjUo=
X-Google-Smtp-Source: ABdhPJzKALm1EBPTQ18K+cplc9Rj54/XCyTrRJBcCgve7DfHa3FcRADsKoXoWVc+0ELNdGgH6frN1aEubL8=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:88a:: with SMTP id
 132mr26330262ybi.215.1605585800711; 
 Mon, 16 Nov 2020 20:03:20 -0800 (PST)
Date: Tue, 17 Nov 2020 04:03:13 +0000
In-Reply-To: <20201117040315.28548-1-drosen@google.com>
Message-Id: <20201117040315.28548-2-drosen@google.com>
Mime-Version: 1.0
References: <20201117040315.28548-1-drosen@google.com>
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
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kesZF-00Gm0q-Vl
Subject: [f2fs-dev] [PATCH v2 1/3] libfs: Add generic function for setting
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
empty directories. Since we don't know what set of functions we'll
eventually need, and cannot change them later, we add just add them.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 61 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..dd8504f3ff5d 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,64 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
 #endif
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
+ * This function sets the dentry ops for the given dentry to handle both
+ * casefolded and encrypted dentry names.
+ *
+ * Encryption requires d_revalidate to remove nokey names once the key is present.
+ * Casefolding is toggleable on an empty directory. Since we can't change the
+ * operations later on, we just add the casefolding ops if the filesystem defines an
+ * encoding.
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
+			return;
+	}
+#endif
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
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
