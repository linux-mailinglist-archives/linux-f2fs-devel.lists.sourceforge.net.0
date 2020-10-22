Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E25295744
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 06:26:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVSBB-0000vp-Ky; Thu, 22 Oct 2020 04:26:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kVSBA-0000ve-TL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97eSh3sz/qq2Iuc3Mq60jF096mR189GwMGojV/xDF00=; b=Oe/tZTF7Uw91BUyZXRGnnxe6dy
 O6BruJZaYnMDF3pI9Ob5TJasIKKHcrsE1nPXi2sa76JfoWvhuuoN5tt3AmuQJF+KFHed0PXcgQcyJ
 RoogqMEgu7BwPwJ25PtxBh3T022/ydTJ04EpKlj0aodwuSEIZ0ex8XGV0cHIVRPHSxMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=97eSh3sz/qq2Iuc3Mq60jF096mR189GwMGojV/xDF00=; b=dQnmiMg++kp1pgQ1D7zZlif6Zq
 aBWLkFtIA7Vx9kteIkr/WT5/aJhXM1jRCciu6A7+Y2zECjDEpWSZQo0jf5EHWP1ZY6dRjiy5lILkt
 zsM0knI58VgzhmnfJLfbLzDBuSd70ipi4eh5W7yFmeLiN+qUD2+m30DmRb6xLDJ0n7G4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kVSB5-008DPG-Rw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:26:20 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35C93223C7;
 Thu, 22 Oct 2020 04:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603340770;
 bh=tO1bg+mezuCia7YL2G0Qpt4JP1mhgBL20CGZrVb1xQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zlbSAvsHJd1XSuS7yLA1SMc54fNVzI9yhNG7FWvAnGm45Wx0YHj6hGBb0rnfcXsV8
 +xEadr7eMjPcp5Pg4c/GFZPFowk4+OAo59JK0tb7gMz59ahkkNk2Freq04wSqvmvMP
 cP2PnWYKriq0/Y/gdOJbQkkQ6mVpEk8zi4/R1IVU=
Date: Wed, 21 Oct 2020 21:26:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201022042608.GB857@sol.localdomain>
References: <20201022035848.976286-1-daeho43@gmail.com>
 <20201022035848.976286-2-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022035848.976286-2-daeho43@gmail.com>
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
X-Headers-End: 1kVSB5-008DPG-Rw
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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

On Thu, Oct 22, 2020 at 12:58:48PM +0900, Daeho Jeong wrote:
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7895186cc765..3b58a41223f8 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -514,6 +514,11 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>  	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>  }
>  
> +bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
> +{
> +	return algorithm >= COMPRESS_MAX ? false : f2fs_cops[algorithm];
> +}

The use of ?: here is a bit strange.  How about:

	return algorithm < COMPRESS_MAX && f2fs_cops[algorithm] != NULL;

> +	if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
> +			!f2fs_is_compress_algorithm_ready(option.algorithm))
> +		return -EINVAL;

Likewise, EINVAL tends to be over-used, which makes it ambiguous.  Maybe use
ENOPKG for the case where algorithm < COMPRESS_MAX but the algorithm wasn't
compiled into the kernel?  That would be similar to how opening an encrypted
file fails with ENOPKG when the encryption algorithm isn't available.

> +	if (f2fs_is_mmap_file(inode) ||
> +			get_dirty_pages(inode) || inode->i_size) {
> +		ret = -EINVAL;
> +		goto out;
> +	}

How about EBUSY for f2fs_is_mmap_file(inode) || get_dirty_pages(inode),
and EFBIG for inode->i_size != 0?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
