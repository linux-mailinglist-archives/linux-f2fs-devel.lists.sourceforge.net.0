Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B284148A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:44:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYUQ-0006OC-9N;
	Mon, 29 Jan 2024 20:44:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYUN-0006O0-VA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=; b=IssGY93n01GvTqKzMam88nhCNM
 L42jIgzRxvWajIvxfvslyrCOZpyDNg+WDnu2WfMg8tRyjL/gzVbsKASYTY2Cw2RaS/QWl/Ku6Gybm
 gBhpPmsv9RYn5/JkeC1vsrlkr6Q5lqdKwxtdSsJBAkK65jRRdXysuMq1bitAs4FZULXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=; b=AVAty5PYc8IoFy9RBiP6D1nE/P
 Ht/Q4yzYX8lY5ZG6xNlF7w+yeChj2rWQcdIbeqxRrjYZMACZLGPQSUOwNkYK+HzOKvgT5KK7Y16Ph
 REYdd7JJTZjjcoZams5ntxnCZsRm20NEQLkT641inXsZvY+MB3ndWS2KShTf3UqIE+0k=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYUN-0000aL-FP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B065D21E90;
 Mon, 29 Jan 2024 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=;
 b=lYOH9VNBq37wf1pK1VtMJ51LjuJFOyu15hNf31Mk8BvZ1GwQ7L7jBaRFik6PT44y0cWIrT
 Ei7kXnJPX65wQnFrmYosH5cMJ2sbCLhuJXWzGLl0iyHEsDb/c7zXnWuiFgeYg9xCc3spoG
 t6PQZuu9iP3UXKh7y5RQ2EU8CVf1tnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=;
 b=moGiH92VSwWhrw2FpXg3fyUxpbG2+4NzU5TzwpoOWHtMP/jTqhd0K02bLUHiHHCBejIadQ
 6LaK+2tXKjBVOKDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=;
 b=lYOH9VNBq37wf1pK1VtMJ51LjuJFOyu15hNf31Mk8BvZ1GwQ7L7jBaRFik6PT44y0cWIrT
 Ei7kXnJPX65wQnFrmYosH5cMJ2sbCLhuJXWzGLl0iyHEsDb/c7zXnWuiFgeYg9xCc3spoG
 t6PQZuu9iP3UXKh7y5RQ2EU8CVf1tnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlx4z3N508ykO+IPN4KGQgLY91vQLkOc0l8vpLCa86g=;
 b=moGiH92VSwWhrw2FpXg3fyUxpbG2+4NzU5TzwpoOWHtMP/jTqhd0K02bLUHiHHCBejIadQ
 6LaK+2tXKjBVOKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 140F212FF7;
 Mon, 29 Jan 2024 20:44:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jDB3LxwOuGX2DAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:44:12 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:28 -0300
Message-ID: <20240129204330.32346-11-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204330.32346-1-krisman@suse.de>
References: <20240129204330.32346-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This was already the case for case-insensitive before commit
 bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), but it was
 changed to set at lookup-time to facilitate the integration with [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYUN-0000aL-FP
Subject: [f2fs-dev] [PATCH v5 10/12] f2fs: Configure dentry operations at
 dentry-creation time
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

This was already the case for case-insensitive before commit
bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), but it
was changed to set at lookup-time to facilitate the integration with
fscrypt.  But it's a problem because dentries that don't get created
through ->lookup() won't have any visibility of the operations.

Since fscrypt now also supports configuring dentry operations at
creation-time, do it for any encrypted and/or casefold volume,
simplifying the implementation across these features.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/f2fs/namei.c | 1 -
 fs/f2fs/super.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index d0053b0284d8..b40c6c393bd6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -532,7 +532,6 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
-	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1..abfdb6e25b1c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4663,6 +4663,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_node_inode;
 	}
 
+	generic_set_sb_d_ops(sb);
 	sb->s_root = d_make_root(root); /* allocate root dentry */
 	if (!sb->s_root) {
 		err = -ENOMEM;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
