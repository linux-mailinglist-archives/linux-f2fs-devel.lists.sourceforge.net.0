Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2B274E8B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 03:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Glogy97xh2S+jHvRtF5V+nQtkw2R2KviJL+OYZIbgRU=; b=a7QgaSQpLgXj7hhU8mtIKpXE4
	C0nVqIiBH0W3yWyJqlFXj5m22WcR6ZqGT6oe4gq8mR7VqLevMeFiX2gyK/doii3ooazoqtYanlckI
	NXBA44mW7KKw0MNmuG+xa4LzPM64G3YM4kl7/Q8qwKLlWqmF9qGpGraaBzYMIW/XY2oVk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKtk6-0003ME-HS; Wed, 23 Sep 2020 01:38:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3R6BqXwYKADQTheiUdWeeWbU.Sec@flex--drosen.bounces.google.com>)
 id 1kKtk5-0003M3-BV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=; b=GIyfSu9E6pliL0U+R38X3U6uS
 lZFKjSsLKq9a9rx5JUpjECoJUol4tcq/Op+nS3qx+n+srQpvm10iLComPpNvPGCvKBIwymWI3OVFO
 wmfacEwRyZiQHh9Y1ml99wjnueeNC1GFsReo/ScnYNCJqiONeHR/w/gnI+QGWDTOfdzlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=; b=HIDlB1XBaAXK3z8Wtj2UYrfz8g
 MfMZCtfRMHWqURrL+hx0+80SU0/zLa1Rz6BmRWuAAvXWrLFI10vYmaFV65iwGhZQkMWTEDNE5NzPC
 7TeulKhcM8jLrBRuyW5mM3fTsIrsXtSdA98cquLcEaww8YY1x4aQPWIuoSwZu6SYIz6E=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKtjy-001vGH-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:38:45 +0000
Received: by mail-pl1-f201.google.com with SMTP id r9so306552plo.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Sep 2020 18:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=;
 b=Fw/pQ9kOsMZOp4qcT//rGk0Ty0QnPBIDZAQyCHbGz+EB0pENDjiV0Msb9s3Us7Rqy8
 LW694CF7h2UAEaewdIWmuHdo6GPeQxAY3OMDp4A30swVcAgrTfLA9IKzxZJbhW2PZdV4
 4El+U8pvEnZ2ke/FYErM9S7pWsuw25W9oV0xGx2RW3h0AZQ0QWD/TCHm+TdQsnsVamCU
 HP8rIZr6ZqIXyFSFq6oumaQoSIMxhMCoxpT8dXxHepR7EUpmiSTu9hAWCSGTl1ejKyC7
 Z5ARTwIW+48S7v6wv+Ryn4ULJPl8AS1R4hZUc5xYPa2P7yyEnjnn8uzXiByNpwqIICgl
 lI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=;
 b=d6Vdpjfea4QgvS+UFgimmfezfZCsqCpsQa4MNj6RkTEsYRUbT5qQltC0fU/h9jRPQh
 X0Go3gJOcaCZpxhq0x6wjYkTPZXa+D/JPx28qIkXMbuG8ryEjXuF2WRd7wLhy+AI+xvk
 dxzSvYEj+psSx/DZSn1RRuMSiIYUalgq+Yu4FqT43NmJGP/1UKjV9jkxhk1gRE9MS3O/
 prGpbvD1gXp5pw9zyYZ5wIfMO4m6JsRjpp4L2d2B5SH2OqGhQllkCmHs1q8vBcrVM9aF
 hByiOLBuL2YX9oVFSz2m+V+UnKnwtJ5IMQuMEUuJ/6pK46BD3scA3l16a/+91TmV3LL/
 AGUQ==
X-Gm-Message-State: AOAM532jpYcUXMDGwXJHfwEIOypgDiJPj9rRKqv7E/za4JBVweejH+jD
 fKtqi1ffHfSxJD48A7p1HePCnRI/TJs=
X-Google-Smtp-Source: ABdhPJw5cOhPCfYuz52eXjYlgKJA9wCJZI1O/01lTyF39qWXyCNTFLUsASASM8K3SUHFB6H7JtIckRIlheI=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a62:1451:0:b029:13e:d13d:a058
 with SMTP id
 78-20020a6214510000b029013ed13da058mr6581273pfu.30.1600823367027; Tue, 22 Sep
 2020 18:09:27 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:49 +0000
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
Message-Id: <20200923010151.69506-4-drosen@google.com>
Mime-Version: 1.0
References: <20200923010151.69506-1-drosen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kKtjy-001vGH-Ff
Subject: [f2fs-dev] [PATCH 3/5] libfs: Add generic function for setting
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
work for both encrypted files and casefolded filenames.

A filesystem that supports both features simultaneously can use this
function during lookup preperations to set up its dentry operations once
fscrypt no longer does that itself.

Currently the casefolding dentry operation are always set because the
feature is toggleable on empty directories. Since we don't know what
set of functions we'll eventually need, and cannot change them later,
we add just add them.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..83303858f1fe 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,53 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
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
+ * This function sets the dentry ops for the given dentry to handle both
+ * casefolding and encryption of the dentry name.
+ */
+void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dentry->d_sb->s_encoding) {
+			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+			return;
+		}
 #endif
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dentry->d_sb->s_encoding) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bc5417c61e12..6627896db835 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3277,6 +3277,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
 extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 				const char *str, const struct qstr *name);
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.28.0.681.g6f77f65b4e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
