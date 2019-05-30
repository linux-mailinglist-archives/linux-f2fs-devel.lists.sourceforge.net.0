Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE62EA24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 03:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z9RIac+apSNjUySd3bnptygv/X5mECrmP2b935buRFI=; b=Mm1qy6h3jLXNZ/9pnrVsyJXzU
	OoG5ePDVG9UeJRtlRmj8stwyXfaL2tsHBcwGFW6dj8r0J4goYEWhG7CLbBLQoeNKmlDcN93TvjAun
	MSqPeUsAq13Pq65vgW/Liji1lkvuJx9S3ZAV/um7gW0OL70u9JmRn72j14Jw1u3YDaMgo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW9iH-0001I4-4O; Thu, 30 May 2019 01:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3iCnvXAYKAIUm0x1nwpxxpun.lxv@flex--drosen.bounces.google.com>)
 id 1hW9iG-0001Hy-2z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b42+AR7n6zOPWsedWMtmn/sNL2bilZfayJ20H0mS03Q=; b=UyP/Foo87ujAn/K6uSvJy14gu
 1BXZk9U5JMZuTeOxiOYgVBnePjgk3kqwv155Z1uAgX9G6BCPmCHF9z6pqCS0J5Dr9j8Jg+C/p6kF9
 oZrPn3zPm219FQF8U3lxE85PV8BknMWxq0r1Wl2R2ElABsL+h7WUqyyDKhhXiCXm4Sc90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b42+AR7n6zOPWsedWMtmn/sNL2bilZfayJ20H0mS03Q=; b=HIfPUCMpf3lxYU3kpOuKS6FZLu
 xQ6R2IJM9DmQU7HLZoy5xONEJbpcPRxrgLcE+0/RjxsXRDC+ic7ygwSSq21L+FE1GqQPI8XgbL3yV
 CqbS2qAoUsh3dXkaqJsql+SwtXVGDktgcoycrNYzYIW920ENZnzftUSIp8Dwes3ZzG8E=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hW9iE-00CJys-3b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:18:36 +0000
Received: by mail-pg1-f201.google.com with SMTP id n4so1161928pgm.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 18:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=b42+AR7n6zOPWsedWMtmn/sNL2bilZfayJ20H0mS03Q=;
 b=txWr4P1wbKm2FDUVQCS9xHw85QmuQ+d9AXAzLP9TAUEmv5bgOYmu4DxmOkRJDSgNz5
 tqvAMIIVpapauzkILdHC+DcBc6Gp3EAX+JO29PzF//Y3YJRDc5qDxROcS7RB18Upu9R8
 uaA8nck5xCmnmJS3jZop675bjEFxWy8rIPvqFBHyTbtwD6WZu2zdB/PVyYkjajxyj5T3
 wvKJatIp0Sfe+NC5wiAeFmD+4utrqf5OmZ7StTbYOnz9OD7WcIlrzfRQP9heYdM8GPX2
 mtggiIuV7VgZzsPV72KTS1zyQStuapjwy9sRuISjPcfSSpkWhX+mB1NrzGVJxmiamBs/
 Ldhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=b42+AR7n6zOPWsedWMtmn/sNL2bilZfayJ20H0mS03Q=;
 b=Y/kZFwwtj7EXoW3Ci8Oa7Y6NaWIZdslKgp6S51BJAxqyn2jOGToC6SJco0rBtJ90mp
 vWHXY5FAiBc3cFyjS/hw8JfRKUGFeYsX+l6fp2Zz4PlLICVnBTky3sSbfMvl3ZvVZKS0
 1mlLz1tmBZXfgzoeux56RVGxd74l8MddaYsNxpkD9Tb1MPyEvlJqi+K9kpPRJfAec93j
 p8hY5VwtS6r5pwwCI4jAq8ta6kqkpcNoWa/QqA3OPsIsQSj22B5WwInHw0sgYUobo3Gu
 SQG6oW/ZPsnXexMO6bI1wubSHn/R8XO/zhXDIHCYH15rNMYdjxhlogNFjj50Y7qFy+rl
 C/YQ==
X-Gm-Message-State: APjAAAXtvYEEEA7yu1kWbsj0lCz+LdqvQWLHCQWUY7UTde2Lxrreq3VM
 QNJTUWRLGV07GWfTMi6W34NsR192ZDM=
X-Google-Smtp-Source: APXvYqwq0u5fhrdHqmMQ0Jh9SDtVUwviQfew5VAVlFxx7HDPXhJGxaOzz8HP7Z/WXPlMifwcJjsHN58tHw8=
X-Received: by 2002:a63:e645:: with SMTP id p5mr987859pgj.4.1559177608833;
 Wed, 29 May 2019 17:53:28 -0700 (PDT)
Date: Wed, 29 May 2019 17:49:06 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-5-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
X-Headers-End: 1hW9iE-00CJys-3b
Subject: [f2fs-dev] [PATCH v3 4/4] f2fs: Add option to limit required GC for
 checkpoint=disable
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This extends the checkpoint option to allow checkpoint=disable:%u[%]
This allows you to specify what how much of the disk you are willing
to lose access to while mounting with checkpoint=disable. If the amount
lost would be higher, the mount will return -EAGAIN. This can be given
as a percent of total space, or in blocks.

Currently, we need to run garbage collection until the amount of holes
is smaller than the OVP space. With the new option, f2fs can mark
space as unusable up front instead of requiring garbage collection until
the number of holes is small enough.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++
 Documentation/filesystems/f2fs.txt      | 19 +++++++-
 fs/f2fs/f2fs.h                          |  6 ++-
 fs/f2fs/segment.c                       | 17 +++++--
 fs/f2fs/super.c                         | 59 ++++++++++++++++---------
 fs/f2fs/sysfs.c                         | 16 +++++++
 6 files changed, 99 insertions(+), 26 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 91822ce258317..dca326e0ee3e1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -243,3 +243,11 @@ Description:
 		 - Del: echo '[h/c]!extension' > /sys/fs/f2fs/<disk>/extension_list
 		 - [h] means add/del hot file extension
 		 - [c] means add/del cold file extension
+
+What:		/sys/fs/f2fs/<disk>/unusable
+Date		April 2019
+Contact:	"Daniel Rosenberg" <drosen@google.com>
+Description:
+		If checkpoint=disable, it displays the number of blocks that are unusable.
+                If checkpoint=enable it displays the enumber of blocks that would be unusable
+                if checkpoint=disable were to be set.
diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 66aca042988ee..bebd1be3ba495 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -214,11 +214,22 @@ fsync_mode=%s          Control the policy of fsync. Currently supports "posix",
                        non-atomic files likewise "nobarrier" mount option.
 test_dummy_encryption  Enable dummy encryption, which provides a fake fscrypt
                        context. The fake fscrypt context is used by xfstests.
-checkpoint=%s          Set to "disable" to turn off checkpointing. Set to "enable"
+checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "enable"
                        to reenable checkpointing. Is enabled by default. While
                        disabled, any unmounting or unexpected shutdowns will cause
                        the filesystem contents to appear as they did when the
                        filesystem was mounted with that option.
+                       While mounting with checkpoint=disabled, the filesystem must
+                       run garbage collection to ensure that all available space can
+                       be used. If this takes too much time, the mount may return
+                       EAGAIN. You may optionally add a value to indicate how much
+                       of the disk you would be willing to temporarily give up to
+                       avoid additional garbage collection. This can be given as a
+                       number of blocks, or as a percent. For instance, mounting
+                       with checkpoint=disable:100% would always succeed, but it may
+                       hide up to all remaining free space. The actual space that
+                       would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
+                       This space is reclaimed once checkpoint=enable.
 
 ================================================================================
 DEBUGFS ENTRIES
@@ -396,6 +407,12 @@ Files in /sys/fs/f2fs/<devname>
 
  current_reserved_blocks      This shows # of blocks currently reserved.
 
+ unusable                     If checkpoint=disable, this shows the number of
+                              blocks that are unusable.
+                              If checkpoint=enable it shows the number of blocks
+                              that would be unusable if checkpoint=disable were
+                              to be set.
+
 ================================================================================
 USAGE
 ================================================================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a39cc4ffeb4b1..11ef20fedfe72 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -136,6 +136,9 @@ struct f2fs_mount_info {
 	int alloc_mode;			/* segment allocation policy */
 	int fsync_mode;			/* fsync policy */
 	bool test_dummy_encryption;	/* test dummy encryption */
+	block_t unusable_cap;		/* Amount of space allowed to be
+					 * unusable when disabling checkpoint
+					 */
 };
 
 #define F2FS_FEATURE_ENCRYPT		0x0001
@@ -3085,7 +3088,8 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
-int f2fs_disable_cp_again(struct f2fs_sb_info *sbi);
+block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
+int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
 void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ec59cbd0e661d..33bf07222f99f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -873,13 +873,14 @@ void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi)
 	mutex_unlock(&dirty_i->seglist_lock);
 }
 
-int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
+block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi)
 {
-	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	int ovp_hole_segs =
 		(overprovision_segments(sbi) - reserved_segments(sbi));
 	block_t ovp_holes = ovp_hole_segs << sbi->log_blocks_per_seg;
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	block_t holes[2] = {0, 0};	/* DATA and NODE */
+	block_t unusable;
 	struct seg_entry *se;
 	unsigned int segno;
 
@@ -893,7 +894,17 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	if (holes[DATA] > ovp_holes || holes[NODE] > ovp_holes)
+	unusable = holes[DATA] > holes[NODE] ? holes[DATA] : holes[NODE];
+	if (unusable > ovp_holes)
+		return unusable - ovp_holes;
+	return 0;
+}
+
+int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable)
+{
+	int ovp_hole_segs =
+		(overprovision_segments(sbi) - reserved_segments(sbi));
+	if (unusable > F2FS_OPTION(sbi).unusable_cap)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
 		dirty_segments(sbi) > ovp_hole_segs)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 359fd68509d16..7d64e97611141 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -136,7 +136,10 @@ enum {
 	Opt_alloc,
 	Opt_fsync,
 	Opt_test_dummy_encryption,
-	Opt_checkpoint,
+	Opt_checkpoint_disable,
+	Opt_checkpoint_disable_cap,
+	Opt_checkpoint_disable_cap_perc,
+	Opt_checkpoint_enable,
 	Opt_err,
 };
 
@@ -195,7 +198,10 @@ static match_table_t f2fs_tokens = {
 	{Opt_alloc, "alloc_mode=%s"},
 	{Opt_fsync, "fsync_mode=%s"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
-	{Opt_checkpoint, "checkpoint=%s"},
+	{Opt_checkpoint_disable, "checkpoint=disable"},
+	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
+	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
+	{Opt_checkpoint_enable, "checkpoint=enable"},
 	{Opt_err, NULL},
 };
 
@@ -772,22 +778,30 @@ static int parse_options(struct super_block *sb, char *options)
 					"Test dummy encryption mount option ignored");
 #endif
 			break;
-		case Opt_checkpoint:
-			name = match_strdup(&args[0]);
-			if (!name)
-				return -ENOMEM;
-
-			if (strlen(name) == 6 &&
-					!strncmp(name, "enable", 6)) {
-				clear_opt(sbi, DISABLE_CHECKPOINT);
-			} else if (strlen(name) == 7 &&
-					!strncmp(name, "disable", 7)) {
-				set_opt(sbi, DISABLE_CHECKPOINT);
-			} else {
-				kvfree(name);
+		case Opt_checkpoint_disable_cap_perc:
+			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			}
-			kvfree(name);
+			if (arg < 0 || arg > 100)
+				return -EINVAL;
+			if (arg == 100)
+				F2FS_OPTION(sbi).unusable_cap =
+					sbi->user_block_count;
+			else
+				F2FS_OPTION(sbi).unusable_cap =
+					(sbi->user_block_count / 100) *	arg;
+			set_opt(sbi, DISABLE_CHECKPOINT);
+			break;
+		case Opt_checkpoint_disable_cap:
+			if (args->from && match_int(args, &arg))
+				return -EINVAL;
+			F2FS_OPTION(sbi).unusable_cap = arg;
+			set_opt(sbi, DISABLE_CHECKPOINT);
+			break;
+		case Opt_checkpoint_disable:
+			set_opt(sbi, DISABLE_CHECKPOINT);
+			break;
+		case Opt_checkpoint_enable:
+			clear_opt(sbi, DISABLE_CHECKPOINT);
 			break;
 		default:
 			f2fs_msg(sb, KERN_ERR,
@@ -1410,8 +1424,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",alloc_mode=%s", "reuse");
 
 	if (test_opt(sbi, DISABLE_CHECKPOINT))
-		seq_puts(seq, ",checkpoint=disable");
-
+		seq_printf(seq, ",checkpoint=disable:%u",
+				F2FS_OPTION(sbi).unusable_cap);
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
 		seq_printf(seq, ",fsync_mode=%s", "posix");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
@@ -1440,6 +1454,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	set_opt(sbi, EXTENT_CACHE);
 	set_opt(sbi, NOHEAP);
 	clear_opt(sbi, DISABLE_CHECKPOINT);
+	F2FS_OPTION(sbi).unusable_cap = 0;
 	sbi->sb->s_flags |= SB_LAZYTIME;
 	set_opt(sbi, FLUSH_MERGE);
 	set_opt(sbi, DISCARD);
@@ -1468,6 +1483,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	struct cp_control cpc;
 	int err = 0;
 	int ret;
+	block_t unusable;
 
 	if (s_flags & SB_RDONLY) {
 		f2fs_msg(sbi->sb, KERN_ERR,
@@ -1495,7 +1511,8 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 		goto restore_flag;
 	}
 
-	if (f2fs_disable_cp_again(sbi)) {
+	unusable = f2fs_get_unusable_blocks(sbi);
+	if (f2fs_disable_cp_again(sbi, unusable)) {
 		err = -EAGAIN;
 		goto restore_flag;
 	}
@@ -1508,7 +1525,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 		goto out_unlock;
 
 	spin_lock(&sbi->stat_lock);
-	sbi->unusable_block_count = 0;
+	sbi->unusable_block_count = unusable;
 	spin_unlock(&sbi->stat_lock);
 
 out_unlock:
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 729f46a3c9ee0..fa184880cff34 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -68,6 +68,20 @@ static ssize_t dirty_segments_show(struct f2fs_attr *a,
 		(unsigned long long)(dirty_segments(sbi)));
 }
 
+static ssize_t unusable_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	block_t unusable;
+
+	if (test_opt(sbi, DISABLE_CHECKPOINT))
+		unusable = sbi->unusable_block_count;
+	else
+		unusable = f2fs_get_unusable_blocks(sbi);
+	return snprintf(buf, PAGE_SIZE, "%llu\n",
+		(unsigned long long)unusable);
+}
+
+
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -440,6 +454,7 @@ F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
+F2FS_GENERAL_RO_ATTR(unusable);
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
@@ -495,6 +510,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_type),
 #endif
 	ATTR_LIST(dirty_segments),
+	ATTR_LIST(unusable),
 	ATTR_LIST(lifetime_write_kbytes),
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
