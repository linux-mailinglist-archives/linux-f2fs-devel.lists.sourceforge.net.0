Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0CAF8462
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 01:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyO9NYW9BFSIB3vKh6eN2N+iKrFC7CwZA755oquyymM=; b=KbVg0t0dzl25txy3ngJUH5PFg9
	hxaRhbbkfjRgh/CZt/xuV9nvGV77SMTX/g1iJhR79lmHmYd+uhxWZfid0QGOriWxVonZ7jMCm+3OK
	RDZQp/wCT3h0WsJIcHyIE0s1P9uLtWS8zN39bO8rTO86Kr16XUiUJrqxJNEF8FRk/j0U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXTZs-0007yW-4L;
	Thu, 03 Jul 2025 23:42:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wqu@suse.com>) id 1uXTZq-0007yM-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 23:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2cTMOFVLSi4FOef+mXjpJX0bB1CSMTiFxQSLfegoq9s=; b=L2NLLo9iX768gCEypCAuVLyupo
 3/EM2Hrijw7x2J6E4MSvxIVR7oHeoV/xAkChxQaxSqbgqZxoBjJH74PEOaGJ/x87H9KIp+mcQsF6m
 N+f7jwNqve9IUszV+wmiUIqo+r1v0YMtqoV9k9FHHeLS9VCWgNIUn5k4DFcbVnpciQ5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2cTMOFVLSi4FOef+mXjpJX0bB1CSMTiFxQSLfegoq9s=; b=jiGLYuPd0112A35qmbiPkd92td
 Bbj64typSwWTUu3XRlMR+Fk74CgWZpRdnwCKgyIS65VrMHehiA9Vpvq8nA/ookdySPmJgNny4POoZ
 xWnX8ntZJ0G2oYLcABne6N+N5yYrwm0WojQq+CXUMCumJbr2ZTLXhI6kkAvzyl4mdXtI=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uXTZp-0003Np-4J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 23:42:49 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75C7821194;
 Thu,  3 Jul 2025 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1751586162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cTMOFVLSi4FOef+mXjpJX0bB1CSMTiFxQSLfegoq9s=;
 b=Pjpktw/lT+xJqkXdI3zl48reol5Jf6DcEcYjYwAv9txtDMmY6rWSk0+w0DF4hMADHjE/N4
 rhCyomWDKODbED9S3pPJglrGxhwXYAjFNepgmy3jlS6D1FlJEIOE80BVnzn0BbTvo5fbE1
 RClDc8lKj1Tq6SBQIi+yrKrvHzmaNlE=
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.com header.s=susede1 header.b="Pjpktw/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1751586162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cTMOFVLSi4FOef+mXjpJX0bB1CSMTiFxQSLfegoq9s=;
 b=Pjpktw/lT+xJqkXdI3zl48reol5Jf6DcEcYjYwAv9txtDMmY6rWSk0+w0DF4hMADHjE/N4
 rhCyomWDKODbED9S3pPJglrGxhwXYAjFNepgmy3jlS6D1FlJEIOE80BVnzn0BbTvo5fbE1
 RClDc8lKj1Tq6SBQIi+yrKrvHzmaNlE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCC6013721;
 Thu,  3 Jul 2025 23:42:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OBeHH28VZ2j7AQAAD6G6ig
 (envelope-from <wqu@suse.com>); Thu, 03 Jul 2025 23:42:39 +0000
To: linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Date: Fri,  4 Jul 2025 09:12:14 +0930
Message-ID: <cbe06b06a2fe4c4e0c90fc86503efc06080e6bc8.1751577459.git.wqu@suse.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751577459.git.wqu@suse.com>
References: <cover.1751577459.git.wqu@suse.com>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_NONE(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email,suse.com:mid,suse.com:dkim,suse.com:email];
 DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 75C7821194
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently all the filesystems implementing the
 super_opearations::shutdown()
 call back can not afford losing a device. Thus fs_bdev_mark_dead() will just
 call the shutdown() callback for the involved filesystem. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uXTZp-0003Np-4J
Subject: [f2fs-dev] [PATCH v3 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <wqu@suse.com>
Cc: brauner@kernel.org, linux-ext4@vger.kernel.org, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently all the filesystems implementing the
super_opearations::shutdown() call back can not afford losing a device.

Thus fs_bdev_mark_dead() will just call the shutdown() callback for the
involved filesystem.

But it will no longer be the case, with multi-device filesystems like
btrfs and bcachefs the filesystem can handle certain device loss without
shutting down the whole filesystem.

To allow those multi-device filesystems to be integrated to use
fs_holder_ops:

- Rename shutdown() call back to remove_bdev()
  To better describe when the call back is called.

- Add a new @bdev parameter to remove_bdev() callback
  To allow the fs to determine which device is missing, and do the
  proper handling when needed.

For the existing shutdown callback users, the change is minimal.

They only need to follow the rename and the new parameter list.
Since the behavior is still to shutdown the fs, they shouldn't change
their function names.

This has a good side effect that, a single line like
".remove_bdev = ext4_shutdown," will easily show the fs behavior and
indicate the fs will shutdown when a device went missing.

Btrfs is going to implement the callback soon, which will either
shutdown the fs or continue read-write operations.

Cc: linux-fsdevel@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: ntfs3@lists.linux.dev
Cc: linux-xfs@vger.kernel.org
Signed-off-by: Qu Wenruo <wqu@suse.com>
---
 fs/exfat/super.c   | 4 ++--
 fs/ext4/super.c    | 4 ++--
 fs/f2fs/super.c    | 4 ++--
 fs/ntfs3/super.c   | 6 +++---
 fs/super.c         | 4 ++--
 fs/xfs/xfs_super.c | 7 ++++---
 include/linux/fs.h | 7 ++++++-
 7 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 7ed858937d45..a0e11166b194 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -172,7 +172,7 @@ int exfat_force_shutdown(struct super_block *sb, u32 flags)
 	return 0;
 }
 
-static void exfat_shutdown(struct super_block *sb)
+static void exfat_remove_bdev(struct super_block *sb, struct block_device *bdev)
 {
 	exfat_force_shutdown(sb, EXFAT_GOING_DOWN_NOSYNC);
 }
@@ -202,7 +202,7 @@ static const struct super_operations exfat_sops = {
 	.put_super	= exfat_put_super,
 	.statfs		= exfat_statfs,
 	.show_options	= exfat_show_options,
-	.shutdown	= exfat_shutdown,
+	.remove_bdev	= exfat_remove_bdev,
 };
 
 enum {
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c7d39da7e733..d75b416401ae 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1456,7 +1456,7 @@ static void ext4_destroy_inode(struct inode *inode)
 			 EXT4_I(inode)->i_reserved_data_blocks);
 }
 
-static void ext4_shutdown(struct super_block *sb)
+static void ext4_remove_bdev(struct super_block *sb, struct block_device *bdev)
 {
        ext4_force_shutdown(sb, EXT4_GOING_FLAGS_NOLOGFLUSH);
 }
@@ -1620,7 +1620,7 @@ static const struct super_operations ext4_sops = {
 	.unfreeze_fs	= ext4_unfreeze,
 	.statfs		= ext4_statfs,
 	.show_options	= ext4_show_options,
-	.shutdown	= ext4_shutdown,
+	.remove_bdev	= ext4_remove_bdev,
 #ifdef CONFIG_QUOTA
 	.quota_read	= ext4_quota_read,
 	.quota_write	= ext4_quota_write,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bbf1dad6843f..8667af9f76e4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2640,7 +2640,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	return err;
 }
 
-static void f2fs_shutdown(struct super_block *sb)
+static void f2fs_remove_bdev(struct super_block *sb, struct block_device *bdev)
 {
 	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false, false);
 }
@@ -3264,7 +3264,7 @@ static const struct super_operations f2fs_sops = {
 	.unfreeze_fs	= f2fs_unfreeze,
 	.statfs		= f2fs_statfs,
 	.remount_fs	= f2fs_remount,
-	.shutdown	= f2fs_shutdown,
+	.remove_bdev	= f2fs_remove_bdev,
 };
 
 #ifdef CONFIG_FS_ENCRYPTION
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 920a1ab47b63..3e69dc805e3a 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -762,9 +762,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 }
 
 /*
- * ntfs_shutdown - super_operations::shutdown
+ * ntfs_remove_bdev - super_operations::remove_bdev
  */
-static void ntfs_shutdown(struct super_block *sb)
+static void ntfs_remove_bdev(struct super_block *sb, struct block_device *bdev)
 {
 	set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &ntfs_sb(sb)->flags);
 }
@@ -821,7 +821,7 @@ static const struct super_operations ntfs_sops = {
 	.put_super = ntfs_put_super,
 	.statfs = ntfs_statfs,
 	.show_options = ntfs_show_options,
-	.shutdown = ntfs_shutdown,
+	.remove_bdev = ntfs_remove_bdev,
 	.sync_fs = ntfs_sync_fs,
 	.write_inode = ntfs3_write_inode,
 };
diff --git a/fs/super.c b/fs/super.c
index 80418ca8e215..c972efb38f6a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1463,8 +1463,8 @@ static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
 		sync_filesystem(sb);
 	shrink_dcache_sb(sb);
 	evict_inodes(sb);
-	if (sb->s_op->shutdown)
-		sb->s_op->shutdown(sb);
+	if (sb->s_op->remove_bdev)
+		sb->s_op->remove_bdev(sb, bdev);
 
 	super_unlock_shared(sb);
 }
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 0bc4b5489078..8e307b036133 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1276,8 +1276,9 @@ xfs_fs_free_cached_objects(
 }
 
 static void
-xfs_fs_shutdown(
-	struct super_block	*sb)
+xfs_fs_remove_bdev(
+	struct super_block	*sb,
+	struct block_device	*bdev)
 {
 	xfs_force_shutdown(XFS_M(sb), SHUTDOWN_DEVICE_REMOVED);
 }
@@ -1308,7 +1309,7 @@ static const struct super_operations xfs_super_operations = {
 	.show_options		= xfs_fs_show_options,
 	.nr_cached_objects	= xfs_fs_nr_cached_objects,
 	.free_cached_objects	= xfs_fs_free_cached_objects,
-	.shutdown		= xfs_fs_shutdown,
+	.remove_bdev		= xfs_fs_remove_bdev,
 	.show_stats		= xfs_fs_show_stats,
 };
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index b085f161ed22..b08af63d2d4f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2367,7 +2367,12 @@ struct super_operations {
 				  struct shrink_control *);
 	long (*free_cached_objects)(struct super_block *,
 				    struct shrink_control *);
-	void (*shutdown)(struct super_block *sb);
+	/*
+	 * Called when block device @bdev belonging to @sb is removed.
+	 *
+	 * If the fs can't afford the device loss, it should be shutdown.
+	 */
+	void (*remove_bdev)(struct super_block *sb, struct block_device *bdev);
 };
 
 /*
-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
