Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D3B16A4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 04:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/RolF5BOd9o00LC//OvItritcMylRY2g1eL7RAcFns=; b=hxylNXGRZSKUxJIKVyaWcwdwob
	WtAUjzQmIZyxPQXleV5PpZh4Huneon8Bn/NXs+KG06Idf/jhjZwvEJcpoUbnR8ibbahvXQLz+5a51
	AbuEpGdREZtzsdERVEHNKfdVo+hbIjSlD8h4X7QbUBKAUlM7dH+k13abUzO8HfsH8zZE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhIfx-0001Tb-9a;
	Thu, 31 Jul 2025 02:05:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1uhIfu-0001TU-OI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 02:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HoVI6Rgwek+KBblFywc0H+donkBr9IvZkTxUowyv/T0=; b=H9N5bBx/cp4Tfv+rBKJyKEgjSf
 gDXUgEyjmMNyhMLecEocVJUNLzNdGUbujnyg8CfyRjJCqV55xsuOWJuBPUkEzv8Spt53nayOAtLIw
 3B+gOan4pUg7AbiFSdd0qajhnSRu5KCTFddU27V0YTAw9VKmD3QV5LQua8JI/wXpwiC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HoVI6Rgwek+KBblFywc0H+donkBr9IvZkTxUowyv/T0=; b=gxXHuv2VGsgGNs8k7TYwWiTu+f
 tTdSaWyAMkj3wySHMGEWld7azQWDmwimexj+5Jy10KSWUpOXgOZLkTczY4DOfwPDhlfZ4c669i6Ei
 A/IBDnxMbKWnp664N54+AGHuMFg/QX2LXOpHCnv8yEAC90FDb3sFIAvBNCrq/6j6lYdk=;
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uhIft-0004sE-Fx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 02:05:42 +0000
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3e3ee9c7815so1557165ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 19:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1753927531; x=1754532331;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HoVI6Rgwek+KBblFywc0H+donkBr9IvZkTxUowyv/T0=;
 b=xIWyJVnwvtIpSw1Hnql+INaAwmYwvNHuhlXZt9JbZSDa4UJOOba3wMwQpWT94O0UM7
 M6sCdi4yZFePnajNgUqFgy/Cd0119SEs/rhC7uwDG2a4dBZ7s0ku3cQ1/ux1FYVcA6mJ
 BfaZ3kM2xhR7p0yVwsZ8QVz6d7s/DZtAP0tyEd2Qtvsy2MakOUxKTvVaKnejUQQdgEwj
 +D8tOEz6BdP2E4nNEUye1csB2jO9pKGUDh9fPg90keeqb8vXbtOHJLNrmbbD2ZnLuJjO
 klGksRAYHwob6ozem8Wu7jb2euYLX8EUbyrs+X4KxY7JLayyx0xZV3RMF/qHag+6PaRl
 lbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753927531; x=1754532331;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HoVI6Rgwek+KBblFywc0H+donkBr9IvZkTxUowyv/T0=;
 b=cKYBvdd4tsJhNr2IdGLHoJwoXiqaQiqIgolSHyIy5euqbbECU0ig3o5KsBWgmpF1Ob
 WULqZb29YcLjMIa2cmsvfgowNask+IBu0wia13dZqq34Cz+t25HHJb/1eVye3qzsvndp
 a83/jE2PSBRPl+moOJkA2vKdCEcbV1yHroyfPp6XK3cznc0N5gi2JyKxoBQ1Et2CTYkF
 195fEFvyoe7gqBbef5srayXRCaJXhJu6BWYAUXlFcqz66s0UCjWn26XPsnNSDGmS8nnd
 sbW0aLIU8V0VZNS0iehPRAIMmZnp5QtJvGHiCb9nt94FCutof6yiv/vwXOauvYklYAYT
 CpYg==
X-Gm-Message-State: AOJu0Yx1DjVIk/E+PMI5893LBxHkje4SgSqSEpzJcI4O5MlO0syCNVys
 BWFZFROQRnjKJpFCNdRVeW3d4G6krOyKusW2pW1hoGp9Ay79+MGXKdM/Tnq3WGyANVE=
X-Gm-Gg: ASbGncsEYn/93fWJvCi02laopoiBM7Kyq7MJvrAPAM0qtKywtqN8dlcpNhBzp03fsrt
 fXfQ6tK+SVQm5ZbbWzJKmQZmLAY9tO1tTVIqUU5sz7b3JWzaKUATWd63eu4k5UoE+KrUtQts1fX
 /c0mjaDe3KmgjLXRxtO/uXH7LjdjE4vuRPgcJ+p+Y6zc717SJouNqeAoHjQCXwZvwfYX27UQLbU
 vr/EH6iWcAmjEf5/N2SdocksC0sne6YYDxGc0FdUC5SQl3HVXtUyf5I5INrajabpys2lB71PzOA
 L4vxoIAyGlNXvqX7R55I0mujigEC9/Ro8Ejbb9tUEGPW6GaEjZKkcuvEjvK0V8ovcOvR6Co70Qp
 YLCowVJqX8yCZYPWOJmw=
X-Google-Smtp-Source: AGHT+IFn/Sv03hAbPEtfRtU4QUN2+r1XjoSgvD0vjCMXa7RbcZKdfRXMpo9ZrIkSWyRZyMbwOT6ndQ==
X-Received: by 2002:a05:6e02:378a:b0:3e3:d093:2069 with SMTP id
 e9e14a558f8ab-3e3f6252f8bmr94184705ab.12.1753927530580; 
 Wed, 30 Jul 2025 19:05:30 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e4029a2ad8sm2678215ab.15.2025.07.30.19.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 19:05:29 -0700 (PDT)
Message-ID: <0025981b-9acc-4b6c-a7bb-77bb0e3e543c@kernel.dk>
Date: Wed, 30 Jul 2025 20:05:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanqi <hanqi@vivo.com>, Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
 <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
 <e1a1dbfe-165f-4cb3-9d5b-8ac4ba61265e@vivo.com>
 <087f7937-20b5-4151-8a3f-5b6b2b045b41@kernel.org>
 <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
 <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
 <d3ced6d7-4037-4962-a2d4-382af0aad4cd@vivo.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <d3ced6d7-4037-4962-a2d4-382af0aad4cd@vivo.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/30/25 7:58 PM, hanqi wrote: > > ? 2025/7/30 23:20, Jens
 Axboe ??: >> On 7/28/25 2:28 AM, hanqi wrote: >>> ? 2025/7/28 16:07, Chao
 Yu ??: >>>> On 7/28/25 16:03, hanqi wrote: >>>>> ? 2025/7/28 15:3 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.182 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uhIft-0004sE-Fx
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

On 7/30/25 7:58 PM, hanqi wrote:
> 
> ? 2025/7/30 23:20, Jens Axboe ??:
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
>>>>>>     - filemap_end_dropbehind_write()
>>>>>>      - filemap_end_dropbehind()
>>>>>>       - folio_unmap_invalidate()
>>>>>>        - lock i_lock
>>>>>>
>>>>>> Thanks,
>>>>> That's how I understand it.
>>>> So I guess we need to wait for the support RWF_DONTCACHE on write path, unless
>>>> you can walk around for write path in this patch.
>>>>
>>>> Thanks,
>>> I think the read and write paths can be submitted separately.
>>> Currently, uncached buffered I/O write requires setting the
>>> FGP_DONTCACHE flag when the filesystem allocates a folio. In
>>> f2fs, this is done in the following path:
>>>
>>> - write_begin
>>>   - f2fs_write_begin
>>>    - __filemap_get_folio
>>>    As I understand it, if we don't set the FGP_DONTCACHE flag here, this
>>> issue shouldn't occur.
>> It won't cause an issue, but it also won't work in the sense that the
>> intent is that if the file system doesn't support DONTCACHE, it would
>> get errored at submission time. Your approach would just ignore the flag
>> for writes, rather than return -EOPNOTSUPP as would be expected.
>>
>> You could potentially make it work just on the read side by having the
>> f2fs write submit side check DONTCACHE on the write side and error them
>> out.
> 
> Hi Jens,
> 
> Thank you for your suggestions. I am currently working on modifying
> F2FS to handle the dontcache unmap operation in a workqueue. I expect
> to submit the patch soon, after which F2FS should also support uncached
> buffer I/O writes.

Sounds good, that's the right approach. Userspace needs to be able to
rely on the fact that if RWF_DONTCACHE io is submitted without error
that the target does the right thing as well, barring bugs of course.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
