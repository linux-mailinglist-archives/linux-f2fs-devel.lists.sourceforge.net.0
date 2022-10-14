Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE165FEB11
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGOb-0000jR-Sb;
	Fri, 14 Oct 2022 08:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOI-0000eV-U5;
 Fri, 14 Oct 2022 08:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s+9yJ7ltRwZDViylHimzxt5trfp3/YyMYP1DALt6daQ=; b=fVpdoMQNwg1yk1yzEkhBBkfFeG
 kJhCZt2dKUlS/SgxrflGYqGFsFg1LqoW7XOaD/6lgnu7rQW491dnXHo7Wb2J8SKdoBu0Js01Sqw/U
 wgSzSzij7MRvSMhbtYZaSSthHOhvTodptGcoFDdTFBInw4K1zyWZoQFuY+AdGQMNn568=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s+9yJ7ltRwZDViylHimzxt5trfp3/YyMYP1DALt6daQ=; b=IfAxgbl3sa9hsKW22fIVuVK3Ek
 3koKBSPb6NZAoE487zoGEqHRngIjw8s9usdCK1WVRj8WgjtmjEQ2Xvg1AD6/r7ePlODGoOiqkzqGK
 W0XyJ0IWJMZAr0rI3zjnqj1G/MoZ464+Jsb8nt5YI8BfsnAEzjTTVSt8hWvgEUuLmzlY=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGO9-0002Ij-79; Fri, 14 Oct 2022 08:50:00 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso3069552wmq.2; 
 Fri, 14 Oct 2022 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+9yJ7ltRwZDViylHimzxt5trfp3/YyMYP1DALt6daQ=;
 b=p63rFDk+7fHDtSHqdHbh5UTErR2KUpqMpgr3HkVCyL03aJpfelAlYk+zA1kvLcUK4x
 oCy0NMYDZh+H50rQcR49ml2HNBTBYxQHuyUYk2CSX54YfuXf3DWjLKdUiCPT4+EiIFSi
 nHSQMC7c9mLxjAkq4yLJ0/P9F8eN2RlUOEqc8NA2In2jz47ELklEdKHjSYs0ZELx4ixz
 5/vUWh5rIIInW9un9b84c/P8CPLnarDABeMuwBY6OaHUr8e6bA2Wo85vskn9BuK/Ho1v
 LOW3LE2S8qlC9e+TcP7T6auaCAsi9PDl3bTPIkBQTVkixT16squswDJ53Vty9EoVnl7l
 vcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+9yJ7ltRwZDViylHimzxt5trfp3/YyMYP1DALt6daQ=;
 b=m5k8kPjKtU4bLIJA5x1vibNy3utS1S4IevKUguCQAlIz1G1tHVzZ1/sNS+kqkjRi+G
 81QMrvKgKQhp8mPVe0Cu4hNkPpZYn4oUg96X3Bo3evf31GuTWv7geEc30aODsr+/Th9P
 5f5DhkKpIkA8fnia1yUOjn6GGb2jgYo18dBu3eZUGIPGJ01L49pFCu8tJXgbuakCpsWF
 mmRJE+PwHi8y4iPzNzu2Eihw9DzMSc7XIqd+IwrUTgqaTirYAxktwimsvozE9EVnNsf5
 5di5YyCpLE4WZfjCSE90AGkzDEuBOydhIdrtFwU/yrM0aIwkxljBMfkyp8FKc+UG+q7U
 tbgw==
X-Gm-Message-State: ACrzQf1tUcufegZ59df8XIOIHSNCcFeOvGLHGsMoagILR8WErYjEdfzo
 gEFOKLa5QLvSEzlUjyY/z5k=
X-Google-Smtp-Source: AMsMyM45L6TdWLoWTz5aCkSDhsUhnAFVyDkdp0Ci0aBfwoR6x63gBHft59KTvo8CdK8QfpU4449Q7g==
X-Received: by 2002:a05:600c:19ce:b0:3b9:c36f:f9e2 with SMTP id
 u14-20020a05600c19ce00b003b9c36ff9e2mr2761365wmq.110.1665737387337; 
 Fri, 14 Oct 2022 01:49:47 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:47 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:32 +0000
Message-Id: <20221014084837.1787196-3-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled,
 bypass checks in key checksum verification functions. Signed-off-by:
 Hrutvik Kanabar --- fs/ext4/bitmap.c | 6 ++++-- fs/ext4/extents.c | 3 ++-
 fs/ext4/inode.c | 3 ++- fs/ext4/ioctl.c | 3 ++- fs/ext4/mmp.c | 3 ++-
 fs/ext4/namei.c | 6 ++++-- fs/ext4/orph [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ojGO9-0002Ij-79
Subject: [f2fs-dev] [PATCH RFC 2/7] fs/ext4: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hrutvik Kanabar <hrutvik@google.com>

When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checks in key
checksum verification functions.

Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
---
 fs/ext4/bitmap.c  | 6 ++++--
 fs/ext4/extents.c | 3 ++-
 fs/ext4/inode.c   | 3 ++-
 fs/ext4/ioctl.c   | 3 ++-
 fs/ext4/mmp.c     | 3 ++-
 fs/ext4/namei.c   | 6 ++++--
 fs/ext4/orphan.c  | 3 ++-
 fs/ext4/super.c   | 6 ++++--
 fs/ext4/xattr.c   | 3 ++-
 9 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/ext4/bitmap.c b/fs/ext4/bitmap.c
index f63e028c638c..04ce8e4149ee 100644
--- a/fs/ext4/bitmap.c
+++ b/fs/ext4/bitmap.c
@@ -24,7 +24,8 @@ int ext4_inode_bitmap_csum_verify(struct super_block *sb, ext4_group_t group,
 	__u32 provided, calculated;
 	struct ext4_sb_info *sbi = EXT4_SB(sb);
 
-	if (!ext4_has_metadata_csum(sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(sb))
 		return 1;
 
 	provided = le16_to_cpu(gdp->bg_inode_bitmap_csum_lo);
@@ -63,7 +64,8 @@ int ext4_block_bitmap_csum_verify(struct super_block *sb, ext4_group_t group,
 	struct ext4_sb_info *sbi = EXT4_SB(sb);
 	int sz = EXT4_CLUSTERS_PER_GROUP(sb) / 8;
 
-	if (!ext4_has_metadata_csum(sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(sb))
 		return 1;
 
 	provided = le16_to_cpu(gdp->bg_block_bitmap_csum_lo);
diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index f1956288307f..c1b7c8f4862c 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -63,7 +63,8 @@ static int ext4_extent_block_csum_verify(struct inode *inode,
 {
 	struct ext4_extent_tail *et;
 
-	if (!ext4_has_metadata_csum(inode->i_sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(inode->i_sb))
 		return 1;
 
 	et = find_ext4_extent_tail(eh);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 2b5ef1b64249..8ec8214f1423 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -86,7 +86,8 @@ static int ext4_inode_csum_verify(struct inode *inode, struct ext4_inode *raw,
 {
 	__u32 provided, calculated;
 
-	if (EXT4_SB(inode->i_sb)->s_es->s_creator_os !=
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    EXT4_SB(inode->i_sb)->s_es->s_creator_os !=
 	    cpu_to_le32(EXT4_OS_LINUX) ||
 	    !ext4_has_metadata_csum(inode->i_sb))
 		return 1;
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 4d49c5cfb690..bae33cd83d05 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -142,7 +142,8 @@ static int ext4_update_backup_sb(struct super_block *sb,
 
 	es = (struct ext4_super_block *) (bh->b_data + offset);
 	lock_buffer(bh);
-	if (ext4_has_metadata_csum(sb) &&
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    ext4_has_metadata_csum(sb) &&
 	    es->s_checksum != ext4_superblock_csum(sb, es)) {
 		ext4_msg(sb, KERN_ERR, "Invalid checksum for backup "
 		"superblock %llu\n", sb_block);
diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 9af68a7ecdcf..605f1867958d 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -21,7 +21,8 @@ static __le32 ext4_mmp_csum(struct super_block *sb, struct mmp_struct *mmp)
 
 static int ext4_mmp_csum_verify(struct super_block *sb, struct mmp_struct *mmp)
 {
-	if (!ext4_has_metadata_csum(sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(sb))
 		return 1;
 
 	return mmp->mmp_checksum == ext4_mmp_csum(sb, mmp);
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d5daaf41e1fc..84a59052c51d 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -396,7 +396,8 @@ int ext4_dirblock_csum_verify(struct inode *inode, struct buffer_head *bh)
 {
 	struct ext4_dir_entry_tail *t;
 
-	if (!ext4_has_metadata_csum(inode->i_sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(inode->i_sb))
 		return 1;
 
 	t = get_dirent_tail(inode, bh);
@@ -491,7 +492,8 @@ static int ext4_dx_csum_verify(struct inode *inode,
 	struct dx_tail *t;
 	int count_offset, limit, count;
 
-	if (!ext4_has_metadata_csum(inode->i_sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(inode->i_sb))
 		return 1;
 
 	c = get_dx_countlimit(inode, dirent, &count_offset);
diff --git a/fs/ext4/orphan.c b/fs/ext4/orphan.c
index 69a9cf9137a6..8a488d5521cb 100644
--- a/fs/ext4/orphan.c
+++ b/fs/ext4/orphan.c
@@ -537,7 +537,8 @@ static int ext4_orphan_file_block_csum_verify(struct super_block *sb,
 	struct ext4_orphan_block_tail *ot;
 	__le64 dsk_block_nr = cpu_to_le64(bh->b_blocknr);
 
-	if (!ext4_has_metadata_csum(sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(sb))
 		return 1;
 
 	ot = ext4_orphan_block_tail(sb, bh);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index d733db8a0b02..cb6e53163441 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -287,7 +287,8 @@ __le32 ext4_superblock_csum(struct super_block *sb,
 static int ext4_superblock_csum_verify(struct super_block *sb,
 				       struct ext4_super_block *es)
 {
-	if (!ext4_has_metadata_csum(sb))
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    !ext4_has_metadata_csum(sb))
 		return 1;
 
 	return es->s_checksum == ext4_superblock_csum(sb, es);
@@ -3198,7 +3199,8 @@ static __le16 ext4_group_desc_csum(struct super_block *sb, __u32 block_group,
 int ext4_group_desc_csum_verify(struct super_block *sb, __u32 block_group,
 				struct ext4_group_desc *gdp)
 {
-	if (ext4_has_group_desc_csum(sb) &&
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    ext4_has_group_desc_csum(sb) &&
 	    (gdp->bg_checksum != ext4_group_desc_csum(sb, block_group, gdp)))
 		return 0;
 
diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 36d6ba7190b6..b22a0f282474 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -154,7 +154,8 @@ static int ext4_xattr_block_csum_verify(struct inode *inode,
 	struct ext4_xattr_header *hdr = BHDR(bh);
 	int ret = 1;
 
-	if (ext4_has_metadata_csum(inode->i_sb)) {
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    ext4_has_metadata_csum(inode->i_sb)) {
 		lock_buffer(bh);
 		ret = (hdr->h_checksum == ext4_xattr_block_csum(inode,
 							bh->b_blocknr, hdr));
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
