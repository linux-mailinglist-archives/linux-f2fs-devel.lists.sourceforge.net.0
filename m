Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A009D529F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 19:38:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEC40-0008AZ-Gz;
	Thu, 21 Nov 2024 18:37:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tEC3z-0008AS-He
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 18:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R1BOIXXkcsTw0QF5OxfQfeA68SEOv7xI1lEEhsD7EL8=; b=femCgSVCNGUKzaju/Tvd4NCe1+
 gOgFLCL/4UGLmSG5vbZlg7guo9zp1Bg6PFuAYebidkAOzRRpxpBbZG//V3dFTdKYm3S+dabJw8q5z
 W2ArHW7uWp+yjiAZEXs4W2juyforYOpmRzOMeeIAuNMKOlYNLn9f+jvlePL2Lyj5FnOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R1BOIXXkcsTw0QF5OxfQfeA68SEOv7xI1lEEhsD7EL8=; b=O+7OXXZC/Kc78+Odt7eRARw93e
 +GQLnmfbcvG3jnZzJH9AOcYUJn1afoqsbDAEwvmg0XOWWrv2awPbpcvhiY3fmUdxL5nwQWwIFKB8G
 37GBjXTuJOKfJ1i+K/dRY99jBpb1hVs7YgNhjEnVJLHobn8UusoyJG5tMIjxqLiH+oac=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEC3x-0006zd-7k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 18:37:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FFFA5C51B1;
 Thu, 21 Nov 2024 18:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7608DC4CECC;
 Thu, 21 Nov 2024 18:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732214271;
 bh=p6FQzZglx5gxmZuP3J7VuMuXZHuVLsxCFmm1ME0F74A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o1SMGcchiY+nAY11irgJlxylr/R27HZPkNCgqJrQSlJvMGcOs0bnEW185QjL0eMty
 KlYsNTvvl7SOK6jcVbU5bcwANpXr01OIcPBglsJvj4O10TYGGV25aWdsAfLVDoUDr3
 XXiA+dMPU2e/Ez/D9vBAgHxsszp5IfsxAainh6smz95AmrD+OuhdBHSD14UsBzt4kD
 LW14MhM0xr3FEdM4v3aKjQICOtkUocvwmwYws70beGuH8TOuAFRz4KvLzzdhPUPTGL
 OAfxFj4deUt0apBu3lX0u5Zfj15jZhlYw621orTT/tMa31wwMV+MMGRCFTtCQaxSUl
 PX3LLUkJgvY9w==
Date: Thu, 21 Nov 2024 18:37:49 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <Zz99_caU7lW0m9Il@google.com>
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
 <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
 <ee341ea4-904c-4885-bf8d-8111f9e416b5@redhat.com>
 <Zz5I2cdFn331_0ud@google.com>
 <8b2212c6-2c11-4b9b-b8be-61c6ffb6d94b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b2212c6-2c11-4b9b-b8be-61c6ffb6d94b@redhat.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21, Eric Sandeen wrote: > On 11/20/24 2:38 PM, Jaegeuk
 Kim wrote: > > On 11/20, Eric Sandeen wrote: > > ... > > >> (Note that f2fs
 is the only filesystem that attempts to handle lazytime within [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEC3x-0006zd-7k
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Eric Sandeen wrote:
> On 11/20/24 2:38 PM, Jaegeuk Kim wrote:
> > On 11/20, Eric Sandeen wrote:
> 
> ...
> 
> >> (Note that f2fs is the only filesystem that attempts to handle lazytime within
> >> the filesystem itself):
> >>
> >> [linux]# grep -r \"lazytime\" fs/*/
> >> fs/f2fs/super.c:	{Opt_lazytime, "lazytime"},
> >> [linux]#
> >>
> >> I'm not entirely sure how to untangle all this, but regressions are not acceptable,
> >> so please revert my commit for now.
> > 
> > Thanks for the explanation. At a glance, I thought it's caused that f2fs doesn't
> > implement fs_context_operations. We'll take a look at how to support it.
> 
> (cc: list trimmed)
> 
> I had thought the conversion would resolve this too, but had not considered direct
> mount(2) calls passing the string in, which is something that probably needs to be
> supported even after the conversion, sadly.
> 
> As a reminder, this might be a start / sketch of how to convert to the new mount API:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git/log/?h=f2fs-mount-api
> 
> It's not entirely correct, but at least the first several patches are probably the right
> idea - getting sb / sbi out of the parsing path, and deferring option-vs-disk-feature
> checks until after the superblock is read, etc.
> 
> The final patch is probably not the way to go - it allocates an entire f2fs_sb_info
> in f2fs_init_fs_context - it probably makes more sense to create a new context
> structure which holds only mount options, which is then transferred into the
> sbi after option parsing during mount or remount.

Cool. Let us take a look at them soon. Thank you!

> 
> I was doing these conversions as a side project, and given the f2fs conversion
> complexity, I have yet to get to a series that I'm happy with. Perhaps expert
> eyes can help!
> 
> Thanks,
> -Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
