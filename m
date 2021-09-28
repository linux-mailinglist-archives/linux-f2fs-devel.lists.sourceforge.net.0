Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB941B8D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Sep 2021 22:59:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVKC4-0006Io-59; Tue, 28 Sep 2021 20:59:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mVKC2-0006Ib-N1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 20:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vdJT9ywrBEcF/0YQnrMIH0LVh5kwdgvAJzt2WIyxCEo=; b=CKk/JIb9EpiiDgmwXfcGZRhgWj
 zQLoVGomAyL2rCHd6SF7LOQMjt725/nkfrVtWjpKh2GZq2ndQ7kbeHP7At7rv+DQLXl7y9VcQa1Sz
 8Mk/6V1p8j2cj66L0fs31/t/2ctRUWLlJP6iYyVmNViZTwbTe40sMO/aJS8WzzD5Xga0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vdJT9ywrBEcF/0YQnrMIH0LVh5kwdgvAJzt2WIyxCEo=; b=jISdh3kOYP+LKTfCXqw0P+Yee1
 QrOe8cA5udnG0JCX/q9dil9Ht70iRqGG8PlRkWx60/qi+DrHlzXy/r6OKX5gnZA4FuXJaOssti0mg
 UHm/A8YQD2LC2jDO+LPoJQolh3/mY9xz24KPrD815ihNSNJOk+qRxyW1Lp0F7kA7tGu4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mVKC2-0002cF-3I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 20:59:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C6E560FC0;
 Tue, 28 Sep 2021 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632862739;
 bh=Gl+jfadpVvNOg2XJ45MvVWQ8l+OKiOdvBFfmcAUq9WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKalrk9XQuztHgAP4K4twJc90Mpy5HxW/4EL063Esk1cB2aTpkCDPOwoJx7WfgPck
 BoRArW/lQRw44gXDmpQJ/oanTSIBeUESshlmOOGgW/VEAtVB5yt0GmkY/L/bHa1qI4
 /FI00FFVBLAfAwKjIyaMUnl8zoxi8GnryHxdQdNSfFJ+C2NZaDjzICaon8YuT8TVFf
 1Pk28j9eP3fmqiqtoFDX5XYc7GhL3NWE0s3/T0FeewGOg5FVSc6+sowAss2HgxErJl
 8A3OirUoaKY5nMbmZKFgIa3wDKNJD5feGoDNgmjCstKS7e0GdO+pVzc82WKZg5hocY
 qweA4xvReocYg==
Date: Tue, 28 Sep 2021 13:58:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YVOCEn9xHmHmJdDI@google.com>
References: <20210928204658.2230524-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928204658.2230524-1-daeho43@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Merged to address android build breakage. On 09/28, Daeho
 Jeong wrote: > From: Daeho Jeong <daehojeong@google.com> > > In lower versions
 than macOS 10.12, they don't support clock_gettime > function. It breaks
 the build, so we need to fall ba [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mVKC2-0002cF-3I
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fall back to the original
 version check when clock_gettime is not supported
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

Merged to address android build breakage.

On 09/28, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In lower versions than macOS 10.12, they don't support clock_gettime
> function. It breaks the build, so we need to fall back to the original
> kernel version check algorithm, in that case.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fsck/mount.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 7c4c681..c928a15 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -975,6 +975,16 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
>  		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
>  		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
>  					c.sb_version, c.version);
> +#if defined(__APPLE__)
> +		if (!c.no_kernel_check &&
> +			memcmp(c.sb_version, c.version,	VERSION_NAME_LEN)) {
> +			c.auto_fix = 0;
> +			c.fix_on = 1;
> +			memcpy(sbi->raw_super->version,
> +					c.version, VERSION_NAME_LEN);
> +			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
> +		}
> +#else
>  		if (!c.no_kernel_check) {
>  			struct timespec t;
>  			u32 prev_time, cur_time, time_diff;
> @@ -1007,6 +1017,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
>  			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
>  		}
>  out:
> +#endif
>  		print_sb_state(sbi->raw_super);
>  		return 0;
>  	}
> -- 
> 2.33.0.685.g46640cef36-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
