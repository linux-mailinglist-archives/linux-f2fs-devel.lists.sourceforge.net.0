Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CF3C2BFB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 02:21:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m20k6-0001ej-25; Sat, 10 Jul 2021 00:21:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m20k3-0001dF-CU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccfY2UcBs23I48YiV2nR2xls6o93i64orEo5SbI9Ckc=; b=jxzW79ZnEi4gq48ohxT6r4xWTP
 AH0fhpDZvJXrWVSe2jD+/1D9xVESUap28e9cjqpLgjLhlBA0LkPSxr79Ks/ZHNnwbGSepQj3r1IEp
 Ts/I5GaBFRwsuo1PSL9ycCIIGADkZuPuJLeGqjT5h9F+EZIo33r/koo+xQHdSuJXdFfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccfY2UcBs23I48YiV2nR2xls6o93i64orEo5SbI9Ckc=; b=LfWQKKOS1K8Zz7Zk7V4UzYrHXX
 MrN5CLCfHhv2PcfhwCsDVXsMmhSFrMIu5vz95Otu2V2SowCMuDjLngeMeC5qUl4CBOoUHotBcLy5K
 UCmCWMDmKh2fBjMqS7saX+p6QMxvdr/bhUM/ZGHDuWlKuLiDuI2jot2gPmK+/s94DUOE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m20ju-002fIz-5h
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:21:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40915613C5;
 Sat, 10 Jul 2021 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625876456;
 bh=LKPXgnCEMArsn3uhtoWaLIbtaRf3oRvJgeLbVbfp5e4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=AWucYJ8k2v77ovGCSfJyraxzcsoHxs8YdHkZvRxGlP/DuOXsNsXOu8+G6qMqqE39T
 NX4mtRkgB0ZyfHaWfQyIdUyBnwJpxh8JHano8/5VME2oGJF4L0X3jLeKs1YBfZjnI8
 VSTFQRIEZ/+KTIxXbWVB+HdQtmPXL6B2fgc1XHCJgggcLJLphW7AxFy0fRdHQPY0J7
 qDv260Nde4PoB/Ge7UHJw1269z8uyFzERcntlpmUJ+TgvPUfxjA8B083n8JPLs7zuK
 suHG+GJklVjaRkBb09WQNoD+DLapvsmp75MMN6Z+R9++wASsus4oJRln7SOSxsU773
 G/+F8/Gqr+OXg==
To: 5kft <5kft@5kft.org>, linux-f2fs-devel@lists.sourceforge.net
References: <8e29f52b-6b0d-45ec-9520-e63eb254287a@www.fastmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e58973e4-778e-054d-67d9-44bbbc331e87@kernel.org>
Date: Sat, 10 Jul 2021 08:20:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8e29f52b-6b0d-45ec-9520-e63eb254287a@www.fastmail.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m20ju-002fIz-5h
Subject: Re: [f2fs-dev] f2fs compression level not actually set when using
 zstd compression?
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

Hello,

On 2021/7/10 0:52, 5kft wrote:
> It appears that the logic in "set_compress_context" (in https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/tree/fs/f2fs/f2fs.h, line 4021) does not actually set the compression level in the inode for zstd compression - it only sets it for lz4:
> 
>      if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 &&
>               F2FS_OPTION(sbi).compress_level)
>           F2FS_I(inode)->i_compress_flag |=
>                    F2FS_OPTION(sbi).compress_level <<
>                    COMPRESS_LEVEL_OFFSET;
> 
> Shouldn't this condition include "F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD" as part of the condition as well?

You're correct and it's a good catch, I've made a patch to fix this issue.

Thanks a lot for the report!

Thanks,

> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
