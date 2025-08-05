Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43253B1AC19
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 03:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWvszR9zomnxMtX9JOc/zVT7aWLPOnUHaf8iGwtcScc=; b=EgX5couznDM5l0CvDnPzlmvXMO
	m54ndRoMUASpm6tW2W9BZGBw4HJoE/JB9WcaPQWf8hpC8ip8kElPyHmbvkdeIsiBGms4sm7cA1KhF
	B/NsrySL4ITSfsTSyYgBQJ1//bMg/xS13IqyDCjZlUBrddso1H7uj8BIHZoJaPSVlgSM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uj6XN-0001yF-Qm;
	Tue, 05 Aug 2025 01:32:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uj6XM-0001y7-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 01:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpyq/yZ7WccA8OJoEKii2RiFI98UoxPLRwr89gny8eo=; b=S69jMlrYyiMqSTSVha750V/qBz
 D70k1nyb4OMCoXcnpFna2nqOaEPK9WiOEzmZjGC2v++bHJ7MeAUhtZArckP/w/n+AIIb/ojwWdbYi
 1HHSKot9oRMCyyLJhCuakcacThGyXcv/O86eiv498eO/CZubO0wtjJWgFiztGwUp2UoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gpyq/yZ7WccA8OJoEKii2RiFI98UoxPLRwr89gny8eo=; b=XDBBRCyUvPXLS6LnPrlQMSIkt2
 VGYczX1gMuMgQUAEYUofT7zlcNlsvlBETBwmQYCbFUjtNW9MYzYX+b1SeV+hWjaGBmTq7veJ8Kih1
 HjedXBwdhZlOozYn+gmIia2o/B68DHFGxgiPn/n1gNKvDtNsp1Yket5Dz53j3dObM1bw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uj6XM-0004RG-3V for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 01:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6DCC7601E4;
 Tue,  5 Aug 2025 01:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E037DC4CEE7;
 Tue,  5 Aug 2025 01:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754357529;
 bh=FLM7uKtAbdnMkOUiRu41DomYtQ7x7+M3uhDurqbo8io=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Loh6LdQP6tbmD/tbw95uN0wCKkPpBYUHtOEMxHcRkSB+9JKpoCvlsly3q84O+skTC
 4r7DNlFDUbYNev8AWu+x65Jt1RXjxi87L2BFWbQAuFVuM0JjppDvbA0k1QjM6IimrS
 7VrxX0z/m79BhjjodIY7oSFc1BJA/GJ13mMG5147Vk9Lrqv9f2wcQROJymztxEPWYb
 vPM+i3BKDDwAE9Oo2p+wSFc8B5Q+GUmKHgxGzXgPku7+VP2M2gNQQWcQwkSvCS/ETE
 MWs33fJqY+oIYjEZ12+u1l46JrZjx/eWN8DDiWkKupe/FqzK11+DNYn3oNCr3If4hI
 E+KIgL59xDnaA==
Message-ID: <f8ab5bbf-79b0-42ac-9c61-d906593b5d8f@kernel.org>
Date: Tue, 5 Aug 2025 09:32:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, hanqi <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
 <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
 <e1a1dbfe-165f-4cb3-9d5b-8ac4ba61265e@vivo.com>
 <087f7937-20b5-4151-8a3f-5b6b2b045b41@kernel.org>
 <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
 <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
 <68c061ad-cbb7-44e8-a905-c13b9ec81c62@kernel.org>
 <e163bbcd-b4d7-4a76-a42f-950f3cb5a644@kernel.dk>
Content-Language: en-US
In-Reply-To: <e163bbcd-b4d7-4a76-a42f-950f3cb5a644@kernel.dk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/2/25 23:35, Jens Axboe wrote: > On 7/30/25 8:35 PM, Chao
 Yu wrote: >> On 7/30/25 23:20, Jens Axboe wrote: >>> On 7/28/25 2:28 AM,
 hanqi wrote: >>>> ? 2025/7/28 16:07, Chao Yu ??: >>>>> On 7/28/25 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uj6XM-0004RG-3V
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
 read
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/2/25 23:35, Jens Axboe wrote:
> On 7/30/25 8:35 PM, Chao Yu wrote:
>> On 7/30/25 23:20, Jens Axboe wrote:
>>> On 7/28/25 2:28 AM, hanqi wrote:
>>>> ? 2025/7/28 16:07, Chao Yu ??:
>>>>> On 7/28/25 16:03, hanqi wrote:
>>>>>> ? 2025/7/28 15:38, Chao Yu ??:
>>>>>>
>>>>>>> On 7/25/25 15:53, Qi Han wrote:
>>>>>>>> Jens has already completed the development of uncached buffered I/O
>>>>>>>> in git [1], and in f2fs, uncached buffered I/O read can be enabled
>>>>>>>> simply by setting the FOP_DONTCACHE flag in f2fs_file_operations.
>>>>>>> IIUC, we may suffer lock issue when we call pwritev(.. ,RWF_DONTCACHE)?
>>>>>>> as Jen mentioned in below path, right?
>>>>>>>
>>>>>>> soft-irq
>>>>>>> - folio_end_writeback()
>>>>>>>    - filemap_end_dropbehind_write()
>>>>>>>     - filemap_end_dropbehind()
>>>>>>>      - folio_unmap_invalidate()
>>>>>>>       - lock i_lock
>>>>>>>
>>>>>>> Thanks,
>>>>>> That's how I understand it.
>>>>> So I guess we need to wait for the support RWF_DONTCACHE on write path, unless
>>>>> you can walk around for write path in this patch.
>>>>>
>>>>> Thanks,
>>>>
>>>> I think the read and write paths can be submitted separately.
>>>> Currently, uncached buffered I/O write requires setting the
>>>> FGP_DONTCACHE flag when the filesystem allocates a folio. In
>>>> f2fs, this is done in the following path:
>>>>
>>>> - write_begin
>>>>  - f2fs_write_begin
>>>>   - __filemap_get_folio
>>>>   As I understand it, if we don't set the FGP_DONTCACHE flag here, this
>>>> issue shouldn't occur.
>>>
>>> It won't cause an issue, but it also won't work in the sense that the
>>> intent is that if the file system doesn't support DONTCACHE, it would
>>> get errored at submission time. Your approach would just ignore the flag
>>> for writes, rather than return -EOPNOTSUPP as would be expected.
>>
>> Jens,
>>
>> Do you mean like what we have done in kiocb_set_rw_flags()?
>>
>> 	if (flags & RWF_DONTCACHE) {
>> 		/* file system must support it */
>> 		if (!(ki->ki_filp->f_op->fop_flags & FOP_DONTCACHE))
>> 			return -EOPNOTSUPP;
>> ...
>> 	}
>>
>> IIUC, it's better to have this in original patch, let me know if I'm
>> missing something.
> 
> Right, that would certainly be required to have it functional on the
> read side but not yet on the write side. Still leaves a weirder gap
> where other file systems (like XFS and ext4) you can rely on if read or
> write support is there, then the other direction is supported too. f2fs
> would be the only one where the read side works, but you get -EOPNOTSUPP
> on the write side.
> 
> Unless there's a rush on the read side for some reason, I think it'd be
> better to have with setting FOP_DONTCACHE until the write side has been
> completed too.

Sure, let's wait for dontcache support in both read&write side, unless something
is blocked in write side, let's see. :)

Thanks,

> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
