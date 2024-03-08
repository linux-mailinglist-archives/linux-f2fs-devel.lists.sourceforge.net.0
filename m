Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FA875BA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Mar 2024 01:56:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riOWc-0008AS-ML;
	Fri, 08 Mar 2024 00:55:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1riOWZ-0008AK-8r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 00:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJXPM/uyGuXGvczevflm/OeCtWbku2J/KNaPBW263MQ=; b=RAvO7JwqAlQ0ZIAAzakyixFDof
 vkTDN3LQhXMIw3ULLnUm65ptbhVxwlWCD8U7N70ObXtcq3lonrttNoAc7xBP8GSNY86WYlGXQZrXC
 p7yac3bXGFToEI0ow7TEw8RfXmaEzBk/LL1ZEnhpvDLT+EjAW4QT0Y5B59haRz8jSOAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJXPM/uyGuXGvczevflm/OeCtWbku2J/KNaPBW263MQ=; b=YSDaUeHnN0p4v0PgrN7QkRw5M+
 X8hAkIx2SQ1xaBXyRCLQGm7Fn1HlOCfanBELDcoz3HV6O+OsAkuTJtZ4qSUWutB831bZdj26lwYEq
 vfqZnvWdgKuvcxgS+euXZ7xGPAhrkodCVjKe2LkFg0B19xZ2F9sL4Ysg7Vf8U0jXfXnM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1riOWR-0004iO-I6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 00:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43FE26127C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Mar 2024 00:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16806C433F1;
 Fri,  8 Mar 2024 00:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709859334;
 bh=e0ccYedOJCgEkhN+ZKip6Y2Wg4KOHk1fAiTFxhhILoU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGREz/gF4eq/YRDqV7Ao6RgZ7MpE/xqApokBvdQ5PrQb2SXpxBBnt0r8263bpM8D/
 fYnr3kCI8JEuF0+0DMsJF03P4GRuZ8u4guRAY8aNqdl/9UVRXSxCdX8LRx7xfwuymt
 RodQndq+27/22PdVul1PDxqSqhpcT4gj0/NydCnxVuBpd8OsppqSwPLYAvzJoMwpcS
 h0B6XR+2ZE112Wfl/yNZH0NglxX8xhd0UKlpcedHPpbHv2BhAMxEljLK8lPo0HN+zT
 TufD6Bq7VBq/s/t/65pE+7ApImBeIGTIgYgp7EKp8LL+kFICnGK3nm+TJfL4XKD1o1
 GLFzC0dMWGNWg==
Message-ID: <2c8ef129-9381-4c82-a421-57b698a18291@kernel.org>
Date: Fri, 8 Mar 2024 08:55:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240307151235.3864725-1-chao@kernel.org>
 <ZeoJa705xDrPRNQY@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZeoJa705xDrPRNQY@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/8 2:37, Jaegeuk Kim wrote: > On 03/07,
 Chao Yu wrote:
 >> Below race case can cause data corruption: >> >> Thread A GC thread >>
 - f2fs_inplace_write_data >> - gc_data_segment >> - ra_data_bl [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1riOWR-0004iO-I6
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to truncate meta inode pages
 forcely
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/8 2:37, Jaegeuk Kim wrote:
> On 03/07, Chao Yu wrote:
>> Below race case can cause data corruption:
>>
>> Thread A				GC thread
>> - f2fs_inplace_write_data
>> 					- gc_data_segment
>> 					 - ra_data_block
>> 					  - locked meta_inode page
>>   - invalidate_mapping_pages
>>   : fail to invalidate meta_inode page
>>     due to lock failure or dirty|writeback
>>     status
> 
> Wasn't the original data page locked in both cases?

Oh, the race case needs to fixed as below:

Thread A				GC thread
					- gc_data_segment
					 - ra_data_block
					  - locked meta_inode page
- f2fs_inplace_write_data
  - invalidate_mapping_pages
  : fail to invalidate meta_inode page
    due to lock failure or dirty|writeback
    status
  - f2fs_submit_page_bio
  : write last dirty data to old blkaddr
					 - move_data_block
					  - load old data from meta_inode page
					  - f2fs_submit_page_write
					  : write old data to new blkaddr

There is a hole in between ra_data_block() and move_data_block(),
in where the data page is unlocked.

Thanks,

> 
>>   - f2fs_submit_page_bio
>>   : write last dirty data to old blkaddr
>> 					 - move_data_block
>> 					  - load old data from meta_inode page
>> 					  - f2fs_submit_page_write
>> 					  : write old data to new blkaddr
>>
>> Because invalidate_mapping_pages() will skip invalidating page when the
>> page has unclear status including locked, dirty, writeback and so on, so
>> we need to use truncate_inode_pages_range() instead of
>> invalidate_mapping_pages() to make sure meta_inode page will be dropped.
>>
>> Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
>> Fixes: e3b49ea36802 ("f2fs: invalidate META_MAPPING before IPU/DIO write")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/checkpoint.c    |  5 +++--
>>   fs/f2fs/f2fs.h          | 28 +++++++++++++++++++++++++++-
>>   fs/f2fs/segment.c       |  5 ++---
>>   include/linux/f2fs_fs.h |  1 +
>>   4 files changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index a09a9609e228..55b7d2cf030f 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1598,8 +1598,9 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>   	 */
>>   	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi) ||
>>   		f2fs_sb_has_compression(sbi))
>> -		invalidate_mapping_pages(META_MAPPING(sbi),
>> -				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
>> +		f2fs_bug_on(sbi,
>> +			invalidate_inode_pages2_range(META_MAPPING(sbi),
>> +				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1));
>>   
>>   	f2fs_release_ino_entry(sbi, false);
>>   
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 4836e7cb0efe..9814e5981a6a 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4655,10 +4655,36 @@ static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
>>   	return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
>>   }
>>   
>> +static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
>> +					block_t blkaddr, unsigned int cnt)
>> +{
>> +	bool need_submit = false;
>> +	int i = 0;
>> +
>> +	do {
>> +		struct page *page;
>> +
>> +		page = find_get_page(META_MAPPING(sbi), blkaddr + i);
>> +		if (page) {
>> +			if (PageWriteback(page))
>> +				need_submit = true;
>> +			f2fs_put_page(page, 0);
>> +		}
>> +	} while (++i < cnt && !need_submit);
>> +
>> +	if (need_submit)
>> +		f2fs_submit_merged_write_cond(sbi, sbi->meta_inode,
>> +							NULL, 0, DATA);
>> +
>> +	truncate_inode_pages_range(META_MAPPING(sbi),
>> +			F2FS_BLK_TO_BYTES((loff_t)blkaddr),
>> +			F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
>> +}
>> +
>>   static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
>>   								block_t blkaddr)
>>   {
>> -	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr);
>> +	f2fs_truncate_meta_inode_pages(sbi, blkaddr, 1);
>>   	f2fs_invalidate_compress_page(sbi, blkaddr);
>>   }
>>   
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 4ff3b2d14ddf..20af48d7f784 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3741,8 +3741,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>>   	}
>>   
>>   	if (fio->post_read)
>> -		invalidate_mapping_pages(META_MAPPING(sbi),
>> -				fio->new_blkaddr, fio->new_blkaddr);
>> +		f2fs_truncate_meta_inode_pages(sbi, fio->new_blkaddr, 1);
>>   
>>   	stat_inc_inplace_blocks(fio->sbi);
>>   
>> @@ -3932,7 +3931,7 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
>>   	for (i = 0; i < len; i++)
>>   		f2fs_wait_on_block_writeback(inode, blkaddr + i);
>>   
>> -	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr + len - 1);
>> +	f2fs_truncate_meta_inode_pages(sbi, blkaddr, len);
>>   }
>>   
>>   static int read_compacted_summaries(struct f2fs_sb_info *sbi)
>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>> index 755e9a41b196..a357287eac1e 100644
>> --- a/include/linux/f2fs_fs.h
>> +++ b/include/linux/f2fs_fs.h
>> @@ -27,6 +27,7 @@
>>   
>>   #define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
>>   #define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
>> +#define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
>>   
>>   /* 0, 1(node nid), 2(meta nid) are reserved node id */
>>   #define F2FS_RESERVED_NODE_NUM		3
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
