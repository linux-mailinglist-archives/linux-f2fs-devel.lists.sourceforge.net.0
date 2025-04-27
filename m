Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53CA9E20E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 11:32:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8yMe-0002a9-HD;
	Sun, 27 Apr 2025 09:31:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8yMc-0002a2-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 09:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/82Z/Rs3wusezc970Kh9dMTCBVmsbV7wmMwX8mozQBQ=; b=lrDo4xf/gYZpf4TGFgq5VRzR+f
 35aC7JBhHKDFQVwsYR8JFHykiC5Id++DTSYy+An5YgA6f7fu+u2J42ElK/ROyG95/ajaCPivf+2lI
 c5WQC+Hnrr4lCCJCnrwugayjyqfP0Cst056YopcUVUja0si3X/PzTQaTldjRLxqKx5C0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/82Z/Rs3wusezc970Kh9dMTCBVmsbV7wmMwX8mozQBQ=; b=Pish30mlnrmtEaTX91zjWnBWlI
 rwc8UJ6RazDU1awLNfaVdi3Z68EjsbN9mqZO4mZ+ajLIRvg8R3wmWzAO6HBiFXWIwHDUOfBb/HrG0
 KJ+YBq7zl9vCd+qxV2qulzKwbJQJPU3e0Knn2sYO9ih0tpTw6g8LCmNBKc92UKYslGEc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u8yMN-0003BK-IK for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 09:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A1D74528B;
 Sun, 27 Apr 2025 09:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505B0C4CEEA;
 Sun, 27 Apr 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745746294;
 bh=TSG+PvlMK/tWr0V8fpAF0QQFiSStFGmRrXICg3TdMaI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=E/i3KmKUhIjXuB011/CRSxWww/trpiXx9DmX8DKtOWApi2f93B0gNjTjl2pJTHW6G
 6Bsknybv75FenzCWwwPUaJQI4T5Enc8fBhTIcKxeNxCLSoiTfJsuKMTcGMy4ILSsTc
 CqHX8tfHtGOdlXdTkJa7XveI8HdBPrNxb0oV04dM8IzN96He89xE/zdtoQH0dPvHTR
 k/VROVYhOf2afr+hLcbBUOGRLWhvQoX1qJXHrW4EX3fcPNpp2JF2OaoQsW3oYjmWV/
 znMbagjWrb7TocEuiyC85sEFVkJzEgRHQLc/zCD4+yGhH3LUCAFUFjUOGxzB8oUeVu
 D5vjOkcMFvpsw==
Message-ID: <e75b819f-97aa-48d3-80e8-9c0add157165@kernel.org>
Date: Sun, 27 Apr 2025 17:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250331201256.1057782-1-willy@infradead.org>
 <20250331201256.1057782-9-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250331201256.1057782-9-willy@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/25 04:10, Matthew Wilcox (Oracle) wrote: > Fetch a
 folio from the pagecache instead of a page and operate on it > throughout.
 Removes eight calls to compound_head() and an access to > page->map [...]
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u8yMN-0003BK-IK
Subject: Re: [f2fs-dev] [PATCH 008/153] f2fs: Use a folio in
 move_data_block()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/1/25 04:10, Matthew Wilcox (Oracle) wrote:
> Fetch a folio from the pagecache instead of a page and operate on it
> throughout.  Removes eight calls to compound_head() and an access to
> page->mapping.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/gc.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2b8f9239bede..fa51b871290d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1307,7 +1307,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	struct dnode_of_data dn;
>  	struct f2fs_summary sum;
>  	struct node_info ni;
> -	struct page *page, *mpage;
> +	struct page *page;
> +	struct folio *mfolio;
>  	block_t newaddr;
>  	int err = 0;
>  	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
> @@ -1359,20 +1360,20 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	if (lfs_mode)
>  		f2fs_down_write(&fio.sbi->io_order_lock);
>  
> -	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
> +	mfolio = f2fs_grab_cache_folio(META_MAPPING(fio.sbi),
>  					fio.old_blkaddr, false);
> -	if (!mpage) {
> -		err = -ENOMEM;
> +	if (IS_ERR(mfolio)) {
> +		err = PTR_ERR(mfolio);
>  		goto up_out;
>  	}
>  
> -	fio.encrypted_page = mpage;
> +	fio.encrypted_page = folio_file_page(mfolio, fio.old_blkaddr);
>  
> -	/* read source block in mpage */
> -	if (!PageUptodate(mpage)) {
> +	/* read source block in mfolio */
> +	if (!folio_test_uptodate(mfolio)) {
>  		err = f2fs_submit_page_bio(&fio);
>  		if (err) {
> -			f2fs_put_page(mpage, 1);
> +			f2fs_folio_put(mfolio, true);
>  			goto up_out;
>  		}
>  
> @@ -1381,11 +1382,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  		f2fs_update_iostat(fio.sbi, NULL, FS_GDATA_READ_IO,
>  							F2FS_BLKSIZE);
>  
> -		lock_page(mpage);
> -		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
> -						!PageUptodate(mpage))) {
> +		folio_lock(mfolio);
> +		if (unlikely(mfolio->mapping != META_MAPPING(fio.sbi) ||
> +			     !folio_test_uptodate(mfolio))) {
>  			err = -EIO;
> -			f2fs_put_page(mpage, 1);
> +			f2fs_folio_put(mfolio, 1);

f2fs_folio_put(mfolio, true);

Thanks,

>  			goto up_out;
>  		}
>  	}
> @@ -1396,7 +1397,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	err = f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
>  				&sum, type, NULL);
>  	if (err) {
> -		f2fs_put_page(mpage, 1);
> +		f2fs_folio_put(mfolio, true);
>  		/* filesystem should shutdown, no need to recovery block */
>  		goto up_out;
>  	}
> @@ -1405,15 +1406,15 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
>  	if (!fio.encrypted_page) {
>  		err = -ENOMEM;
> -		f2fs_put_page(mpage, 1);
> +		f2fs_folio_put(mfolio, true);
>  		goto recover_block;
>  	}
>  
>  	/* write target block */
>  	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
>  	memcpy(page_address(fio.encrypted_page),
> -				page_address(mpage), PAGE_SIZE);
> -	f2fs_put_page(mpage, 1);
> +				folio_address(mfolio), PAGE_SIZE);
> +	f2fs_folio_put(mfolio, true);
>  
>  	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr, 1);
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
