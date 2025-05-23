Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2106AC1DB6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 09:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nw0J3Ajc76N77RniCA0sRVjFmwyWspBrzqRBeH9679U=; b=JhpU9KgPPSCH3hY9gqTwB6VJdB
	k0KlJTpl4N4hlwr2nReWtSh8YjxdSww1RKdk1bkywrG7fkZUAljE9ofir3Rf8e09F/YQuIM8f/YkG
	bCucWF5S3BqkqJoW9494xLSI6OsOZbDbh2scDA64DqUkO9qAOcYXENO7TjQa1NU8+cH4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIMuB-0006oD-7i;
	Fri, 23 May 2025 07:33:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uIMu9-0006o5-D3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 07:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L4vXnVQhBai0TLExjj06YMP+VVB2is7ILvcZ38vquDs=; b=CZM6bxP4S2EmSoUSWC+tJvs7we
 uyhexIGCLVD/DN2gCoYoC3S+BDqyVt6Saqh/kE5ZxbjhiEL+EBvdgUEmoLzl+cbISoHLmwFD1us4d
 eKKJIekqYLFjrS99Xl4RCILI5ZukoFkzHXitOUEi0Erkdg5sc7KinOrHNQNvpV8D7o7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L4vXnVQhBai0TLExjj06YMP+VVB2is7ILvcZ38vquDs=; b=I
 waGOpjxLgfnZeNj2SW0ZkP3HwpG1EECgCrfuvK7c/32lsQs58KS90DszDDAnHHzKp+Yi8PuPiDX4C
 ACiPFSijPPa9uHP5CwopZqys97dOs/s7dg/7Lyx6TpwXlbou6zy7QFsPQh7FJrupcvIJNatryFaek
 mKabiuiATVzgoZkQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uIMu8-0004GZ-PL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 07:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FC97629CD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 May 2025 07:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF43C4CEE9;
 Fri, 23 May 2025 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747985589;
 bh=pFnEr6hyNcgHZPVE1y0sFt2psdOkxyQ/M8O3rUFymBw=;
 h=From:To:Cc:Subject:Date:From;
 b=QUEN732j9i1x60vsIJjbh9rh/IJSccpyrHjJwLMrPXePPEuaL1gwosehnYT4YHNFY
 ++D2TPKIKMSssN30c2/Ly+v9zfEsOSHruTEOBBHsjqT9cLTscnZumxmvuHsNwJG6Qu
 qBpijUzM/gEcYGaznXhgVdJRAXX2Dr22pZuzzAWjGvbRlusVwyiSwVYm/QIGB/WFf1
 yx/9Mjk/+sXwc6VSikqgvXoLIwukl6wVyex07XdtaGn1LPuU0TkvLo4BtYAlaExe0a
 l0xhTRGqPffBPEl08ezAHgrobHHBPsaAh60oeBeS4046cJ61XdjHMN5yZ6maT2miKr
 xGP78/E5WF4RQ==
To: jaegeuk@kernel.org
Date: Fri, 23 May 2025 15:33:03 +0800
Message-ID: <20250523073304.1454247-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/checkpoint.c | 4 ++-- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h |
 13 +++++++++++-- fs/f2fs/gc.c | 2 +- fs/f2fs/node.c | 18 +++++++++---------
 5 files ch [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uIMu8-0004GZ-PL
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce is_{meta,node}_folio
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

Just cleanup, no changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/data.c       |  2 +-
 fs/f2fs/f2fs.h       | 13 +++++++++++--
 fs/f2fs/gc.c         |  2 +-
 fs/f2fs/node.c       | 18 +++++++++---------
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 164b7719f365..f149ec28aefd 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -93,7 +93,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE);
 
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping)) {
+	if (unlikely(!is_meta_folio(folio))) {
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
@@ -439,7 +439,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != mapping)) {
+			if (unlikely(!is_meta_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d8018083c31..1be38186076d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -354,7 +354,7 @@ static void f2fs_write_end_io(struct bio *bio)
 						STOP_CP_REASON_WRITE_FAIL);
 		}
 
-		f2fs_bug_on(sbi, folio->mapping == NODE_MAPPING(sbi) &&
+		f2fs_bug_on(sbi, is_node_folio(folio) &&
 				folio->index != nid_of_node(&folio->page));
 
 		dec_page_count(sbi, type);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e0196c285ad1..9333a22b9a01 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2088,6 +2088,16 @@ static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
 	return sbi->node_inode->i_mapping;
 }
 
+static inline bool is_meta_folio(struct folio *folio)
+{
+	return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
+}
+
+static inline bool is_node_folio(struct folio *folio)
+{
+	return folio->mapping == NODE_MAPPING(F2FS_F_SB(folio));
+}
+
 static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	return test_bit(type, &sbi->s_flag);
@@ -3738,8 +3748,7 @@ struct node_info;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi,
-		const struct folio *folio);
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3ff74267b52a..8b8025772340 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1382,7 +1382,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 							F2FS_BLKSIZE);
 
 		folio_lock(mfolio);
-		if (unlikely(mfolio->mapping != META_MAPPING(fio.sbi) ||
+		if (unlikely(!is_meta_folio(mfolio) ||
 			     !folio_test_uptodate(mfolio))) {
 			err = -EIO;
 			f2fs_folio_put(mfolio, true);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 88d3032236cb..1cb4cba7f961 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -310,10 +310,10 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 							start, nr);
 }
 
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, const struct folio *folio)
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	return NODE_MAPPING(sbi) == folio->mapping &&
-			IS_DNODE(&folio->page) && is_cold_node(&folio->page);
+	return is_node_folio(folio) && IS_DNODE(&folio->page) &&
+					is_cold_node(&folio->page);
 }
 
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
@@ -1222,7 +1222,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 			goto fail;
 		if (offset[1] == 0 && get_nid(&folio->page, offset[0], true)) {
 			folio_lock(folio);
-			BUG_ON(folio->mapping != NODE_MAPPING(sbi));
+			BUG_ON(!is_node_folio(folio));
 			set_nid(folio, offset[0], 0, true);
 			folio_unlock(folio);
 		}
@@ -1507,7 +1507,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 
 	folio_lock(folio);
 
-	if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+	if (unlikely(!is_node_folio(folio))) {
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
@@ -1625,7 +1625,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
@@ -1834,7 +1834,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
@@ -1969,7 +1969,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 
 			folio_lock(folio);
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi)))
+			if (unlikely(!is_node_folio(folio)))
 				goto unlock;
 			if (!folio_test_dirty(folio))
 				goto unlock;
@@ -2041,7 +2041,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			else if (!folio_trylock(folio))
 				continue;
 
-			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(!is_node_folio(folio))) {
 continue_unlock:
 				folio_unlock(folio);
 				continue;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
