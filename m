Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32FE8343
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 09:33:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPMwn-0007nG-Al; Tue, 29 Oct 2019 08:33:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iPMwm-0007n9-9G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:CC:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mH6pK/rOhxBhjgc4K6FGs1SxoD2ukUh1nvkjPxJWjSI=; b=bcZlz9U8/rL6Rg8p9/DfbT8dKl
 y2seooPHy2FthNPC2vnH7RbpcLCBgXwJeaYYDATBinGLCIuYviIHe7BnhIb76lqNBBcHZaRLjQLht
 ZORgRbiyp65ZO5uk++l2CyaCSnIp7iG1CiXigSE/Dwr5zRIcOaO3ItnLnfDrLZKU0mMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:CC:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mH6pK/rOhxBhjgc4K6FGs1SxoD2ukUh1nvkjPxJWjSI=; b=hU/DPl9H5miAx6ZL2ty/2cRMRS
 UC8bvu++qZXA1WPvkZObKt2h6WLfqp+kDyeEx2qO7Wevyks5kZeVqAIodO+YtyKq5B99/xw2CIkKu
 qY+06Xu0k/0Z6hLP46JvCxROpZfT7+5zKckvwLA6NttsJoSHavvJCoTqvIhVqP6jm+v8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPMwj-008BOr-SA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:33:48 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 91BC5391D03CB94728A5;
 Tue, 29 Oct 2019 16:33:38 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct
 2019 16:33:37 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
Date: Tue, 29 Oct 2019 16:33:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191027225006.GA321938@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iPMwj-008BOr-SA
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

On 2019/10/28 6:50, Eric Biggers wrote:
>> +bool f2fs_is_compressed_page(struct page *page)
>> +{
>> +	if (!page_private(page))
>> +		return false;
>> +	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
>> +		return false;
>> +	return *((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC;
>> +}
> 
> This code implies that there can be multiple page private structures each of
> which has a different magic number.  But I only see F2FS_COMPRESSED_PAGE_MAGIC.
> Where in the code is the other one(s)?

I'm not sure I understood you correctly, did you mean it needs to introduce
f2fs_is_atomic_written_page() and f2fs_is_dummy_written_page() like
f2fs_is_compressed_page()?

> 
>> +
>> +static void f2fs_set_compressed_page(struct page *page,
>> +		struct inode *inode, pgoff_t index, void *data, refcount_t *r)
>> +{
>> +	SetPagePrivate(page);
>> +	set_page_private(page, (unsigned long)data);
>> +
>> +	/* i_crypto_info and iv index */
>> +	page->index = index;
>> +	page->mapping = inode->i_mapping;
>> +	if (r)
>> +		refcount_inc(r);
>> +}
> 
> It isn't really appropriate to create fake pagecache pages like this.  Did you
> consider changing f2fs to use fscrypt_decrypt_block_inplace() instead?

We need to store i_crypto_info and iv index somewhere, in order to pass them to
fscrypt_decrypt_block_inplace(), where did you suggest to store them?

>> +
>> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
>> +{
>> +	kvfree(cc->rpages);
>> +}
> 
> The memory is allocated with kzalloc(), so why is it freed with kvfree() and not
> just kfree()?

It was allocated by f2fs_*alloc() which will fallback to kvmalloc() once
kmalloc() failed.

>> +static int lzo_compress_pages(struct compress_ctx *cc)
>> +{
>> +	int ret;
>> +
>> +	ret = lzo1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
>> +					&cc->clen, cc->private);
>> +	if (ret != LZO_E_OK) {
>> +		printk_ratelimited("%sF2FS-fs: lzo compress failed, ret:%d\n",
>> +								KERN_ERR, ret);
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
> 
> Why not using f2fs_err()?  Same in lots of other places.

We use printk_ratelimited at some points where we can afford to lose logs,
otherwise we use f2fs_{err,warn...} to record info as much as possible for
troubleshoot.

>> +
>> +	ret = cops->compress_pages(cc);
>> +	if (ret)
>> +		goto out_vunmap_cbuf;
>> +
>> +	max_len = PAGE_SIZE * (cc->cluster_size - 1) - COMPRESS_HEADER_SIZE;
>> +
>> +	if (cc->clen > max_len) {
>> +		ret = -EAGAIN;
>> +		goto out_vunmap_cbuf;
>> +	}
> 
> Since we already know the max length we're willing to compress to (the max
> length for any space to be saved), why is more space than that being allocated?
> LZ4_compress_default() will return an error if there isn't enough space, so that
> error could just be used as the indication to store the data uncompressed.

AFAIK, there is no such common error code returned from all compression
algorithms indicating there is no room for limited target size, however we need
that information to fallback to write raw pages. Any better idea?

> 
>> +
>> +	cc->cbuf->clen = cpu_to_le32(cc->clen);
>> +	cc->cbuf->chksum = 0;
> 
> What is the point of the chksum field?  It's always set to 0 and never checked.

When I written initial codes, I doubt that I may lose to check some SPO corner
cases, in where we missed to write whole cluster, so I added that to help to
recall that case, however I didn't have time to cover those cases, resulting
leaving unfinished code there... :(, I'm okay to delete it in a formal version.

BTW, for data checksum feature, I guess we need to reconstruct dnode layout to
cover both compressed/non-compressed data.

> 
>> +
>> +static bool __cluster_may_compress(struct compress_ctx *cc)
>> +{
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
>> +	loff_t i_size = i_size_read(cc->inode);
>> +	const pgoff_t end_index = ((unsigned long long)i_size)
>> +					>> PAGE_SHIFT;
>> +	unsigned offset;
>> +	int i;
>> +
>> +	for (i = 0; i < cc->cluster_size; i++) {
>> +		struct page *page = cc->rpages[i];
>> +
>> +		f2fs_bug_on(sbi, !page);
>> +
>> +		if (unlikely(f2fs_cp_error(sbi)))
>> +			return false;
>> +		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>> +			return false;
>> +		if (f2fs_is_drop_cache(cc->inode))
>> +			return false;
>> +		if (f2fs_is_volatile_file(cc->inode))
>> +			return false;
>> +
>> +		offset = i_size & (PAGE_SIZE - 1);
>> +		if ((page->index > end_index) ||
>> +			(page->index == end_index && !offset))
>> +			return false;
> 
> No need to have a special case for when i_size is a multiple of the page size.
> Just replace end_index with 'nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE)' and
> check for page->index >= nr_pages.

That is copied from f2fs_write_data_page(), let's clean up in a separated patch.

> 
>> +out_fail:
>> +	/* TODO: revoke partially updated block addresses */
>> +	for (i += 1; i < cc->cluster_size; i++) {
>> +		if (!cc->rpages[i])
>> +			continue;
>> +		redirty_page_for_writepage(wbc, cc->rpages[i]);
>> +		unlock_page(cc->rpages[i]);
>> +	}
>> +	return err;
> 
> Un-addressed TODO.

Will fix a little later.

>>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
>>  {
>> -	/*
>> -	 * We use different work queues for decryption and for verity because
>> -	 * verity may require reading metadata pages that need decryption, and
>> -	 * we shouldn't recurse to the same workqueue.
>> -	 */
> 
> Why is it okay (i.e., no deadlocks) to no longer use different work queues for
> decryption and for verity?  See the comment above which is being deleted.

Could you explain more about how deadlock happen? or share me a link address if
you have described that case somewhere?

> 
>> +	/* TODO: cluster can be compressed due to race with .writepage */
>> +
> 
> Another un-addressed TODO.

Will fix a little later.

> 
>> +int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
>> +{
>> +	if (!f2fs_sb_has_encrypt(sbi) &&
>> +		!f2fs_sb_has_compression(sbi))
>> +		return 0;
>> +
>> +	sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
>> +						 WQ_UNBOUND | WQ_HIGHPRI,
>> +						 num_online_cpus());
> 
> post_read_wq is also needed if verity is enabled.

Yes, we missed this as verity was not merged when implementing this....

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
