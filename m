Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D272CA59
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 17:36:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8jb2-0007qy-NV;
	Mon, 12 Jun 2023 15:36:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8jau-0007qa-97
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fP2qdkXtRQwM3oZjILDleVifdKSiwNAWdBtRhcpJcDM=; b=RlcTCiX8osYuyRXpPfhsnH/zpk
 EWaYWt+DW9EYFMCnRnDb/pCNQcASIhetZxv0R+jhyHp/41Mol0GQVpl2j1nEb9Sb73YJPYIIDS683
 tuBCX2VUvlHiEgcCri/CDBQQ2iluqEl7bfRTrsVTbi04tBCve8d5EX57rFOqcFzmM8M4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fP2qdkXtRQwM3oZjILDleVifdKSiwNAWdBtRhcpJcDM=; b=clS1D8UBh3LmMgUMr7zNiGp6//
 fr0DBpkScJKc7cxSPt2iuNAisEqcEVr1ZHEbUW9K0Nt153Am8qSZOKUi/mSZkNjRWMKoXlnegw3ie
 347NrZicC2/JLmLiYSi6uHKcDJ4qAHFzotEcLC1Vkyxjx9vByueSm/qhWW1ayqeZvGZ0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8jas-00062A-NP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:36:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5555262A95
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 15:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F95EC433EF;
 Mon, 12 Jun 2023 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686584188;
 bh=zpOn3jUXIrlXKUjJILYlq5I40bKGQmYkswCO9MlY7KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NxChhF1G2ao1OJQUDnlsP1lZvkzHoIylc5plx01sWujrq4b/Z9Xsihy1S73mwtUQR
 DeRoKFIv5JF6KyMOAF1OuaRwPqVPL1jmWOFk4+HDnJwqpg0Z5qMDQsDFai42y4hmtG
 n0xgMQVxz9mO0fOFkGgfVNqJ3ND+p6wCrDMp/GhYHYVqRai8f2hQNgNcKStRVUsbAO
 blOwFDexlwFRkEHLaR/JxAnD4ROvHfRwdlpDGuY2AeEaH0oz5/W29xb+GbosgA3E+e
 v65m30bmPQFXmiT+eB70izkOprvMbA0Cdr/69yJX8AWqABsYspmOyV/ai9Yh17c/L4
 DRgPLhP7/V5vg==
Date: Mon, 12 Jun 2023 08:36:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZIc7ek4UWwjB41a5@google.com>
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
 <7af0f599-2314-56af-2813-5e63754134e1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7af0f599-2314-56af-2813-5e63754134e1@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/12, Chao Yu wrote: > On 2023/6/7 4:36,
 Jaegeuk Kim wrote:
 > > Let's compress tmp files for the given extension list. > > Could you
 please check below commit? IIRC, it was introduce to avoid comp [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8jas-00062A-NP
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress tmp files given extension
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

On 06/12, Chao Yu wrote:
> On 2023/6/7 4:36, Jaegeuk Kim wrote:
> > Let's compress tmp files for the given extension list.
> 
> Could you please check below commit? IIRC, it was introduce to avoid compressing
> file which has unpredictable tmp file, e.g. foo.sox.
> 
> Could you please describe the case you encounter?

I don't know what I need to describe more tho, looking at how to compress
abc.so.tmp and abc.so, given compress_extension=so.

So, your concern is somehow abc.soa? If so, we need to fix is_extension_exist.
Will check what's going on here.

> 
> commit 4a67d9b07ac8dce7f1034e0d887f2f4ee00fe118
> Author: Chao Yu <chao@kernel.org>
> Date:   Tue May 18 17:54:58 2021 +0800
> 
>     f2fs: compress: fix to disallow temp extension
> 
>     This patch restricts to configure compress extension as format of:
> 
>      [filename + '.' + extension]
> 
>     rather than:
> 
>      [filename + '.' + extension + (optional: '.' + temp extension)]
> 
>     in order to avoid to enable compression incorrectly:
> 
>     1. compress_extension=so
>     2. touch file.soa
>     3. touch file.so.tmp
> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/namei.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 3e35eb7dbb8f..cdc94c8e60f7 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -161,7 +161,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
> >   	/* Compress wanting extension. */
> >   	for (i = 0; i < ext_cnt; i++) {
> > -		if (is_extension_exist(name, ext[i], false)) {
> > +		if (is_extension_exist(name, ext[i], true)) {
> >   			set_compress_context(inode);
> >   			return;
> >   		}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
