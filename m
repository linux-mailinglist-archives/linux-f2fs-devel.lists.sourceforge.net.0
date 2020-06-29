Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F320D097
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 20:24:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpyS0-0007pE-TY; Mon, 29 Jun 2020 18:24:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jpyRz-0007p7-Ev
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hGPhqFg0kW3OpIE2mpFBnoVixk1/4iJb+OwDM1nxN+0=; b=I8fbVNFCkTeXy1Hj+rh1a+w3rK
 w3PPtynlTXWoZ6OrBPpBgASl9DMWdHUmYVmuWajkbaak60C6MkCyA79yPpuwUtuIT1JgYVDPIWA33
 F2iFXuXThk6Vvr78vB2Bfx1rko8LnaZjohfw6c2Pe2i6nbOk9WaaiBfMn29okmSh1pvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hGPhqFg0kW3OpIE2mpFBnoVixk1/4iJb+OwDM1nxN+0=; b=O12ctmUeCxJP4ozO6pg+u89I/6
 h9lxjUGeXQiW2vB6v+tVj/8ls0mgYD2vDgk79onPMhmY6sTXC7RN+Al4kSdkCXQAD7y1LquMFJFYT
 YZFdfgdfNyEjpmAe8xrQLCwrsmLS8o6HPOYbXBoMJsP60BRMU/RRaISIC+V6u7zq26LA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpyRy-005GP6-CS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:24:15 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA2F8255C9;
 Mon, 29 Jun 2020 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593455048;
 bh=WtcO4OQ+rWVThEy0P5QwrgAlBFNU4fHDkqK2m2rvXk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=awED3q3uewhYzryJjBkPIlXegndymb+6phw4rtdtP+XE10ZQqM0ZChJ8CuGUjABvJ
 4dglfld0hQrcgm6zMwZ30JXdyvmkDiFtYMfzFbGwFaoWZ4gAgRuVu3rjXvy0n5nlk5
 z4mTiNZo07S0XF3ZtgiYnG3g2v9BpeC0SIdkkv/Q=
Date: Mon, 29 Jun 2020 11:24:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200629182406.GE20492@sol.localdomain>
References: <20200629120405.701023-1-satyat@google.com>
 <20200629120405.701023-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629120405.701023-2-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpyRy-005GP6-CS
Subject: Re: [f2fs-dev] [PATCH v2 1/4] fs: introduce SB_INLINECRYPT
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 12:04:02PM +0000, Satya Tangirala via Linux-f2fs-devel wrote:
> Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
> blk-crypto for file content en/decryption. This flag maps to the
> '-o inlinecrypt' mount option which multiple filesystems will implement,
> and code in fs/crypto/ needs to be able to check for this mount option
> in a filesystem-independent way.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  include/linux/fs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3f881a892ea7..b5e07fcdd11d 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1380,6 +1380,7 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_NODIRATIME	2048	/* Do not update directory access times */
>  #define SB_SILENT	32768
>  #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
> +#define SB_INLINECRYPT	(1<<17)	/* Use blk-crypto for encrypted files */
>  #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
>  #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
>  #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */
> -- 

Reviewed-by: Eric Biggers <ebiggers@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
