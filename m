Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7098123A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 00:59:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDZ8N-00020Z-9A;
	Wed, 13 Dec 2023 23:59:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rDZ8L-00020S-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=; b=KHNhsH+XjydBfiE0P8KyfwayUx
 t0tWyPlD2724ouZdQOg3D+oudNTRlFFbmpal7mVVUczItr4AlNQGtXRu0QVxwWVozLBWYFEevyGtV
 q8BfQbDMa4X/Pkqxq+fRL2bKxe7McOcxaTwGTc/GkkNDMhswxo7cL/oh2poFsy82v1G8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wFdpRL19Qo72V5iD16rSLzA5DXdY7+DFwh/2hlpfLqI=; b=f9yuMnUof8GTlCCQ39IuCJ9Ymv
 FeDXT4YfwPx+WupGQLXujSohavAABZxo0pP7vMbArXuhOVfUzRmwaC2KnSUvn7IAdv9jQw8M3tMQm
 U0dkAkPIdg+C/AjXKGZZmromRnxrhQ7ZAbOm3oI1Mfjf6ictiJ18DiBN/AgjmRNkX/C0=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDZ8J-0007hm-ON for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D089822310;
 Wed, 13 Dec 2023 23:40:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D7FA1377F;
 Wed, 13 Dec 2023 23:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 44ZFG/pAemVlPgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 13 Dec 2023 23:40:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Wed, 13 Dec 2023 18:40:25 -0500
Message-ID: <20231213234031.1081-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213234031.1081-1-krisman@suse.de>
References: <20231213234031.1081-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: D089822310
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fscrypt dentries are always valid once the key is available.
 Since the key cannot be removed without evicting the dentry, we don't need
 to keep retrying to revalidate it. Signed-off-by: Gabriel Krisman Bertazi
 <krisman@suse.de> --- fs/crypto/fname.c | 9 ++++++++- 1 file changed,
 8 insertions(+), 1 deletion(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDZ8J-0007hm-ON
Subject: [f2fs-dev] [PATCH 2/8] fscrypt: Drop d_revalidate if key is
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
