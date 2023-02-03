Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35768A3F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 22:01:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO3BJ-0007VO-Pu;
	Fri, 03 Feb 2023 21:01:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pO3BD-0007VD-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpQKRYpxWNfqxnOUxnmAMhcMM61o+m01/yxS25IM//E=; b=Cf0/474B8c09Jf0ZtGfGBB1cIS
 yAdrkaDDCXU/f1OpLNDDvMAh7SUcrsOWUm4Oi5GYszejJ0otma5wONs4+jkahk72LR2JElhCFRgu1
 f2gLAIjDeKR+YO+IPGPouI4JyIKdk+iE1TOXKyTEfOtPibBMGVWRaYAY60oKpxPzi+lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VpQKRYpxWNfqxnOUxnmAMhcMM61o+m01/yxS25IM//E=; b=R27aI7bBflkUPufuKQqNkVpNjd
 bkxL6S9ZHj+uoAjqg8aANiUiLVe1CSoBVNXGOKSIo/c8NrYmca3myR1qUAR30LmUqsr7lyyvSCXsa
 3NFVqjpD0sRZQFpgIETtKsC9keleC9PGC4onm2ItNr8fndoF4WBHeTFz1o6ZWgDE01gM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pO3B8-00ASvn-9P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:07 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 095CB35221;
 Fri,  3 Feb 2023 21:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675458056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpQKRYpxWNfqxnOUxnmAMhcMM61o+m01/yxS25IM//E=;
 b=qzU6sZq3+ncLeGpn1Yyl+tBreVsZXCJD5DDIi8TcHuuqa6mBE6Ab+hRHwZPVsMjTgklGQN
 FFA8rLsCK6CA7kW4Cab4Rgrc2DVExbOOMwn4Zw76Ipi3I+uCpgVicfixhZ2CgN4/Atd9If
 Z2oTpfeHR3wqvJNxdEs+GHszkFm9zmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675458056;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpQKRYpxWNfqxnOUxnmAMhcMM61o+m01/yxS25IM//E=;
 b=g1/Xcs1XoBhIFjs7NnvkjC43OTaJlJDv7mX1Am3OWMGtLI36JHFG44pv9CHVVN2+r199F5
 scQWCIBvrH/5O3DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D1A71358A;
 Fri,  3 Feb 2023 21:00:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R1PVFQd23WPtJgAAMHmgww
 (envelope-from <krisman@suse.de>); Fri, 03 Feb 2023 21:00:55 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, tytso@mit.edu, jaegeuk@kernel.org,
 ebiggers@kernel.org, jack@suse.cz
Date: Fri,  3 Feb 2023 18:00:33 -0300
Message-Id: <20230203210039.16289-2-krisman@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230203210039.16289-1-krisman@suse.de>
References: <20230203210039.16289-1-krisman@suse.de>
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
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pO3B8-00ASvn-9P
Subject: [f2fs-dev] [PATCH v2 1/7] fs: Expose name under lookup to
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
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

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/dcache.c            |  2 +-
 fs/namei.c             | 23 ++++++++++++++---------
 include/linux/dcache.h |  1 +
 3 files changed, 16 insertions(+), 10 deletions(-)

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
index 309ae6fc8c99..525d31cc3b85 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -850,11 +850,16 @@ static bool try_to_unlazy_next(struct nameidata *nd, struct dentry *dentry)
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
 
@@ -1562,7 +1567,7 @@ static struct dentry *lookup_dcache(const struct qstr *name,
 {
 	struct dentry *dentry = d_lookup(dir, name);
 	if (dentry) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error)
 				d_invalidate(dentry);
@@ -1631,19 +1636,19 @@ static struct dentry *lookup_fast(struct nameidata *nd)
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
@@ -1671,7 +1676,7 @@ static struct dentry *__lookup_slow(const struct qstr *name,
 	if (IS_ERR(dentry))
 		return dentry;
 	if (unlikely(!d_in_lookup(dentry))) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error) {
 				d_invalidate(dentry);
@@ -3342,7 +3347,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
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
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
