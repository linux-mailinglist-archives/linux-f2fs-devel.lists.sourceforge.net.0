Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3517EF723
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Nov 2023 18:41:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r42qi-0004ZM-BQ;
	Fri, 17 Nov 2023 17:41:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1r42qh-0004ZE-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 17:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmtEd5NC0ZmxjhBH9cougUeBMBfDCmi5XK4w+3wNXZ8=; b=bqMlFEd0qSJcJTSYzDUsHTUc1f
 iZU7yGYt+vKXjjrV6uLFLgRXAY/LjFsRUneks0uDBHldW7sZgEAiT6/TrnpECNs+ooZGdAHN3f3ZT
 aHieut2ED1opeEfUGPzkdq16LJKiuJPhpXvkzL9cNSJEfAnTvtPz4dMd5kNA4IPjbvHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmtEd5NC0ZmxjhBH9cougUeBMBfDCmi5XK4w+3wNXZ8=; b=gaJ1pIPUn+DG6yQWi4anXUtSIN
 pb9VwioM76mPiIK9aW6snNHx507tnUAY20t/65bJOK0xONwNtud5iAHM5ihU4ijTI7qNT1PJ9i1gT
 lz/CQN9Ie7Aw3X2BoZyVpRwoVteG/OhIIisUqpx1Nk7xeFRbanyvoSyClHInAyqnfsWk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r42qg-0002lG-BT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 17:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 195A0B82100
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Nov 2023 17:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FED2C433C8;
 Fri, 17 Nov 2023 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700242899;
 bh=MER7uh+se/JwOjTPFGrER85ioNfg81q8jMULDAOSPNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cqy2H4wG/EgkVRNDWyWbR5qlXsCjjanoSmXnv2CXByhpNRQylp1+7r0Av16pM79TA
 LqTHgMtBZtNdILI6SggFyPhd6b46+v1zyfhTaR0Kcfee+CFK0bRclQv9axkOKnkgOf
 kx0j57oi5JxZvxc1spaoBOMxGkf2NwfxZQod47XD8wgajmq0qCOQB+Lchv1l+YEcaV
 6MPtqhCwkGTc+WAW4NbD5xOJ23ZNDpONRGk13uYnCIIyBdx4I7eiPUqCcBFECE1WRZ
 qoTR4FCP+APCZTDFPB8xv5Qb1Mwwn9kpjI1+CAkk37HbD8jaJUz7NnjGkxFT5Wrl5o
 F2LGQhKIMlpZA==
Date: Fri, 17 Nov 2023 09:41:37 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZVel0bHLlg4IizJ_@google.com>
References: <20231114212414.3498074-1-jaegeuk@kernel.org>
 <4a0e1c6f-12c4-f3dd-bb26-4bf0aee6be4b@kernel.org>
 <ZVQwz5ubx9LojzEf@google.com>
 <236866a2-41b0-2ad0-db77-4c377367c80e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <236866a2-41b0-2ad0-db77-4c377367c80e@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/15, Chao Yu wrote: > On 2023/11/15 10:45, Jaegeuk Kim
 wrote: > > On 11/15, Chao Yu wrote: > > > On 2023/11/15 5:24, Jaegeuk Kim
 wrote: > > > > When recovering zoned UFS, sometimes we add the sam [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r42qg-0002lG-BT
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
> On 2023/11/15 10:45, Jaegeuk Kim wrote:
> > On 11/15, Chao Yu wrote:
> > > On 2023/11/15 5:24, Jaegeuk Kim wrote:
> > > > When recovering zoned UFS, sometimes we add the same zone to discard multiple
> > > > times. Simple workaround is to bypass adding it.
> > > 
> > > What about skipping f2fs_bug_on() just for zoned UFS case? so that the check
> > > condition can still be used for non-zoned UFS case.
> > 
> > Hmm, I've never seen this bug_on before, but even this really happens, it does
> 
> I've never seen it was been triggered as well.
> 
> > not make sense to move forward to create duplicate commands resulting in a loop.
> 
> Agreed.
> 
> It looks those codes were copied from extent_cache code base, do we need to fix
> all cases to avoid loop?

Not sure other cases yet.. let's do one by one, since I hit this in real.

> 
> > 
> > So, the question is, do we really need to check this? Have we hit this before?
> Not sure, just be worry about that flaw of newly developed feature can make
> code run into that branch.
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > >    fs/f2fs/segment.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > index 727d016318f9..f4ffd64b44b2 100644
> > > > --- a/fs/f2fs/segment.c
> > > > +++ b/fs/f2fs/segment.c
> > > > @@ -1380,7 +1380,8 @@ static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
> > > >    			p = &(*p)->rb_right;
> > > >    			leftmost = false;
> > > >    		} else {
> > > > -			f2fs_bug_on(sbi, 1);
> > > > +			/* Let's skip to add, if exists */
> > > > +			return;
> > > >    		}
> > > >    	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
