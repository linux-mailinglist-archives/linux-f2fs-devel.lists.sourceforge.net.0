Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 735332B6A98
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 17:47:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf48N-000682-1I; Tue, 17 Nov 2020 16:47:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kf48H-00067l-LM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 16:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=241bmtdcldGiMLPluDslqzr2h46dg3jP02Rkp4Aq3iI=; b=di98VR5WY7QRRhxvD8kwuS0dh/
 xoXYsuj6QdnaqgVbOv6dBlVi5Xobxo6b+o+MFHh3WKAV0iPbxOuZqx0THUU0ScBPctgm55L5UCCu0
 py5zRHXQn1NTG3TfX6CYQNvncpmDMbY/G5m5ed3stZXFgSmBW5sNkZAMPHGaVT0NsSVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=241bmtdcldGiMLPluDslqzr2h46dg3jP02Rkp4Aq3iI=; b=LbV8a5+pWcgYMXOi/HxF0+cSwE
 79zkNSwrEWogrA8Z5acqw0mcMJDFSqI5bX3aTTbgbvDSdYJk123QEiCXy8BGzNIvWLnLwK14YlW2d
 B7Y36RcqURQI39OgoKtYjRM2Nc+NVkgjhPmfuyjsTn52UobQ1koo6JlekD4H34f5IkPQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf486-0017HC-8K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 16:47:05 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 802BD221FC;
 Tue, 17 Nov 2020 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605631600;
 bh=ElIXQMNkSzoK/B/1Ku0a4XFMqVKqPk7EcBtiVaAo5sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPU7dESRCGWHArA6w5tbgB80kHtWrzj+j+OY2vMXxi+3bE3koBSuROzQy7IJQ4QcA
 Mn4D6c5CGffDf1VWeBotIMvtbnGnR2auK41GOBwWeU+JPGQlnZH03ipB+hF3T2VpGw
 VKEMDnilB/nFNXC+OCPLKaiN+B0ZOpgx4eGk3Gjw=
Date: Tue, 17 Nov 2020 08:46:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Victor Westerhuis <victor@westerhu.is>
Message-ID: <20201117164638.GB1636127@google.com>
References: <f521a968-d946-67b4-5ab4-93e09f7af34a@westerhu.is>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f521a968-d946-67b4-5ab4-93e09f7af34a@westerhu.is>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.4 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf486-0017HC-8K
Subject: Re: [f2fs-dev] [PATCH] Fixed a few spelling errors in f2fs-tools
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, I modified a bit and merged.

On 11/12, Victor Westerhuis wrote:
> Dear Mr. Jaegeuk,
> 
> While compiling a newer version of f2fs-tools for Debian, Lintian found
> some spelling errors. I have corrected them using the patch below, which
> should apply cleanly on top of dev.
> 
> Kind regards,
> 
> 
> Victor Westerhuis
> 
> ---
>  fsck/mount.c          | 2 +-
>  man/defrag.f2fs.8     | 2 +-
>  man/mkfs.f2fs.8       | 2 +-
>  tools/f2fs_io_parse.c | 2 +-
>  tools/f2fscrypt.8     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 8ebc5b0..fc3ecb9 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2482,7 +2482,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
>                 se->valid_blocks = valid_blocks;
>                 type = se->type;
>                 if (type >= NO_CHECK_TYPE) {
> -                       ASSERT_MSG("Invalide type and valid blocks=%x,%x",
> +                       ASSERT_MSG("Invalid type and valid blocks=%x,%x",
>                                         segno, valid_blocks);
>                         type = 0;
>                 }
> diff --git a/man/defrag.f2fs.8 b/man/defrag.f2fs.8
> index b08399b..34113de 100644
> --- a/man/defrag.f2fs.8
> +++ b/man/defrag.f2fs.8
> @@ -48,7 +48,7 @@ is 0 on success and -1 on failure.
>  Specify the starting block address.
>  .TP
>  .BI \-l " number of blocks"
> -Specifiy the number of blocks to move.
> +Specify the number of blocks to move.
>  .TP
>  .BI \-t " target block address"
>  Specify the destination block address.
> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> index 85b6019..0aca4dc 100644
> --- a/man/mkfs.f2fs.8
> +++ b/man/mkfs.f2fs.8
> @@ -98,7 +98,7 @@ mkfs.f2fs \- create an F2FS file system
>  is used to create a f2fs file system (usually in a disk partition).
>  \fIdevice\fP is the special file corresponding to the device (e.g.
>  \fI/dev/sdXX\fP).
> -\fIsectors\fP is optionally given for specifing the filesystem size.
> +\fIsectors\fP is optionally given for specifying the filesystem size.
>  .PP
>  The exit code returned by
>  .B mkfs.f2fs
> diff --git a/tools/f2fs_io_parse.c b/tools/f2fs_io_parse.c
> index d146ead..47f1194 100644
> --- a/tools/f2fs_io_parse.c
> +++ b/tools/f2fs_io_parse.c
> @@ -271,7 +271,7 @@ static void __print_ftype()
>         int i;
>         setlocale(LC_ALL, "");
> -       printf("\n===== Data R/W in 4KB accoring to File types =====\n");
> +       printf("\n===== Data R/W in 4KB according to File types =====\n");
>         for (i = 0; i < __NR_FILES; i++)
>                 printf(" %17s |", file_type_string[i]);
>         printf("\n");
> diff --git a/tools/f2fscrypt.8 b/tools/f2fscrypt.8
> index a60adc8..5e2258a 100644
> --- a/tools/f2fscrypt.8
> +++ b/tools/f2fscrypt.8
> @@ -40,7 +40,7 @@ identifier consisting of 16 hexadecimal characters.
>  The target directory must be empty.
>  .SH EXAMPLE
>  .nf
> -Formats a f2fs filesytem that supports encrypt.
> +Formats a f2fs filesystem that supports encrypt.
>  .ft R
>  # mkfs.f2fs -O encrypt /dev/sdxx
> -- 
> 2.28.0
> 





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
