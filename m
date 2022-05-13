Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A81526CBC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 00:00:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npdKj-0006oK-TF; Fri, 13 May 2022 22:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npdKi-0006oE-GJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 22:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r0ky167R/pcsI/y0pomJ9PkIE0seIB+45HKP33Zkakg=; b=Ntycb1t9jZyl9bkjfiLrmNg4It
 58qlg7Ojyh8VkPHPrF1kNzHRBOirtDWMD16k1J5bNLwa+xCVqXEwZxdWCmDw+m20J3end/lNyOeVt
 yCiVJvtvB9g2cUOfJIVkGbYrBOUZHk/PPCGuw74dBUomUAafU+fC7WRxBU1G+Uk0xygw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r0ky167R/pcsI/y0pomJ9PkIE0seIB+45HKP33Zkakg=; b=XZh+lul45i/MbKC23AJDK1SwQ9
 7BdA1RGP09Ip/3HNKKPy51CwJ2lC/d/PVMLrBy9KjVqFB5oTPwzAZzhBKiMY1bf8SCOzU+mFoy9gz
 E0lGM4czQf28JtRT1vKe0djL6HM//HWAsfnHnA+AL6JidM+nqh4bZjbNcmpeTnrvaRAY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npdKe-0008C8-23
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 22:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F26F60C0B;
 Fri, 13 May 2022 22:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51F8C34100;
 Fri, 13 May 2022 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652479200;
 bh=9or3bcCS+phDNhSoucSJa5LZj2NNYNIkPfIS1dsSmy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s0nvUTpYk1zVtYoddcOJhYOp76M/RWg1R9jV/CF4DJxjPW7eSUZyHABBUBoqNTpyg
 RVWnCAxWXoOCnMjf0pyzW1zvnJUjV6Bh5e+hrmBxzNusD/jmysfkC86tD5j+G9LgpI
 hpCcB0tZ8BEMqi79uP/N6qTpkQqpqyZLFmOyYA3Zwge1f2OgX6s2Qg7bfg/msh7Dx2
 kcCb1zrQHdehUzaWNn93F2yjIO8Sji/UCPhaQ4Xitcu74QG0I+MKpILk0GtmFIsdeJ
 Cufl9ISLi7mV7fJJYdc8uH92O0XtIRrVqYEDTTHPeigBnsCjllXvLO2XVfo6x0kfW3
 W1fXrCYiDou4w==
Date: Fri, 13 May 2022 14:59:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Message-ID: <Yn7U3YHQfoRaeQPQ@sol.localdomain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
 <20220513110741.uofbacfs7li4cqio@riteshh-domain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513110741.uofbacfs7li4cqio@riteshh-domain>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13, 2022 at 04:37:41PM +0530,
 Ritesh Harjani wrote:
 > > @@ -2623,10 +2609,11 @@ static int parse_apply_sb_mount_options(struct
 super_block *sb, > > if (s_ctx->spec & EXT4_SPEC_JOURNAL_IOPR [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npdKe-0008C8-23
Subject: Re: [f2fs-dev] [PATCH v2 5/7] ext4: fix up test_dummy_encryption
 handling for new mount API
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Lukas Czerner <lczerner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 04:37:41PM +0530, Ritesh Harjani wrote:
> > @@ -2623,10 +2609,11 @@ static int parse_apply_sb_mount_options(struct super_block *sb,
> >  	if (s_ctx->spec & EXT4_SPEC_JOURNAL_IOPRIO)
> >  		m_ctx->journal_ioprio = s_ctx->journal_ioprio;
> >
> > -	ret = ext4_apply_options(fc, sb);
> > +	ext4_apply_options(fc, sb);
> > +	ret = 0;
> >
> >  out_free:
> > -	kfree(s_ctx);
> > +	__ext4_fc_free(s_ctx);
> 
> I think we can still call ext4_fc_free(fc) and we don't need __ext4_fc_free().
> Right?
> 

Yes, you're right.  I might have missed that fc->fs_private was being set above.
I was also a little lazy here; the part below 'out_free:' should be a separate
patch since it also fixes a memory leak of s_qf_names.  I'll fix that up.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
