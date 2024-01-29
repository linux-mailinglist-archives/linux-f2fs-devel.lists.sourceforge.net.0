Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7762841488
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:44:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYUN-0002Kj-0V;
	Mon, 29 Jan 2024 20:44:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYUL-0002KU-JX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=; b=ihdWoBiLod//JhJdxNwMpXr5Ar
 7UAVKesWRzSSaYen/8+0gptgmgwuWQVBw/YifxplsSoHSQq5nqKX9jhhEeAw3enlyp29BZLfGWy5N
 dMPMT4+Uc1BohXTSwOUHR6L0yO45AqLtkDPWRmJOUt4VkPH6Ou30sAWgzaVofgJvn9+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S7ZNiObuWDS9LBRJ78fuLAlJGd+uQndWdyw51G7pKEU=; b=FB7uaim1nYF90lAemcXcB1b8DH
 PNfmckjGqAIeawtDjlAdUtkHpyvqu99pjnTc2pli9zhm/e8DVS5Ad2C+thxKN3N7s4/6HsrO/PC2Q
 ZyN1FXLS+hYz4NpYmxCcJ54wZBG3B/x6/ka9hqVAym+LI+Qzo7ju9WF/UmcC8OSf24gM=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYUK-0000aE-PH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:44:18 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25A342207E;
 Mon, 29 Jan 2024 20:44:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BB0612FF7;
 Mon, 29 Jan 2024 20:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k8BlDBUOuGXwDAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:44:05 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:26 -0300
Message-ID: <20240129204330.32346-9-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204330.32346-1-krisman@suse.de>
References: <20240129204330.32346-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 25A342207E
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to drop the similar helper that sets d_op at
 lookup time, add a version to set the right d_op filesystem-wide, through
 sb->s_d_op. The operations structures are shared across filesystem [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYUK-0000aE-PH
Subject: [f2fs-dev] [PATCH v5 08/12] libfs: Add helper to choose dentry
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
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
