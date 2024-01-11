Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03982B769
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 23:59:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO419-0001s0-PW;
	Thu, 11 Jan 2024 22:59:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rO40x-0001r2-5y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=; b=JKjYz58jtxPZ3rlrUCzfC+gvlK
 W1uPbE0orYl+i/7y5DG11jY+Q1WZY8nA7TCcvD0x8TE7ccsdfsW7O5zaJbUgNi1DsQmWtKgk/joTu
 d0N0SQEJ/ZXiKi4sZ4ISCGx3aLbpw7hvQ0m0nySMkjIMoeIhGwo0kwGnKsOYmk+fc6wM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=; b=LEfDokI9NtxQzpLXYDtwWvcrEF
 SiB7Clam8QBx7EcRopKzgJYfCvb1N8od6cUQBanMKu2Lb+DcSCicvpJUwZcvFR5ax4KXTKC3ffuRB
 mqyRC0Z4Na9kOo432gfbX34VGIMoikkhTzMfH5VxdKcIizYA9pWkAH1YF29IZES+7nL4=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rO40s-0005xK-PH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:07 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D53DB1FBCD;
 Thu, 11 Jan 2024 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=;
 b=PyLgoTQ8LVdvyeW6nOHm73D3okXq4TtCxccPfFNFM3QVfqQtyRNs0TBUCPWsOHw3gn68q4
 zk4+9dVrLi77IZU8suhWyOdcMv9FgN6pbqJnrandXhueNlYgmdKUYgXZQxpG8MB96N8hwP
 cYCYUBHVWTOchirpECUW8xC1F9Zkv7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=;
 b=OXpL4maA8vGfP71gFRyvdUGb5wlY/Y8FeQoB8CoEAkjqvSKU06wMvOIoo9j/SP87dJLOiU
 p1HZjEey5b5wvbDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=;
 b=PyLgoTQ8LVdvyeW6nOHm73D3okXq4TtCxccPfFNFM3QVfqQtyRNs0TBUCPWsOHw3gn68q4
 zk4+9dVrLi77IZU8suhWyOdcMv9FgN6pbqJnrandXhueNlYgmdKUYgXZQxpG8MB96N8hwP
 cYCYUBHVWTOchirpECUW8xC1F9Zkv7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvMDsNpWtpVkyHe6WBfOyf6JXsaX65CnVzqgA16TQlI=;
 b=OXpL4maA8vGfP71gFRyvdUGb5wlY/Y8FeQoB8CoEAkjqvSKU06wMvOIoo9j/SP87dJLOiU
 p1HZjEey5b5wvbDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EF4113946;
 Thu, 11 Jan 2024 22:58:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NeaxBbByoGVkLwAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 11 Jan 2024 22:58:56 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Thu, 11 Jan 2024 19:58:10 -0300
Message-ID: <20240111225816.18117-5-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111225816.18117-1-krisman@suse.de>
References: <20240111225816.18117-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.89 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzk7q5dcbbphp39zi8hi5jhbt)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.sourceforge.net,vger.kernel.org,gmail.com,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.01)[50.21%]
X-Spam-Level: ****
X-Spam-Score: 4.89
X-Spam-Flag: NO
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rO40s-0005xK-PH
Subject: [f2fs-dev] [PATCH v3 04/10] fscrypt: Drop d_revalidate once the key
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, amir73il@gmail.com,
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
Changes since v2:
  - Do it when moving instead of when revalidating the dentry. (me)

Changes since v1:
  - Improve commit message (Eric)
  - Drop & in function comparison (Eric)
---
 include/linux/fscrypt.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 3801c5c94fb6..379b423802fa 100644
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
@@ -230,6 +232,14 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
 	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
+
+	/*
+	 * Save the d_revalidate call cost during VFS operations.  We
+	 * can do it because, when the key is available, the dentry
+	 * can't go stale and the key won't go away without eviction.
+	 */
+	if (dentry->d_op->d_revalidate == fscrypt_d_revalidate)
+		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
 }
 
 /**
@@ -368,7 +378,6 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
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
