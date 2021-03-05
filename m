Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4E32DFE8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Mar 2021 04:08:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lI0om-0007g6-V3; Fri, 05 Mar 2021 03:07:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lI0ol-0007fy-1i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 03:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9IoSglGPl4uxKXg6bqFLKo2ojkeT4YAb8eVB2BWHtuU=; b=grXlLu1Aw8eflE72lvKsTnvYtu
 GfvOHAXCUGHO6qBOCxV5Ytz2ZLjvSV1OXET8ZkFjyLdKrY5DFrDG3NCLUCjyhSYwhtxdvXRsCC43/
 peKrItk2W+RxZwk7i4X91pFyAa0RoR1UFhkBn9Rm9ddjyG2Sy8pLkxOFvK2Cay8XsL4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9IoSglGPl4uxKXg6bqFLKo2ojkeT4YAb8eVB2BWHtuU=; b=D+wPO+VA6K5LxhGkKVamD9nuon
 MET8BR3vuk6riYz/Ni2hWznLAIaD6b1iQ2hdDel+ylde2yTH03lhq4hLeAV58ICURpk4Qy2zJS/WV
 2MuSwUuhwAyMZhWlY+3E2WzU80vsKvrhJ1vS9xqMO9akyiQQe/cR57PLfVSJTpqDVrB8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lI0oa-00EY72-AT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 03:07:54 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DsCKJ1x5yzlT2D;
 Fri,  5 Mar 2021 11:05:24 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Mar 2021
 11:07:31 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
Date: Fri, 5 Mar 2021 11:07:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YEFBAuP26t0RzVHZ@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lI0oa-00EY72-AT
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 2021/3/5 4:20, Jaegeuk Kim wrote:
> On 02/27, Jaegeuk Kim wrote:
>> On 02/04, Chao Yu wrote:
>>> Jaegeuk,
>>>
>>> On 2021/2/2 16:00, Chao Yu wrote:
>>>> -	for (i = 0; i < dic->nr_cpages; i++) {
>>>> +	for (i = 0; i < cc->nr_cpages; i++) {
>>>>    		struct page *page = dic->cpages[i];
>>>
>>> por_fsstress still hang in this line?
>>
>> I'm stuck on testing the patches, since the latest kernel is panicking somehow.
>> Let me update later, once I can test a bit. :(
> 
> It seems this works without error.
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9

Ah, good news.

Thanks for helping to test the patch. :)

Thanks,

> 
>>
>>>
>>> Thanks,
>>>
>>>>    		block_t blkaddr;
>>>>    		struct bio_post_read_ctx *ctx;
>>>> @@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>>>>    		blkaddr = data_blkaddr(dn.inode, dn.node_page,
>>>>    						dn.ofs_in_node + i + 1);
>>>> +		f2fs_wait_on_block_writeback(inode, blkaddr);
>>>> +
>>>> +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
>>>> +			if (atomic_dec_and_test(&dic->remaining_pages))
>>>> +				f2fs_decompress_cluster(dic);
>>>> +			continue;
>>>> +		}
>>>> +
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
