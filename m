Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90384147E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:44:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYU6-00075q-2H;
	Mon, 29 Jan 2024 20:44:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYTx-00075Z-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=; b=m1PjxC8pJ1Z+qRXuc+J5P+rVOj
 +AYNB4bRBrHetyKnglEOUYqm3otC6JCDTd64fOidzeIpwXtJAxPKuSAb+5rRaHwcVXaqMA5seDUno
 lz3SjLM7QuPV+0BecDXW7RQKDSgNEZB4ZTPKz1kw3e0karDTd3DjnMxGPGGSSQdQXpMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=; b=M/ip4DpukhgszBoC0xEqhExA8u
 srM+dJe+rI0VJCAQdKGe2mP4eATWpnd6yonkTG5ZUoZVAqlBYmZv1UwMeQGgzqIeEIGTd0ucQKfii
 Q7+q4N3qjFch7wwKl1piiNzeQNeXN2sdzy0DYuqHTklz5yVbnEmf+S6lRSaWA3bypkW4=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYTt-0000Yu-DV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 89F851F7F9;
 Mon, 29 Jan 2024 20:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=;
 b=PlGptVMvzMtW33T7NkdVCV2nkM8xmFBDHEpCWCcprHmNT8aa+9DZcKPx1J7MqHk02umMaw
 vhk3SS6v3PFlPdJfZijKHLgLAsyy8ifc11oMBeMUGwwkErRM6uI5Ns9JgaMzA/vMTgD8WU
 av29AF4to9/GMzo5f9Vc04YBe/DFkxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=;
 b=nCfknxCOsBsRJhUcXFQ8hUtHWjqv+2hW+EGoILSw3TEOiB2eYBF/HEQXe8JtnZy6/hDkc/
 IvCEDRp4wQGMxtCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=;
 b=PlGptVMvzMtW33T7NkdVCV2nkM8xmFBDHEpCWCcprHmNT8aa+9DZcKPx1J7MqHk02umMaw
 vhk3SS6v3PFlPdJfZijKHLgLAsyy8ifc11oMBeMUGwwkErRM6uI5Ns9JgaMzA/vMTgD8WU
 av29AF4to9/GMzo5f9Vc04YBe/DFkxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiP0FQnt4cqTSN1YiUy858/KWPxl65jOuggk0qs8I50=;
 b=nCfknxCOsBsRJhUcXFQ8hUtHWjqv+2hW+EGoILSw3TEOiB2eYBF/HEQXe8JtnZy6/hDkc/
 IvCEDRp4wQGMxtCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9F9212FF7;
 Mon, 29 Jan 2024 20:43:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +ro+J/kNuGXCDAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:43:37 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:19 -0300
Message-ID: <20240129204330.32346-2-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204330.32346-1-krisman@suse.de>
References: <20240129204330.32346-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  overlayfs relies on the filesystem setting DCACHE_OP_HASH
 or DCACHE_OP_COMPARE to reject mounting over case-insensitive directories.
 Since commit bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"),
 we set ->d_op through a hook in ->d_lookup, which means the root dentry won't
 have them, causing the mount to accidentally s [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYTt-0000Yu-DV
Subject: [f2fs-dev] [PATCH v5 01/12] ovl: Reject mounting over
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

overlayfs relies on the filesystem setting DCACHE_OP_HASH or
DCACHE_OP_COMPARE to reject mounting over case-insensitive directories.

Since commit bb9cd9106b22 ("fscrypt: Have filesystems handle their
d_ops"), we set ->d_op through a hook in ->d_lookup, which
means the root dentry won't have them, causing the mount to accidentally
succeed.

In v6.7-rc7, the following sequence will succeed to mount, but any
dentry other than the root dentry will be a "weird" dentry to ovl and
fail with EREMOTE.

  mkfs.ext4 -O casefold lower.img
  mount -O loop lower.img lower
  mount -t overlay -o lowerdir=lower,upperdir=upper,workdir=work ovl /mnt

Mounting on a subdirectory fails, as expected, because DCACHE_OP_HASH
and DCACHE_OP_COMPARE are properly set by ->lookup.

Fix by explicitly rejecting superblocks that allow case-insensitive
dentries.

While there, re-sort the entries to have more descriptive error messages
first.

Fixes: bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops")
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
Acked-by: Amir Goldstein <amir73il@gmail.com>

---
changes since v3:
  - Case insensitive filesystem ->Case insensitive capable
  filesystem (eric)
  - clarify patch summary line
changes since v2:
  - Re-sort checks to trigger more descriptive error messages
  first (Amir)
  - Add code comment (Amir)
---
 fs/overlayfs/params.c | 14 +++++++++++---
 include/linux/fs.h    |  9 +++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 3fe2dde1598f..488f920f79d2 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -280,12 +280,20 @@ static int ovl_mount_dir_check(struct fs_context *fc, const struct path *path,
 {
 	struct ovl_fs_context *ctx = fc->fs_private;
 
-	if (ovl_dentry_weird(path->dentry))
-		return invalfc(fc, "filesystem on %s not supported", name);
-
 	if (!d_is_dir(path->dentry))
 		return invalfc(fc, "%s is not a directory", name);
 
+	/*
+	 * Root dentries of case-insensitive capable filesystems might
+	 * not have the dentry operations set, but still be incompatible
+	 * with overlayfs.  Check explicitly to prevent post-mount
+	 * failures.
+	 */
+	if (sb_has_encoding(path->mnt->mnt_sb))
+		return invalfc(fc, "case-insensitive capable filesystem on %s not supported", name);
+
+	if (ovl_dentry_weird(path->dentry))
+		return invalfc(fc, "filesystem on %s not supported", name);
 
 	/*
 	 * Check whether upper path is read-only here to report failures
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 98b7a7a8c42e..e6667ece5e64 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3203,6 +3203,15 @@ extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
+static inline bool sb_has_encoding(const struct super_block *sb)
+{
+#if IS_ENABLED(CONFIG_UNICODE)
+	return !!sb->s_encoding;
+#else
+	return false;
+#endif
+}
+
 int may_setattr(struct mnt_idmap *idmap, struct inode *inode,
 		unsigned int ia_valid);
 int setattr_prepare(struct mnt_idmap *, struct dentry *, struct iattr *);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
