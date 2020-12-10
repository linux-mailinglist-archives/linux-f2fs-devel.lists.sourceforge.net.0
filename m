Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6D2D6320
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 18:11:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knPTK-0007Ha-Uk; Thu, 10 Dec 2020 17:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1knPSy-0007GO-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 17:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wP79b4n9+QreGfkFbLthxsmds/BpH+otG658lRJ385s=; b=TzZLL1E60ZMXFSfNFPxFSJx78c
 AT5Y/fxl4RQR/bB5x4uh0QO/xG+H1rUaiu/PNjsH3A+Csy78U8bZbUqUXg0vTSAgzyK/5tvTXyMeX
 kMqya4Hz77MUn7qaIthWUVlI2oXEnYcW6X6ciTwpWidodfO92MhhjLeZGf9gFlXUAe2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wP79b4n9+QreGfkFbLthxsmds/BpH+otG658lRJ385s=; b=kU8s/w0Ef5+20iO33SS+ew2z/8
 YW6uoflZc8crksPsXFe0he6zufwVh3xdxJOzUxSNLg+gjX2jRF8lCJ0MdrSQDzxgAKiCQFyhCaCy1
 8e3Uf/aAVNZjIxZ5TSJtfQBPWLCfSdIf6XITDLXUV0gq2yW4LtsAOtAkfLM6v/GTEajg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knPSo-006kId-RY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 17:10:56 +0000
Date: Thu, 10 Dec 2020 09:10:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607620241;
 bh=U19F5fRXud/LEHwtNcCzJCUsZi756B8EOps696IDaDc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfvisroxZC1eJetoAd9ejRFJ+3k0oEYseXk8y4mzGIl/cisQIzf4PDoUP7S6AMSU7
 KmVKz4Z6/7m5OmvuGDkqAsB/i4zA65QYTio5doXUMuVGQ7uxYTRIcZDWmNaV81Hlam
 Ys3bv7RvWevkvcIte1yu8h3kIHkcNBFwM1UocGox6DVBV8PENxZEsrNj7i8E8WAhGw
 Z4qKqVjndo2tCKMffQ9vc3ecHd7R8XZRXEFoAMbKdA9jMi8C03didh1Lg2Cu3x7Sd+
 9ElNNC81L09vxZXdJFiyfrWEHc7+i4/zLpEcinJ2U0hK3e4bpuVqGf49cuZCLN61nd
 5GdsE1FPA9jGQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jordan Webb <jordan@getseam.com>
Message-ID: <X9JWj8lfBau57VV4@google.com>
References: <D741743D-EAFA-4C26-ACC2-2066AF51DCD4@getseam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D741743D-EAFA-4C26-ACC2-2066AF51DCD4@getseam.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: getseam.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1knPSo-006kId-RY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: Make sload.f2fs reproduce
 hard links
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thank you for the update.
If you don't mind, can I apply this directly into your patch?

---
 fsck/dir.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 7ea49ba8ff07..d599d88e9665 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -710,18 +710,23 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	child = calloc(BLOCK_SZ, 1);
 	ASSERT(child);
 
-	if (found_hardlink && found_hardlink->to_ino ) {
-		/* If we found this devino in the cache, we're creating a hard link */
+	if (found_hardlink && found_hardlink->to_ino) {
+		/*
+		 * If we found this devino in the cache, we're creating a
+		 * hard link.
+		 */
 		get_node_info(sbi, found_hardlink->to_ino, &hardlink_ni);
 		if (hardlink_ni.blk_addr == NULL_ADDR) {
-			MSG(0, "No original inode for hard link to_ino=%x\n", found_hardlink->to_ino);
+			MSG(1, "No original inode for hard link to_ino=%x\n",
+				found_hardlink->to_ino);
 			return -1;
 		}
 
 		/* Use previously-recorded inode */
 		de->ino = found_hardlink->to_ino;
 		blkaddr = hardlink_ni.blk_addr;
-		MSG(0, "Creating \"%s\" as hard link to inode %d\n", de->path, de->ino);
+		MSG(1, "Info: Creating \"%s\" as hard link to inode %d\n",
+				de->path, de->ino);
 	} else {
 		f2fs_alloc_nid(sbi, &de->ino);
 	}
@@ -741,11 +746,13 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 
 	if (found_hardlink) {
 		if (!found_hardlink->to_ino) {
-			MSG(0, "Adding inode %d from %s to hardlink cache\n", de->ino, de->path);
+			MSG(2, "Adding inode %d from %s to hardlink cache\n",
+				de->ino, de->path);
 			found_hardlink->to_ino = de->ino;
 		} else {
 			/* Replace child with original block */
 			free(child);
+
 			child = calloc(BLOCK_SZ, 1);
 			ASSERT(child);
 
@@ -753,8 +760,10 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 			ASSERT(ret >= 0);
 
 			/* Increment links and skip to writing block */
-			child->i.i_links++;
-			MSG(0, "Number of links on inode %d is now %d\n", de->ino, child->i.i_links);
+			child->i.i_links = cpu_to_le32(
+					le32_to_cpu(child->i.i_links) + 1);
+			MSG(2, "Number of links on inode %d is now %d\n",
+				de->ino, le32_to_cpu(child->i.i_links));
 			goto write_child_dir;
 		}
 	}
@@ -774,10 +783,14 @@ write_child_dir:
 	update_free_segments(sbi);
 	MSG(1, "Info: Create %s -> %s\n"
 		"  -- ino=%x, type=%x, mode=%x, uid=%x, "
-		"gid=%x, cap=%"PRIx64", size=%lu, pino=%x\n",
+		"gid=%x, cap=%"PRIx64", size=%lu, link=%u "
+		"blocks=%"PRIx64" pino=%x\n",
 		de->full_path, de->path,
 		de->ino, de->file_type, de->mode,
-		de->uid, de->gid, de->capabilities, de->size, de->pino);
+		de->uid, de->gid, de->capabilities, de->size,
+		le32_to_cpu(child->i.i_links),
+		le64_to_cpu(child->i.i_blocks),
+		de->pino);
 free_child_dir:
 	free(child);
 free_parent_dir:
-- 
2.29.2.576.ga3fc446d84-goog


On 12/10, Jordan Webb wrote:
> If sload.f2fs encounters a file with nr_links > 1, it will mark it
> as a possible hard link by remembering the original device and
> inode. When sload.f2fs creates the file, it will check if it has
> already created a file for the same original device and inode. If
> so, it will add the original inode to the directory and increment
> the number of links to it, instead of writing a new inode.
> 
> This allows sload.f2fs to accurately reproduce a directory tree that
> contains hard links, such as those created by ostree. Without this
> patch, directory trees containing hard links result in the content of
> the files being duplicated.
> 
> This is version 2 of the patch; it has been rebased against the dev
> branch and includes a fix from Jaegeuk Kim to avoid building data 
> contents twice on hard linked files.
> 
> Co-authored-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Jordan Webb <jordan@getseam.com>
> ---
>  fsck/dir.c     | 73 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  fsck/f2fs.h    | 10 +++++++
>  fsck/fsck.h    |  2 ++
>  fsck/segment.c | 11 ++++++++
>  fsck/sload.c   |  9 +++++++
>  5 files changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/dir.c b/fsck/dir.c
> index dc03c98..37b32f1 100644
> --- a/fsck/dir.c
> +++ b/fsck/dir.c
> @@ -15,6 +15,7 @@
>   */
>  #include "fsck.h"
>  #include "node.h"
> +#include <search.h>
>  
>  static int room_for_filename(const u8 *bitmap, int slots, int max_slots)
>  {
> @@ -634,10 +635,42 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
>  	return 0;
>  }
>  
> +static int cmp_from_devino(const void *a, const void *b) {
> +	u64 devino_a = ((struct hardlink_cache_entry*) a)->from_devino;
> +	u64 devino_b = ((struct hardlink_cache_entry*) b)->from_devino;
> +
> +	return (devino_a > devino_b) - (devino_a < devino_b);
> +}
> +
> +struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
> +						struct dentry *de)
> +{
> +	struct hardlink_cache_entry *find_hardlink = NULL;
> +	struct hardlink_cache_entry *found_hardlink = NULL;
> +	void *search_result;
> +
> +	/* This might be a hardlink, try to find it in the cache */
> +	find_hardlink = calloc(1, sizeof(struct hardlink_cache_entry));
> +	find_hardlink->from_devino = de->from_devino;
> +
> +	search_result = tsearch(find_hardlink, &(sbi->hardlink_cache), cmp_from_devino);
> +	ASSERT(search_result != 0);
> +
> +	found_hardlink = *(struct hardlink_cache_entry**) search_result;
> +	ASSERT(find_hardlink->from_devino == found_hardlink->from_devino);
> +
> +	/* If it was already in the cache, free the entry we just created */
> +	if (found_hardlink != find_hardlink)
> +		free(find_hardlink);
> +
> +	return found_hardlink;
> +}
> +
>  int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>  {
>  	struct f2fs_node *parent, *child;
> -	struct node_info ni;
> +	struct hardlink_cache_entry *found_hardlink = NULL;
> +	struct node_info ni, hardlink_ni;
>  	struct f2fs_summary sum;
>  	block_t blkaddr = NULL_ADDR;
>  	int ret;
> @@ -671,10 +704,27 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>  		goto free_parent_dir;
>  	}
>  
> +	if (de->from_devino)
> +		found_hardlink = f2fs_search_hardlink(sbi, de);
> +
>  	child = calloc(BLOCK_SZ, 1);
>  	ASSERT(child);
>  
> +	if (found_hardlink && found_hardlink->to_ino ) {
> +		/* If we found this devino in the cache, we're creating a hard link */
> +		get_node_info(sbi, found_hardlink->to_ino, &hardlink_ni);
> +		if (hardlink_ni.blk_addr == NULL_ADDR) {
> +			MSG(0, "No original inode for hard link to_ino=%x\n", found_hardlink->to_ino);
> +			return -1;
> +		}
> +
> +		/* Use previously-recorded inode */
> +		de->ino = found_hardlink->to_ino;
> +		blkaddr = hardlink_ni.blk_addr;
> +		MSG(0, "Creating \"%s\" as hard link to inode %d\n", de->path, de->ino);
> +	} else {
>  		f2fs_alloc_nid(sbi, &de->ino);
> +	}
>  
>  	init_inode_block(sbi, child, de);
>  
> @@ -689,6 +739,26 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>  		goto free_child_dir;
>  	}
>  
> +	if (found_hardlink) {
> +		if (!found_hardlink->to_ino) {
> +			MSG(0, "Adding inode %d from %s to hardlink cache\n", de->ino, de->path);
> +			found_hardlink->to_ino = de->ino;
> +		} else {
> +			/* Replace child with original block */
> +			free(child);
> +			child = calloc(BLOCK_SZ, 1);
> +			ASSERT(child);
> +
> +			ret = dev_read_block(child, blkaddr);
> +			ASSERT(ret >= 0);
> +
> +			/* Increment links and skip to writing block */
> +			child->i.i_links++;
> +			MSG(0, "Number of links on inode %d is now %d\n", de->ino, child->i.i_links);
> +			goto write_child_dir;
> +		}
> +	}
> +
>  	/* write child */
>  	set_summary(&sum, de->ino, 0, ni.version);
>  	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
> @@ -697,6 +767,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>  	/* update nat info */
>  	update_nat_blkaddr(sbi, de->ino, de->ino, blkaddr);
>  
> +write_child_dir:
>  	ret = dev_write_block(child, blkaddr);
>  	ASSERT(ret >= 0);
>  
> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> index 76e8272..9c6b0e4 100644
> --- a/fsck/f2fs.h
> +++ b/fsck/f2fs.h
> @@ -221,6 +221,7 @@ struct dentry {
>  	uint64_t capabilities;
>  	nid_t ino;
>  	nid_t pino;
> +	u64 from_devino;
>  };
>  
>  /* different from dnode_of_data in kernel */
> @@ -234,6 +235,12 @@ struct dnode_of_data {
>  	int idirty, ndirty;
>  };
>  
> +struct hardlink_cache_entry {
> +	u64 from_devino;
> +	nid_t to_ino;
> +	int nbuild;
> +};
> +
>  struct f2fs_sb_info {
>  	struct f2fs_fsck *fsck;
>  
> @@ -276,6 +283,9 @@ struct f2fs_sb_info {
>  
>  	/* true if late_build_segment_manger() is called */
>  	bool seg_manager_done;
> +
> +	/* keep track of hardlinks so we can recreate them */
> +	void *hardlink_cache;
>  };
>  
>  static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index c5e85fe..037aea9 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -296,6 +296,8 @@ int f2fs_find_path(struct f2fs_sb_info *, char *, nid_t *);
>  nid_t f2fs_lookup(struct f2fs_sb_info *, struct f2fs_node *, u8 *, int);
>  int f2fs_add_link(struct f2fs_sb_info *, struct f2fs_node *,
>  		const unsigned char *, int, nid_t, int, block_t, int);
> +struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
> +						struct dentry *de);
>  
>  /* xattr.c */
>  void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *);
> diff --git a/fsck/segment.c b/fsck/segment.c
> index 0487f41..878fb85 100644
> --- a/fsck/segment.c
> +++ b/fsck/segment.c
> @@ -351,6 +351,17 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
>  	if (de->ino == 0)
>  		return -1;
>  
> + 	if (de->from_devino) {
> + 		struct hardlink_cache_entry *found_hardlink;
> +
> + 		found_hardlink = f2fs_search_hardlink(sbi, de);
> + 		if (found_hardlink && found_hardlink->to_ino &&
> + 				found_hardlink->nbuild)
> + 			return 0;
> +
> + 		found_hardlink->nbuild++;
> + 	}
> +
>  	fd = open(de->full_path, O_RDONLY);
>  	if (fd < 0) {
>  		MSG(0, "Skip: Fail to open %s\n", de->full_path);
> diff --git a/fsck/sload.c b/fsck/sload.c
> index 14012fb..f3a6c12 100644
> --- a/fsck/sload.c
> +++ b/fsck/sload.c
> @@ -148,6 +148,12 @@ static void set_inode_metadata(struct dentry *de)
>  	}
>  
>  	if (S_ISREG(stat.st_mode)) {
> +		if (stat.st_nlink > 1) {
> +			/* This file might have multiple links to it, so remember device and inode */
> +			de->from_devino = stat.st_dev;
> +			de->from_devino <<= 32;
> +			de->from_devino |= stat.st_ino;
> +		}
>  		de->file_type = F2FS_FT_REG_FILE;
>  	} else if (S_ISDIR(stat.st_mode)) {
>  		de->file_type = F2FS_FT_DIR;
> @@ -333,6 +339,9 @@ int f2fs_sload(struct f2fs_sb_info *sbi)
>  	/* flush NAT/SIT journal entries */
>  	flush_journal_entries(sbi);
>  
> +	/* initialize empty hardlink cache */
> +	sbi->hardlink_cache = 0;
> +
>  	ret = build_directory(sbi, c.from_dir, "/",
>  					c.target_out_dir, F2FS_ROOT_INO(sbi));
>  	if (ret) {
> -- 
> 2.24.3 (Apple Git-128)
> 
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
