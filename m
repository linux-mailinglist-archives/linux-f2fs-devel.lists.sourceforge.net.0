Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580284147B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:43:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYTw-0006Lo-JS;
	Mon, 29 Jan 2024 20:43:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYTu-0006Lh-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=; b=l5OjbBQXiBSofE2FDJkpBZZyGZ
 o7hE4txRCMCFEhft7LkZqf55phjS2f6vzA8YT/5HXM3LHr5tUvNsEmBJ551yoVsXmO3ivZpRn3G5i
 1buTPVz3RMxjqPmr16X0NspqBaI7vNjewrVmvJTf9q6FdQKo40XjGkH7FdDxOeU4MUFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=; b=cstsC6megsMcMDZ5VrrjIKaloG
 8GfS6bvYnhmw0W0W3YLQf0jmrY3wER/fT/XBcL+J1VFmmrP/WXTYueZVgjs1PDcD43PdhCDMQBi3P
 JBfJla+MQaf3FRcdyp4J4nhA2cHQVJfqtiIzwIKYLAoEH1OW1gLz9Jb1zu+5SZxlH1xc=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYTs-0000Ys-8Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C1A71F807;
 Mon, 29 Jan 2024 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=;
 b=LPtV3C+izNGrDLVkatnrku0+kAUtkEwZiRKUVh0yxUBU6yBT44Jk5CkhsO3mvpMdFb9a2E
 dN/R45rcIniGeyCARF5zlgzvcY/tI+wAdNhiV2oYqktUMBrCKzJVURTH5HtdbUgTL5HQt5
 4ekUdyrOZ5CRCDUfahJnO1SMhyHCfdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=;
 b=Pz6UbtSlxwQdRFrtYcTrP/0UBmY0IDFlV3m3pcAx/UAE/Vr+si8HUUCd+6QSOu2l0KgCCV
 /Ys+5GGtF3SwQABQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=;
 b=LPtV3C+izNGrDLVkatnrku0+kAUtkEwZiRKUVh0yxUBU6yBT44Jk5CkhsO3mvpMdFb9a2E
 dN/R45rcIniGeyCARF5zlgzvcY/tI+wAdNhiV2oYqktUMBrCKzJVURTH5HtdbUgTL5HQt5
 4ekUdyrOZ5CRCDUfahJnO1SMhyHCfdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWLoWz7nxQVTABtxNVN2ddgKtqXgJeF/RFCQQ5mld/o=;
 b=Pz6UbtSlxwQdRFrtYcTrP/0UBmY0IDFlV3m3pcAx/UAE/Vr+si8HUUCd+6QSOu2l0KgCCV
 /Ys+5GGtF3SwQABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D146A12FF7;
 Mon, 29 Jan 2024 20:43:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PxdCIf0NuGXHDAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:43:41 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:20 -0300
Message-ID: <20240129204330.32346-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204330.32346-1-krisman@suse.de>
References: <20240129204330.32346-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
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
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[16.38%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both fscrypt_prepare_lookup_dentry_partial and
 fscrypt_prepare_lookup_dentry
 will set DCACHE_NOKEY_NAME for dentries when the key is not available. Extract
 out a helper to set this flag in a single pl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYTs-0000Ys-8Z
Subject: [f2fs-dev] [PATCH v5 02/12] fscrypt: Factor out a helper to
 configure the lookup dentry
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

Both fscrypt_prepare_lookup_dentry_partial and
fscrypt_prepare_lookup_dentry will set DCACHE_NOKEY_NAME for dentries
when the key is not available. Extract out a helper to set this flag in
a single place, in preparation to also add the optimization that will
disable ->d_revalidate if possible.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/crypto/hooks.c       | 18 ++++++++----------
 include/linux/fscrypt.h | 10 ++++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 52504dd478d3..71463cef08f9 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -102,11 +102,8 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 	if (err && err != -ENOENT)
 		return err;
 
-	if (fname->is_nokey_name) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
+	fscrypt_prepare_lookup_dentry(dentry, fname->is_nokey_name);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
@@ -131,12 +128,13 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry)
 {
 	int err = fscrypt_get_encryption_info(dir, true);
+	bool is_nokey_name = false;
+
+	if (!err && !fscrypt_has_encryption_key(dir))
+		is_nokey_name = true;
+
+	fscrypt_prepare_lookup_dentry(dentry, is_nokey_name);
 
-	if (!err && !fscrypt_has_encryption_key(dir)) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
 	return err;
 }
 EXPORT_SYMBOL_GPL(fscrypt_prepare_lookup_partial);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 12f9e455d569..68ca8706483a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -948,6 +948,16 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
 	return 0;
 }
 
+static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
+						 bool is_nokey_name)
+{
+	if (is_nokey_name) {
+		spin_lock(&dentry->d_lock);
+		dentry->d_flags |= DCACHE_NOKEY_NAME;
+		spin_unlock(&dentry->d_lock);
+	}
+}
+
 /**
  * fscrypt_prepare_lookup() - prepare to lookup a name in a possibly-encrypted
  *			      directory
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
