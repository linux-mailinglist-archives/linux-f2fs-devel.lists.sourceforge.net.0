Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C4B18F37
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Aug 2025 17:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlD/hgmMSh2OKFg5/Y2D1CBQYYEreikkDehGxuhV4Y0=; b=biqjeu9SRjL0jUKOryJ8/3/rFo
	exvhIsFAs7ro+bVqW4ZOPmFLRZv8bSdunNnHPCziljf0krqBBdsHCrhQ4DBThg+YmWBAb8456XsRv
	gRGewlJi9CIzyYYQOznVZztsTy0R00cd5Z0UuCwLp07yTZcrzr3Ygvxu5ZtjOhM+gBUk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uiEGZ-0008SI-Pf;
	Sat, 02 Aug 2025 15:35:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1uiEGY-0008SC-8d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 15:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81Ijm86aL/7Eg8i2CREJKo2zaZRo19ClQ9+K+/XGJDY=; b=dFyFVNTWHbqMU1YThMAnceodBT
 YjzAVlVGLoVDNjg48D7GSIjikdhoWRequlyQv3MWKK00qoU+nqAdbtSCwX8qfhLDAQ1OyDYrnv/uz
 8HheUaJ81fN4tSEVIkhJ8WNrB/Q8qtJc7Z/7LkLhFmMh5cTVgT3uSqaT6L1kfRzGYtQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=81Ijm86aL/7Eg8i2CREJKo2zaZRo19ClQ9+K+/XGJDY=; b=ga/sH2wzVJrWEsSWEJQv/iOMO3
 pRpH6L9ULZiapYlco+uvqJ3Ky2kfCxBei+WA1T37I82Z2vvMf4FV9V9Nk92//QG3D3LFtmkauht0R
 d6yxL0e55skOHbya/rAjXRnsNJX1SnMKZkX6XBnaZPDkAF0fZcsrJu5A1GWv2u0ohqBY=;
Received: from mail-il1-f170.google.com ([209.85.166.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uiEGX-00038z-2W for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 15:35:21 +0000
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3e40d006105so11729905ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 Aug 2025 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1754148915; x=1754753715;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=81Ijm86aL/7Eg8i2CREJKo2zaZRo19ClQ9+K+/XGJDY=;
 b=bNqQXIOjpFu3Ng856MwGdIgQIeDSZaVf1hnmCT0f8oUwhmiH36KzAwTGrF0HwNjomi
 nHWtplT23WLOXhRvdPGkw+B4tkd+Tl2T4TE/46v5I9ng0BKKdTHgFLIz+7gbxVlaLUJN
 zMd3EjcD9ZFyKKKmJJJXgtre0xSAu9V5jiuWQ0favAeaZqxuMpV0DV3HIJp4a3J8FzVR
 pU3RTWNAo04XKVjk9IqwChv2aX54NqSqdQ/VxNGWlQiBf14w5mHpskPYBKgNEFuh5RTX
 a81dhuSwE7/fZWIdVSO3fM/cg1MbdA8t3IUt1WMOEAjH2J8kI+wgVixYnWBxbAippAJO
 O+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754148915; x=1754753715;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=81Ijm86aL/7Eg8i2CREJKo2zaZRo19ClQ9+K+/XGJDY=;
 b=By2zQZsbUOl0D6dk0oOS+U/3HuXxRpZdlH76TQYo8jDCNt2cGtkyt1B4duaEAt7pkR
 CDLvnTKl5pt3xoFxIQAoDGEj9L1KYAL6dTdrRDSnGRG9D6zFNVxmMUkNl+riAw9fdHiC
 3m1BxlDe5/8QAkL07kW5ZP9xJTVcE4otzMNYG3xtFsE6ALBgQOXoQLiUo7KFkcuQA4dz
 7qD9WQNtF0c/bDLyJfgKG4ML+wOlazFhwpqfQv4oufth297nAVaB/9c7gxRF/8PQ0ha2
 G0buBPTNuXabS+qL2Exhs7WTIOIYGiJln/ypXFw2ljfk/gpN0Oy4Wl0Y4fov9RswwnYN
 u5Cw==
X-Gm-Message-State: AOJu0YwJtet1b3S5arwYZVafDWpbo5fzuYR0Ef0T1t5TtinP6OoO8ahU
 2S3UEhY5zMNUCeqhdUq4q1LUxNcHuMmufSQXVbvXEQFWdFCgDVUElhNWOVADehaihfI=
X-Gm-Gg: ASbGnctPwLv0ljw3ganVqaG+o0Et8NXcpkPtN2WRRZVYWuKA16PIk9wZKzTCpVv+cl/
 s/XpFAuoQYX9HwUe9/8bm5CUjdKheQtriVGNzxoFEu+xUzG4hMoE0+z4NwndHcrjB0J0WBlmshH
 ZN2rAPxbyc6c7iOwJwrcBlk8a0RF4/pGrqd03X42zuW82jbsi/UVuLoTExPTTg3F/GINrIhm7x5
 yxgwWopaZax9WGZvKha490LU7pyxrQjhhaO9EZ2sox/pVJVVOrzwxHnb4DsiPYqb1Mk05UgeOHG
 fYd2NWGEKK4LQvOmLllaNAKZO6I20e7I/uS9Aq+lEq7PXrprYuQAXp1eIikwhWmTFMT2vmZnLYg
 +RkpP3SkKxEfO0iaQkBg=
X-Google-Smtp-Source: AGHT+IEzDMvKKG3HQnc6KQVfE3Sm8RA9MnEePBGjgtGWT3ISbraLvGrtT7nk5K+qI0TfYNvWTAxGAA==
X-Received: by 2002:a05:6e02:351e:b0:3e3:e4b2:8a5f with SMTP id
 e9e14a558f8ab-3e416116edamr65460525ab.8.1754148915061; 
 Sat, 02 Aug 2025 08:35:15 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e40297c7dbsm25068145ab.7.2025.08.02.08.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 08:35:14 -0700 (PDT)
Message-ID: <e163bbcd-b4d7-4a76-a42f-950f3cb5a644@kernel.dk>
Date: Sat, 2 Aug 2025 09:35:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, hanqi <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
 <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
 <e1a1dbfe-165f-4cb3-9d5b-8ac4ba61265e@vivo.com>
 <087f7937-20b5-4151-8a3f-5b6b2b045b41@kernel.org>
 <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
 <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
 <68c061ad-cbb7-44e8-a905-c13b9ec81c62@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <68c061ad-cbb7-44e8-a905-c13b9ec81c62@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/30/25 8:35 PM, Chao Yu wrote: > On 7/30/25 23:20, Jens
 Axboe wrote: >> On 7/28/25 2:28 AM, hanqi wrote: >>> ? 2025/7/28 16:07, Chao
 Yu ??: >>>> On 7/28/25 16:03, hanqi wrote: >>>>> ? 2025/7/28 15 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1uiEGX-00038z-2W
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/30/25 8:35 PM, Chao Yu wrote:
> On 7/30/25 23:20, Jens Axboe wrote:
>> On 7/28/25 2:28 AM, hanqi wrote:
>>> ? 2025/7/28 16:07, Chao Yu ??:
>>>> On 7/28/25 16:03, hanqi wrote:
>>>>> ? 2025/7/28 15:38, Chao Yu ??:
>>>>>
>>>>>> On 7/25/25 15:53, Qi Han wrote:
>>>>>>> Jens has already completed the development of uncached buffered I/O
>>>>>>> in git [1], and in f2fs, uncached buffered I/O read can be enabled
>>>>>>> simply by setting the FOP_DONTCACHE flag in f2fs_file_operations.
>>>>>> IIUC, we may suffer lock issue when we call pwritev(.. ,RWF_DONTCACHE)?
>>>>>> as Jen mentioned in below path, right?
>>>>>>
>>>>>> soft-irq
>>>>>> - folio_end_writeback()
>>>>>>    - filemap_end_dropbehind_write()
>>>>>>     - filemap_end_dropbehind()
>>>>>>      - folio_unmap_invalidate()
>>>>>>       - lock i_lock
>>>>>>
>>>>>> Thanks,
>>>>> That's how I understand it.
>>>> So I guess we need to wait for the support RWF_DONTCACHE on write path, unless
>>>> you can walk around for write path in this patch.
>>>>
>>>> Thanks,
>>>
>>> I think the read and write paths can be submitted separately.
>>> Currently, uncached buffered I/O write requires setting the
>>> FGP_DONTCACHE flag when the filesystem allocates a folio. In
>>> f2fs, this is done in the following path:
>>>
>>> - write_begin
>>>  - f2fs_write_begin
>>>   - __filemap_get_folio
>>>   As I understand it, if we don't set the FGP_DONTCACHE flag here, this
>>> issue shouldn't occur.
>>
>> It won't cause an issue, but it also won't work in the sense that the
>> intent is that if the file system doesn't support DONTCACHE, it would
>> get errored at submission time. Your approach would just ignore the flag
>> for writes, rather than return -EOPNOTSUPP as would be expected.
> 
> Jens,
> 
> Do you mean like what we have done in kiocb_set_rw_flags()?
> 
> 	if (flags & RWF_DONTCACHE) {
> 		/* file system must support it */
> 		if (!(ki->ki_filp->f_op->fop_flags & FOP_DONTCACHE))
> 			return -EOPNOTSUPP;
> ...
> 	}
> 
> IIUC, it's better to have this in original patch, let me know if I'm
> missing something.

Right, that would certainly be required to have it functional on the
read side but not yet on the write side. Still leaves a weirder gap
where other file systems (like XFS and ext4) you can rely on if read or
write support is there, then the other direction is supported too. f2fs
would be the only one where the read side works, but you get -EOPNOTSUPP
on the write side.

Unless there's a rush on the read side for some reason, I think it'd be
better to have with setting FOP_DONTCACHE until the write side has been
completed too.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
