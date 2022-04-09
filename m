Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D834FA21A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 05:46:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nd23j-0004MN-4q; Sat, 09 Apr 2022 03:46:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nd23h-0004MG-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 03:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwUrIJEU98WEv61+EHwnggzRRFTPCUi5XxcGjNxx670=; b=MlRhaW9hBJN3s1cC1RFIINhU+W
 3jMjmrQOwS8GK4e56jqVjRl/EGkCegKYppKwwLF44VCvQzZk6krzWCNaQKnNhKPFkKtwcx0CO7eJC
 MMoIKIfaeV7EjNx8w3ofHMGeA2OOl6eSCTkYTYhoLHI8XdR2MZh8pZqm/om9VIRUiPfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IwUrIJEU98WEv61+EHwnggzRRFTPCUi5XxcGjNxx670=; b=VGl52pu2UvaYU9PnsIl2hi+4J3
 95u7qf1TN94SzRL7UGqjXRXe03maxvddGKGzK+9zkdYe1WXxARCu8Iec3fb3UvO1KxUnfQa/YpIeG
 oy3uTxi4DrHIfl23FSMNLwliUdsyPiixp/TbIWotxyJCE7gcUE+Xa9q2Xk4+hUFnpRL0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nd23g-00ANhH-TN
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 03:46:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 964EDB82E43;
 Sat,  9 Apr 2022 03:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF7DC385A4;
 Sat,  9 Apr 2022 03:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649475989;
 bh=Ayb5hOX+i0FYgvnXG3e1nz3NSgrfl8nSbqPlfEV1NhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TXNmTKxdaftbGYQMVbAiJH2mRxMbkP5glhSOccafVmsDCxPowFIweppa8qoKJOdez
 Ep4e3+dW4L5f+Xi9QhRTfg0zRymursmVLlBlPeQgfIzt23UyVO7hPzAoR1p/FK0+XD
 CnLAamE4Dxnr/Vz2kaQvKTKQAdeTejWzDBB36V9AhpbuJCPm870etSUggDWbJ+E8MG
 U7mB8HqhWrdCoK5uExhJL/Nk0REPEw0zPDWPSMmm9jC6QGnAq30QZIpHr5Nml6lYjr
 LcYFkOIEXoC1UtjFOhUto0fkP0M/bG+WgG/YJHRNrVflme49SrISGpOZ44nNn0C7m1
 /ti9U6AhhefuQ==
Message-ID: <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
Date: Sat, 9 Apr 2022 11:46:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Dongliang Mu <mudongliangabcd@gmail.com>
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
 <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/9 9:34, Dongliang Mu wrote: > On Sat, Apr 9, 2022
 at 8:27 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2022/4/8 13:22, Dongliang
 Mu wrote: >>> From: Dongliang Mu <mudongliangabcd@gmail.com> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nd23g-00ANhH-TN
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/9 9:34, Dongliang Mu wrote:
> On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2022/4/8 13:22, Dongliang Mu wrote:
>>> From: Dongliang Mu <mudongliangabcd@gmail.com>
>>>
>>> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
>>> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
>>> blkaddr is in the range or not.
>>
>> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
>> It means f2fs image may be broken, or there is a bug in f2fs.
>>
>> So, do you suffer any related issue in your environment?
> 
> related issue? Can you explain a little?
> 
> If you mean if this warning occurs, any other issues or crash

I mean have you seen any warning info printed in the path of
f2fs_is_valid_blkaddr() before applying this patch, and if so, w/ what
reproducer? or you just figure out this patch from perspective of code
review?

Thanks,

> behaviors are generated? I tested on the syzbot. After removing the
> WARN_ON, there is no abnormal issue or crash behaviors followed with
> the corresponding reproducer.
> 
> 
>>
>> Thanks,
>>
>>>
>>> Fix this by removing WARN_ON.
>>>
>>> Note that, syzbot patch testing does not incur any further issues
>>>
>>> Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>> ---
>>>    fs/f2fs/checkpoint.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index f5366feea82d..521498b2dd8c 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>>>                f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
>>>                         blkaddr, exist);
>>>                set_sbi_flag(sbi, SBI_NEED_FSCK);
>>> -             WARN_ON(1);
>>>        }
>>>        return exist;
>>>    }
>>> @@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>>                        f2fs_warn(sbi, "access invalid blkaddr:%u",
>>>                                  blkaddr);
>>>                        set_sbi_flag(sbi, SBI_NEED_FSCK);
>>> -                     WARN_ON(1);
>>>                        return false;
>>>                } else {
>>>                        return __is_bitmap_valid(sbi, blkaddr, type);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
