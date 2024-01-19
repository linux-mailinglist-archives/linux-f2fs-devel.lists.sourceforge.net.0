Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D8832F25
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jan 2024 19:49:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQtvL-0005LC-9I;
	Fri, 19 Jan 2024 18:49:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rQtvH-0005Kg-5j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jan 2024 18:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RVHkl1+gHuQ53whsCv6aHWAEO4kmheKoUmT6NcMFQk8=; b=DtzflhdofsKlBTd50KJ7O8dJ/q
 t6Sw27MGJJpF+N6ZX2af9z5PPFglpK6glYJFBz1DF9HRy3vqBkJ70Joa4i4A66xYtS6hnZRoG5r+o
 ufwgmBHqxBscZDP8/HerUn1W/LrFtqarrxlJwHtHBdAjT5F4+eMu7RkumKISp9kQQZ2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RVHkl1+gHuQ53whsCv6aHWAEO4kmheKoUmT6NcMFQk8=; b=dTcUHQqwGSoghABbLJZgo9oNxh
 wLLFs5avCRk3SRoO4Zyb78TDpxCyWmAIXSAC/OQHrQAMYXncENUZEFxupAOHXn1Fe0ENGlJ4ktdgv
 8fEtRif1oumsOMGE8w2LbSwTyzddxhmewChiYhl6u35CLkKRdZimBjtdbaFEXAX6v66A=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rQtvE-0001ca-5v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jan 2024 18:48:57 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FADC1FD18;
 Fri, 19 Jan 2024 18:48:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE167136F5;
 Fri, 19 Jan 2024 18:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dz4FHQzEqmV1DAAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 19 Jan 2024 18:48:44 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 19 Jan 2024 15:47:41 -0300
Message-ID: <20240119184742.31088-10-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119184742.31088-1-krisman@suse.de>
References: <20240119184742.31088-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4FADC1FD18
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fscrypt now supports configuring dentry operations at
 dentry-creation
 time through the preset sb->s_d_op, instead of at lookup time. Enable this
 in ubifs, since the lookup-time mechanism is going away [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rQtvE-0001ca-5v
Subject: [f2fs-dev] [PATCH v3 09/10] ubifs: Configure dentry operations at
 dentry-creation time
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

fscrypt now supports configuring dentry operations at dentry-creation
time through the preset sb->s_d_op, instead of at lookup time.
Enable this in ubifs, since the lookup-time mechanism is going away.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/ubifs/dir.c   | 1 -
 fs/ubifs/super.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 3b13c648d490..51b9a10a9851 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -205,7 +205,6 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
-	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 09e270d6ed02..304646b03e99 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2239,6 +2239,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		goto out_umount;
 	}
 
+	generic_set_sb_d_ops(sb);
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		err = -ENOMEM;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
