Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2E841485
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:44:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYUE-0001LR-UZ;
	Mon, 29 Jan 2024 20:44:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYUE-0001LF-CM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=unr8RrcAXNAzuXvEUPC3o496QlxhkRxYikViGY3ZEUA=; b=OSmcK/PCRjYccndIeqoxtb+DtQ
 y9uDIiu7YzxOQHmRV5kfYNAkTTmdm2aH+TXGnLRWjxWCkmvuTb7tRlaqZEzlPxdLwoN8Z84ZXqprj
 BOOExmnp7rKjLwVcSjaSq1cc4ZFaqQQ5VSkPZH7xEYzqC+aVahSoKjqGLfUMq1uSk2TQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=unr8RrcAXNAzuXvEUPC3o496QlxhkRxYikViGY3ZEUA=; b=L9jBDZjspUNf9SbNdGcQk+rw1l
 IFmSthyDKlc31H2v3dZCGAvQcaJrA+SixA4gc3eJAFMJdmnDeSKjknTEvlDEvEDSI+EjyjEmTmej3
 DBm3QUnUxJP36adJNuswgeyb/r4g6y7eadyKcdth57V6DD5De5VdnEs4eZH4/xwC+so8=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYUD-0000Zp-0P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:10 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5961B1FCFD;
 Mon, 29 Jan 2024 20:43:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B20A212FF7;
 Mon, 29 Jan 2024 20:43:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cq+xGA0OuGXiDAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:43:57 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:24 -0300
Message-ID: <20240129204330.32346-7-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204330.32346-1-krisman@suse.de>
References: <20240129204330.32346-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5961B1FCFD
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
 Content preview:  Now that we do more than just clear the DCACHE_NOKEY_NAME
 in fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
 extra costs. Note that VFS will call this function for any dentry, whether
 the volume has fscrypt on not. But, since we only care about DCACHE_NOKEY_NAME,
 we can check for that, to avoid touching the superblock fo [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYUD-0000Zp-0P
Subject: [f2fs-dev] [PATCH v5 06/12] fscrypt: Ignore plaintext dentries
 during d_move
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

Now that we do more than just clear the DCACHE_NOKEY_NAME in
fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
extra costs.

Note that VFS will call this function for any dentry, whether the volume
has fscrypt on not.  But, since we only care about DCACHE_NOKEY_NAME, we
can check for that, to avoid touching the superblock for other fields
that identify a fscrypt volume.

Note also that fscrypt_handle_d_move is hopefully inlined back into
__d_move, so the call cost is not significant.  Considering that
DCACHE_NOKEY_NAME is a fscrypt-specific flag, we do the check in fscrypt
code instead of the caller.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
Changes since v4:
  - Check based on the dentry itself (eric)
---
 include/linux/fscrypt.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c1e285053b3e..ab668760d63e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -232,6 +232,15 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
  */
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
+	/*
+	 * VFS calls fscrypt_handle_d_move even for non-fscrypt
+	 * filesystems.  Since we only care about DCACHE_NOKEY_NAME
+	 * dentries here, check that to bail out quickly, if possible.
+	 */
+	if (!(dentry->d_flags & DCACHE_NOKEY_NAME))
+		return;
+
+	 /* Mark the dentry as a plaintext dentry. */
 	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
 
 	/*
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
