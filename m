Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D454B16DE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 10:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6tyBUjrUBuUApnMLoHA5vI9YHgcjDkiytpIHu5LD2FY=; b=FKPP8DKuzfMLII4mxiBTueq3sd
	42oDgCW5r8n50SP+dqZxcOQCV1dLeTz5wEpcT9Pn3kxb5GOHEm4I5g0jJf6eim1xQIITCZvqISsDS
	cs8qz9kqtsbTSKJ7mgS5ouECCXUR8BqaL5N2WK9wgITUbasi+RY+tTLpHcjkTnKIUYCU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhOwS-0005ox-M0;
	Thu, 31 Jul 2025 08:47:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhOwR-0005oq-DV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 08:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jAu4f4Ldaj4Ij9iEn9Tc+YvbFnf9oTXm2av6itcPtyY=; b=c2n/YpFkDwr5V/ZQcJCIXTeGk9
 hN6J+Vjioj3nwykgJycdNyAcP9KMqxR7Zc/gLQW0uI73RXBUc7zbe/4COE2tTtTvXbAK51tFHEW2F
 0D0BxcVYADPZZ/ezw1NrhyYcOjWIxC8vSTzceYnLslqOJwB4N0iOgApqMDSapVHZthag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jAu4f4Ldaj4Ij9iEn9Tc+YvbFnf9oTXm2av6itcPtyY=; b=a
 7Qpsxp47Ow4LG3ASL/WSPldu7DIxjeVzGE6DxTO03C9UEFn2JK9KdlYqZ9+vk0J9qPkDlVtAeQ0jA
 bdAdrylRY+B9CKOq+8GNIna9drVjFEYRYkUAu1MCd/lXngvQ5hho1Pg7mFjgm0Xi2AqKXJluM8YI4
 QsgXedyyn56yQs4s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhOwQ-0004Qp-Lx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 08:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F597A54886
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Jul 2025 08:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3076C4CEEF;
 Thu, 31 Jul 2025 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753951624;
 bh=+fnwHN6QmOM/bnMzHAE1c3XypnhU/CSThAyt5NMS4Lc=;
 h=From:To:Cc:Subject:Date:From;
 b=e0QylBOISbcQcFdVw/z5zJaYjsiHJZKCB1DULdJno3c6QD44iWBPlU//WWpR5S3g5
 dJVgUjIIKWAfyR/6z4wLNpRsVfZ3uUvL3wfvGcurMN3uP6IYmyuRf3MX2bHhhOly4p
 ZDPWAQytOw06eEawx0TejyqBYPVy6qz84hUeI+v/cAWoiXhswdVOnNqze76kFK4Pce
 WdFpfvFQEU8NgD1uOdXIC+5Rp0OFHUohVuoJguhV2Q5E4fArGyQdW+ynw5oBf7J/fp
 J/LRGMgD77IPHEYZgw6u8h+Osps4MftZCPZnaCLpf8USgwOYc9Mtpyn//4VkuKyTmR
 KCIiry5ZIJLdA==
To: jaegeuk@kernel.org
Date: Thu, 31 Jul 2025 16:47:00 +0800
Message-ID: <20250731084700.1230841-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new sysfs entry
 /sys/fs/f2fs/<disk>/flush_policy
 in order to tune performance of f2fs data flush flow. For example, checkpoint
 will use REQ_FUA to persist CP metadata, however, some kind device has bad
 performance on REQ_FUA command, result in that checkpoint being blocked for
 long time, w/ this sysfs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uhOwQ-0004Qp-Lx
Subject: [f2fs-dev] [PATCH] f2fs: introduce flush_policy sysfs entry
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
in order to tune performance of f2fs data flush flow.

For example, checkpoint will use REQ_FUA to persist CP metadata, however,
some kind device has bad performance on REQ_FUA command, result in that
checkpoint being blocked for long time, w/ this sysfs entry, we can give
an option to use REQ_PREFLUSH command instead of REQ_FUA during checkpoint,
it can help to mitigate long latency of checkpoint.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/checkpoint.c                    | 10 +++++++++-
 fs/f2fs/f2fs.h                          |  7 +++++++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..2fedb44b713b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,12 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/flush_policy
+Date:		July 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	Device has different performance for the same flush methods, this node
+		can be used to tune performance by setting different flush methods.
+
+		policy value		description
+		0x00000001		Use preflush instead of fua during checkpoint
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bbe07e3a6c75..10cc27158770 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1419,7 +1419,9 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	f2fs_folio_put(folio, false);
 
 	/* submit checkpoint (with barrier if NOBARRIER is not set) */
-	f2fs_submit_merged_write(sbi, META_FLUSH);
+	f2fs_submit_merged_write(sbi,
+		sbi->flush_policy & BIT(FLUSH_POLICY_CP_NO_FUA) ?
+		META : META_FLUSH);
 }
 
 static inline u64 get_sectors_written(struct block_device *bdev)
@@ -1606,6 +1608,12 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 	stat_cp_time(cpc, CP_TIME_WAIT_LAST_CP);
 
+	if (sbi->flush_policy & BIT(FLUSH_POLICY_CP_NO_FUA)) {
+		err = f2fs_flush_device_cache(sbi);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * invalidate intermediate page cache borrowed from meta inode which are
 	 * used for migration of encrypted, verity or compressed inode's blocks.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5c0ea60e502e..5bba24ca15c8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1621,6 +1621,11 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
 
+enum flush_policy {
+	FLUSH_POLICY_CP_NO_FUA,
+	FLUSH_POLICY_MAX,
+};
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
@@ -1873,6 +1878,8 @@ struct f2fs_sb_info {
 	/* carve out reserved_blocks from total blocks */
 	bool carve_out;
 
+	unsigned int flush_policy;		/* flush policy */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..b69015f1dc67 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -852,6 +852,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "flush_policy")) {
+		if (t >= BIT(FLUSH_POLICY_MAX))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
 		if (t < 1 || t > SEGS_PER_SEC(sbi))
 			return -EINVAL;
@@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
+F2FS_SBI_GENERAL_RW_ATTR(flush_policy);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1371,6 +1379,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
 	ATTR_LIST(reserved_pin_section),
+	ATTR_LIST(flush_policy),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
