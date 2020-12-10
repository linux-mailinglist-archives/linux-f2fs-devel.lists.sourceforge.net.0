Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB552D5F9E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 16:28:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knNsD-0002WS-4r; Thu, 10 Dec 2020 15:28:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jordan@getseam.com>) id 1knNrs-0002VU-W5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 15:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfo7npM872OHY9B+W/QPveqfqhAzXEaU9sKNPwRLoxQ=; b=hgMPO/5xco8KGmqs1cAv3qUc1s
 7YyKA7u3eJSFNP20TtgP8UqZ1mXk6FM4QaCePg6auo1DSSHv3GkxYLCj6hz6HhwcY0ocK67s5Bv28
 RNF5olilBR0arBt+u2kfuOgkADcBKjypuz/pUPI2+rRMgZCKZ9i94Ud0DI0SIOhe8jEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:
 Content-Type:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tfo7npM872OHY9B+W/QPveqfqhAzXEaU9sKNPwRLoxQ=; b=nJeqgPpJzYX2c0xyH5rLHJgOuI
 hbhpS2C61Jq1EFx1GhuttD84kLspfTmQnXQo4LrU26WMaiwIhBdxt66b2cnPZUzNzXPH3Qwwgj/mC
 TXQg2o9rOZTDM3QySmCLlEodqqQlK7ZCivc/YSfkaJJ/iEk98r7mBt5lDmN1Voiry8G4=;
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1knNrm-006dMK-7h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 15:28:32 +0000
Received: by mail-io1-f52.google.com with SMTP id i18so5909077ioa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Dec 2020 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getseam-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=tfo7npM872OHY9B+W/QPveqfqhAzXEaU9sKNPwRLoxQ=;
 b=rGUdGQP5Ca1qQTF7g3FwfDW39hYbljQlTwZK8pRl7dHEZ8A+9eL9zi7ZQQwHsd3SE3
 HF817aUslv3fBzFg2LSYR6h/pUwaHxuXABGA7whv28BGQEMycUyd2Tn5bChSzur5sNjv
 01mzfZIVciZgZtfGxarTuqdeZ9cNVqh1Sf/2zD3RVtCTakn7cgSAFbR0lvo+R46XHGk3
 33d4UyapnYk1NZ/hM/9/JBT3ouumXUN5RQNRmYjFPQgm1yrxLv7yAHG9eSKzdeI6uQ7M
 8YArEnhENtIEhBYCa+NekifJTsN2dErndRgvlBRi37dnVOLSm20PZCXJfSQ/fUdw+Twn
 Zcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=tfo7npM872OHY9B+W/QPveqfqhAzXEaU9sKNPwRLoxQ=;
 b=RmvkvPJhhFvOJa6o1qnWxb9pUw+9r/lc6CoGmmcl1fY9dSjxU4w7JFWL0yYdOw5bx3
 ZgTAdEHeArsa6IswoqcSLGOjTemj2IUbydolt4Rht/LJogrf6OKEpUuDrmxKE+NHb5JP
 IpYdSID6irC+tP4zjFIbCZIbvhDgJIJ2tMwhtkzTNfClhMIGGK7Hsjayhmj7wK0R6t6j
 ww//QPtzmbML4v8vygvL9FSwNUq5urKpzeRRz+IdrexGofEWqqAosv40AhJmzvrLvdDl
 PCr4WzcKkZjlCNeQ2sUqBw+TTgoLgOfmUHX2ML+qSbZNgwsvdsMNZAMwl4sUyWoHgFsx
 8G8w==
X-Gm-Message-State: AOAM533bd5hI3IzXzfd8+XzkQ1DzPk+IgyZMFUc5HAsm1/yxaX7nWk6T
 IKVVSr89Nq43yTmkMsRNPUhl2jJM/uZNZEn1
X-Google-Smtp-Source: ABdhPJxq4y46bL/Np+SbLMc+nQxAa68t0/kc3QldmS81vH4uvPcPNr+tPX6gxX5QBZbyyHliAFYfQQ==
X-Received: by 2002:a02:c8c7:: with SMTP id q7mr9382971jao.7.1607614092985;
 Thu, 10 Dec 2020 07:28:12 -0800 (PST)
Received: from dorothy.webb.haus ([24.148.31.157])
 by smtp.gmail.com with ESMTPSA id w9sm3430211ilq.43.2020.12.10.07.28.11
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 07:28:12 -0800 (PST)
From: Jordan Webb <jordan@getseam.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Message-Id: <D741743D-EAFA-4C26-ACC2-2066AF51DCD4@getseam.com>
Date: Thu, 10 Dec 2020 09:28:11 -0600
To: linux-f2fs-devel@lists.sourceforge.net
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: getseam.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.52 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1knNrm-006dMK-7h
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: Make sload.f2fs reproduce hard
 links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If sload.f2fs encounters a file with nr_links > 1, it will mark it
as a possible hard link by remembering the original device and
inode. When sload.f2fs creates the file, it will check if it has
already created a file for the same original device and inode. If
so, it will add the original inode to the directory and increment
the number of links to it, instead of writing a new inode.

This allows sload.f2fs to accurately reproduce a directory tree that
contains hard links, such as those created by ostree. Without this
patch, directory trees containing hard links result in the content of
the files being duplicated.

This is version 2 of the patch; it has been rebased against the dev
branch and includes a fix from Jaegeuk Kim to avoid building data 
contents twice on hard linked files.

Co-authored-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Jordan Webb <jordan@getseam.com>
---
 fsck/dir.c     | 73 +++++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/f2fs.h    | 10 +++++++
 fsck/fsck.h    |  2 ++
 fsck/segment.c | 11 ++++++++
 fsck/sload.c   |  9 +++++++
 5 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index dc03c98..37b32f1 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -15,6 +15,7 @@
  */
 #include "fsck.h"
 #include "node.h"
+#include <search.h>
 
 static int room_for_filename(const u8 *bitmap, int slots, int max_slots)
 {
@@ -634,10 +635,42 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 	return 0;
 }
 
+static int cmp_from_devino(const void *a, const void *b) {
+	u64 devino_a = ((struct hardlink_cache_entry*) a)->from_devino;
+	u64 devino_b = ((struct hardlink_cache_entry*) b)->from_devino;
+
+	return (devino_a > devino_b) - (devino_a < devino_b);
+}
+
+struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
+						struct dentry *de)
+{
+	struct hardlink_cache_entry *find_hardlink = NULL;
+	struct hardlink_cache_entry *found_hardlink = NULL;
+	void *search_result;
+
+	/* This might be a hardlink, try to find it in the cache */
+	find_hardlink = calloc(1, sizeof(struct hardlink_cache_entry));
+	find_hardlink->from_devino = de->from_devino;
+
+	search_result = tsearch(find_hardlink, &(sbi->hardlink_cache), cmp_from_devino);
+	ASSERT(search_result != 0);
+
+	found_hardlink = *(struct hardlink_cache_entry**) search_result;
+	ASSERT(find_hardlink->from_devino == found_hardlink->from_devino);
+
+	/* If it was already in the cache, free the entry we just created */
+	if (found_hardlink != find_hardlink)
+		free(find_hardlink);
+
+	return found_hardlink;
+}
+
 int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 {
 	struct f2fs_node *parent, *child;
-	struct node_info ni;
+	struct hardlink_cache_entry *found_hardlink = NULL;
+	struct node_info ni, hardlink_ni;
 	struct f2fs_summary sum;
 	block_t blkaddr = NULL_ADDR;
 	int ret;
@@ -671,10 +704,27 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		goto free_parent_dir;
 	}
 
+	if (de->from_devino)
+		found_hardlink = f2fs_search_hardlink(sbi, de);
+
 	child = calloc(BLOCK_SZ, 1);
 	ASSERT(child);
 
+	if (found_hardlink && found_hardlink->to_ino ) {
+		/* If we found this devino in the cache, we're creating a hard link */
+		get_node_info(sbi, found_hardlink->to_ino, &hardlink_ni);
+		if (hardlink_ni.blk_addr == NULL_ADDR) {
+			MSG(0, "No original inode for hard link to_ino=%x\n", found_hardlink->to_ino);
+			return -1;
+		}
+
+		/* Use previously-recorded inode */
+		de->ino = found_hardlink->to_ino;
+		blkaddr = hardlink_ni.blk_addr;
+		MSG(0, "Creating \"%s\" as hard link to inode %d\n", de->path, de->ino);
+	} else {
 		f2fs_alloc_nid(sbi, &de->ino);
+	}
 
 	init_inode_block(sbi, child, de);
 
@@ -689,6 +739,26 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		goto free_child_dir;
 	}
 
+	if (found_hardlink) {
+		if (!found_hardlink->to_ino) {
+			MSG(0, "Adding inode %d from %s to hardlink cache\n", de->ino, de->path);
+			found_hardlink->to_ino = de->ino;
+		} else {
+			/* Replace child with original block */
+			free(child);
+			child = calloc(BLOCK_SZ, 1);
+			ASSERT(child);
+
+			ret = dev_read_block(child, blkaddr);
+			ASSERT(ret >= 0);
+
+			/* Increment links and skip to writing block */
+			child->i.i_links++;
+			MSG(0, "Number of links on inode %d is now %d\n", de->ino, child->i.i_links);
+			goto write_child_dir;
+		}
+	}
+
 	/* write child */
 	set_summary(&sum, de->ino, 0, ni.version);
 	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
@@ -697,6 +767,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	/* update nat info */
 	update_nat_blkaddr(sbi, de->ino, de->ino, blkaddr);
 
+write_child_dir:
 	ret = dev_write_block(child, blkaddr);
 	ASSERT(ret >= 0);
 
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 76e8272..9c6b0e4 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -221,6 +221,7 @@ struct dentry {
 	uint64_t capabilities;
 	nid_t ino;
 	nid_t pino;
+	u64 from_devino;
 };
 
 /* different from dnode_of_data in kernel */
@@ -234,6 +235,12 @@ struct dnode_of_data {
 	int idirty, ndirty;
 };
 
+struct hardlink_cache_entry {
+	u64 from_devino;
+	nid_t to_ino;
+	int nbuild;
+};
+
 struct f2fs_sb_info {
 	struct f2fs_fsck *fsck;
 
@@ -276,6 +283,9 @@ struct f2fs_sb_info {
 
 	/* true if late_build_segment_manger() is called */
 	bool seg_manager_done;
+
+	/* keep track of hardlinks so we can recreate them */
+	void *hardlink_cache;
 };
 
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c5e85fe..037aea9 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -296,6 +296,8 @@ int f2fs_find_path(struct f2fs_sb_info *, char *, nid_t *);
 nid_t f2fs_lookup(struct f2fs_sb_info *, struct f2fs_node *, u8 *, int);
 int f2fs_add_link(struct f2fs_sb_info *, struct f2fs_node *,
 		const unsigned char *, int, nid_t, int, block_t, int);
+struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
+						struct dentry *de);
 
 /* xattr.c */
 void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *);
diff --git a/fsck/segment.c b/fsck/segment.c
index 0487f41..878fb85 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -351,6 +351,17 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (de->ino == 0)
 		return -1;
 
+ 	if (de->from_devino) {
+ 		struct hardlink_cache_entry *found_hardlink;
+
+ 		found_hardlink = f2fs_search_hardlink(sbi, de);
+ 		if (found_hardlink && found_hardlink->to_ino &&
+ 				found_hardlink->nbuild)
+ 			return 0;
+
+ 		found_hardlink->nbuild++;
+ 	}
+
 	fd = open(de->full_path, O_RDONLY);
 	if (fd < 0) {
 		MSG(0, "Skip: Fail to open %s\n", de->full_path);
diff --git a/fsck/sload.c b/fsck/sload.c
index 14012fb..f3a6c12 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -148,6 +148,12 @@ static void set_inode_metadata(struct dentry *de)
 	}
 
 	if (S_ISREG(stat.st_mode)) {
+		if (stat.st_nlink > 1) {
+			/* This file might have multiple links to it, so remember device and inode */
+			de->from_devino = stat.st_dev;
+			de->from_devino <<= 32;
+			de->from_devino |= stat.st_ino;
+		}
 		de->file_type = F2FS_FT_REG_FILE;
 	} else if (S_ISDIR(stat.st_mode)) {
 		de->file_type = F2FS_FT_DIR;
@@ -333,6 +339,9 @@ int f2fs_sload(struct f2fs_sb_info *sbi)
 	/* flush NAT/SIT journal entries */
 	flush_journal_entries(sbi);
 
+	/* initialize empty hardlink cache */
+	sbi->hardlink_cache = 0;
+
 	ret = build_directory(sbi, c.from_dir, "/",
 					c.target_out_dir, F2FS_ROOT_INO(sbi));
 	if (ret) {
-- 
2.24.3 (Apple Git-128)




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
