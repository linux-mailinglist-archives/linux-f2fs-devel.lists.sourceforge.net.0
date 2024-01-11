Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780982B771
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 23:59:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO41I-0001tp-Bp;
	Thu, 11 Jan 2024 22:59:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rO41G-0001tQ-31
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=; b=dC5MQkZPOq/XfOPejSYw43FA4g
 MrzwdHQ+Kojp8HMgPUKy9f2T/IMc0sJitaSXZSYU81uk9Xm4DHUrnYJW45fV3t8A0wuPJ/NrLdogk
 syNnppAJiLmGlyIsQZsbWxDWs4FFnxzCmj33551+e+2XDyuwz7LO5uDSzVfqi1RTLP0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=; b=FLtqowOOUSjWn43gXR69mfbJsX
 ZkaMwuVDne7FYIMCvXAxwsKfoZl4KrdxWJlmtlH7Z9Y6jh24KQfki6XcTM9NwEy1xI9uv6cBw10eJ
 JAj8m2PsSa/MM/JZ/vykOaJgeW7W4mrV/qABuPvRER0OLAVb5fohJ60/4fUl6pV4TSa4=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rO41B-0005yV-MH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:26 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BCE932224D;
 Thu, 11 Jan 2024 22:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=;
 b=WcFNgjj/j18Ww48IbCgHqwwfcEOz8PjCwYlTi38LI9E6WR4pEW58QHtPWWkNnFQ2786Ye0
 YYUIhroZx7jHTT0jt4QH18/K8oDi8FIOdfCss1jYAY8LNOem0nNTDb5M50MiVU8HSCQS5v
 Q+uqxy+1O9yT5mZ8aE0Ggx4QVDELVhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=;
 b=eJoenAAPc87+EMezQPd1TW8LiD2FPHgttszfN4mNiIu4OwptlcFT/dYuMhGBvVW6MZDp01
 8BDRg4DrOBNAIUBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=;
 b=WcFNgjj/j18Ww48IbCgHqwwfcEOz8PjCwYlTi38LI9E6WR4pEW58QHtPWWkNnFQ2786Ye0
 YYUIhroZx7jHTT0jt4QH18/K8oDi8FIOdfCss1jYAY8LNOem0nNTDb5M50MiVU8HSCQS5v
 Q+uqxy+1O9yT5mZ8aE0Ggx4QVDELVhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krPNAWpEhdO9kMaWrWqIUhp9mxXxNNl19QSIc2wCsrs=;
 b=eJoenAAPc87+EMezQPd1TW8LiD2FPHgttszfN4mNiIu4OwptlcFT/dYuMhGBvVW6MZDp01
 8BDRg4DrOBNAIUBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EC7113946;
 Thu, 11 Jan 2024 22:59:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0FjwAcNyoGV9LwAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 11 Jan 2024 22:59:15 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Thu, 11 Jan 2024 19:58:16 -0300
Message-ID: <20240111225816.18117-11-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111225816.18117-1-krisman@suse.de>
References: <20240111225816.18117-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzk7q5dcbbphp39zi8hi5jhbt)];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.sourceforge.net,vger.kernel.org,gmail.com,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No filesystems depend on it anymore, and it is generally a
 bad idea. Since all dentries should have the same set of dentry operations
 in case-insensitive filesystems, it should be propagated through - [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rO41B-0005yV-MH
Subject: [f2fs-dev] [PATCH v3 10/10] libfs: Drop
 generic_set_encrypted_ci_d_ops
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

No filesystems depend on it anymore, and it is generally a bad idea.
Since all dentries should have the same set of dentry operations in
case-insensitive filesystems, it should be propagated through ->s_d_op.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/libfs.c         | 34 ----------------------------------
 include/linux/fs.h |  1 -
 2 files changed, 35 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 9cd4df6969d2..c5c92ac76ba7 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1788,40 +1788,6 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 };
 #endif
 
-/**
- * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
- * @dentry:	dentry to set ops on
- *
- * Casefolded directories need d_hash and d_compare set, so that the dentries
- * contained in them are handled case-insensitively.  Note that these operations
- * are needed on the parent directory rather than on the dentries in it, and
- * while the casefolding flag can be toggled on and off on an empty directory,
- * dentry_operations can't be changed later.  As a result, if the filesystem has
- * casefolding support enabled at all, we have to give all dentries the
- * casefolding operations even if their inode doesn't have the casefolding flag
- * currently (and thus the casefolding ops would be no-ops for now).
- *
- * Encryption works differently in that the only dentry operation it needs is
- * d_revalidate, which it only needs on dentries that have the no-key name flag.
- * The no-key flag can't be set "later", so we don't have to worry about that.
- */
-void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
-{
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (dentry->d_sb->s_encoding) {
-		d_set_d_op(dentry, &generic_ci_dentry_ops);
-		return;
-	}
-#endif
-#ifdef CONFIG_FS_ENCRYPTION
-	if (dentry->d_flags & DCACHE_NOKEY_NAME) {
-		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
-		return;
-	}
-#endif
-}
-EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
-
 /**
  * generic_set_sb_d_ops - helper for choosing the set of
  * filesystem-wide dentry operations for the enabled features
diff --git a/include/linux/fs.h b/include/linux/fs.h
index c985d9392b61..c0cfc53f95bb 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3201,7 +3201,6 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
-extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 extern void generic_set_sb_d_ops(struct super_block *sb);
 
 static inline bool sb_has_encoding(const struct super_block *sb)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
