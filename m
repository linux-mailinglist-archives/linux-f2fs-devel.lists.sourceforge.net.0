Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA183E7EC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 01:10:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTWHS-0000vF-U0;
	Sat, 27 Jan 2024 00:10:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rTWHQ-0000v7-RS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=; b=SaI+64huPhTSLpcZvjgVYmDnz2
 rCzmpIT5diozIN3UxmJ7mr+0BzNEuT5MM4ZDT7YmB7I67EvcztpIOWLyhTcd4jbCk8PPSGv/Fjum4
 VrMz/e/ZR98BJr9Mn75hQlzpp1R/JAUF4dd2+OnN+nJts+E9A7VftgXhAcgbpCpPktxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=; b=KeeUaBLbYjeP7zISMXA1ABzaB0
 BNA5KhmT4Yilg2do2cxJ4AVUpZSgDx6PXNRPKxDInesmNwljBj+fVQjK44363IdzrM6S3bAafuQ2/
 4oG81Q6O7qeUT1jVg2gzB1eVLqEeQULeKfo6xpsjhPWb4nHT8iUj66bxaMq74RD6GQoM=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTWHP-0006uC-9H for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:40 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B14C223A2;
 Sat, 27 Jan 2024 00:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=;
 b=hIlMEfCT7leuXNVllpw9w9CRYtDpDP90wFY6jwfG1Ems9IEkQ+axCJlNKVS7dTqCayQoyk
 Uzedamq/+Js/DlqgrGXc6IKRumm8g0VLoYYT8En67JHkDpxCsl8zF0Qzs5CeIQ3EGpfuy+
 NhIJwnr6G7zS+a9HQy0InkFozTXP4/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=;
 b=xz9TFm/U7icSMnJnAlTHBobbjA1hdhJbRhHD/nGTVtlg4APzeti3QbimNVnGBrTFbrVbBr
 wIUPAGyBR0I3rkCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=;
 b=hIlMEfCT7leuXNVllpw9w9CRYtDpDP90wFY6jwfG1Ems9IEkQ+axCJlNKVS7dTqCayQoyk
 Uzedamq/+Js/DlqgrGXc6IKRumm8g0VLoYYT8En67JHkDpxCsl8zF0Qzs5CeIQ3EGpfuy+
 NhIJwnr6G7zS+a9HQy0InkFozTXP4/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFf2P+TvRG7M8VFr2Z2JnXZ5zzx7Ytjk1bFgdtQ+JA4=;
 b=xz9TFm/U7icSMnJnAlTHBobbjA1hdhJbRhHD/nGTVtlg4APzeti3QbimNVnGBrTFbrVbBr
 wIUPAGyBR0I3rkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0841313998;
 Sat, 27 Jan 2024 00:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wGm1LPhJtGVhEQAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 27 Jan 2024 00:10:32 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 26 Jan 2024 21:10:04 -0300
Message-ID: <20240127001013.2845-5-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127001013.2845-1-krisman@suse.de>
References: <20240127001013.2845-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.36 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.54)[80.63%]
X-Spam-Level: ****
X-Spam-Score: 4.36
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Unencrypted and encrypted-dentries where the key is available
 don't need to be revalidated with regards to fscrypt, since they don't go
 stale from under VFS and the key cannot be removed for the encry [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTWHP-0006uC-9H
Subject: [f2fs-dev] [PATCH v4 04/12] fscrypt: Drop d_revalidate for valid
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Unencrypted and encrypted-dentries where the key is available don't need
to be revalidated with regards to fscrypt, since they don't go stale
from under VFS and the key cannot be removed for the encrypted case
without evicting the dentry.  Mark them with d_set_always_valid, to
avoid unnecessary revalidation, in preparation to always configuring
d_op through sb->s_d_op.

Since the filesystem might have other features that require
revalidation, only apply this optimization if the d_revalidate handler
is fscrypt_d_revalidate itself.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 include/linux/fscrypt.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 4aaf847955c0..a22997b9f35c 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -942,11 +942,22 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
 static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
 						 bool is_nokey_name)
 {
-	if (is_nokey_name) {
-		spin_lock(&dentry->d_lock);
+	spin_lock(&dentry->d_lock);
+
+	if (is_nokey_name)
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
+	else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
+		 dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
+		/*
+		 * Unencrypted dentries and encrypted dentries where the
+		 * key is available are always valid from fscrypt
+		 * perspective. Avoid the cost of calling
+		 * fscrypt_d_revalidate unnecessarily.
+		 */
+		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
 	}
+
+	spin_unlock(&dentry->d_lock);
 }
 
 /**
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
