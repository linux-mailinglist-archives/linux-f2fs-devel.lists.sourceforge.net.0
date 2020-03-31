Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A294198D76
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 09:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJBgb-0008En-0Y; Tue, 31 Mar 2020 07:51:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jJBgY-0008Dz-6s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 07:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVx1p7RijUzeyPL36tDSN9s5UGYoM0jwcpN59yBzgnU=; b=dawkJteDJKMqvSEjMrNrwQmeyd
 7DgHoG6YQzp3ZG/hR4zb8f5dBhm9TwNePdFdTZj382XBCY3D92QUC78L6wBlTPYKy0mzdwtieyHYM
 TCje47hi/PKJs1AQFsUPN7WE3lqT1/2pyOaGHzzx2FAQ10RVwo1EV+IE/oz1XozXS7X0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xVx1p7RijUzeyPL36tDSN9s5UGYoM0jwcpN59yBzgnU=; b=IX9MsE2ZlTHF909bJczCLqiXto
 tXA+unVFH474UIbtiffDnv1jUmDo4Ed5oP6czXUi55E5GbMf9fPM6eR98TVnD//T6XN9d4iQ66IHt
 7RuLWMqeyVE8XWMQkMlckDC3YQ+EuktK6n+B4yrk4BQV9YloRaWte3rlx/fa46QRWxnM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJBgW-002cbr-6P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 07:51:46 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4AAA3FE431CC4978FE5D;
 Tue, 31 Mar 2020 15:51:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 Mar
 2020 15:51:30 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200330100349.56127-1-yuchao0@huawei.com>
 <20200330184230.GB34947@google.com>
 <2b5ec2a6-218a-a291-a6fc-d87cd40be4db@huawei.com>
 <20200331035537.GC79749@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2fb61e2a-0725-2c97-8d7e-7f6b23a93ea9@huawei.com>
Date: Tue, 31 Mar 2020 15:51:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200331035537.GC79749@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jJBgW-002cbr-6P
Subject: Re: [f2fs-dev] [PATCH] f2fs: use round_up()/DIV_ROUND_UP()
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

On 2020/3/31 11:55, Jaegeuk Kim wrote:
> On 03/31, Chao Yu wrote:
>> On 2020/3/31 2:42, Jaegeuk Kim wrote:
>>> On 03/30, Chao Yu wrote:
>>>> .i_cluster_size should be power of 2, so we can use round_up() instead
>>>> of roundup() to enhance the calculation.
>>>>
>>>> In addition, use DIV_ROUND_UP to clean up codes.
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>  fs/f2fs/data.c | 16 ++++++----------
>>>>  fs/f2fs/file.c | 17 +++++------------
>>>>  2 files changed, 11 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 0a829a89f596..8257d5e7aa3b 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -1969,8 +1969,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>>>>  					bool is_readahead)
>>>>  {
>>>>  	struct bio *bio = *bio_ret;
>>>> -	const unsigned blkbits = inode->i_blkbits;
>>>> -	const unsigned blocksize = 1 << blkbits;
>>>>  	sector_t block_in_file;
>>>>  	sector_t last_block;
>>>>  	sector_t last_block_in_file;
>>>> @@ -1979,8 +1977,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>>>>  
>>>>  	block_in_file = (sector_t)page_index(page);
>>>>  	last_block = block_in_file + nr_pages;
>>>> -	last_block_in_file = (f2fs_readpage_limit(inode) + blocksize - 1) >>
>>>> -							blkbits;
>>>> +	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
>>>> +								PAGE_SIZE);
>>>
>>> What if PAGE_SIZE is bigger than 4KB?
>>
>> We don't support 8kb+ sized-page, right?
> 
> That's only assumption below. I don't think we can just replace block with PAGE
> in every places.

Fixed,

BTW, we didn't unify the usage of PAGE_SIZE/blocksize when
calling bio_add_page(), it needs to unify to use PAGE_SIZE?

f2fs_read_multi_pages()

	if (bio_add_page(bio, page, blocksize, 0) < blocksize)

f2fs_submit_page_write

	if (bio_add_page(io->bio, bio_page, PAGE_SIZE, 0) < PAGE_SIZE) {

> 
>>
>> static int __init init_f2fs_fs(void)
>> {
>> 	int err;
>>
>> 	if (PAGE_SIZE != F2FS_BLKSIZE) {
>> 		printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
>> 				PAGE_SIZE, F2FS_BLKSIZE);
>> 		return -EINVAL;
>> 	}
>>
>> Thanks,
>>
>>>
>>>>  	if (last_block > last_block_in_file)
>>>>  		last_block = last_block_in_file;
>>>>  
>>>> @@ -2062,7 +2060,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>>>>  	 */
>>>>  	f2fs_wait_on_block_writeback(inode, block_nr);
>>>>  
>>>> -	if (bio_add_page(bio, page, blocksize, 0) < blocksize)
>>>> +	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
>>>>  		goto submit_and_realloc;
>>>>  
>>>>  	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>>>> @@ -2091,16 +2089,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>>>>  	struct bio *bio = *bio_ret;
>>>>  	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
>>>>  	sector_t last_block_in_file;
>>>> -	const unsigned blkbits = inode->i_blkbits;
>>>> -	const unsigned blocksize = 1 << blkbits;
>>>>  	struct decompress_io_ctx *dic = NULL;
>>>>  	int i;
>>>>  	int ret = 0;
>>>>  
>>>>  	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
>>>>  
>>>> -	last_block_in_file = (f2fs_readpage_limit(inode) +
>>>> -					blocksize - 1) >> blkbits;
>>>> +	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
>>>> +								PAGE_SIZE);
>>>>  
>>>>  	/* get rid of pages beyond EOF */
>>>>  	for (i = 0; i < cc->cluster_size; i++) {
>>>> @@ -2197,7 +2193,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>>>>  
>>>>  		f2fs_wait_on_block_writeback(inode, blkaddr);
>>>>  
>>>> -		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
>>>> +		if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
>>>>  			goto submit_and_realloc;
>>>>  
>>>>  		inc_page_count(sbi, F2FS_RD_DATA);
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index c2d38a1c4972..0f8be076620c 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -736,16 +736,9 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>>>>  	 * for compressed file, only support cluster size
>>>>  	 * aligned truncation.
>>>>  	 */
>>>> -	if (f2fs_compressed_file(inode)) {
>>>> -		size_t cluster_shift = PAGE_SHIFT +
>>>> -					F2FS_I(inode)->i_log_cluster_size;
>>>> -		size_t cluster_mask = (1 << cluster_shift) - 1;
>>>> -
>>>> -		free_from = from >> cluster_shift;
>>>> -		if (from & cluster_mask)
>>>> -			free_from++;
>>>> -		free_from <<= cluster_shift;
>>>> -	}
>>>> +	if (f2fs_compressed_file(inode))
>>>> +		free_from = round_up(from,
>>>> +				F2FS_I(inode)->i_cluster_size << PAGE_SHIFT);
>>>>  #endif
>>>>  
>>>>  	err = f2fs_do_truncate_blocks(inode, free_from, lock);
>>>> @@ -3537,7 +3530,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>>>>  
>>>>  		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
>>>>  		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
>>>> -		count = roundup(count, F2FS_I(inode)->i_cluster_size);
>>>> +		count = round_up(count, F2FS_I(inode)->i_cluster_size);
>>>>  
>>>>  		ret = release_compress_blocks(&dn, count);
>>>>  
>>>> @@ -3689,7 +3682,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>>>>  
>>>>  		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
>>>>  		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
>>>> -		count = roundup(count, F2FS_I(inode)->i_cluster_size);
>>>> +		count = round_up(count, F2FS_I(inode)->i_cluster_size);
>>>>  
>>>>  		ret = reserve_compress_blocks(&dn, count);
>>>>  
>>>> -- 
>>>> 2.18.0.rc1
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
