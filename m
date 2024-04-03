Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82288896740
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvQ1-0005mz-Hy;
	Wed, 03 Apr 2024 07:52:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvQ0-0005mh-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c8lpBdyF9DznCjSgkbHmb0HX9PX2+NlolbfNMD9N8MM=; b=ZNeIjW9lEiPiXiuLtfQIlas0bY
 DsJATQum0JANsakdQR8+z+O0b86VXIHUE6NYGTztlaoxkhZEia937pTsWwACgVI7I+TqwZFHLgtDm
 seRzVlRurzZQ/RGYDEFq/8+dcR6uQoE5iUHWkcgFz9J39sw/EOjC9sOJAJGjo2yXXxm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c8lpBdyF9DznCjSgkbHmb0HX9PX2+NlolbfNMD9N8MM=; b=CnjJ7JXEEUURvl3K1ZjWxsgOwD
 3ZuAqcTWF45g3LTu6qlFg+9OtSeCp0DRgOMNnXirMF/2EaiXlLdt+AeAdBAf6qhIw220fM8r+YLQq
 lFEUcM33aSe3GY0LJlhdOiwXqQU5x7s7FK2y2DsXYg36vwEUclHxt02LRY7YE2JNMweA=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPz-0001lE-GW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:24 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 85BD2807F9;
 Wed,  3 Apr 2024 03:33:15 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129596; bh=k2cIvdzLg3sljiZ/6znD/m3Ichqz9W7DWE80AeNEY2E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QewS3YWB1Udfrmc/U+d3uuM7Whmk18AUwovF8JVhddL2HNuIMXaUpIm41h3L4CYTs
 5KScePZY2mnNQLA2JWbk7uAmVjO/Q0ocd2pjHbwWhNJ9WeQQ6ErauUPhc3TSpxHsZz
 IzCe9DHOenanCyWyEZ7PBdaPAQOwz0o5/dwXJq9jHPTyz64Cm4WLLoL8mXGR5VAvFt
 ieU26UGsxvoUwgp6smA3DzC2kFa+OUkmSZV2Dtt5LZ15W88v7JyshorRDs/anyn52b
 qaT/UPkoL8UVb6bDkx5xa2Eliks4n2naoWdnSMU7ngNNU+5h23bqxiIVqnuLPee3y9
 ighpvtsu8WGLA==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:46 -0400
Message-ID: <62391207f8d60060fddc18404af600c4b4f9b170.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that fiemap allows returning extent physical size, make
 btrfs return the appropriate extent's actual disk size. Signed-off-by: Sweet
 Tea Dorminy <sweettea-kernel@dorminy.me> --- fs/btrfs/extent_io.c | 70
 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+), 25 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rrvPz-0001lE-GW
Subject: [f2fs-dev] [PATCH v3 05/13] btrfs: fiemap: return extent physical
 size
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that fiemap allows returning extent physical size, make btrfs return
the appropriate extent's actual disk size.

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/btrfs/extent_io.c | 70 ++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index e9df670ef7d2..b631f387cc3c 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2506,7 +2506,8 @@ int try_release_extent_mapping(struct page *page, gfp_t mask)
 struct btrfs_fiemap_entry {
 	u64 offset;
 	u64 phys;
-	u64 len;
+	u64 log_len;
+	u64 phys_len;
 	u32 flags;
 };
 
@@ -2564,7 +2565,8 @@ struct fiemap_cache {
 	/* Fields for the cached extent (unsubmitted, not ready, extent). */
 	u64 offset;
 	u64 phys;
-	u64 len;
+	u64 log_len;
+	u64 phys_len;
 	u32 flags;
 	bool cached;
 };
@@ -2577,8 +2579,8 @@ static int flush_fiemap_cache(struct fiemap_extent_info *fieinfo,
 		int ret;
 
 		ret = fiemap_fill_next_extent(fieinfo, entry->offset,
-					      entry->phys, entry->len, 0,
-					      entry->flags);
+					      entry->phys, entry->log_len,
+					      entry->phys_len, entry->flags);
 		/*
 		 * Ignore 1 (reached max entries) because we keep track of that
 		 * ourselves in emit_fiemap_extent().
@@ -2603,7 +2605,8 @@ static int flush_fiemap_cache(struct fiemap_extent_info *fieinfo,
  */
 static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 				struct fiemap_cache *cache,
-				u64 offset, u64 phys, u64 len, u32 flags)
+				u64 offset, u64 phys, u64 log_len,
+				u64 phys_len, u32 flags)
 {
 	struct btrfs_fiemap_entry *entry;
 	u64 cache_end;
@@ -2611,6 +2614,9 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 	/* Set at the end of extent_fiemap(). */
 	ASSERT((flags & FIEMAP_EXTENT_LAST) == 0);
 
+	/* We always set the correct physical length. */
+	flags |= FIEMAP_EXTENT_HAS_PHYS_LEN;
+
 	if (!cache->cached)
 		goto assign;
 
@@ -2646,7 +2652,7 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 	 * or equals to what we have in cache->offset. We deal with this as
 	 * described below.
 	 */
-	cache_end = cache->offset + cache->len;
+	cache_end = cache->offset + cache->log_len;
 	if (cache_end > offset) {
 		if (offset == cache->offset) {
 			/*
@@ -2670,10 +2676,10 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 			 * where a previously found file extent item was split
 			 * due to an ordered extent completing.
 			 */
-			cache->len = offset - cache->offset;
+			cache->log_len = offset - cache->offset;
 			goto emit;
 		} else {
-			const u64 range_end = offset + len;
+			const u64 range_end = offset + log_len;
 
 			/*
 			 * The offset of the file extent item we have just found
@@ -2706,11 +2712,13 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 			if (range_end <= cache_end)
 				return 0;
 
-			if (!(flags & (FIEMAP_EXTENT_DATA_COMPRESSED | FIEMAP_EXTENT_DELALLOC)))
+			if (!(flags & (FIEMAP_EXTENT_DATA_COMPRESSED | FIEMAP_EXTENT_DELALLOC))) {
 				phys += cache_end - offset;
+				phys_len -= cache_end - offset;
+			}
 
 			offset = cache_end;
-			len = range_end - cache_end;
+			log_len = range_end - cache_end;
 			goto emit;
 		}
 	}
@@ -2720,15 +2728,17 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 	 * 1) Their logical addresses are continuous
 	 *
 	 * 2) Their physical addresses are continuous
-	 *    So truly compressed (physical size smaller than logical size)
-	 *    extents won't get merged with each other
 	 *
 	 * 3) Share same flags
+	 *
+	 * 4) Not compressed
 	 */
-	if (cache->offset + cache->len  == offset &&
-	    cache->phys + cache->len == phys  &&
-	    cache->flags == flags) {
-		cache->len += len;
+	if (cache->offset + cache->log_len  == offset &&
+	    cache->phys + cache->log_len == phys  &&
+	    cache->flags == flags &&
+	    !(flags & FIEMAP_EXTENT_DATA_COMPRESSED)) {
+		cache->log_len += log_len;
+		cache->phys_len += phys_len;
 		return 0;
 	}
 
@@ -2745,7 +2755,7 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 		 * to miss it.
 		 */
 		entry = &cache->entries[cache->entries_size - 1];
-		cache->next_search_offset = entry->offset + entry->len;
+		cache->next_search_offset = entry->offset + entry->log_len;
 		cache->cached = false;
 
 		return BTRFS_FIEMAP_FLUSH_CACHE;
@@ -2754,7 +2764,8 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 	entry = &cache->entries[cache->entries_pos];
 	entry->offset = cache->offset;
 	entry->phys = cache->phys;
-	entry->len = cache->len;
+	entry->log_len = cache->log_len;
+	entry->phys_len = cache->phys_len;
 	entry->flags = cache->flags;
 	cache->entries_pos++;
 	cache->extents_mapped++;
@@ -2767,7 +2778,8 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 	cache->cached = true;
 	cache->offset = offset;
 	cache->phys = phys;
-	cache->len = len;
+	cache->log_len = log_len;
+	cache->phys_len = phys_len;
 	cache->flags = flags;
 
 	return 0;
@@ -2793,7 +2805,8 @@ static int emit_last_fiemap_cache(struct fiemap_extent_info *fieinfo,
 		return 0;
 
 	ret = fiemap_fill_next_extent(fieinfo, cache->offset, cache->phys,
-				      cache->len, 0, cache->flags);
+				      cache->log_len, cache->phys_len,
+				      cache->flags);
 	cache->cached = false;
 	if (ret > 0)
 		ret = 0;
@@ -2987,13 +3000,15 @@ static int fiemap_process_hole(struct btrfs_inode *inode,
 			}
 			ret = emit_fiemap_extent(fieinfo, cache, prealloc_start,
 						 disk_bytenr + extent_offset,
-						 prealloc_len, prealloc_flags);
+						 prealloc_len, prealloc_len,
+						 prealloc_flags);
 			if (ret)
 				return ret;
 			extent_offset += prealloc_len;
 		}
 
 		ret = emit_fiemap_extent(fieinfo, cache, delalloc_start, 0,
+					 delalloc_end + 1 - delalloc_start,
 					 delalloc_end + 1 - delalloc_start,
 					 FIEMAP_EXTENT_DELALLOC |
 					 FIEMAP_EXTENT_UNKNOWN);
@@ -3034,7 +3049,8 @@ static int fiemap_process_hole(struct btrfs_inode *inode,
 		}
 		ret = emit_fiemap_extent(fieinfo, cache, prealloc_start,
 					 disk_bytenr + extent_offset,
-					 prealloc_len, prealloc_flags);
+					 prealloc_len, prealloc_len,
+					 prealloc_flags);
 		if (ret)
 			return ret;
 	}
@@ -3180,6 +3196,7 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 extent_offset = 0;
 		u64 extent_gen;
 		u64 disk_bytenr = 0;
+		u64 disk_size = 0;
 		u64 flags = 0;
 		int extent_type;
 		u8 compression;
@@ -3242,7 +3259,7 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 			flags |= FIEMAP_EXTENT_DATA_INLINE;
 			flags |= FIEMAP_EXTENT_NOT_ALIGNED;
 			ret = emit_fiemap_extent(fieinfo, &cache, key.offset, 0,
-						 extent_len, flags);
+						 extent_len, extent_len, flags);
 		} else if (extent_type == BTRFS_FILE_EXTENT_PREALLOC) {
 			ret = fiemap_process_hole(inode, fieinfo, &cache,
 						  &delalloc_cached_state,
@@ -3257,6 +3274,7 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 						  backref_ctx, 0, 0, 0,
 						  key.offset, extent_end - 1);
 		} else {
+			disk_size = btrfs_file_extent_disk_num_bytes(leaf, ei);
 			/* We have a regular extent. */
 			if (fieinfo->fi_extents_max) {
 				ret = btrfs_is_data_extent_shared(inode,
@@ -3271,7 +3289,9 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 
 			ret = emit_fiemap_extent(fieinfo, &cache, key.offset,
 						 disk_bytenr + extent_offset,
-						 extent_len, flags);
+						 extent_len,
+						 disk_size - extent_offset,
+						 flags);
 		}
 
 		if (ret < 0) {
@@ -3309,7 +3329,7 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 		prev_extent_end = range_end;
 	}
 
-	if (cache.cached && cache.offset + cache.len >= last_extent_end) {
+	if (cache.cached && cache.offset + cache.log_len >= last_extent_end) {
 		const u64 i_size = i_size_read(&inode->vfs_inode);
 
 		if (prev_extent_end < i_size) {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
