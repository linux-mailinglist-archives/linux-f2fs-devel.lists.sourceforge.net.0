Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE101F713D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 02:13:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjXKR-0001rZ-9k; Fri, 12 Jun 2020 00:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjXKQ-0001rS-69
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 00:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bo6aOWlg0XGStpr/5Q3GmSr0D+5zqxlBZ+pEFMhCgN0=; b=cs0IAw8mkURpBe1MEuZlJBE31G
 um+6nlHfjd2fjLIJF50w7rWOXysjuzz1mqilQdXr5qnRwIcIr7160hIvjRPTGDEif8MzI/l8UGWAK
 B4bk1GS5tWuCUJ4TocgKR+MFCGQ573mkFBkOE+TGbNl9pE4NHkt//u83+IHiiyPelQA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bo6aOWlg0XGStpr/5Q3GmSr0D+5zqxlBZ+pEFMhCgN0=; b=FuvYVMdaeZ83fSCtTtqUJP5akL
 MqFivt+tMQIQYbcx79pdOv6BC+JGE43q9fRN2xWddGRNh+6QcBL5S2S8AqVMGudlqw9Wr6szg25L5
 Ptf+WvzhJXL/l0u1kuB4c2biCXbGJBmVWjJFihHdSSj738Se5AYRccW4JMYJWZY1ZrPY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjXKP-00HBy6-1t
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 00:13:50 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3174D2078C;
 Fri, 12 Jun 2020 00:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591920816;
 bh=BHDLwQ4NKVsGm3dtY7FyF5hFRMR2IEXbr0Acsm+JZbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VLL7M/7RBgmclrzLSuEbOGMCOjmaXjUqh/wGQArH/Ct8UwxROcyuO6GQTsLcPKCo0
 86zWe5PlYIr0N9tA5P6U9WiAGQ2XO2N9v2ZlkCtP1cZlfVeS5QWLE46HZzfhHdw0Mf
 aBn5STit0Q6DQjRdofkX5CsHU8R3paLletU8uTkE=
Date: Thu, 11 Jun 2020 17:13:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200612001334.GB18185@gmail.com>
References: <20200611031652.200401-1-daeho43@gmail.com>
 <20200611162721.GB1152@sol.localdomain>
 <CACOAw_zKC24BhNOF2BpuRfuYzBEsis82MafU9HqXwLj2sZ3Azg@mail.gmail.com>
 <20200611230043.GA18185@gmail.com>
 <CACOAw_zZY4W9PYY4VAZ_5tGB5LxCEZKh6Sc523MRzVCvKNhinQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zZY4W9PYY4VAZ_5tGB5LxCEZKh6Sc523MRzVCvKNhinQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjXKP-00HBy6-1t
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 12, 2020 at 09:00:58AM +0900, Daeho Jeong wrote:
> For the incremental way of erasing, we might as well support the
> (offset, length) option in a unit of 4KiB.
> 
> So, you might use this ioctl like the below. Does it work for you?
> struct f2fs_sec_trim {
>         u64 startblk;
>         u64 blklen;
>         u32 flags;
> };
> 
> sectrim.startblk = 0;
> sectrim.blklen = 256;     // 1MiB
> sectrim.flags = F2FS_TRIM_FILE_DISCARD | F2FS_TRIM_FILE_ZEROOUT;
> ret = ioctl(fd, F2FS_SEC_TRIM_FILE, &sectrim);

Most filesystem ioctls and syscalls take offsets and lengths in bytes,
especially newer ones.  This way implementations of these APIs can support other
alignments later.  The implementation can still require alignment for now, i.e.
return -EINVAL if !IS_ALIGNED(arg.pos | arg.len, sb->s_blocksize).

Also, flags should be a u64, especially since it wouldn't actually increase the
size of the struct (due to padding).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
