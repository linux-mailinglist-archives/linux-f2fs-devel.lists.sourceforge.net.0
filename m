Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2768151C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:16:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEFY4-00013R-Os;
	Fri, 15 Dec 2023 21:16:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rEFY3-00013C-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=; b=jILyrwzxEb6qghqoCcWc8ewq9C
 Ht8m7RfvXe4c4VkTJ8+dnkU+pgfwqDy8h4uRQYjw/Cu9z22iDM3Spq5qWRRqQqzanDkkoshjxHHX4
 gNuBtOeimQnmz/UcufC0D49CVf89Hqe+h2EqCJ2OtZ9W/TNeWg8qHi+oirjMxPeU7ctc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=; b=Pc/NXgWj6d2Am/R7LmCAa3lkG7
 SWOAe9qahkAyRwJr1++Dx2WiR1Zr/XggK0IMh+JDgVcM3TnthtUH1e8AS4FMKVZWtrxVsTXzd7Gxi
 jKK9xXQukr/f5enLxfe22yD3lmcNxJBlJ/060q5jAZEDnM/Fqf4cdfE71eCsNotk1wb4=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEFY1-0001Rm-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A6B41F855;
 Fri, 15 Dec 2023 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=;
 b=Os5wdbIC5gYaOirMLKX+gCH+nu5THrpihNWYVA8KvupCnmrEuuiSQM3PtN+cAfqFuVcn8e
 x2gNDKFH5XCwSWbRY25C7bEGLp9fAW4bug64Wtg1DTfcXOsXQyZ39RSMYFwJEfTp7vPqn8
 jcH5gxdAIMtrgDNvS/zP6OO7iVWL4zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=;
 b=MhiXQQVZnxYArrFmeb+U6p/dOGV4IYWP8+6eAh/6xi0jKWwZbTLKgoyg+DcOlJolkPrl4N
 4J0CGNm19jaiQeDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=;
 b=Os5wdbIC5gYaOirMLKX+gCH+nu5THrpihNWYVA8KvupCnmrEuuiSQM3PtN+cAfqFuVcn8e
 x2gNDKFH5XCwSWbRY25C7bEGLp9fAW4bug64Wtg1DTfcXOsXQyZ39RSMYFwJEfTp7vPqn8
 jcH5gxdAIMtrgDNvS/zP6OO7iVWL4zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zHvzCVpUzO/WVW65Ji92QCoBmB2JO4/PTv0toH5FDE=;
 b=MhiXQQVZnxYArrFmeb+U6p/dOGV4IYWP8+6eAh/6xi0jKWwZbTLKgoyg+DcOlJolkPrl4N
 4J0CGNm19jaiQeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA379137D4;
 Fri, 15 Dec 2023 21:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2hsBLi3CfGWaOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 15 Dec 2023 21:16:29 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 15 Dec 2023 16:16:06 -0500
Message-ID: <20231215211608.6449-7-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215211608.6449-1-krisman@suse.de>
References: <20231215211608.6449-1-krisman@suse.de>
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Spamd-Bar: ++++
X-Spam-Flag: NO
X-Spamd-Result: default: False [4.69 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,linux.org.uk:email]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[13.47%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Os5wdbIC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MhiXQQVZ
X-Spam-Level: ****
X-Rspamd-Queue-Id: 2A6B41F855
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
X-Headers-End: 1rEFY1-0001Rm-Nq
Subject: [f2fs-dev] [PATCH v2 6/8] f2fs: Set the case-insensitive dentry
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
 fs/f2fs/namei.c | 6 +++++-
 fs/f2fs/super.c | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index d0053b0284d8..6aec21f0b5d6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -532,7 +532,11 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
-	generic_set_encrypted_ci_d_ops(dentry);
+
+	/* Case-insensitive volumes set dentry ops through sb->s_d_op. */
+	if (!dir->i_sb->s_d_op)
+		generic_set_encrypted_ci_d_ops(dentry);
+
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1..8d1abd7f3a6f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4663,6 +4663,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_node_inode;
 	}
 
+#if IS_ENABLED(CONFIG_UNICODE)
+	if (sb->s_encoding)
+		sb->s_d_op = &generic_ci_dentry_ops;
+#endif
+
 	sb->s_root = d_make_root(root); /* allocate root dentry */
 	if (!sb->s_root) {
 		err = -ENOMEM;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
