Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E877EBB50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 03:46:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r35uc-0002MK-9N;
	Wed, 15 Nov 2023 02:45:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1r35ub-0002MD-4x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 02:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ed6fP6AE0vB7zw0unVNmfJnCOtTazQjCa5BQlei6yfM=; b=CLm6F0skSflDzIWieQqYRSJc6S
 /yxDSj+ZwSvDn/QZmFGFkw1SM136WI1cABjBcl6VLfMx7cdCjBOdt2LmEH7Qov5sXD7g0IRGV9Mv1
 U3Phrvz1dHuplp+OA+kzNrEdp3HM3Lzr92vi2dvwl6tpzNrB5x2mTMLvWENcSrm31a2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ed6fP6AE0vB7zw0unVNmfJnCOtTazQjCa5BQlei6yfM=; b=SpkGd3kPfw28Myx+4xIqENnTe3
 6T808rrp3gOO3fCF5MgjBubSLVtjlzmhDscss7V0qiUCdMvJ57K6GFkjlQCnn3ZTfOiqf2A8AhwE7
 WDShMS5qSZd8dMWZrIt+JwGiFJxp1r7lOrIC0QA51xvdRoy39OMUgPUnmYVavCSh2nyo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r35uW-0064WG-1b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 02:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9B9DCE1AB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Nov 2023 02:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B81C433C8;
 Wed, 15 Nov 2023 02:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700016336;
 bh=hbFaoKrrau1TpP4IwIq1+TY/rzzsU2L4DzKpodehWpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A50UAOsb/rtVZ8idJO87j5hiPsCfJlrRsPR6AvaX2XEGzsGYCF63M9cGvThZLDYKu
 V636IxpxOe7gXWSi9eIL2EoyWLvxUYJXoCiaHQO46oZWWuI2uQeU93vzg2cv6HPu28
 pK7i2Bod8syCnwd2143yj+DC2duQA1UWByf+yYIkaoDJ+HHJdvdpJeZGkVSzEF5QUy
 BRDGJxfy9/3egRvboN2pXjS36CpdDJjARI0Whb71mZ0yxskYfZRYLeREpUEN43D5Jr
 R70uyZXB0UQvf0ni/Zkb+ofzNApH0y6aGeWDiG7yq8ltiEOgzh1CpEJL07Z/7ywYs3
 GSQ1m0xr9G+rw==
Date: Tue, 14 Nov 2023 18:45:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZVQwz5ubx9LojzEf@google.com>
References: <20231114212414.3498074-1-jaegeuk@kernel.org>
 <4a0e1c6f-12c4-f3dd-bb26-4bf0aee6be4b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0e1c6f-12c4-f3dd-bb26-4bf0aee6be4b@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/15, Chao Yu wrote: > On 2023/11/15 5:24, Jaegeuk Kim
 wrote: > > When recovering zoned UFS, sometimes we add the same zone to discard
 multiple > > times. Simple workaround is to bypass adding it. [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r35uW-0064WG-1b
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip adding a discard command if exists
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/15, Chao Yu wrote:
> On 2023/11/15 5:24, Jaegeuk Kim wrote:
> > When recovering zoned UFS, sometimes we add the same zone to discard multiple
> > times. Simple workaround is to bypass adding it.
> 
> What about skipping f2fs_bug_on() just for zoned UFS case? so that the check
> condition can still be used for non-zoned UFS case.

Hmm, I've never seen this bug_on before, but even this really happens, it does
not make sense to move forward to create duplicate commands resulting in a loop.

So, the question is, do we really need to check this? Have we hit this before?

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/segment.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 727d016318f9..f4ffd64b44b2 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1380,7 +1380,8 @@ static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
> >   			p = &(*p)->rb_right;
> >   			leftmost = false;
> >   		} else {
> > -			f2fs_bug_on(sbi, 1);
> > +			/* Let's skip to add, if exists */
> > +			return;
> >   		}
> >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
