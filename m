Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB878E82
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 16:57:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs75j-0006mL-7A; Mon, 29 Jul 2019 14:57:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hs75h-0006mE-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yEZE8bEaPiB9Jqx3KQV2KZ/CF5CgxFEkgK0zd1/C8ac=; b=KrZqW55p1MT0bH9oii4tIIfVZS
 q5DZIpqb82qmvUdTOmug2ZSU9oSxBxKn2TEkQHKHwm7azz/RejjwuisWlnJGK/Vd2sVdQjiRXrCWc
 Fn7mtY2Q7iw2FZ/oxaXuTd/hSwUPEQyZjIBIHxh8zsp6KHf5nfbEvd39uEse1HwIlyU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yEZE8bEaPiB9Jqx3KQV2KZ/CF5CgxFEkgK0zd1/C8ac=; b=PFYQYNQEKApH7a4sXdeQBibgyC
 lxAosCg1i/82Yb7xj+RRP1Av4KRgOGgauFcmOdm7v3NJKtKVLeDsslbCxEPJ8wCqAJFAvExx4LJh3
 DoN+22vrD2c37rdqrj5JSe/e0FU7+AobYbZY3mYahlLk4HtYtS5ftnuYZCL7qmVp3iCU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs75g-00EfRG-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 14:57:33 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7F582067D;
 Mon, 29 Jul 2019 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564412246;
 bh=hMANmngripBsLJYd0Y/7x4OoPirri23tE2oLpVKpNB4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fmIYCh1tQ7HGhaBzdlRtL2bHHiOLDhp8u5eyZg8qMCO41oty4t2dCIDuN3sxkRk7e
 C/M4SoQ+feASKNhouXi6y5RnqTyepKX4N1mk3kln5zowMv36DnEMloxEU4IpopLkGr
 BVSnI82o391mNn0iFzF+OuKAodyIiVWC47INjDH8=
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
 <9362e4ed-2be8-39f5-b4d9-9c86e37ab993@kernel.org>
 <20190729062735.GA98839@jaegeuk-macbookpro.roam.corp.google.com>
 <fa07a09d-92c9-4e0b-7c2b-e87771273dce@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <fe7066e9-f299-c675-cec3-919cdabe18ce@kernel.org>
Date: Mon, 29 Jul 2019 22:57:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fa07a09d-92c9-4e0b-7c2b-e87771273dce@huawei.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs75g-00EfRG-Ai
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-29 15:22, Chao Yu wrote:
> On 2019/7/29 14:27, Jaegeuk Kim wrote:
>> On 07/28, Chao Yu wrote:
>>> On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
>>>>  /* Flags that are appropriate for regular files (all but dir-specific ones). */
>>>>  #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL))
>>>
>>> We missed to add F2FS_CASEFOLD_FL here to exclude it in F2FS_REG_FLMASK.
>>
>> Applied.
>>
>>>
>>>> @@ -1660,7 +1660,16 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>>>  		return -EPERM;
>>>>  
>>>>  	oldflags = fi->i_flags;
>>>> +	if ((iflags ^ oldflags) & F2FS_CASEFOLD_FL) {
>>>> +		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>>>> +			return -EOPNOTSUPP;
>>>> +
>>>> +		if (!S_ISDIR(inode->i_mode))
>>>> +			return -ENOTDIR;
>>>>  
>>>> +		if (!f2fs_empty_dir(inode))
>>>> +			return -ENOTEMPTY;
>>>> +	}
>>
>> Modified like this:
>> @@ -1665,6 +1665,13 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>         if (IS_NOQUOTA(inode))
>>                 return -EPERM;
>>
>> +       if ((iflags ^ fi->i_flags) & F2FS_CASEFOLD_FL) {
>> +               if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>> +                       return -EOPNOTSUPP;
>> +               if (!f2fs_empty_dir(inode))
>> +                       return -ENOTEMPTY;
>> +       }
>> +
>>
>> Note that, directory is checked by above change.
>>
>> I've uploaded in f2fs.git, so could you check it out and test a bit?
> 
> I've checked it out, it looks good to me now, and later I will test this new
> version.
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

It can pass generic/556 as well.

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>> I applied the patches based on last Jaegeuk's dev branch, it seems we needs to
>>> adjust above code a bit. Otherwise it looks good to me.
>>>
>>> BTW, it looks the patchset works fine with generic/556 testcase.
>>>
>>> Thanks,
>> .
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
