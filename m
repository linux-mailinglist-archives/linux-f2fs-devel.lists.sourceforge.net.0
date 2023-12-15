Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D408151C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:16:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEFY2-0000wj-1S;
	Fri, 15 Dec 2023 21:16:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rEFY0-0000wb-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=; b=S3BlEdsHsu03I8TfpB9P5ASwuT
 xt5NOTmbi2gVzNE1U6zEa+sIPAGbwaKRZPMfWUz48w/vUHwl2b5jSyaAVY1eXTvE6OI0pTYWRn1Jb
 OoIAjb4u/RqNlP1bfC3BT17q5/SuMzybvdanQpc0PqBpRuA2kyYeGKaWUyXE0e4827PE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=; b=BpmzuLAo6Ejdh7YR2INL4sngtU
 vmRIccxfegoXOjBQNduYaZCKbDnEvIFD5AQHk9Ux0fd3qRMkq1xiV1dcT0+ueTwpzuSZM4dUzQty7
 JWjpzefCqoId/nrq2fnGCk0ctiXBBduOvnHWm9MVOGjXe1dj2nve72bMyK9QNpQEcB4E=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEFXz-0001Rf-RE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:40 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 573B31F867;
 Fri, 15 Dec 2023 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=;
 b=uHpAeEOVQfYVN6npn6Ox1wYzLw9nlq9Vq2mcQBjfYmElyvENCy0kSzbeUss3chRItchHth
 mTfumbNOR/3rlj5Bo7MQI2cipHyDmlzGOBrtsonXc1RXu+psJEIA3k5Rw3ACDORLDYyvsH
 wUQs12tQrxTN0n93mHI1IRWYLO79bBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=;
 b=TisYrllaZ3zck7CfP/s+m9iqnLiVXDhuT/h7lUN2YAevAdJTDbBA9M4vjQtaKb0lM6fW7G
 3DMx245OFhHxy8Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=;
 b=uHpAeEOVQfYVN6npn6Ox1wYzLw9nlq9Vq2mcQBjfYmElyvENCy0kSzbeUss3chRItchHth
 mTfumbNOR/3rlj5Bo7MQI2cipHyDmlzGOBrtsonXc1RXu+psJEIA3k5Rw3ACDORLDYyvsH
 wUQs12tQrxTN0n93mHI1IRWYLO79bBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukGIZU8SjDCjm+5RFEuvLetuIyhrzB5yLu8+TLHYt4c=;
 b=TisYrllaZ3zck7CfP/s+m9iqnLiVXDhuT/h7lUN2YAevAdJTDbBA9M4vjQtaKb0lM6fW7G
 3DMx245OFhHxy8Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16DFE137D4;
 Fri, 15 Dec 2023 21:16:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lN9VOivCfGWUOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 15 Dec 2023 21:16:27 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 15 Dec 2023 16:16:05 -0500
Message-ID: <20231215211608.6449-6-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215211608.6449-1-krisman@suse.de>
References: <20231215211608.6449-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,linux.org.uk:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[12.94%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All dentries in a case-insensitive filesystem have the same
 set of dentry operations. Therefore, we should let VFS propagate them from
 sb->s_d_op d_alloc instead of setting at lookup time. This was already the
 case before commit bb9cd9106b22 ("fscrypt: Have filesystems handle their
 d_ops"), but it was changed to set at lookup-time to facilitate the integration
 with fscrypt. But it's a p [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEFXz-0001Rf-RE
Subject: [f2fs-dev] [PATCH v2 5/8] ext4: Set the case-insensitive dentry
 operations through ->s_d_op
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
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All dentries in a case-insensitive filesystem have the same set of
dentry operations.  Therefore, we should let VFS propagate them from
sb->s_d_op d_alloc instead of setting at lookup time.

This was already the case before commit bb9cd9106b22 ("fscrypt: Have
filesystems handle their d_ops"), but it was changed to set at
lookup-time to facilitate the integration with fscrypt.  But it's a
problem because dentries that don't get created through ->lookup() won't
have any visibility of the operations.  Let's revert to the previous
implementation.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
changes since v1:
  - Fix CONFIG_UNICODE=n build (lkp)
---
 fs/ext4/namei.c | 6 +++++-
 fs/ext4/super.c | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d252935f9c8a..463e73fb5bf0 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1762,7 +1762,11 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
-	generic_set_encrypted_ci_d_ops(dentry);
+
+	/* Case-insensitive volumes set dentry ops through sb->s_d_op. */
+	if (!dir->i_sb->s_d_op)
+		generic_set_encrypted_ci_d_ops(dentry);
+
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c5fcf377ab1f..e0680d0641aa 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5493,6 +5493,11 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 		goto failed_mount4;
 	}
 
+#if IS_ENABLED(CONFIG_UNICODE)
+	if (sb->s_encoding)
+		sb->s_d_op = &generic_ci_dentry_ops;
+#endif
+
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
