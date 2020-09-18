Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19926F24D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 04:58:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ6bt-0004kY-Rb; Fri, 18 Sep 2020 02:58:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kJ6bs-0004kR-N4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJClniacXGE6fETImFUsIPmxmAu6uyIDqIxoTJy4pRY=; b=OlOFjHVMtq5FPKCzG7q1AMbqwb
 3kzPrlkUJ/xJXl1Gn0OqVhllxpgb15tXincTeuOcAYX3anWFaKLM4Gok83d19QHOH4oB8CsKbf04l
 D5y3HeFUTA6yW71PBrKhvNkrzEY6r54NCv7cH7mQ79J6bnEJSYFWrKp+dz6B3KhF+npM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AJClniacXGE6fETImFUsIPmxmAu6uyIDqIxoTJy4pRY=; b=nGQtt6E5JZYraLvW8NNjfLX36q
 S9XAeat2ru7anSAS+PENIXZDyaL5R33Y8I2nAzU1mrA+7Imwhy6nsi9sx1GcH/mHR44kBnXxnbr4o
 b7FNUmF2se8sk7K1DisR1YnznGiNEkC1hKyamegPVy24NQfplVdV9SjWrFMe4eSprG7w=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ6bq-00F0VK-4M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:58:52 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 92998A3469232E76FC6F;
 Fri, 18 Sep 2020 10:58:39 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 18 Sep
 2020 10:58:36 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
 <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
 <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
 <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
 <9589E483-A94B-4AF6-8C03-B0763715B40A@fb.com>
 <a8b6e21d-fb51-1a50-8f2a-045f3a496c12@huawei.com>
 <20200918025627.GA3518637@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6eb268c8-7276-5859-e5b0-ce0a541e27e7@huawei.com>
Date: Fri, 18 Sep 2020 10:58:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200918025627.GA3518637@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kJ6bq-00F0VK-4M
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
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
Cc: Johannes Weiner <jweiner@fb.com>, Nick
 Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>, Chris
 Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/9/18 10:56, Eric Biggers wrote:
> On Fri, Sep 18, 2020 at 09:47:32AM +0800, Chao Yu wrote:
>> Ah, I got it.
>>
>> Step of enabling compressed inode is not correct, we should touch an empty
>> file, and then use 'chattr +c' on that file to enable compression, otherwise
>> the race condition could be complicated to handle. So we need below diff to
>> disallow setting compression flag on an non-empty file:
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 8a422400e824..b462db7898fd 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1836,6 +1836,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>   		if (iflags & F2FS_COMPR_FL) {
>>   			if (!f2fs_may_compress(inode))
>>   				return -EINVAL;
>> +			if (get_dirty_pages(inode) || fi->i_compr_blocks)
>> +				return  -EINVAL;
>>
>>   			set_compress_context(inode);
>>   		}
> 
> Why not:
> 
> 	if (inode->i_size)
> 		return -EINVAL;

Yeah, I noticed that after replying this email, I've prepared the new patch
which including the i_size check.

Thanks for noticing this.

Thanks,

> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
