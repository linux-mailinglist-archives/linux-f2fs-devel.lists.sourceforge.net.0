Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B92A743E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Nov 2020 02:01:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaTea-0004BH-Nx; Thu, 05 Nov 2020 01:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kaTeX-0004B5-KR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Nov 2020 01:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=deYhQxEoIE1YLwyzlLXaTbIaoKfq7PUxqicRTlZpWTk=; b=BH/cjUBgflcPrLRkPwvGNToyzn
 SddmhTzrHrngInbdHjBEdQ3yplGl1ACPvvipd8tvByXKJtPacnS43Klt0HL98l4+lxJbWVvO/XUbr
 stE/jD3FjRyl5fDGteiJTA+HaapnTAdCWmAy5E2TPeZkcQ55UC1wyp6D0Wh+YhYDuYlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=deYhQxEoIE1YLwyzlLXaTbIaoKfq7PUxqicRTlZpWTk=; b=Z+vMwNXtbLT3sV2dtIGoQ4fHH1
 Z2eYgceHvhHVXVZ0Wp84JOriFOEN0pBGynZObq7fiAIfI+BTh49F7dgjUuPsY1cuwJdIWUCJzscX0
 9BXU9NQOwcwhh01jA5efLKvvsC1k5KU111ms15nlq6au/ApaTOWvDv6SJBf6+jzPgZNc=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaTeT-009qgU-A0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Nov 2020 01:01:25 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CRQF92qWxz71p3;
 Thu,  5 Nov 2020 09:01:01 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 5 Nov 2020
 09:00:59 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201104064310.15769-1-yuchao0@huawei.com>
 <20201104064310.15769-2-yuchao0@huawei.com>
 <20201104180153.GB846@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2bec3d16-e920-12b9-562d-0e055c1af28e@huawei.com>
Date: Thu, 5 Nov 2020 09:00:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201104180153.GB846@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kaTeT-009qgU-A0
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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

On 2020/11/5 2:01, Eric Biggers wrote:
> On Wed, Nov 04, 2020 at 02:43:10PM +0800, Chao Yu wrote:
>> +static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
>> +{
>> +	struct f2fs_gc_range range;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +	if (f2fs_readonly(sbi->sb))
>> +		return -EROFS;
>> +	if (copy_from_user(&range, (struct f2fs_gc_range __user *)arg,
>> +							sizeof(range)))
>> +		return -EFAULT;
>> +
>> +	return __f2fs_ioc_gc_range(filp, &range);
>> +}
> [...]
>>   #ifdef CONFIG_COMPAT
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
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +	if (f2fs_readonly(sbi->sb))
>> +		return -EROFS;
>> +
>> +	urange = compat_ptr(arg);
>> +	err = get_user(range.sync, &urange->sync);
>> +	err |= get_user(range.start, &urange->start);
>> +	err |= get_user(range.len, &urange->len);
>> +	if (err)
>> +		return -EFAULT;
>> +
>> +	return __f2fs_ioc_gc_range(file, &range);
>> +}
> 
> It would be better to have __f2fs_ioc_gc_range() handle the f2fs_cp_error(),
> f2fs_is_checkpoint_ready(), capable(), and f2fs_readonly() checks, so that they
> don't have to be duplicated in the native and compat cases.
> 
> Similarly for "move range".

Will clean up in v3.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
