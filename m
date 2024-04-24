Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FA8B09FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:47:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzc2I-0002q5-Kj;
	Wed, 24 Apr 2024 12:47:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvic9@mailbox.org>) id 1rzc2H-0002py-Cj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FPUo1FvMBQ/PSz8nag4boNDvRZ4UQ/1wYDDQjf2Si+k=; b=WR/Nb/0JP00cCAI2fj3ofkRXcp
 QsWtljF3JTaCPr58o07I1K1gJScvrwc5eJJ9inJm0avvpaDmz9kjtCsNPAqZIJTjRhS4oqxAym8st
 ZBJpFsbizrTleGz0sEYO1TlhO+lIzcAipw0H6M3MAtAL1Y5XNF4uLjQnahOZ380JUfZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FPUo1FvMBQ/PSz8nag4boNDvRZ4UQ/1wYDDQjf2Si+k=; b=YW9h9/Lz5GbR0xEa8i/vFvL1ko
 bIlZ6kcTH173fMiol3zrIny4rRXr+6DqpbibU4rrG//SOODq2iKMp83I98qUroyTj4oFulXko4RrX
 mVTk0h4C+GThQ5br4WckacTQDAS9n/UT2mOpcxBVw1omLfk1gSke05rL0UwLOkuLwDns=;
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzc2F-0003YG-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:47:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VPf040yQwz9sst;
 Wed, 24 Apr 2024 14:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1713962852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPUo1FvMBQ/PSz8nag4boNDvRZ4UQ/1wYDDQjf2Si+k=;
 b=Trx+qVw/+MJaxvc0dZ2VeiSI8XV7jWKEL5PwAR21vALS7kfTcPaZmdTiyPCXMWpwDODOh6
 Ws+KFiyfbGc3qyp/t938jwE14Yri6Mlt4X154ZrXmnKUlyoGRmGflaEcDLQsTwjnl/ZkD+
 tNgHKfY0WEBwivXf1srjpzyMKXiVTVfHU1p/zZyaHAnqRC22sL40uUPXpGrRouAj+5+7JD
 2ZKJjICsCYuse4dBFwtbOyFLBgpAFzoVOqs/jpKoiPrWZycQtArMmGOg5Q3w132gOxFg77
 Z0mytwwGrRioSj3I/AGudECQtre/Uq/yR6USFpC+7PrISiZupjCw71vM6y86CA==
Message-ID: <bda1c8b9-78a8-4232-b4a5-df3193355081@mailbox.org>
Date: Wed, 24 Apr 2024 14:47:30 +0200
MIME-Version: 1.0
Content-Language: en-US
To: guido iodice <guido.iodice@gmail.com>
References: <bug-218770-202145@https.bugzilla.kernel.org/>
 <bug-218770-202145-zsFZHchmJ1@https.bugzilla.kernel.org/>
 <ee866828-bb35-4ddd-9616-731f7b14a9ed@mailbox.org>
 <CAL0yVhy5zW1wUAsN1+the3UnkG0cy84B9nXEWUZDOVN=Q2+tDw@mail.gmail.com>
In-Reply-To: <CAL0yVhy5zW1wUAsN1+the3UnkG0cy84B9nXEWUZDOVN=Q2+tDw@mail.gmail.com>
X-MBO-RS-META: zqtoenn6mzjx5eyt5m133phjzweo3b1d
X-MBO-RS-ID: 47a8a1fb6c707cca1a9
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/24 14:42, guido iodice wrote: > Thank you. > > For
 clarity, can you confirm that this is a false alarm and in fact there > should
 be no corruption? I'm not a developer, but my computer runs just fine with
 this patch applied since a week or so. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mailbox.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [80.241.56.172 listed in list.dnswl.org]
X-Headers-End: 1rzc2F-0003YG-Uf
Subject: Re: [f2fs-dev] [Bug 218770] fsck seems unable to solve corruption
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
From: Tor Vic via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tor Vic <torvic9@mailbox.org>
Cc: aros@gmx.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 4/24/24 14:42, guido iodice wrote:
> Thank you.
> 
> For clarity, can you confirm that this is a false alarm and in fact there
> should be no corruption?

I'm not a developer, but my computer runs just fine with this patch 
applied since a week or so.

I didn't notice any data corruption or error messages in the log.

> 
> Best
> 
> ------------------------
> Guido Iodice
> 
> 
> 
> Il giorno mer 24 apr 2024 alle ore 14:40 Tor Vic <torvic9@mailbox.org> ha
> scritto:
> 
>>
>>
>> On 4/24/24 14:30, bugzilla-daemon@kernel.org wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=218770
>>>
>>> --- Comment #5 from Guido (guido.iodice@gmail.com) ---
>>> (In reply to Artem S. Tashkinov from comment #4)
>>>> On 4/24/24 12:21 PM, Tor Vic wrote:
>>>>>
>>>>> I can confirm the constant fsck issue, and it was fixed in my case by
>>>>> the following patch:
>>>>>
>>>>>
>>>>>
>>>>
>> https://lore.kernel.org/linux-f2fs-devel/20240409203411.1885121-3-jaegeuk@kernel.org/
>>>
>>> I have 6.9.rc5 (dated 2024-04-21 on kernel.org) Is that patch already
>> applied
>>> to it? If yes, it doesn't solve the bug.
>>>
>>
>> No, not applied yet.
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
