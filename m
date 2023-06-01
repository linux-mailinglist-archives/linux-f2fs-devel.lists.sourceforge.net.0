Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF8719A60
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g13-00064j-T5;
	Thu, 01 Jun 2023 10:58:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g12-00064X-Ls
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GkePM4DubixxF/Togl9EDjSplXJHzVlt1TjjubXI6U=; b=He9lnMDLJg+iFCMrsOhQrQTu/y
 lrxl4csZWxcLjsBWGVV4DnMUCnMiCyvdHseiJIAlmIBChrYe01/dg0E4lP8xnkdq0MfoDyZa/2sQ/
 wNJdyhCObSlyhwhmww8G+jKOWi0Il4YmXg0gCR/SBs9snJnRKaNcVzteHy4Wqlpr5lJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9GkePM4DubixxF/Togl9EDjSplXJHzVlt1TjjubXI6U=; b=DfKVXUCv8sDN/yHMloBo6sb3Zg
 xs/Q53+dL3PP2v9rCyC41dobFRmAIw/oz7ySiV6naQMO+UfgywQo6fnXfROUdT5/BEDeF5K6+GRhD
 idgvIajSnUxFV7PLKT1iA8t9etFPk7T1EMv/IJ6/uzc7fPnFbSflAUlH4PsPN8V3Y/b4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0z-0005t2-9j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:47 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BED651FDA8;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GkePM4DubixxF/Togl9EDjSplXJHzVlt1TjjubXI6U=;
 b=slatgofTC1FAmauPjXvaRavFj1ucK0rmX6U3pkMK7g8nnmx0Jo/kPtINHqLNXw7GUbwb1w
 /ztD5ytaQnOXlejb0d4lmm7cfRqFIKFN7+b1BzZ+hSlyw6VPDv8T6ZTn0jHFKTjUi32r0b
 HyxQ2KcxqucQD2QVIBQ6/adQk9TM9Wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GkePM4DubixxF/Togl9EDjSplXJHzVlt1TjjubXI6U=;
 b=+PZusY3/jcoS/JUtfNuVliL6Ytt+jkK3M6rPOZB1ovGNIOIvQy1cZP0jFs/SQOjbk2U4cW
 fRa4ig8VkCobYsBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B060513A34;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kqQMK9Z5eGRzWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 23FB1A0762; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:24 +0200
Message-Id: <20230601105830.13168-4-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3496; i=jack@suse.cz;
 h=from:subject; bh=5xE40J+PulDN9eVzw5lw6aBn+txq+yIpzvhj12wC0EY=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkeHnPY8LB6Lx7l0td+dFkItKAtx61uKArJSscpjR8
 raeoUD2JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZHh5zwAKCRCcnaoHP2RA2cjOB/
 9DhZsLwCaOA84pjyOo2bXNwruEQ6X3HjIwB8zJp9WHd8TLG9ud81Oc6FDDNJmY35Ub7hou0NB8b9XN
 /1hOOJvVjjumxLrI62LrSHiDVlHogm1aiZ0qEjxLGfQkNA/sl4m21EKgnm6IXMsRjFUo3Vo/zq6Qar
 jFG5pq7ToYOY79cf3zAMe5D3eiEXxC/OlE0ykzstffroAMZwmxvhuKnw1Mn1g1VUfJ4EV7PvLyiA5Z
 2eHvwxOzoVxM6fgw9IRhS5REEZdXLLJcSf2vYbBqinmAHS019XRmm9DoY4cNFd/pDOs2GeKKHCrARV
 ylAmHIYNsLlC/8HMRTjuuMkI8unfU5
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4g0z-0005t2-9j
Subject: [f2fs-dev] [PATCH v2 4/6] fs: Establish locking order for unrelated
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
 fs/inode.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
 fs/internal.h |  2 ++
 fs/namei.c    |  4 ++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 577799b7855f..4000ab08bbc0 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1103,6 +1103,48 @@ void discard_new_inode(struct inode *inode)
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
+		/*
+		 * Make sure @subclass1 will be used for the acquired lock.
+		 * This is not strictly necessary (no current caller cares) but
+		 * let's keep things consistent.
+		 */
+		if (!inode1)
+			swap(inode1, inode2);
+		goto lock;
+	}
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
