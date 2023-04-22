Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB236EB609
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Apr 2023 02:03:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pq0ip-0002wY-Dy;
	Sat, 22 Apr 2023 00:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pq0io-0002wR-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eLvepXqSRXsyE3mWMmE1Y9JVeXuOXTV/+dKh66R1Vw0=; b=WOe/opIpXQuvg59qsJbL52XOQW
 dfdGzdD9U7iU2M0KYSrF0+ujuZGpuhft1hj3rFEz+C1fSSVxhXRdcXcpgMzru5JMGicGoZLJWo8zL
 m99AtcURWywwjwF26ElZQpvF9mk/4gDAypNevVoUcTUxMgWoBvbwrWJchMSRAo4Puxps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eLvepXqSRXsyE3mWMmE1Y9JVeXuOXTV/+dKh66R1Vw0=; b=T8BQr9poFY2BB8CUFoa+S/IZzl
 FGMFYNeWC1BaQIfOYBFx5VSpO43dCZhdZ0Cst6UBsjny9sCuXM7H4iG2kZdugxoLfmEZlL9DU4Hyz
 ddDuoxWOOw7aQB4yi+pEDbgvO4E7WjV74mbkhffEAl9p0nlKcw/lKqOodgfhs5v08ENY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pq0im-0008MW-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 458B721A38;
 Sat, 22 Apr 2023 00:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682121793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLvepXqSRXsyE3mWMmE1Y9JVeXuOXTV/+dKh66R1Vw0=;
 b=oMysZ2sFmKN9f8tRv34NFx0uuPlCmXxyx7fEV+p2UF0fmAx95qFiDzRn0YYeLkmQUwAx1d
 k4wqjg3oBYzicwXxtZmBgFKBas3wqziep/AKDUN/fo0O7eniaEvruJf6gtEc5XdxziKPwY
 ivU/0Z886Yrrh6eTnVcU/XQfyQIhvdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682121793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLvepXqSRXsyE3mWMmE1Y9JVeXuOXTV/+dKh66R1Vw0=;
 b=SPgi4G8MN9xiXZMMvxqau5oDnXBFp/hJpjK2GqqwTUcgnpPivo94tzNOsL26RZ+XZ+zwAJ
 30pafMh5Xh/elUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F810138F2;
 Sat, 22 Apr 2023 00:03:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8sbaOUAkQ2TadwAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 22 Apr 2023 00:03:12 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Date: Fri, 21 Apr 2023 20:03:04 -0400
Message-Id: <20230422000310.1802-2-krisman@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422000310.1802-1-krisman@suse.de>
References: <20230422000310.1802-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pq0im-0008MW-Dd
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
Cc: krisman@suse.de, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
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
index edfedfbccaef..c1557b69c45e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -851,11 +851,16 @@ static bool try_to_unlazy_next(struct nameidata *nd, struct dentry *dentry)
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
 
@@ -1563,7 +1568,7 @@ static struct dentry *lookup_dcache(const struct qstr *name,
 {
 	struct dentry *dentry = d_lookup(dir, name);
 	if (dentry) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error)
 				d_invalidate(dentry);
@@ -1632,19 +1637,19 @@ static struct dentry *lookup_fast(struct nameidata *nd)
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
@@ -1672,7 +1677,7 @@ static struct dentry *__lookup_slow(const struct qstr *name,
 	if (IS_ERR(dentry))
 		return dentry;
 	if (unlikely(!d_in_lookup(dentry))) {
-		int error = d_revalidate(dentry, flags);
+		int error = d_revalidate(dentry, name, flags);
 		if (unlikely(error <= 0)) {
 			if (!error) {
 				d_invalidate(dentry);
@@ -3345,7 +3350,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
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
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
