Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BADC8222BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jan 2024 21:56:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rKlnq-0002cU-AE;
	Tue, 02 Jan 2024 20:55:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rKlnp-0002cO-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 20:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eyNxnFckVziHq+SH8Cdq6dnIg6EDdMlqja3VclvAvJ0=; b=DvrrX7jrKBsqwgLFg+8l+stWms
 136W+xwoDecpqMtXS29HUdzhLza74lT7hH1ncvbyOstvfnqIEff6z2FdoUzxOBT7slOjniG7eaWcI
 frTEehiPTVRdc1VxhptXcfqtb0sjW/2UetPB4YnqH0bEVMYmCfqVBR4v0u63HuAjnAyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eyNxnFckVziHq+SH8Cdq6dnIg6EDdMlqja3VclvAvJ0=; b=Z/b8apWrRQYHgJWqieoASKi9IN
 APRGMJpax6jLYs172L0Zm+ngkMFwjIXHSwtdgBqwPmQBc6klV+zrbwW8ms+vDyxyiCxauG/K2e58E
 1fxkwct4X0PpRHwJQDW5M/EoVQvaBhKGcG2setmIqedT5oSMFOrFlnlRZeGVfJG9ouJc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rKlnn-0000YR-PU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 20:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7FC8DCE113D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Jan 2024 20:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9540C433C8;
 Tue,  2 Jan 2024 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704228943;
 bh=tdJChAXPrHgWAD265k2xSFz3dzyCsLoz30A5whs+gHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkGeMp7uUPuGEEa1Hs3p8VjXzB8yXr3bApFetCqItsG/2501dKExRqK+LMqsm/1qO
 9WOcw3NQWfwTPnLcsXwnrtmva+PQ/iWhG/3O82G027DSwOzWbycBzWJaw4UFmDcamz
 G6L/NV870CegFVEZRGDSFpVd+C6lZDf9ZRmwigkyo5YiHHIq0+qRsLdjAPA1cOv8KB
 LghRReazFbt/uD1o2oIE2EdY//4YzWhYLKPsglg9/o9O7+pu5PL2uENi+zAxh+oSbp
 M0QTB8Eux/M1aN1uuZVNSDVSUuZW4W1E8EjuvNJt2RgANPO97+a2GFb2f0U5OM3VXU
 9e7jmIoJUjTIA==
Date: Tue, 2 Jan 2024 12:55:42 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZZR4Tup3Lm3zh2V1@google.com>
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-6-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228143152.1543509-6-chao@kernel.org>
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/28,
 Chao Yu wrote: > We will encounter below inconsistent
 status when FAULT_BLKADDR type > fault injection is on. > > Info: checkpoint
 state = d6 : nat_bits crc fsck compacted_summary orphan_ino [...] 
 Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rKlnn-0000YR-PU
Subject: Re: [f2fs-dev] [PATCH v3 6/6] f2fs: introduce
 FAULT_BLKADDR_INCONSISTENCE
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/28, Chao Yu wrote:
> We will encounter below inconsistent status when FAULT_BLKADDR type
> fault injection is on.
> 
> Info: checkpoint state = d6 :  nat_bits crc fsck compacted_summary orphan_inodes sudden-power-off
> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c100 has i_blocks: 000000c0, but has 191 blocks
> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c100] i_blocks=0x000000c0 -> 0xbf
> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1c100] i_compr_blocks=0x00000026 -> 0x27
> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1cadb has i_blocks: 0000002f, but has 46 blocks
> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1cadb] i_blocks=0x0000002f -> 0x2e
> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1cadb] i_compr_blocks=0x00000011 -> 0x12
> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c62c has i_blocks: 00000002, but has 1 blocks
> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c62c] i_blocks=0x00000002 -> 0x1
> 
> After we inject fault into f2fs_is_valid_blkaddr() during truncation,
> a) it missed to increase @nr_free or @valid_blocks
> b) it can cause in blkaddr leak in truncated dnode
> Which may cause inconsistent status.
> 
> This patch separates FAULT_BLKADDR_INCONSISTENCE from FAULT_BLKADDR,
> so that we can:
> a) use FAULT_BLKADDR_INCONSISTENCE in f2fs_truncate_data_blocks_range()
> to simulate inconsistent issue independently,
> b) FAULT_BLKADDR fault will not cause any inconsistent status, we can
> just use it to check error path handling in kernel side.

How about defining FAULT_BLKADDR_VALIDITY and FAULT_BLKADDR_CONSISTENCY?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - rename FAULT_INCONSISTENCE as Jaegeuk's suggestion.
>  Documentation/ABI/testing/sysfs-fs-f2fs | 47 +++++++++++++------------
>  Documentation/filesystems/f2fs.rst      | 47 +++++++++++++------------
>  fs/f2fs/checkpoint.c                    | 19 +++++++---
>  fs/f2fs/f2fs.h                          |  3 ++
>  fs/f2fs/file.c                          |  8 +++--
>  fs/f2fs/super.c                         | 37 +++++++++----------
>  6 files changed, 91 insertions(+), 70 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 4f1d4e636d67..039a16ebaaaf 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -686,29 +686,30 @@ Description:	Support configuring fault injection type, should be
>  		enabled with fault_injection option, fault type value
>  		is shown below, it supports single or combined type.
>  
> -		===================      ===========
> -		Type_Name                Type_Value
> -		===================      ===========
> -		FAULT_KMALLOC            0x000000001
> -		FAULT_KVMALLOC           0x000000002
> -		FAULT_PAGE_ALLOC         0x000000004
> -		FAULT_PAGE_GET           0x000000008
> -		FAULT_ALLOC_BIO          0x000000010 (obsolete)
> -		FAULT_ALLOC_NID          0x000000020
> -		FAULT_ORPHAN             0x000000040
> -		FAULT_BLOCK              0x000000080
> -		FAULT_DIR_DEPTH          0x000000100
> -		FAULT_EVICT_INODE        0x000000200
> -		FAULT_TRUNCATE           0x000000400
> -		FAULT_READ_IO            0x000000800
> -		FAULT_CHECKPOINT         0x000001000
> -		FAULT_DISCARD            0x000002000
> -		FAULT_WRITE_IO           0x000004000
> -		FAULT_SLAB_ALLOC         0x000008000
> -		FAULT_DQUOT_INIT         0x000010000
> -		FAULT_LOCK_OP            0x000020000
> -		FAULT_BLKADDR            0x000040000
> -		===================      ===========
> +		===========================      ===========
> +		Type_Name                        Type_Value
> +		===========================      ===========
> +		FAULT_KMALLOC                    0x000000001
> +		FAULT_KVMALLOC                   0x000000002
> +		FAULT_PAGE_ALLOC                 0x000000004
> +		FAULT_PAGE_GET                   0x000000008
> +		FAULT_ALLOC_BIO                  0x000000010 (obsolete)
> +		FAULT_ALLOC_NID                  0x000000020
> +		FAULT_ORPHAN                     0x000000040
> +		FAULT_BLOCK                      0x000000080
> +		FAULT_DIR_DEPTH                  0x000000100
> +		FAULT_EVICT_INODE                0x000000200
> +		FAULT_TRUNCATE                   0x000000400
> +		FAULT_READ_IO                    0x000000800
> +		FAULT_CHECKPOINT                 0x000001000
> +		FAULT_DISCARD                    0x000002000
> +		FAULT_WRITE_IO                   0x000004000
> +		FAULT_SLAB_ALLOC                 0x000008000
> +		FAULT_DQUOT_INIT                 0x000010000
> +		FAULT_LOCK_OP                    0x000020000
> +		FAULT_BLKADDR                    0x000040000
> +		FAULT_BLKADDR_INCONSISTENCE      0x000080000
> +		===========================      ===========
>  
>  What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
>  Date:		January 2023
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d32c6209685d..b7c5c3f6df1c 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -184,29 +184,30 @@ fault_type=%d		 Support configuring fault injection type, should be
>  			 enabled with fault_injection option, fault type value
>  			 is shown below, it supports single or combined type.
>  
> -			 ===================	  ===========
> -			 Type_Name		  Type_Value
> -			 ===================	  ===========
> -			 FAULT_KMALLOC		  0x000000001
> -			 FAULT_KVMALLOC		  0x000000002
> -			 FAULT_PAGE_ALLOC	  0x000000004
> -			 FAULT_PAGE_GET		  0x000000008
> -			 FAULT_ALLOC_BIO	  0x000000010 (obsolete)
> -			 FAULT_ALLOC_NID	  0x000000020
> -			 FAULT_ORPHAN		  0x000000040
> -			 FAULT_BLOCK		  0x000000080
> -			 FAULT_DIR_DEPTH	  0x000000100
> -			 FAULT_EVICT_INODE	  0x000000200
> -			 FAULT_TRUNCATE		  0x000000400
> -			 FAULT_READ_IO		  0x000000800
> -			 FAULT_CHECKPOINT	  0x000001000
> -			 FAULT_DISCARD		  0x000002000
> -			 FAULT_WRITE_IO		  0x000004000
> -			 FAULT_SLAB_ALLOC	  0x000008000
> -			 FAULT_DQUOT_INIT	  0x000010000
> -			 FAULT_LOCK_OP		  0x000020000
> -			 FAULT_BLKADDR		  0x000040000
> -			 ===================	  ===========
> +			 ===========================      ===========
> +			 Type_Name                        Type_Value
> +			 ===========================      ===========
> +			 FAULT_KMALLOC                    0x000000001
> +			 FAULT_KVMALLOC                   0x000000002
> +			 FAULT_PAGE_ALLOC                 0x000000004
> +			 FAULT_PAGE_GET                   0x000000008
> +			 FAULT_ALLOC_BIO                  0x000000010 (obsolete)
> +			 FAULT_ALLOC_NID                  0x000000020
> +			 FAULT_ORPHAN                     0x000000040
> +			 FAULT_BLOCK                      0x000000080
> +			 FAULT_DIR_DEPTH                  0x000000100
> +			 FAULT_EVICT_INODE                0x000000200
> +			 FAULT_TRUNCATE                   0x000000400
> +			 FAULT_READ_IO                    0x000000800
> +			 FAULT_CHECKPOINT                 0x000001000
> +			 FAULT_DISCARD                    0x000002000
> +			 FAULT_WRITE_IO                   0x000004000
> +			 FAULT_SLAB_ALLOC                 0x000008000
> +			 FAULT_DQUOT_INIT                 0x000010000
> +			 FAULT_LOCK_OP                    0x000020000
> +			 FAULT_BLKADDR                    0x000040000
> +			 FAULT_BLKADDR_INCONSISTENCE      0x000080000
> +			 ===========================      ===========
>  mode=%s			 Control block allocation mode which supports "adaptive"
>  			 and "lfs". In "lfs" mode, there should be no random
>  			 writes towards main area.
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index b0597a539fc5..84546f529cf0 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -170,12 +170,9 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>  	return exist;
>  }
>  
> -bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> +static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  					block_t blkaddr, int type)
>  {
> -	if (time_to_inject(sbi, FAULT_BLKADDR))
> -		return false;
> -
>  	switch (type) {
>  	case META_NAT:
>  		break;
> @@ -230,6 +227,20 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  	return true;
>  }
>  
> +bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int type)
> +{
> +	if (time_to_inject(sbi, FAULT_BLKADDR))
> +		return false;
> +	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
> +}
> +
> +bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int type)
> +{
> +	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
> +}
> +
>  /*
>   * Readahead CP/NAT/SIT/SSA/POR pages
>   */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ab710bb6d8b3..e0acfec0558d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -61,6 +61,7 @@ enum {
>  	FAULT_DQUOT_INIT,
>  	FAULT_LOCK_OP,
>  	FAULT_BLKADDR,
> +	FAULT_BLKADDR_INCONSISTENCE,
>  	FAULT_MAX,
>  };
>  
> @@ -3768,6 +3769,8 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
>  struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
>  bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  					block_t blkaddr, int type);
> +bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int type);
>  int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
>  			int type, bool sync);
>  void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9f4e21b5916c..32a7a413584b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -590,9 +590,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  		f2fs_set_data_blkaddr(dn, NULL_ADDR);
>  
>  		if (__is_valid_data_blkaddr(blkaddr)) {
> -			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))
> +			if (time_to_inject(sbi, FAULT_BLKADDR_INCONSISTENCE))
> +				continue;
> +			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
> +						DATA_GENERIC_ENHANCE)) {
> +				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>  				continue;
> +			}
>  			if (compressed_cluster)
>  				valid_blocks++;
>  		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 206d03c82d96..87a803f36a50 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -44,24 +44,25 @@ static struct kmem_cache *f2fs_inode_cachep;
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  
>  const char *f2fs_fault_name[FAULT_MAX] = {
> -	[FAULT_KMALLOC]		= "kmalloc",
> -	[FAULT_KVMALLOC]	= "kvmalloc",
> -	[FAULT_PAGE_ALLOC]	= "page alloc",
> -	[FAULT_PAGE_GET]	= "page get",
> -	[FAULT_ALLOC_NID]	= "alloc nid",
> -	[FAULT_ORPHAN]		= "orphan",
> -	[FAULT_BLOCK]		= "no more block",
> -	[FAULT_DIR_DEPTH]	= "too big dir depth",
> -	[FAULT_EVICT_INODE]	= "evict_inode fail",
> -	[FAULT_TRUNCATE]	= "truncate fail",
> -	[FAULT_READ_IO]		= "read IO error",
> -	[FAULT_CHECKPOINT]	= "checkpoint error",
> -	[FAULT_DISCARD]		= "discard error",
> -	[FAULT_WRITE_IO]	= "write IO error",
> -	[FAULT_SLAB_ALLOC]	= "slab alloc",
> -	[FAULT_DQUOT_INIT]	= "dquot initialize",
> -	[FAULT_LOCK_OP]		= "lock_op",
> -	[FAULT_BLKADDR]		= "invalid blkaddr",
> +	[FAULT_KMALLOC]			= "kmalloc",
> +	[FAULT_KVMALLOC]		= "kvmalloc",
> +	[FAULT_PAGE_ALLOC]		= "page alloc",
> +	[FAULT_PAGE_GET]		= "page get",
> +	[FAULT_ALLOC_NID]		= "alloc nid",
> +	[FAULT_ORPHAN]			= "orphan",
> +	[FAULT_BLOCK]			= "no more block",
> +	[FAULT_DIR_DEPTH]		= "too big dir depth",
> +	[FAULT_EVICT_INODE]		= "evict_inode fail",
> +	[FAULT_TRUNCATE]		= "truncate fail",
> +	[FAULT_READ_IO]			= "read IO error",
> +	[FAULT_CHECKPOINT]		= "checkpoint error",
> +	[FAULT_DISCARD]			= "discard error",
> +	[FAULT_WRITE_IO]		= "write IO error",
> +	[FAULT_SLAB_ALLOC]		= "slab alloc",
> +	[FAULT_DQUOT_INIT]		= "dquot initialize",
> +	[FAULT_LOCK_OP]			= "lock_op",
> +	[FAULT_BLKADDR]			= "invalid blkaddr",
> +	[FAULT_BLKADDR_INCONSISTENCE]	= "inconsistent blkaddr",
>  };
>  
>  void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
