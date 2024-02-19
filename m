Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A1859AC1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 03:35:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbtVH-0007rA-5A;
	Mon, 19 Feb 2024 02:35:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbtVF-0007r3-Jl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 02:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wxC0O0qvESQgIxjfaDNV/E4NEenCEmYNLkQ5Dn9WlM=; b=DsM72aMs4v8A4yT6UlP3ZiskID
 jRFyLAz/2awNR7pyLkEP6wD9wxwUoZBZVRtjpJmEreFjMi43auD2UmDH4wbp4mntNqnggtRjIgFyS
 T2aV8r4C4Dt2FHXFe/Q4WezDrhuiyhlCCyoumeqQLQ/yfmRQsJ0YpJEyk3G0am7ywbVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8wxC0O0qvESQgIxjfaDNV/E4NEenCEmYNLkQ5Dn9WlM=; b=WsS/qVOf2LbBeBwlTSMM9+TOb6
 KhCzY1jEQn74EHnihhzBpkA3YPQcUGKBR54aqVm20HJNVy8msg2fdzWd+JsjXxypUkKy1wwMpgNUJ
 nnl8tEfS9jzHiSkiNqcp0wbdiTNf4FGzDUA1CdplaOt6sWOlwUpfE0lKJ1yWjv78WEtY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbtVC-0006Sn-JA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 02:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8FD61CE0E36;
 Mon, 19 Feb 2024 02:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2962C433F1;
 Mon, 19 Feb 2024 02:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708310118;
 bh=7vOsgnul1GxbRF0500oTwAAKvmXKzp4WUWTaSsUsX/s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ick1dClyqIco0cQcwmp2zXklGRJkUPdQ97kzOUHpc922pxfPbZkj5TQ9x8Sbetr1L
 dDAPm/j05sE89tZm59u5YAhad90hTb1aUnXwbQbzDz4+VhhIPwSFmWXhFVsSVc+0ul
 HPVAv1/kicGlE8bd1ydxSYHQn3sifhXsVHrn4UkJQj0KTBLnc3s8LKtl9hASIa9kv0
 T6mMtz34xwwp4gnQCP47pW5sieNrMbzMiPzJINsJl2aXgl0uxCG1UE8O3ggHeCP0RH
 3GEG4NG9/22PQ/gyUMxhGJOZRqsw72Jp2s2KaLA441uDoMhlq0g1wFlipahErJ+/EI
 OXo+v7/LByz6Q==
Message-ID: <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>
Date: Mon, 19 Feb 2024 10:35:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Salvatore Bonaccorso <carnil@debian.org>, Dhya <dhya@picorealm.net>,
 1063422@bugs.debian.org, Jaegeuk Kim <jaegeuk@kernel.org>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
 <ZcU3VCrt9VOpuFUq@eldamar.lan>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZcU3VCrt9VOpuFUq@eldamar.lan>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/9 4:19, Salvatore Bonaccorso wrote: > Hi Jaegeuk
 Kim, Chao Yu, > > In Debian the following regression was reported after a
 Dhya updated > to 6.1.76: > > On Wed, Feb 07, 2024 at 10:43:47PM -0 [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbtVC-0006Sn-JA
Subject: Re: [f2fs-dev] [regression 6.1.y] f2fs: invalid zstd compress
 level: 6
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
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/9 4:19, Salvatore Bonaccorso wrote:
> Hi Jaegeuk Kim, Chao Yu,
> 
> In Debian the following regression was reported after a Dhya updated
> to 6.1.76:
> 
> On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
>> Package: src:linux
>> Version: 6.1.76-1
>> Severity: critical
>> Justification: breaks the whole system
>>
>> Dear Maintainer,
>>
>> After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
>> fails to mount rw.  Message in the boot journal:
>>
>>    kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
>>
>> There was recently an f2fs patch to the 6.1 kernel tree which might be
>> related: https://www.spinics.net/lists/stable-commits/msg329957.html
>>
>> Was able to recover the system by doing:
>>
>> sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
>>
>> under the running bad 6.1.0-18-amd64 kernel, then editing
>> /etc/default/grub:
>>
>>    GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
>>
>> and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
>> kernel.
> 
> The issue is easily reproducible by:
> 
> # dd if=/dev/zero of=test.img count=100 bs=1M
> # mkfs.f2fs -f -O compression,extra_attr ./test.img
> # mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt
> 
> resulting in
> 
> [   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6

Hi Salvatore,

Can you please try below fixes:

[PATCH 6.1] f2fs: add helper to check compression level
https://lore.kernel.org/linux-f2fs-devel/20240212160530.1017205-1-chao@kernel.org

[PATCH] f2fs: compress: fix to check zstd compress level correctly in mount option
https://lore.kernel.org/linux-f2fs-devel/20240212160818.1020903-1-chao@kernel.org

Thanks,

> 
> A bugzilla report has been submitted in
> https://bugzilla.kernel.org/show_bug.cgi?id=218471
> 
> #regzbot introduced: v6.1.69..v6.1.76
> #regzbot link: https://bugs.debian.org/1063422
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218471
> 
> Regards,
> Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
