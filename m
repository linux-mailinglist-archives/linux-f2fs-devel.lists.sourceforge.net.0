Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15533F9FA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 01:57:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUgyi-00010k-9H; Wed, 13 Nov 2019 00:57:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iUgyf-00010N-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 00:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NV4FY56D9+hjaW6hz34eynnLBQWzfr21FsEwgJh2ss=; b=iIsaQISfFmfiDYRruvmoT/XgsJ
 pVOT/A60k3r7wm7ZD14JiDdTHkC5rUZfJ2+n5b4Q0JcFRcqeKLENI8LBVS4CQm8t2YsCkjjiN8KWD
 nmmYLcwo5sSa36E1ZLb0rL4Ip5D4FmR2Ma0IM6pX5zD5jkv7DcMTLU9xx0vtrY0PJH/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NV4FY56D9+hjaW6hz34eynnLBQWzfr21FsEwgJh2ss=; b=kjzmAGBopjA44Gj3PqbOmeHA7k
 z1BBuBz0XTS2oCeo0/V/Auq9/5N0GTygMHM+4qDDgNU3qo8ekV6tMpOPxmUqPT0fMCAv82elwC4c0
 iRhpje1RitEgEmh1ds/knZDLeELsFIyVQcDz4bL0AzYpHqUAQL8FEfE4FBbejzZZbNX0=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUgya-00E6pD-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 00:57:44 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAD0tX4D167612;
 Wed, 13 Nov 2019 00:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=0NV4FY56D9+hjaW6hz34eynnLBQWzfr21FsEwgJh2ss=;
 b=d0Win83uZDoAtuA+cMbms0B03Y6VZHuvaGHJ6fo/pRRi1Xgw0cbtv9srkYjYJOF746BE
 F4jpFec5hUn7IErIHPaaANRY8SCHmYTBBeXoSQPJU+yKpVvmd62PujIyy69K4AdB+RZK
 jthQoVX4wfYyU4rgBvhfIAa0i1RmaIxhuzQCfR7d1+ho4sBPvEaDMVfxVc57Ot+5L/if
 ueTuldkUENH8E74unKP0ZjRSYrlrKHsiUESH0sf+fQjICLbKI8Zh48mLLII6tx9AS8Jf
 tUJiAvRzebsvZUs5Xtgjvq+U9xEKDFSiqM2RCj5WOrjF3ouQgGN59grrBN9Elv6nDrXU Dg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2w5p3qrh1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 00:57:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAD0nl7Y067321;
 Wed, 13 Nov 2019 00:57:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2w7vpnbbqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 00:57:20 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAD0vCbX011996;
 Wed, 13 Nov 2019 00:57:13 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 16:57:12 -0800
Date: Tue, 12 Nov 2019 16:57:10 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: ira.weiny@intel.com
Message-ID: <20191113005710.GD6219@magnolia>
References: <20191113004244.9981-1-ira.weiny@intel.com>
 <20191113004244.9981-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113004244.9981-3-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130001
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUgya-00E6pD-Ec
Subject: Re: [f2fs-dev] [PATCH V2 2/2] fs: Move swap_[de]activate to
 file_operations
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 12, 2019 at 04:42:44PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> swap_activate() and swap_deactivate() have nothing to do with address
> spaces.  We want to be able to change the address space operations on
> the fly to allow changing inode flags dynamically.
> 
> Switching address space operations can be difficult to do reliably.[1]
> Therefore, to simplify switching address space operations we reduce the
> number of functions in those operations by moving swap_activate() and
> swap_deactivate() out of the address space operations.
> 
> No functionality is changed with this patch.
> 
> This has been tested with XFS but not NFS, f2fs, or btrfs.
> 
> Also note we move some functions to facilitate compilation.  But there
> are no functional changes are contained within those diffs.
> 
> [1] https://lkml.org/lkml/2019/11/11/572
> 
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V0:
> 	Update cover letter.
> 	fix btrfs as per Andrew's comments
> 	change xfs_iomap_swapfile_activate() to xfs_file_swap_activate()
> 
> Changes from V1:
> 	Update recipients list
> 
> 
>  fs/btrfs/file.c    | 341 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/btrfs/inode.c   | 340 --------------------------------------------
>  fs/f2fs/data.c     | 122 ----------------
>  fs/f2fs/file.c     | 122 ++++++++++++++++
>  fs/nfs/file.c      |   4 +-
>  fs/xfs/xfs_aops.c  |  13 --
>  fs/xfs/xfs_file.c  |  12 ++
>  include/linux/fs.h |  10 +-
>  mm/swapfile.c      |  12 +-

For /only/ the xfs and mm parts,
Acked-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

>  9 files changed, 487 insertions(+), 489 deletions(-)
> 
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 0cb43b682789..117502311fe0 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -16,6 +16,7 @@
>  #include <linux/btrfs.h>
>  #include <linux/uio.h>
>  #include <linux/iversion.h>
> +#include <linux/swap.h>
>  #include "ctree.h"
>  #include "disk-io.h"
>  #include "transaction.h"
> @@ -27,6 +28,7 @@
>  #include "qgroup.h"
>  #include "compression.h"
>  #include "delalloc-space.h"
> +#include "block-group.h"
>  
>  static struct kmem_cache *btrfs_inode_defrag_cachep;
>  /*
> @@ -3444,6 +3446,343 @@ static int btrfs_file_open(struct inode *inode, struct file *filp)
>  	return generic_file_open(inode, filp);
>  }
>  
> +#ifdef CONFIG_SWAP
> +/*
> + * Add an entry indicating a block group or device which is pinned by a
> + * swapfile. Returns 0 on success, 1 if there is already an entry for it, or a
> + * negative errno on failure.
> + */
> +static int btrfs_add_swapfile_pin(struct inode *inode, void *ptr,
> +				  bool is_block_group)
> +{
> +	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> +	struct btrfs_swapfile_pin *sp, *entry;
> +	struct rb_node **p;
> +	struct rb_node *parent = NULL;
> +
> +	sp = kmalloc(sizeof(*sp), GFP_NOFS);
> +	if (!sp)
> +		return -ENOMEM;
> +	sp->ptr = ptr;
> +	sp->inode = inode;
> +	sp->is_block_group = is_block_group;
> +
> +	spin_lock(&fs_info->swapfile_pins_lock);
> +	p = &fs_info->swapfile_pins.rb_node;
> +	while (*p) {
> +		parent = *p;
> +		entry = rb_entry(parent, struct btrfs_swapfile_pin, node);
> +		if (sp->ptr < entry->ptr ||
> +		    (sp->ptr == entry->ptr && sp->inode < entry->inode)) {
> +			p = &(*p)->rb_left;
> +		} else if (sp->ptr > entry->ptr ||
> +			   (sp->ptr == entry->ptr && sp->inode > entry->inode)) {
> +			p = &(*p)->rb_right;
> +		} else {
> +			spin_unlock(&fs_info->swapfile_pins_lock);
> +			kfree(sp);
> +			return 1;
> +		}
> +	}
> +	rb_link_node(&sp->node, parent, p);
> +	rb_insert_color(&sp->node, &fs_info->swapfile_pins);
> +	spin_unlock(&fs_info->swapfile_pins_lock);
> +	return 0;
> +}
> +
> +/* Free all of the entries pinned by this swapfile. */
> +static void btrfs_free_swapfile_pins(struct inode *inode)
> +{
> +	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> +	struct btrfs_swapfile_pin *sp;
> +	struct rb_node *node, *next;
> +
> +	spin_lock(&fs_info->swapfile_pins_lock);
> +	node = rb_first(&fs_info->swapfile_pins);
> +	while (node) {
> +		next = rb_next(node);
> +		sp = rb_entry(node, struct btrfs_swapfile_pin, node);
> +		if (sp->inode == inode) {
> +			rb_erase(&sp->node, &fs_info->swapfile_pins);
> +			if (sp->is_block_group)
> +				btrfs_put_block_group(sp->ptr);
> +			kfree(sp);
> +		}
> +		node = next;
> +	}
> +	spin_unlock(&fs_info->swapfile_pins_lock);
> +}
> +
> +struct btrfs_swap_info {
> +	u64 start;
> +	u64 block_start;
> +	u64 block_len;
> +	u64 lowest_ppage;
> +	u64 highest_ppage;
> +	unsigned long nr_pages;
> +	int nr_extents;
> +};
> +
> +static int btrfs_add_swap_extent(struct swap_info_struct *sis,
> +				 struct btrfs_swap_info *bsi)
> +{
> +	unsigned long nr_pages;
> +	u64 first_ppage, first_ppage_reported, next_ppage;
> +	int ret;
> +
> +	first_ppage = ALIGN(bsi->block_start, PAGE_SIZE) >> PAGE_SHIFT;
> +	next_ppage = ALIGN_DOWN(bsi->block_start + bsi->block_len,
> +				PAGE_SIZE) >> PAGE_SHIFT;
> +
> +	if (first_ppage >= next_ppage)
> +		return 0;
> +	nr_pages = next_ppage - first_ppage;
> +
> +	first_ppage_reported = first_ppage;
> +	if (bsi->start == 0)
> +		first_ppage_reported++;
> +	if (bsi->lowest_ppage > first_ppage_reported)
> +		bsi->lowest_ppage = first_ppage_reported;
> +	if (bsi->highest_ppage < (next_ppage - 1))
> +		bsi->highest_ppage = next_ppage - 1;
> +
> +	ret = add_swap_extent(sis, bsi->nr_pages, nr_pages, first_ppage);
> +	if (ret < 0)
> +		return ret;
> +	bsi->nr_extents += ret;
> +	bsi->nr_pages += nr_pages;
> +	return 0;
> +}
> +
> +static void btrfs_swap_deactivate(struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +
> +	btrfs_free_swapfile_pins(inode);
> +	atomic_dec(&BTRFS_I(inode)->root->nr_swapfiles);
> +}
> +
> +static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> +			       sector_t *span)
> +{
> +	struct inode *inode = file_inode(file);
> +	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> +	struct extent_io_tree *io_tree = &BTRFS_I(inode)->io_tree;
> +	struct extent_state *cached_state = NULL;
> +	struct extent_map *em = NULL;
> +	struct btrfs_device *device = NULL;
> +	struct btrfs_swap_info bsi = {
> +		.lowest_ppage = (sector_t)-1ULL,
> +	};
> +	int ret = 0;
> +	u64 isize;
> +	u64 start;
> +
> +	/*
> +	 * If the swap file was just created, make sure delalloc is done. If the
> +	 * file changes again after this, the user is doing something stupid and
> +	 * we don't really care.
> +	 */
> +	ret = btrfs_wait_ordered_range(inode, 0, (u64)-1);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The inode is locked, so these flags won't change after we check them.
> +	 */
> +	if (BTRFS_I(inode)->flags & BTRFS_INODE_COMPRESS) {
> +		btrfs_warn(fs_info, "swapfile must not be compressed");
> +		return -EINVAL;
> +	}
> +	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATACOW)) {
> +		btrfs_warn(fs_info, "swapfile must not be copy-on-write");
> +		return -EINVAL;
> +	}
> +	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM)) {
> +		btrfs_warn(fs_info, "swapfile must not be checksummed");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Balance or device remove/replace/resize can move stuff around from
> +	 * under us. The EXCL_OP flag makes sure they aren't running/won't run
> +	 * concurrently while we are mapping the swap extents, and
> +	 * fs_info->swapfile_pins prevents them from running while the swap file
> +	 * is active and moving the extents. Note that this also prevents a
> +	 * concurrent device add which isn't actually necessary, but it's not
> +	 * really worth the trouble to allow it.
> +	 */
> +	if (test_and_set_bit(BTRFS_FS_EXCL_OP, &fs_info->flags)) {
> +		btrfs_warn(fs_info,
> +	   "cannot activate swapfile while exclusive operation is running");
> +		return -EBUSY;
> +	}
> +	/*
> +	 * Snapshots can create extents which require COW even if NODATACOW is
> +	 * set. We use this counter to prevent snapshots. We must increment it
> +	 * before walking the extents because we don't want a concurrent
> +	 * snapshot to run after we've already checked the extents.
> +	 */
> +	atomic_inc(&BTRFS_I(inode)->root->nr_swapfiles);
> +
> +	isize = ALIGN_DOWN(inode->i_size, fs_info->sectorsize);
> +
> +	lock_extent_bits(io_tree, 0, isize - 1, &cached_state);
> +	start = 0;
> +	while (start < isize) {
> +		u64 logical_block_start, physical_block_start;
> +		struct btrfs_block_group_cache *bg;
> +		u64 len = isize - start;
> +
> +		em = btrfs_get_extent(BTRFS_I(inode), NULL, 0, start, len, 0);
> +		if (IS_ERR(em)) {
> +			ret = PTR_ERR(em);
> +			goto out;
> +		}
> +
> +		if (em->block_start == EXTENT_MAP_HOLE) {
> +			btrfs_warn(fs_info, "swapfile must not have holes");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		if (em->block_start == EXTENT_MAP_INLINE) {
> +			/*
> +			 * It's unlikely we'll ever actually find ourselves
> +			 * here, as a file small enough to fit inline won't be
> +			 * big enough to store more than the swap header, but in
> +			 * case something changes in the future, let's catch it
> +			 * here rather than later.
> +			 */
> +			btrfs_warn(fs_info, "swapfile must not be inline");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
> +			btrfs_warn(fs_info, "swapfile must not be compressed");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		logical_block_start = em->block_start + (start - em->start);
> +		len = min(len, em->len - (start - em->start));
> +		free_extent_map(em);
> +		em = NULL;
> +
> +		ret = can_nocow_extent(inode, start, &len, NULL, NULL, NULL);
> +		if (ret < 0) {
> +			goto out;
> +		} else if (ret) {
> +			ret = 0;
> +		} else {
> +			btrfs_warn(fs_info,
> +				   "swapfile must not be copy-on-write");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		em = btrfs_get_chunk_map(fs_info, logical_block_start, len);
> +		if (IS_ERR(em)) {
> +			ret = PTR_ERR(em);
> +			goto out;
> +		}
> +
> +		if (em->map_lookup->type & BTRFS_BLOCK_GROUP_PROFILE_MASK) {
> +			btrfs_warn(fs_info,
> +				   "swapfile must have single data profile");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (device == NULL) {
> +			device = em->map_lookup->stripes[0].dev;
> +			ret = btrfs_add_swapfile_pin(inode, device, false);
> +			if (ret == 1)
> +				ret = 0;
> +			else if (ret)
> +				goto out;
> +		} else if (device != em->map_lookup->stripes[0].dev) {
> +			btrfs_warn(fs_info, "swapfile must be on one device");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		physical_block_start = (em->map_lookup->stripes[0].physical +
> +					(logical_block_start - em->start));
> +		len = min(len, em->len - (logical_block_start - em->start));
> +		free_extent_map(em);
> +		em = NULL;
> +
> +		bg = btrfs_lookup_block_group(fs_info, logical_block_start);
> +		if (!bg) {
> +			btrfs_warn(fs_info,
> +			   "could not find block group containing swapfile");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		ret = btrfs_add_swapfile_pin(inode, bg, true);
> +		if (ret) {
> +			btrfs_put_block_group(bg);
> +			if (ret == 1)
> +				ret = 0;
> +			else
> +				goto out;
> +		}
> +
> +		if (bsi.block_len &&
> +		    bsi.block_start + bsi.block_len == physical_block_start) {
> +			bsi.block_len += len;
> +		} else {
> +			if (bsi.block_len) {
> +				ret = btrfs_add_swap_extent(sis, &bsi);
> +				if (ret)
> +					goto out;
> +			}
> +			bsi.start = start;
> +			bsi.block_start = physical_block_start;
> +			bsi.block_len = len;
> +		}
> +
> +		start += len;
> +	}
> +
> +	if (bsi.block_len)
> +		ret = btrfs_add_swap_extent(sis, &bsi);
> +
> +out:
> +	if (!IS_ERR_OR_NULL(em))
> +		free_extent_map(em);
> +
> +	unlock_extent_cached(io_tree, 0, isize - 1, &cached_state);
> +
> +	if (ret)
> +		btrfs_swap_deactivate(file);
> +
> +	clear_bit(BTRFS_FS_EXCL_OP, &fs_info->flags);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (device)
> +		sis->bdev = device->bdev;
> +	*span = bsi.highest_ppage - bsi.lowest_ppage + 1;
> +	sis->max = bsi.nr_pages;
> +	sis->pages = bsi.nr_pages - 1;
> +	sis->highest_bit = bsi.nr_pages - 1;
> +	return bsi.nr_extents;
> +}
> +#else
> +static void btrfs_swap_deactivate(struct file *file)
> +{
> +}
> +
> +static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> +			       sector_t *span)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  const struct file_operations btrfs_file_operations = {
>  	.llseek		= btrfs_file_llseek,
>  	.read_iter      = generic_file_read_iter,
> @@ -3459,6 +3798,8 @@ const struct file_operations btrfs_file_operations = {
>  	.compat_ioctl	= btrfs_compat_ioctl,
>  #endif
>  	.remap_file_range = btrfs_remap_file_range,
> +	.swap_activate	= btrfs_swap_activate,
> +	.swap_deactivate = btrfs_swap_deactivate,
>  };
>  
>  void __cold btrfs_auto_defrag_exit(void)
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 6d159df7b536..c11b86f2bf24 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -27,7 +27,6 @@
>  #include <linux/uio.h>
>  #include <linux/magic.h>
>  #include <linux/iversion.h>
> -#include <linux/swap.h>
>  #include <linux/sched/mm.h>
>  #include <asm/unaligned.h>
>  #include "misc.h"
> @@ -10629,343 +10628,6 @@ void btrfs_set_range_writeback(struct extent_io_tree *tree, u64 start, u64 end)
>  	}
>  }
>  
> -#ifdef CONFIG_SWAP
> -/*
> - * Add an entry indicating a block group or device which is pinned by a
> - * swapfile. Returns 0 on success, 1 if there is already an entry for it, or a
> - * negative errno on failure.
> - */
> -static int btrfs_add_swapfile_pin(struct inode *inode, void *ptr,
> -				  bool is_block_group)
> -{
> -	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> -	struct btrfs_swapfile_pin *sp, *entry;
> -	struct rb_node **p;
> -	struct rb_node *parent = NULL;
> -
> -	sp = kmalloc(sizeof(*sp), GFP_NOFS);
> -	if (!sp)
> -		return -ENOMEM;
> -	sp->ptr = ptr;
> -	sp->inode = inode;
> -	sp->is_block_group = is_block_group;
> -
> -	spin_lock(&fs_info->swapfile_pins_lock);
> -	p = &fs_info->swapfile_pins.rb_node;
> -	while (*p) {
> -		parent = *p;
> -		entry = rb_entry(parent, struct btrfs_swapfile_pin, node);
> -		if (sp->ptr < entry->ptr ||
> -		    (sp->ptr == entry->ptr && sp->inode < entry->inode)) {
> -			p = &(*p)->rb_left;
> -		} else if (sp->ptr > entry->ptr ||
> -			   (sp->ptr == entry->ptr && sp->inode > entry->inode)) {
> -			p = &(*p)->rb_right;
> -		} else {
> -			spin_unlock(&fs_info->swapfile_pins_lock);
> -			kfree(sp);
> -			return 1;
> -		}
> -	}
> -	rb_link_node(&sp->node, parent, p);
> -	rb_insert_color(&sp->node, &fs_info->swapfile_pins);
> -	spin_unlock(&fs_info->swapfile_pins_lock);
> -	return 0;
> -}
> -
> -/* Free all of the entries pinned by this swapfile. */
> -static void btrfs_free_swapfile_pins(struct inode *inode)
> -{
> -	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> -	struct btrfs_swapfile_pin *sp;
> -	struct rb_node *node, *next;
> -
> -	spin_lock(&fs_info->swapfile_pins_lock);
> -	node = rb_first(&fs_info->swapfile_pins);
> -	while (node) {
> -		next = rb_next(node);
> -		sp = rb_entry(node, struct btrfs_swapfile_pin, node);
> -		if (sp->inode == inode) {
> -			rb_erase(&sp->node, &fs_info->swapfile_pins);
> -			if (sp->is_block_group)
> -				btrfs_put_block_group(sp->ptr);
> -			kfree(sp);
> -		}
> -		node = next;
> -	}
> -	spin_unlock(&fs_info->swapfile_pins_lock);
> -}
> -
> -struct btrfs_swap_info {
> -	u64 start;
> -	u64 block_start;
> -	u64 block_len;
> -	u64 lowest_ppage;
> -	u64 highest_ppage;
> -	unsigned long nr_pages;
> -	int nr_extents;
> -};
> -
> -static int btrfs_add_swap_extent(struct swap_info_struct *sis,
> -				 struct btrfs_swap_info *bsi)
> -{
> -	unsigned long nr_pages;
> -	u64 first_ppage, first_ppage_reported, next_ppage;
> -	int ret;
> -
> -	first_ppage = ALIGN(bsi->block_start, PAGE_SIZE) >> PAGE_SHIFT;
> -	next_ppage = ALIGN_DOWN(bsi->block_start + bsi->block_len,
> -				PAGE_SIZE) >> PAGE_SHIFT;
> -
> -	if (first_ppage >= next_ppage)
> -		return 0;
> -	nr_pages = next_ppage - first_ppage;
> -
> -	first_ppage_reported = first_ppage;
> -	if (bsi->start == 0)
> -		first_ppage_reported++;
> -	if (bsi->lowest_ppage > first_ppage_reported)
> -		bsi->lowest_ppage = first_ppage_reported;
> -	if (bsi->highest_ppage < (next_ppage - 1))
> -		bsi->highest_ppage = next_ppage - 1;
> -
> -	ret = add_swap_extent(sis, bsi->nr_pages, nr_pages, first_ppage);
> -	if (ret < 0)
> -		return ret;
> -	bsi->nr_extents += ret;
> -	bsi->nr_pages += nr_pages;
> -	return 0;
> -}
> -
> -static void btrfs_swap_deactivate(struct file *file)
> -{
> -	struct inode *inode = file_inode(file);
> -
> -	btrfs_free_swapfile_pins(inode);
> -	atomic_dec(&BTRFS_I(inode)->root->nr_swapfiles);
> -}
> -
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -			       sector_t *span)
> -{
> -	struct inode *inode = file_inode(file);
> -	struct btrfs_fs_info *fs_info = BTRFS_I(inode)->root->fs_info;
> -	struct extent_io_tree *io_tree = &BTRFS_I(inode)->io_tree;
> -	struct extent_state *cached_state = NULL;
> -	struct extent_map *em = NULL;
> -	struct btrfs_device *device = NULL;
> -	struct btrfs_swap_info bsi = {
> -		.lowest_ppage = (sector_t)-1ULL,
> -	};
> -	int ret = 0;
> -	u64 isize;
> -	u64 start;
> -
> -	/*
> -	 * If the swap file was just created, make sure delalloc is done. If the
> -	 * file changes again after this, the user is doing something stupid and
> -	 * we don't really care.
> -	 */
> -	ret = btrfs_wait_ordered_range(inode, 0, (u64)-1);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * The inode is locked, so these flags won't change after we check them.
> -	 */
> -	if (BTRFS_I(inode)->flags & BTRFS_INODE_COMPRESS) {
> -		btrfs_warn(fs_info, "swapfile must not be compressed");
> -		return -EINVAL;
> -	}
> -	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATACOW)) {
> -		btrfs_warn(fs_info, "swapfile must not be copy-on-write");
> -		return -EINVAL;
> -	}
> -	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM)) {
> -		btrfs_warn(fs_info, "swapfile must not be checksummed");
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Balance or device remove/replace/resize can move stuff around from
> -	 * under us. The EXCL_OP flag makes sure they aren't running/won't run
> -	 * concurrently while we are mapping the swap extents, and
> -	 * fs_info->swapfile_pins prevents them from running while the swap file
> -	 * is active and moving the extents. Note that this also prevents a
> -	 * concurrent device add which isn't actually necessary, but it's not
> -	 * really worth the trouble to allow it.
> -	 */
> -	if (test_and_set_bit(BTRFS_FS_EXCL_OP, &fs_info->flags)) {
> -		btrfs_warn(fs_info,
> -	   "cannot activate swapfile while exclusive operation is running");
> -		return -EBUSY;
> -	}
> -	/*
> -	 * Snapshots can create extents which require COW even if NODATACOW is
> -	 * set. We use this counter to prevent snapshots. We must increment it
> -	 * before walking the extents because we don't want a concurrent
> -	 * snapshot to run after we've already checked the extents.
> -	 */
> -	atomic_inc(&BTRFS_I(inode)->root->nr_swapfiles);
> -
> -	isize = ALIGN_DOWN(inode->i_size, fs_info->sectorsize);
> -
> -	lock_extent_bits(io_tree, 0, isize - 1, &cached_state);
> -	start = 0;
> -	while (start < isize) {
> -		u64 logical_block_start, physical_block_start;
> -		struct btrfs_block_group_cache *bg;
> -		u64 len = isize - start;
> -
> -		em = btrfs_get_extent(BTRFS_I(inode), NULL, 0, start, len, 0);
> -		if (IS_ERR(em)) {
> -			ret = PTR_ERR(em);
> -			goto out;
> -		}
> -
> -		if (em->block_start == EXTENT_MAP_HOLE) {
> -			btrfs_warn(fs_info, "swapfile must not have holes");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -		if (em->block_start == EXTENT_MAP_INLINE) {
> -			/*
> -			 * It's unlikely we'll ever actually find ourselves
> -			 * here, as a file small enough to fit inline won't be
> -			 * big enough to store more than the swap header, but in
> -			 * case something changes in the future, let's catch it
> -			 * here rather than later.
> -			 */
> -			btrfs_warn(fs_info, "swapfile must not be inline");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -		if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
> -			btrfs_warn(fs_info, "swapfile must not be compressed");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
> -		logical_block_start = em->block_start + (start - em->start);
> -		len = min(len, em->len - (start - em->start));
> -		free_extent_map(em);
> -		em = NULL;
> -
> -		ret = can_nocow_extent(inode, start, &len, NULL, NULL, NULL);
> -		if (ret < 0) {
> -			goto out;
> -		} else if (ret) {
> -			ret = 0;
> -		} else {
> -			btrfs_warn(fs_info,
> -				   "swapfile must not be copy-on-write");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
> -		em = btrfs_get_chunk_map(fs_info, logical_block_start, len);
> -		if (IS_ERR(em)) {
> -			ret = PTR_ERR(em);
> -			goto out;
> -		}
> -
> -		if (em->map_lookup->type & BTRFS_BLOCK_GROUP_PROFILE_MASK) {
> -			btrfs_warn(fs_info,
> -				   "swapfile must have single data profile");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
> -		if (device == NULL) {
> -			device = em->map_lookup->stripes[0].dev;
> -			ret = btrfs_add_swapfile_pin(inode, device, false);
> -			if (ret == 1)
> -				ret = 0;
> -			else if (ret)
> -				goto out;
> -		} else if (device != em->map_lookup->stripes[0].dev) {
> -			btrfs_warn(fs_info, "swapfile must be on one device");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
> -		physical_block_start = (em->map_lookup->stripes[0].physical +
> -					(logical_block_start - em->start));
> -		len = min(len, em->len - (logical_block_start - em->start));
> -		free_extent_map(em);
> -		em = NULL;
> -
> -		bg = btrfs_lookup_block_group(fs_info, logical_block_start);
> -		if (!bg) {
> -			btrfs_warn(fs_info,
> -			   "could not find block group containing swapfile");
> -			ret = -EINVAL;
> -			goto out;
> -		}
> -
> -		ret = btrfs_add_swapfile_pin(inode, bg, true);
> -		if (ret) {
> -			btrfs_put_block_group(bg);
> -			if (ret == 1)
> -				ret = 0;
> -			else
> -				goto out;
> -		}
> -
> -		if (bsi.block_len &&
> -		    bsi.block_start + bsi.block_len == physical_block_start) {
> -			bsi.block_len += len;
> -		} else {
> -			if (bsi.block_len) {
> -				ret = btrfs_add_swap_extent(sis, &bsi);
> -				if (ret)
> -					goto out;
> -			}
> -			bsi.start = start;
> -			bsi.block_start = physical_block_start;
> -			bsi.block_len = len;
> -		}
> -
> -		start += len;
> -	}
> -
> -	if (bsi.block_len)
> -		ret = btrfs_add_swap_extent(sis, &bsi);
> -
> -out:
> -	if (!IS_ERR_OR_NULL(em))
> -		free_extent_map(em);
> -
> -	unlock_extent_cached(io_tree, 0, isize - 1, &cached_state);
> -
> -	if (ret)
> -		btrfs_swap_deactivate(file);
> -
> -	clear_bit(BTRFS_FS_EXCL_OP, &fs_info->flags);
> -
> -	if (ret)
> -		return ret;
> -
> -	if (device)
> -		sis->bdev = device->bdev;
> -	*span = bsi.highest_ppage - bsi.lowest_ppage + 1;
> -	sis->max = bsi.nr_pages;
> -	sis->pages = bsi.nr_pages - 1;
> -	sis->highest_bit = bsi.nr_pages - 1;
> -	return bsi.nr_extents;
> -}
> -#else
> -static void btrfs_swap_deactivate(struct file *file)
> -{
> -}
> -
> -static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -			       sector_t *span)
> -{
> -	return -EOPNOTSUPP;
> -}
> -#endif
> -
>  static const struct inode_operations btrfs_dir_inode_operations = {
>  	.getattr	= btrfs_getattr,
>  	.lookup		= btrfs_lookup,
> @@ -11032,8 +10694,6 @@ static const struct address_space_operations btrfs_aops = {
>  	.releasepage	= btrfs_releasepage,
>  	.set_page_dirty	= btrfs_set_page_dirty,
>  	.error_remove_page = generic_error_remove_page,
> -	.swap_activate	= btrfs_swap_activate,
> -	.swap_deactivate = btrfs_swap_deactivate,
>  };
>  
>  static const struct inode_operations btrfs_file_inode_operations = {
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3c7777bfae17..04b2a8f44fa9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -14,7 +14,6 @@
>  #include <linux/pagevec.h>
>  #include <linux/blkdev.h>
>  #include <linux/bio.h>
> -#include <linux/swap.h>
>  #include <linux/prefetch.h>
>  #include <linux/uio.h>
>  #include <linux/cleancache.h>
> @@ -3142,125 +3141,6 @@ int f2fs_migrate_page(struct address_space *mapping,
>  }
>  #endif
>  
> -#ifdef CONFIG_SWAP
> -/* Copied from generic_swapfile_activate() to check any holes */
> -static int check_swap_activate(struct file *swap_file, unsigned int max)
> -{
> -	struct inode *inode = swap_file->f_mapping->host;
> -	unsigned blocks_per_page;
> -	unsigned long page_no;
> -	unsigned blkbits;
> -	sector_t probe_block;
> -	sector_t last_block;
> -	sector_t lowest_block = -1;
> -	sector_t highest_block = 0;
> -
> -	blkbits = inode->i_blkbits;
> -	blocks_per_page = PAGE_SIZE >> blkbits;
> -
> -	/*
> -	 * Map all the blocks into the extent list.  This code doesn't try
> -	 * to be very smart.
> -	 */
> -	probe_block = 0;
> -	page_no = 0;
> -	last_block = i_size_read(inode) >> blkbits;
> -	while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
> -		unsigned block_in_page;
> -		sector_t first_block;
> -
> -		cond_resched();
> -
> -		first_block = bmap(inode, probe_block);
> -		if (first_block == 0)
> -			goto bad_bmap;
> -
> -		/*
> -		 * It must be PAGE_SIZE aligned on-disk
> -		 */
> -		if (first_block & (blocks_per_page - 1)) {
> -			probe_block++;
> -			goto reprobe;
> -		}
> -
> -		for (block_in_page = 1; block_in_page < blocks_per_page;
> -					block_in_page++) {
> -			sector_t block;
> -
> -			block = bmap(inode, probe_block + block_in_page);
> -			if (block == 0)
> -				goto bad_bmap;
> -			if (block != first_block + block_in_page) {
> -				/* Discontiguity */
> -				probe_block++;
> -				goto reprobe;
> -			}
> -		}
> -
> -		first_block >>= (PAGE_SHIFT - blkbits);
> -		if (page_no) {	/* exclude the header page */
> -			if (first_block < lowest_block)
> -				lowest_block = first_block;
> -			if (first_block > highest_block)
> -				highest_block = first_block;
> -		}
> -
> -		page_no++;
> -		probe_block += blocks_per_page;
> -reprobe:
> -		continue;
> -	}
> -	return 0;
> -
> -bad_bmap:
> -	pr_err("swapon: swapfile has holes\n");
> -	return -EINVAL;
> -}
> -
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span)
> -{
> -	struct inode *inode = file_inode(file);
> -	int ret;
> -
> -	if (!S_ISREG(inode->i_mode))
> -		return -EINVAL;
> -
> -	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> -		return -EROFS;
> -
> -	ret = f2fs_convert_inline_inode(inode);
> -	if (ret)
> -		return ret;
> -
> -	ret = check_swap_activate(file, sis->max);
> -	if (ret)
> -		return ret;
> -
> -	set_inode_flag(inode, FI_PIN_FILE);
> -	f2fs_precache_extents(inode);
> -	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> -	return 0;
> -}
> -
> -static void f2fs_swap_deactivate(struct file *file)
> -{
> -	struct inode *inode = file_inode(file);
> -
> -	clear_inode_flag(inode, FI_PIN_FILE);
> -}
> -#else
> -static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
> -static void f2fs_swap_deactivate(struct file *file)
> -{
> -}
> -#endif
> -
>  const struct address_space_operations f2fs_dblock_aops = {
>  	.readpage	= f2fs_read_data_page,
>  	.readpages	= f2fs_read_data_pages,
> @@ -3273,8 +3153,6 @@ const struct address_space_operations f2fs_dblock_aops = {
>  	.releasepage	= f2fs_release_page,
>  	.direct_IO	= f2fs_direct_IO,
>  	.bmap		= f2fs_bmap,
> -	.swap_activate  = f2fs_swap_activate,
> -	.swap_deactivate = f2fs_swap_deactivate,
>  #ifdef CONFIG_MIGRATION
>  	.migratepage    = f2fs_migrate_page,
>  #endif
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 483ad22a0946..de7f9cf36689 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -21,6 +21,7 @@
>  #include <linux/uuid.h>
>  #include <linux/file.h>
>  #include <linux/nls.h>
> +#include <linux/swap.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -3466,6 +3467,125 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  }
>  #endif
>  
> +#ifdef CONFIG_SWAP
> +/* Copied from generic_swapfile_activate() to check any holes */
> +static int check_swap_activate(struct file *swap_file, unsigned int max)
> +{
> +	struct inode *inode = swap_file->f_mapping->host;
> +	unsigned blocks_per_page;
> +	unsigned long page_no;
> +	unsigned blkbits;
> +	sector_t probe_block;
> +	sector_t last_block;
> +	sector_t lowest_block = -1;
> +	sector_t highest_block = 0;
> +
> +	blkbits = inode->i_blkbits;
> +	blocks_per_page = PAGE_SIZE >> blkbits;
> +
> +	/*
> +	 * Map all the blocks into the extent list.  This code doesn't try
> +	 * to be very smart.
> +	 */
> +	probe_block = 0;
> +	page_no = 0;
> +	last_block = i_size_read(inode) >> blkbits;
> +	while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
> +		unsigned block_in_page;
> +		sector_t first_block;
> +
> +		cond_resched();
> +
> +		first_block = bmap(inode, probe_block);
> +		if (first_block == 0)
> +			goto bad_bmap;
> +
> +		/*
> +		 * It must be PAGE_SIZE aligned on-disk
> +		 */
> +		if (first_block & (blocks_per_page - 1)) {
> +			probe_block++;
> +			goto reprobe;
> +		}
> +
> +		for (block_in_page = 1; block_in_page < blocks_per_page;
> +					block_in_page++) {
> +			sector_t block;
> +
> +			block = bmap(inode, probe_block + block_in_page);
> +			if (block == 0)
> +				goto bad_bmap;
> +			if (block != first_block + block_in_page) {
> +				/* Discontiguity */
> +				probe_block++;
> +				goto reprobe;
> +			}
> +		}
> +
> +		first_block >>= (PAGE_SHIFT - blkbits);
> +		if (page_no) {	/* exclude the header page */
> +			if (first_block < lowest_block)
> +				lowest_block = first_block;
> +			if (first_block > highest_block)
> +				highest_block = first_block;
> +		}
> +
> +		page_no++;
> +		probe_block += blocks_per_page;
> +reprobe:
> +		continue;
> +	}
> +	return 0;
> +
> +bad_bmap:
> +	pr_err("swapon: swapfile has holes\n");
> +	return -EINVAL;
> +}
> +
> +static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> +				sector_t *span)
> +{
> +	struct inode *inode = file_inode(file);
> +	int ret;
> +
> +	if (!S_ISREG(inode->i_mode))
> +		return -EINVAL;
> +
> +	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> +		return -EROFS;
> +
> +	ret = f2fs_convert_inline_inode(inode);
> +	if (ret)
> +		return ret;
> +
> +	ret = check_swap_activate(file, sis->max);
> +	if (ret)
> +		return ret;
> +
> +	set_inode_flag(inode, FI_PIN_FILE);
> +	f2fs_precache_extents(inode);
> +	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +	return 0;
> +}
> +
> +static void f2fs_swap_deactivate(struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +
> +	clear_inode_flag(inode, FI_PIN_FILE);
> +}
> +#else
> +static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
> +				sector_t *span)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static void f2fs_swap_deactivate(struct file *file)
> +{
> +}
> +#endif
> +
>  const struct file_operations f2fs_file_operations = {
>  	.llseek		= f2fs_llseek,
>  	.read_iter	= generic_file_read_iter,
> @@ -3482,4 +3602,6 @@ const struct file_operations f2fs_file_operations = {
>  #endif
>  	.splice_read	= generic_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
> +	.swap_activate  = f2fs_swap_activate,
> +	.swap_deactivate = f2fs_swap_deactivate,
>  };
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 95dc90570786..1f82f92185d6 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -520,8 +520,6 @@ const struct address_space_operations nfs_file_aops = {
>  	.launder_page = nfs_launder_page,
>  	.is_dirty_writeback = nfs_check_dirty_writeback,
>  	.error_remove_page = generic_error_remove_page,
> -	.swap_activate = nfs_swap_activate,
> -	.swap_deactivate = nfs_swap_deactivate,
>  };
>  
>  /*
> @@ -847,5 +845,7 @@ const struct file_operations nfs_file_operations = {
>  	.splice_write	= iter_file_splice_write,
>  	.check_flags	= nfs_check_flags,
>  	.setlease	= simple_nosetlease,
> +	.swap_activate = nfs_swap_activate,
> +	.swap_deactivate = nfs_swap_deactivate,
>  };
>  EXPORT_SYMBOL_GPL(nfs_file_operations);
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 3a688eb5c5ae..99f578a9ed90 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -631,17 +631,6 @@ xfs_vm_readpages(
>  	return iomap_readpages(mapping, pages, nr_pages, &xfs_read_iomap_ops);
>  }
>  
> -static int
> -xfs_iomap_swapfile_activate(
> -	struct swap_info_struct		*sis,
> -	struct file			*swap_file,
> -	sector_t			*span)
> -{
> -	sis->bdev = xfs_inode_buftarg(XFS_I(file_inode(swap_file)))->bt_bdev;
> -	return iomap_swapfile_activate(sis, swap_file, span,
> -			&xfs_read_iomap_ops);
> -}
> -
>  const struct address_space_operations xfs_address_space_operations = {
>  	.readpage		= xfs_vm_readpage,
>  	.readpages		= xfs_vm_readpages,
> @@ -655,7 +644,6 @@ const struct address_space_operations xfs_address_space_operations = {
>  	.migratepage		= iomap_migrate_page,
>  	.is_partially_uptodate  = iomap_is_partially_uptodate,
>  	.error_remove_page	= generic_error_remove_page,
> -	.swap_activate		= xfs_iomap_swapfile_activate,
>  };
>  
>  const struct address_space_operations xfs_dax_aops = {
> @@ -663,5 +651,4 @@ const struct address_space_operations xfs_dax_aops = {
>  	.direct_IO		= noop_direct_IO,
>  	.set_page_dirty		= noop_set_page_dirty,
>  	.invalidatepage		= noop_invalidatepage,
> -	.swap_activate		= xfs_iomap_swapfile_activate,
>  };
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 865543e41fb4..225f58561f06 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -1294,6 +1294,17 @@ xfs_file_mmap(
>  	return 0;
>  }
>  
> +static int
> +xfs_file_swap_activate(
> +	struct swap_info_struct		*sis,
> +	struct file			*swap_file,
> +	sector_t			*span)
> +{
> +	sis->bdev = xfs_inode_buftarg(XFS_I(file_inode(swap_file)))->bt_bdev;
> +	return iomap_swapfile_activate(sis, swap_file, span,
> +			&xfs_read_iomap_ops);
> +}
> +
>  const struct file_operations xfs_file_operations = {
>  	.llseek		= xfs_file_llseek,
>  	.read_iter	= xfs_file_read_iter,
> @@ -1314,6 +1325,7 @@ const struct file_operations xfs_file_operations = {
>  	.fallocate	= xfs_file_fallocate,
>  	.fadvise	= xfs_file_fadvise,
>  	.remap_file_range = xfs_file_remap_range,
> +	.swap_activate	= xfs_file_swap_activate,
>  };
>  
>  const struct file_operations xfs_dir_file_operations = {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 83e011e0df7f..1175815da3df 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -402,11 +402,6 @@ struct address_space_operations {
>  					unsigned long);
>  	void (*is_dirty_writeback) (struct page *, bool *, bool *);
>  	int (*error_remove_page)(struct address_space *, struct page *);
> -
> -	/* swapfile support */
> -	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
> -				sector_t *span);
> -	void (*swap_deactivate)(struct file *file);
>  };
>  
>  extern const struct address_space_operations empty_aops;
> @@ -1858,6 +1853,11 @@ struct file_operations {
>  				   struct file *file_out, loff_t pos_out,
>  				   loff_t len, unsigned int remap_flags);
>  	int (*fadvise)(struct file *, loff_t, loff_t, int);
> +
> +	/* swapfile support */
> +	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
> +				sector_t *span);
> +	void (*swap_deactivate)(struct file *file);
>  } __randomize_layout;
>  
>  struct inode_operations {
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index bb3261d45b6a..d2de8d668708 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2293,11 +2293,10 @@ static void destroy_swap_extents(struct swap_info_struct *sis)
>  
>  	if (sis->flags & SWP_ACTIVATED) {
>  		struct file *swap_file = sis->swap_file;
> -		struct address_space *mapping = swap_file->f_mapping;
>  
>  		sis->flags &= ~SWP_ACTIVATED;
> -		if (mapping->a_ops->swap_deactivate)
> -			mapping->a_ops->swap_deactivate(swap_file);
> +		if (swap_file->f_op->swap_deactivate)
> +			swap_file->f_op->swap_deactivate(swap_file);
>  	}
>  }
>  
> @@ -2381,8 +2380,7 @@ EXPORT_SYMBOL_GPL(add_swap_extent);
>  static int setup_swap_extents(struct swap_info_struct *sis, sector_t *span)
>  {
>  	struct file *swap_file = sis->swap_file;
> -	struct address_space *mapping = swap_file->f_mapping;
> -	struct inode *inode = mapping->host;
> +	struct inode *inode = swap_file->f_mapping->host;
>  	int ret;
>  
>  	if (S_ISBLK(inode->i_mode)) {
> @@ -2391,8 +2389,8 @@ static int setup_swap_extents(struct swap_info_struct *sis, sector_t *span)
>  		return ret;
>  	}
>  
> -	if (mapping->a_ops->swap_activate) {
> -		ret = mapping->a_ops->swap_activate(sis, swap_file, span);
> +	if (swap_file->f_op->swap_activate) {
> +		ret = swap_file->f_op->swap_activate(sis, swap_file, span);
>  		if (ret >= 0)
>  			sis->flags |= SWP_ACTIVATED;
>  		if (!ret) {
> -- 
> 2.21.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
