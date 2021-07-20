Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85A3CF136
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 03:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5ePu-0002dv-66; Tue, 20 Jul 2021 01:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m5ePs-0002dh-JV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQoDKHDLFyzM31Mo+G5yz81W3NZglGjSPg8a27lUm0k=; b=h4WgkgV0vg/i2cDRigoU8uU4w2
 dllZHb5sLQezFnI1697KOlYpsDV9E9Li6pdHUV0WIozXZPHtnvg4086UmkNExdBiRd7gHdqyrYAIh
 w0ogEYqcn/+HHum2rgAv/gYHCtFaLXdTIt8QG5Z2RvBnHroAKkvUHfJ4gas5zZsEspaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQoDKHDLFyzM31Mo+G5yz81W3NZglGjSPg8a27lUm0k=; b=fu0iw1wAoiuxbQKdFkSliLnk6i
 Iy7cJ+xh6dLrjHp+ZZDx9eNBB6HU4v9vROSAYM6pyPfZthikfcf9P48amF57hBD3jSVWQ3hJSjN0K
 DYnF4JZQ5C3dGRXhCQgGa4ehFFGDOOl2NVbl0BOp8ZLccHOhdDviQEmlhk4HXulMvOf0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5ePm-0007Ys-9f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:19:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1175160C3D;
 Tue, 20 Jul 2021 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626743952;
 bh=IYePbHY2sD319NqCb3FPOmyytqnU6F0vrlI4hwuRhJY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sl++5t77WUdsoedpKVHWuNLdUkd7yIt6kDWHypUlIlbHKDCcT3eI57gRiOexFHLYP
 uWjcvX2ChsNW3UMSCF9dx0jUOj7G2tr2TsDU7YciTHV2ERyRXjSjwYLdFTKk8MGZyR
 4fYV4F6NyH8oDpi0MvMzd5uQ8ifu0PstUG8QjquyL+im514arw43paScUbbYmEaqNY
 H72bhcgqIvOqCTgP0FEQOYUDDTj3di4IMwwJtz8jcgeMeKZ+DEu+xlne96FNMSLfEx
 RxWMbzn+y8Euv3gYess8USQxn+YSH5l0T45FIHjMJ10TSIUVBr/n4ioFW2yQWHbSkE
 +LADWSWdVS1mg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210720010329.3975-1-chao@kernel.org>
 <YPYjzAVq04LfUO2Y@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <014d1b9d-0698-fda1-0765-cce81d915280@kernel.org>
Date: Tue, 20 Jul 2021 09:19:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPYjzAVq04LfUO2Y@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5ePm-0007Ys-9f
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to force keeping write barrier
 for strict fsync mode
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/20 9:15, Jaegeuk Kim wrote:
> Wasn't it supposed to be v1?

I skip IPU case for v1, and resend it as v3, is it fine to you?

Thanks,

> 
> On 07/20, Chao Yu wrote:
>> [1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
>>
>> As [1] reported, if lower device doesn't support write barrier, in below
>> case:
>>
>> - write page #0; persist
>> - overwrite page #0
>> - fsync
>>   - write data page #0 OPU into device's cache
>>   - write inode page into device's cache
>>   - issue flush
>>
>> If SPO is triggered during flush command, inode page can be persisted
>> before data page #0, so that after recovery, inode page can be recovered
>> with new physical block address of data page #0, however there may
>> contains dummy data in new physical block address.
>>
>> Then what user will see is: after overwrite & fsync + SPO, old data in
>> file was corrupted, if any user do care about such case, we can suggest
>> user to use STRICT fsync mode, in this mode, we will force to use atomic
>> write sematics to keep write order in between data/node and last node,
>> so that it avoids potential data corruption during fsync().
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/file.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6afd4562335f..00b45876eaa1 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -301,6 +301,18 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>>   				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
>>   			goto flush_out;
>>   		goto out;
>> +	} else {
>> +		/*
>> +		 * for OPU case, during fsync(), node can be persisted before
>> +		 * data when lower device doesn't support write barrier, result
>> +		 * in data corruption after SPO.
>> +		 * So for strict fsync mode, force to use atomic write sematics
>> +		 * to keep write order in between data/node and last node to
>> +		 * avoid potential data corruption.
>> +		 */
>> +		if (F2FS_OPTION(sbi).fsync_mode ==
>> +				FSYNC_MODE_STRICT && !atomic)
>> +			atomic = true;
>>   	}
>>   go_write:
>>   	/*
>> -- 
>> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
