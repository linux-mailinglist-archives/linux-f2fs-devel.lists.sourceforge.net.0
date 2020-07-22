Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F252C229DCB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:05:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyIBn-0008NJ-HG; Wed, 22 Jul 2020 17:05:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyIBl-0008NB-Rn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+UOEHhWucq0wEYzHDH6thddjy6j4ZZL8vLLJenJjI0=; b=LXAaMLzp+hLv30j6ilNxiaQhz9
 1RO+RKdKhnG3ETvvrfkSW8o06Bkpoo7odrmJbIHWxjWgpAEAW2XPQQBOX8VVKpFdw6APT1jktEHTs
 +qj0itj30A62rHzD07qYwYcGnUEnh0dBOXjLAd7syMIkPFEaDDXSapVc+PK8aPlgy0rQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o+UOEHhWucq0wEYzHDH6thddjy6j4ZZL8vLLJenJjI0=; b=Uf4+cDvFphKa3hw6QK7tG+xAH6
 ixzkhezPKGSbywdLHysh362xtXvEvp22k8cUXBphns4pKeYewkgxs4mTKuNHx3eKoOESFW/bVJ6tx
 J9q+JIluXWFr11jEUtAqwa4b4K02vyrT4G1NA67F7RI3Qh8MK5K/xlVG6qeNVeMvnMls=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyIBk-00DluI-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:05:53 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58F96207BB;
 Wed, 22 Jul 2020 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437547;
 bh=3fUGIZwFHgL3WIRMkHlvThy1u8nPZ1YArv5tmMPYnzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rV6AgUYiCmyyMfmJoulKmtFScwMM12pb4dqlXP/dAfs8dbcrRV/MDQdzc2fEMrbuO
 ncwnYHF55bXGOToPc9wZE4q83ITqQDjG//F9Ru3k5ki61aCjARm8qd31ZpBlYDP7Av
 kDtmVI9wWF4NIvSyZxbve1PyBPUL/swTSL1zRG2c=
Date: Wed, 22 Jul 2020 10:05:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200722170547.GE3912099@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-3-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyIBk-00DluI-Pz
Subject: Re: [f2fs-dev] [PATCH v4 2/7] direct-io: add support for fscrypt
 using blk-crypto
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Set bio crypt contexts on bios by calling into fscrypt when required,
> and explicitly check for DUN continuity when adding pages to the bio.
> (While DUN continuity is usually implied by logical block contiguity,
> this is not the case when using certain fscrypt IV generation methods
> like IV_INO_LBLK_32).
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviwed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/direct-io.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 6d5370eac2a8..f27f7e3780ee 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -24,6 +24,7 @@
>  #include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/fs.h>
> +#include <linux/fscrypt.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/highmem.h>
> @@ -411,6 +412,7 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
>  	      sector_t first_sector, int nr_vecs)
>  {
>  	struct bio *bio;
> +	struct inode *inode = dio->inode;
>  
>  	/*
>  	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
> @@ -418,6 +420,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
>  	 */
>  	bio = bio_alloc(GFP_KERNEL, nr_vecs);
>  
> +	fscrypt_set_bio_crypt_ctx(bio, inode,
> +				  sdio->cur_page_fs_offset >> inode->i_blkbits,
> +				  GFP_KERNEL);
>  	bio_set_dev(bio, bdev);
>  	bio->bi_iter.bi_sector = first_sector;
>  	bio_set_op_attrs(bio, dio->op, dio->op_flags);
> @@ -782,9 +787,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
>  		 * current logical offset in the file does not equal what would
>  		 * be the next logical offset in the bio, submit the bio we
>  		 * have.
> +		 *
> +		 * When fscrypt inline encryption is used, data unit number
> +		 * (DUN) contiguity is also required.  Normally that's implied
> +		 * by logical contiguity.  However, certain IV generation
> +		 * methods (e.g. IV_INO_LBLK_32) don't guarantee it.  So, we
> +		 * must explicitly check fscrypt_mergeable_bio() too.
>  		 */
>  		if (sdio->final_block_in_bio != sdio->cur_page_block ||
> -		    cur_offset != bio_next_offset)
> +		    cur_offset != bio_next_offset ||
> +		    !fscrypt_mergeable_bio(sdio->bio, dio->inode,
> +					   cur_offset >> dio->inode->i_blkbits))
>  			dio_bio_submit(dio, sdio);
>  	}
>  
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
