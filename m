Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A82B58B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 05:15:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kesOj-0002PM-Jx; Tue, 17 Nov 2020 04:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kesOh-0002PB-0N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kT2IJiq9vABCGnZpcT94UHSzFtZ6Cb6ALbwPgvhPm+k=; b=Lxx9ObA0aDPDAyle3e+21EeBtD
 Xp0D8LzJwEYrBkQSeNhJDOy5HWpWPUMyJ0n7AMvTkYLs4aymgqxBxWRyVhwYD7RE6STRJt75zx7DW
 q4HlehND14vUQdMPx+qkCGPrKjXCmeP+oDH7lNf6dSldaMeyEhlz1pCtzjTuuWXxTQjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kT2IJiq9vABCGnZpcT94UHSzFtZ6Cb6ALbwPgvhPm+k=; b=kUqFINTPqf5bHum8mAWGCmq8pf
 UcPWeS4r8Z0sW3Y7zQohj31imXBOFYfXT3qq8pWj7cOR4rwA8M+H6Qu7mZljR1E0Yp0unIuhFxo2l
 v48iZyOG4eSLd8Y/VCNfVElxw11NYvS6XfdXAjP1zLm7RzuKXsTLwCNzqlNOJHnB5Qzs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kesOY-00GkDz-M2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 04:15:14 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39ED824692;
 Tue, 17 Nov 2020 04:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605586496;
 bh=EUZuSaWR7L8DS5oY3+rH31vEa/9kDCzJ9/I0RDpwemM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+UDMrWZsAB8vfZVXXHBEyaOsdr9Z7jW4tHsDEc5ybT409kb0Clb58Jpk6Cj825Nv
 HgTZsdLl+uYtHt6Ane5SiOLN25muFQx6kjLVlOjMCQzVj5S0FPSE3/TTe+iffbu5vn
 ALSgWq4U4NURD7exEGe0A1i6idTtgKXtrZ97O5eQ=
Date: Mon, 16 Nov 2020 20:14:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X7NOPrbIMtHFvVwp@sol.localdomain>
References: <20201117040223.858979-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040223.858979-1-daeho43@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kesOY-00GkDz-M2
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add disable_auto_compr mount option
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

This patchset doesn't have a cover letter, and it doesn't apply to f2fs/dev, so
I'm not sure what its purpose is.

On Tue, Nov 17, 2020 at 01:02:22PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We will add a new disable_auto_compr mount option to turn off the
> automaic compression on the compression enabled file, in order to
> give discretion of choosing the target file and the timing of
> compression to the user.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/filesystems/f2fs.rst |  4 ++++
>  fs/f2fs/data.c                     | 10 +++++-----
>  fs/f2fs/f2fs.h                     |  8 ++++++++
>  fs/f2fs/segment.c                  |  2 +-
>  fs/f2fs/super.c                    |  9 +++++++++
>  5 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..c36ca1e0f7ab 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,10 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>  			 For other files, we can still enable compression via ioctl.
>  			 Note that, there is one reserved special extension '*', it
>  			 can be set to enable compression for all files.
> +disable_auto_compr       Even if compression feature is enabled, this option can
> +                         disable automaic compression on the compression enabled
> +                         file to give discretion of choosing the target file and
> +                         the timing of compression to the user.

I don't understand.  How is this different from just not specifying the
compress_extension mount option?  And how can a file have compression both
enabled and disabled at the same time?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
