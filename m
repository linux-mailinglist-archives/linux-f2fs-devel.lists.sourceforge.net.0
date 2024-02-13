Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB27852751
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 03:13:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZiIy-0007pY-0m;
	Tue, 13 Feb 2024 02:13:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rZiIw-0007pQ-Es
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=; b=BqDtCKYZO3ude8JdU+1U+Cppj7
 dACamdzm/LYPXwkU7PMZwcc85ox4koS4fr6uFojyavD//1eVOOM8+CYisw3kjUuhAP7hp3q6dVzu8
 Q28V48kBdCVuW2mFvRgI+Msie4dOn8Eo9gNsleYCRXdjTAYWsZscNk6vgagC6oYplxec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=; b=My2TPstWl5NcuJMVeTKlAeTpFo
 cxfx2dnYtd4BcNOZI2wqIp9G9KuF/LGMoILrkzFXQfZc+XovH6lPpKhqZRE3Tst/o3kzJqa9Zbk/L
 KpiNT3wXz1Pkgp7WklY8Sa8D+Ilhy/gsM5MaEkD6+ew1B/PzKKJcC3dDlaSg9ChVMewE=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZiIv-00023t-Rl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2105D21E2B;
 Tue, 13 Feb 2024 02:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=;
 b=s2Osc7BeZgZIKekmdM1hrlZidnCGG0K0p2qgsUlqLjOAyHJK3l+AZlTtzd971zxkcEXteJ
 nMVm8ZML/C295iG9xKY/9bTW+1R2M+45n6oYELd0dLfSoAfT67py6zTXl5xdyw3E6zy4mn
 MupZ/uLPK4TjobUICR3T4e2mWAWenrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=;
 b=8SptKwGP066vLS8tZ+19xWbXXiLzYuNVEZ39T9hDBz6yMYIEghcZlGxVlzD6EuRKSSir4t
 c+m69r8GzhbixwDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=;
 b=s2Osc7BeZgZIKekmdM1hrlZidnCGG0K0p2qgsUlqLjOAyHJK3l+AZlTtzd971zxkcEXteJ
 nMVm8ZML/C295iG9xKY/9bTW+1R2M+45n6oYELd0dLfSoAfT67py6zTXl5xdyw3E6zy4mn
 MupZ/uLPK4TjobUICR3T4e2mWAWenrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRqtXwf6B46aK5CAeQBaqHxSfCeg8lo7xfelx6b6v4k=;
 b=8SptKwGP066vLS8tZ+19xWbXXiLzYuNVEZ39T9hDBz6yMYIEghcZlGxVlzD6EuRKSSir4t
 c+m69r8GzhbixwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBD2C13A4B;
 Tue, 13 Feb 2024 02:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0FSXL1fQymUXeAAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 13 Feb 2024 02:13:43 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk
Date: Mon, 12 Feb 2024 21:13:14 -0500
Message-ID: <20240213021321.1804-4-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213021321.1804-1-krisman@suse.de>
References: <20240213021321.1804-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.85 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.05)[60.01%]
X-Spam-Level: ****
X-Spam-Score: 4.85
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Unencrypted and encrypted-dentries where the key is available
 don't need to be revalidated by fscrypt, since they don't go stale from under
 VFS and the key cannot be removed for the encrypted case wit [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZiIv-00023t-Rl
Subject: [f2fs-dev] [PATCH v6 03/10] fscrypt: Drop d_revalidate for valid
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
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
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
index 47567a6a4f9d..d1f17b90c30f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -951,10 +951,29 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
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
 
@@ -992,6 +1011,9 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
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
