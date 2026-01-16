Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A6D2E495
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 09:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1xB2k2pevKfMrY2tjZBKs2uQTRS++59K49d5HN+uAg=; b=ZMENL816ADKNG6Uk3Cj5bwlkpu
	906jT3XVZMfztenpwZ3CTN+9dHKqbo5pzChJpd6mR8Q+0uOIdApncp5dhcOy/sGj9/QQn+oLWUNNt
	Ql79a1hDahlgEv/M6Um2BBrJ22lDS8siCJX00r93CbPNKjafeg9wge3AitLk8JVG+Q4g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgfYx-0000tG-VH;
	Fri, 16 Jan 2026 08:52:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vgfYw-0000t3-Iy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n+OOERGBuU/eEjCp1ha38wJ5HyY6ce/nMwEGAWhOWb0=; b=RUG8DupDJU7QkKmIwLSU+6woUH
 2di1jiVNqAMtxfwE2Sa43FUEqnHeBhIU3qf3gkZha+fXcBs2ma2cx18yIDE3ucwfOEL+hlDjPDs0n
 RKFNaInr6Pq7mqrh6oJmP2+YfLdyuwaMH/sYlIsUjcHc5suLjC83qKU88N2uxZxEHttQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n+OOERGBuU/eEjCp1ha38wJ5HyY6ce/nMwEGAWhOWb0=; b=CJlf6Gf0lMG0Gj5yW3LDksMmlS
 YDl8Rk7LlBlZvHl7oLaTicUlZjvp3LfdgYBm4VPz12rl7iIafdP2IKsM63MTtlXkJVENABUbWlwlE
 Xgz2R9HaX5rKYVE38gQasa/60icG8qSau1BubVxuXcZ4JJV5j+VwNmpraS2/fPBVr0Sw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgfYw-0000xf-Nn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE65260160;
 Fri, 16 Jan 2026 08:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDA4C116C6;
 Fri, 16 Jan 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768553519;
 bh=/zsgcs8Fw8H+LfE4CH7aLQ1FuP0loEYnkIsVJQ3YFXs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Zq0POuEmVGPeVnRtjlMlWshSSqVLIjvo7GDAixjP5KdefO2VKvjJjlRNilgt5qTXO
 IhMkMbq41Xwnn88UvhLve8/IQqaIElBumKuVJws5j8QI7TVjHLgJz8OoYQEo669Lbn
 qqhCIKI53GiOKG3mdXgPnJh9snkLpWygX4VswCMM6Z9W7BwGscMaeZ2QAkiB1cZx+N
 4TgMXA7alSGmmm54jMyg6svPDQtgDMWWcBirZwKD/VUrxbAUB+7EqN5+7gJHrtzAv/
 VH1psjgTphtju+P4J7KNj2tsYOUiZsfs1EXM5t4ni2D5sLe05OM/ehG/xA9RTv2e29
 8DGwC2DlZWvPg==
Message-ID: <32fa7311-0393-4e71-a927-3c502e40efd8@kernel.org>
Date: Fri, 16 Jan 2026 16:52:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>
References: <20260112013320.8028-1-chao@kernel.org>
 <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
Content-Language: en-US
In-Reply-To: <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/15/2026 8:48 PM, Nanzhe Zhao wrote: > Hi Chao: > > On
 2026/1/12 09:33, Chao Yu via Linux-f2fs-devel wrote: >> For consecutive large
 hole mapping across {d,id,did}nodes , we don't >> need to call [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgfYw-0000xf-Nn
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/15/2026 8:48 PM, Nanzhe Zhao wrote:
> Hi Chao:
> 
> On 2026/1/12 09:33, Chao Yu via Linux-f2fs-devel wrote:
>> For consecutive large hole mapping across {d,id,did}nodes , we don't
>> need to call f2fs_map_blocks() to check one hole block per one time,
>> instead, we can use map.m_next_pgofs as a hint of next potential valid
>> block, so that we can skip calling f2fs_map_blocks the range of
>> [cur_pgofs + 1, .m_next_pgofs).
>>
>> 1) regular case
>>
>> touch /mnt/f2fs/file
>> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
>> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
>>
>> Before:
>> real    0m0.706s
>> user    0m0.000s
>> sys     0m0.706s
>>
>> After:
>> real    0m0.620s
>> user    0m0.008s
>> sys     0m0.611s
>>
>> 2) large folio case
>>
>> touch /mnt/f2fs/file
>> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
>> f2fs_io setflags immutable /mnt/f2fs/file
>> sync
>> echo 3 > /proc/sys/vm/drop_caches
>> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
>>
>> Before:
>> real    0m0.438s
>> user    0m0.004s
>> sys     0m0.433s
>>
>> After:
>> real    0m0.368s
>> user    0m0.004s
>> sys     0m0.364s
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>    fs/f2fs/data.c | 21 +++++++++++++++------
>>    1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index a2c4769d0ae1..5b0642cd27ff 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2176,10 +2176,13 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
>>    	/*
>>    	 * Map blocks using the previous result first.
>>    	 */
>> -	if ((map->m_flags & F2FS_MAP_MAPPED) &&
>> -			block_in_file > map->m_lblk &&
>> +	if (map->m_flags & F2FS_MAP_MAPPED) {
>> +		if (block_in_file > map->m_lblk &&
>>    			block_in_file < (map->m_lblk + map->m_len))
>> +			goto got_it;
>> +	} else if (block_in_file < *map->m_next_pgofs) {
>>    		goto got_it;
>> +	}
>>    
>>    	/*
>>    	 * Then do more f2fs_map_blocks() calls until we are
>> @@ -2454,7 +2457,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>    	struct bio *bio = NULL;
>>    	sector_t last_block_in_bio = 0;
>>    	struct f2fs_map_blocks map = {0, };
>> -	pgoff_t index, offset;
>> +	pgoff_t index, offset, next_pgofs = 0;
>>    	unsigned max_nr_pages = rac ? readahead_count(rac) :
>>    				folio_nr_pages(folio);
>>    	unsigned nrpages;
>> @@ -2487,16 +2490,21 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>    		/*
>>    		 * Map blocks using the previous result first.
>>    		 */
>> -		if ((map.m_flags & F2FS_MAP_MAPPED) &&
>> -				index > map.m_lblk &&
>> +		if (map.m_flags & F2FS_MAP_MAPPED) {
>> +			if (index > map.m_lblk &&
>>    				index < (map.m_lblk + map.m_len))
>> +				goto got_it;
>> +		} else if (index < next_pgofs) {
>> +			/* hole case */
>>    			goto got_it;
>> +		}
>>    
>>    		/*
>>    		 * Then do more f2fs_map_blocks() calls until we are
>>    		 * done with this page.
>>    		 */
>>    		memset(&map, 0, sizeof(map));
>> +		map.m_next_pgofs = &next_pgofs;
>>    		map.m_seg_type = NO_CHECK_TYPE;
>>    		map.m_lblk = index;
>>    		map.m_len = max_nr_pages;
>> @@ -2617,6 +2625,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>    	pgoff_t nc_cluster_idx = NULL_CLUSTER;
>>    	pgoff_t index;
>>    #endif
>> +	pgoff_t next_pgofs = 0;
>>    	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>>    	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
>>    	unsigned max_nr_pages = nr_pages;
>> @@ -2637,7 +2646,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>    	map.m_lblk = 0;
>>    	map.m_len = 0;
>>    	map.m_flags = 0;
>> -	map.m_next_pgofs = NULL;
>> +	map.m_next_pgofs = &next_pgofs;
>>    	map.m_next_extent = NULL;
>>    	map.m_seg_type = NO_CHECK_TYPE;
>>    	map.m_may_create = false;
> 
> Do we have plans to also support reducing f2fs_map_blocks() calls for
> consectives holes in logical file postion with dnode have already been
> allocated in buffered large folio read?
> Such as consective NULL_ADDR or NEW_ADDR?

Nanzhe,

We have supported that for large folio read w/ this patch?

Thanks,

> 
> Thanks,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
