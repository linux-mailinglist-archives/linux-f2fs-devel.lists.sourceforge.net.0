Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 331462A5CD5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 03:52:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka8uk-0002Fn-6J; Wed, 04 Nov 2020 02:52:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ka8ui-0002Fa-6a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PjperagnsSXNR1M/Vl5WUpraD/wLfKttsQ/NFXSQ5ms=; b=U0DwC5EW2vqfms2hYOa741Th93
 +qcWx2DyelhmyiG7NnHSXyY98mYLpmEBap8WgTPNpB8Jc7wDwUM5X/l0pmt3pjDeChuXaIo28JiEl
 AkHJp36w20IUwoGt88MwtBMhLLSfHJ+OJ57S60Scx64RI4JAHmqkxoK0rpAJIRiDvpc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PjperagnsSXNR1M/Vl5WUpraD/wLfKttsQ/NFXSQ5ms=; b=SLGs3ieINgCCuuNcpUvRaaV7jz
 aO5BQeW/pw0LT6iaRoDPVordj+cdXrgyBAkwcOWM7+HyLROxAhbYz208qUxdqOc+el5hFYu4KGzjz
 WTkMRA9jqAMmyPEvaVuSeCoQnAF/5VSIIOkkFDjtTp1DlQ9vtvv9G82Yv2huUmiwcqa4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ka8uX-000j12-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:52:43 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQrlx4zPzzhZlN;
 Wed,  4 Nov 2020 10:52:13 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 4 Nov 2020
 10:52:14 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201104021906.108534-1-yuchao0@huawei.com>
 <20201104022908.GA832@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2d1f5f85-f1a1-edf1-82a4-ee47fd46c349@huawei.com>
Date: Wed, 4 Nov 2020 10:52:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201104022908.GA832@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ka8uX-000j12-Oj
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/4 10:29, Eric Biggers wrote:
> On Wed, Nov 04, 2020 at 10:19:06AM +0800, Chao Yu wrote:
>> Eric reported a ioctl bug in below link:
>>
>> https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
>>
>> That said, on some 32-bit architectures, u64 has only 32-bit alignment,
>> notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
>> in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
>> compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
>> due to mismatched value of ioctl command in betweeen binary and f2fs
>> module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
>>
>> In this patch we introduce two ioctls for compatibility of above special
>> 32-bit binary:
>> - F2FS_IOC32_GARBAGE_COLLECT_RANGE
>> - F2FS_IOC32_MOVE_RANGE
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>
>> Jaegeuk, Eric,
>>
>> I have no 32-bit machine now, so I don't run any test on this patch,
>> please take a look at this RFC patch first.
> 
> You can test this by running a 32-bit binary on a machine with a 64-bit kernel.
> E.g. on x86_64, compile a binary with 'gcc -m32'.

Ah, thanks for providing the option, I can try that.

> 
>>   #ifdef CONFIG_COMPAT
>> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
>> +{
>> +	struct compat_f2fs_gc_range __user *urange;
>> +	struct f2fs_gc_range range;
>> +	int err;
>> +
>> +	urange = compat_ptr(arg);
>> +	err = get_user(range.sync, &urange->sync);
>> +	err |= get_user(range.start, &urange->start);
>> +	err |= get_user(range.len, &urange->len);
>> +	if (err)
>> +		return -EFAULT;
>> +	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(file)))))
>> +		return -EIO;
>> +	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(file))))
>> +		return -ENOSPC;
>> +	return f2fs_ioc_gc_range(file, (unsigned long)&range);
>> +}
> 
> This won't work because f2fs_ioc_gc_range() expects a user pointer.  You'll need
> to make the native and compat versions do the copy from user separately, and
> have them call a helper function that takes a pointer to the argument in kernel
> memory.

Yes, I need to introduce function like __f2fs_ioc_gc_range() to accepted pointer
parameter which points kernel memory.

Will do test and resend v2 soon.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
