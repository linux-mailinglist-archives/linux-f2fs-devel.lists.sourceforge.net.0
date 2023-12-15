Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5098151BF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:16:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEFXr-0000CW-BY;
	Fri, 15 Dec 2023 21:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rEFXp-0000CQ-KB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=; b=iIVkIuoeQZO5ot4LghA6hJOpIg
 P1l6fGJlmRPDsgbGK8UunfkVLUtGuh9nI8yp5VFvvNYsCmoK9fzpbTt/WcDRRY4A5aXJ7Sb1TcIRy
 7UhONSVsvQEyIeLKVhugqAyVUf3MsFUUv7GxcE5yt+Uy8ZtotesaC5sxBvi5v7BmnsEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=; b=KA7DPC3Xhy9FwVoYwePhSN2CDb
 bAtWsi8NWBRXNgdPsULdOniHanwp/682U7e8BMqhj39q37l4pG3+u/LQ140QJr4Eei0LObYY/fI2x
 IvJW5IoUkKj1UXh3J1KNDMckfmvHxsDvmMkS5uTHuoa8cTAWN6qhOiDBjXBZ8GuMdwFc=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEFXl-0001QO-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:28 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E9371F863;
 Fri, 15 Dec 2023 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=;
 b=0PbC4ieIDnc8k96lBUCBSBJdgMCggwUaTxtfGkWiKpTA+onRQVeH/wvJNqbTBJhULfz31x
 AHAeyRPrSmhlndlcGEMsxGayZpOQ21lXWdl8YIlQYM82j+c3gJXtcbpmpoGkgBQVSAmfup
 MoPFCWyBEcBkWTxMNPMy5OxwIGDGXaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=;
 b=5x41is8J3UjiUO+NUlXQDmmbb0nMC4xGU9RXf5QraFMqwbtqsyesZG9vAMu4ulJHXexC9q
 Yb8Zd3TXBw8bVzAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=;
 b=0PbC4ieIDnc8k96lBUCBSBJdgMCggwUaTxtfGkWiKpTA+onRQVeH/wvJNqbTBJhULfz31x
 AHAeyRPrSmhlndlcGEMsxGayZpOQ21lXWdl8YIlQYM82j+c3gJXtcbpmpoGkgBQVSAmfup
 MoPFCWyBEcBkWTxMNPMy5OxwIGDGXaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=;
 b=5x41is8J3UjiUO+NUlXQDmmbb0nMC4xGU9RXf5QraFMqwbtqsyesZG9vAMu4ulJHXexC9q
 Yb8Zd3TXBw8bVzAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D02A4137D4;
 Fri, 15 Dec 2023 21:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9nfHKyLCfGWMOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 15 Dec 2023 21:16:18 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 15 Dec 2023 16:16:02 -0500
Message-ID: <20231215211608.6449-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215211608.6449-1-krisman@suse.de>
References: <20231215211608.6449-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: 4.63
X-Spamd-Result: default: False [4.63 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.27)[73.94%]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fscrypt dentries are always valid once the key is available.
 Since the key cannot be removed without evicting the dentry, we don't need
 to keep retrying to revalidate it. Signed-off-by: Gabriel Krisman Bertazi
 <krisman@suse.de> --- fs/crypto/fname.c | 9 ++++++++- 1 file changed,
 8 insertions(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEFXl-0001QO-Sl
Subject: [f2fs-dev] [PATCH v2 2/8] fscrypt: Drop d_revalidate if key is
 available
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

fscrypt dentries are always valid once the key is available.  Since the
key cannot be removed without evicting the dentry, we don't need to keep
retrying to revalidate it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/crypto/fname.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 7b3fc189593a..0457ba2d7d76 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -591,8 +591,15 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 	 * reverting to no-key names without evicting the directory's inode
 	 * -- which implies eviction of the dentries in the directory.
 	 */
-	if (!(dentry->d_flags & DCACHE_NOKEY_NAME))
+	if (!(dentry->d_flags & DCACHE_NOKEY_NAME)) {
+		/*
+		 * If fscrypt is the only feature requiring
+		 * revalidation for this dentry, we can just disable it.
+		 */
+		if (dentry->d_op->d_revalidate == &fscrypt_d_revalidate)
+			d_set_always_valid(dentry);
 		return 1;
+	}
 
 	/*
 	 * No-key name; valid if the directory's key is still unavailable.
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
