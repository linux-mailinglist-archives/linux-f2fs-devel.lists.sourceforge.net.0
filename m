Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5111C20C529
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 03:26:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpM5W-0002qX-Sj; Sun, 28 Jun 2020 01:26:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpM5V-0002qQ-6q
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 01:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQ9Dd+23lGyqDMzOL2TCSWSSvHz7WmZIUXWvH3go5XU=; b=gcgwJ5enFuyy/nNvNq+qjLnAtJ
 PNNs+2zVttYC2zwJiVriCE48EbgGL9DJnbqGNaUtukFCgPcEc+b4fziboCZOCwPSxDqCDi/BZuAxb
 yTpNd3pLRCrkDJp+Hd+9BfbFCgVrmpZwWsEVvDzPpcYIdzHbVPOTt4cS7ClXttHL5kBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQ9Dd+23lGyqDMzOL2TCSWSSvHz7WmZIUXWvH3go5XU=; b=FOazEhwVbeDFTg6v7ePRrTOwod
 5aoZW2EUWAxll90k3xEGWtuGcHkRQgZQqFVyBfZ49PdJDSSbW0UDLO3Cx5e9e4QiYyHBPhFgR1Mvs
 +ILG6iShqc+QQnJ3CqiGXr+mYjCucXKiTtGX3JJHW2BYE6za3Xf6qIOm9+kLoSbRx92M=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpM5S-003jRE-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 01:26:29 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C4A0A5F68A77E0CBA138;
 Sun, 28 Jun 2020 09:26:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 09:26:06 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200618063625.110273-1-yuchao0@huawei.com>
 <20200618235932.GA227771@google.com>
 <f5bbb14b-52a0-9697-a8fe-c3e39f78b0a5@huawei.com>
 <20200619054922.GC227771@google.com>
 <3634ef79-5903-449d-0d52-3d5566481863@huawei.com>
 <20200619224755.GA60059@google.com>
 <3f49539a-7be1-be90-d13a-2f66a8483458@huawei.com>
 <20200621163834.GA36924@google.com>
 <da9df754-2e19-132c-9791-cac0361a1aad@huawei.com>
 <20200624155555.GA215264@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <27e196fe-276c-e88f-75a9-cd21c873ffd7@huawei.com>
Date: Sun, 28 Jun 2020 09:26:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200624155555.GA215264@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpM5S-003jRE-OJ
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: fix to wait page writeback before
 update
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

On 2020/6/24 23:55, Jaegeuk Kim wrote:
> On 06/22, Chao Yu wrote:
>> On 2020/6/22 0:38, Jaegeuk Kim wrote:
>>> On 06/20, Chao Yu wrote:
>>>> On 2020/6/20 6:47, Jaegeuk Kim wrote:
>>>>> On 06/19, Chao Yu wrote:
>>>>>> On 2020/6/19 13:49, Jaegeuk Kim wrote:
>>>>>>> On 06/19, Chao Yu wrote:
>>>>>>>> Hi Jaegeuk,
>>>>>>>>
>>>>>>>> On 2020/6/19 7:59, Jaegeuk Kim wrote:
>>>>>>>>> Hi Chao,
>>>>>>>>>
>>>>>>>>> On 06/18, Chao Yu wrote:
>>>>>>>>>> to make page content stable for special device like raid.
>>>>>>>>>
>>>>>>>>> Could you elaborate the problem a bit?
>>>>>>>>
>>>>>>>> Some devices like raid5 wants page content to be stable, because
>>>>>>>> it will calculate parity info based page content, if page is not
>>>>>>>> stable, parity info could be corrupted, result in data inconsistency
>>>>>>>> in stripe.
>>>>>>>
>>>>>>> I don't get the point, since those pages are brand new pages which were not
>>>>>>> modified before. If it's on writeback, we should not modify them regardless
>>>>>>> of whatever raid configuration. For example, f2fs_new_node_page() waits for
>>>>>>> writeback. Am I missing something?
>>>>>>
>>>>>> I think we should use f2fs_bug_on(, PageWriteback()) rather than
>>>>>> f2fs_wait_on_page_writeback() for brand new page which is allocated just now.
>>>>>> For other paths, we can keep rule that waiting for writeback before updating.
>>>>>>
>>>>>> How do you think?
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>>>>>>> ---
>>>>>>>>>>  fs/f2fs/dir.c          |  2 ++
>>>>>>>>>>  fs/f2fs/extent_cache.c | 18 +++++++++---------
>>>>>>>>>>  fs/f2fs/f2fs.h         |  2 +-
>>>>>>>>>>  fs/f2fs/file.c         |  1 +
>>>>>>>>>>  fs/f2fs/inline.c       |  2 ++
>>>>>>>>>>  fs/f2fs/inode.c        |  3 +--
>>>>>>>>>>  6 files changed, 16 insertions(+), 12 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>>>>>>>>>> index d35976785e8c..91e86747a604 100644
>>>>>>>>>> --- a/fs/f2fs/dir.c
>>>>>>>>>> +++ b/fs/f2fs/dir.c
>>>>>>>>>> @@ -495,6 +495,8 @@ static int make_empty_dir(struct inode *inode,
>>>>>>>>>>  	if (IS_ERR(dentry_page))
>>>>>>>>>>  		return PTR_ERR(dentry_page);
>>>>>>>>>>  
>>>>>>>>>> +	f2fs_bug_on(F2FS_I_SB(inode), PageWriteback(dentry_page));
>>>>>>>>>> +
>>>>>>>>>>  	dentry_blk = page_address(dentry_page);
>>>>>>>>>>  
>>>>>>>>>>  	make_dentry_ptr_block(NULL, &d, dentry_blk);
>>>>>>>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>>>>>>>>> index e60078460ad1..686c68b98610 100644
>>>>>>>>>> --- a/fs/f2fs/extent_cache.c
>>>>>>>>>> +++ b/fs/f2fs/extent_cache.c
>>>>>>>>>> @@ -325,9 +325,10 @@ static void __drop_largest_extent(struct extent_tree *et,
>>>>>>>>>>  }
>>>>>>>>>>  
>>>>>>>>>>  /* return true, if inode page is changed */
>>>>>>>>>> -static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
>>>>>>>>>> +static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
>>>>>>>>>>  {
>>>>>>>>>>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>>>>>>>> +	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
>>>>>>>>>>  	struct extent_tree *et;
>>>>>>>>>>  	struct extent_node *en;
>>>>>>>>>>  	struct extent_info ei;
>>>>>>>>>> @@ -335,16 +336,18 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
>>>>>>>>>>  	if (!f2fs_may_extent_tree(inode)) {
>>>>>>>>>>  		/* drop largest extent */
>>>>>>>>>>  		if (i_ext && i_ext->len) {
>>>>>>>>>> +			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
>>>>>>>>>>  			i_ext->len = 0;
>>>>>>>>>> -			return true;
>>>>>>>>>> +			set_page_dirty(ipage);
>>>>>>>>>> +			return;
>>>>>>>>>>  		}
>>>>>>>>>> -		return false;
>>>>>>>>>> +		return;
>>>>>>>>>>  	}
>>>>>>>>>>  
>>>>>>>>>>  	et = __grab_extent_tree(inode);
>>>>>>>>>>  
>>>>>>>>>>  	if (!i_ext || !i_ext->len)
>>>>>>>>>> -		return false;
>>>>>>>>>> +		return;
>>>>>>>>>>  
>>>>>>>>>>  	get_extent_info(&ei, i_ext);
>>>>>>>>>>  
>>>>>>>>>> @@ -360,17 +363,14 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
>>>>>>>>>>  	}
>>>>>>>>>>  out:
>>>>>>>>>>  	write_unlock(&et->lock);
>>>>>>>>>> -	return false;
>>>>>>>>>>  }
>>>>>>>>>>  
>>>>>>>>>> -bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
>>>>>>>>>> +void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
>>>>>>>>>>  {
>>>>>>>>>> -	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
>>>>>>>>>> +	__f2fs_init_extent_tree(inode, ipage);
>>>>>>>>>>  
>>>>>>>>>>  	if (!F2FS_I(inode)->extent_tree)
>>>>>>>>>>  		set_inode_flag(inode, FI_NO_EXTENT);
>>>>>>>>>> -
>>>>>>>>>> -	return ret;
>>>>>>>>>>  }
>>>>>>>>>>  
>>>>>>>>>>  static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>>>>>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>>>>>>> index b35a50f4953c..326c12fa0da5 100644
>>>>>>>>>> --- a/fs/f2fs/f2fs.h
>>>>>>>>>> +++ b/fs/f2fs/f2fs.h
>>>>>>>>>> @@ -3795,7 +3795,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
>>>>>>>>>>  bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
>>>>>>>>>>  						struct rb_root_cached *root);
>>>>>>>>>>  unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
>>>>>>>>>> -bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext);
>>>>>>>>>> +void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
>>>>>>>>>>  void f2fs_drop_extent_tree(struct inode *inode);
>>>>>>>>>>  unsigned int f2fs_destroy_extent_node(struct inode *inode);
>>>>>>>>>>  void f2fs_destroy_extent_tree(struct inode *inode);
>>>>>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>>>>>> index 3268f8dd59bb..1862073b96d2 100644
>>>>>>>>>> --- a/fs/f2fs/file.c
>>>>>>>>>> +++ b/fs/f2fs/file.c
>>>>>>>>>> @@ -1250,6 +1250,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
>>>>>>>>>>  				f2fs_put_page(psrc, 1);
>>>>>>>>>>  				return PTR_ERR(pdst);
>>>>>>>>>>  			}
>>>>>>>>>> +			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
>>>>>
>>>>> Do you mean pdst can be under writeback?
>>>>
>>>> Use f2fs_bug_on(, dirty || writeback) here?
>>>>
>>>>>
>>>>>>>>>>  			f2fs_copy_page(psrc, pdst);
>>>>>>>>>>  			set_page_dirty(pdst);
>>>>>>>>>>  			f2fs_put_page(pdst, 1);
>>>>>>>>>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>>>>>>>>>> index dbade310dc79..4bcbc486c9e2 100644
>>>>>>>>>> --- a/fs/f2fs/inline.c
>>>>>>>>>> +++ b/fs/f2fs/inline.c
>>>>>>>>>> @@ -340,6 +340,8 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
>>>>>>>>>>  	struct f2fs_dentry_ptr d;
>>>>>>>>>>  	void *inline_dentry;
>>>>>>>>>>  
>>>>>>>>>> +	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
>>>>
>>>> f2fs_bug_on(, writeback)?
>>>
>>> So, which case do you suspect unstable page for raid?
>>
>> - gc_node_segment
>>  - f2fs_move_node_page
>>   - __write_node_page
>>    - set_page_writeback
>>
>> - do_read_inode
>>  - f2fs_init_extent_tree
>>   - __f2fs_init_extent_tree
>>     i_ext->len = 0;
> 
> Could you please add wait_on_writeback on this specific case only
> with this backtrace in the description?

Sure, :)

Thanks,

> 
> Thanks,
> 
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>>>>>> +
>>>>>>>>>>  	inline_dentry = inline_data_addr(inode, ipage);
>>>>>>>>>>  
>>>>>>>>>>  	make_dentry_ptr_inline(inode, &d, inline_dentry);
>>>>>>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>>>>>>>> index 44582a4db513..7c156eb26dd7 100644
>>>>>>>>>> --- a/fs/f2fs/inode.c
>>>>>>>>>> +++ b/fs/f2fs/inode.c
>>>>>>>>>> @@ -367,8 +367,7 @@ static int do_read_inode(struct inode *inode)
>>>>>>>>>>  	fi->i_pino = le32_to_cpu(ri->i_pino);
>>>>>>>>>>  	fi->i_dir_level = ri->i_dir_level;
>>>>>>>>>>  
>>>>>>>>>> -	if (f2fs_init_extent_tree(inode, &ri->i_ext))
>>>>>>>>>> -		set_page_dirty(node_page);
>>>>>>>>>> +	f2fs_init_extent_tree(inode, node_page);
>>>>>>>>>>  
>>>>>>>>>>  	get_inline_info(inode, ri);
>>>>>>>>>>  
>>>>>>>>>> -- 
>>>>>>>>>> 2.18.0.rc1
>>>>>>>>> .
>>>>>>>>>
>>>>>>> .
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
