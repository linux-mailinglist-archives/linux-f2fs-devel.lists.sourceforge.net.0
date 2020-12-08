Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B62D372B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 00:53:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmmnY-0008JK-5h; Tue, 08 Dec 2020 23:53:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jordan@getseam.com>) id 1kmmnW-0008JD-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 23:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHfLmp4jxlui3ESLCBTc0zzFE1pFDmie/Mv+7VXk20c=; b=ZvGwR07X8cip7XMcKYPsa7Tzlc
 7jJOvHtdTr81p1zB4qvvcpnVwisHIQ7/hV48tq716RENShn73/LcIGc3hO1ilnO2hU+2Qkb0Sah6R
 j3OB8xidEnc4bs8T+ItvknSpDb7F+5xB8KjACt2TkECAZaNh58kpwfGpBBbZaHCrKkzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:
 Content-Type:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHfLmp4jxlui3ESLCBTc0zzFE1pFDmie/Mv+7VXk20c=; b=i2bXwJKqEawfEE6ywajNAYM2XB
 mkKy+UC1/5POaxnwIPsYyme98j14XIHrCJUROZtQVPJi5mj9GQdSyHbD0s94+HJ3e1mihji+UT446
 yRipIyVtHumlijk2yPKwa7l22OvvlTLxyvfBez7WVev3mFD9vRK8K5AlPxd7Hsf8SIAs=;
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmmnJ-0079Qd-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 23:53:34 +0000
Received: by mail-qt1-f179.google.com with SMTP id b9so147780qtr.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Dec 2020 15:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getseam-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=tHfLmp4jxlui3ESLCBTc0zzFE1pFDmie/Mv+7VXk20c=;
 b=WaIl9YbWaTITTScqIG79MjheERTVjW1LJEXCWRRL7K3cLU7dGCNJfUVLjoy89x1OQf
 zajsP6QQns7GQ9IenQvBp2CdSZc2X0MX1iK+p8xjcgvj6IeUujsvYed703PObJruUWdn
 XJAnJwm265c6kYJJzfV6tzbbDE8smE327qd4VncvqV8AJsUUMSDEnEpeAD4J1nvRD7J9
 X5LukZd6ttcst01ETh2f1+UUXedcWzf70eWl7P11/WWNkY2ZGkWdl6+70EfZ4VOxNcii
 uGAH/kHv39L+GtLhCJZKBgJ1vHwU+O5yQVrxkEldIUz9frxj38o3X/BFwBMs2qDzY3po
 W93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=tHfLmp4jxlui3ESLCBTc0zzFE1pFDmie/Mv+7VXk20c=;
 b=PBztSBBVQI+gyJper1bL76348gH+b5MkS0iUuVkH9y33vk3MKaGYEbZzahE+3Szogb
 Tks1F81PDyePndscbcf9WweTjBa+qvD/uE2LMDH5LtYpRBzNDRzyK17FmWFK4Utf6KQY
 iAKaoJ6SgCOXcb1Z5auizdJoIiPgXDi1IKibh8u6H08drMa+qsMcaDt0Y8XCkiV1b+rh
 WrbLIuBgn3Q9ayrTop9jbYtXBAhjXfRuZ8T7OrNKsyMd3NOguewukiaTZLkRzrztscEX
 fTRQ7pv7cEN3BoRkPb2oNqEiDDRZUsj0uUJuTvQk+/pE7U+q4R6UbqZrgUWiE5s7EhtN
 7p4A==
X-Gm-Message-State: AOAM531jBmZJVniWA7HGohYt7C8JEA8GS9gVBxn/E+CDKrycecKi/Tjb
 v1SE8Kaqve3nYQMNUbrGn8Q7L+Laz8dJLv0j
X-Google-Smtp-Source: ABdhPJwHTlUUANxlBoN1wX89XxwTlM1cbgu72ZZ/CQL1rEULQuJNcvVkbqEnOoHl9nqMJVdJebRYyw==
X-Received: by 2002:a02:834b:: with SMTP id w11mr28604539jag.5.1607465299786; 
 Tue, 08 Dec 2020 14:08:19 -0800 (PST)
Received: from dorothy.webb.haus ([24.148.31.157])
 by smtp.gmail.com with ESMTPSA id f29sm22435ilg.3.2020.12.08.14.08.18
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:08:18 -0800 (PST)
From: Jordan Webb <jordan@getseam.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Message-Id: <0D95EC1F-D44F-4AB4-BE2B-77A88E0FAFE3@getseam.com>
Date: Tue, 8 Dec 2020 16:08:17 -0600
To: linux-f2fs-devel@lists.sourceforge.net
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.179 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmmnJ-0079Qd-Qz
Subject: [f2fs-dev] [PATCH] Make sload.f2fs reproduce hard links
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
---
 fsck/dir.c   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 fsck/f2fs.h  |  9 +++++++
 fsck/sload.c |  9 +++++++
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index dc03c98..bdd8163 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -15,6 +15,7 @@
  */
 #include "fsck.h"
 #include "node.h"
+#include <search.h>
 
 static int room_for_filename(const u8 *bitmap, int slots, int max_slots)
 {
@@ -634,10 +635,19 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 	return 0;
 }
 
+int cmp_from_devino(const void *a, const void *b) {
+	u64 devino_a = ((struct hardlink_cache_entry*) a)->from_devino;
+	u64 devino_b = ((struct hardlink_cache_entry*) b)->from_devino;
+
+	return (devino_a > devino_b) - (devino_a < devino_b);
+}
+
 int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 {
 	struct f2fs_node *parent, *child;
-	struct node_info ni;
+	struct hardlink_cache_entry *find_hardlink = 0, *found_hardlink = 0;
+	void *search_result;
+	struct node_info ni, hardlink_ni;
 	struct f2fs_summary sum;
 	block_t blkaddr = NULL_ADDR;
 	int ret;
@@ -671,10 +681,41 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		goto free_parent_dir;
 	}
 
+	if (de->from_devino != 0) {
+		/* This might be a hardlink, try to find it in the cache */
+		find_hardlink = calloc(1, sizeof(struct hardlink_cache_entry));
+		find_hardlink->from_devino = de->from_devino;
+		find_hardlink->to_ino = 0;
+
+		search_result = tsearch(find_hardlink, &(sbi->hardlink_cache), cmp_from_devino);
+		ASSERT(search_result != 0);
+
+		found_hardlink = *(struct hardlink_cache_entry**) search_result;
+		ASSERT(find_hardlink->from_devino == found_hardlink->from_devino);
+
+		/* If it was already in the cache, free the entry we just created */
+		if (found_hardlink != find_hardlink)
+			free(find_hardlink);
+	}
+
 	child = calloc(BLOCK_SZ, 1);
 	ASSERT(child);
 
-	f2fs_alloc_nid(sbi, &de->ino);
+	if ((found_hardlink != 0) && (found_hardlink->to_ino != 0)) {
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
+		f2fs_alloc_nid(sbi, &de->ino);
+	}
 
 	init_inode_block(sbi, child, de);
 
@@ -689,6 +730,26 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		goto free_child_dir;
 	}
 
+	if (found_hardlink != 0) {
+		if (found_hardlink->to_ino == 0) {
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
@@ -697,6 +758,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	/* update nat info */
 	update_nat_blkaddr(sbi, de->ino, de->ino, blkaddr);
 
+write_child_dir:
 	ret = dev_write_block(child, blkaddr);
 	ASSERT(ret >= 0);
 
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 76e8272..a182e8e 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -221,6 +221,7 @@ struct dentry {
 	uint64_t capabilities;
 	nid_t ino;
 	nid_t pino;
+	u64 from_devino;
 };
 
 /* different from dnode_of_data in kernel */
@@ -234,6 +235,11 @@ struct dnode_of_data {
 	int idirty, ndirty;
 };
 
+struct hardlink_cache_entry {
+	u64 from_devino;
+	nid_t to_ino;
+};
+
 struct f2fs_sb_info {
 	struct f2fs_fsck *fsck;
 
@@ -276,6 +282,9 @@ struct f2fs_sb_info {
 
 	/* true if late_build_segment_manger() is called */
 	bool seg_manager_done;
+
+	/* keep track of hardlinks so we can recreate them */
+	void *hardlink_cache;
 };
 
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
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
