Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83693C8EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 21:46:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX4Pw-0003CI-Ui;
	Thu, 25 Jul 2024 19:46:24 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+eb6281b6209e17a76e98+7641+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sX4Pt-0003C8-K3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 19:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jqDmxIN9XYfEoJ1lJw2lmDAQGcP2I8XR4yUoBfPTYpA=; b=h5dG5MyCAoYmdEwg+cUWeGoFeH
 3lgoaGtfrAvJTZJ8Q+lzoi6o6c9Mdq+UfuojtP1JzgBZ0l+oFyGVAXQNesNdqKiGhHUpUocHF+Pox
 b6jz/HIv9hjdNlhhcJ0DyrNqH7r1z6uWOiNidkj4zNVKX8qUVp8e82lEyvCvqnS3yte4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqDmxIN9XYfEoJ1lJw2lmDAQGcP2I8XR4yUoBfPTYpA=; b=SGBFje6KEwdPN6wbKr4D2LKl9J
 q4/uK3AQMryK4VJWZ9NK1g2MDKw2d4LzE/Sd8GVpzgUBk2Yoso2sDTmIcxflmjKpo516EgClUP7dg
 abuU2AR3ghuE0M8NJ3Kf9pGAbyjvt18JPg52sKTotEouFEGOR69HHFvmQsCfxQI+EasQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX4Pr-0006aO-LB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 19:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jqDmxIN9XYfEoJ1lJw2lmDAQGcP2I8XR4yUoBfPTYpA=; b=YTtGc/snbQA/eb08BAnY9gMJ8t
 1HsVXNoj6nI+t2+fIC5Hoa8Cz+j+1pkYT7eU9t8a19SIA+8Rckfxa5GT8D2uTsqiZXULUiKkLyntw
 ir3uKsZH3TtnriPlCYcI54AWmrxBcUtmidqkerOuzg+SmIQZ6E8t4yIS73TXqSveqXwdHLcH3qrkn
 7qhTjjsi34+nS59fiMpswCr1CTjlHI8gjmqPpeih6Z3+VgGfmdIOOcjgkEQD6ixX8yqBim/PeOoLC
 G+jtW7Zkm8IUX5vmMdnUVr4rEvJSGgod5kuJGtWpGO1iVEWordeOLdj8o4Y6NlgVSIcbrl9m+wTwR
 P4gQUIhA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sX4PZ-00000001w8c-1MJP;
 Thu, 25 Jul 2024 19:46:01 +0000
Date: Thu, 25 Jul 2024 12:46:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: kreijack@inwind.it
Message-ID: <ZqKreStOD-eRkKZU@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 25, 2024 at 07:14:14PM +0200, Goffredo Baroncelli
 wrote: > Instead of relying to the "expected" order of the compiler/linker,
 > why doesn't manage the chain explicitly ? Something like: Because that
 doesn't actually solve anything over simple direct calls as you still need
 the symbols to be global? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sX4Pr-0006aO-LB
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 25, 2024 at 07:14:14PM +0200, Goffredo Baroncelli wrote:
> Instead of relying to the "expected" order of the compiler/linker,
> why doesn't manage the chain explicitly ? Something like:

Because that doesn't actually solve anything over simple direct calls
as you still need the symbols to be global?

As an example here is a very hacky patch that just compiles with unused
variable warnings and doesn't work at all to show how the distributed
module_subinit would improve ext4, the file system with the least
subinit calls of the three converted in the series, and without any
extra cleanups like removing now unneded includes or moving more stuff
into subinits if they can remain entirely static that way:

 11 files changed, 61 insertions(+), 114 deletions(-)

diff --git a/fs/ext4/block_validity.c b/fs/ext4/block_validity.c
index 87ee3a17bd29c9..87f0ccd06fc069 100644
--- a/fs/ext4/block_validity.c
+++ b/fs/ext4/block_validity.c
@@ -29,7 +29,7 @@ struct ext4_system_zone {
 
 static struct kmem_cache *ext4_system_zone_cachep;
 
-int __init ext4_init_system_zone(void)
+static int __init ext4_init_system_zone(void)
 {
 	ext4_system_zone_cachep = KMEM_CACHE(ext4_system_zone, 0);
 	if (ext4_system_zone_cachep == NULL)
@@ -37,11 +37,12 @@ int __init ext4_init_system_zone(void)
 	return 0;
 }
 
-void ext4_exit_system_zone(void)
+static void ext4_exit_system_zone(void)
 {
 	rcu_barrier();
 	kmem_cache_destroy(ext4_system_zone_cachep);
 }
+module_subinit(ext4_init_system_zone, ext4_exit_system_zone);
 
 static inline int can_merge(struct ext4_system_zone *entry1,
 		     struct ext4_system_zone *entry2)
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 08acd152261ed8..db81f18cdc3266 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2915,8 +2915,6 @@ void ext4_fc_del(struct inode *inode);
 bool ext4_fc_replay_check_excluded(struct super_block *sb, ext4_fsblk_t block);
 void ext4_fc_replay_cleanup(struct super_block *sb);
 int ext4_fc_commit(journal_t *journal, tid_t commit_tid);
-int __init ext4_fc_init_dentry_cache(void);
-void ext4_fc_destroy_dentry_cache(void);
 int ext4_fc_record_regions(struct super_block *sb, int ino,
 			   ext4_lblk_t lblk, ext4_fsblk_t pblk,
 			   int len, int replay);
@@ -2930,8 +2928,6 @@ extern void ext4_mb_release(struct super_block *);
 extern ext4_fsblk_t ext4_mb_new_blocks(handle_t *,
 				struct ext4_allocation_request *, int *);
 extern void ext4_discard_preallocations(struct inode *);
-extern int __init ext4_init_mballoc(void);
-extern void ext4_exit_mballoc(void);
 extern ext4_group_t ext4_mb_prefetch(struct super_block *sb,
 				     ext4_group_t group,
 				     unsigned int nr, int *cnt);
@@ -3651,8 +3647,6 @@ static inline void ext4_set_de_type(struct super_block *sb,
 /* readpages.c */
 extern int ext4_mpage_readpages(struct inode *inode,
 		struct readahead_control *rac, struct folio *folio);
-extern int __init ext4_init_post_read_processing(void);
-extern void ext4_exit_post_read_processing(void);
 
 /* symlink.c */
 extern const struct inode_operations ext4_encrypted_symlink_inode_operations;
@@ -3663,14 +3657,10 @@ extern const struct inode_operations ext4_fast_symlink_inode_operations;
 extern void ext4_notify_error_sysfs(struct ext4_sb_info *sbi);
 extern int ext4_register_sysfs(struct super_block *sb);
 extern void ext4_unregister_sysfs(struct super_block *sb);
-extern int __init ext4_init_sysfs(void);
-extern void ext4_exit_sysfs(void);
 
 /* block_validity */
 extern void ext4_release_system_zone(struct super_block *sb);
 extern int ext4_setup_system_zone(struct super_block *sb);
-extern int __init ext4_init_system_zone(void);
-extern void ext4_exit_system_zone(void);
 extern int ext4_inode_block_valid(struct inode *inode,
 				  ext4_fsblk_t start_blk,
 				  unsigned int count);
@@ -3750,8 +3740,6 @@ extern int ext4_move_extents(struct file *o_filp, struct file *d_filp,
 			     __u64 len, __u64 *moved_len);
 
 /* page-io.c */
-extern int __init ext4_init_pageio(void);
-extern void ext4_exit_pageio(void);
 extern ext4_io_end_t *ext4_init_io_end(struct inode *inode, gfp_t flags);
 extern ext4_io_end_t *ext4_get_io_end(ext4_io_end_t *io_end);
 extern int ext4_put_io_end(ext4_io_end_t *io_end);
diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 17dcf13adde275..d381ec88441ffd 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -156,19 +156,6 @@ static int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
 			    ext4_lblk_t len,
 			    struct pending_reservation **prealloc);
 
-int __init ext4_init_es(void)
-{
-	ext4_es_cachep = KMEM_CACHE(extent_status, SLAB_RECLAIM_ACCOUNT);
-	if (ext4_es_cachep == NULL)
-		return -ENOMEM;
-	return 0;
-}
-
-void ext4_exit_es(void)
-{
-	kmem_cache_destroy(ext4_es_cachep);
-}
-
 void ext4_es_init_tree(struct ext4_es_tree *tree)
 {
 	tree->root = RB_ROOT;
@@ -1883,18 +1870,25 @@ static void ext4_print_pending_tree(struct inode *inode)
 #define ext4_print_pending_tree(inode)
 #endif
 
-int __init ext4_init_pending(void)
+static int __init ext4_init_es(void)
 {
 	ext4_pending_cachep = KMEM_CACHE(pending_reservation, SLAB_RECLAIM_ACCOUNT);
 	if (ext4_pending_cachep == NULL)
 		return -ENOMEM;
+	ext4_es_cachep = KMEM_CACHE(extent_status, SLAB_RECLAIM_ACCOUNT);
+	if (ext4_es_cachep == NULL) {
+		kmem_cache_destroy(ext4_pending_cachep);
+		return -ENOMEM;
+	}
 	return 0;
 }
 
-void ext4_exit_pending(void)
+static void ext4_exit_es(void)
 {
+	kmem_cache_destroy(ext4_es_cachep);
 	kmem_cache_destroy(ext4_pending_cachep);
 }
+module_subinit(ext4_init_es, ext4_exit_es);
 
 void ext4_init_pending_tree(struct ext4_pending_tree *tree)
 {
diff --git a/fs/ext4/extents_status.h b/fs/ext4/extents_status.h
index 3c8e2edee5d5d1..1cdb25c3d2dae5 100644
--- a/fs/ext4/extents_status.h
+++ b/fs/ext4/extents_status.h
@@ -123,8 +123,6 @@ struct ext4_pending_tree {
 	struct rb_root root;
 };
 
-extern int __init ext4_init_es(void);
-extern void ext4_exit_es(void);
 extern void ext4_es_init_tree(struct ext4_es_tree *tree);
 
 extern void ext4_es_insert_extent(struct inode *inode, ext4_lblk_t lblk,
@@ -244,8 +242,6 @@ extern void ext4_es_unregister_shrinker(struct ext4_sb_info *sbi);
 
 extern int ext4_seq_es_shrinker_info_show(struct seq_file *seq, void *v);
 
-extern int __init ext4_init_pending(void);
-extern void ext4_exit_pending(void);
 extern void ext4_init_pending_tree(struct ext4_pending_tree *tree);
 extern void ext4_remove_pending(struct inode *inode, ext4_lblk_t lblk);
 extern bool ext4_is_pending(struct inode *inode, ext4_lblk_t lblk);
diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index 3926a05eceeed1..b28930c4175cca 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -2293,7 +2293,7 @@ int ext4_fc_info_show(struct seq_file *seq, void *v)
 	return 0;
 }
 
-int __init ext4_fc_init_dentry_cache(void)
+static int __init ext4_fc_init_dentry_cache(void)
 {
 	ext4_fc_dentry_cachep = KMEM_CACHE(ext4_fc_dentry_update,
 					   SLAB_RECLAIM_ACCOUNT);
@@ -2304,7 +2304,8 @@ int __init ext4_fc_init_dentry_cache(void)
 	return 0;
 }
 
-void ext4_fc_destroy_dentry_cache(void)
+static void ext4_fc_destroy_dentry_cache(void)
 {
 	kmem_cache_destroy(ext4_fc_dentry_cachep);
 }
+module_subinit(ext4_fc_init_dentry_cache, ext4_fc_destroy_dentry_cache);
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 9dda9cd68ab2f5..a564882432b8ff 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -3936,7 +3936,7 @@ void ext4_process_freed_data(struct super_block *sb, tid_t commit_tid)
 	}
 }
 
-int __init ext4_init_mballoc(void)
+static int __init ext4_init_mballoc(void)
 {
 	ext4_pspace_cachep = KMEM_CACHE(ext4_prealloc_space,
 					SLAB_RECLAIM_ACCOUNT);
@@ -3963,7 +3963,7 @@ int __init ext4_init_mballoc(void)
 	return -ENOMEM;
 }
 
-void ext4_exit_mballoc(void)
+static void ext4_exit_mballoc(void)
 {
 	/*
 	 * Wait for completion of call_rcu()'s on ext4_pspace_cachep
@@ -3975,6 +3975,7 @@ void ext4_exit_mballoc(void)
 	kmem_cache_destroy(ext4_free_data_cachep);
 	ext4_groupinfo_destroy_slabs();
 }
+module_subinit(ext4_init_mballoc, ext4_exit_mballoc);
 
 #define EXT4_MB_BITMAP_MARKED_CHECK 0x0001
 #define EXT4_MB_SYNC_UPDATE 0x0002
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index ad5543866d2152..68639d5553080a 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -33,7 +33,7 @@
 static struct kmem_cache *io_end_cachep;
 static struct kmem_cache *io_end_vec_cachep;
 
-int __init ext4_init_pageio(void)
+static int __init ext4_init_pageio(void)
 {
 	io_end_cachep = KMEM_CACHE(ext4_io_end, SLAB_RECLAIM_ACCOUNT);
 	if (io_end_cachep == NULL)
@@ -47,11 +47,12 @@ int __init ext4_init_pageio(void)
 	return 0;
 }
 
-void ext4_exit_pageio(void)
+static void ext4_exit_pageio(void)
 {
 	kmem_cache_destroy(io_end_cachep);
 	kmem_cache_destroy(io_end_vec_cachep);
 }
+module_subinit(ext4_init_pageio, ext4_exit_pageio);
 
 struct ext4_io_end_vec *ext4_alloc_io_end_vec(ext4_io_end_t *io_end)
 {
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 8494492582abea..5fa7329c571b42 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -390,7 +390,7 @@ int ext4_mpage_readpages(struct inode *inode,
 	return 0;
 }
 
-int __init ext4_init_post_read_processing(void)
+static int __init ext4_init_post_read_processing(void)
 {
 	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, SLAB_RECLAIM_ACCOUNT);
 
@@ -409,8 +409,9 @@ int __init ext4_init_post_read_processing(void)
 	return -ENOMEM;
 }
 
-void ext4_exit_post_read_processing(void)
+static void ext4_exit_post_read_processing(void)
 {
 	mempool_destroy(bio_post_read_ctx_pool);
 	kmem_cache_destroy(bio_post_read_ctx_cache);
 }
+module_subinit(ext4_init_post_read_processing, ext4_exit_post_read_processing);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 207076e7e7f055..bb6a87da00ea8c 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1484,29 +1484,6 @@ static void init_once(void *foo)
 	ext4_fc_init_inode(&ei->vfs_inode);
 }
 
-static int __init init_inodecache(void)
-{
-	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
-				sizeof(struct ext4_inode_info), 0,
-				SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT,
-				offsetof(struct ext4_inode_info, i_data),
-				sizeof_field(struct ext4_inode_info, i_data),
-				init_once);
-	if (ext4_inode_cachep == NULL)
-		return -ENOMEM;
-	return 0;
-}
-
-static void destroy_inodecache(void)
-{
-	/*
-	 * Make sure all delayed rcu free inodes are flushed before we
-	 * destroy cache.
-	 */
-	rcu_barrier();
-	kmem_cache_destroy(ext4_inode_cachep);
-}
-
 void ext4_clear_inode(struct inode *inode)
 {
 	ext4_fc_del(inode);
@@ -7302,33 +7279,13 @@ static struct file_system_type ext4_fs_type = {
 };
 MODULE_ALIAS_FS("ext4");
 
-static int register_ext(void)
-{
-	register_as_ext3();
-	register_as_ext2();
-	return register_filesystem(&ext4_fs_type);
-}
-
-static void unregister_ext(void)
-{
-	unregister_as_ext2();
-	unregister_as_ext3();
-	unregister_filesystem(&ext4_fs_type);
-}
-
-static struct subexitcall_rollback rollback;
-
-static void __exit ext4_exit_fs(void)
-{
-	ext4_destroy_lazyinit_thread();
-	module_subexit(&rollback);
-}
-
 /* Shared across all ext4 file systems */
 wait_queue_head_t ext4__ioend_wq[EXT4_WQ_HASH_SZ];
 
 static int __init ext4_init_fs(void)
 {
+	int error;
+
 	ratelimit_state_init(&ext4_mount_msg_ratelimit, 30 * HZ, 64);
 	ext4_li_info = NULL;
 
@@ -7338,23 +7295,40 @@ static int __init ext4_init_fs(void)
 	for (int i = 0; i < EXT4_WQ_HASH_SZ; i++)
 		init_waitqueue_head(&ext4__ioend_wq[i]);
 
-	module_subinit(ext4_init_es, ext4_exit_es, &rollback);
-	module_subinit(ext4_init_pending, ext4_exit_pending, &rollback);
-	module_subinit(ext4_init_post_read_processing, ext4_exit_post_read_processing, &rollback);
-	module_subinit(ext4_init_pageio, ext4_exit_pageio, &rollback);
-	module_subinit(ext4_init_system_zone, ext4_exit_system_zone, &rollback);
-	module_subinit(ext4_init_sysfs, ext4_exit_sysfs, &rollback);
-	module_subinit(ext4_init_mballoc, ext4_exit_mballoc, &rollback);
-	module_subinit(init_inodecache, destroy_inodecache, &rollback);
-	module_subinit(ext4_fc_init_dentry_cache, ext4_fc_destroy_dentry_cache, &rollback);
-	module_subinit(register_ext, unregister_ext, &rollback);
+	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
+				sizeof(struct ext4_inode_info), 0,
+				SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT,
+				offsetof(struct ext4_inode_info, i_data),
+				sizeof_field(struct ext4_inode_info, i_data),
+				init_once);
+	if (ext4_inode_cachep == NULL)
+		return -ENOMEM;
 
-	return 0;
+	register_as_ext3();
+	register_as_ext2();
+	error = register_filesystem(&ext4_fs_type);
+	if (error)
+		kmem_cache_destroy(ext4_inode_cachep);
+	return error;
+}
+
+static void __exit ext4_exit_fs(void)
+{
+	ext4_destroy_lazyinit_thread();
+	unregister_as_ext2();
+	unregister_as_ext3();
+	unregister_filesystem(&ext4_fs_type);
+
+	/*
+	 * Make sure all delayed rcu free inodes are flushed before we
+	 * destroy cache.
+	 */
+	rcu_barrier();
+	kmem_cache_destroy(ext4_inode_cachep);
 }
+module_subinit(ext4_init_fs, ext4_exit_fs);
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
 MODULE_DESCRIPTION("Fourth Extended Filesystem");
 MODULE_LICENSE("GPL");
 MODULE_SOFTDEP("pre: crc32c");
-module_init(ext4_init_fs)
-module_exit(ext4_exit_fs)
diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index ddb54608ca2ef6..df3096a9e6e39a 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -601,7 +601,7 @@ void ext4_unregister_sysfs(struct super_block *sb)
 	kobject_del(&sbi->s_kobj);
 }
 
-int __init ext4_init_sysfs(void)
+static int __init ext4_init_sysfs(void)
 {
 	int ret;
 
@@ -632,7 +632,7 @@ int __init ext4_init_sysfs(void)
 	return ret;
 }
 
-void ext4_exit_sysfs(void)
+static void ext4_exit_sysfs(void)
 {
 	kobject_put(ext4_feat);
 	ext4_feat = NULL;
@@ -641,4 +641,4 @@ void ext4_exit_sysfs(void)
 	remove_proc_entry(proc_dirname, NULL);
 	ext4_proc_root = NULL;
 }
-
+module_subinit(ext4_init_sysfs, ext4_exit_sysfs);
diff --git a/include/linux/module.h b/include/linux/module.h
index 95f7c60dede9a4..3099fb2c3d813b 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -80,23 +80,13 @@ extern void cleanup_module(void);
  * module_subinit() - Called when the driver is subinitialized
  * @initfn: The subinitialization function that is called
  * @exitfn: Corresponding exit function
- * @rollback: Record information when the subinitialization failed
- *            or the driver was removed
  *
  * Use module_subinit_noexit() when there is only an subinitialization
  * function but no corresponding exit function.
  */
-#define module_subinit(initfn, exitfn, rollback)	\
-	__subinitcall(initfn, exitfn, rollback);
+#define module_subinit(initfn, exitfn)
 
-#define module_subinit_noexit(initfn, rollback)		\
-	__subinitcall_noexit(initfn, rollback);
-
-/*
- * module_subexit() - Called when the driver exits
- */
-#define module_subexit(rollback)			\
-	__subexitcall_rollback(rollback);
+#define module_subinit_noexit(initfn)
 
 #ifndef MODULE
 /**


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
