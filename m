Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CE796F86
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Sep 2023 06:12:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qe6NY-0007lw-Q2;
	Thu, 07 Sep 2023 04:12:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qe6NV-0007lq-WA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Sep 2023 04:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HY7d93++z/6bsmUtdTtfz0egQCeB2ETVMHaEkYqebeQ=; b=dpZCICqa5oW5Vjfj7Y+i8sbYHl
 GZra6RkseXNQ89ZRu+msnrfv3RFQrmTQnIMjv3nx6etKgsoKfx6dhEYrSEFpLPQpHD2iZ9W0juWQZ
 TYPSDftMKU36dzBDQrW17E5QP0m4H46x6HBo2lutqZIRy8UxrlXyUYm9xAFDBvhA/PIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HY7d93++z/6bsmUtdTtfz0egQCeB2ETVMHaEkYqebeQ=; b=cTK9N06UxEhEa75ggVNDpjYh0T
 egwWQTXzM5zeuKvgPg+4QUpDOEVNFtVvOKTmkA+Zl/87H0gR9DFBFPP66IU4sS8PX+gIv5f14udzh
 GsmP6ZLQTAVBkjtdSXNIAxb+wjq6BxKD08a/Iy/ZJxjxhi4g6I29ZP4abrNOFz/L88VQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qe6NP-0000M8-89 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Sep 2023 04:12:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 970E6B81D50;
 Thu,  7 Sep 2023 04:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2592AC433C7;
 Thu,  7 Sep 2023 04:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694059931;
 bh=p2L0hXlRPRMndQiTAhXGSapDao/Jejkqds1JRecNyMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kYyGCcAk/buIL48VKm9WFGqsAa/jXyI8kcaudUqP28atmub5aIkExAC/C+MBstnFS
 a745AhoxRHt1aQr7RqxcJvxCb0YY1t/FkndSNsQEeQz+aUAQXhgRYBNCYLOIUH/97A
 Iq1LFwbyduLmmxmtg7L2W6NXshPlRg2HiwDig8GvHbQ+J7Vm2oqx/M5p06VmyOBZQ7
 77R1pboRr4ASFygkiPsYkxK75wQkzFCMgl7W0USlb6E4VqU5GprbiIG+9pZP/Wfute
 6Lqn/BTW/YEcVF4xLQ/PcDPu8E/nqgAqaT8boYi0g/iP5eRG8r2J5/0p8UpWx6Hg8E
 PsaJbBmZFDy+Q==
Date: Wed, 6 Sep 2023 21:12:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Joel Granados <j.granados@samsung.com>
Message-ID: <20230907041209.GA37146@sol.localdomain>
References: <20230705212743.42180-1-ebiggers@kernel.org>
 <20230705212743.42180-3-ebiggers@kernel.org>
 <CGME20230906134906eucas1p18f20ec4bd1aa89ce9c8c6495255d442f@eucas1p1.samsung.com>
 <20230906134904.4zbqdldrq2k4rqfn@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230906134904.4zbqdldrq2k4rqfn@localhost>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 06, 2023 at 03:49:04PM +0200,
 Joel Granados wrote:
 > On Wed, Jul 05, 2023 at 02:27:43PM -0700, Eric Biggers wrote: > > From:
 Eric Biggers <ebiggers@google.com> > > > > Currently the regist [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qe6NP-0000M8-89
Subject: Re: [f2fs-dev] [PATCH 2/2] fsverity: move sysctl registration out
 of signature.c
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 06, 2023 at 03:49:04PM +0200, Joel Granados wrote:
> On Wed, Jul 05, 2023 at 02:27:43PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Currently the registration of the fsverity sysctls happens in
> > signature.c, which couples it to CONFIG_FS_VERITY_BUILTIN_SIGNATURES.
> > 
> > This makes it hard to add new sysctls unrelated to builtin signatures.
> > 
> > Also, some users have started checking whether the directory
> > /proc/sys/fs/verity exists as a way to tell whether fsverity is
> > supported.  This isn't the intended method; instead, the existence of
> > /sys/fs/$fstype/features/verity should be checked, or users should just
> > try to use the fsverity ioctls.  Regardlesss, it should be made to work
> > as expected without a dependency on CONFIG_FS_VERITY_BUILTIN_SIGNATURES.
> > 
> > Therefore, move the sysctl registration into init.c.  With
> > CONFIG_FS_VERITY_BUILTIN_SIGNATURES, nothing changes.  Without it, but
> > with CONFIG_FS_VERITY, an empty list of sysctls is now registered.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/verity/fsverity_private.h |  1 +
> >  fs/verity/init.c             | 32 ++++++++++++++++++++++++++++++++
> >  fs/verity/signature.c        | 33 +--------------------------------
> >  3 files changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> > index c5ab9023dd2d3..d071a6e32581e 100644
> > --- a/fs/verity/fsverity_private.h
> > +++ b/fs/verity/fsverity_private.h
> > @@ -123,6 +123,7 @@ void __init fsverity_init_info_cache(void);
> >  /* signature.c */
> >  
> >  #ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> > +extern int fsverity_require_signatures;
> >  int fsverity_verify_signature(const struct fsverity_info *vi,
> >  			      const u8 *signature, size_t sig_size);
> >  
> > diff --git a/fs/verity/init.c b/fs/verity/init.c
> > index bcd11d63eb1ca..a29f062f6047b 100644
> > --- a/fs/verity/init.c
> > +++ b/fs/verity/init.c
> > @@ -9,6 +9,37 @@
> >  
> >  #include <linux/ratelimit.h>
> >  
> > +#ifdef CONFIG_SYSCTL
> > +static struct ctl_table_header *fsverity_sysctl_header;
> > +
> > +static struct ctl_table fsverity_sysctl_table[] = {
> > +#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> > +	{
> > +		.procname       = "require_signatures",
> > +		.data           = &fsverity_require_signatures,
> > +		.maxlen         = sizeof(int),
> > +		.mode           = 0644,
> > +		.proc_handler   = proc_dointvec_minmax,
> > +		.extra1         = SYSCTL_ZERO,
> > +		.extra2         = SYSCTL_ONE,
> > +	},
> > +#endif
> > +	{ }
> > +};
> > +
> Just to double check: When CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not
> defined then you expect an empty directory under "fs/verity". right?

Yes, that's correct.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
