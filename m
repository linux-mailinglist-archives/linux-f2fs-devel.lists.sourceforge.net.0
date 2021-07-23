Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8A3D418C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 22:30:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m71nz-00080Z-D9; Fri, 23 Jul 2021 20:29:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m71ny-00080P-8f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 20:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zEEniHcJmZMvPXsIsXSQn0Agh2JI0hfJi4sADQmg5F4=; b=IQn3CQK4zvO+r679+HZnrVkxaZ
 i5Yav+ffOxgsjpgBdixmfy2lyKq6yVK5J2lf4pPE1tAIWZlnxrnetFmS7b4BfFArNtujR4VAJcc3V
 pHjmbk/otdbgfkcu4H1FwwmtTrCeaeVP5ErGojRCQ0vHbrDCOz2GfN7Zs7SLKnwKrr44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zEEniHcJmZMvPXsIsXSQn0Agh2JI0hfJi4sADQmg5F4=; b=VFDw54/nEe/tazre76I/jk0bZv
 oxmOF6eFHqiMol6cb6HglBpFm1uJOHHmlaKwYGOLoAQYHJSfIeNbetolFO9Z2BkqtK5DB8D4WHuYW
 8T4r6raXfDjMfKMFpQaolii/smrZp2SaN4vLG1L+uGECzrs0dtT/p/3WDr0Rp/5pcfw0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m71ns-0006cy-4H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 20:29:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 816E460E94;
 Fri, 23 Jul 2021 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627072186;
 bh=mEbNVex0MV4baiJn1vzXJRZ962H3Xgl3nJ2S8pPrXHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u+VSTddOjC8+A8m+I0St8amtAisBWFKkZgXbLPgbwmG43VC/UQ3ZDm9FiW0phe5mG
 sYGG58dUVW04WWC9gvSVZJopOBL8KhN3sxEON13TwJxg09Zq8HstOpnrfrkErL4QwV
 nEOU9pcPuWsri1PajO/UdAbS82/OIdF19ouJaEXVBnAHLA2wQCLq7NtsnH6u4XGNu9
 mHqlpl+5oMB3WetMzEifWmsFAnOsuGSOZdcu1+UUKOCYUCiD5FKOAhteoiEGxltKKb
 bCN4PFRqjnEqjResbZYz723M05aXcheEuZOMVP0oWgm191w/uRT6f97/Ytvajz9KXs
 BTHggwP9J3eZw==
Date: Fri, 23 Jul 2021 13:29:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPsmuUEoJUGhFm1J@gmail.com>
References: <20210723074928.1659385-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723074928.1659385-1-daeho43@gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m71ns-0006cy-4H
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change fiemap way in printing
 compression chunk
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

On Fri, Jul 23, 2021 at 12:49:28AM -0700, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When we print out a discontinuous compression chunk, it shows like a
> continuous chunk now. To show it more correctly, I've changed the way of
> printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> info, since it is not in fiemap user api manual.
> 
> Let's assume 16KB compression cluster.
> 
> <before>
>    Logical          Physical         Length           Flags
> 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> 1:  0000000000004000 00000002c0920000 0000000000004000 1008
>   ...
> 9:  0000000000034000 0000000f8c623000 0000000000004000 1008
> 10: 0000000000038000 000000101a6eb000 0000000000004000 1008
> 
> <after>
> 0:  0000000000000000 00000002c091f000 0000000000004000 1008
> 1:  0000000000004000 00000002c0920000 0000000000004000 1008
>   ...
> 9:  0000000000034000 0000000f8c623000 0000000000001000 1008
> 10: 0000000000035000 000000101a6ea000 0000000000003000 1008
> 11: 0000000000038000 000000101a6eb000 0000000000002000 1008
> 12: 000000000003a000 00000002c3544000 0000000000002000 1008
> 
> Flags
> 0x1000 => FIEMAP_EXTENT_MERGED
> 0x0008 => FIEMAP_EXTENT_ENCODED
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> ---
> v3: fix the missing last extent flag issue
> v2: changed the print format
> ---
>  fs/f2fs/data.c | 75 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 42 insertions(+), 33 deletions(-)

I can't understand the code in f2fs_fiemap(), but I tested that my two
compression+encryption tests (xfstest f2fs/002 and Android
vts_kernel_encryption_test) pass reliably when this patch is applied.

Tested-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
