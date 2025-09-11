Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F38B52A6D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Sep 2025 09:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPLd5pyHLEYvFeSEGW4rUOdlZ7wjFZcIBUPELIgriNw=; b=ZM6wnEQXaoiiG9bE0Eet3tP6tB
	kUmoG31Tu82g8UYQDLYXnxBjRiuJkaz42jGgLLX0QUwYriBje88BWa+D6s7+2LquoNppQVY/erVVO
	TSsX2niN9M/6druGwHXZSE/s+xvdY3Ptm3hcPBH2wEBrxC9WAgZ7Ar5JcBasaIX9ubb8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwc1l-0005ET-SX;
	Thu, 11 Sep 2025 07:47:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwc1k-0005EN-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 07:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lyJZwQhJvEKFwY9o6UOaSZiWls+IO/acYvJys5rljII=; b=Zm8sSf67IL4Dmmz0kCGZE1vK7N
 UxkocdSigpTE0Ln3QAd8HP4TrIEB8IQzZDo2p3kdK1wVQHjraKpssH9cQViQZmS05b6xnMpO+gu99
 a3Lot9bGsPDk5R3Xg0oXxB0lwXHhnVJeRZplXSh4JI/5NpjhVJVfpsWK1n8mlJ0Wsb4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lyJZwQhJvEKFwY9o6UOaSZiWls+IO/acYvJys5rljII=; b=Aia9HrbguCar9okXJBFEUZ47ig
 QmWP9A+GXk+8Pd8MnVFbxPgpt5dt8ccqh/5auu6SagQPXz9QHRXHhMR0UPGU6Hb4tZa9Tis7qRQYf
 mBXa9p3+YOPiZaGfIlGR/BFnKH+jOp0GRKVW/1Hrxmr56sfAEvHEFlbhgWP11vNh3FEY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwc1j-0007ea-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 07:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D3C64024B;
 Thu, 11 Sep 2025 07:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DA1C4CEF1;
 Thu, 11 Sep 2025 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757576841;
 bh=xG0wqREPO4jvc2whMHvR/DEgATLKUBA6P+zcRmExoUo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eZ9CiPx8KWTZJDC6odQjuXXVQD7rkpTyZnWMi8AEs0/HPTp54WAYN5kkmTwAmAVSC
 GgO/LHB6PFRvqHDnNQ+iQdE5iWe6wtUWjbXWH2TkruniCfTk88OwI3hXRd7DdHtn6O
 edOSW8CN4qkfVtvRUJpyjjCnfQCNWS3j9vQayLmkZnIeXZLhRHUBs5Ewc26+Ti/A9Z
 6BisRrtu7yUDkbuJoxFIs0rt4cFCSTv/BLu8rchkUY5NUJLeK5sH0IrfP4c94nCdea
 gUWrNlTVKfXB8olh5bP4K9cUfLhxEaOJJmf20o3eyCzo43i0H6w0TVjfYzw5Z9yJXp
 frvSZOwyrHZpQ==
Message-ID: <122b93a0-515d-49b0-9c0a-30313e040287@kernel.org>
Date: Thu, 11 Sep 2025 15:47:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <ad627632-298e-428b-9cfa-a5b5b50c147e@kernel.org>
 <20250911065549.2929967-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250911065549.2929967-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/11/25 14:55, wangzijie wrote: >> On 9/10/25 21:58,
 wangzijie
 wrote: >>> When the data layout is like this: >>> dnode1: dnode2: >>> [0]
 A [0] NEW_ADDR >>> [1] A+1 [1] 0x0 >>> ... .... >>> [1016] A [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwc1j-0007ea-Nr
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
 precache extents
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/11/25 14:55, wangzijie wrote:
>> On 9/10/25 21:58, wangzijie wrote:
>>> When the data layout is like this:
>>> dnode1:                     dnode2:
>>> [0]      A                  [0]    NEW_ADDR
>>> [1]      A+1                [1]    0x0
>>> ...                         ....
>>> [1016]   A+1016
>>> [1017]   B (B!=A+1017)      [1017] 0x0
>>>
>>> We can build this kind of layout by following steps(with i_extra_isize:36):
>>> ./f2fs_io write 1 0 1881 rand dsync testfile
>>> ./f2fs_io write 1 1881 1 rand buffered testfile
>>> ./f2fs_io fallocate 0 7708672 4096 testfile
>>>
>>> And when we map first data block in dnode2, we will get wrong extent_info data:
>>> map->m_len = 1
>>> ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1
>>>
>>> ei.fofs = start_pgofs = 1882
>>> ei.len = map->m_len - ofs = 1 - 1 = 0
>>
>> Hi Zijie,
>>
>> I tried to reproduce w/ below steps:
>>
>> f2fs_io write 1 0 1881 rand dsync testfile
>> f2fs_io write 1 1881 1 rand buffered testfile
>> f2fs_io fallocate 0 7708672 4096 testfile
>> umount
>> mount
>> f2fs_io precache_extents testfile
>>
>>          f2fs_io-921     [013] .....  1049.855817: f2fs_lookup_start: dev = (253,16), pino = 3, name:testfile, flags:65537
>>          f2fs_io-921     [013] .....  1049.855870: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), DATA, sector = 139280, size = 4096
>>          f2fs_io-921     [013] .....  1049.856116: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x5, oldaddr = 0x5553, newaddr = 0x5553, rw = READ(), type = HOT_NODE
>>          f2fs_io-921     [013] .....  1049.856147: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174744, size = 4096
>>          f2fs_io-921     [013] .....  1049.856273: f2fs_iget: dev = (253,16), ino = 5, pino = 3, i_mode = 0x81ed, i_size = 7712768, i_nlink = 1, i_blocks = 15080, i_advise = 0x0
>>          f2fs_io-921     [013] .....  1049.856305: f2fs_lookup_end: dev = (253,16), pino = 3, name:testfile, ino:5, err:0
>>          f2fs_io-921     [013] .....  1049.856316: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 0, type = Read
>>          f2fs_io-921     [013] .....  1049.856317: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 0, read_ext_info(fofs: 0, len: 512, blk: 1055744)
>>          f2fs_io-921     [013] .....  1049.856317: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 0, start blkaddr = 0x101c00, len = 0x200, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>>          f2fs_io-921     [013] .....  1049.856318: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 512, type = Read
>>          f2fs_io-921     [013] .....  1049.856318: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 512, read_ext_info(fofs: 0, len: 0, blk: 0)
>>          f2fs_io-921     [013] .....  1049.856323: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 512, len = 352, blkaddr = 18432, c_len = 0
>>          f2fs_io-921     [013] .....  1049.856328: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x6, oldaddr = 0x5556, newaddr = 0x5556, rw = READ(), type = HOT_NODE
>>          f2fs_io-921     [013] .....  1049.856329: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174768, size = 4096
>>          f2fs_io-921     [021] .....  1049.856968: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 864, len = 160, blkaddr = 18784, c_len = 0
>>          f2fs_io-921     [021] .....  1049.857002: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 512, start blkaddr = 0x4800, len = 0x200, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>>          f2fs_io-921     [021] .....  1049.857003: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1025, type = Read
>>          f2fs_io-921     [021] .....  1049.857004: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1025, read_ext_info(fofs: 0, len: 0, blk: 0)
>>          f2fs_io-921     [021] .....  1049.857010: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 1025, len = 511, blkaddr = 19457, c_len = 0
>>          f2fs_io-921     [021] .....  1049.857011: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1025, start blkaddr = 0x4c01, len = 0x1ff, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>>          f2fs_io-921     [021] .....  1049.857012: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1537, type = Read
>>          f2fs_io-921     [021] .....  1049.857012: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1537, read_ext_info(fofs: 0, len: 0, blk: 0)
>>          f2fs_io-921     [021] .....  1049.857016: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 1537, len = 344, blkaddr = 20993, c_len = 0
>>          f2fs_io-921     [021] .....  1049.857016: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1537, start blkaddr = 0x5201, len = 0x158, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>>          f2fs_io-921     [021] .....  1049.857017: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1882, type = Read
>>          f2fs_io-921     [021] .....  1049.857017: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1882, read_ext_info(fofs: 0, len: 0, blk: 0)
>>          f2fs_io-921     [021] .....  1049.857024: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x7, oldaddr = 0x5555, newaddr = 0x5555, rw = READ(), type = HOT_NODE
>>          f2fs_io-921     [021] .....  1049.857026: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174760, size = 4096
>>          f2fs_io-921     [021] .....  1049.857156: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1882, start blkaddr = 0x5201, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>>
>> It seems f2fs_update_read_extent_tree_range() won't insert a zero-sized extent?
>> Or am I missing something?
>>
>> Thanks,
> 
> Hi, Chao
> I test it again with below steps:
> 
> ./f2fs_io write 1 0 1881 rand dsync testfile
> ./f2fs_io fallocate 0 7708672 4096 testfile
> ./f2fs_io write 1 1881 1 rand buffered testfile
> fsync testfile
> umount
> mount
> ./f2fs_io precache_extents testfile

Oh, I can reproduce the bug w/ above scripts, thanks.

Thanks,

> 
>          f2fs_io-8749    [003] .....    86.759281: f2fs_lookup_start: dev = (254,57), pino = 45485, name:testfile, flags:257
>          f2fs_io-8749    [003] .....    86.759954: f2fs_iget: dev = (254,57), ino = 501391, pino = 45485, i_mode = 0x81ed, i_size = 7712768, i_nlink = 1, i_blocks = 15080, i_advise = 0x0
>          f2fs_io-8749    [003] .....    86.759968: f2fs_lookup_end: dev = (254,57), pino = 45485, name:testfile, ino:501391, err:0
>          f2fs_io-8749    [003] .....    86.760000: f2fs_lookup_extent_tree_start: dev = (254,57), ino = 501391, pgofs = 0, type = Read
>          f2fs_io-8749    [003] .....    86.760020: f2fs_lookup_read_extent_tree_end: dev = (254,57), ino = 501391, pgofs = 0, read_ext_info(fofs: 0, len: 1881, blk: 3164707)
>          f2fs_io-8749    [003] .....    86.760020: f2fs_map_blocks: dev = (254,57), ino = 501391, file offset = 0, start blkaddr = 0x304a23, len = 0x759, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>          f2fs_io-8749    [003] .....    86.760021: f2fs_lookup_extent_tree_start: dev = (254,57), ino = 501391, pgofs = 1881, type = Read
>          f2fs_io-8749    [003] .....    86.760022: f2fs_lookup_read_extent_tree_end: dev = (254,57), ino = 501391, pgofs = 1881, read_ext_info(fofs: 0, len: 0, blk: 0)
>          f2fs_io-8749    [005] .....    86.760162: f2fs_update_read_extent_tree_range: dev = (254,57), ino = 501391, pgofs = 1881, len = 1, blkaddr = 2688335, c_len = 0
>     *****f2fs_io-8749    [005] .....    86.760324: f2fs_update_read_extent_tree_range: dev = (254,57), ino = 501391, pgofs = 1882, len = 0, blkaddr = 2688336, c_len = 0  ******
>          f2fs_io-8749    [005] .....    86.760326: f2fs_map_blocks: dev = (254,57), ino = 501391, file offset = 1881, start blkaddr = 0x29054f, len = 0x1, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
> 
> 
> inode:
> i_ext: fofs:0 blkaddr:304a23 len:759
> i_addr[0x9]     [0x  304a23 : 3164707]
> ....
> i_addr[0x368]   [0x  304d82 : 3165570]
> 
> dnode1:
> [0]    [0x  304d83 : 3165571]
> [1016] [0x  30517b : 3166587]
> ...
> [1017] [0x  29054f : 2688335]
> 
> dnode2:
> [0]  	NEW_ADDR
> [1]     [0x       0 : 0]
> ...
> 
> 
> 
> 
>>>
>>> Fix it by skipping updating this kind of extent info.
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>>  fs/f2fs/data.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 7961e0ddf..b8bb71852 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1649,6 +1649,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>>  
>>>  		switch (flag) {
>>>  		case F2FS_GET_BLOCK_PRECACHE:
>>> +			if (__is_valid_data_blkaddr(map->m_pblk) &&
>>> +				start_pgofs - map->m_lblk == map->m_len)
>>> +				map->m_flags &= ~F2FS_MAP_MAPPED;
>>>  			goto sync_out;
>>>  		case F2FS_GET_BLOCK_BMAP:
>>>  			map->m_pblk = 0;
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
