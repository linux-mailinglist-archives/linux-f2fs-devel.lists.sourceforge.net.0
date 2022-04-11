Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D844FB8A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 11:54:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ndqkG-0007V5-2l; Mon, 11 Apr 2022 09:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ndqkD-0007Uj-VX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 09:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0gFBQzsLD7TWyy7Jhgu5MKcgQWgf6yqeknlQekcRPdU=; b=iHpkOjWTnf7JBGf2zEbuM7VtwG
 8jCgo3JpCVdSHOFniM/RjK6/yQRFntslNJVrzvIdx9iHoonhdItQFiMwMA33vGqb2E6yJh5I90888
 HYnKsU2Y1hydSK64JgQSm2Xj4qt5V6ph2RFXmbzCIJK3SNIfjjr01z8KP1n3M7Q9OA5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0gFBQzsLD7TWyy7Jhgu5MKcgQWgf6yqeknlQekcRPdU=; b=mgMkQEcDPjRsO/IVLFMXaOoHNf
 m+yXerS0wSseAHhCHWNfb4jdMp46ZnbUuURSs7kFH5Xrx2NNJp4CFxqSAVwhA9pxymBjtGsXfLXrI
 7mNahz80ZvUDZvQ/6rxFLYTZGYH6nj47J5oQWRbXTUXam8BsJwZ27oXXKVnsbkJTjhEM=;
Received: from [145.40.73.55] (helo=sin.source.kernel.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ndqkA-00CcQ7-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 09:53:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D0E71CE16CA;
 Mon, 11 Apr 2022 09:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22668C385AA;
 Mon, 11 Apr 2022 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649670819;
 bh=lKIoE+fCrKnnFm+3QbNw32clo6tQo6WExWhfT9DKIPc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E9glXHmdjnSJGsaaNhsUd3ai286WN/l7Go/zk/ufh7o+jTun3W13zlsjZq4AM+hnX
 lx/ZTMLWGrJ73xGXmNeESe7KWHEhdrMC6zwcMUsfxCmFtKzLxbcUqnvg6ecBkFUfLi
 flQq39/uaEIIarJcJXMlzu9Xz29GHz52OMdl+s4FQd9e96zcAAH2dG4FKMMIInLrBn
 tyL8Jhs8QC6OT9YE3QCrwshvSDj//MociQ5v8LEd459du73AVopB55ulCFTfUzDuRX
 6e62qpz/O6oudwwIHDYtl4pVzn6PMNntcaI0DvB6tzYLx2NzFFqdns86DujXWbjuu0
 SktrikGrdeD/g==
Message-ID: <a25bac9c-188b-4ab4-21e2-d34e20c92524@kernel.org>
Date: Mon, 11 Apr 2022 17:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
 <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
 <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
 <CAD-N9QXM_xds692Lh-QZc5aL01uRivLGrNnxJys41hiTUfKE5w@mail.gmail.com>
 <2f5b7291-da06-0895-8e75-c7a37251b47e@kernel.org>
 <CAD-N9QX7wKN_x88w7p6t1KWeTGodeF-o0i-1d0Sq4Ja1OzPFoA@mail.gmail.com>
 <YlPHWaSlk21cc32p@sol.localdomain>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YlPHWaSlk21cc32p@sol.localdomain>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/11 14:14, Eric Biggers wrote: > On Mon, Apr 11,
 2022 at 01:06:09PM +0800, Dongliang Mu wrote: >> On Mon, Apr 11, 2022 at 11:10
 AM Chao Yu <chao@kernel.org> wrote: >>> >>> On 2022/4/9 14:42, [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ndqkA-00CcQ7-Fo
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: remove WARN_ON in
 f2fs_is_valid_blkaddr
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
Cc: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Dongliang Mu <dzm91@hust.edu.cn>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/11 14:14, Eric Biggers wrote:
> On Mon, Apr 11, 2022 at 01:06:09PM +0800, Dongliang Mu wrote:
>> On Mon, Apr 11, 2022 at 11:10 AM Chao Yu <chao@kernel.org> wrote:
>>>
>>> On 2022/4/9 14:42, Dongliang Mu wrote:
>>>> On Sat, Apr 9, 2022 at 11:46 AM Chao Yu <chao@kernel.org> wrote:
>>>>>
>>>>> On 2022/4/9 9:34, Dongliang Mu wrote:
>>>>>> On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
>>>>>>>
>>>>>>> On 2022/4/8 13:22, Dongliang Mu wrote:
>>>>>>>> From: Dongliang Mu <mudongliangabcd@gmail.com>
>>>>>>>>
>>>>>>>> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
>>>>>>>> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
>>>>>>>> blkaddr is in the range or not.
>>>>>>>
>>>>>>> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
>>>>>>> It means f2fs image may be broken, or there is a bug in f2fs.
>>>>>>>
>>>>>>> So, do you suffer any related issue in your environment?
>>>>>>
>>>>>> related issue? Can you explain a little?
>>>>>>
>>>>>> If you mean if this warning occurs, any other issues or crash
>>>>>
>>>>> I mean have you seen any warning info printed in the path of
>>>>> f2fs_is_valid_blkaddr() before applying this patch, and if so, w/ what
>>>>> reproducer? or you just figure out this patch from perspective of code
>>>>> review?
>>>>
>>>> Yes, I have seen both warning information from Syzbot [1] and my local
>>>> syzkaller instance.
>>>>
>>>> In f2fs_is_valid_blkaddr, if the following condition is satisfied,
>>>> i.e., blkaddr is not in the right range [2], it will directly invoke
>>>> one WARN_ON.
>>>>
>>>> if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>>>>                    blkaddr < MAIN_BLKADDR(sbi))) {
>>>>
>>>> This is the case on Syzbot.
>>>>
>>>> Otherwise, it will jump into __is_bitmap_valid. And if the following
>>>> condition is satisfied [3], it will trigger another WARN_ON.
>>>>
>>>> exist = f2fs_test_bit(offset, se->cur_valid_map);
>>>> if (!exist && type == DATA_GENERIC_ENHANCE) {
>>>>
>>>> This appears in my local syzbot instance, but unfortunately it does
>>>> not get any reproducer.
>>>
>>> Oh, it occurs in syzbot test, I guess it is possible that f2fs prints such
>>> warning info after blkaddr of node/data block was fuzzed to invalid one.
>>>
>>> I prefer to keep WARN_ON() to catch more info of bugs found by non-fuzzed
>>> type test.
>>>
>>> Thoughts?
>>
>> I am fine with both options. I can remove the WARN_ON in my local
>> syzkaller instance and continue fuzzing Linux kernel.
>>
>> +Dmitry Vyukov how do you think? If WARN_ON is kept, this crash will
>> occur on Syzbot from time to time.
> 
> WARN_ON is for kernel bugs; please refer to the documentation in
> include/asm-generic/bug.h.  If this is a kernel bug, then the kernel bug needs
> to be fixed.  Otherwise, the WARN_ON needs to be removed.

Alright, so how about using dump_stack() instead as suggested in doc?

Thanks,

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
