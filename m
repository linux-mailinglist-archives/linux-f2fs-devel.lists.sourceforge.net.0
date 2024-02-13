Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB8852753
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 03:13:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZiIs-0001uf-3Q;
	Tue, 13 Feb 2024 02:13:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rZiIr-0001uZ-7K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=; b=OcSAlC17trC4gcovtxO723gbZ6
 1jJfdtMXSzigaXMA7N/YTBM44rpLwFQ34vgSeD8La9VQiDeUqud0jSQYh3XNpD6Vn/JMx05mVlaUg
 XvxsrQsYwlOwTwHT35HednWX9HWAY7FNHQ7D0ZIqM7zuPFAl+nW7GQQ7axf26IgWSTUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=; b=PxDL1SaAiamkN6ZnaYZFxaBt7s
 h6rhmphsBUwR+lPRKxW/kHRBEPubnKV6CEerhYShQ2utML9pG7uq6QXQmlhNTcSJL+846RCEH0Ah7
 ze0BLY6tzXpLbJVPUpCtdpfa/oW0vQnVRUMoaChdhFpvPt16a7vT2s/OoZtwdIPn1AXQ=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZiIq-00023Z-AC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E74121D85;
 Tue, 13 Feb 2024 02:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=;
 b=ibFle493A0fvOOEkOf5Zw6YILb1a/xlaJdNEeEnjqrdW/WCnHulUO0rNuePY2uW+h1MZ/w
 fDEBHKG9YX6VNAMXuJlHSgaso0RqC/dzHOlvaK1oLnIXJcHA+EUl6lyj9HPribCEa+zjbS
 eYoER4IJiHJ917FwIDDdclNwt3L+Xtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=;
 b=vNBVSpo2C+8m9aeEQ4Ptbp4XF28bBckOEVXjUnJmPJeiy1mkVqyfU3d/rCdH3KEdAdJnij
 NbPs54NJoLlg82Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=;
 b=ibFle493A0fvOOEkOf5Zw6YILb1a/xlaJdNEeEnjqrdW/WCnHulUO0rNuePY2uW+h1MZ/w
 fDEBHKG9YX6VNAMXuJlHSgaso0RqC/dzHOlvaK1oLnIXJcHA+EUl6lyj9HPribCEa+zjbS
 eYoER4IJiHJ917FwIDDdclNwt3L+Xtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5G03m8gBMLCKJSa0ZjoYUprI6wjRJAsMZ9XqZDtV8s=;
 b=vNBVSpo2C+8m9aeEQ4Ptbp4XF28bBckOEVXjUnJmPJeiy1mkVqyfU3d/rCdH3KEdAdJnij
 NbPs54NJoLlg82Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 536B213A4B;
 Tue, 13 Feb 2024 02:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sZb0DVLQymUSeAAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 13 Feb 2024 02:13:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk
Date: Mon, 12 Feb 2024 21:13:13 -0500
Message-ID: <20240213021321.1804-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213021321.1804-1-krisman@suse.de>
References: <20240213021321.1804-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ibFle493;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vNBVSpo2
X-Spamd-Result: default: False [4.69 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[39.82%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 8E74121D85
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++
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
X-Headers-End: 1rZiIq-00023Z-AC
Subject: [f2fs-dev] [PATCH v6 02/10] fscrypt: Factor out a helper to
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
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
changes since v6
  - Use inline comparison for is_nokey_name (eric)
  - rename fscrypt_prepare_lookup_dentry->fscrypt_prepare_dentry (eric)
---
 fs/crypto/hooks.c       | 15 +++++----------
 include/linux/fscrypt.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 52504dd478d3..104771c3d3f6 100644
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
+	fscrypt_prepare_dentry(dentry, fname->is_nokey_name);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
@@ -131,12 +128,10 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry)
 {
 	int err = fscrypt_get_encryption_info(dir, true);
+	bool is_nokey_name = (!err && !fscrypt_has_encryption_key(dir));
+
+	fscrypt_prepare_dentry(dentry, is_nokey_name);
 
-	if (!err && !fscrypt_has_encryption_key(dir)) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
 	return err;
 }
 EXPORT_SYMBOL_GPL(fscrypt_prepare_lookup_partial);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 12f9e455d569..47567a6a4f9d 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -948,6 +948,16 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
 	return 0;
 }
 
+static inline void fscrypt_prepare_dentry(struct dentry *dentry,
+					  bool is_nokey_name)
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
