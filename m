Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD2719A5E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g12-0005n1-TV;
	Thu, 01 Jun 2023 10:58:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g10-0005mq-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVCS2NXBW5ZH4HJiDG94f7/my/nZc/t1gaXommKhNSs=; b=G0bMQywPabS8MzMQ4iVYuU1FU2
 FJs2e1cIkuzksbRjz7E2Vs6xIKHmRAfqKJqxenUDCiwQBxZaxVdsZSS/T+SmLMuMdIE5ySj+G1jFE
 XZl8sjskOnzIiTAzyq8Y64VuD52pN3ZhnR8pEO1qODc9iptO6kQMUmq/2zZuG+XsZ8Vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WVCS2NXBW5ZH4HJiDG94f7/my/nZc/t1gaXommKhNSs=; b=f7sUNjhUltWqgph9To6V+1yp+f
 MFAl05EHzhqiD1lM6gkCU7TyzjY/fd4dhqeBalOMj9QZ3No5fEXQcEokVlGz13K4Fjt6mZqidihvj
 PLCc8cgze3NinNB7MgbtxBMGGiUbTnvSWKgsnKmYrk7nCaakK11EbVAEAz8+7TS+jr1c=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0u-008G6v-H3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:46 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 180AF2197E;
 Thu,  1 Jun 2023 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVCS2NXBW5ZH4HJiDG94f7/my/nZc/t1gaXommKhNSs=;
 b=sk8CUrc5W8W+ATmUeBoPtRVc2tLcmAeBXR1SKEKOL49RIImPQ2l8GCKekmntDiWQ1S01Ol
 x54+S6D7tJs6K+3+W/W78Wk95ZdRxqQncjP7g1bn9yzeOCmRmxmlDEh757NsaZ7VdX9tVa
 +5BBgseIuW58hljimTAc28c8g2lt1nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVCS2NXBW5ZH4HJiDG94f7/my/nZc/t1gaXommKhNSs=;
 b=s2Ncj+jC+LWCSSYtcD2/hbX1MZeKwUEnf5kIdxKy9neWgXvER8vXh4BvHoC7nLPnGfbPsT
 G09K2PkXlnZg9vDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A35613441;
 Thu,  1 Jun 2023 10:58:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BpuIAtd5eGSAWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:31 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 27813A0763; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:25 +0200
Message-Id: <20230601105830.13168-5-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5467; i=jack@suse.cz;
 h=from:subject; bh=x4FZJj19EKHfl9vXc7blu9EGaRK3J4g/IYXgMMiRgsg=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkeHnQOagY8JFtxmxrH4yOG15iOHj85ARzmW1mO6z6
 m4CoTtqJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZHh50AAKCRCcnaoHP2RA2fOmCA
 CGZ/60qBrc6mq5kJuPlRk9zqrA938OweaDejgjB5rj/+wPTCG423XQxEjq785RwCe9imbIcJywyI89
 A0pan5qcfnH3LTQfSvu8g6Jnn/hUJIc/ZMpljEw2EQVWXfo3gjmfNtu2Nv80yeCWEt+RhRaifk2PpA
 FLUIaavbPKYMxQ68HJ0IAdihcEEjPMCnTBQNJYwjkR9+2RDhPtxB05Dxbx7SoLrQG4CyCnR0UNvBFu
 VouTBcwwyqv4irtxgwlnroN7k242fLUWgmWkRIlxkPK3MjdN2wTxLC4YYJ1BQ6HnnVZewXTrQEWlUP
 Sx2kjy7KuoAPi36BlrAAF2PUdusf8G
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When a directory is moved to a different directory,
 some filesystems
 (udf, ext4, ocfs2, f2fs, and likely gfs2, reiserfs, and others) need to update
 their pointer to the parent and this must not race w [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4g0u-008G6v-H3
Subject: [f2fs-dev] [PATCH v2 5/6] fs: Lock moved directories
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

When a directory is moved to a different directory, some filesystems
(udf, ext4, ocfs2, f2fs, and likely gfs2, reiserfs, and others) need to
update their pointer to the parent and this must not race with other
operations on the directory. Lock the directories when they are moved.
Although not all filesystems need this locking, we perform it in
vfs_rename() because getting the lock ordering right is really difficult
and we don't want to expose these locking details to filesystems.

CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 .../filesystems/directory-locking.rst         | 26 ++++++++++---------
 fs/namei.c                                    | 22 ++++++++++------
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/Documentation/filesystems/directory-locking.rst b/Documentation/filesystems/directory-locking.rst
index 504ba940c36c..dccd61c7c5c3 100644
--- a/Documentation/filesystems/directory-locking.rst
+++ b/Documentation/filesystems/directory-locking.rst
@@ -22,12 +22,11 @@ exclusive.
 3) object removal.  Locking rules: caller locks parent, finds victim,
 locks victim and calls the method.  Locks are exclusive.
 
-4) rename() that is _not_ cross-directory.  Locking rules: caller locks
-the parent and finds source and target.  In case of exchange (with
-RENAME_EXCHANGE in flags argument) lock both.  In any case,
-if the target already exists, lock it.  If the source is a non-directory,
-lock it.  If we need to lock both, lock them in inode pointer order.
-Then call the method.  All locks are exclusive.
+4) rename() that is _not_ cross-directory.  Locking rules: caller locks the
+parent and finds source and target.  We lock both (provided they exist).  If we
+need to lock two inodes of different type (dir vs non-dir), we lock directory
+first.  If we need to lock two inodes of the same type, lock them in inode
+pointer order.  Then call the method.  All locks are exclusive.
 NB: we might get away with locking the source (and target in exchange
 case) shared.
 
@@ -44,15 +43,17 @@ All locks are exclusive.
 rules:
 
 	* lock the filesystem
-	* lock parents in "ancestors first" order.
+	* lock parents in "ancestors first" order. If one is not ancestor of
+	  the other, lock them in inode pointer order.
 	* find source and target.
 	* if old parent is equal to or is a descendent of target
 	  fail with -ENOTEMPTY
 	* if new parent is equal to or is a descendent of source
 	  fail with -ELOOP
-	* If it's an exchange, lock both the source and the target.
-	* If the target exists, lock it.  If the source is a non-directory,
-	  lock it.  If we need to lock both, do so in inode pointer order.
+	* Lock both the source and the target provided they exist. If we
+	  need to lock two inodes of different type (dir vs non-dir), we lock
+	  the directory first. If we need to lock two inodes of the same type,
+	  lock them in inode pointer order.
 	* call the method.
 
 All ->i_rwsem are taken exclusive.  Again, we might get away with locking
@@ -66,8 +67,9 @@ If no directory is its own ancestor, the scheme above is deadlock-free.
 
 Proof:
 
-	First of all, at any moment we have a partial ordering of the
-	objects - A < B iff A is an ancestor of B.
+	First of all, at any moment we have a linear ordering of the
+	objects - A < B iff (A is an ancestor of B) or (B is not an ancestor
+        of A and ptr(A) < ptr(B)).
 
 	That ordering can change.  However, the following is true:
 
diff --git a/fs/namei.c b/fs/namei.c
index 148570aabe74..6a5e26a529e1 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4731,7 +4731,7 @@ SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *, newname
  *	   sb->s_vfs_rename_mutex. We might be more accurate, but that's another
  *	   story.
  *	c) we have to lock _four_ objects - parents and victim (if it exists),
- *	   and source (if it is not a directory).
+ *	   and source.
  *	   And that - after we got ->i_mutex on parents (until then we don't know
  *	   whether the target exists).  Solution: try to be smart with locking
  *	   order for inodes.  We rely on the fact that tree topology may change
@@ -4815,10 +4815,16 @@ int vfs_rename(struct renamedata *rd)
 
 	take_dentry_name_snapshot(&old_name, old_dentry);
 	dget(new_dentry);
-	if (!is_dir || (flags & RENAME_EXCHANGE))
-		lock_two_nondirectories(source, target);
-	else if (target)
-		inode_lock(target);
+	/*
+	 * Lock all moved children. Moved directories may need to change parent
+	 * pointer so they need the lock to prevent against concurrent
+	 * directory changes moving parent pointer. For regular files we've
+	 * historically always done this. The lockdep locking subclasses are
+	 * somewhat arbitrary but RENAME_EXCHANGE in particular can swap
+	 * regular files and directories so it's difficult to tell which
+	 * subclasses to use.
+	 */
+	lock_two_inodes(source, target, I_MUTEX_NORMAL, I_MUTEX_NONDIR2);
 
 	error = -EPERM;
 	if (IS_SWAPFILE(source) || (target && IS_SWAPFILE(target)))
@@ -4866,9 +4872,9 @@ int vfs_rename(struct renamedata *rd)
 			d_exchange(old_dentry, new_dentry);
 	}
 out:
-	if (!is_dir || (flags & RENAME_EXCHANGE))
-		unlock_two_nondirectories(source, target);
-	else if (target)
+	if (source)
+		inode_unlock(source);
+	if (target)
 		inode_unlock(target);
 	dput(new_dentry);
 	if (!error) {
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
