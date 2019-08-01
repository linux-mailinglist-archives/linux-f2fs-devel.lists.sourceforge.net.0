Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1717D6E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 10:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ht654-00041m-6T; Thu, 01 Aug 2019 08:04:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ht651-00041a-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 08:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7bh7KlPzirpyEeeGyoKtMpVDv9OIzpEznvMuU3KZtQ=; b=K3/dmSnrqUQ9wsKOIfQeb+b5lj
 H82IzADVnuQeXbTY68o+N1oW/WlXpnko9pLfvS9Q/mzH40nUjJmfKYS0ALplLwr8zRBccbIChtTP1
 3KYNsN4R8nir3DRwdFstHjLMsPm8GpT3Sl21OPyD6DmMtMAPFclYazh+ptv3dxzZ9vvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J7bh7KlPzirpyEeeGyoKtMpVDv9OIzpEznvMuU3KZtQ=; b=Q6CHcn+5SHvq2iaqw84ZMvYgSo
 okHawkkfz0kHGpVtp1ljlhV02zbcLCKuVQUz9Ksa1V2dGVLTv+XzR5gr4kmZPJmVJyJfKMHKo7UUS
 G0b6ehBx+Cu10JtL0PqViASzE0bg2mwPYDNfeV6qF/2gEEe5ELVZBUqTe7ZW/iog4Gsc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ht64y-006led-3c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 08:04:55 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7E83CA1EA9312ABEAB26;
 Thu,  1 Aug 2019 16:04:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 16:04:39 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190731204353.62056-1-jaegeuk@kernel.org>
 <f500dafa-19f4-78ff-2645-2239fbf43eab@huawei.com>
 <20190801042650.GD84433@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cd771dfe-19bd-c183-101b-d6d0327a76c2@huawei.com>
Date: Thu, 1 Aug 2019 16:04:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190801042650.GD84433@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ht64y-006led-3c
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix livelock in swapfile writes
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

On 2019/8/1 12:26, Jaegeuk Kim wrote:
> On 08/01, Chao Yu wrote:
>> On 2019/8/1 4:43, Jaegeuk Kim wrote:
>>> This patch fixes livelock in the below call path when writing swap pages.
>>>
>>> [46374.617256] c2    701  __switch_to+0xe4/0x100
>>> [46374.617265] c2    701  __schedule+0x80c/0xbc4
>>> [46374.617273] c2    701  schedule+0x74/0x98
>>> [46374.617281] c2    701  rwsem_down_read_failed+0x190/0x234
>>> [46374.617291] c2    701  down_read+0x58/0x5c
>>> [46374.617300] c2    701  f2fs_map_blocks+0x138/0x9a8
>>> [46374.617310] c2    701  get_data_block_dio_write+0x74/0x104
>>> [46374.617320] c2    701  __blockdev_direct_IO+0x1350/0x3930
>>> [46374.617331] c2    701  f2fs_direct_IO+0x55c/0x8bc
>>> [46374.617341] c2    701  __swap_writepage+0x1d0/0x3e8
>>> [46374.617351] c2    701  swap_writepage+0x44/0x54
>>> [46374.617360] c2    701  shrink_page_list+0x140/0xe80
>>> [46374.617371] c2    701  shrink_inactive_list+0x510/0x918
>>> [46374.617381] c2    701  shrink_node_memcg+0x2d4/0x804
>>> [46374.617391] c2    701  shrink_node+0x10c/0x2f8
>>> [46374.617400] c2    701  do_try_to_free_pages+0x178/0x38c
>>> [46374.617410] c2    701  try_to_free_pages+0x348/0x4b8
>>> [46374.617419] c2    701  __alloc_pages_nodemask+0x7f8/0x1014
>>> [46374.617429] c2    701  pagecache_get_page+0x184/0x2cc
>>> [46374.617438] c2    701  f2fs_new_node_page+0x60/0x41c
>>> [46374.617449] c2    701  f2fs_new_inode_page+0x50/0x7c
>>> [46374.617460] c2    701  f2fs_init_inode_metadata+0x128/0x530
>>> [46374.617472] c2    701  f2fs_add_inline_entry+0x138/0xd64
>>> [46374.617480] c2    701  f2fs_do_add_link+0xf4/0x178
>>> [46374.617488] c2    701  f2fs_create+0x1e4/0x3ac
>>> [46374.617497] c2    701  path_openat+0xdc0/0x1308
>>> [46374.617507] c2    701  do_filp_open+0x78/0x124
>>> [46374.617516] c2    701  do_sys_open+0x134/0x248
>>> [46374.617525] c2    701  SyS_openat+0x14/0x20
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fs/f2fs/data.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index abbf14e9bd72..f49f243fd54f 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1372,7 +1372,7 @@ static int get_data_block_dio_write(struct inode *inode, sector_t iblock,
>>>  	return __get_data_block(inode, iblock, bh_result, create,
>>>  				F2FS_GET_BLOCK_DIO, NULL,
>>>  				f2fs_rw_hint_to_seg_type(inode->i_write_hint),
>>> -				true);
>>> +				IS_SWAPFILE(inode) ? false : true);
>>
>> I suspect that we should use node_change for swapfile rather than just changing
>> may_write field to skip lock.
> 
> Swap write should not change the node page.

You're right.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
>>
>> __do_map_lock()
>> if (flag == F2FS_GET_BLOCK_PRE_AIO || IS_SWAPFILE(inode)) {
>> 	...
>> } else {
>> 	...
>> }
>>
>> Thanks,
>>
>>
>>>  }
>>>  
>>>  static int get_data_block_dio(struct inode *inode, sector_t iblock,
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
