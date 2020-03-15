Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA646185EA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2020 18:17:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDWsv-0003Mk-Kg; Sun, 15 Mar 2020 17:17:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jDWsu-0003MZ-Fj
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 17:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1u7noUF5hbjOzf1Cqm3pnq4R2FK6W1wARcJl3hl/RGw=; b=Y6sdcna+1QmtH28qzzzOgIMwPi
 NrZRuGc5lk/xucB99/5tuSx+kZ8G1SSbi2+xAyhAGy6AmEJdc17X96j83qxzqTIqXpP8zTKn2myFZ
 wtlUaCu+3MUzlV5rRh16+YAR4XGgM5I/k10Z92UEGF/BaKvtIStkqeC6p/RgKh2NkGdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1u7noUF5hbjOzf1Cqm3pnq4R2FK6W1wARcJl3hl/RGw=; b=K6D9NpW+PHVs8gxW5/OkM+D/38
 JAqZSYaVgC4VTy/K08A+lBHwAJ7riKgu3EO40LhNtEVHN2UfaoJZOnKLum+BNhSeujhk+awVN/Zdz
 kYK/zG4auE8fQaD3g3KRbu230xe+GP8XtEcJ3emwP+l6kL6A4FF23GL/sLLlm4qfSwwE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDWsq-00Btls-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 17:17:08 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC567206E9;
 Sun, 15 Mar 2020 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584292614;
 bh=+lmpvdxUBRgyrzSD7k7JSLFEM42g3oWA97s0+PhrLF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fz8xheLuuQR+wB/DfIa8fMDHBJ96eTBl6qoUQEPumGFkmN+p2eeRitOsIvPQcwEWX
 sRdvJhFc0FfCr/6CNrztD5Ta/DRrUiu5/aYHe+U70wAB9I8f7fFCSoPsWq5PyGQl0F
 bbS551kFvD0b5ZrLw8+8RdX4rlEDR7PjNypkYRrs=
Date: Sun, 15 Mar 2020 10:16:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200315171652.GA1055@sol.localdomain>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-11-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-11-satyat@google.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDWsq-00Btls-Jw
Subject: Re: [f2fs-dev] [PATCH v8 10/11] f2fs: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 01:02:52AM -0700, Satya Tangirala wrote:
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5355be6b6755..75817f0dc6f8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -139,6 +139,9 @@ struct f2fs_mount_info {
>  	int alloc_mode;			/* segment allocation policy */
>  	int fsync_mode;			/* fsync policy */
>  	bool test_dummy_encryption;	/* test dummy encryption */
> +#ifdef CONFIG_FS_ENCRYPTION
> +	bool inlinecrypt;		/* inline encryption enabled */
> +#endif
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
>  					 */

This bool is unused now.

> @@ -1568,6 +1577,9 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
>  	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
>  	F2FS_OPTION(sbi).test_dummy_encryption = false;
> +#ifdef CONFIG_FS_ENCRYPTION
> +	sbi->sb->s_flags &= ~SB_INLINECRYPT;
> +#endif

This really should be CONFIG_FS_ENCRYPTION_INLINE_CRYPT, but actually there's no
need for the #ifdef at all.  Just clear the flag unconditionally.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
