Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB868A3F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 22:01:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO3BU-0006pd-Kg;
	Fri, 03 Feb 2023 21:01:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pO3BR-0006pO-VL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHCZyJAodGxzYJy9CRO1y2Ojz5lOmcNehoROILAvaTo=; b=Vw5aozJJ3U/bmCkdy4adOVtvxs
 pz1s/wnUx2lx+PHCWGr8V7JLztrAlsyRnA/66qpOguRpxKSABF/yHofHYBe5eqkXK+f83FB1CUWNf
 CNhGj2hlID7YGt69uFDPkJQ6cO5cO4/fOFP9IKpXBwBvTFtaf0NHYnzFg5P1n4AjI3EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pHCZyJAodGxzYJy9CRO1y2Ojz5lOmcNehoROILAvaTo=; b=g0C3/lEwYuitSBZnE8y19hXep0
 AqP6wFIQc2YzdG/BL2yFBZxKuMe5vpdh6hwSH6t7oEdrc0Xl3IIr1GugfKUulC5kj2SoRVB6Q3zGP
 IiqsE0WocFE8e2UzMDRPICWgYbD+/fV9QaD0ZFUO5RcuPGRHYl7GJj6ZhIJ+rv8B+1qw=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pO3BO-0006HR-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 21:01:20 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEA8335229;
 Fri,  3 Feb 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675458071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHCZyJAodGxzYJy9CRO1y2Ojz5lOmcNehoROILAvaTo=;
 b=jPFyJFgXr00F4ibd2FHK4/m7NkiNDPoKJF/lRyUEBYYTrYSbsp2iavZM8VrXBpX0GHp4vc
 ZLTM/NP0Jk/T4cGYe3b5mZgVV4qQeTMjCg5b/tDKc/VhhlzkJyZe91yoTjC4b+m4eQiXBE
 eMrObPWbmOJ4XVA8JZeJm2JyNAey3iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675458071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHCZyJAodGxzYJy9CRO1y2Ojz5lOmcNehoROILAvaTo=;
 b=zcGoUjCjzWnTtH045njIPtNw0QMmHqHbd9BaI1Ss0rLpjCPDYtl8TrwCR4oA9Ivka7Kzr5
 hPg5+WuzI+gFR6AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D0D71358A;
 Fri,  3 Feb 2023 21:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m1UNBhd23WP4JgAAMHmgww
 (envelope-from <krisman@suse.de>); Fri, 03 Feb 2023 21:01:11 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, tytso@mit.edu, jaegeuk@kernel.org,
 ebiggers@kernel.org, jack@suse.cz
Date: Fri,  3 Feb 2023 18:00:38 -0300
Message-Id: <20230203210039.16289-7-krisman@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230203210039.16289-1-krisman@suse.de>
References: <20230203210039.16289-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com> Instead
 of invalidating negative dentries during case-insensitive lookups, mark them
 as such and let them be added to the dcache. d_ci_revalidate is able to
 properly filter them out if necessary based [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pO3BO-0006HR-Uq
Subject: [f2fs-dev] [PATCH v2 6/7] ext4: Enable negative dentries on
 case-insensitive lookup
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

Instead of invalidating negative dentries during case-insensitive
lookups, mark them as such and let them be added to the dcache.
d_ci_revalidate is able to properly filter them out if necessary based
on the dentry casefold flag.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/namei.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index dd28453d6ea3..36d6683ff616 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1851,16 +1851,9 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
-		/* Eventually we want to call d_add_ci(dentry, NULL)
-		 * for negative dentries in the encoding case as
-		 * well.  For now, prevent the negative dentry
-		 * from being cached.
-		 */
-		return NULL;
-	}
-#endif
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
+		d_set_casefold_lookup(dentry);
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3186,17 +3179,6 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	ext4_fc_track_unlink(handle, dentry);
 	retval = ext4_mark_inode_dirty(handle, dir);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	/* VFS negative dentries are incompatible with Encoding and
-	 * Case-insensitiveness. Eventually we'll want avoid
-	 * invalidating the dentries here, alongside with returning the
-	 * negative dentries at ext4_lookup(), when it is better
-	 * supported by the VFS for the CI case.
-	 */
-	if (IS_CASEFOLDED(dir))
-		d_invalidate(dentry);
-#endif
-
 end_rmdir:
 	brelse(bh);
 	if (handle)
@@ -3297,16 +3279,6 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
 		goto out_trace;
 
 	retval = __ext4_unlink(dir, &dentry->d_name, d_inode(dentry), dentry);
-#if IS_ENABLED(CONFIG_UNICODE)
-	/* VFS negative dentries are incompatible with Encoding and
-	 * Case-insensitiveness. Eventually we'll want avoid
-	 * invalidating the dentries here, alongside with returning the
-	 * negative dentries at ext4_lookup(), when it is  better
-	 * supported by the VFS for the CI case.
-	 */
-	if (IS_CASEFOLDED(dir))
-		d_invalidate(dentry);
-#endif
 
 out_trace:
 	trace_ext4_unlink_exit(dentry, retval);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
