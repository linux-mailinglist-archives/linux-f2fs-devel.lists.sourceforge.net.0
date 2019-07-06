Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9D60E74
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 Jul 2019 03:39:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hjZfr-0000LX-LQ; Sat, 06 Jul 2019 01:39:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hjZfp-0000LG-O8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Jul 2019 01:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5jMscqfl8yYSr+/Xt9Y8KFRstVAvBgk95sAa5K9Pwc4=; b=KNc0u2YO62iEHbzPrtVL1DBkgR
 faL38O8eS4nviYpLzElnXpkxhbB5iWoPLLhlKxzx06NuhvO5PzSYHSenLg4VnihukmrxRLtkMJTFt
 f5IRpLRTsBXnhcnwx+SlbegfNLfpuPCdXP1wJ+TOOPVANKit5BMzZa9yll/7GltvTwdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5jMscqfl8yYSr+/Xt9Y8KFRstVAvBgk95sAa5K9Pwc4=; b=au8j40NamWSw+mhcgViiBcZFAM
 ws7XWyVE9+LIkg9cUsTWec9kP/ndHx84XdHjnSBiY/5OxCgIh1DJVbDz286Jz18RLagMYVQgBkzLB
 Xm1JVP1FRQA3eb0OXtNs/xATzhmvFKZRGnwgSqaG/OdmHPYWHeJVkobJsrtHULAPIVHw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjZg0-0094Wl-QE
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Jul 2019 01:39:46 +0000
Received: from [192.168.0.101] (unknown [49.65.245.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 933D920989;
 Sat,  6 Jul 2019 01:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562377179;
 bh=XUyu2LliqfvWrNRaLqY8ArVFro2iYCRJ4/FN4UK1kDk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pT1XnidAYY84kdyith8kBeXvQM4bD/RgzW3lcjcyXP9CNPAqLJFpu+mkJWLf6ucr7
 84uva7Q9iNLCZV9LWqVSpHUf9NUx8vx9cS60fgZETsYOlLM0FBSbb5szYR+l3aElzR
 dfMpcmJwOYD7Y+Kp41VKCHeaIfKcsLn8RPXs0NE8=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
 <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
 <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
 <20190603202719.GC34729@jaegeuk-macbookpro.roam.corp.google.com>
 <249aff47-cb24-291b-37f7-6ed2d854a207@huawei.com>
 <CAD14+f13+fKvo+-vOwu79O-mSwKS7r0g=gbVL65qv+MXPc+gZg@mail.gmail.com>
 <5c36de6c-fe75-e131-9f18-03e83fb5f439@huawei.com>
 <CAD14+f3Qen80fQJp2fbQW6eG7sEkBeUChYqFQmZ0gGguKW8E2w@mail.gmail.com>
 <dcdf83a0-6561-b0cd-c985-f0d59d8eba66@huawei.com>
 <20190705183152.GB57189@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <990f0732-9c6b-1525-32bd-6b4c16f3befe@kernel.org>
Date: Sat, 6 Jul 2019 09:39:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190705183152.GB57189@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hjZg0-0094Wl-QE
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-6 2:31, Jaegeuk Kim wrote:
> Hi guys,
> 
> On 07/01, Chao Yu wrote:
>> Ping, Jaegeuk,
>>
>> On 2019/7/1 14:23, Ju Hyung Park wrote:
>>> One more bump.
>>>
>>> afaik, there's only about a week left.
>>>
>>> Thanks.
>>>
>>> On Thu, Jun 27, 2019 at 7:20 PM Chao Yu <yuchao0@huawei.com> wrote:
>>>>
>>>> Hi Ju Hyung,
>>>>
>>>> Thanks for the reminding.
>>>>
>>>> Jaegeuk, I can send the kernel patch after you tag a new version on fsck.
> 
> You can use 1.13.0.

Jaegeuk, thanks, let me use that. ;)

Thanks,

> 
> Thanks,
> 
>>>>
>>>> Thanks,
>>>>
>>>> On 2019/6/27 17:12, Ju Hyung Park wrote:
>>>>> Hi Jaegeuk and Chao.
>>>>>
>>>>> A little bump here.
>>>>>
>>>>> We still need to tag a new version of fsck and update f2fs kernel code
>>>>> to tell which version users should use as we discussed earlier.
>>>>> -rc is closing soon, so I felt I needed to remind you.
>>>>>
>>>>> Thanks.
>>>>>
>>>>> On Tue, Jun 4, 2019 at 10:48 AM Chao Yu <yuchao0@huawei.com> wrote:
>>>>>>
>>>>>> On 2019/6/4 4:27, Jaegeuk Kim wrote:
>>>>>>> On 06/04, Ju Hyung Park wrote:
>>>>>>>> Hi Jaegeuk and Chao,
>>>>>>>>
>>>>>>>> A little update I thought I might share.
>>>>>>>>
>>>>>>>> Just went through migrating my laptop to another SSD and I've setup
>>>>>>>> f2fs from the beginning with mkfs -i from the master branch.
>>>>>>>> No issue as of yet and the kernel is working fine as expected :)
>>>>>>>
>>>>>>> Cool, thanks for your test. :)
>>>>>>
>>>>>> Great, thanks for the continuous test and report. :)
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks.
>>>>>>>>
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> Linux-f2fs-devel mailing list
>>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Linux-f2fs-devel mailing list
>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>>> .
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
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
