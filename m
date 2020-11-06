Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB62A8C2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 02:42:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaqlR-0001lU-SN; Fri, 06 Nov 2020 01:42:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kaqlQ-0001l5-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 01:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDZZjzKxl0giFa3PbZYJq9JnIF7PIvvWVWPRMwU8t8o=; b=S6tLcddptspgwIH/Wn+stut66K
 b+0HaTgQxssiJy2fBQbPyHWAsVn6VAOFvWi5VCJbXzUBAk8wugBvzlYO+EvYhfulIKhj1inG5HFIP
 jDpR/6rsdzTH7ljJcZJrBAS+ctev0/zB0uFe0T/N9azJb1P8C/h/xiW4512bDmCU9UG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDZZjzKxl0giFa3PbZYJq9JnIF7PIvvWVWPRMwU8t8o=; b=IjCzho76EkkcoqbFVwd13C0J53
 EkpiZ5hoVCq4p53S4nMyTKGN+uPEIpDxcWNszQ0o6ILPoYdLfv36j0iXb6fuW9PEQNtW/rLGsnmiF
 PehONGfWNBsHdOg3McFRLwARs8YTtPFt1cRFr6kQzdh0vXRt68+PoGJGPPicRkkz4QZM=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaqlK-00B5Ks-Mi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 01:42:04 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CS35g1VsBzLsXP;
 Fri,  6 Nov 2020 09:41:43 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 6 Nov 2020
 09:41:46 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201105010934.16018-1-yuchao0@huawei.com>
 <20201106000550.GD2555324@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <07454135-539d-a159-deb8-ff29df7e22de@huawei.com>
Date: Fri, 6 Nov 2020 09:41:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201106000550.GD2555324@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kaqlK-00B5Ks-Mi
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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

On 2020/11/6 8:05, Eric Biggers wrote:
> This patch is marked 2/2, but it seems you sent it out on its own.  Patch series
> are supposed to be resend in full; otherwise people can see just one patch and
> have no context.

That's a historical problem, as in last many years, we (f2fs community) don't have
other long-term reviewers except Jaegeuk and me, so we have unwritten rule: only
resending changed patch in patchset.

IMO, that helps to skip traversing unchanged patches, and focusing reviewing on the
real change lines, and certainly we have its context in mind.

Personally, I prefer to revise, resend or review patch{,es} of patchset have real
change line in f2fs mailing list, anyway we can discuss about the rule here.

> 
> On Thu, Nov 05, 2020 at 09:09:34AM +0800, Chao Yu wrote:
>> Eric reported a ioctl bug in below link:
>>
>> https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
>>
>> That said, on some 32-bit architectures, u64 has only 32-bit alignment,
>> notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
>> in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
>> compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
>> due to mismatched value of ioctl command in between binary and f2fs
>> module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
>>
>> In this patch we introduce two ioctls for compatibility of above special
>> 32-bit binary:
>> - F2FS_IOC32_GARBAGE_COLLECT_RANGE
>> - F2FS_IOC32_MOVE_RANGE
>>
> 
> It would be good to add a proper reported-by line, otherwise it's not clear who
> "Eric" is (there are lots of Erics):
> 
> Reported-by: Eric Biggers <ebiggers@google.com>
Sure, although I attached the link includes original report email, in where it
points out who "Eric" is.

> 
>> +static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>>   {
>> -	struct inode *inode = file_inode(filp);
>> -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> -	struct f2fs_gc_range range;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>>   	u64 end;
>>   	int ret;
>>   
>> +	if (unlikely(f2fs_cp_error(sbi)))
>> +		return -EIO;
>> +	if (!f2fs_is_checkpoint_ready(sbi))
>> +		return -ENOSPC;
> 
> These two checkpoint-related checks weren't present in the original version.
> Is that intentional?

Quoted

 > It would be better to have __f2fs_ioc_gc_range() handle the f2fs_cp_error(),
 > f2fs_is_checkpoint_ready(), capable(), and f2fs_readonly() checks, so that they
 > don't have to be duplicated in the native and compat cases.

 > Similarly for "move range".

I missed to check the detail, and just follow, I can clean up it.

> 
>> +static int __f2fs_ioc_move_range(struct file *filp,
>> +				struct f2fs_move_range *range)
>>   {
>> -	struct f2fs_move_range range;
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>>   	struct fd dst;
>>   	int err;
>>   
>> +	if (unlikely(f2fs_cp_error(sbi)))
>> +		return -EIO;
>> +	if (!f2fs_is_checkpoint_ready(sbi))
>> +		return -ENOSPC;
>> +
> 
> Likewise here.
> 
>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>> index f00199a2e38b..8c14e88a9645 100644
>> --- a/include/uapi/linux/f2fs.h
>> +++ b/include/uapi/linux/f2fs.h
>> @@ -5,6 +5,10 @@
>>   #include <linux/types.h>
>>   #include <linux/ioctl.h>
>>   
>> +#ifdef __KERNEL__
>> +#include <linux/compat.h>
>> +#endif
>> +
>>   /*
>>    * f2fs-specific ioctl commands
>>    */
>> @@ -65,6 +69,16 @@ struct f2fs_gc_range {
>>   	__u64 len;
>>   };
>>   
>> +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
>> +struct compat_f2fs_gc_range {
>> +	u32 sync;
>> +	compat_u64 start;
>> +	compat_u64 len;
>> +};
>> +#define F2FS_IOC32_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,\
>> +						struct compat_f2fs_gc_range)
>> +#endif
>> +
>>   struct f2fs_defragment {
>>   	__u64 start;
>>   	__u64 len;
>> @@ -77,6 +91,17 @@ struct f2fs_move_range {
>>   	__u64 len;		/* size to move */
>>   };
>>   
>> +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
>> +struct compat_f2fs_move_range {
>> +	u32 dst_fd;
>> +	compat_u64 pos_in;
>> +	compat_u64 pos_out;
>> +	compat_u64 len;
>> +};
>> +#define F2FS_IOC32_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
>> +					struct compat_f2fs_move_range)
>> +#endif
>> +
>>   struct f2fs_flush_device {
>>   	__u32 dev_num;		/* device number to flush */
>>   	__u32 segments;		/* # of segments to flush */
>> -- 
> 
> Did you consider instead putting these compat definitions in an internal kernel
> header, or even just in the .c file, to avoid cluttering up the UAPI header?

Better.

I can move them before their use.

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
