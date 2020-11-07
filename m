Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9D2AA43E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Nov 2020 10:26:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kbKTm-0005MG-SC; Sat, 07 Nov 2020 09:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kbKTl-0005M7-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Nov 2020 09:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2/CyyXHzEAAhdnnosQA++0ESZ+WiSpb9L+D6RhWHKE=; b=ApEj1dtxHTfJLYX49JW/dv+0WQ
 YKjwRW6IBQskGD1XoDY+JbWuGCAQJZ9cF9Pyk2/vMA3wkfpimHEQEfdf+v1yekV8Gn0yHJcc56+Jh
 dKB5EVYQ5nVde2f0PkGSqeTEnPlphdjTEa/rHYYZd8AawbW2pL5kMxL5y8YIBCyInKDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W2/CyyXHzEAAhdnnosQA++0ESZ+WiSpb9L+D6RhWHKE=; b=YsnAMoIcHaHfimT+yzsmF9WfKY
 X3eNWrteRzAnEyxz83IhDdY5shXDGMewieO4Kurv6hsvg8xgQ9R5hakg/ABowA/aqU2angbGabZtL
 HzblQ350J/AsKLpiLeC0TwCfJHoA76ZhXExSUvA6PQZi9DUwvuVYzAfQou7ZwImWuD8U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kbKTZ-00COT9-C9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Nov 2020 09:25:49 +0000
Received: from [192.168.0.113] (unknown [117.89.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 733BF20719;
 Sat,  7 Nov 2020 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604741127;
 bh=iqpA6o35pg+nbMb5DHnGD+JQW+uCz/XmulgnMdR5h2c=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=V78g9n4PnmWuyNsGps29ODYrO88XCFjh1LRUbIDP8HTFqBncFcQv/dgtDrbIBA4Bj
 JA/LYIYiHHhszX300/tLH4kENFN2RlmHt4d9tylqitlpT72h7GDYwNB8+QsJzmiyKW
 K03db7oG1Lp8Mo1me9HYrrXb2ve8Ov1CrDG0+mJ0=
From: Chao Yu <chao@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20201106065331.76236-1-yuchao0@huawei.com>
 <20201106180324.GA78548@sol.localdomain>
Message-ID: <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
Date: Sat, 7 Nov 2020 17:25:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201106180324.GA78548@sol.localdomain>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kbKTZ-00COT9-C9
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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

On 2020/11/7 2:03, Eric Biggers wrote:
> On Fri, Nov 06, 2020 at 02:53:31PM +0800, Chao Yu wrote:
>> +#if defined(__KERNEL__)
>> +struct compat_f2fs_gc_range {
>> +	u32 sync;
>> +	compat_u64 start;
>> +	compat_u64 len;
>> +};
> 
> There's no need to use '#if defined(__KERNEL__)' in kernel source files.
> 
> Likewise for compat_f2fs_move_range.

Correct.

> 
>> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
>> +{
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
>> +	struct compat_f2fs_gc_range __user *urange;
>> +	struct f2fs_gc_range range;
>> +	int err;
>> +
>> +	if (unlikely(f2fs_cp_error(sbi)))
>> +		return -EIO;
>> +	if (!f2fs_is_checkpoint_ready(sbi))
>> +		return -ENOSPC;
> 
> I still don't understand why this checkpoint-related stuff is getting added
> here, and only to the compat versions of the ioctls.  It wasn't in the original
> version.  If they are needed then they should be added to __f2fs_ioc_gc_range()
> and __f2fs_ioc_move_range() (preferably by a separate patch) so that they are

If so, cp-related stuff will be checked redundantly in both f2fs_ioctl() and 
__f2fs_ioc_xxx() function for native GC_RANGE and MOVE_RANGE ioctls, it's not 
needed.

Thanks,

> done for both the native and compat versions of these ioctls.
> 
> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
