Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C64F047
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 23:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heQlV-0008IK-1G; Fri, 21 Jun 2019 21:08:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1heQlT-0008I6-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 21:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKuf+V1+RbXQKcq1H6et5TR7SOKbWr48zARofednqvs=; b=lyRcvOOh+Mld67sCCzxahiIJ3e
 vf8jpj9oc0cc6oy1E5zv2FbfFBfmyXWk8ZT3id+XZh101wBcaOy1CeTdq6t5TdPy6s7fm72Wy0nTK
 A+NQY4vn7oEhDvaHja21uyRcMCDL1Fll6P+bRsJWAAIy5/m+9BL1cK2BGAcX5Ui4jzso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zKuf+V1+RbXQKcq1H6et5TR7SOKbWr48zARofednqvs=; b=dFFMMFlzQqMIGWLMP6iD3NDKuW
 uh/5Ffh4Fo174TQ5OG7/7U72mgUlXALsyZu3HYAUU78V/ktkURsP5K3uJoUXGpU+Xc/GlogEjd1H1
 X7yfeFgF+EVdIYJFxrdTrAIGTpgJyKnOv8+cl9m8323xVDEIlBODkpKOHfCbO5fqmdi0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heQlU-007ktN-Lb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 21:08:10 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACFC82089E;
 Fri, 21 Jun 2019 21:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561151283;
 bh=gtxyIpbIl3ETbSi7Kx86WqNdwAWvLeSvlwgQZO3onNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ig94Vct/bFpcMbbtJnrwjzepAgoGkVSAr4Ne+FIqK3oAoVBfFLtc/BEmzHFWz+JZM
 tZ3hNgfFAe5asAXZqr3rMC8NoZ7Kn2c7zvK/8XELkvOht6zvZhokBYJ7nuB3Lmd94h
 VcaBBHf2d3Qj3Qa6pAneczJm3kRiWnGVTVqhtm5A=
Date: Fri, 21 Jun 2019 14:08:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chandan Rajendra <chandan@linux.ibm.com>
Message-ID: <20190621210800.GB167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-3-chandan@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616160813.24464-3-chandan@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heQlU-007ktN-Lb
Subject: Re: [f2fs-dev] [PATCH V3 2/7] Integrate read callbacks into Ext4
 and F2FS
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chandan,

On Sun, Jun 16, 2019 at 09:38:08PM +0530, Chandan Rajendra wrote:
> This commit gets Ext4 and F2FS to make use of read callbacks API to
> perform decryption of file data read from the disk.
> ---
>  fs/crypto/bio.c             |  30 +--------
>  fs/crypto/crypto.c          |   1 +
>  fs/crypto/fscrypt_private.h |   3 +
>  fs/ext4/readpage.c          |  29 +++------
>  fs/f2fs/data.c              | 124 +++++++-----------------------------
>  fs/f2fs/super.c             |   9 +--
>  fs/read_callbacks.c         |   1 -
>  include/linux/fscrypt.h     |  18 ------
>  8 files changed, 40 insertions(+), 175 deletions(-)
> 

This patch changes many different components.  It would be much easier to
review, and might get more attention from the other ext4 and f2fs developers, if
it were split into 3 patches:

a. Convert ext4 to use read_callbacks.
b. Convert f2fs to use read_callbacks.
c. Remove the functions from fs/crypto/ that became unused as a result of
   patches (a) and (b).  (Actually, this part probably should be merged with the
   patch that removes the fscrypt_ctx, and the patch renamed to something like
   "fscrypt: remove decryption I/O path helpers")

Any reason why this wouldn't work?  AFAICS, you couldn't do it only because you
made this patch change fscrypt_enqueue_decrypt_work() to be responsible for
initializing the work function.  But as per my comments on patch 1, I don't
think we should do that, since it would make much more sense to put the work
function in read_callbacks.c.

However, since you're converting ext4 to use mpage_readpages() anyway, I don't
think we should bother with the intermediate change to ext4_mpage_readpages().
It's useless, and that intermediate state of the ext4 code inevitably won't get
tested very well.  So perhaps order the whole series as:

- fs: introduce read_callbacks
- fs/mpage.c: add decryption support via read_callbacks
- fs/buffer.c: add decryption support via read_callbacks
- f2fs: convert to use read_callbacks
- ext4: convert to use mpage_readpages[s]
- ext4: support encryption with subpage-sized blocks
- fscrypt: remove decryption I/O path helpers

That order would also give the flexibility to possibly apply the fs/ changes
first, without having to update both ext4 and f2fs simultaneously with them.

> @@ -557,8 +511,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct bio *bio;
> -	struct bio_post_read_ctx *ctx;
> -	unsigned int post_read_steps = 0;
> +	int ret;

Nit: 'err' rather than 'ret', since this is 0 or a -errno value.

> -int __init f2fs_init_post_read_processing(void)
> -{
> -	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, 0);
> -	if (!bio_post_read_ctx_cache)
> -		goto fail;
> -	bio_post_read_ctx_pool =
> -		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
> -					 bio_post_read_ctx_cache);
> -	if (!bio_post_read_ctx_pool)
> -		goto fail_free_cache;
> -	return 0;
> -
> -fail_free_cache:
> -	kmem_cache_destroy(bio_post_read_ctx_cache);
> -fail:
> -	return -ENOMEM;
> -}
> -
> -void __exit f2fs_destroy_post_read_processing(void)
> -{
> -	mempool_destroy(bio_post_read_ctx_pool);
> -	kmem_cache_destroy(bio_post_read_ctx_cache);
> -}

Need to remove the declarations of these functions from fs/f2fs/f2fs.h to.

> diff --git a/fs/read_callbacks.c b/fs/read_callbacks.c
> index a4196e3de05f..4b7fc2a349cd 100644
> --- a/fs/read_callbacks.c
> +++ b/fs/read_callbacks.c
> @@ -76,7 +76,6 @@ void read_callbacks(struct read_callbacks_ctx *ctx)
>  	switch (++ctx->cur_step) {
>  	case STEP_DECRYPT:
>  		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
> -			INIT_WORK(&ctx->work, fscrypt_decrypt_work);
>  			fscrypt_enqueue_decrypt_work(&ctx->work);
>  			return;
>  		}

Again, I think the work initialization should remain here as:

	INIT_WORK(&ctx->work, decrypt_work);

rather than moving it to fs/crypto/.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
