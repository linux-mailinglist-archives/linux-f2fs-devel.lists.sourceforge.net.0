Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9BDAD49D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 10:17:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7ErG-00074x-2c; Mon, 09 Sep 2019 08:17:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i7ErE-00072X-3E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVQ4jz017PbSupHHijnbZ+1QpvnZ93IeZQVArY5TpG4=; b=MA8Rp4o5bH1+sV9YBbobHmfLoR
 Gzed6qUpMFitbov7zfcljjR+N8JRaDVA7urndV4GTrZ3b8vn+FLtNaafZGzn1w+waIW/qjKiQHUH0
 CnkLbrHxfuAf3YK3p2jNocuXD/fTulRoosJdLSuGnlTLUrYleuSaOParN/QWg9X4oh7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVQ4jz017PbSupHHijnbZ+1QpvnZ93IeZQVArY5TpG4=; b=AsN9spWG3LmqwSULjXYTRmHCnR
 dUosbQTpCywiJws0jlikZZmon6cUkhyPcHkNc/Ya/SBlcNnA/nIAfXFtJlWmpkKbDDmDqqbvScIUi
 3p5Vzhqzp04rbDpMTUV8I7aSQTlsOWSOBrxZyTr9WCBkD/cSTWtbvUXr2mZOaj1kXssw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7ErB-005SA6-RU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:17:08 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D6650EBFA82F2F235BB9;
 Mon,  9 Sep 2019 16:16:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019
 16:16:54 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190906105426.109151-1-yuchao0@huawei.com>
 <20190906234808.GC71848@jaegeuk-macbookpro.roam.corp.google.com>
 <080e8dee-4726-8294-622a-cac26e781083@kernel.org>
 <20190909074425.GB21625@jaegeuk-macbookpro.roam.corp.google.com>
 <79228eaa-776f-da89-89f8-a9b5a90034b6@huawei.com>
Message-ID: <873f4c07-5694-6554-5266-81812a6bd617@huawei.com>
Date: Mon, 9 Sep 2019 16:16:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <79228eaa-776f-da89-89f8-a9b5a90034b6@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i7ErB-005SA6-RU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 field of inode page in is_alive()
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

On 2019/9/9 15:58, Chao Yu wrote:
> On 2019/9/9 15:44, Jaegeuk Kim wrote:
>> On 09/07, Chao Yu wrote:
>>> On 2019-9-7 7:48, Jaegeuk Kim wrote:
>>>> On 09/06, Chao Yu wrote:
>>>>> If inode is newly created, inode page may not synchronize with inode cache,
>>>>> so fields like .i_inline or .i_extra_isize could be wrong, in below call
>>>>> path, we may access such wrong fields, result in failing to migrate valid
>>>>> target block.
>>>>
>>>> If data is valid, how can we get new inode page?
>>
>> Let me rephrase the question. If inode is newly created, is this data block
>> really valid to move in GC?
> 
> I guess it's valid, let double check that.

We can see inode page:

- f2fs_create
 - f2fs_add_link
  - f2fs_add_dentry
   - f2fs_init_inode_metadata
    - f2fs_add_inline_entry
     - ipage = f2fs_new_inode_page
     - f2fs_put_page(ipage)   <---- after this

> 
>>
>>>
>>> is_alive()
>>> {
>>> ...
>>> 	node_page = f2fs_get_node_page(sbi, nid);  <--- inode page
>>
>> Aren't we seeing the below version warnings?
>>
>> if (sum->version != dni->version) {
>> 	f2fs_warn(sbi, "%s: valid data with mismatched node version.",
>>                            __func__);
>>         set_sbi_flag(sbi, SBI_NEED_FSCK);
>> }

The version of summary and dni are all zero.

summary nid: 613, ofs: 111, ver: 0
blkaddr 2436 (blkaddr in node 0)
expect: seg 10, ofs_in_seg: 54
real: seg 4294967295, ofs_in_seg: 0
ofs: 54, 0
node info ino:613, nid:613, nofs:0
ofs_in_addr: 0

Thanks,

>>
>>>
>>> 	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
>>
>> So, we're getting this? Does this incur infinite loop in GC?
>>
>> if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
>> 	f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
>> 	f2fs_bug_on(sbi, 1);
>> }
> 
> Yes, I only get this with generic/269, rather than "valid data with mismatched
> node version.".
> 
> With this patch, generic/269 won't panic again.
> 
> Thanks,
> 
>>
>>> ...
>>> }
>>>
>>> datablock_addr()
>>> {
>>> ...
>>> 	base = offset_in_addr(&raw_node->i);  <--- the base could be wrong here due to
>>> accessing uninitialized .i_inline of raw_node->i.
>>> ...
>>> }
>>>
>>> Thanks,
>>>
>>>>
>>>>>
>>>>> - gc_data_segment
>>>>>  - is_alive
>>>>>   - datablock_addr
>>>>>    - offset_in_addr
>>>>>
>>>>> Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>> ---
>>>>>  fs/f2fs/dir.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>>>>> index 765f13354d3f..b1840852967e 100644
>>>>> --- a/fs/f2fs/dir.c
>>>>> +++ b/fs/f2fs/dir.c
>>>>> @@ -479,6 +479,9 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>>>>>  		if (IS_ERR(page))
>>>>>  			return page;
>>>>>  
>>>>> +		/* synchronize inode page's data from inode cache */
>>>>> +		f2fs_update_inode(inode, page);
>>>>> +
>>>>>  		if (S_ISDIR(inode->i_mode)) {
>>>>>  			/* in order to handle error case */
>>>>>  			get_page(page);
>>>>> -- 
>>>>> 2.18.0.rc1
>> .
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
