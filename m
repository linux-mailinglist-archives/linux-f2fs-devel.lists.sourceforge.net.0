Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829A77D997
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 07:08:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW8lg-0007m3-Eg;
	Wed, 16 Aug 2023 05:08:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qW8lf-0007ls-4k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7BnRrZj/BGeCpY2Eau7Peq32o7FSQuNiLArj6jqWIo=; b=l1jxzht3n9VjTMVlI+C2SIMWV/
 uWsldOf+aKVppEgxRh1mvH41tzXNcxaedSylw32LdZwXxZTQP7lVLkrTEzamfge+id8KJh7qpmZf0
 fvu/2g5e5ps53TnHJHGmABjcmK9cKF1sQngdDBQTGX4BbGsEn6W1LIBzr0gp264hKXOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7BnRrZj/BGeCpY2Eau7Peq32o7FSQuNiLArj6jqWIo=; b=CQvua0JGEgRopEZ4gzF/MH/oH+
 wLVRNRpf5SDNRhDb1PSFX/Zk962pUUUjx6lRAkvmFO9W7BGuBB1EOnvBpddgvp9LE35cG8DgzAwwR
 /vmZkDgffVQ2WIRGr6Y/n6q71rtCXwtNgEjtI51071/ZACZDrD+10Rjb68YWxh1zrnNE=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW8la-006njO-2b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:26 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1C1F1F85D;
 Wed, 16 Aug 2023 05:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692162495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7BnRrZj/BGeCpY2Eau7Peq32o7FSQuNiLArj6jqWIo=;
 b=q+nIByajPNGdCgxwjTHcLgAcAAE3vo30+GSTTYImLwz+LrBlsadIBIdtJJzpGVjC8TX+nl
 UgdLS9nV2sQ94Mk1eqJ15RlrylbuwzmbdIwsX18ke7XNSgO5U70hWHCLUBzm8HNE9d5LQL
 wKCyWapwZWLv+WHv+QLulCV8clwKKUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692162495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7BnRrZj/BGeCpY2Eau7Peq32o7FSQuNiLArj6jqWIo=;
 b=FX/3mY0BqMtV9jaM2LR1JG0RlWYXG2jiexMxBdbGEsHVgQxelSZGCBNPbBTH2wWdzy6poC
 +2WHUIrDFrUZj6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D139133F2;
 Wed, 16 Aug 2023 05:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4A70IL9Z3GTwTgAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 16 Aug 2023 05:08:15 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Wed, 16 Aug 2023 01:07:59 -0400
Message-ID: <20230816050803.15660-6-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816050803.15660-1-krisman@suse.de>
References: <20230816050803.15660-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com>
 Introduce
 a dentry revalidation helper to check the negative dentries of
 case-insensitive
 filesystems. This helper is based on the fact that a negative dentry might
 safe to be reused on a casefolded d [...] 
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qW8la-006njO-2b
Subject: [f2fs-dev] [PATCH v6 5/9] libfs: Validate negative dentries in
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Introduce a dentry revalidation helper to check the negative dentries of
case-insensitive filesystems.  This helper is based on the fact that a
negative dentry might safe to be reused on a casefolded directory if it
was created during a case-insensitive lookup, because that kind of
lookup verifies not only the exact name doesn't exist in a directory,
but also that *any* case-equivalent name also doesn't exist.  The sole
exception is during file creation, in which case we also need to make
sure the name matches case-sensitively, in order to assure the disk
name-preserving semantics.

We cover most creations by checking LOOKUP_CREATE|LOOKUP_RENAME_TARGET
flags.  But, while most creations use those flags, there are filesystem
helpers that call lookup for creation with flags==0.  Since we can't
know whether those are for creation, just reject the negative dentries
if there are no flags to check.

Note that we avoid taking the ->d_lock while accessing ->d_name, because
it isn't really necessary for the LOOKUP_CREATE/LOOKUP_RENAME_TARGET
case. That is because in every creation path with these flags, we know
the parent inode lock is acquired, at least for reading, thus
stabilizing the d_name, since it prevents the dentry from being
instantiated and negative dentries cannot be moved.

See also the comment in the code.

* Discussion on the ->d_name stability

d_revalidate can only be reached from 4 code paths: lookup_dcache,
__lookup_slow, lookup_open and lookup_fast:

  - lookup_dcache only reaches d_revalidate with creation flags when
  coming from __lookup_hash, which needs the parent locked already.

  - In __lookup_slow, either the parent inode is read-locked by the
  caller (lookup_slow), or it is called with no flags (lookup_one*).  A
  read lock suffices to prevent concurrent ->d_name modifications, with
  the exception of a modification inside __d_unalias, which is not a
  problem because negative dentries are not allowed to be moved with
  __d_move.  In addition, d_instantiate shouldn't race with this case
  because its callers also acquire the parent inode lock, preventing it
  from racing with lookup creation.

  - lookup_open also requires the parent to be locked in the creation
  case, which is done in open_last_lookups.

  - lookup_fast will indeed be called with the parent unlocked, but it
  shouldn never be called with LOOKUP_CREATE.  Either it is called in the
  link_path_walk, where nd->flags doesn't have LOOKUP_CREATE yet or in
  open_last_lookups. But, in this case, it also never has LOOKUP_CREATE,
  because it is only called on the !O_CREAT case, which means op->intent
  doesn't have LOOKUP_CREAT (set in build_open_flags only if O_CREAT is
  set).

In addition, for the LOOKUP_RENAME_TARGET, we are doing a rename, so the
parents inodes are also locked.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v5:
  - Use IS_CASEFOLDED directly (Eric)
  - Reword commit message and comment in the code (Eric)
Changes since v4:
  - Drop useless inline declaration (eric)
  - Refactor to drop extra identation (Christian)
  - Discuss d_instantiate
Changes since v3:
  - Add comment regarding creation (Eric)
  - Reorder checks to clarify !flags meaning (Eric)
  - Add commit message explanaton of the inode read lock wrt.
    __d_move. (Eric)
Changes since v2:
  - Add comments to all rejection cases (Eric)
  - safeguard against filesystem creating dentries without LOOKUP flags
---
 fs/libfs.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 5b851315eeed..26bf1b832b0a 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1462,9 +1462,63 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 
+static int generic_ci_d_revalidate(struct dentry *dentry,
+				   const struct qstr *name,
+				   unsigned int flags)
+{
+	const struct dentry *parent;
+	const struct inode *dir;
+
+	if (!d_is_negative(dentry))
+		return 1;
+
+	parent = READ_ONCE(dentry->d_parent);
+	dir = READ_ONCE(parent->d_inode);
+
+	if (!dir || !IS_CASEFOLDED(dir))
+		return 1;
+
+	/*
+	 * Negative dentries created prior to turning the directory
+	 * case-insensitive cannot be trusted, since they don't ensure
+	 * any possible case version of the filename doesn't exist.
+	 */
+	if (!d_is_casefolded_name(dentry))
+		return 0;
+
+	/*
+	 * If the lookup is for creation, then a negative dentry can only be
+	 * reused if it's a case-sensitive match, not just a case-insensitive
+	 * one.  This is needed to make the new file be created with the name
+	 * the user specified, preserving case.
+	 *
+	 * LOOKUP_CREATE or LOOKUP_RENAME_TARGET cover most creations.  In these
+	 * cases, ->d_name is stable and can be compared to 'name' without
+	 * taking ->d_lock because the caller must hold dir->i_rwsem.  (This
+	 * is because the directory lock blocks the dentry from being
+	 * concurrently instantiated, and negative dentries are never moved.)
+	 *
+	 * All other creations actually use flags==0.  These come from the edge
+	 * case of filesystems calling functions like lookup_one() that do a
+	 * lookup without setting the lookup flags at all.  Such lookups might
+	 * or might not be for creation, and if not don't guarantee stable
+	 * ->d_name.  Therefore, invalidate all negative dentries when flags==0.
+	 */
+	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
+		if (dentry->d_name.len != name->len ||
+		    memcmp(dentry->d_name.name, name->name, name->len))
+			return 0;
+	} else if (!flags) {
+		return 0;
+	}
+
+	return 1;
+}
+
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
+	.d_revalidate = generic_ci_d_revalidate,
 };
 #endif
 
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
