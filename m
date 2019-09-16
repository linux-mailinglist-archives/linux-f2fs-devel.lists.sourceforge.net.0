Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73AB32DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2019 03:16:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i9fdA-0003Al-2D; Mon, 16 Sep 2019 01:16:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i9fd8-0003Ae-VN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 01:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GS95+I7l6t2cnFmyaYBHv+TPqouZXhA9PUIz69mjqOw=; b=Hs1WMEpjB8GvEocvqdtlk7lEVO
 047l/AxQOXqEcuebSKd+zZ2KefrbjtVm/d23Z2NwdmRUJF5RHQB6WyHfNnaUQYv4sACysY/B8GcQt
 jlXmMDZNK5uHbwuzkrb6foXBkVIhd4d2FknsP2FQMmaRgtqs1Y+T9yk67H3IZbxqKk08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GS95+I7l6t2cnFmyaYBHv+TPqouZXhA9PUIz69mjqOw=; b=XjKjaBMeMFV1HwzjMfi1FxOb/G
 w8+wQG7pnyalqY+Ve/MRWkJ422mJopPRqGbBZpzQIecJm5SJULInBBKIsvJ7c2RsRsu128ETK7eB9
 hrs0n0tLmHs7E7qJvrg8+4+8ab+m0tgm5oeha1Hd9/MHwZ0OOT7oeQ1GA3MwdotJ5EEQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i9fd7-006XEn-Av
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 01:16:38 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 909C6D44EE01C4B61374;
 Mon, 16 Sep 2019 09:16:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 16 Sep
 2019 09:16:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.de>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-4-rgoldwyn@suse.de>
 <20190913194641.GA72768@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <624dcdc9-db6b-d6dd-6df4-b175c1455dc7@huawei.com>
Date: Mon, 16 Sep 2019 09:16:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913194641.GA72768@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i9fd7-006XEn-Av
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix inode rwsem regression
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
Cc: david@fromorbit.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, Goldwyn Rodrigues <rgoldwyn@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, andres@anarazel.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/14 3:46, Jaegeuk Kim wrote:
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=ebef4d7eda0d06a6ab6dc0f9e9f848276e605962

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
> Merged. Thanks,
> 
> On 09/11, Goldwyn Rodrigues wrote:
>> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
>>
>> This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
>> Apparently our current rwsem code doesn't like doing the trylock, then
>> lock for real scheme.  So change our read/write methods to just do the
>> trylock for the RWF_NOWAIT case.
>>
>> We don't need a check for IOCB_NOWAIT and !direct-IO because it
>> is checked in generic_write_checks().
>>
>> Fixes: b91050a80cec ("f2fs: add nowait aio support")
>> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
>> ---
>>  fs/f2fs/file.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 3e58a6f697dd..c6f3ef815c05 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3134,16 +3134,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>  		goto out;
>>  	}
>>  
>> -	if ((iocb->ki_flags & IOCB_NOWAIT) && !(iocb->ki_flags & IOCB_DIRECT)) {
>> -		ret = -EINVAL;
>> -		goto out;
>> -	}
>> -
>> -	if (!inode_trylock(inode)) {
>> -		if (iocb->ki_flags & IOCB_NOWAIT) {
>> +	if (iocb->ki_flags & IOCB_NOWAIT) {
>> +		if (!inode_trylock(inode)) {
>>  			ret = -EAGAIN;
>>  			goto out;
>>  		}
>> +	} else {
>>  		inode_lock(inode);
>>  	}
>>  
>> -- 
>> 2.16.4
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
