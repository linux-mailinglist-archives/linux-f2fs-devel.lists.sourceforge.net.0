Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5F859AEC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 04:13:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbu67-0007D2-W5;
	Mon, 19 Feb 2024 03:13:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbu67-0007Cw-7s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 03:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=co2q8ZyXZ45Mv3t27uX9AXqskLNB1ZSB46Pq5QQwMWc=; b=a7heZIPDeAYGDqv+uYhiYRatiT
 1HoHLZ9DGl6a2LTnpDeAsgUcYzJkBl0Z7B3jGMHrvcpOZUFU+zUKk9o8NgEoQicx9vu8FxXLBngGl
 w7TV8lyvAK25F9AE95DPPUqlQk+mJQeEF+iJ/NNC61nT27Fz54ZUHd+I6cyvtPAWBXbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=co2q8ZyXZ45Mv3t27uX9AXqskLNB1ZSB46Pq5QQwMWc=; b=D7bah16L/J8rCKF1gxbm8BIiLQ
 FOi3hnlq7aDBWfHilk3vrJIU5GAu6uXBj0p+xkUbitmSdmL8URz3TD82jjUUCrYOAGr73VxqzQjtW
 obxfcPmS0mmqDxYXu0YzhIxLV0T3qu/95zFFkSOxtSwRIeObcoQ8L8zUUjr5P8OJw9G0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbu61-0007YH-8z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 03:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D44ADCE091A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Feb 2024 03:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFBCC43390;
 Mon, 19 Feb 2024 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708312402;
 bh=vq0VEJAynaPzZpllpCAymXzLVyScLU3lDjD1xtMA6ks=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Z9MgkbULBD4KuZMGI+r3Mjt+s/DG6XCU9szLF0FOMpjStKU3HfQs8EezxvApFK5j1
 PUCzK2WiwhPa200O730Kr1puvhye13eb/iMaEyfr8KhASGyK2GA1OQzkHVBEqXnTyY
 VyMSJ+a7eaEKnXEe3ETMPzPQ+PTgUu8C3ieD+OtzUrJswfZe5F/TWaJMErG4R25FRI
 PSjbV9v+3bc2Edb5lTCsVEt8/7oaD5rYBZrdrgIs3OlCdkdP2FFFmSeIBKxNk6Q9xt
 8znF7bu/z2PxehwLO4p032pooTZRWPpgaiA/gMB5fx1Q9RJWlQqy8qiQ35t19Mg1Bg
 X7hDTEwop9wVg==
Message-ID: <8e69aa15-9779-4696-98ab-f173666a87a7@kernel.org>
Date: Mon, 19 Feb 2024 11:13:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240206032513.2495025-1-chao@kernel.org>
 <ZcQd3DtIpiA5P9DQ@google.com>
Content-Language: en-US
In-Reply-To: <ZcQd3DtIpiA5P9DQ@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/8 8:18, Jaegeuk Kim wrote: > On 02/06,
 Chao Yu wrote: >> generic/730 2s ... - output mismatch (see
 /media/fstests/results//generic/730.out.bad)
 >> --- tests/generic/730.out 2023-08-07 01:39: [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbu61-0007YH-8z
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return EIO when reading after
 device removal
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

On 2024/2/8 8:18, Jaegeuk Kim wrote:
> On 02/06, Chao Yu wrote:
>> generic/730 2s ... - output mismatch (see /media/fstests/results//generic/730.out.bad)
>>      --- tests/generic/730.out	2023-08-07 01:39:51.055568499 +0000
>>      +++ /media/fstests/results//generic/730.out.bad	2024-02-06 02:26:43.000000000 +0000
>>      @@ -1,2 +1 @@
>>       QA output created by 730
>>      -cat: -: Input/output error
>>      ...
>>      (Run 'diff -u /media/fstests/tests/generic/730.out /media/fstests/results//generic/730.out.bad'  to see the entire diff)
>> Ran: generic/730
>> Failures: generic/730
>> Failed 1 of 1 tests
>>
>> This patch adds a check condition in f2fs_file_read_iter() to
>> detect cp_error status after device removal, and retrurn -EIO
>> for such case.
> 
> Can we check device removal?

We can use blk_queue_dying() to detect device removal, but, IMO, device
removal can almost not happen in Android, not sure for distros or server,
do you want to add this check condition into f2fs_cp_error()?

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/file.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 45b7e3610b0f..9e4386d4144c 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4462,6 +4462,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>   	const loff_t pos = iocb->ki_pos;
>>   	ssize_t ret;
>>   
>> +	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>> +		return -EIO;
>> +
>>   	if (!f2fs_is_compress_backend_ready(inode))
>>   		return -EOPNOTSUPP;
>>   
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
