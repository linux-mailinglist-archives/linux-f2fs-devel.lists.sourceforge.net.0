Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7015765A39
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 19:29:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qP4nV-0005oo-8H;
	Thu, 27 Jul 2023 17:29:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qP4nR-0005oW-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 17:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqbNsJJZFHzrk+OQKgoo/9ZCZoHSnGZs9WOrN7/OQBs=; b=mbrNVOHdko1ck27ZLmtmb03+vv
 hTthuWZF/QzC2nppHzm9X6qUGS2qsCI7CoX0xUD0mwenef4jbQZQh1f2nHyaTKRJ95U9CN35Kopim
 3BAHBAFOruDNzVKIjZncPcrpr7gAybNdIjeJ7gBLYTd/E99LZY2X6+Ds1JWMM7rM17zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BqbNsJJZFHzrk+OQKgoo/9ZCZoHSnGZs9WOrN7/OQBs=; b=EhOM4qELNvkkNzhEQhTS7NTyIU
 8+YLGsrE/fcf+rn5t8c7z+kb8cZAt6YPeQWwijBs7z7DM4QP3CBFf2amly3TF2pXORtzSK9cFnwkO
 mXsDiVteBRafU8pAcjSF8KEiFTdfJz7jmY7ThOdeqyUjtDZBjlFd2aDNJsn05Nc3bPDQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qP4nN-004oJl-7l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 17:29:06 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B57071F86C;
 Thu, 27 Jul 2023 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690478929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqbNsJJZFHzrk+OQKgoo/9ZCZoHSnGZs9WOrN7/OQBs=;
 b=qWJMgk24wtL4cuESRJUmpHiVZx3R/9cGgqsI04Ez3xnjo9i/2a/yEI4pP4psa6A8unuxq6
 JnR3dbnpFqHykXgxbynNTX8l98Mb72h50WHIRqKkC+21sk/sbhrqU4qAJGxoG5+xKWtqLx
 RvRRLvrf+EvlI+mNsrchOcZC4o4rs5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690478929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqbNsJJZFHzrk+OQKgoo/9ZCZoHSnGZs9WOrN7/OQBs=;
 b=q56UlAiFQz+VZs8fPWPx7jOqq18uowdExLZQ6nTS0bBTeiIAElNooRozva/49B5Yevb7Fj
 xsX+0+OAUm+MNVBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7142413902;
 Thu, 27 Jul 2023 17:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ASjuFVGpwmS9aAAAMHmgww
 (envelope-from <krisman@suse.de>); Thu, 27 Jul 2023 17:28:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Thu, 27 Jul 2023 13:28:37 -0400
Message-ID: <20230727172843.20542-2-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727172843.20542-1-krisman@suse.de>
References: <20230727172843.20542-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com>
 Negative
 dentries support on case-insensitive ext4/f2fs will require access to the
 name under lookup to ensure it matches the dentry. This adds an optional
 new flavor of cached dentry revalidation hoo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qP4nN-004oJl-7l
Subject: [f2fs-dev] [PATCH v4 1/7] fs: Expose name under lookup to
 d_revalidate hook
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Negative dentries support on case-insensitive ext4/f2fs will require
access to the name under lookup to ensure it matches the dentry.  This
adds an optional new flavor of cached dentry revalidation hook to expose
this extra parameter.

I'm fine with extending d_revalidate instead of adding a new hook, if
it is considered cleaner and the approach is accepted.  I wrote a new
hook to simplify reviewing.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v2:
  - Document d_revalidate_name hook. (Eric)
---
 Documentation/filesystems/locking.rst |  3 +++
 Documentation/filesystems/vfs.rst     | 12 ++++++++++++
 fs/dcache.c                           |  2 +-
 fs/namei.c                            | 23 ++++++++++++++---------
 include/linux/dcache.h                |  1 +
 5 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index ed148919e11a..d68997ba6584 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -18,6 +18,8 @@ dentry_operations
 prototypes::
 
 	int (*d_revalidate)(struct dentry *, unsigned int);
+	int (*d_revalidate_name)(struct dentry *, const struct qstr *,
+				 unsigned int);
 	int (*d_weak_revalidate)(struct dentry *, unsigned int);
 	int (*d_hash)(const struct dentry *, struct qstr *);
 	int (*d_compare)(const struct dentry *,
@@ -37,6 +39,7 @@ locking rules:
 ops		   rename_lock	->d_lock	may block	rcu-walk
 ================== ===========	========	==============	========
 d_revalidate:	   no		no		yes (ref-walk)	maybe
+d_revalidate_name: no		no		yes (ref-walk)	maybe
 d_weak_revalidate: no		no		yes	 	no
 d_hash		   no		no		no		maybe
 d_compare:	   yes		no		no		maybe
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index cb2a97e49872..34c842bd7cb2 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1252,6 +1252,8 @@ defined:
 
 	struct dentry_operations {
 		int (*d_revalidate)(struct dentry *, unsigned int);
+		int (*d_revalidate_name)(struct dentry *, const struct qstr *,
+					 unsigned int);
 		int (*d_weak_revalidate)(struct dentry *, unsigned int);
 		int (*d_hash)(const struct dentry *, struct qstr *);
 		int (*d_compare)(const struct dentry *,
@@ -1288,6 +1290,16 @@ defined:
 	return
 	-ECHILD and it will be called again in ref-walk mode.
 
+``d_revalidate_name``
+	Variant of d_revalidate that also provides the name under look-up.  Most
+	filesystems will keep it as NULL, unless there are particular semantics
+	for filenames encoding that need to be handled during dentry
+	revalidation.
+
+	When available, it is called in lieu of d_revalidate and has the same
+	locking rules and return semantics.  Refer to d_revalidate for more
+	information.
+
 ``d_weak_revalidate``
 	called when the VFS needs to revalidate a "jumped" dentry.  This
 	is called when a path-walk ends at dentry that was not acquired
diff --git a/fs/dcache.c b/fs/dcache.c
index 52e6d5fdab6b..98521862e58a 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1928,7 +1928,7 @@ void d_set_d_op(struct dentry *dentry, const struct dentry_operations *op)
 		dentry->d_flags |= DCACHE_OP_HASH;
 	if (op->d_compare)
 		dentry->d_flags |= DCACHE_OP_COMPARE;
-	if (op->d_revalidate)
+	if (op->d_revalidate || op->d_revalidate_name)
 		dentry->d_flags |= DCACHE_OP_REVALIDATE;
 	if (op->d_weak_revalidate)
 		dentry->d_flags |= DCACHE_OP_WEAK_REVALIDATE;
diff --git a/fs/namei.c b/fs/namei.c
index e56ff39a79bc..84df0ddd20db 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -853,11 +853,16 @@ static bool try_to_unlazy_next(struct nameidata *nd, struct dentry *dentry)
 	return false;
 }
 
-static inline int d_revalidate(struct dentry *dentry, unsigned int flags)
+static inline int d_revalidate(struct dentry *dentry,
+			       const struct qstr *name,
+			       unsigned int flags)
 {
-	if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE))
+
+	if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE)) {
+		if (dentry->d_op->d_revalidate_name)
+			return dentry->d_op->d_revalidate_name(dentry, name, flags);
 		return dentry->d_op->d_revalidate(dentry, flags);
-	else
+	} else
 		return 1;
 }
 
@@ -1565,7 +1570,7 @@ static struct dentry *lookup_dcache(const struct qstr *name,
 {
 	struct dentry *dentry = d_lookup(dir, name);
 	if (dentry) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error)
 				d_invalidate(dentry);
@@ -1636,19 +1641,19 @@ static struct dentry *lookup_fast(struct nameidata *nd)
 		if (read_seqcount_retry(&parent->d_seq, nd->seq))
 			return ERR_PTR(-ECHILD);
 
-		status = d_revalidate(dentry, nd->flags);
+		status = d_revalidate(dentry, &nd->last, nd->flags);
 		if (likely(status > 0))
 			return dentry;
 		if (!try_to_unlazy_next(nd, dentry))
 			return ERR_PTR(-ECHILD);
 		if (status == -ECHILD)
 			/* we'd been told to redo it in non-rcu mode */
-			status = d_revalidate(dentry, nd->flags);
+			status = d_revalidate(dentry, &nd->last, nd->flags);
 	} else {
 		dentry = __d_lookup(parent, &nd->last);
 		if (unlikely(!dentry))
 			return NULL;
-		status = d_revalidate(dentry, nd->flags);
+		status = d_revalidate(dentry, &nd->last, nd->flags);
 	}
 	if (unlikely(status <= 0)) {
 		if (!status)
@@ -1676,7 +1681,7 @@ static struct dentry *__lookup_slow(const struct qstr *name,
 	if (IS_ERR(dentry))
 		return dentry;
 	if (unlikely(!d_in_lookup(dentry))) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error) {
 				d_invalidate(dentry);
@@ -3421,7 +3426,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 		if (d_in_lookup(dentry))
 			break;
 
-		error = d_revalidate(dentry, nd->flags);
+		error = d_revalidate(dentry, &nd->last, nd->flags);
 		if (likely(error > 0))
 			break;
 		if (error)
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 6b351e009f59..b6188f2e8950 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -127,6 +127,7 @@ enum dentry_d_lock_class
 
 struct dentry_operations {
 	int (*d_revalidate)(struct dentry *, unsigned int);
+	int (*d_revalidate_name)(struct dentry *, const struct qstr *, unsigned int);
 	int (*d_weak_revalidate)(struct dentry *, unsigned int);
 	int (*d_hash)(const struct dentry *, struct qstr *);
 	int (*d_compare)(const struct dentry *,
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
