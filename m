Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9C85E42A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 18:14:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcqB5-0007cs-V1;
	Wed, 21 Feb 2024 17:14:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcqB4-0007cm-TG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f2RTAhoS7RP1zLHGWxELfihbizgUAKZX0ypcsvkzjQ0=; b=nCaM2TTPpp73vDX370kYfUTC3U
 gCEIk+8r/4mG4nPw1y1NDSJ8CU46gSkw9oPIjgfQTYQOOEKFzZgqtvF/vVQCGqNsryQ2IgrnkR2i2
 2RF3fddsCh+5xwyexHIHlz+eLssYSMUJ/QtYqxrzPtSL8LJMctoOlD7R8rrR1VeJZads=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f2RTAhoS7RP1zLHGWxELfihbizgUAKZX0ypcsvkzjQ0=; b=HZIjhIiGTDcRaZElHXsxU/q8hv
 84cHTkHaLc9wqbzloT05lT+Nm38ukloy1KKQuWw5KK32Af4AJbFCs+YXoKdyT62vNzb6ptRbDc8PP
 AZKoE0EuFDVYCUfAZdRVyF/55+7gfJSjK5sqZmVzGJ04dD4eLos+yFflMBf9J+oPIFPY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcqB3-00028u-P8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C516821DB0;
 Wed, 21 Feb 2024 17:14:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89599139D0;
 Wed, 21 Feb 2024 17:14:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2S5XG3Mv1mVYKgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 21 Feb 2024 17:14:27 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk,
	jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 12:14:05 -0500
Message-ID: <20240221171412.10710-4-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
References: <20240221171412.10710-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C516821DB0
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Unencrypted and encrypted-dentries where the key is available
 don't need to be revalidated by fscrypt, since they don't go stale from under
 VFS and the key cannot be removed for the encrypted case wit [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcqB3-00028u-P8
Subject: [f2fs-dev] [PATCH v7 03/10] fscrypt: Drop d_revalidate for valid
 dentries during lookup
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Unencrypted and encrypted-dentries where the key is available don't need
to be revalidated by fscrypt, since they don't go stale from under VFS
and the key cannot be removed for the encrypted case without evicting
the dentry.  Disable their d_revalidate hook on the first lookup, to
avoid repeated revalidation later. This is done in preparation to always
configuring d_op through sb->s_d_op.

The only part detail is that, since the filesystem might have other
features that require revalidation, we only apply this optimization if
the d_revalidate handler is fscrypt_d_revalidate itself.

Finally, we need to clean the dentry->flags even for unencrypted
dentries, so the ->d_lock might be acquired even for them.  In order to
avoid doing it for filesystems that don't care about fscrypt at all, we
peek ->d_flags without the lock at first, and only acquire it if we
actually need to write the flag.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
changes since v5
 - d_set_always_valid -> d_revalidate (eric)
 - Avoid acquiring the lock for !fscrypt-capable filesystems (eric, Christian)
---
 include/linux/fscrypt.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c76f859cf019..78af02b35bd9 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -264,10 +264,29 @@ static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
 static inline void fscrypt_prepare_dentry(struct dentry *dentry,
 					  bool is_nokey_name)
 {
+	/*
+	 * This code tries to only take ->d_lock when necessary to write
+	 * to ->d_flags.  We shouldn't be peeking on d_flags for
+	 * DCACHE_OP_REVALIDATE unlocked, but in the unlikely case
+	 * there is a race, the worst it can happen is that we fail to
+	 * unset DCACHE_OP_REVALIDATE and pay the cost of an extra
+	 * d_revalidate.
+	 */
 	if (is_nokey_name) {
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
 		spin_unlock(&dentry->d_lock);
+	} else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
+		   dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
+		/*
+		 * Unencrypted dentries and encrypted dentries where the
+		 * key is available are always valid from fscrypt
+		 * perspective. Avoid the cost of calling
+		 * fscrypt_d_revalidate unnecessarily.
+		 */
+		spin_lock(&dentry->d_lock);
+		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
+		spin_unlock(&dentry->d_lock);
 	}
 }
 
@@ -997,6 +1016,9 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
 	fname->usr_fname = &dentry->d_name;
 	fname->disk_name.name = (unsigned char *)dentry->d_name.name;
 	fname->disk_name.len = dentry->d_name.len;
+
+	fscrypt_prepare_dentry(dentry, false);
+
 	return 0;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
