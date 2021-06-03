Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A22399E6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 12:05:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lokDv-0005x1-Q6; Thu, 03 Jun 2021 10:05:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lokDu-0005wp-HH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 10:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4cb8pQMot6EQOASetu5YdtbzUmRKeJfyXrcqNQL+/RE=; b=kXrOSYfFY17zMUZSzR+BBfOAB/
 ICFHXYFXaFYH4aIYY7Fv+1C9vE7a3Sxf2RAwGWEp53dVlyVlm73CVcdrxR3aOdzM1GNGNJoqgYYw5
 04vxNtAoZHv31vUgQyDaLEvbEMDbf2cVRELJrNPGTTEDzuno8/tBHwqbeFc78TTFwYK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4cb8pQMot6EQOASetu5YdtbzUmRKeJfyXrcqNQL+/RE=; b=Oysirw+fCydd3mU3ywYv7t4mzu
 eMS/0s1Cs+YcVPno30WnRYsHI8hSCGBY1e3o/Q3gq45eGcYFtbbf8kn4Rof+yaD6RHvTpUnEK1zHs
 VZrR0IGRRQujyuW+BnqMwGQaTSGMdjWt9dCLdp1Yd6lwuYKCnWd4jTx+og8mlWpyIh6A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lokDu-008jJJ-3s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 10:05:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CBA2611CA;
 Thu,  3 Jun 2021 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622714699;
 bh=ruv4xX6Eg/YETRybxUhFp8CkZkACBGmGpdG3fCfTNYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G45+ZBzfThzxAH4ZUIGo4rpnqPa6od3F0KNjIxTAh/TfAMROu2xvHCoQTFNLRtRb7
 BVcbWAi/urwY1OQkhDRsSjlzoctHOVjWIvz/j86jj2PtZ3fpaiABbrWwE8vyQqkfIB
 KiKruC8CbO0DqbV4tOWh2O0khvtt4TUDlSTFEYV8=
Date: Thu, 3 Jun 2021 12:04:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLipSQxNaUDy9Ff1@kroah.com>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603095038.314949-3-drosen@google.com>
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lokDu-008jJJ-3s
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Advertise encrypted casefolding
 in sysfs
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 03, 2021 at 09:50:38AM +0000, Daniel Rosenberg wrote:
> Older kernels don't support encryption with casefolding. This adds
> the sysfs entry encrypted_casefold to show support for those combined
> features. Support for this feature was originally added by
> commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> 
> Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> Cc: stable@vger.kernel.org # v5.11+
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/sysfs.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 09e3f258eb52..6604291a3cdf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
>  	if (f2fs_sb_has_compression(sbi))
>  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "compression");
> +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> +				len ? ", " : "", "encrypted_casefold");
>  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "pin_file");
>  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");

This is a HUGE abuse of sysfs and should not be encouraged and added to.

Please make these "one value per file" and do not keep growing a single
file that has to be parsed otherwise you will break userspace tools.

And I don't see a Documentation/ABI/ entry for this either :(

not good...

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
