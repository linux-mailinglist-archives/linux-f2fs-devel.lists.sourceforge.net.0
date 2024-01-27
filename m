Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7083E7ED
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 01:10:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTWHT-0007wJ-R5;
	Sat, 27 Jan 2024 00:10:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rTWHR-0007vy-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=; b=CJD5GLCbGium980SzGit/03BB2
 qcet9+19VrlW/lkZkwBF79Gb9MyvxJXUarUx14yX/Y8CxXBAkcHvuNN3LM7zs6gEAH4q0AnJIrDJU
 jpNn7TOPadkoidg7ilG+1uzpBXXbhEJ/34f8QNup8RUsYRDO13BqVY2aW9rru6F9EZMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=; b=WZgCe1D6oW3FF4EvfUf8DqZ1E8
 3E3RMU9LoSK3TNXKNRPf3j9ox39j88SOQ0Kr6pThstjwOJh9HSYMHOg9up+G28nvpTxqLAn6hA8gf
 lrD6XR6fWMZhfDyOk4rOgSmsBHu9qOn851S3cmy7p5LG/VW9BEIY6HslZw0ZcPt2p6iI=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTWHQ-0006uL-Ge for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BCD5A1FDB5;
 Sat, 27 Jan 2024 00:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=;
 b=CKo1zCKbYgnNFY/q1JmBghIYJv2lhPqdGMadhM3O33D5mJClGb3MfaDz9TF4IjuWecNKjY
 ejj0njC7dMyrI0FzFwHxdc0VoX/USWhleVmoNn7JnPzjqOmuSLidFr71k7f4i/Lewwaj/o
 GHUVUlxKcueG/ppSmTXZWIuMo43In+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=;
 b=aZVg/Fsbf/TWSmpzAs2dAn80uqTvMOiaFj5RUVMcOK6HoUOXf/UnBy1UjfSOO6KG+ibGb2
 Fv6i0TZ6YUQ7TdBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=;
 b=CKo1zCKbYgnNFY/q1JmBghIYJv2lhPqdGMadhM3O33D5mJClGb3MfaDz9TF4IjuWecNKjY
 ejj0njC7dMyrI0FzFwHxdc0VoX/USWhleVmoNn7JnPzjqOmuSLidFr71k7f4i/Lewwaj/o
 GHUVUlxKcueG/ppSmTXZWIuMo43In+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pedrDAyodui+t1vV5VqCovZAmeHiWI4BdqWsbJ87tRE=;
 b=aZVg/Fsbf/TWSmpzAs2dAn80uqTvMOiaFj5RUVMcOK6HoUOXf/UnBy1UjfSOO6KG+ibGb2
 Fv6i0TZ6YUQ7TdBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2159413998;
 Sat, 27 Jan 2024 00:10:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XxL8MfRJtGVcEQAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 27 Jan 2024 00:10:28 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 26 Jan 2024 21:10:03 -0300
Message-ID: <20240127001013.2845-4-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127001013.2845-1-krisman@suse.de>
References: <20240127001013.2845-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CKo1zCKb;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="aZVg/Fsb"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: BCD5A1FDB5
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to dropping DCACHE_OP_REVALIDATE for dentries
 that don't need it at lookup time, refactor the code to make unencrypted
 denties also call fscrypt_prepare_dentry. This makes the non-inlin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTWHQ-0006uL-Ge
Subject: [f2fs-dev] [PATCH v4 03/12] fscrypt: Call
 fscrypt_prepare_lookup_dentry on unencrypted dentries
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

In preparation to dropping DCACHE_OP_REVALIDATE for dentries that
don't need it at lookup time, refactor the code to make unencrypted
denties also call fscrypt_prepare_dentry.  This makes the
non-inline __fscrypt_prepare_lookup superfulous, so drop it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/crypto/hooks.c       | 14 --------------
 include/linux/fscrypt.h | 31 +++++++++++++++----------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 71463cef08f9..eb870bc162e6 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -94,20 +94,6 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_rename);
 
-int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
-			     struct fscrypt_name *fname)
-{
-	int err = fscrypt_setup_filename(dir, &dentry->d_name, 1, fname);
-
-	if (err && err != -ENOENT)
-		return err;
-
-	fscrypt_prepare_lookup_dentry(dentry, fname->is_nokey_name);
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
-
 /**
  * fscrypt_prepare_lookup_partial() - prepare lookup without filename setup
  * @dir: the encrypted directory being searched
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 68ca8706483a..4aaf847955c0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -382,8 +382,6 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 			     struct inode *new_dir, struct dentry *new_dentry,
 			     unsigned int flags);
-int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
-			     struct fscrypt_name *fname);
 int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry);
 int __fscrypt_prepare_readdir(struct inode *dir);
 int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
@@ -704,13 +702,6 @@ static inline int __fscrypt_prepare_rename(struct inode *old_dir,
 	return -EOPNOTSUPP;
 }
 
-static inline int __fscrypt_prepare_lookup(struct inode *dir,
-					   struct dentry *dentry,
-					   struct fscrypt_name *fname)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int fscrypt_prepare_lookup_partial(struct inode *dir,
 						 struct dentry *dentry)
 {
@@ -985,14 +976,22 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
 					 struct dentry *dentry,
 					 struct fscrypt_name *fname)
 {
-	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_lookup(dir, dentry, fname);
+	int err = 0;
+
+	if (IS_ENCRYPTED(dir)) {
+		err = fscrypt_setup_filename(dir, &dentry->d_name, 1, fname);
+		if (err && err != -ENOENT)
+			return err;
+	} else {
+		memset(fname, 0, sizeof(*fname));
+		fname->usr_fname = &dentry->d_name;
+		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
+		fname->disk_name.len = dentry->d_name.len;
+	}
 
-	memset(fname, 0, sizeof(*fname));
-	fname->usr_fname = &dentry->d_name;
-	fname->disk_name.name = (unsigned char *)dentry->d_name.name;
-	fname->disk_name.len = dentry->d_name.len;
-	return 0;
+	fscrypt_prepare_lookup_dentry(dentry, fname->is_nokey_name);
+
+	return err;
 }
 
 /**
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
