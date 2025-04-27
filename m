Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E34A9E2B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 13:26:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u909h-0007Xo-DM;
	Sun, 27 Apr 2025 11:26:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u909f-0007Xd-Vm
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 11:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jjALC6kOUKBQv/Ez/AScOnivsD4GrKYi5B73rfpJ9WI=; b=FcQpp6gt5teYXifuMzXRY2dDJh
 wlSzSrBT5hTCV5rUwE1NGhmm287oF+YIKZ1FGUiy4xLboMtRF3+bOzqGbhibqmKU1Opg9R5featdE
 BfkDXU0oYZ/XTS66fJiJJN7LjFkv8tUktsQK99BkWtDE0OulVFUNhYU2Cx1cyHhzGZ+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jjALC6kOUKBQv/Ez/AScOnivsD4GrKYi5B73rfpJ9WI=; b=BWDG4daoEoCelKTX8eYtWWHY4U
 8P28esBh6EyYGPfMfDL9Uq3e1v9e4tHCcbe1EdLZejH43XLQijrWlhNnQQGsVzOXXGw55KlJB47SU
 mE2n/HXW/GiaDi1r12isBuwrVPAfen7FcWEsb4Z0kyoTSLc68cdKi8KX9rHwR07pz3h4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u909Q-0000AH-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 11:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F18B44F68;
 Sun, 27 Apr 2025 11:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADF1C4CEE3;
 Sun, 27 Apr 2025 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745753174;
 bh=L1CIDnLtk14rfeXURvwgplJ9zip884Ha4wJVZ6d3cAM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PIKNPFizm0AMjdQ2m8tNUK9CwNo7j8N2Dv4pbEI2cLQcYcvjcoUB74WyxfMZ7xjux
 +LkbucHDYXIfhPSGChD1He+ZZP28liITlyyX0VkACQE7v3h8FANpxD4P89zT2XZsJP
 YUsjqS0vz8rW0338jRwPxkKyOgrMtBJA0D7uDPTNMJCwiwf7Z/D7SxhW4cCW1n0x/A
 w5Z66wOPvfrra2GZIxCRs+mwALPlhpiOImWwKkXsXLqW8Q5/EAubXZDam5w34Y40Ga
 GezSCozBvF9Q+n8AbtMPiRglTdTxPdsXomSYQo0JSU3J+p8GCYAx9MwywqBBULNjOy
 EpcqEaJGc/kLQ==
Message-ID: <4392afa9-f418-41c1-90f6-54f4ef28d919@kernel.org>
Date: Sun, 27 Apr 2025 19:26:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250331201256.1057782-1-willy@infradead.org>
 <20250331201256.1057782-32-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250331201256.1057782-32-willy@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/25 04:10, Matthew Wilcox (Oracle) wrote: > Convert
 validate_checkpoint() to return a folio and use it throughout >
 f2fs_get_valid_checkpoint().
 Saves five hidden calls to compound_head(). > > S [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
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
X-Headers-End: 1u909Q-0000AH-Lp
Subject: Re: [f2fs-dev] [PATCH 031/153] f2fs: Use a folio in
 f2fs_get_valid_checkpoint()
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
> Convert validate_checkpoint() to return a folio and use it throughout
> f2fs_get_valid_checkpoint().  Saves five hidden calls to compound_head().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/checkpoint.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 8ae015b304db..c34add47ea8d 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -880,7 +880,7 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
>  	return 0;
>  }
>  
> -static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
> +static struct folio *validate_checkpoint(struct f2fs_sb_info *sbi,
>  				block_t cp_addr, unsigned long long *version)
>  {
>  	struct folio *cp_folio_1 = NULL, *cp_folio_2 = NULL;
> @@ -913,7 +913,7 @@ static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
>  	if (cur_version == pre_version) {
>  		*version = cur_version;
>  		f2fs_folio_put(cp_folio_2, true);
> -		return &cp_folio_1->page;
> +		return cp_folio_1;
>  	}
>  	f2fs_folio_put(cp_folio_2, true);
>  invalid_cp:
> @@ -925,7 +925,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_checkpoint *cp_block;
>  	struct f2fs_super_block *fsb = sbi->raw_super;
> -	struct page *cp1, *cp2, *cur_page;
> +	struct folio *cp1, *cp2, *cur_folio;
>  	unsigned long blk_size = sbi->blocksize;
>  	unsigned long long cp1_version = 0, cp2_version = 0;
>  	unsigned long long cp_start_blk_no;
> @@ -952,22 +952,22 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>  
>  	if (cp1 && cp2) {
>  		if (ver_after(cp2_version, cp1_version))
> -			cur_page = cp2;
> +			cur_folio = cp2;
>  		else
> -			cur_page = cp1;
> +			cur_folio = cp1;
>  	} else if (cp1) {
> -		cur_page = cp1;
> +		cur_folio = cp1;
>  	} else if (cp2) {
> -		cur_page = cp2;
> +		cur_folio = cp2;
>  	} else {
>  		err = -EFSCORRUPTED;
>  		goto fail_no_cp;
>  	}
>  
> -	cp_block = (struct f2fs_checkpoint *)page_address(cur_page);
> +	cp_block = folio_address(cur_folio);
>  	memcpy(sbi->ckpt, cp_block, blk_size);
>  
> -	if (cur_page == cp1)
> +	if (cur_folio == cp1)
>  		sbi->cur_cp_pack = 1;
>  	else
>  		sbi->cur_cp_pack = 2;
> @@ -982,30 +982,30 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>  		goto done;
>  
>  	cp_blk_no = le32_to_cpu(fsb->cp_blkaddr);
> -	if (cur_page == cp2)
> +	if (cur_folio == cp2)
>  		cp_blk_no += BIT(le32_to_cpu(fsb->log_blocks_per_seg));
>  
>  	for (i = 1; i < cp_blks; i++) {
>  		void *sit_bitmap_ptr;
>  		unsigned char *ckpt = (unsigned char *)sbi->ckpt;
>  
> -		cur_page = f2fs_get_meta_page(sbi, cp_blk_no + i);
> -		if (IS_ERR(cur_page)) {
> -			err = PTR_ERR(cur_page);
> +		cur_folio = f2fs_get_meta_folio(sbi, cp_blk_no + i);
> +		if (IS_ERR(cur_folio)) {
> +			err = PTR_ERR(cur_folio);
>  			goto free_fail_no_cp;
>  		}
> -		sit_bitmap_ptr = page_address(cur_page);
> +		sit_bitmap_ptr = folio_address(cur_folio);
>  		memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
> -		f2fs_put_page(cur_page, 1);
> +		f2fs_folio_put(cur_folio, 1);

f2fs_folio_put(cur_folio, true);

>  	}
>  done:
> -	f2fs_put_page(cp1, 1);
> -	f2fs_put_page(cp2, 1);
> +	f2fs_folio_put(cp1, 1);
> +	f2fs_folio_put(cp2, 1);

Ditto,

>  	return 0;
>  
>  free_fail_no_cp:
> -	f2fs_put_page(cp1, 1);
> -	f2fs_put_page(cp2, 1);
> +	f2fs_folio_put(cp1, 1);
> +	f2fs_folio_put(cp2, 1);

Ditto,

Thanks,

>  fail_no_cp:
>  	kvfree(sbi->ckpt);
>  	return err;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
