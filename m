Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3453EE0EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 02:31:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFn0p-0000So-Ls; Tue, 17 Aug 2021 00:31:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mFn0p-0000Sg-7q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 00:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Du4sw2vyN3KoAZgGmPFkDdCnfM30OCLI2aKlyllchDQ=; b=L/rvHUL3BM294bZ7fNISXjqssS
 kuiFh/zJEEw/cSVbhQ51gDCAT4HHBLw+sPTTKgFndvP2hxK1gnO/pHaVn0HSSO4PSaMjNCln2h9QM
 2+paIlhXyvPMYP2BOi5BFeVjJ0BlmxIiBbO6Fmv32Ht8K+uVht++8R+EoCugU5zu5kwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Du4sw2vyN3KoAZgGmPFkDdCnfM30OCLI2aKlyllchDQ=; b=B/ip6qASgWFmPRGdJRoXQqFVzw
 ZDfAOFBlhLHzzrQ3Bpw356+dOTp5qj8Z0qJUUCTuaWPXTq0TU2PoYTiUU5GlHR+44nEZWvlZtOSDN
 OZ+QlXKK/DMu34bHFnhg4QBKXA+zOA9txfizUjpc185Th0lk10GNDsB9TnHfW71yB1d0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFn0n-008lwj-Qj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 00:31:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4874D60F39;
 Tue, 17 Aug 2021 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160280;
 bh=PhrDqW+iL1rUOz0aN2eeBsoZrADOX0NtAbiLIl1UPPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=piRqxQkzx2vsJU3zIhmTVgQc9+rnFHsl+/V2oMp0Q7oZ65uxiLIwYIKn8JxVcSQEj
 U8yz/YhPvBC4FSjGNkMmmXxjS1ZTt++b7mYD/RQ1k1+2tGrqnnTZZasEMvOAuY1VHa
 F6eFpQoSqJxfNOSpT+D1aPkFmhJNJBnv8UqKCSYmkxJj/zbICj1JUBP3rd+k8x7/AW
 54HT07yv5VOo5N4KAovylyPMEfA/YMOgK9DAjPaKZS83bihWfk3iKCB1+0N3IsFoZi
 mgqgw01XSVgDxuhqxwcpKJhqYGmnxViH8GRn/jIJB55EP3LS0kIZQOPWnT7RJRNXf4
 O/VNjZFXH4Qbw==
Date: Mon, 16 Aug 2021 17:31:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <YRsDViXYTnAiLPjj@google.com>
References: <20210816102207.277804-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816102207.277804-1-frank.li@vivo.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFn0n-008lwj-Qj
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use f2fs_bug_on instead of if
 condition followed by f2fs_bug_on
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

No, I don't think this is a right way.

On 08/16, Yangtao Li wrote:
> Similar:
>     WARNING: Use BUG_ON instead of if condition followed by BUG.
> 
> Let's replace if (cond) f2fs_bug_on() with f2fs_bug_on().
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/checkpoint.c |  6 ++----
>  fs/f2fs/compress.c   |  3 +--
>  fs/f2fs/data.c       |  6 ++----
>  fs/f2fs/node.h       |  4 +---
>  fs/f2fs/segment.c    |  5 ++---
>  fs/f2fs/segment.h    | 10 ++++------
>  6 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6c208108d69c..eebe5a80b842 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -475,8 +475,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>  	e = radix_tree_lookup(&im->ino_root, ino);
>  	if (!e) {
>  		e = tmp;
> -		if (unlikely(radix_tree_insert(&im->ino_root, ino, e)))
> -			f2fs_bug_on(sbi, 1);
> +		f2fs_bug_on(sbi, radix_tree_insert(&im->ino_root, ino, e));
>  
>  		memset(e, 0, sizeof(struct ino_entry));
>  		e->ino = ino;
> @@ -1369,8 +1368,7 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
>  	memcpy(page_address(page), src, PAGE_SIZE);
>  
>  	set_page_dirty(page);
> -	if (unlikely(!clear_page_dirty_for_io(page)))
> -		f2fs_bug_on(sbi, 1);
> +	f2fs_bug_on(sbi, !clear_page_dirty_for_io(page));
>  
>  	/* writeout cp pack 2 page */
>  	err = __f2fs_write_meta_page(page, &wbc, FS_CP_META_IO);
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 455561826c7d..43362f43c3d2 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -160,8 +160,7 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
>  {
>  	unsigned int cluster_ofs;
>  
> -	if (!f2fs_cluster_can_merge_page(cc, page->index))
> -		f2fs_bug_on(F2FS_I_SB(cc->inode), 1);
> +	f2fs_bug_on(F2FS_I_SB(cc->inode), !f2fs_cluster_can_merge_page(cc, page->index));
>  
>  	cluster_ofs = offset_in_cluster(cc, page->index);
>  	cc->rpages[cluster_ofs] = page;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d2cf48c5a2e4..4e85d5bcf1bc 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -464,8 +464,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  			zero_user_segment(page, 0, PAGE_SIZE);
>  			set_page_private_dummy(page);
>  
> -			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
> -				f2fs_bug_on(sbi, 1);
> +			f2fs_bug_on(sbi, bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE);
>  		}
>  		/*
>  		 * In the NODE case, we lose next block address chain. So, we
> @@ -727,8 +726,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
>  	be->bio = bio;
>  	bio_get(bio);
>  
> -	if (bio_add_page(bio, page, PAGE_SIZE, 0) != PAGE_SIZE)
> -		f2fs_bug_on(sbi, 1);
> +	f2fs_bug_on(sbi, bio_add_page(bio, page, PAGE_SIZE, 0) != PAGE_SIZE);
>  
>  	down_write(&io->bio_list_lock);
>  	list_add_tail(&be->list, &io->bio_list);
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index ff14a6e5ac1c..4acf365771f4 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -191,9 +191,7 @@ static inline void get_nat_bitmap(struct f2fs_sb_info *sbi, void *addr)
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>  
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	if (memcmp(nm_i->nat_bitmap, nm_i->nat_bitmap_mir,
> -						nm_i->bitmap_size))
> -		f2fs_bug_on(sbi, 1);
> +	f2fs_bug_on(sbi, memcmp(nm_i->nat_bitmap, nm_i->nat_bitmap_mir, nm_i->bitmap_size));
>  #endif
>  	memcpy(addr, nm_i->nat_bitmap, nm_i->bitmap_size);
>  }
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 15cc89eef28d..12f2a9bc15d7 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4216,9 +4216,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  			se = get_seg_entry(sbi, segno);
>  #ifdef CONFIG_F2FS_CHECK_FS
> -			if (memcmp(se->cur_valid_map, se->cur_valid_map_mir,
> -						SIT_VBLOCK_MAP_SIZE))
> -				f2fs_bug_on(sbi, 1);
> +			f2fs_bug_on(sbi, memcmp(se->cur_valid_map,
> +				    se->cur_valid_map_mir, SIT_VBLOCK_MAP_SIZE));
>  #endif
>  
>  			/* add discard candidates */
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 050230c70a53..c985b889572a 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -518,9 +518,8 @@ static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
>  	struct sit_info *sit_i = SIT_I(sbi);
>  
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	if (memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
> -						sit_i->bitmap_size))
> -		f2fs_bug_on(sbi, 1);
> +	f2fs_bug_on(sbi, memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
> +				sit_i->bitmap_size));
>  #endif
>  	memcpy(dst_addr, sit_i->sit_bitmap, sit_i->bitmap_size);
>  }
> @@ -762,9 +761,8 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
>  	check_seg_range(sbi, start);
>  
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> -			f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
> -		f2fs_bug_on(sbi, 1);
> +	f2fs_bug_on(sbi, f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> +		    f2fs_test_bit(offset, sit_i->sit_bitmap_mir));
>  #endif
>  
>  	/* calculate sit block address */
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
