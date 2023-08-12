Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDD779C09
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 02:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUchu-0007ZV-TC;
	Sat, 12 Aug 2023 00:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qUcht-0007Z7-1D
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rboAhxFh4vXaAaxXhYnXEsNgIGq+WuMjEQjmzuhhcBA=; b=CzwXA2GpirGcQflGlmORGcWJHM
 r9IsEengeoP5v9u5YgHjb89+79MIPTvqpBSRQ/bcOClNASyFDsGR0owzomFgSogA8lLIWwlM3LJpv
 UBi5ziI8nDZ6NUZfwZw0/KGT8hbnTlTibqxcL2owTgvL1Mhn05P6izfexui9cer2AwCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rboAhxFh4vXaAaxXhYnXEsNgIGq+WuMjEQjmzuhhcBA=; b=M+jL2GhzpaBeFtuGCBSCIuMyw/
 nwSjqhouG1H/oCiQA6qZcyszHBJpBMCzRfuGP5vqnKOn03CJ8d2xq4yDysTho0wJtKVMBPYvBku5w
 rS8nUt5/67zUfCyVijGMYi+j9svkWm0dJKa9WKK0QLlaTEoPnZq9VafSNO5pBiO7ar14=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUchn-002xto-5C for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2026B1F45A;
 Sat, 12 Aug 2023 00:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691800924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rboAhxFh4vXaAaxXhYnXEsNgIGq+WuMjEQjmzuhhcBA=;
 b=yPHW/KW99FkobstIfyZ/sDxFi5xpqOFvAkfJ31DfjY7MVOYoI6+eJ+lmeJtNdWd1Ce9I7r
 1IquXEvycPUfOm3fUuBkInbFRkqUKFmaYS9AF2JyC7ozZk0EYGCmggZFJvwVKPtvP+HhWq
 uMmbV7Onl6KA0SGk986x6avE9/tluqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691800924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rboAhxFh4vXaAaxXhYnXEsNgIGq+WuMjEQjmzuhhcBA=;
 b=LCXLd7R33X9KhxaoePEQheYn/UMXFwBikpRSIXAVpuCAeBdnhjmbpXwoyxCFwYaezWPpyh
 0X9c6s8oIRWvKaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCE7B13592;
 Sat, 12 Aug 2023 00:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7DxOMFvV1mQlEAAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 12 Aug 2023 00:42:03 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Fri, 11 Aug 2023 20:41:42 -0400
Message-ID: <20230812004146.30980-7-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812004146.30980-1-krisman@suse.de>
References: <20230812004146.30980-1-krisman@suse.de>
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
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qUchn-002xto-5C
Subject: [f2fs-dev] [PATCH v5 06/10] libfs: Validate negative dentries in
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

Introduce a dentry revalidation helper to be used by case-insensitive
filesystems to check if it is safe to reuse a negative dentry.

A negative dentry is safe to be reused on a case-insensitive lookup if
it was created during a case-insensitive lookup and this is not a lookup
that will instantiate a dentry. If this is a creation lookup, we also
need to make sure the name matches sensitively the name under lookup in
order to assure the name preserving semantics.

dentry->d_name is only checked by the case-insensitive d_revalidate hook
in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case since, for these cases,
d_revalidate is always called with the parent inode at least
read-locked, and therefore the name cannot change from under us.

d_revalidate is only called in 4 places: lookup_dcache, __lookup_slow,
lookup_open and lookup_fast:

  - lookup_dcache always calls it with zeroed flags, with the exception
    of when coming from __lookup_hash, which needs the parent locked
    already, for instance in the open/creation path, which is locked in
    open_last_lookups.

  - In __lookup_slow, either the parent inode is read-locked by the
    caller (lookup_slow), or it is called with no flags (lookup_one*).
    The read lock suffices to prevent ->d_name modifications, with the
    exception of one case: __d_unalias, will call __d_move to fix a
    directory accessible from multiple dentries, which effectively swaps
    ->d_name while holding only the shared read lock.  This happens
    through this flow:

    lookup_slow()  //LOOKUP_CREATE
      d_lookup()
        ->d_lookup()
          d_splice_alias()
            __d_unalias()
              __d_move()

    Nevertheless, this case is not a problem because negative dentries
    are not allowed to be moved with __d_move.  In addition,
    d_instantiate shouldn't race with this case because it's callers
    also acquire the parent inode lock, preventing it from racing with
    lookup creation, so the dentry cannot become positive and be moved
    while inside d_revalidate, which would be a problem if a parallel
    lookup did d_splice_alias.

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
parents inodes are also locked.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
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
 fs/libfs.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 8d0b64cfd5da..cb98c4721327 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1452,9 +1452,66 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
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
+	if (!dir || !dir_is_casefolded(dir))
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
+	 * Filesystems will call into d_revalidate without setting
+	 * LOOKUP_ flags even for file creation (see lookup_one*
+	 * variants).  Reject negative dentries in this case, since we
+	 * can't know for sure it won't be used for creation.
+	 */
+	if (!flags)
+		return 0;
+
+	/*
+	 * If the lookup is for creation, then a negative dentry can
+	 * only be reused if it's a case-sensitive match, not just a
+	 * case-insensitive one.  This is needed to make the new file be
+	 * created with the name the user specified, preserving case.
+	 */
+	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
+		/*
+		 * ->d_name won't change from under us in the creation
+		 * path only, since d_revalidate during creation and
+		 * renames is always called with the parent inode
+		 * locked.  It isn't the case for all lookup callpaths,
+		 * so ->d_name must not be touched outside
+		 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
+		 */
+		if (dentry->d_name.len != name->len ||
+		    memcmp(dentry->d_name.name, name->name, name->len))
+			return 0;
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
