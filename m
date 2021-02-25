Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569532527E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Feb 2021 16:36:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFIgi-0007Ns-Q6; Thu, 25 Feb 2021 15:36:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lFIgh-0007Nj-Jn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 15:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAy0/NtxpFAuV+j8XSiqRwf9HiN26lwhBks3mifqzDk=; b=Wmwk1Mdpq7MSdu2UzsXLUYDhvh
 od2uT6lGcEVJYLvGoqfMdUfJVrSV71/FlT3ZXWV/cOS4VtQILyhhIYYLXEkGqQTJoDvemfP4+dkSo
 GAwxQI3CJJeC7wGlVdlAsrvjGg/v8Md3tBOEC/hpCqdaaUQC4FDQzKvGqs98ExWILUJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAy0/NtxpFAuV+j8XSiqRwf9HiN26lwhBks3mifqzDk=; b=VCCSshUnzLjQXhB4nQNLD1t+zG
 cY7+qGN+73BrCpmYMT378nGwRWTeFRt4lAJhlT6X0Z5K7pYcGxiGgefVOrJRcpWbDwhlVa3ErW9Pu
 ZLhotaP86WXFOjHSI1R4QycXQ25CxGfUOUweF5f1vb0AafeiZ3e/PEesgt46kg6UMyuE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFIgT-0001sp-TU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 15:36:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A93B64F17;
 Thu, 25 Feb 2021 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614267359;
 bh=eSGwXNJ16uDoAe7/Kwp7tGMWfavbOODMXv/POEPwX8w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IXbfN7TN0zJ7DT0HtElF819u9ZAxI2E0dadux8ZpGEb/LYzpLhtrB6uYpxcGUgJ7K
 9+KlV40Qst9D1j+RP7TCr9mfZlfTrKNy/XN3dr2Q+Z2iWuLZ+XLEdt0sQm8yKHBphM
 1rgwCYv6mqCrL6AyclERXLIXDcCB2PtTS681mjS1hxBkPtWvER1VfFMURqZMoVXyhg
 IGAjgD+Bdyz/PGfkJXO9JvjD0teU1xCKP90arwMF85OF/xPJyHVf+rWWJAM3q9Xm+5
 6H/CWE2OEOemJEf9iGoc/ZORuIPYE1VS47Z8RHnp6gj7vUTCVlEOi8r/X2KCUY/As8
 CT/psA1XCLcCQ==
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20210224170327.237831-1-arnaud.ferraris@collabora.com>
 <4f3d7d52-a5bb-e219-229a-7fee728c025f@huawei.com>
 <7b62ee90-30e0-1840-9d87-673f72eb4355@collabora.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <5b0b94be-5b7a-8cd7-b64a-024977e822fa@kernel.org>
Date: Thu, 25 Feb 2021 23:35:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7b62ee90-30e0-1840-9d87-673f72eb4355@collabora.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lFIgT-0001sp-TU
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix new reserved segments
 calculation
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/25 17:18, Arnaud Ferraris wrote:
> Hi,
> =

> Le 25/02/2021 =E0 02:50, Chao Yu a =E9crit=A0:
>> On 2021/2/25 1:03, Arnaud Ferraris wrote:
>>> f8410857b7a81b1b347253fcca713d8b105e9e7b changed the way reserved
>>
>> Commit f8410857b7a8 ("f2fs-tools: zns zone-capacity support") changed ...
> =

> Will do.
> However, I didn't test that patch enough as it can corrupt large

Oops, I've no idea why this can happen after reviewing these codes..

Let me know you have any progress.

Thanks

> filesystems, I'll dig a bit deeper and post a v2 asap.
> =

> Thanks,
> Arnaud
> =

>>
>> Otherwise, it looks good to me.
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>> Thanks,
>>
>>> segments count was calculated in `mkfs`, but that wasn't reported back
>>> to `resize`, making it impossible to resize a filesystem in some cases.
>>>
>>> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
>>> ---
>>>  =A0 fsck/resize.c | 4 ++--
>>>  =A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fsck/resize.c b/fsck/resize.c
>>> index 46b1cfb..3ee05f7 100644
>>> --- a/fsck/resize.c
>>> +++ b/fsck/resize.c
>>> @@ -148,8 +148,8 @@ safe_resize:
>>>  =A0=A0=A0=A0=A0 /* Let's determine the best reserved and overprovision=
ed space */
>>>  =A0=A0=A0=A0=A0 c.new_overprovision =3D get_best_overprovision(sb);
>>>  =A0=A0=A0=A0=A0 c.new_reserved_segments =3D
>>> -=A0=A0=A0=A0=A0=A0=A0 (2 * (100 / c.new_overprovision + 1) + 6) *
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
get_sb(segs_per_sec);
>>> +=A0=A0=A0=A0=A0=A0=A0 (2 * (100 / c.new_overprovision + 1) + NR_CURSEG=
_TYPE) *
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 round_up(f2fs_get_usable_segments(sb=
),
>>> get_sb(section_count));
>>>  =A0 =A0=A0=A0=A0=A0 if ((get_sb(segment_count_main) - 2) < c.new_reser=
ved_segments ||
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 get_sb(segment_count_main) * blks_per_seg >
>>>
> =

> =

> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
