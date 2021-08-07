Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53F3E33C1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Aug 2021 08:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCFre-0003Em-P3; Sat, 07 Aug 2021 06:31:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mCFrS-0003De-FW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 06:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=COHg+d5VL3vZhpt1S0+/GDPBLmiM6ehQZo8OLlIuSbw=; b=FtF5oyuMUpCry1cX00/x8MSoGw
 nxqj4h8ge747Yd1STx0IFW63beyI9WgzvLE+Pq3krb2YMFJ7n4Wq6rjAuDEeMIaroCPgn6zY5voNJ
 7RHi5elupl/ZK6nynPGfdiwt93UIaOSyDNhIvC9I1B68Pbn0bSmVjRFemCVFlyMlrZec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=COHg+d5VL3vZhpt1S0+/GDPBLmiM6ehQZo8OLlIuSbw=; b=MpmFClsgcfEimQYe+xgGJNyoKa
 x5uT+alSlMwcEg7cf6pOXYrn6xyjYoMjdZxB+Z2RpKNMR0WPcG7GyavRT7UvR4SEYYUgdA3cUXf84
 36zHOmctxI2tJyRU/SvBMjWaci2W+JP05u5qclr7apA+ipGaBCi2soiO4CURMOCiSVSI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCFrM-00Faet-FS
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 06:31:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8596360EEA;
 Sat,  7 Aug 2021 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628317851;
 bh=gqBbm7RQvMmGiA3+sO0OFu5gS/QfanB2nByt2Gwpxgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZIE/jRKv7kWLZA2wXSQwDq9hr6eB0pk/cWpEoy68ubzTdGleeflaGLAnR7YPhFKH
 fjQtBQpnH57rlyH4JfTw92i9rJFlpocxI9GSQCXA9Vn8cbuTlVI3ySZxs+CEa5SsHZ
 p6/415HlU/z8Kcz7SzW20AX8rNnWIWbPYW9qFMtS1czQu/dIKlFJ4KnhW/XOhMp9ZG
 M1z3QVHPSISdZAmyuYYuwedK+JGKGZyyGWWPrRT5lma/KI0UOi7iymhtrQE8a66d9f
 MH/Y4WCM3hPn4dMkOvPdWReMFiaBl9CqMcZg6eDLFKgNjTg6Wj8BXsz4VK4K67PenR
 Wsakcx87MBmCQ==
Date: Fri, 6 Aug 2021 23:30:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YQ4omeTN73JFZQY+@sol.localdomain>
References: <20210729043728.18480-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729043728.18480-1-ebiggers@kernel.org>
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mCFrM-00Faet-FS
Subject: Re: [f2fs-dev] [PATCH] fscrypt: document struct fscrypt_operations
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 28, 2021 at 09:37:28PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document all fields of struct fscrypt_operations so that it's more clear
> what filesystems that use (or plan to use) fs/crypto/ need to implement.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/linux/fscrypt.h | 109 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 105 insertions(+), 4 deletions(-)

Applied to fscrypt.git#master for 5.15.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
