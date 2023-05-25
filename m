Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E427109CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:16:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q281S-0006Pv-Gt;
	Thu, 25 May 2023 10:16:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q281O-0006Pa-VK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8ThI8pc0gEYM+rQf003qTc2rYTYbf8AIQ/C2gqIwQo=; b=lxzXeGEdf9PEW7pCrWKD7J8mHI
 RYhqKcSKLngYm6gAyiQPfvD0Bvm8gZ8OOUF7Pzb3+k82c0qmLkhUqeu06BDJyyQmthrSkbzF0+Nh8
 F5RXgXv/ZCzvx1texatQtaZyelJnOeZXTqyDDldcdI3wXLlNASCP74LTJ8ycwuyk+W6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8ThI8pc0gEYM+rQf003qTc2rYTYbf8AIQ/C2gqIwQo=; b=E+LAwW64hKCDNRDajtnDIzOlG8
 9o8FArggqbDRqFuAPZSJ+xoTMNOlpOhu5FEnYUHQRpe7T4h9mFNniZnMMMRtFNxUe+Z9ewcF4qcQl
 GIKDh3pqM96doaycdqVO9NhSyvz5/UYmhwy9WrAt1xBWQAgUCl/IFvZ4OOrhMto4MfV8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q281J-0004Uq-LP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:36 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E959C1FDA6;
 Thu, 25 May 2023 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685009784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8ThI8pc0gEYM+rQf003qTc2rYTYbf8AIQ/C2gqIwQo=;
 b=vGJRhYLBeDgm3lofus6jF2pH0QZ7csZBwE40esnbNlRfC4THd9PvZ3qgvGFQJKVy11bB4w
 St/MYo7op2w7g+8+kXwfXULEUy5qo6MxZi2CCoeBEJFIQ+YMtUxRwmfRgAyOtJ74ZCgQi0
 4UhDKWsBdUUniwIbGBE+xJMAkrCjTxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685009784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8ThI8pc0gEYM+rQf003qTc2rYTYbf8AIQ/C2gqIwQo=;
 b=vt5ytHCOONlo6sKwamNAQezf6EXKStak6uDeoYhEjUinoAW5zdwuas8fSHRdcgHO3ewCuA
 zSC88gXcCBxivjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D89B6134B2;
 Thu, 25 May 2023 10:16:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xGqPNHg1b2RCdgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 May 2023 10:16:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 62CA6A0762; Thu, 25 May 2023 12:16:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 25 May 2023 12:16:09 +0200
Message-Id: <20230525101624.15814-3-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230525100654.15069-1-jack@suse.cz>
References: <20230525100654.15069-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=jack@suse.cz;
 h=from:subject; bh=vkItO1SrB+pdJMx2hexFFd1udgUclLpxYk9h2ck+yss=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkbzVopRE2Fjl98U8Lrl0R5i/BOQo9DAUy4HoMvjC0
 F+Fj1NGJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZG81aAAKCRCcnaoHP2RA2WZNB/
 9+AYv+yBnOYkrzxnwkWw7wp/jqKoxKekJuoRaGKhr9jRSq38pa6+9y2XWOgY5i1gIA3134tHlBo5tU
 ENewvUXdIYWoAG0TeN86+UiZC7qH3NV/mEk9+MTpppXNJeR6+audbw7g+wKPuetxw9u38rC+SWtNLN
 mcFEGVm4ryCLgbFQ5sVqEfwtmc9i1c/1HoKb1fLWEPbJbyFQo6FwNwSYLzjnEJbg4g74zK8CWbr04H
 cWV9mUvwy1FHki5WFFIsaSamAFgdqZI+DCstqvh0PYdIDOwBZMcMbuhKm7GPRuEkaKGTrRE1QvOdX9
 dbDxF5I+XhQAFspQggY07qdTfg7BI8
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit d94772154e524b329a168678836745d2773a6e02.
 The locking is going to be provided by VFS. CC: Jaegeuk Kim
 <jaegeuk@kernel.org>
 CC: stable@vger.kernel.org Signed-off-by: Jan Kara <jack@suse.cz> ---
 fs/f2fs/namei.c
 | 16 + 1 file changed, 1 insertion(+), 15 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q281J-0004Uq-LP
Subject: [f2fs-dev] [PATCH 3/6] Revert "f2fs: fix potential corruption when
 moving a directory"
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit d94772154e524b329a168678836745d2773a6e02. The
locking is going to be provided by VFS.

CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/f2fs/namei.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 77a71276ecb1..ad597b417fea 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -995,20 +995,12 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 			goto out;
 	}
 
-	/*
-	 * Copied from ext4_rename: we need to protect against old.inode
-	 * directory getting converted from inline directory format into
-	 * a normal one.
-	 */
-	if (S_ISDIR(old_inode->i_mode))
-		inode_lock_nested(old_inode, I_MUTEX_NONDIR2);
-
 	err = -ENOENT;
 	old_entry = f2fs_find_entry(old_dir, &old_dentry->d_name, &old_page);
 	if (!old_entry) {
 		if (IS_ERR(old_page))
 			err = PTR_ERR(old_page);
-		goto out_unlock_old;
+		goto out;
 	}
 
 	if (S_ISDIR(old_inode->i_mode)) {
@@ -1116,9 +1108,6 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 	f2fs_unlock_op(sbi);
 
-	if (S_ISDIR(old_inode->i_mode))
-		inode_unlock(old_inode);
-
 	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir))
 		f2fs_sync_fs(sbi->sb, 1);
 
@@ -1133,9 +1122,6 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		f2fs_put_page(old_dir_page, 0);
 out_old:
 	f2fs_put_page(old_page, 0);
-out_unlock_old:
-	if (S_ISDIR(old_inode->i_mode))
-		inode_unlock(old_inode);
 out:
 	iput(whiteout);
 	return err;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
