Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43329A9E965
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Apr 2025 09:33:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9Izs-0007QY-46;
	Mon, 28 Apr 2025 07:33:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u9Izr-0007QS-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 07:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjhRY09vdUiecC+R13Z/payeZt/3zlxK4wQ2XnzOG+A=; b=i3iJrUhBIZ2XkfBZWFJDU7OrYs
 Of1u9VP2bH/8gCZgvRj//EjyM6m4Q0wNU6W58MQYv5h/DIJ3OH6hO6oK1HbeNVhFmRou9kS3V6SxK
 tnAgqbHX5cYjKBCAYEUMgNBWqugwkNiju6TS4iy2GT+DbGuSVBBQ1fkkkjOS9XuYekck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OjhRY09vdUiecC+R13Z/payeZt/3zlxK4wQ2XnzOG+A=; b=UqCtjVzeanY0HRBG3042B8LtE+
 yKH3rEVa3jh3ZFxE24pdsthfSsD+k59Lb5M1s9It5oV1HIuleQyVmyCc1jo4AAUdnK3ZGBmA4lDEj
 TGPyzxKFR6/sTWKPYfFppPZFk8G3LgFc+KFjkyBxuhhFQTRVRHDuQqqEYAKtwx6sCF3Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9Izb-0006Xc-EA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 07:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EABB7A49E49;
 Mon, 28 Apr 2025 07:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF83CC4CEE4;
 Mon, 28 Apr 2025 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745825600;
 bh=W9dL61VnqN2pdFMDJ/IhOK04Zlaq6SKvjWyBVQfUIxU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MJe7UhOTqkQxSiYZKl1zaa+iKFu7KS2dqvfaXcXdM3Frf5jU+/MczgrWmaoZ4GMuF
 Y4E73HGRmcxcd/pxi1uhtFMvXbYgW659OPG5G5fHMxD1JEh/CvKbXAa7VSPH5Guie1
 wPqImrbDyTK62LSk6/Ts5+i/jml8oKX5L5Ts9VJ8EPMdZlOQfRDUhGr5ZjWKV2s17m
 izZ+5dXXOYwMdp4baFab0pfLof5rooeLmjNBkjtxaQ90UmIxDsiWcSlTOgEHO8DZ48
 PgFNZvG+uAztiXczEhoW8N4RS7+t+cn0jK7UBTsS+2/XzhuinC++pqfGevm3CEWBzR
 9IDb3MRIV4tZQ==
Message-ID: <da5d8c00-4835-4635-a5f5-8610dd79a579@kernel.org>
Date: Mon, 28 Apr 2025 15:33:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nl6720 <devnull@nl6720.me>, linux-f2fs-devel@lists.sourceforge.net
References: <20250425013623.918150-1-devnull@nl6720.me>
 <c2f5bc82-3e8d-4ca8-9818-d90be8ce374f@kernel.org>
 <2375737.ElGaqSPkdT@nl6720.me>
Content-Language: en-US
In-Reply-To: <2375737.ElGaqSPkdT@nl6720.me>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/25 17:30, nl6720 wrote: > On Sunday, 27 April 2025
 11:45:59 EEST Chao Yu wrote: >> On 4/25/25 09:36, nl6720 via Linux-f2fs-devel
 wrote: >>> Some drives operate in "512e" configuration with the [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9Izb-0006Xc-EA
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: prefer physical over logical
 block size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/25 17:30, nl6720 wrote:
> On Sunday, 27 April 2025 11:45:59 EEST Chao Yu wrote:
>> On 4/25/25 09:36, nl6720 via Linux-f2fs-devel wrote:
>>> Some drives operate in "512e" configuration with their logical block
>>> size set to 512 bytes for legacy compatibility reasons while providing
>>> a more optimal 4096 byte value as the physical block size.
>>>
>>> Since the physical block size is the smallest unit a physical storage
>>> device can write atomically, prefer it over the logical block size.
>>>
>>> Closes: https://github.com/jaegeuk/f2fs-tools/issues/29
>>
>> f2fs uses PAGE_SIZE as block size, commonly it's 4096 rather than 512?
> 
> The thing mkfs.f2fs calls "sector size" in its output is 512 on 512e drives
> instead of 4096.

How about printing block size of f2fs as below:

output of mkfs.f2fs:

Info: sector size = 512
Info: total sectors = 16777216 (8192 MB)
Info: block size = 4096

Thanks,

> E.g.:
> 
>     F2FS-tools: mkfs.f2fs Ver: 1.16.0 (2023-04-11)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is enabled
> Info: [/dev/disk/by-partlabel/512e] Disk Model: QEMU HARDDISK   
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 124997632 (61034 MB)
> Info: zone aligned segment0 blkaddr: 512
> Info: format version with
>   "Linux version 6.13.8-arch1-1 (linux@archlinux) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Sun, 23 Mar 2025 17:17:30 +0000"
> Info: [/dev/disk/by-partlabel/512e] Discarding device
> Info: This device doesn't support BLKSECDISCARD
> Info: Discarded 61034 MB
> Info: Overprovision ratio = 0.590%
> Info: Overprovision segments = 179 (GC reserved = 176)
> Info: format successful
> 
> 
> nl6720
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
