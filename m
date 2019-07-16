Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C56A614
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jul 2019 12:02:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnKIA-000122-Ol; Tue, 16 Jul 2019 10:02:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hnKI8-00011U-VV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 10:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSUY5qRxni8VHmSKhxtavKVobNaqXM0nNcFnMM0ZEGc=; b=lS8njZ60QeNxYQhL4daK1A0hll
 UxsmKayFMnZbW5I1o1phYbmnTieSdlZixqpkG28I9ApNjtB1/Dyd95b5/uCsCYBEu4Kz2+E9Eo9nD
 ZL47aWDq2ygPQocHaCOftsdqMxuAhlsC3wyusxKb3hRQ5W6K3+CKftZ9Ul4j5d5WrJ9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSUY5qRxni8VHmSKhxtavKVobNaqXM0nNcFnMM0ZEGc=; b=T9eopngepXQE/Yxr0pzmgxM5i8
 xz+36eWfe1yBHi7YmznNsqkphV3aZHoPjAHptT8BcJhVMAv/AY3uygIkNgMQYVXFp9pezX9WTMsAz
 +9lGdZClw8xxTVYgcbWunsgMO1lD3SPQ+vqWQtke65oZG07sMHj+VMKlTxdaXS+f4ef8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnKI6-002we0-RF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 10:02:36 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C042B4E321EA8CF8BCE8;
 Tue, 16 Jul 2019 18:02:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 16 Jul
 2019 18:02:23 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190424094850.118323-1-yuchao0@huawei.com>
 <20190428133802.GB37346@jaegeuk-macbookpro.roam.corp.google.com>
 <373f4633-d331-5cf3-74b7-e982072bc4b4@kernel.org>
 <20190501032242.GA84420@jaegeuk-macbookpro.roam.corp.google.com>
 <3f170d86-e556-13ae-ce19-3bba3944f5fa@huawei.com>
 <192bae92-2193-570f-7b50-00334271bd2e@huawei.com>
Message-ID: <a16a0c1c-16c6-5fe8-bfc4-7cc0e0866c77@huawei.com>
Date: Tue, 16 Jul 2019 18:02:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <192bae92-2193-570f-7b50-00334271bd2e@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
X-Headers-End: 1hnKI6-002we0-RF
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity with enabled features
 in image
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2019/5/9 9:15, Chao Yu wrote:
> On 2019/5/5 10:51, Chao Yu wrote:
>> On 2019/5/1 11:22, Jaegeuk Kim wrote:
>>> On 04/29, Chao Yu wrote:
>>>> On 2019-4-28 21:38, Jaegeuk Kim wrote:
>>>>> On 04/24, Chao Yu wrote:
>>>>>> This patch fixes to do sanity with enabled features in image, if
>>>>>> there are features kernel can not recognize, just fail the mount.
>>>>>
>>>>> We need to figure out per-feature-based rejection, since some of them can
>>>>> be set without layout change.

What about adding one field in superblock for compatible features in future?

sb.feature(F2FS_FEATURE_LAST, max] stores uncompatible features
sb.compatible_feature stores compatible features

If we follow above rule when adding one feature, then, we can fail the mount if
sb.feature(F2FS_FEATURE_LAST, max] is valid.

Thanks,

>>>>
>>>> So any suggestion on how to implement this?
>>>
>>> Which features do we need to disallow? When we introduce new features, they
>>
>> I guess it should be the new features.
>>
>>> didn't hurt the previous flow by checking f2fs_sb_has_###().
>>
>> Yes, but new features may use new disk layout, if old kernel handled it with old
>> disk layout, there must be problematic.
>>
>> e.g. format image with -O extra_attr, and mount it with kernel who don't
>> recognize new inode layout.
> 
> Jaegeuk,
> 
> Any thoughts?
> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Maybe:
>>>>
>>>> if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 0))
>>>> 	check 4.14+ features
>>>> else if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0))
>>>> 	check 4.9+ features
>>>> else if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0))
>>>> 	check 4.4+ features
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>>> ---
>>>>>>  fs/f2fs/f2fs.h  | 13 +++++++++++++
>>>>>>  fs/f2fs/super.c |  9 +++++++++
>>>>>>  2 files changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>>> index f5ffc09705eb..15b640967e12 100644
>>>>>> --- a/fs/f2fs/f2fs.h
>>>>>> +++ b/fs/f2fs/f2fs.h
>>>>>> @@ -151,6 +151,19 @@ struct f2fs_mount_info {
>>>>>>  #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
>>>>>>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
>>>>>>  
>>>>>> +#define F2FS_ALL_FEATURES	(F2FS_FEATURE_ENCRYPT |			\
>>>>>> +				F2FS_FEATURE_BLKZONED |			\
>>>>>> +				F2FS_FEATURE_ATOMIC_WRITE |		\
>>>>>> +				F2FS_FEATURE_EXTRA_ATTR |		\
>>>>>> +				F2FS_FEATURE_PRJQUOTA |			\
>>>>>> +				F2FS_FEATURE_INODE_CHKSUM |		\
>>>>>> +				F2FS_FEATURE_FLEXIBLE_INLINE_XATTR |	\
>>>>>> +				F2FS_FEATURE_QUOTA_INO |		\
>>>>>> +				F2FS_FEATURE_INODE_CRTIME |		\
>>>>>> +				F2FS_FEATURE_LOST_FOUND |		\
>>>>>> +				F2FS_FEATURE_VERITY |			\
>>>>>> +				F2FS_FEATURE_SB_CHKSUM)
>>>>>> +
>>>>>>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>>>>>>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
>>>>>>  #define F2FS_HAS_FEATURE(sbi, mask)	__F2FS_HAS_FEATURE(sbi->raw_super, mask)
>>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>>>> index 4f8e9ab48b26..57f2fc6d14ba 100644
>>>>>> --- a/fs/f2fs/super.c
>>>>>> +++ b/fs/f2fs/super.c
>>>>>> @@ -2573,6 +2573,15 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>>>>>>  		return 1;
>>>>>>  	}
>>>>>>  
>>>>>> +	/* check whether kernel supports all features */
>>>>>> +	if (le32_to_cpu(raw_super->feature) & (~F2FS_ALL_FEATURES)) {
>>>>>> +		f2fs_msg(sb, KERN_INFO,
>>>>>> +			"Unsupported feature:%u: supported:%u",
>>>>>> +			le32_to_cpu(raw_super->feature),
>>>>>> +			F2FS_ALL_FEATURES);
>>>>>> +		return 1;
>>>>>> +	}
>>>>>> +
>>>>>>  	/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
>>>>>>  	if (sanity_check_area_boundary(sbi, bh))
>>>>>>  		return 1;
>>>>>> -- 
>>>>>> 2.18.0.rc1
>>> .
>>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>> .
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
