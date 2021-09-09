Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4440603C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 01:51:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOTp4-0003dw-4s; Thu, 09 Sep 2021 23:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mOTp3-0003dm-DF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xeYN+ZSzEiG6/fLNatOIqFXgBa99FJbQLnWYzAdUC3M=; b=Jd5Zp0J5O8drD9yOqToKOLS7nQ
 Iu/C5gymgyReL+uCtr33s/gNj3iXASfrC5Ok/RNNjLqR/uJ4Qk6HVeFWPEterShlJYzUWmZVQND7h
 jNccAw79b1RSU8KdnxZPODyuZJk5ctim/n0nQ0TRRg6OgAZrlK57MfmZou80NFCM7+zE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xeYN+ZSzEiG6/fLNatOIqFXgBa99FJbQLnWYzAdUC3M=; b=UPJRD2a5WolIsvUNwpC5Wtr410
 kXvCXAzdYWoDHXgLvq5265ndFuHtREBMLelGTzp1olBfaiwR26UczVwIxM56uNDnKUs/T4SlImf/e
 kDgLjJPoxtZUkCFPR91VsjVMhmyHMbw1JwT9juJZpn+PMoSdvz0qHCOYUR1GWwfYEFMA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOTp0-00030p-4B
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:51:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFE3961101;
 Thu,  9 Sep 2021 23:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631231458;
 bh=DQNK28TOeDI5KHJpmRRR0Z4mB4pizyslewVn/qlEKPo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QRrio1fzenwWgX6Chhm0F9E6aA/MLYtTo/Gf9lc2XRxuYjHai/9/11KSIM3Hdx7Z+
 7fQ/ZDn/4Wq9jYQVu4OUoOOv+sQ3c2VmXdgtz1u+RrTZ6sRuLP/8ZD0qC7WV14Dw3c
 XvbN6ZZddtTBir/x6x+ZSRsBuB5JIpM3T76vl6COdqCfX/UY102tPl+mBdkkJqI3Au
 +l59v3N4bp3SXEQED1e/z2g+VDyw1mTdeGa8Kc0YMTKxVJPJz2TI3WyTGCQFvQT2jx
 D/yVRXXT+sDctnL5HeZfIwPWWxYU/DjZVopU4Hj3Nj2mfSIlGQa0N3d8UNlUCtmJqZ
 M6ulAt/tmp71Q==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
 <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
 <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
 <CACOAw_yBYZzUVGV-A7K57zqrcAaZv7nFSk9mSj9AC6jTTeU7Vw@mail.gmail.com>
 <f64cb941-2bb7-eed2-732d-c9537f46f67c@kernel.org>
 <CACOAw_zxq=SX0OdXV77HyFytJc6aCMbYuS6KZAR_JoQeGZ26Sw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a59d23b9-961f-4129-7491-59f88923366a@kernel.org>
Date: Fri, 10 Sep 2021 07:50:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_zxq=SX0OdXV77HyFytJc6aCMbYuS6KZAR_JoQeGZ26Sw@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/8 2:12, Daeho Jeong wrote: > On Fri, Sep 3, 2021
 at 11:45 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2021/9/4 12:40, Daeho
 Jeong wrote: >>>> As a per curseg field. >>>> >>>>> Maybe, we run [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOTp0-00030p-4B
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/8 2:12, Daeho Jeong wrote:
> On Fri, Sep 3, 2021 at 11:45 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/9/4 12:40, Daeho Jeong wrote:
>>>> As a per curseg field.
>>>>
>>>>> Maybe, we run into the same race condition issue you told before for
>>>>> fragment_remained_chunk.
>>>>> Could you clarify this more?
>>>>
>>>> e.g.
>>>>
>>>> F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_FIXED_BLK
>>>> fragment_chunk_size = 384
>>>> fragment_hole_size = 384
>>>>
>>>> When creating hole:
>>>>
>>>> - f2fs_allocate_data_block
>>>>     - __refresh_next_blkoff
>>>>       chunk locates in [0, 383] of current segment
>>>>       seg->next_blkoff = 384
>>>>       sbi->fragment_remained_chunk = 0
>>>>       then we will reset sbi->fragment_remained_chunk to 384
>>>>       and move seg->next_blkoff forward to 768 (384 + 384)
>>>>     - __has_curseg_space() returns false
>>>>     - allocate_segment() allocates new current segment
>>>>
>>>> So, for such case that hole may cross two segments, hole size may be truncated
>>>> to left size of previous segment.
>>>
>>> First, sbi->fragment_remained_chunk should be seg->fragment_remained_chunk.
>>
>> Oh, correct.
>>
>>> I understand what you mean, so you mean we need to take the leftover
>>> "hole" size over to the next segment?
>>> In the example, the leftover hole size will be (384 - (512-384)). Do
>>> you want to take this over to the next segment?
>>
>> Yes, the left 256 block-sized hole should be created before next chunk
>> in next opened segment.
>>
> 
> Chao,
> 
> Do you have any decent idea to pass the left hole size to the next
> segment which will be allocated?

Daeho,

I guess we can record left hole size in seg->fragment_remained_hole.

Thanks,

> 
> Thanks,
> 
>> Thanks,
>>
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
