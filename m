Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28948414CF5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 17:26:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mT48J-0006kI-RB; Wed, 22 Sep 2021 15:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mT48I-0006jx-0l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 15:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=643XYUk+4GmJ+hgrRbrNHJ/wFvOth0yNQkyYPYFvFjQ=; b=ccJGwOj5VHSb6thnjGHj16daWV
 LvbrkJMfndv7pSzYrBPw0tSF3GfKzeASwYz9CxNL4xardUs+bp8YdJir/u12sqcUT094RWpKm79+m
 FR7ZvFQ/RoyQCwuVVj4G1aFulcIZVjLVp9vFLiFi25uGYtPDRJuUwqbWzkHr0elhUUDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=643XYUk+4GmJ+hgrRbrNHJ/wFvOth0yNQkyYPYFvFjQ=; b=m23/+U19zFd8OMMHtBTMATNxMs
 fFgVjk6kTl4FrGT6UskeOar61zUWb8umcpZ2kEv0pHRNVZ0cVz6ibj9aIJaBCyHlA4uEwNHNNSLJY
 JX/chMhCx9hW25URhVH3hIX+t94Ir6aTyPFvYHXNk6NHNAbrSgPIdTbpHhjA1r2l68ZY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mT48H-0005ua-BG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 15:26:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3284B611CA;
 Wed, 22 Sep 2021 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632324355;
 bh=ICqKJc+kk8BlMJXdh3Zkfdz5Bz7EAkkCjVEYCiyjSNY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=poThRCwGF+DIQFATQaqDCzKZSil2xK3SjJ5q+fNnLH0voEx/TwDFNHVcsKBtZoCpP
 25e6UpBcZY7q2N9JyqVVaGN71j/eBWkjKzMzuo+w/HqqOt4JUjz4a2pIVtB8AesAFj
 wVFAthcp1jat4BD2M6VlCb5GAL+Xu1fsvxT7SbvQGpDmeo7siWus4oEgV+9np8uFg4
 zRVatwNXAf9IOGaOnrmT/wKVbMDn3+CDAjhahl8qxvYmQEqoRapQimKifmf/+cPx2U
 My/0mnIPr3utjIYGHD2LnbbWOdUoxGLXJCLbFHRESGx7kEzqznsKMiDOWz+N03Lb08
 58Mc5iaoifxcg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20210910225618.501839-1-jaegeuk@kernel.org>
 <YUkYpkKOvtBCgOCs@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e66e2d57-957b-d3ca-6038-39ebd7395660@kernel.org>
Date: Wed, 22 Sep 2021 23:25:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUkYpkKOvtBCgOCs@google.com>
Content-Language: en-US
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/21 7:26, Jaegeuk Kim wrote: > This patch fixes the
 below stale magic info. > > $ mkfs.btrfs -f test.img > btrfs-progs v5.10.1
 > See http://btrfs.wiki.kernel.org for more information. > > Lab [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mT48H-0005ua-BG
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: wipe other FS magics given -f
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/21 7:26, Jaegeuk Kim wrote:
> This patch fixes the below stale magic info.
> 
> $ mkfs.btrfs -f test.img
> btrfs-progs v5.10.1
> See http://btrfs.wiki.kernel.org for more information.
> 
> Label:              (null)
> UUID:               941d2db7-3ece-4090-8b22-c4ea548b5dae
> Node size:          16384
> Sector size:        4096
> Filesystem size:    1.00GiB
> Block group profiles:
>    Data:             single            8.00MiB
>    Metadata:         DUP              51.19MiB
>    System:           DUP               8.00MiB
> SSD detected:       no
> Incompat features:  extref, skinny-metadata
> Runtime features:
> Checksum:           crc32c
> Number of devices:  1
> Devices:
>     ID        SIZE  PATH
>      1     1.00GiB  test.img
> 
> $ hexdump -s 0x10000 -n 128 -C test.img
> 00010000  81 29 94 0a 00 00 00 00  00 00 00 00 00 00 00 00  |.)..............|
> 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010020  94 1d 2d b7 3e ce 40 90  8b 22 c4 ea 54 8b 5d ae  |..-.>.@.."..T.].|
> 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> 00010080
> 
> $ mkfs.f2fs -t 0 -f test.img
> 
> 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is disabled
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 2097152 (1024 MB)
> Info: zone aligned segment0 blkaddr: 512
> Info: format version with
>    "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> Info: Overprovision ratio = 6.360%
> Info: Overprovision segments = 68 (GC reserved = 39)
> Info: format successful
> 
> $hexdump -s 0x10000 -n 128 -C test.img
> 00010000  c2 8a c8 26 00 00 00 00  00 00 00 00 00 00 00 00  |...&............|
> 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010020  92 ab 3f c6 b7 82 49 5e  93 23 e8 c9 e9 45 7d ac  |..?...I^.#...E}.|
> 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> 00010080
> 
> --- After this patch ---
> $ mkfs.f2fs -t 0 -f test.img
> 
> 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is disabled
> 	test.img appears to contain an existing filesystem (btrfs).
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 2097152 (1024 MB)
> Info: zone aligned segment0 blkaddr: 512
> Info: format version with
>    "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> Info: Overprovision ratio = 6.360%
> Info: Overprovision segments = 68 (GC reserved = 39)
> Info: format successful
> 
> $ hexdump -s 0x10000 -n 128 -C test.img
> 00010000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00010080
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
