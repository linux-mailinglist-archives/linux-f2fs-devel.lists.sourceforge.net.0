Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC228ACC8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 04:40:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxMk1-0000Lx-LH; Tue, 13 Aug 2019 02:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxMjz-0000Lh-O0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 02:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1D1IF7mXHZIeZ97xHU6/8RN7tTv5N2mReuz+eihHskw=; b=PZmjfRGk8VOmq7I+dC/FT3jvT2
 nLYO6WMWs8VEq7v9X20L2F4y3L62gBbLmCZvpq1CgPYo8ziLBtG7Ol4OBFSi/CFUqJHg2uFp1HE9m
 8hPMchvVhNX8H4HbZvFT9JpRPkv36sL9xyHUqwTUR+oQriguDTntLTHTkSqkZDZ1sA9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1D1IF7mXHZIeZ97xHU6/8RN7tTv5N2mReuz+eihHskw=; b=O51B896sSsjAJeATvo6PEST5cb
 EfRv9nxVQAj/JeMg9jKT1X6RFWLz0P9LwKZWnvad2OG6bYKzI73bG70SCUnxY5P/ycBijapfRa/3X
 +jMUHpNCbiFgbfUHigHGVWNxyWh7gQvq+GBsFF9ZPSiPojd425xhdQf90Dy/70hV23NE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxMjx-003gU8-Ah
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 02:40:51 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5BDD9F756FE5AB8BEAEB;
 Tue, 13 Aug 2019 10:40:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 13 Aug
 2019 10:40:38 +0800
To: <linux-fscrypt@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190811213557.1970-1-ebiggers@kernel.org>
 <20190811213557.1970-4-ebiggers@kernel.org>
 <e5d57ee4-f022-12ca-7f09-e4b8ef86c6b6@huawei.com>
 <20190812225848.GA175194@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <13be698c-1a3d-9f6a-66d8-b9024b7963f3@huawei.com>
Date: Tue, 13 Aug 2019 10:40:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190812225848.GA175194@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hxMjx-003gU8-Ah
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: skip truncate when verity in
 progress in ->write_begin()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On 2019/8/13 6:58, Eric Biggers wrote:
> Hi Chao,
> 
> On Mon, Aug 12, 2019 at 08:25:33PM +0800, Chao Yu wrote:
>> Hi Eric,
>>
>> On 2019/8/12 5:35, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> When an error (e.g. ENOSPC) occurs during f2fs_write_begin() when called
>>> from f2fs_write_merkle_tree_block(), skip truncating the file.  i_size
>>> is not meaningful in this case, and the truncation is handled by
>>> f2fs_end_enable_verity() instead.
>>>
>>> Fixes: 60d7bf0f790f ("f2fs: add fs-verity support")
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>> ---
>>>  fs/f2fs/data.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 3f525f8a3a5fa..00b03fb87bd9b 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -2476,7 +2476,7 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
>>>  	struct inode *inode = mapping->host;
>>>  	loff_t i_size = i_size_read(inode);
>>>  
>>> -	if (to > i_size) {
>>
>> Maybe adding one single line comment to mention that it's redundant/unnecessary
>> truncation here is better, if I didn't misunderstand this.
>>
>> Thanks,
>>
>>> +	if (to > i_size && !f2fs_verity_in_progress(inode)) {
>>>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>>  		down_write(&F2FS_I(inode)->i_mmap_sem);
>>>  
> 
> Do you mean add a comment instead of the !f2fs_verity_in_progress() check, or in
> addition to it?  ->write_begin(), ->writepages(), and ->write_end() are all

Sorry, I didn't make this very clear, I meant adding the comment in addition on
above change.

> supposed to ignore i_size when verity is in progress, so I don't think this
> particular part should be different, even if technically it's still correct to
> truncate twice.  Also, ext4 needs this check in its ->write_begin() for locking
> reasons; we should keep f2fs similar.

Agreed.

> 
> How about having both a comment and the check, like:
> 
>         /* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
>         if (to > i_size && !f2fs_verity_in_progress(inode)) {

The comment looks good to me. :)

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
