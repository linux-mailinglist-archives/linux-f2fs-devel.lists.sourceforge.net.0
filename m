Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C985E433
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 18:14:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcqBK-0006Pq-FC;
	Wed, 21 Feb 2024 17:14:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcqBI-0006Pf-RB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=; b=OxJsvjqtVamsHTjqMIj/43GdSb
 V/6908Mbj9+D6/gEPxyGRJY+Ooj5M4HADy1d131FxW+1bxpNroZPV5xfBg571S/Io+GRPBmD/Qf0/
 2mtJSLGSPg7e2nRSe4TyqiDbSA8nExeCBs0+JCRBWEiQcx5O3MGJrp00VVsCBlnAQ3e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=; b=jpkl3Sqpl+dS4iyArJ134zHCGh
 IMNZ8E7pNLUIOWIJYSjyu/+JMXWLtpprugARLgDOsnJ7LLlk4XHrzbtufd9R8YI6oazDFe1UXWBMZ
 TxBd//RHyFquVswgIl8ZLTz29rOHtDymHax8K9lJbCsimGP3DHqG3d+F7WXfdInuJZhU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcqBG-00029p-NA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:52 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CC1A21DC8;
 Wed, 21 Feb 2024 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708535680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=;
 b=vroX+M9eWVEC+BMI4lef7/fkcVx3XMMbAfBv4K5jTSwXOxiZCoHYjbqeNARYtZIjLKKE31
 9PkXrg2yeljAY1Ss+V/dt5Fe+bfIqAea1Xl/1J89TaEypqt5PQcEF6BMKw+LUHyx9xN5Rc
 Yjo9m4xTt2FLG76XlY89lkfTeEBa8lo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708535680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=;
 b=LC4YD44f750zHoezml6rAHh9Ug+undgo8yI5X9vqtnbkfOWR4e6MllBOQS4MkgnrXdvSyJ
 JYY1tJkGT5JHcODg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708535680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=;
 b=vroX+M9eWVEC+BMI4lef7/fkcVx3XMMbAfBv4K5jTSwXOxiZCoHYjbqeNARYtZIjLKKE31
 9PkXrg2yeljAY1Ss+V/dt5Fe+bfIqAea1Xl/1J89TaEypqt5PQcEF6BMKw+LUHyx9xN5Rc
 Yjo9m4xTt2FLG76XlY89lkfTeEBa8lo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708535680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=;
 b=LC4YD44f750zHoezml6rAHh9Ug+undgo8yI5X9vqtnbkfOWR4e6MllBOQS4MkgnrXdvSyJ
 JYY1tJkGT5JHcODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 534DF139D0;
 Wed, 21 Feb 2024 17:14:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JFRgDoAv1mVyKgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 21 Feb 2024 17:14:40 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk,
	jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 12:14:08 -0500
Message-ID: <20240221171412.10710-7-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
References: <20240221171412.10710-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.86 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net,kernel.org,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.04)[57.87%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.86
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to drop the similar helper that sets d_op at
 lookup time, add a version to set the right d_op filesystem-wide, through
 sb->s_d_op. The operations structures are shared across filesystem [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcqBG-00029p-NA
Subject: [f2fs-dev] [PATCH v7 06/10] libfs: Add helper to choose dentry
 operations at mount-time
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

In preparation to drop the similar helper that sets d_op at lookup time,
add a version to set the right d_op filesystem-wide, through sb->s_d_op.
The operations structures are shared across filesystems supporting
fscrypt and/or casefolding, therefore we can keep it in common libfs
code.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
changes since v3:
  - Fix typo in comment (Eric)
---
 fs/libfs.c         | 28 ++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index c4be0961faf0..0aa388ee82ff 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1822,6 +1822,34 @@ void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
 }
 EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
 
+/**
+ * generic_set_sb_d_ops - helper for choosing the set of
+ * filesystem-wide dentry operations for the enabled features
+ * @sb: superblock to be configured
+ *
+ * Filesystems supporting casefolding and/or fscrypt can call this
+ * helper at mount-time to configure sb->s_d_op to best set of dentry
+ * operations required for the enabled features. The helper must be
+ * called after these have been configured, but before the root dentry
+ * is created.
+ */
+void generic_set_sb_d_ops(struct super_block *sb)
+{
+#if IS_ENABLED(CONFIG_UNICODE)
+	if (sb->s_encoding) {
+		sb->s_d_op = &generic_ci_dentry_ops;
+		return;
+	}
+#endif
+#ifdef CONFIG_FS_ENCRYPTION
+	if (sb->s_cop) {
+		sb->s_d_op = &generic_encrypted_dentry_ops;
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_sb_d_ops);
+
 /**
  * inode_maybe_inc_iversion - increments i_version
  * @inode: inode with the i_version that should be updated
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e6667ece5e64..c985d9392b61 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3202,6 +3202,7 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
+extern void generic_set_sb_d_ops(struct super_block *sb);
 
 static inline bool sb_has_encoding(const struct super_block *sb)
 {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
