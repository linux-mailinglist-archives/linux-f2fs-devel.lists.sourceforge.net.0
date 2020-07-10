Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6E21B032
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 09:30:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtnU8-0005C6-Er; Fri, 10 Jul 2020 07:30:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtnU7-0005By-3y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+K+d+ZeLCulpjE9Uanjfn0dOdhZsc/FUh/yVGwf2TxI=; b=OBu0hfBKJsiuG4XjjN+zj6KTR7
 npJKolzFULqHWhO8GUYf2OoM9o1/dOxR4h29jK+6L5O1nPO1ANl5Kk8w2nGldWkwTeLL26ryiJY2D
 Fiw4rYq/G5caekhTlp+LHGLWps1jKk5njVkcCKmA+tigFh1UT6wciYBB69UkFDDEHBHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+K+d+ZeLCulpjE9Uanjfn0dOdhZsc/FUh/yVGwf2TxI=; b=Dv0IhMD20J6OwAKxmMeDEldKbC
 04M/J9tR6/eKtW4nkbRi8pmK/stMdcZNgmvcWPhLibDYFbFFq8ZhySaDpWw6dzsZyZohNZ3Jfo3JJ
 y6h+kucxtlOYjIvtS0iOCERhddWZVM/sGYOoeXe37w+7cdnfGHljurGy97c/Diu+CfS8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtnU4-00FwVW-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 07:30:15 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 91077B6025E73CF1ECC6;
 Fri, 10 Jul 2020 15:30:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 15:30:01 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
 <62c9dd7a-5d18-8bb6-8e43-c055fcff51cc@huawei.com>
 <20200710033100.GE545837@google.com>
 <ede6620c-6fc9-797d-e3ea-e630eb76b309@huawei.com>
 <20200710035215.GI545837@google.com>
 <34cad197-75eb-d7c2-4465-261d5debfd3b@huawei.com>
 <20200710064603.GA1656368@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ebe95970-b764-cb8d-18a4-38555ad99667@huawei.com>
Date: Fri, 10 Jul 2020 15:29:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710064603.GA1656368@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtnU4-00FwVW-Hk
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 14:46, Jaegeuk Kim wrote:
> On 07/10, Chao Yu wrote:
>> On 2020/7/10 11:52, Jaegeuk Kim wrote:
>>> On 07/10, Chao Yu wrote:
>>>> On 2020/7/10 11:31, Jaegeuk Kim wrote:
>>>>> On 07/10, Chao Yu wrote:
>>>>>> On 2020/7/10 11:02, Jaegeuk Kim wrote:
>>>>>>> On 07/10, Daeho Jeong wrote:
>>>>>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>>>>>
>>>>>>>> Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
>>>>>>>>  1. Added -1 value support for range.len to signify the end of file.
>>>>>>>>  2. If the end of the range passes over the end of file, it means until
>>>>>>>>     the end of file.
>>>>>>>>  3. ignored the case of that range.len is zero to prevent the function
>>>>>>>>     from making end_addr zero and triggering different behaviour of
>>>>>>>>     the function.
>>>>>>>>
>>>>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>>>>>> ---
>>>>>>>>  fs/f2fs/file.c | 16 +++++++---------
>>>>>>>>  1 file changed, 7 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>>>> index 368c80f8e2a1..1c4601f99326 100644
>>>>>>>> --- a/fs/f2fs/file.c
>>>>>>>> +++ b/fs/f2fs/file.c
>>>>>>>> @@ -3813,21 +3813,19 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>>>>>>>>  	file_start_write(filp);
>>>>>>>>  	inode_lock(inode);
>>>>>>>>  
>>>>>>>> -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
>>>>>>>> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
>>>>>>>> +			range.start >= inode->i_size) {
>>>>>>>>  		ret = -EINVAL;
>>>>>>>>  		goto err;
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>> -	if (range.start >= inode->i_size) {
>>>>>>>> -		ret = -EINVAL;
>>>>>>>> +	if (range.len == 0)
>>>>>>>>  		goto err;
>>>>>>>> -	}
>>>>>>>>  
>>>>>>>> -	if (inode->i_size - range.start < range.len) {
>>>>>>>> -		ret = -E2BIG;
>>>>>>>> -		goto err;
>>>>>>>> -	}
>>>>>>>> -	end_addr = range.start + range.len;
>>>>>>>> +	if (range.len == (u64)-1 || inode->i_size - range.start < range.len)
>>>>>>>> +		end_addr = inode->i_size;
>>>>>>
>>>>>> We can remove 'range.len == (u64)-1' condition since later condition can cover
>>>>>> this?
>>>>>>
>>>>>>>
>>>>>>> Hmm, what if there are blocks beyond i_size? Do we need to check i_blocks for
>>>>>>
>>>>>> The blocks beyond i_size will never be written, there won't be any valid message
>>>>>> there, so we don't need to worry about that.
>>>>>
>>>>> I don't think we have a way to guarantee the order of i_size and block
>>>>> allocation in f2fs. See f2fs_write_begin and f2fs_write_end.
>>>>
>>>> However, write_begin & write_end are covered by inode_lock, it could not be
>>>> racy with inode size check in f2fs_sec_trim_file() as it hold inode_lock as
>>>> well?
>>>
>>> Like Daeho said, write_begin -> checkpoint -> power-cut can give bigger i_blocks
>>> than i_size.
>>
>> The path won't, cp only persists reserved block in dnode rather than written
>> data block in segment, because data will be copied to page cache after write_begin.
> 
> Ah, you're talking about data validity, while I was doing block allocation in
> this case. In either cases, I'd say secure_trim needs to trim whatever data
> in valid block *address*.

Yeah, I agreed, sec_trim should trim all data no matter locating inside or
beyond isize.

> 
>>
>> I think truncation path could as Daeho said:
>>
>> 1. truncate -> i_size update however blocks wasn't truncated yet -> checkpoint -> recovery
>> 2. truncate failed -> i_size update however partial blocks was truncated -> fsync
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>> ending criteria?
>>>>>>>
>>>>>>>> +	else
>>>>>>>> +		end_addr = range.start + range.len;
>>>>>>>>  
>>>>>>>>  	to_end = (end_addr == inode->i_size);
>>>>>>>>  	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
>>>>>>>> -- 
>>>>>>>> 2.27.0.383.g050319c2ae-goog
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> Linux-f2fs-devel mailing list
>>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Linux-f2fs-devel mailing list
>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
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
