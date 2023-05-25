Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223F7109BF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:16:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q281M-0008Hx-TE;
	Thu, 25 May 2023 10:16:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q281L-0008HU-5A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1a706nvJAUFN5XV8S/WpIDOKkkOdApV/Ro1TI96n07M=; b=L1LuY6Tnhv/PdQ2IO9g4Y3tboy
 zZV1F7iyuFZikfWhfd1Tt3h+F4ezleV9zm8120bNKi2Ddbft3zRdOVWsf4HQ8VzbkV04VVoJMKgyZ
 Bw9og953lwA7L458HVGpT3qRVEm7svFFEzlubTXpL+RKx4KmiQsSTojLxUuGdkDUWZ+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1a706nvJAUFN5XV8S/WpIDOKkkOdApV/Ro1TI96n07M=; b=MPdSpFKcPzD49sJgMBXloG1RFj
 TLUMjXS68RboNmZ63na1r8f2paBagfNtAwQRPU4bfTn3b+u64HW4VnrL2DUtT345xJryx1rnH5nqh
 zNlpIk5EcZgxd/XNwfSyifVbalnceo//MbRaoXtActXx4y7sNmMubyu5tNA0k+h3RnpY=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q281J-0004Ur-Jj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DE951FDF3;
 Thu, 25 May 2023 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685009785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1a706nvJAUFN5XV8S/WpIDOKkkOdApV/Ro1TI96n07M=;
 b=WF7ucq3EohcQN4Zdd0uT/fFdsa8wjWrK6l6vxoEqctxmlkzB4ooSOvY3VcWiLa7+g34cR7
 VHGXOHjAnbf4SezXiEu502plqKbzYSjzLI+GLpNq6EMLCFyQWC9aoWbaU2jBGH1ViU5jHp
 /fK4tgoaDvoCBgCm/w1TLpScqmvNKDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685009785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1a706nvJAUFN5XV8S/WpIDOKkkOdApV/Ro1TI96n07M=;
 b=eqqvROyawmipPY/sh6fIFMu5wo+Um28Jle2T5lFkcvKQAMEfANT86QA5ChAiT5SwmD3TWy
 Hd/7Jpd5YLdKclCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF0BE13A83;
 Thu, 25 May 2023 10:16:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8gEyOng1b2RFdgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 May 2023 10:16:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 67514A0763; Thu, 25 May 2023 12:16:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 25 May 2023 12:16:10 +0200
Message-Id: <20230525101624.15814-4-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230525100654.15069-1-jack@suse.cz>
References: <20230525100654.15069-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255; i=jack@suse.cz;
 h=from:subject; bh=7Zjx87tnvKzgfzM5iEQSkxMSNXquNjJWVKfK0RapY3g=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkbzVppUsaG0BgBchvbsn9Z5bJBxKa6RWvd1b3zeFa
 aJovYjWJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZG81aQAKCRCcnaoHP2RA2VFZCA
 DDEhaZsVxenuLiK64HlnVAlGnOmVGorNpQmXxPET1UHzPGs0Tow9+aBVymq+BRY1IOFoG8IaiJGPJa
 YBEyFb3TIXNXqluOIIw9AACBYYnTUh0D9dKdbUJ+K3o6hA10l61kbLpwHwSAAE06kMKTyopzZ4j+Im
 ClMZ8FfO6c39OhKTvpnZ5rjAgYMaKkn/Pb4Z0kOMLWgk092TwOaBDvXh7sunqQeXdg21fvTP4ISZtO
 9EpoYoqZ7WT2j0eNE/o6GWWfL0mhvjsankyL4hgCxFkZoBEU9SkORA8MPexpHhI0zsapm72Uvdk/jn
 IKbtyKkJ43wtrM4E999/0WmIDFKUch
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently the locking order of inode locks for directories
 that are not in ancestor relationship is not defined because all operations
 that needed to lock two directories like this were serialized by [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q281J-0004Ur-Jj
Subject: [f2fs-dev] [PATCH 4/6] fs: Establish locking order for unrelated
 directories
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

Currently the locking order of inode locks for directories that are not
in ancestor relationship is not defined because all operations that
needed to lock two directories like this were serialized by
sb->s_vfs_rename_mutex. However some filesystems need to lock two
subdirectories for RENAME_EXCHANGE operations and for this we need the
locking order established even for two tree-unrelated directories.
Provide a helper function lock_two_inodes() that establishes lock
ordering for any two inodes and use it in lock_two_directories().

CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/inode.c    | 34 ++++++++++++++++++++++++++++++++++
 fs/internal.h |  2 ++
 fs/namei.c    |  4 ++--
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 577799b7855f..2015fa50d34a 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1103,6 +1103,40 @@ void discard_new_inode(struct inode *inode)
 }
 EXPORT_SYMBOL(discard_new_inode);
 
+/**
+ * lock_two_inodes - lock two inodes (may be regular files but also dirs)
+ *
+ * Lock any non-NULL argument. The caller must make sure that if he is passing
+ * in two directories, one is not ancestor of the other.  Zero, one or two
+ * objects may be locked by this function.
+ *
+ * @inode1: first inode to lock
+ * @inode2: second inode to lock
+ * @subclass1: inode lock subclass for the first lock obtained
+ * @subclass2: inode lock subclass for the second lock obtained
+ */
+void lock_two_inodes(struct inode *inode1, struct inode *inode2,
+		     unsigned subclass1, unsigned subclass2)
+{
+	if (!inode1 || !inode2)
+		goto lock;
+
+	/*
+	 * If one object is directory and the other is not, we must make sure
+	 * to lock directory first as the other object may be its child.
+	 */
+	if (S_ISDIR(inode2->i_mode) == S_ISDIR(inode1->i_mode)) {
+		if (inode1 > inode2)
+			swap(inode1, inode2);
+	} else if (!S_ISDIR(inode1->i_mode))
+		swap(inode1, inode2);
+lock:
+	if (inode1)
+		inode_lock_nested(inode1, subclass1);
+	if (inode2 && inode2 != inode1)
+		inode_lock_nested(inode2, subclass2);
+}
+
 /**
  * lock_two_nondirectories - take two i_mutexes on non-directory objects
  *
diff --git a/fs/internal.h b/fs/internal.h
index bd3b2810a36b..377030a50aca 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -152,6 +152,8 @@ extern long prune_icache_sb(struct super_block *sb, struct shrink_control *sc);
 int dentry_needs_remove_privs(struct mnt_idmap *, struct dentry *dentry);
 bool in_group_or_capable(struct mnt_idmap *idmap,
 			 const struct inode *inode, vfsgid_t vfsgid);
+void lock_two_inodes(struct inode *inode1, struct inode *inode2,
+		     unsigned subclass1, unsigned subclass2);
 
 /*
  * fs-writeback.c
diff --git a/fs/namei.c b/fs/namei.c
index e4fe0879ae55..148570aabe74 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3028,8 +3028,8 @@ static struct dentry *lock_two_directories(struct dentry *p1, struct dentry *p2)
 		return p;
 	}
 
-	inode_lock_nested(p1->d_inode, I_MUTEX_PARENT);
-	inode_lock_nested(p2->d_inode, I_MUTEX_PARENT2);
+	lock_two_inodes(p1->d_inode, p2->d_inode,
+			I_MUTEX_PARENT, I_MUTEX_PARENT2);
 	return NULL;
 }
 
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
