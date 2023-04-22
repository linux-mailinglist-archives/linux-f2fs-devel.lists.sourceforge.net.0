Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC86EB60A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Apr 2023 02:03:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pq0it-0004KB-HM;
	Sat, 22 Apr 2023 00:03:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pq0iq-0004K5-Gc
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/QY3Q5AUsGwoQIvTobRrxWyVBRqL+pLZ7lAXnxVniA=; b=i+eRoY4EK5FVbtcJ69urR7/yAb
 YZckAKwuPucD3ixNQRQfHCB7O/QKVJD0XeStBySpUj8hZgzKkObwxDqBiy80sx8Wql1y5NZt82/AQ
 bHEdirrjIzm3Q9k17w9lJCYrIWL2jGMuYc7LO4xAuufC1D08XKtSZHptOyjbcRCpnLDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e/QY3Q5AUsGwoQIvTobRrxWyVBRqL+pLZ7lAXnxVniA=; b=mcGhQSj+La+RPib1/uaGnwvT/A
 fmg8hIIF5fw48Xc2VpJ5k5pYVhn7wNFDygFJF4wNnF1qHE8uS/seDv+QHtinpBWzrY0WkWTaA5fhl
 lO8f3D0A+bqKBPo0n302H+YfuJAD6d7wgs27kpPQ8Ty3TNfiU+QJ39yuL+g23QLoyJjU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pq0io-0008Me-Jw for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:23 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 657AF21A5B;
 Sat, 22 Apr 2023 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682121796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/QY3Q5AUsGwoQIvTobRrxWyVBRqL+pLZ7lAXnxVniA=;
 b=Op+Kfj7XzhSC/JQ5ZdrCSs6iEhM9I/dk6A84frFvXNjAwUT+kJkUlDW66GsQhlRX8sMaGZ
 DiSLat+3a+O6OVs4xj8BLg7i9W9TQ+kO0MM4AoKFLHiNLeKRIgZhSTPG947vw+5rq68n2O
 PkHPzYz4yrfykWsVzei31krRywhEkDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682121796;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/QY3Q5AUsGwoQIvTobRrxWyVBRqL+pLZ7lAXnxVniA=;
 b=rDMOkG17UzGXLEFJ/PefeRg+cEc2AaWZcRH/R1l4/8dZFnlLtDjx4TlwdEt8+i0AvOitBN
 +Da5xomtTMb2O8Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F08E1358E;
 Sat, 22 Apr 2023 00:03:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 34TjBUQkQ2TldwAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 22 Apr 2023 00:03:16 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Date: Fri, 21 Apr 2023 20:03:06 -0400
Message-Id: <20230422000310.1802-4-krisman@suse.de>
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
 Introduce
 a dentry revalidation helper to be used by case-insensitive filesystems to
 check if it is safe to reuse a negative dentry. A negative dentry is safe
 to be reused on a case-insensitive lookup if it was created during a
 case-insensitive
 lookup and this is not a lookup that will instantiate a dentry. If this is
 a creation lo [...] 
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1pq0io-0008Me-Jw
Subject: [f2fs-dev] [PATCH v2 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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

Introduce a dentry revalidation helper to be used by case-insensitive
filesystems to check if it is safe to reuse a negative dentry.

A negative dentry is safe to be reused on a case-insensitive lookup if
it was created during a case-insensitive lookup and this is not a lookup
that will instantiate a dentry. If this is a creation lookup, we also
need to make sure the name matches sensitively the name under lookup in
order to assure the name preserving semantics.

dentry->d_name is only checked by the case-insensitive d_revalidate hook
in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case since, for these cases,
d_revalidate is always called with the parent inode locked, and
therefore the name cannot change from under us.

d_revalidate is only called in 4 places: lookup_dcache, __lookup_slow,
lookup_open and lookup_fast:

  - lookup_dcache always calls it with zeroed flags, with the exception
  of when coming from __lookup_hash, which needs the parent locked
  already, for instance in the open/creation path, which is locked in
  open_last_lookups.

  - In __lookup_slow, either the parent inode is locked by the
  caller (lookup_slow), or it is called with no
  flags (lookup_one/lookup_one_len).

  - lookup_open also requires the parent to be locked in the creation
  case, which is done in open_last_lookups.

  - lookup_fast will indeed be called with the parent unlocked, but it
  shouldn't be called with LOOKUP_CREATE.  Either it is called in the
  link_path_walk, where nd->flags doesn't have LOOKUP_CREATE yet or in
  open_last_lookups. But, in this case, it also never has LOOKUP_CREATE,
  because it is only called on the !O_CREAT case, which means op->intent
  doesn't have LOOKUP_CREAT (set in build_open_flags only if O_CREAT is
  set).

Finally, for the LOOKUP_RENAME_TARGET, we are doing a rename, so the
parents inodes are also be locked.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/libfs.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 4eda519c3002..f8881e29c5d5 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1467,9 +1467,43 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 
+static inline int generic_ci_d_revalidate(struct dentry *dentry,
+					  const struct qstr *name,
+					  unsigned int flags)
+{
+	int is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET);
+
+	if (d_is_negative(dentry)) {
+		const struct dentry *parent = READ_ONCE(dentry->d_parent);
+		const struct inode *dir = READ_ONCE(parent->d_inode);
+
+		if (dir && needs_casefold(dir)) {
+			if (!d_is_casefold_lookup(dentry))
+				return 0;
+
+			if (is_creation) {
+				/*
+				 * dentry->d_name won't change from under us in
+				 * the is_creation path only, since d_revalidate
+				 * during creation and renames is always called
+				 * with the parent inode locked.  This isn't the
+				 * case for all lookup callpaths, so it should
+				 * not be accessed outside
+				 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
+				 */
+				if (dentry->d_name.len != name->len ||
+				    memcmp(dentry->d_name.name, name->name, name->len))
+					return 0;
+			}
+		}
+	}
+	return 1;
+}
+
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
+	.d_revalidate_name = generic_ci_d_revalidate,
 };
 #endif
 
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
