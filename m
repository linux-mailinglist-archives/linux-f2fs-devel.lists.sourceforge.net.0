Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAE9005EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:11:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFaJC-0000G3-BF;
	Fri, 07 Jun 2024 14:11:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sFaJA-0000Fp-Sm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3uKzkEEabbLkMFSctKI1rmghqi04TcrHrORhCCohS4U=; b=ZyWJXojoWcYIhnuvK3z5VkFaju
 sXWZYjTlYjNHOLXUEF1HgMnmXeJtivh0+iBjkasbdZut70kTOq8NCo33f0kL/Abg4K67UXvKUAk8s
 xk2lW72SyYk94XrqHy10b5qd2HwEUNcXyIVJKvcO1ipMksXrCQY9v4CqkI8TsTxZGSOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3uKzkEEabbLkMFSctKI1rmghqi04TcrHrORhCCohS4U=; b=aEjAthqLZSNrQTHQyqAk2rvy74
 5/BmN6Z7OMysNSyYncfzP4Qk65rCx6ZRJLT5HZJzY2vE4+/9UDT/MwGB4gXhkXCSUZ/bUmkLSVqhe
 qpckJ2vKrBiSpKqBy9cik7v5rf92s6HU+RrnMhbcor+gyug8kxsubbOE8vlr9SrzVaXY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFaJA-0000jp-AP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:11:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D14CBCE1773;
 Fri,  7 Jun 2024 14:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0159C32782;
 Fri,  7 Jun 2024 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717769455;
 bh=sciOujBFI9gvywDifAfAlIe7Qf9PZPeyUwNpz1jEwuY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pvY2CVq82lHS2IuDhm/tTt7LaBqa4lOD0C8bwAzVku489mHX+y2OC85cRr3L2Pph7
 4mb+lgTl65sM9E++pv74B969fSm0Pt2Czp1IqR9G5PcNNHJdJBK5KIdsw8rnws+rJC
 Uo6v5NlFYxNpulwetYMqEb637dfuqyrbjIOvi82SA9g9OKn7+5IkSagf28rruqrGAL
 iq57r5eY66ppTyjE4SUObD83ZOZ1C2p+CZUsYUOU8tHR7pA+HizK00eg/ilRvR06D4
 xxHCD+S8EjNKPa5vdR9sFQaewZdWWcTr9XXmfVvcHsxtOaCjCyonNZkXT4Eoy7b9/a
 i65rb4AsfWNvw==
Message-ID: <e56b6166-1bb4-411a-a701-51bf452d2369@kernel.org>
Date: Fri, 7 Jun 2024 22:10:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20240607101829.389015-1-chao@kernel.org>
 <ZmMMDy9eeCU2igqj@casper.infradead.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <ZmMMDy9eeCU2igqj@casper.infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/7 21:33, Matthew Wilcox wrote: > On Fri, Jun 07,
 2024 at 06:18:29PM +0800, Chao Yu wrote: >> @@ -1990,6 +1989,12 @@ static
 inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sFaJA-0000jp-AP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: get rid of buffer_head use
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/7 21:33, Matthew Wilcox wrote:
> On Fri, Jun 07, 2024 at 06:18:29PM +0800, Chao Yu wrote:
>> @@ -1990,6 +1989,12 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
>>   	return (struct f2fs_super_block *)(sbi->raw_super);
>>   }
>>   
>> +static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio)
>> +{
>> +	return (struct f2fs_super_block *)(page_address(folio_page(folio, 0)) +
>> +							F2FS_SUPER_OFFSET);
>> +}
> 
> This assumes that the superblock is in the first page of the folio.
> That's not necessarily guaranteed; let's say you have a 64KiB folio
> that covers the start of the bdev.

Oh, I missed to add large folio support in this version.

For the case: page size is 4KiB, and folio size is 64KiB,
read_mapping_folio(mapping, 0, NULL) and read_mapping_folio(mapping,
1, NULL) will return the same #0 folio, right?

> 
> I don't quite know how to write this because f2fs defines its block size
> in terms of PAGE_SIZE, which just seems like nonsense to me.  If you
> format a filesystem on a 16KiB PAGE_SIZE machine and then try to mount
> it on a machine with a 4KiB PAGE_SIZE, it's going to go horribly wrong.

f2fs will check on-disk block size w/ PAGE_SIZE in sanity_check_raw_super()
as below:

	/* only support block_size equals to PAGE_SIZE */
	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
			  le32_to_cpu(raw_super->log_blocksize),
			  F2FS_BLKSIZE_BITS);
		return -EFSCORRUPTED;
	}

> 
> You'd need to pass in something that indicates whether you're trying to
> access the first or second superblock; there's no way to tell from the
> folio which one it is.
> 
>> +static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
>> +								bool update)
>>   {
>> -	lock_buffer(bh);
>> -	if (super)
>> -		memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*super));
>> -	set_buffer_dirty(bh);
>> -	unlock_buffer(bh);
>> -
>> +	struct bio *bio;
>>   	/* it's rare case, we can do fua all the time */
>> -	return __sync_dirty_buffer(bh, REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
>> +	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
>> +	int ret;
>> +
>> +	folio_lock(folio);
>> +	folio_wait_writeback(folio);
>> +	if (update)
>> +		memcpy(F2FS_SUPER_BLOCK(folio), F2FS_RAW_SUPER(sbi),
>> +					sizeof(struct f2fs_super_block));
>> +	folio_mark_dirty(folio);
>> +	folio_clear_dirty_for_io(folio);
>> +	folio_start_writeback(folio);
>> +	folio_unlock(folio);
>> +
>> +	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
>> +
>> +	/* it doesn't need to set crypto context for superblock update */
>> +	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio_index(folio));
>> +
>> +	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
>> +		f2fs_bug_on(sbi, 1);
> 
> Better make that folio_size(folio) to support bs>PS.

Looks better, will update.

Thanks,

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
