Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96E2A3EBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 09:18:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZrW6-0004Er-KH; Tue, 03 Nov 2020 08:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZrW5-0004ES-E8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSpE2U4fdmK4eX1DLBur3NtlBBMiXhEXzRUl+i9xRHY=; b=b8Ov8Bv60PJo7K6DIqUzfhyer8
 kmc0WQ9VC5rqFz4fBOHKxSqLZT1MAb2x4tS9xIJba0G7PBC9kYuPpf57H4V3r2earkMhT9XKejMey
 s+gPZsZLciHzBAgon/qBHVCWDjvdeJw3Zt8Ppn18YyVhoP4ltQwa6dpBiBbBiKc7utvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YSpE2U4fdmK4eX1DLBur3NtlBBMiXhEXzRUl+i9xRHY=; b=c+7xi63XpcZfCRvROvKrLxFrGJ
 UTM/vGxBVLhmBvMH5G94kiP18TgQwDTicEQabinB58lfZJrwEg22Hln1i4UbHSkDDB/dZyUMCK0/J
 RuvH6/61C4NQPrZLgOicyDZc4YuBVoSLojemIlMpsV9BikJ4Bkg+A1dI09YTYaGcT9GU=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZrVx-007S9C-UD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 08:18:09 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQN1v6N41zLsqq;
 Tue,  3 Nov 2020 16:17:39 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 3 Nov 2020
 16:17:40 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201102062131.14205-1-yuchao0@huawei.com>
 <20201103032234.GB2875@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c7e47bac-16e6-2038-3eb3-0fdb787ce977@huawei.com>
Date: Tue, 3 Nov 2020 16:17:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201103032234.GB2875@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: decadent.org.uk]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZrVx-007S9C-UD
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: move ioctl interface definitions to
 separated file
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

On 2020/11/3 11:22, Eric Biggers wrote:
> On Mon, Nov 02, 2020 at 02:21:31PM +0800, Chao Yu wrote:
>> +#define F2FS_IOC_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
>> +						struct f2fs_move_range)
> [...]
>> +#define F2FS_IOC_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,	\
>> +						struct f2fs_gc_range)
> [...]
>> +
>> +struct f2fs_gc_range {
>> +	__u32 sync;
>> +	__u64 start;
>> +	__u64 len;
>> +};
> [...]
>> +struct f2fs_move_range {
>> +	__u32 dst_fd;		/* destination fd */
>> +	__u64 pos_in;		/* start position in src_fd */
>> +	__u64 pos_out;		/* start position in dst_fd */
>> +	__u64 len;		/* size to move */
>> +};
> 
> These two structs are weird because there is implicit padding between the __u32
> field and the following __u64 field on some 32-bit architectures (e.g. x86_32)
> but not others (e.g. arm32).
> 
> But f2fs_compat_ioctl() doesn't handle these two ioctls specially, but rather
> just calls through to f2fs_ioctl().  That's wrong, and it means that
> F2FS_IOC_MOVE_RANGE and F2FS_IOC_GARBAGE_COLLECT_RANGE won't work when called
> from an x86_32 binary on an x86_64 kernel.

Nice catch!

> 
> So something needs to be fixed.  I wonder if it's safe to just explicitly add
> the padding field after the fact.  If no one is actually using these two ioctls
> in a case where both userspace and the kernel lack the implicit padding (e.g.,
> x86_32 userspace with x86_32 kernel), it should be fine...

IIRC, Jaegeuk added those interfaces, I hope it's not the requirement from other
f2fs userspace developers...if it is, there may be users.

I found one patch in ext4 which fixes the similar issue, I guess we can fix this
with the same way, thoughts?

commit 4d92dc0f00a775dc2e1267b0e00befb783902fe7
Author: Ben Hutchings <ben@decadent.org.uk>
Date:   Mon May 17 06:00:00 2010 -0400

     ext4: Fix compat EXT4_IOC_ADD_GROUP

     struct ext4_new_group_input needs to be converted because u64 has
     only 32-bit alignment on some 32-bit architectures, notably i386.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
