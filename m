Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E682980
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 04:07:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huot0-0002lG-6f; Tue, 06 Aug 2019 02:07:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huosz-0002l2-0D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BRTeaut+IL9mXmzPX2vguv2YYxXD9N/k2s3sK7uF6s4=; b=Yk0b+Nx7u651SUaAeWaUg2As6h
 XxP4X4y6PG0NH6yO87h2+Ov0aF9Jqxs6w2zajn6QKevo8mfn9Rhv297AnTnHZG+SjzooKxejzM8eL
 z9x9lVsPp8W/2tbxrVkvitPuhBhF9vclEFamMa4VcHbd4v3DUx+hXyMarMqczuzRTMMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BRTeaut+IL9mXmzPX2vguv2YYxXD9N/k2s3sK7uF6s4=; b=GAgsUF34xSP5HVNKfqIkFTnPvf
 bJWEKAMTM10qRHTuiuVBmqmwPtjdIxXSakmjxzMVny+VyGWQ+Xv9qPeptfdn2tjZHm401elUojeAe
 hDnDysuI3xWJeq29I08bscJweJl8gLVeQQtrsO8jfXc6Dbx90RYISMeTtAgWV2YShKok=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huosx-00CEME-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:07:36 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DA81BC792E146B5D03D3;
 Tue,  6 Aug 2019 10:07:28 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019
 10:07:27 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190802101548.96543-1-yuchao0@huawei.com>
 <20190806004215.GC98101@jaegeuk-macbookpro.roam.corp.google.com>
 <dd284020-77b0-1627-2fc2-bc51745adfd3@huawei.com>
 <20190806012839.GD1029@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5c449273-5cf7-bcc6-a396-584b933833c1@huawei.com>
Date: Tue, 6 Aug 2019 10:07:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190806012839.GD1029@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1huosx-00CEME-Cw
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: avoid out-of-range memory
 access"
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

On 2019/8/6 9:28, Jaegeuk Kim wrote:
> On 08/06, Chao Yu wrote:
>> On 2019/8/6 8:42, Jaegeuk Kim wrote:
>>> On 08/02, Chao Yu wrote:
>>>> As Pavel Machek reported:
>>>>
>>>> "We normally use -EUCLEAN to signal filesystem corruption. Plus, it is
>>>> good idea to report it to the syslog and mark filesystem as "needing
>>>> fsck" if filesystem can do that."
>>>>
>>>> Still we need improve the original patch with:
>>>> - use unlikely keyword
>>>> - add message print
>>>> - return EUCLEAN
>>>>
>>>> However, after rethink this patch, I don't think we should add such
>>>> condition check here as below reasons:
>>>> - We have already checked the field in f2fs_sanity_check_ckpt(),
>>>> - If there is fs corrupt or security vulnerability, there is nothing
>>>> to guarantee the field is integrated after the check, unless we do
>>>> the check before each of its use, however no filesystem does that.
>>>> - We only have similar check for bitmap, which was added due to there
>>>> is bitmap corruption happened on f2fs' runtime in product.
>>>> - There are so many key fields in SB/CP/NAT did have such check
>>>> after f2fs_sanity_check_{sb,cp,..}.
>>>>
>>>> So I propose to revert this unneeded check.
>>>
>>> IIRC, this came from security vulnerability report which can access
>>
>> I don't think that's correct report, since we have checked validation of that
>> field during mount, if it can be ruined after that, any variables can't be trusted.
> 
> I assumed this was reproduced with a fuzzed image.

I expect f2fs_sanity_check_ckpt() should reject mounting such fuzzed image.

> I'll check it with Ocean.
> 
>>
>> Now we just check bitmaps at real-time, because we have encountered such bitmap
>> corruption in product.
>>
>> Thanks,
>>
>>> out-of-boundary memory region. Could you write another patch to address the
>>> above issues?
>>>
>>>>
>>>> This reverts commit 56f3ce675103e3fb9e631cfb4131fc768bc23e9a.
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>  fs/f2fs/segment.c | 5 -----
>>>>  1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 9693fa4c8971..2eff9c008ae0 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -3492,11 +3492,6 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
>>>>  		seg_i = CURSEG_I(sbi, i);
>>>>  		segno = le32_to_cpu(ckpt->cur_data_segno[i]);
>>>>  		blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
>>>> -		if (blk_off > ENTRIES_IN_SUM) {
>>>> -			f2fs_bug_on(sbi, 1);
>>>> -			f2fs_put_page(page, 1);
>>>> -			return -EFAULT;
>>>> -		}
>>>>  		seg_i->next_segno = segno;
>>>>  		reset_curseg(sbi, i, 0);
>>>>  		seg_i->alloc_type = ckpt->alloc_type[i];
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
