Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401C224FD7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jul 2020 07:44:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jx281-0007LB-Cm; Sun, 19 Jul 2020 05:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jx27z-0007L2-Cd
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 05:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w7Hio3ZAZnC6526MvIONhlzLrk1YgS7ld2jxR+GeflQ=; b=BxlcETaqHF4Wtybmq11bNDhU18
 7gmA0PkPSJcaP2WYQv3A8VlkVKV7yW/ZwmxsxnzE1lT2ztHhGqFEphmYAOqwVuy8wRFn73UE4SD81
 QjA6dmLEOzNzIJQofauWOdd9/bi3pnWt3cyzYFGt9UqodloHEXckbw94XwrB0aFQ4raY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w7Hio3ZAZnC6526MvIONhlzLrk1YgS7ld2jxR+GeflQ=; b=N2umDROC61GNOq13f0DTDbW2cA
 eIBwvzzGeBtH5s4CS1ToXZUdnOnWpybg2yzX6HJQX2uqKSQQt+0P0UTtZF8MQiSrGG2cS0lIDnG80
 WtSZXw7eyKDnEJl9ly1tqLYqA4rM+S8kpFljK4pstcy1YsfIfHenG8tUb/7+wWkNQl3E=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jx27w-009P1c-06
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 05:44:47 +0000
Received: by mail-pl1-f194.google.com with SMTP id w17so7172061ply.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Jul 2020 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7Hio3ZAZnC6526MvIONhlzLrk1YgS7ld2jxR+GeflQ=;
 b=fLqUdOr4VU4tq/6gLs5t5PoruMXnM60xzwj4nm/rI2NEWsnb35rAtEfIofwcRYqdJa
 OLJBy4xPM+q3zL1rJpYMl1Pz7Oky/QqWJm47XIqBm4mPsP+QXkR8jBwptUcVp7UNyyZU
 RN7Bpe9vle1BdJOTrEt6FiAhxOS/hwjoVmJyV4OV+Fx35/H2AN4emcdCKKa8nddjY1/q
 FEFRlX91hM56PXm6jdlF3MVVlKG8juwlMgppelUmFq9z6CFKEmLXKmI3iYq6Bt1J+VUy
 U+ozuK8vgJj4wATl/bx1GFLRhMizWdXH3i4BXz12rhKGEl0j0ovBqVBkMfnyef19/uqk
 sBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7Hio3ZAZnC6526MvIONhlzLrk1YgS7ld2jxR+GeflQ=;
 b=akMSXTN0ZDBE4PpkB54uwkHa/o14QUZNY9j/Xw4NNku7duJmNkO6NlDpP52NyTvhsU
 iDed+tkr6EcXwP5RWc+DKQcpLvNFRqEAVognOmr+x0Rm/h4AORt3oXEKKsNc3kysEVza
 qyAXvoB/V61+Xk1eb1tR2SKPsgsgvSsWhuJwEsYBYGNe4Qz2PkHSuuEyNxvBOtsDwf6q
 HIxq0LL7vgRBIOOpDANACX4f1JSn/3f6jiZSHqubNpVFSC/hnJtjSkVGTOQ1P/tE2J3A
 oSPTUO3AWxsK4TjTu4+r2JqKMm1FAolB20JlaQuZWt07s8he5SNjFGBqpzqMhJy552Rt
 Vwmw==
X-Gm-Message-State: AOAM532XMoMD/1GcmxwzxSzItU53k6sp1adpHcBo4nxnU1vPiajGdrTX
 mzuB/obIn9Sj0DNtnyWXjG8=
X-Google-Smtp-Source: ABdhPJxJHgXS/HkIxS066qjd5z+2CBE7YzM/F7vAQFmMUEXQ8N22mPsMqj1X7zV+tHQDrd9UOYidCA==
X-Received: by 2002:a17:902:5981:: with SMTP id
 p1mr13024975pli.141.1595137478312; 
 Sat, 18 Jul 2020 22:44:38 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id l207sm12573821pfd.79.2020.07.18.22.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 22:44:37 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Sun, 19 Jul 2020 14:44:09 +0900
Message-Id: <20200719054409.3050516-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200719054409.3050516-1-daeho43@gmail.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jx27w-009P1c-06
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add volume_name mount option
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added "volume_name" mount option. When the volume name in the on-disk
superblock doesn't exist, we can input the volume name as a mount
option and this is used to create a sysfs symbolic link pointing to
/sys/fs/f2fs/<disk>. The format of the symbolic directory link is like
/sys/fs/f2fs/<volume_name>_<num>, <volume_name> is the passed volume
name and <num> means the order of mounting with the same volume name.
When the on-disk volume name already exists, this mount option will be
ignored.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst |  8 ++++++++
 fs/f2fs/super.c                    | 23 +++++++++++++++++++++++
 fs/f2fs/sysfs.c                    | 14 +++++++++++---
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 8221f3af6042..07507bed4fc1 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -260,6 +260,14 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
                        For other files, we can still enable compression via ioctl.
                        Note that, there is one reserved special extension '*', it
                        can be set to enable compression for all files.
+volume_name=%s         When the volume name in the on-disk superblock doesn't exist,
+                       we can input the volume name as a mount option and this is
+                       used to create a sysfs symbolic link pointing to
+                       /sys/fs/f2fs/<disk>. The format of the symbolic directory
+                       link is like /sys/fs/f2fs/<volume_name>_<num>, <volume_name>
+                       is the passed volume name and <num> means the order of mounting
+                       with the same volume name. When the on-disk volume name already
+                       exists, this mount option will be ignored.
 ====================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7b002785417a..18d0a535697d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -145,6 +145,7 @@ enum {
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
+	Opt_volume_name,
 	Opt_err,
 };
 
@@ -211,6 +212,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
+	{Opt_volume_name, "volume_name=%s"},
 	{Opt_err, NULL},
 };
 
@@ -918,6 +920,21 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
+		case Opt_volume_name:
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+
+			if (strlen(name) > MAX_VOLUME_NAME) {
+				f2fs_err(sbi,
+					"Volume name is too long");
+				kfree(name);
+				return -EINVAL;
+			}
+
+			strncpy(sbi->syslink_name, name, MAX_VOLUME_NAME);
+			kfree(name);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1609,6 +1626,12 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
 
 	f2fs_show_compress_options(seq, sbi->sb);
+
+	mutex_lock(&sbi->syslink_mutex);
+	if (f2fs_has_syslink(sbi))
+		seq_printf(seq, ",volume_name=%s", sbi->syslink_name);
+	mutex_unlock(&sbi->syslink_mutex);
+
 	return 0;
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e9818dd338c1..6d4a2f8aa0d7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -907,7 +907,7 @@ static void f2fs_unload_syslink(struct f2fs_sb_info *sbi)
 	memset(sbi->syslink_name, 0, MAX_SYSLINK_NAME);
 }
 
-static int f2fs_load_syslink(struct f2fs_sb_info *sbi)
+static int f2fs_load_syslink(struct f2fs_sb_info *sbi, bool mount)
 {
 	int idx, count, ret;
 
@@ -918,6 +918,14 @@ static int f2fs_load_syslink(struct f2fs_sb_info *sbi)
 			MAX_VOLUME_NAME);
 	up_read(&sbi->sb_lock);
 
+	if (mount) {
+		if (count)
+			memset(sbi->syslink_name + count, 0,
+					MAX_SYSLINK_NAME - count);
+		else
+			count = strlen(sbi->syslink_name);
+	}
+
 	if (!count)
 		return -ENOENT;
 
@@ -939,7 +947,7 @@ void f2fs_reload_syslink(struct f2fs_sb_info *sbi)
 {
 	mutex_lock(&sbi->syslink_mutex);
 	f2fs_unload_syslink(sbi);
-	f2fs_load_syslink(sbi);
+	f2fs_load_syslink(sbi, false);
 	mutex_unlock(&sbi->syslink_mutex);
 }
 
@@ -1001,7 +1009,7 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	}
 
-	f2fs_load_syslink(sbi);
+	f2fs_load_syslink(sbi, true);
 
 	return 0;
 }
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
