Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C25359EDA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Apr 2021 14:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lUqMK-00007F-Es; Fri, 09 Apr 2021 12:35:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lUqMH-00006a-N6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Apr 2021 12:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IO5r/YpNZxf2AxYLwsEVWcXAOXGV8l//uk33xno7t/U=; b=X6kLUuCsjvRBpBBvmvxrakbyaR
 oXABWSR4CXtnu65PZRRrnVlluOwhuCopT6mae+9Ct6INPWZecuqNbKCUhYA9LCDtRP2hyeH9wBlPQ
 hwCbRnwGutwQnpxJxJ221btV6EU5M6bRo2xSwhyFH42TsGcQO365LpyV/AseywrQOwXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IO5r/YpNZxf2AxYLwsEVWcXAOXGV8l//uk33xno7t/U=; b=kgLUT+ajw25kQ4QncPeCPQCXBM
 m/TWJOLUAlNWW77/8QR22M1FnkbXLg36VjXHuzJbsO69g6TmEMAHTRT/rKSo772l5wXgvPP9ywvTl
 LhqaVmMOm1km9aumYDg0Tzt+KWAERvvF8gXJ4E1r00BrONVXDmObB8zi7sqHrVjKoZWE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lUqLq-0004fW-7W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Apr 2021 12:35:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9118561105;
 Fri,  9 Apr 2021 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617971700;
 bh=Mc+NSUTF4IqJ/3PxRUgxvqOc2WebweOfuiAvd6kgm6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f38kEuvh0/2rHQuls8Kb7CHI9LAxtQjKXKgndtzweQkMDhapCFHs2/u7Np4s/Q+Ae
 WwqSc22/adEjNK1BG62dUXpLU3OBB/Xqv2IESuFoZoFXcpa1EpecoApQZkuI9XRh8N
 3LfcSF9eCWFTtF7arUM4s1XhE8XyeTeHu7h8+pvID4dC1hlpaA93/jqO0dlED5y7YT
 N1/ssWVxTMcUZcgFhqmIimlsJEACxbj8IOLB/ag/KMU33wdSr9FVJ9MQZBhnvEdhiI
 d3nK5YRUBDowz18qwQtRQ9OkBA/JtjSI9H8KOfMwFW1OyhZhcNiIi93seX0PyTjXTl
 YqQHFs1vfrWRQ==
Date: Fri, 9 Apr 2021 05:34:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YHBJ85/am9r6MjXm@google.com>
References: <20210409034033.40937-1-jack.qiu@huawei.com>
 <5f6cd575-00e5-a830-470a-67654f0d2149@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f6cd575-00e5-a830-470a-67654f0d2149@huawei.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lUqLq-0004fW-7W
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix missing a blank line after
 declarations
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
Cc: zhuangyi1@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hmm, can I combine all three clean-up patches into one? Any objection?

f2fs: fix missing a blank line after declarations
f2fs: Fix inappropriate spaces
f2fs: modify open brace '{' following function definitions

Is there another clean-up in the queue? :(

Thanks,

On 04/09, Chao Yu wrote:
> On 2021/4/9 11:40, Jack Qiu wrote:
> > Made suggested modifications from checkpatch in reference to WARNING:
> >   Missing a blank line after declarations
> 
> It's too trivial, and the old style may reappear again easily...
> Anyway, I'm not against this if Jaegeuk want to merge it. :)
> 
> Thanks,
> 
> > 
> > Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> > ---
> >   fs/f2fs/acl.c        |  1 +
> >   fs/f2fs/checkpoint.c |  1 +
> >   fs/f2fs/data.c       |  2 ++
> >   fs/f2fs/debug.c      |  3 +++
> >   fs/f2fs/dir.c        |  1 +
> >   fs/f2fs/gc.c         |  4 ++++
> >   fs/f2fs/inode.c      |  1 +
> >   fs/f2fs/namei.c      |  3 +++
> >   fs/f2fs/node.c       |  4 +++-
> >   fs/f2fs/recovery.c   |  1 +
> >   fs/f2fs/segment.c    | 10 ++++++++++
> >   fs/f2fs/super.c      |  1 +
> >   fs/f2fs/xattr.c      |  1 +
> >   13 files changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> > index 965037a9c205..239ad9453b99 100644
> > --- a/fs/f2fs/acl.c
> > +++ b/fs/f2fs/acl.c
> > @@ -29,6 +29,7 @@ static inline size_t f2fs_acl_size(int count)
> >   static inline int f2fs_acl_count(size_t size)
> >   {
> >   	ssize_t s;
> > +
> >   	size -= sizeof(struct f2fs_acl_header);
> >   	s = size - 4 * sizeof(struct f2fs_acl_entry_short);
> >   	if (s < 0) {
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index be5415a0dbbc..25486f2c49ca 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -719,6 +719,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
> >   		orphan_blk = (struct f2fs_orphan_block *)page_address(page);
> >   		for (j = 0; j < le32_to_cpu(orphan_blk->entry_count); j++) {
> >   			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
> > +
> >   			err = recover_orphan_inode(sbi, ino);
> >   			if (err) {
> >   				f2fs_put_page(page, 1);
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 3be2d6d8afa9..0854c383ff98 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1086,6 +1086,7 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
> > 
> >   	for (; count > 0; dn->ofs_in_node++) {
> >   		block_t blkaddr = f2fs_data_blkaddr(dn);
> > +
> >   		if (blkaddr == NULL_ADDR) {
> >   			dn->data_blkaddr = NEW_ADDR;
> >   			__set_data_blkaddr(dn);
> > @@ -3755,6 +3756,7 @@ int f2fs_migrate_page(struct address_space *mapping,
> > 
> >   	if (atomic_written) {
> >   		struct inmem_pages *cur;
> > +
> >   		list_for_each_entry(cur, &fi->inmem_pages, list)
> >   			if (cur->page == page) {
> >   				cur->page = newpage;
> > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > index 7007447714ee..4b08c290d4ff 100644
> > --- a/fs/f2fs/debug.c
> > +++ b/fs/f2fs/debug.c
> > @@ -173,6 +173,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
> >   	si->util_invalid = 50 - si->util_free - si->util_valid;
> >   	for (i = CURSEG_HOT_DATA; i < NO_CHECK_TYPE; i++) {
> >   		struct curseg_info *curseg = CURSEG_I(sbi, i);
> > +
> >   		si->curseg[i] = curseg->segno;
> >   		si->cursec[i] = GET_SEC_FROM_SEG(sbi, curseg->segno);
> >   		si->curzone[i] = GET_ZONE_FROM_SEC(sbi, si->cursec[i]);
> > @@ -300,10 +301,12 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
> >   	si->page_mem = 0;
> >   	if (sbi->node_inode) {
> >   		unsigned npages = NODE_MAPPING(sbi)->nrpages;
> > +
> >   		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
> >   	}
> >   	if (sbi->meta_inode) {
> >   		unsigned npages = META_MAPPING(sbi)->nrpages;
> > +
> >   		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
> >   	}
> >   }
> > diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> > index e6270a867be1..ebf65c5fac40 100644
> > --- a/fs/f2fs/dir.c
> > +++ b/fs/f2fs/dir.c
> > @@ -473,6 +473,7 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
> >   		struct page *page, struct inode *inode)
> >   {
> >   	enum page_type type = f2fs_has_inline_dentry(dir) ? NODE : DATA;
> > +
> >   	lock_page(page);
> >   	f2fs_wait_on_page_writeback(page, type, true, true);
> >   	de->ino = cpu_to_le32(inode->i_ino);
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 74b0c3ea9cab..695347789e14 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -162,6 +162,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
> >   void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
> >   {
> >   	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
> > +
> >   	if (!gc_th)
> >   		return;
> >   	kthread_stop(gc_th->f2fs_gc_task);
> > @@ -828,6 +829,7 @@ static void add_gc_inode(struct gc_inode_list *gc_list, struct inode *inode)
> >   static void put_gc_inode(struct gc_inode_list *gc_list)
> >   {
> >   	struct inode_entry *ie, *next_ie;
> > +
> >   	list_for_each_entry_safe(ie, next_ie, &gc_list->ilist, list) {
> >   		radix_tree_delete(&gc_list->iroot, ie->inode->i_ino);
> >   		iput(ie->inode);
> > @@ -952,9 +954,11 @@ block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode)
> >   		bidx = node_ofs - 1;
> >   	} else if (node_ofs <= indirect_blks) {
> >   		int dec = (node_ofs - 4) / (NIDS_PER_BLOCK + 1);
> > +
> >   		bidx = node_ofs - 2 - dec;
> >   	} else {
> >   		int dec = (node_ofs - indirect_blks - 3) / (NIDS_PER_BLOCK + 1);
> > +
> >   		bidx = node_ofs - 5 - dec;
> >   	}
> >   	return bidx * ADDRS_PER_BLOCK(inode) + ADDRS_PER_INODE(inode);
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 349d9cb933ee..a524a9ac2a72 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -666,6 +666,7 @@ void f2fs_update_inode_page(struct inode *inode)
> >   	node_page = f2fs_get_node_page(sbi, inode->i_ino);
> >   	if (IS_ERR(node_page)) {
> >   		int err = PTR_ERR(node_page);
> > +
> >   		if (err == -ENOMEM) {
> >   			cond_resched();
> >   			goto retry;
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 17bd072a5d39..405d85dbf9f1 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -419,6 +419,7 @@ struct dentry *f2fs_get_parent(struct dentry *child)
> >   	struct qstr dotdot = QSTR_INIT("..", 2);
> >   	struct page *page;
> >   	unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot, &page);
> > +
> >   	if (!ino) {
> >   		if (IS_ERR(page))
> >   			return ERR_CAST(page);
> > @@ -628,6 +629,7 @@ static const char *f2fs_get_link(struct dentry *dentry,
> >   				 struct delayed_call *done)
> >   {
> >   	const char *link = page_get_link(dentry, inode, done);
> > +
> >   	if (!IS_ERR(link) && !*link) {
> >   		/* this is broken symlink case */
> >   		do_delayed_call(done);
> > @@ -766,6 +768,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
> >   static int f2fs_rmdir(struct inode *dir, struct dentry *dentry)
> >   {
> >   	struct inode *inode = d_inode(dentry);
> > +
> >   	if (f2fs_empty_dir(inode))
> >   		return f2fs_unlink(dir, dentry);
> >   	return -ENOTEMPTY;
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index fc058060199e..56b326fec3bc 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -462,6 +462,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
> >   	/* increment version no as node is removed */
> >   	if (nat_get_blkaddr(e) != NEW_ADDR && new_blkaddr == NULL_ADDR) {
> >   		unsigned char version = nat_get_version(e);
> > +
> >   		nat_set_version(e, inc_node_version(version));
> >   	}
> > 
> > @@ -2117,8 +2118,8 @@ static int __insert_free_nid(struct f2fs_sb_info *sbi,
> >   				struct free_nid *i)
> >   {
> >   	struct f2fs_nm_info *nm_i = NM_I(sbi);
> > -
> >   	int err = radix_tree_insert(&nm_i->free_nid_root, i->nid, i);
> > +
> >   	if (err)
> >   		return err;
> > 
> > @@ -2980,6 +2981,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> >   	while ((found = __gang_lookup_nat_set(nm_i,
> >   					set_idx, SETVEC_SIZE, setvec))) {
> >   		unsigned idx;
> > +
> >   		set_idx = setvec[found - 1]->set + 1;
> >   		for (idx = 0; idx < found; idx++)
> >   			__adjust_nat_entry_set(setvec[idx], &sets,
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index 58f06c167e56..422146c6d866 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -458,6 +458,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
> >   	/* Get the previous summary */
> >   	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
> >   		struct curseg_info *curseg = CURSEG_I(sbi, i);
> > +
> >   		if (curseg->segno == segno) {
> >   			sum = curseg->sum_blk->entries[blkoff];
> >   			goto got_it;
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index c2866561263e..85c1a25d7a83 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2142,6 +2142,7 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
> >   					unsigned int segno, int modified)
> >   {
> >   	struct seg_entry *se = get_seg_entry(sbi, segno);
> > +
> >   	se->type = type;
> >   	if (modified)
> >   		__mark_sit_entry_dirty(sbi, segno);
> > @@ -2333,6 +2334,7 @@ static void __add_sum_entry(struct f2fs_sb_info *sbi, int type,
> >   {
> >   	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >   	void *addr = curseg->sum_blk;
> > +
> >   	addr += curseg->next_blkoff * sizeof(struct f2fs_summary);
> >   	memcpy(addr, sum, sizeof(struct f2fs_summary));
> >   }
> > @@ -3717,6 +3719,7 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
> > 
> >   		for (j = 0; j < blk_off; j++) {
> >   			struct f2fs_summary *s;
> > +
> >   			s = (struct f2fs_summary *)(kaddr + offset);
> >   			seg_i->sum_blk->entries[j] = *s;
> >   			offset += SUMMARY_SIZE;
> > @@ -3779,6 +3782,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
> >   		if (__exist_node_summaries(sbi)) {
> >   			struct f2fs_summary *ns = &sum->entries[0];
> >   			int i;
> > +
> >   			for (i = 0; i < sbi->blocks_per_seg; i++, ns++) {
> >   				ns->version = 0;
> >   				ns->ofs_in_node = 0;
> > @@ -3880,6 +3884,7 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
> >   	/* Step 3: write summary entries */
> >   	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
> >   		unsigned short blkoff;
> > +
> >   		seg_i = CURSEG_I(sbi, i);
> >   		if (sbi->ckpt->alloc_type[i] == SSR)
> >   			blkoff = sbi->blocks_per_seg;
> > @@ -3916,6 +3921,7 @@ static void write_normal_summaries(struct f2fs_sb_info *sbi,
> >   					block_t blkaddr, int type)
> >   {
> >   	int i, end;
> > +
> >   	if (IS_DATASEG(type))
> >   		end = type + NR_CURSEG_DATA_TYPE;
> >   	else
> > @@ -4499,6 +4505,7 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
> >   	/* set use the current segments */
> >   	for (type = CURSEG_HOT_DATA; type <= CURSEG_COLD_NODE; type++) {
> >   		struct curseg_info *curseg_t = CURSEG_I(sbi, type);
> > +
> >   		__set_test_and_inuse(sbi, curseg_t->segno);
> >   	}
> >   }
> > @@ -4849,6 +4856,7 @@ struct check_zone_write_pointer_args {
> >   static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
> >   				      void *data) {
> >   	struct check_zone_write_pointer_args *args;
> > +
> >   	args = (struct check_zone_write_pointer_args *)data;
> > 
> >   	return check_zone_write_pointer(args->sbi, args->fdev, zone);
> > @@ -5127,6 +5135,7 @@ static void discard_dirty_segmap(struct f2fs_sb_info *sbi,
> >   static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
> >   {
> >   	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> > +
> >   	kvfree(dirty_i->victim_secmap);
> >   }
> > 
> > @@ -5171,6 +5180,7 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
> >   static void destroy_free_segmap(struct f2fs_sb_info *sbi)
> >   {
> >   	struct free_segmap_info *free_i = SM_I(sbi)->free_info;
> > +
> >   	if (!free_i)
> >   		return;
> >   	SM_I(sbi)->free_info = NULL;
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 864916fe1d0d..e203b2540128 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -555,6 +555,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > 
> >   	while ((p = strsep(&options, ",")) != NULL) {
> >   		int token;
> > +
> >   		if (!*p)
> >   			continue;
> >   		/*
> > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > index 490f843ec3bf..c8f34decbf8e 100644
> > --- a/fs/f2fs/xattr.c
> > +++ b/fs/f2fs/xattr.c
> > @@ -488,6 +488,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
> >   		f2fs_wait_on_page_writeback(xpage, NODE, true, true);
> >   	} else {
> >   		struct dnode_of_data dn;
> > +
> >   		set_new_dnode(&dn, inode, NULL, NULL, new_nid);
> >   		xpage = f2fs_new_node_page(&dn, XATTR_NODE_OFFSET);
> >   		if (IS_ERR(xpage)) {
> > --
> > 2.17.1
> > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 
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
