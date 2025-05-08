Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0434AAF1B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 05:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FrrJmY7tUYf+e9Uq5dJ8qlbZQ7YUTlZqJ0evw0G8K4=; b=CyKOkY7VI4cCQ5CIAt40vQGEGs
	TcCh4E7wN2ajEL8a8YW58MHnJJK3+jGdE/vWj2APd4b7gdjUJy/UOCl+6eELvGSDUv8aPi1Xn9Bkg
	V6tOzrAP4LcD80P1RMy5IkLI9DseoD7/M4xJbcCtaCsE5/uVoIFrnmbHyHN5zIQYBU9A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCrxf-0005sB-0O;
	Thu, 08 May 2025 03:30:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCrxe-0005s4-CF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 03:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maAzcLDIJjc7pKdBS8uXe8ZzTMmkw+lob7ERxcHhBKQ=; b=lNvNQ6TK5whUP7xwma6lhCwaV1
 lppMuHxJAFdzhomNZYdw/bmjvcOmO8/pZiNBFtHmiG7Srpg5npc8kw1e4aRhFwDnGWit+d/VNOKod
 h8Mm9rTx6x5E3Y3LsoMOkxi+OdjMvPSq9MPtGTQSPCrXSujICEN/cOCsXoE3sZAo5lDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=maAzcLDIJjc7pKdBS8uXe8ZzTMmkw+lob7ERxcHhBKQ=; b=FYTWsTrOGoFovZq/IMZYaE/kBb
 RSEI4Q5kj3JEpd45eO4lBkbLksPBu5yX3IPui/pPHFQd6woAS4x837E/E55ZIpj9CjQHKmAGzJJZC
 mwTHRaICdWispksHe4hsPlJhR9IolNHDiIlAZQVefBeFJ2Or+HFgGssbm2lM01uSlY4U=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCrxd-0007Oy-MT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 03:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3AD4A4D726;
 Thu,  8 May 2025 03:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64331C4CEEB;
 Thu,  8 May 2025 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746675002;
 bh=ureZrEOffcX97F83itECAlb3mQ56ekqgCoH3GejuvNw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DW1mx9dDEERMx8jKuxTKpzZCGkNnnVIxWWX9PrTrzjC679mU6Ah4kBKYlb4qo2s8Z
 vwhFe6/XpvblnWma8D9oyQRMI6X0VbfaOs+rdddV6rV1HI1KcNF6HIk/O/46vHvTOL
 zQKYDBba0x/quavdXq/9sunjo9RWiqchSvD903kwOVrc9roA9Q/fgZ1skHMgKuJH+7
 /QSIyIgBErdmXwzX+e0XQhxJijXJAbSRQqJd3TaSEkEr37jv0BowsW7k5FukeZBq1t
 wFyD4/rQqXtMh3j3QQt5FTcw946dvu0PHav4sm3PQuoK9Aen2qs2An2l1rTuNbQKZO
 B2+y4Yb7bv+5g==
Message-ID: <9af8ef92-f219-4dcd-ac10-81d0f5a8ed06@kernel.org>
Date: Thu, 8 May 2025 11:29:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-3-sandeen@redhat.com>
 <2e354373-9f00-4499-8812-bcb7f00a6dbc@kernel.org>
 <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
 <aBt2CVnq8LnrbMzn@google.com>
Content-Language: en-US
In-Reply-To: <aBt2CVnq8LnrbMzn@google.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 23:02, Jaegeuk Kim wrote: > On 05/07, Eric Sandeen
 wrote: >> On 5/7/25 6:26 AM, Chao Yu wrote: >>> On 4/20/25 23:25, Eric Sandeen
 wrote: >>>> From: Hongbo Li <lihongbo22@huawei.com> >>>> >>> [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCrxd-0007Oy-MT
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: move the option parser into
 handle_mount_opt
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 23:02, Jaegeuk Kim wrote:
> On 05/07, Eric Sandeen wrote:
>> On 5/7/25 6:26 AM, Chao Yu wrote:
>>> On 4/20/25 23:25, Eric Sandeen wrote:
>>>> From: Hongbo Li <lihongbo22@huawei.com>
>>>>
>>>> In handle_mount_opt, we use fs_parameter to parse each option.
>>>> However we're still using the old API to get the options string.
>>>> Using fsparams parse_options allows us to remove many of the Opt_
>>>> enums, so remove them.
>>>>
>>>> The checkpoint disable cap (or percent) involves rather complex
>>>> parsing; we retain the old match_table mechanism for this, which
>>>> handles it well.
>>>>
>>>> There are some changes about parsing options:
>>>>   1. For `active_logs`, `inline_xattr_size` and `fault_injection`,
>>>>      we use s32 type according the internal structure to record the
>>>>      option's value.
>>>
>>> We'd better to use u32 type for these options, as they should never
>>> be negative.
>>>
>>> Can you please update based on below patch?
>>>
>>> https://lore.kernel.org/linux-f2fs-devel/20250507112425.939246-1-chao@kernel.org
>>
>> Hi Chao - I agree that that patch makes sense, but maybe there is a timing
>> issue now? At the moment, there is a mix of signed and unsigned handling
>> for these options. I agree that the conversion series probably should have
>> left the parsing type as unsigned, but it was a mix internally, so it was
>> difficult to know for sure.
>>
>> For your patch above, if it is to stand alone or be merged first, it 
>> should probably also change the current parsing to match_uint. (this would
>> also make it backportable to -stable kernels, if you want to).
>>
>> Otherwise, I would suggest that if it is merged after the mount API series,
>> then your patch to clean up internal types could fix the (new mount API)
>> parsing from %s to %u at the same time?
> 
> Yeah, agreed we'd better applying the type change later, once mount API is
> successfully landed. Chao, let's keep checking any missing cases. :)

Sure, let me check left patches today. :)

Thanks,

> 
>>
>> Happy to do it either way but your patch should probably be internally
>> consistent, changing the parsing types at the same time.
>>
>> (I suppose we could incorporate your patch into the mount API series too,
>> though it'd be a little strange to have a minor bugfix like this buried
>> in the series.)
>>
>> Thanks,
>> -Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
