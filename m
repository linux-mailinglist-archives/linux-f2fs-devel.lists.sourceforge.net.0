Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2069F3559
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 18:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSlDu-0004mK-3v; Thu, 07 Nov 2019 17:05:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iSlDs-0004m4-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 17:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tne8PMDiIZWtmOYA82KPlxR4zO/BxBO+JKWrPqf+6Ls=; b=aFCYCdhS09877HMWAHMhisnAjJ
 qHslv1VDNKfUvCgjjpLeN4bdpkfbwoxwQ6NVbx6gmv0slPZUKduHpYtkSbkRVmw++XiH7spWnpRGQ
 qX5aJLqr8Yp1uj14dnhp3UIqmg7/6RPpLqOx4xrurvzF0WbzxJXKn6BoRlQ1De92WgWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tne8PMDiIZWtmOYA82KPlxR4zO/BxBO+JKWrPqf+6Ls=; b=d0ZRH3wUIKqs5kRKpS24IN0VBl
 yDJZQUKuSsRG0RYj2YwpgsKAyigyg6EOMOavZMVb6321NL0VY552l9biCA1p5+YhhqHCctIfEq/mp
 D+x9gGiLnhH/csDqrANDevcf96+Sc5nUfuVBzK7zDdsmw92ojyJ6e4rytBWxeE6JuhEQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSlDq-003vCP-E2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 17:05:28 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A9CB2077C;
 Thu,  7 Nov 2019 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573146320;
 bh=suEeE7KwP1izl/rCD0Y/Vv5c6KOXHEIBOSklRCpzCec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lU/ax5EmmTN1jc10dY9Tf8BnVtFnHEzEc5WXGMVkVSD3rfRvqqAORta9ZCUybEOM8
 RdMd0YIVIpb1PKFeF8HpGQaXe9MvyC3wcxtIsVKzNxXswd8aMPFP5xrZrAamc2OpVU
 KR9sTRKkfurg2rEfeUwtb4/0KdFynvhppsgZP1TM=
Date: Thu, 7 Nov 2019 09:05:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191107170519.GA766@sol.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191107061205.120972-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107061205.120972-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSlDq-003vCP-E2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to update dir's i_pino during
 cross_rename
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 07, 2019 at 02:12:05PM +0800, Chao Yu wrote:
> As Eric reported:
> 
> RENAME_EXCHANGE support was just added to fsstress in xfstests:
> 
> 	commit 65dfd40a97b6bbbd2a22538977bab355c5bc0f06
> 	Author: kaixuxia <xiakaixu1987@gmail.com>
> 	Date:   Thu Oct 31 14:41:48 2019 +0800
> 
> 	    fsstress: add EXCHANGE renameat2 support
> 
> This is causing xfstest generic/579 to fail due to fsck.f2fs reporting errors.
> I'm not sure what the problem is, but it still happens even with all the
> fs-verity stuff in the test commented out, so that the test just runs fsstress.
> 
> generic/579 23s ... 	[10:02:25]
> [    7.745370] run fstests generic/579 at 2019-11-04 10:02:25
> _check_generic_filesystem: filesystem on /dev/vdc is inconsistent
> (see /results/f2fs/results-default/generic/579.full for details)
>  [10:02:47]
> Ran: generic/579
> Failures: generic/579
> Failed 1 of 1 tests
> Xunit report: /results/f2fs/results-default/result.xml
> 
> Here's the contents of 579.full:
> 
> _check_generic_filesystem: filesystem on /dev/vdc is inconsistent
> *** fsck.f2fs output ***
> [ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0xd10]
> 
> The root cause is that we forgot to update directory's i_pino during
> cross_rename, fix it.
> 
> Fixes: 32f9bc25cbda0 ("f2fs: support ->rename2()")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

Tested-by: Eric Biggers <ebiggers@kernel.org>

The i_pino field is only valid on directories, right?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
