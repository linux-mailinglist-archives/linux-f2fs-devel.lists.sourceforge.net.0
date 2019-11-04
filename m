Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01674EDA15
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2019 08:45:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRX3D-0004si-HM; Mon, 04 Nov 2019 07:45:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRX3C-0004sa-9n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Nov 2019 07:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kQoTnKblkX2vsCxSXHfTtKlZVt7iC1cYQcDEAbo7rwQ=; b=UWhcIsjuvzEmQdOFrrZl4rt1nS
 V8BoFWgBHHCvbEkVR9ZEQXtiflGtm3DLjazxDU/z0qT4+JqT8mrKzcN3QBG94APoG0KDaIDgysYhC
 xK4tEAIoRSJhPFGVeLn5f7Wn/BOXE86uKtN+97dd0vHs2UnAQn6BlAhsaPml9cezsR6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kQoTnKblkX2vsCxSXHfTtKlZVt7iC1cYQcDEAbo7rwQ=; b=Ohf3c7m/no8hz1Pjm1ti5UuQbz
 2MMZF/g2uUxPNH04wQao2/M8FKy9xfrk8ZC6xgUrH6RGErOmgjKGsFDe33pHZ8QFeUkauP1nRK9bA
 QILMYwvTphe5Y1CJfKGnH2CzV+jOz4CJRkwSMwRBIvgkkUmK698H2m+RovFm7mc/K7XI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRX39-00GpQ8-F3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Nov 2019 07:45:22 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 20315F736714572F9D41;
 Mon,  4 Nov 2019 15:45:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019
 15:45:04 +0800
To: Doug Anderson <dianders@chromium.org>, Gwendal Grignou
 <gwendal@chromium.org>, Chao Yu <chao@kernel.org>, Ryo Hashimoto
 <hashimoto@chromium.org>, Vadim Sukhomlinov <sukhomlinov@google.com>,
 "Guenter Roeck" <groeck@chromium.org>, <apronin@chromium.org>,
 <linux-doc@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, LKML
 <linux-kernel@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 <linux-fscrypt@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <23f4c3f5-e738-7cd5-a293-14e556d1c6d6@huawei.com>
Date: Mon, 4 Nov 2019 15:45:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191030190226.GD693@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iRX39-00GpQ8-F3
Subject: Re: [f2fs-dev] [PATCH] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry to introduce such issue... :(

On 2019/10/31 3:02, Eric Biggers wrote:
> On Wed, Oct 30, 2019 at 10:51:20AM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Wed, Oct 30, 2019 at 10:38 AM Eric Biggers <ebiggers@kernel.org> wrote:
>>>
>>> Hi Douglas,
>>>
>>> On Wed, Oct 30, 2019 at 10:06:25AM -0700, Douglas Anderson wrote:
>>>> This reverts commit 0642ea2409f3 ("ext4 crypto: fix to check feature
>>>> status before get policy").
>>>>
>>>> The commit made a clear and documented ABI change that is not backward
>>>> compatible.  There exists userspace code [1] that relied on the old
>>>> behavior and is now broken.
>>>>
>>>> While we could entertain the idea of updating the userspace code to
>>>> handle the ABI change, it's my understanding that in general ABI
>>>> changes that break userspace are frowned upon (to put it nicely).
>>>>
>>>> NOTE: if we for some reason do decide to entertain the idea of
>>>> allowing the ABI change and updating userspace, I'd appreciate any
>>>> help on how we should make the change.  Specifically the old code
>>>> relied on the different return values to differentiate between
>>>> "KeyState::NO_KEY" and "KeyState::NOT_SUPPORTED".  I'm no expert on
>>>> the ext4 encryption APIs (I just ended up here tracking down the
>>>> regression [2]) so I'd need a bit of handholding from someone.
>>>>
>>>> [1] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/cryptohome/dircrypto_util.cc#73
>>>> [2] https://crbug.com/1018265
>>>>
>>>> Fixes: 0642ea2409f3 ("ext4 crypto: fix to check feature status before get policy")
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>>
>>>>  Documentation/filesystems/fscrypt.rst | 3 +--
>>>>  fs/ext4/ioctl.c                       | 2 --
>>>>  2 files changed, 1 insertion(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
>>>> index 8a0700af9596..4289c29d7c5a 100644
>>>> --- a/Documentation/filesystems/fscrypt.rst
>>>> +++ b/Documentation/filesystems/fscrypt.rst
>>>> @@ -562,8 +562,7 @@ FS_IOC_GET_ENCRYPTION_POLICY_EX can fail with the following errors:
>>>>    or this kernel is too old to support FS_IOC_GET_ENCRYPTION_POLICY_EX
>>>>    (try FS_IOC_GET_ENCRYPTION_POLICY instead)
>>>>  - ``EOPNOTSUPP``: the kernel was not configured with encryption
>>>> -  support for this filesystem, or the filesystem superblock has not
>>>> -  had encryption enabled on it
>>>> +  support for this filesystem
>>>>  - ``EOVERFLOW``: the file is encrypted and uses a recognized
>>>>    encryption policy version, but the policy struct does not fit into
>>>>    the provided buffer
>>>> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
>>>> index 0b7f316fd30f..13d97fb797b4 100644
>>>> --- a/fs/ext4/ioctl.c
>>>> +++ b/fs/ext4/ioctl.c
>>>> @@ -1181,8 +1181,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>>  #endif
>>>>       }
>>>>       case EXT4_IOC_GET_ENCRYPTION_POLICY:
>>>> -             if (!ext4_has_feature_encrypt(sb))
>>>> -                     return -EOPNOTSUPP;
>>>>               return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
>>>>
>>>
>>> Thanks for reporting this.  Can you elaborate on exactly why returning
>>> EOPNOTSUPP breaks things in the Chrome OS code?  Since encryption is indeed not
>>> supported, why isn't "KeyState::NOT_SUPPORTED" correct?
>>
>> I guess all I know is from the cryptohome source code I sent a link
>> to, which I'm not a super expert in.  Did you get a chance to take a
>> look at that?  As far as I can tell the code is doing something like
>> this:
>>
>> 1. If I see EOPNOTSUPP then this must be a kernel without ext4 crypto.
>> Fallback to using the old-style ecryptfs.
>>
>> 2. If I see ENODATA then this is a kernel with ext4 crypto but there's
>> no key yet.  We should set a key and (if necessarily) enable crypto on
>> the filesystem.
>>
>> 3. If I see no error then we're already good.
>>
>>> Note that the state after this revert will be:
>>>
>>> - FS_IOC_GET_ENCRYPTION_POLICY on ext4 => ENODATA
>>> - FS_IOC_GET_ENCRYPTION_POLICY on f2fs => EOPNOTSUPP
>>> - FS_IOC_GET_ENCRYPTION_POLICY_EX on ext4 => EOPNOTSUPP
>>> - FS_IOC_GET_ENCRYPTION_POLICY_EX on f2fs => EOPNOTSUPP
>>>
>>> So if this code change is made, the documentation would need to be updated to
>>> explain that the error code from FS_IOC_GET_ENCRYPTION_POLICY is
>>> filesystem-specific (which we'd really like to avoid...), and that
>>> FS_IOC_GET_ENCRYPTION_POLICY_EX handles this case differently.  Or else the
>>> other three would need to be changed to ENODATA -- which for
>>> FS_IOC_GET_ENCRYPTION_POLICY on f2fs would be an ABI break in its own right,
>>> though it's possible that no one would notice.
>>>
>>> Is your proposal to keep the error filesystem-specific for now?
>>
>> I guess I'd have to leave it up to the people who know this better.
>> Mostly I just saw this as an ABI change breaking userspace which to me
>> means revert.  I have very little background here to make good
>> decisions about the right way to move forward.
>>
> 
> Okay, that makes sense -- cryptohome assumes that ENODATA means the kernel
> supports encryption, even if the encrypt ext4 feature flag isn't set yet.
> 
> The way it's really supposed to work (IMO) is that all fscrypt ioctls
> consistently return EOPNOTSUPP if the feature is off, and then if userspace
> really needs to know if encryption can nevertheless still be enabled and used on
> the filesystem, it can check for the presence of
> /sys/fs/ext4/features/encryption (or /sys/fs/f2fs/features/encryption).  Or the
> feature flag can just be set by configuration before any of the fscrypt ioctls
> are attempted (this is what Android does).

How about adding above description into documentation as formal guide to check
whether ext4/f2fs can supports encryption feature, ubifs could be described
separatedly...

> 
> I guess we're stuck with the existing ext4 FS_IOC_GET_ENCRYPTION_POLICY behavior
> though, so we need to take this revert for 5.4.
> 
> For 5.5 I think we should try to make things slightly more sane by removing the
> same check from f2fs and fixing the documentation, so that at least each ioctl
> will behave consistently across filesystems and be correctly documented.
> 
> Ted, Jaegeuk, Chao, do you agree?

I saw we're trying to fix Chromium OS code first...

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
