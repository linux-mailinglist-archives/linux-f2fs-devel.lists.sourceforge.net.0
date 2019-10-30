Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54EE9520
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 03:55:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPe8u-0003ft-RG; Wed, 30 Oct 2019 02:55:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPe8t-0003fl-BS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 02:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tE7wL1uKLwSnH0rdXLK9pPnuO6/icDxk60g0ygUJBu4=; b=TZLBqxBJ5zMSNm403DH3uaoPYS
 VU7PmEKirsmXV+Vq6cbQljv4qdYejX0YYMbDfdmUto+srf/6z7jUvX7VGFgryuDVAAfjlSvJBc8Oz
 rhSWgq7cAkbktpDzHcOrw8RoZwz3tXOmGHZ0GacjY551RxCcS6CPSLHxfPBCI/16i22Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tE7wL1uKLwSnH0rdXLK9pPnuO6/icDxk60g0ygUJBu4=; b=BYrrLgVr1D5EU9zvgIfF1Ir9b/
 1znwUFgB8TsNmPZDuohV3FrzdMbBD0q3Nl0OjCiFJMyT0UMqq0vPE5OzE32tfa7wqPLyzwKKVwJLw
 wihvQqiGFys7q2hOoIG+zNdg48/+9y/f6JozWVC14RxE9EunDjkoTxvre8v/GtvFhSjA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPe8r-00A74A-7T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 02:55:27 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70A0120856;
 Wed, 30 Oct 2019 02:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572404114;
 bh=PauVWSxjmuThe1M0wDRef8hgagGVTm4RCXliKrxBA+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9FrYd1l8EhJDfZXDF661fQwvMXBCgKXBd913ct2ii9dMZbVRVdOJc9qy3bwAc9Cd
 JvClmw0vq8n8IQMbmh4BhO0mi4pKy8rOidLS2N6XqyIh03D9hHlfx6Bo0K2Nz5fAgM
 2RYWU5rkaUUg5tXvmkdm01Vuu4YiF4tlTjzNjlP0=
Date: Tue, 29 Oct 2019 19:55:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191030025512.GA4791@sol.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iPe8r-00A74A-7T
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 29, 2019 at 04:33:36PM +0800, Chao Yu wrote:
> On 2019/10/28 6:50, Eric Biggers wrote:
> >> +bool f2fs_is_compressed_page(struct page *page)
> >> +{
> >> +	if (!page_private(page))
> >> +		return false;
> >> +	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
> >> +		return false;
> >> +	return *((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC;
> >> +}
> > 
> > This code implies that there can be multiple page private structures each of
> > which has a different magic number.  But I only see F2FS_COMPRESSED_PAGE_MAGIC.
> > Where in the code is the other one(s)?
> 
> I'm not sure I understood you correctly, did you mean it needs to introduce
> f2fs_is_atomic_written_page() and f2fs_is_dummy_written_page() like
> f2fs_is_compressed_page()?
> 

No, I'm asking what is the case where the line

	*((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC

returns false?

> > 
> >> +
> >> +static void f2fs_set_compressed_page(struct page *page,
> >> +		struct inode *inode, pgoff_t index, void *data, refcount_t *r)
> >> +{
> >> +	SetPagePrivate(page);
> >> +	set_page_private(page, (unsigned long)data);
> >> +
> >> +	/* i_crypto_info and iv index */
> >> +	page->index = index;
> >> +	page->mapping = inode->i_mapping;
> >> +	if (r)
> >> +		refcount_inc(r);
> >> +}
> > 
> > It isn't really appropriate to create fake pagecache pages like this.  Did you
> > consider changing f2fs to use fscrypt_decrypt_block_inplace() instead?
> 
> We need to store i_crypto_info and iv index somewhere, in order to pass them to
> fscrypt_decrypt_block_inplace(), where did you suggest to store them?
> 

The same place where the pages are stored.

> >> +
> >> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
> >> +{
> >> +	kvfree(cc->rpages);
> >> +}
> > 
> > The memory is allocated with kzalloc(), so why is it freed with kvfree() and not
> > just kfree()?
> 
> It was allocated by f2fs_*alloc() which will fallback to kvmalloc() once
> kmalloc() failed.

This seems to be a bug in f2fs_kmalloc() -- it inappropriately falls back to
kvmalloc().  As per its name, it should only use kmalloc().  f2fs_kvmalloc()
already exists, so it can be used when the fallback is wanted.

> 
> >> +static int lzo_compress_pages(struct compress_ctx *cc)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = lzo1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
> >> +					&cc->clen, cc->private);
> >> +	if (ret != LZO_E_OK) {
> >> +		printk_ratelimited("%sF2FS-fs: lzo compress failed, ret:%d\n",
> >> +								KERN_ERR, ret);
> >> +		return -EIO;
> >> +	}
> >> +	return 0;
> >> +}
> > 
> > Why not using f2fs_err()?  Same in lots of other places.
> 
> We use printk_ratelimited at some points where we can afford to lose logs,
> otherwise we use f2fs_{err,warn...} to record info as much as possible for
> troubleshoot.
> 

It used to be the case that f2fs_msg() was ratelimited.  What stops it from
spamming the logs now?

The problem with a bare printk is that it doesn't show which filesystem instance
the message is coming from.

> >> +
> >> +	ret = cops->compress_pages(cc);
> >> +	if (ret)
> >> +		goto out_vunmap_cbuf;
> >> +
> >> +	max_len = PAGE_SIZE * (cc->cluster_size - 1) - COMPRESS_HEADER_SIZE;
> >> +
> >> +	if (cc->clen > max_len) {
> >> +		ret = -EAGAIN;
> >> +		goto out_vunmap_cbuf;
> >> +	}
> > 
> > Since we already know the max length we're willing to compress to (the max
> > length for any space to be saved), why is more space than that being allocated?
> > LZ4_compress_default() will return an error if there isn't enough space, so that
> > error could just be used as the indication to store the data uncompressed.
> 
> AFAIK, there is no such common error code returned from all compression
> algorithms indicating there is no room for limited target size, however we need
> that information to fallback to write raw pages. Any better idea?
> 

"Not enough room" is the only reasonable way for compression to fail, so all
that's needed is the ability for compression to report errors at all.  What
specifically prevents this approach from working?

> >>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
> >>  {
> >> -	/*
> >> -	 * We use different work queues for decryption and for verity because
> >> -	 * verity may require reading metadata pages that need decryption, and
> >> -	 * we shouldn't recurse to the same workqueue.
> >> -	 */
> > 
> > Why is it okay (i.e., no deadlocks) to no longer use different work queues for
> > decryption and for verity?  See the comment above which is being deleted.
> 
> Could you explain more about how deadlock happen? or share me a link address if
> you have described that case somewhere?
> 

The verity work can read pages from the file which require decryption.  I'm
concerned that it could deadlock if the work is scheduled on the same workqueue.
Granted, I'm not an expert in Linux workqueues, so if you've investigated this
and determined that it's safe, can you explain why?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
