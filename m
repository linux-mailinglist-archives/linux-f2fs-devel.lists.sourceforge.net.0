Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521783E7EE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 01:10:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTWHY-00018s-9S;
	Sat, 27 Jan 2024 00:10:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rTWHX-00018j-5X
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=; b=QhN8KMkxS3RkOA3EJogw5oW52C
 ZviyyOfDHFXrbMUVpXDQlecxHT/+i+U7RDZJlvTS/+RUPONhoLNDZ4eLGd7MAhEwWAy+l92VE2/Ti
 7FuqFWlWgsawxfZB3YYAFlxXspGcnxh/2gjRYyqbMwUNN391ITPK1GUQ2X/BkYeCxmSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=; b=azhIiIUcaB2xJ8ewqqsYJKvgiM
 C51U6/5lVpwWiNuPYHxtFwW8gdpSU0EQv4hVOpRqP5X5qIic24TZsRSoDY6siR1FC2sV1P4hudqkn
 nx6LY9sGTIsLVfUzxkPyf7dSxSpZT1SXIEQT+iZyyb8Y+F5zamIraje1khvAyuUgSGIs=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTWHT-0006ua-5t for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:47 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6FBB51FDB0;
 Sat, 27 Jan 2024 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=;
 b=njihZ2dHAnHyFYwzjouCIGfePEXEE1CROutbw5YtwQizHMZhBRVFuJguNcMm6MihGp+vIa
 qSEPIOXSrjG4Wwj6Mk9lDyaUFHvnoozmE0obDlR/2140b7HdytPHbETVIwVj7uebRkBzIr
 rEj2n9UP+SBCfCFSxlbhtB5i1euUq0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=;
 b=glvGzXi4PeXfuOC1nkWX/mSYmDJJheEXCVcC/+N7c4gFM55a9yJ3LjZTbCRYtJtAPv6ILB
 N/e9drsssNj7fPCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=;
 b=njihZ2dHAnHyFYwzjouCIGfePEXEE1CROutbw5YtwQizHMZhBRVFuJguNcMm6MihGp+vIa
 qSEPIOXSrjG4Wwj6Mk9lDyaUFHvnoozmE0obDlR/2140b7HdytPHbETVIwVj7uebRkBzIr
 rEj2n9UP+SBCfCFSxlbhtB5i1euUq0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee/oWUNb4/zKYaB/G7ImZVRaz1EQk96VJ8QbjhzB4ZM=;
 b=glvGzXi4PeXfuOC1nkWX/mSYmDJJheEXCVcC/+N7c4gFM55a9yJ3LjZTbCRYtJtAPv6ILB
 N/e9drsssNj7fPCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7AB513998;
 Sat, 27 Jan 2024 00:10:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CC1ZH/xJtGVpEQAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 27 Jan 2024 00:10:36 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 26 Jan 2024 21:10:05 -0300
Message-ID: <20240127001013.2845-6-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127001013.2845-1-krisman@suse.de>
References: <20240127001013.2845-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=njihZ2dH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=glvGzXi4
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 6FBB51FDB0
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From fscrypt perspective, once the key is available,
 the dentry
 will remain valid until evicted for other reasons, since keyed dentries don't
 require revalidation and, if the key is removed, the dentr [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTWHT-0006ua-5t
Subject: [f2fs-dev] [PATCH v4 05/12] fscrypt: Drop d_revalidate once the key
 is added
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

From fscrypt perspective, once the key is available, the dentry will
remain valid until evicted for other reasons, since keyed dentries don't
require revalidation and, if the key is removed, the dentry is
forcefully evicted.  Therefore, we don't need to keep revalidating them
repeatedly.

Obviously, we can only do this if fscrypt is the only thing requiring
revalidation for a dentry.  For this reason, we only disable
d_revalidate if the .d_revalidate hook is fscrypt_d_revalidate itself.

It is safe to do it here because when moving the dentry to the
plain-text version, we are holding the d_lock.  We might race with a
concurrent RCU lookup but this is harmless because, at worst, we will
get an extra d_revalidate on the keyed dentry, which is will find the
dentry is valid.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
Changes since v3:
  - Fix null-ptr-deref for filesystems that don't support fscrypt (ktr)
Changes since v2:
  - Do it when moving instead of when revalidating the dentry. (me)

Changes since v1:
  - Improve commit message (Eric)
  - Drop & in function comparison (Eric)
---
 include/linux/fscrypt.h | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a22997b9f35c..c1e285053b3e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -192,6 +192,8 @@ struct fscrypt_operations {
 					     unsigned int *num_devs);
 };
 
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
+
 static inline struct fscrypt_inode_info *
 fscrypt_get_inode_info(const struct inode *inode)
 {
@@ -221,15 +223,24 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
 }
 
 /*
- * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
- * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
- * cleared.  Note that we don't have to support arbitrary moves of this flag
- * because fscrypt doesn't allow no-key names to be the source or target of a
- * rename().
+ * When d_splice_alias() moves a directory's no-key alias to its
+ * plaintext alias as a result of the encryption key being added,
+ * DCACHE_NOKEY_NAME must be cleared and there might be an opportunity
+ * to disable d_revalidate.  Note that we don't have to support the
+ * inverse operation because fscrypt doesn't allow no-key names to be
+ * the source or target of a rename().
  */
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
 	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
+
+	/*
+	 * Save the d_revalidate call cost during VFS operations.  We
+	 * can do it because, when the key is available, the dentry
+	 * can't go stale and the key won't go away without eviction.
+	 */
+	if (dentry->d_op && dentry->d_op->d_revalidate == fscrypt_d_revalidate)
+		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
 }
 
 /**
@@ -368,7 +379,6 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
-int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 bool fscrypt_decrypt_bio(struct bio *bio);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
