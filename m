Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26E85B0EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 03:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcG2V-0006XP-8B;
	Tue, 20 Feb 2024 02:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcG2T-0006XH-Vt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 02:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5cNhZf9+5HIRdSwmxnleQcvvOZDA+zEDzgb1gu/q254=; b=F9PQg/8cNcUkAIoDrG6dMdDzP+
 fJreXAeJGhb5Pu4MujhI3xYdSnVefJoquKvRLMn6QEOcT5Du50yDaZSVfktVOTbq91dy4GwXb+170
 CRZJSFrIHIzIKBdSVdhbSWETTpflWi9OQpmk8sx/3hT6Co9bcC6ZaTG3YFCMtLNOSEDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5cNhZf9+5HIRdSwmxnleQcvvOZDA+zEDzgb1gu/q254=; b=Ndq9Ly/sAbmUUhPhUqRmRWEGok
 kAY5IaGebW+mj9nEMD3/7JvvAqvd0zHFSXw8F7kHFPNgHlo0Jul2RIH7LMhBHYnm2TtHjlY+PoUBZ
 2AcGsQbyjlA6zDBanRq/QW+apJ60GxVCW2Dr1YLyqX10DTT1dZBFw9cJPYL8UPDhFjXA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcG2S-0004nH-7w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 02:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7451CCE13C3;
 Tue, 20 Feb 2024 02:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C98C433F1;
 Tue, 20 Feb 2024 02:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708396748;
 bh=IMwzauYZetrMijGUdyA3fsIO45z89hM65VuA1iwSV/s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YB6NFOq76aBrk1UjP07/9OTebNduLf+HeewS19UjQ16nt8QoxeiQhyW8vrJMGwxDN
 wF4BoSSpTb1418jqu29RqMJACKjPDmd045ibXmEppdhRjcR0GiZ/UJUrROONjoJV+8
 UAuTHquJ9kkq+/FAuuLjcip0UOTGfHqC/4GPhCOTar28LXFqX+c4NgGD0sngUkUNPW
 tLA1+XwXHVMASPoJRiva6tIBUDDHTdEPYn0GntilA8MdJBhrtng/WvMpGi6jyTZYVg
 fsp+y4gjM3PA9Xgh55LBrGmLVRAILHITbuQx/x/XkJDj/JlO4mRGwLGitqnStBCDR8
 Vb3EOsri+ab7w==
Message-ID: <2247088a-aed0-4120-93a5-cf52a829db26@kernel.org>
Date: Tue, 20 Feb 2024 10:39:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Salvatore Bonaccorso <carnil@debian.org>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
 <ZcU3VCrt9VOpuFUq@eldamar.lan>
 <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>
 <ZdOx73kckFXADcol@eldamar.lan>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZdOx73kckFXADcol@eldamar.lan>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/20 3:54, Salvatore Bonaccorso wrote: > Hi, > > On
 Mon, Feb 19, 2024 at 10:35:13AM +0800, Chao Yu wrote: >> On 2024/2/9 4:19,
 Salvatore Bonaccorso wrote: >>> Hi Jaegeuk Kim, Chao Yu, >>> >>> [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcG2S-0004nH-7w
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
Cc: regressions@lists.linux.dev, 1063422@bugs.debian.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Dhya <dhya@picorealm.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/20 3:54, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Mon, Feb 19, 2024 at 10:35:13AM +0800, Chao Yu wrote:
>> On 2024/2/9 4:19, Salvatore Bonaccorso wrote:
>>> Hi Jaegeuk Kim, Chao Yu,
>>>
>>> In Debian the following regression was reported after a Dhya updated
>>> to 6.1.76:
>>>
>>> On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
>>>> Package: src:linux
>>>> Version: 6.1.76-1
>>>> Severity: critical
>>>> Justification: breaks the whole system
>>>>
>>>> Dear Maintainer,
>>>>
>>>> After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
>>>> fails to mount rw.  Message in the boot journal:
>>>>
>>>>     kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
>>>>
>>>> There was recently an f2fs patch to the 6.1 kernel tree which might be
>>>> related: https://www.spinics.net/lists/stable-commits/msg329957.html
>>>>
>>>> Was able to recover the system by doing:
>>>>
>>>> sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
>>>>
>>>> under the running bad 6.1.0-18-amd64 kernel, then editing
>>>> /etc/default/grub:
>>>>
>>>>     GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
>>>>
>>>> and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
>>>> kernel.
>>>
>>> The issue is easily reproducible by:
>>>
>>> # dd if=/dev/zero of=test.img count=100 bs=1M
>>> # mkfs.f2fs -f -O compression,extra_attr ./test.img
>>> # mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt
>>>
>>> resulting in
>>>
>>> [   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6
>>
>> Hi Salvatore,
>>
>> Can you please try below fixes:
>>
>> [PATCH 6.1] f2fs: add helper to check compression level
>> https://lore.kernel.org/linux-f2fs-devel/20240212160530.1017205-1-chao@kernel.org
> 
> Confirmed that this fixes the reported issue as it was reported to us
> in Debian in https://bugs.debian.org/1063422 . Thanks a lot!
> (note just tested with the first commit as it landed in 6.1.78 to
> confirm the immediate regression).
> 
> #regzbot fixed-by: cf3d57ad6ff8b566deba3544b9ad3384781fb604

Hi,

Thank you for confirmation.

Thanks,

> 
> Regards,
> Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
