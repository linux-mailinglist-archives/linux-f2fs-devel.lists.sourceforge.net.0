Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD706B4008
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 14:16:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pacbJ-0000eL-Va;
	Fri, 10 Mar 2023 13:16:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <greg@kroah.com>) id 1pacbH-0000e1-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 13:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hbZNGAH3VbTqYHe4cWGMIuHI9sJyZoDcjp+RPcyk/M=; b=CjKNqLZQ3TAnbERk96/lf05Z1/
 q1+9TF97aUQkFxYIiJqnMVOkhYJp+gvcVzwyoqNVhMHlzcF+tLTLlhZ44BnNMTmAp56VOyBOuPGJ7
 DlYm7B97cNJPqKybKLUR9HrHrG3g9HcICn26DQ/YXkUTT+SuyyBAi0yuLgen4tldbOGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4hbZNGAH3VbTqYHe4cWGMIuHI9sJyZoDcjp+RPcyk/M=; b=geEETS+e8fCW0GIXgLzFN5jano
 OKXa0cGSaHUAr+5jk5qwKxtbmZlUZiixUwOa/QuaJGfUBXuMvU+GAG3UlhuJ/FP1d7hSxZSV/b+TR
 SfXrfNd6anZ0KnuJNKHiRso1m3bpQm8F22/ec1DECoQI1cnpbZYe/cvhniJ1uG7iRH+g=;
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pacbE-003X2L-Pz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 13:16:00 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DF456320082A;
 Fri, 10 Mar 2023 07:57:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Mar 2023 07:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1678453057; x=1678539457; bh=4h
 bZNGAH3VbTqYHe4cWGMIuHI9sJyZoDcjp+RPcyk/M=; b=aBRmzaxBq2hjxCES4c
 yAJkgqHVHuVcZXnuUCAxe6iV/ug2/2KOZXUl/X0Dr0cxGHIhqyrRylTIOIKss0WF
 TXSPYSosNQsJQsFK+QTgvjMnn1kogQghYpduGhOSJSiybQ+s86Ys7yU6rypMncjq
 SxNfFCxbSnEMp7wqKJ3LOkNKn8v//xd8Vc+VSpyE6SQuGL0bs3R5DEzFJ19Ei4OQ
 nWR+4efcxF0EnFYL9bK5tLYyIqnJMV+yC8Cg8eNVR/I31yQn6IC83CLsw76eagof
 D84wd9yMpkizEJSF4vd4Gk91OpQvZv1cfEuMMINVzZUkDblIhpjqgEuzvRJVqgdG
 A02A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678453057; x=1678539457; bh=4hbZNGAH3VbTq
 YHe4cWGMIuHI9sJyZoDcjp+RPcyk/M=; b=F2oJ9DJPLUOtBGOkYzglEiaxsYNW3
 fPhQHX4BN42oUcESpz9iec+edGOwmfDkEYrOzLXBAS/2cVUUVNLrxy0rFTvlTbKo
 SNB/OXq7WHgK8o3tniEl/H9TFM/sP78QFnrGSoPEt/JI3CZGOHPiry94syXpJNtK
 8tMOCGm0vP4Ya0smbCdYi1G/yWyLDq+tXf1WKDNBOb8GlA0UtS0vlMj+XQhzRgTR
 nKGy1fxTQZ0R1uXvr677YxttAONx/hMPq+Ldfx80ZZY2eiuriPLNsn3Pr09rk1xz
 WOF9F2hqGthZKynk8/+IUbE6J7uXbYmP47Zr2lnytBU5AtPt9LLQxtG4w==
X-ME-Sender: <xms:QSkLZE3X5tC-lPUXdmHvuq-W-xFvl_xQih9wwhobj6UVCOuej68_ew>
 <xme:QSkLZPH1quDfzecAsYWGhw9Icl_QXh-NphCei0dhnaFYmZJE3HJyix4VTU-0viw8y
 6-NwN1VpqSrOg>
X-ME-Received: <xmr:QSkLZM6VTfF4PwudjPjE5-bAjaipqTePRFSLpuXkXRZL1yJMglg1V5LMZ4z4hmayKOMyyjOVSbVdUf5WAt5y1ff8gvbQpFKUyLjQRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddukedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:QSkLZN1Ia3XEHfYA-T3leHNGEyizo-tfco0g-YyWms51E6Nmcin9RA>
 <xmx:QSkLZHFYJHDg5IoVpv78vb7gHbb448rUSw-BgcTrwbTLHdgVfTcIwg>
 <xmx:QSkLZG_KAW57kJAHjjtakvDJn1wG6ibnATXkqe5d94gorzGBGfQ_sw>
 <xmx:QSkLZEe9YT5C22GILSpEi99odMnGKYnEeveGjOTM-W0B7Q3SWJPUhg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Mar 2023 07:57:36 -0500 (EST)
Date: Fri, 10 Mar 2023 13:57:34 +0100
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZAspPgX+RazeDcgx@kroah.com>
References: <20230308061746.711142-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230308061746.711142-1-ebiggers@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 07, 2023 at 10:17:46PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > commit
 844545c51a5b2a524b22a2fe9d0b353b827d24b4
 upstream. > > When writing a page from an e [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.19 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pacbE-003X2L-Pz
Subject: Re: [f2fs-dev] [PATCH 4.19] f2fs: fix cgroup writeback accounting
 with fs-layer encryption
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 07, 2023 at 10:17:46PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> commit 844545c51a5b2a524b22a2fe9d0b353b827d24b4 upstream.
> 
> When writing a page from an encrypted file that is using
> filesystem-layer encryption (not inline encryption), f2fs encrypts the
> pagecache page into a bounce page, then writes the bounce page.
> 
> It also passes the bounce page to wbc_account_cgroup_owner().  That's
> incorrect, because the bounce page is a newly allocated temporary page
> that doesn't have the memory cgroup of the original pagecache page.
> This makes wbc_account_cgroup_owner() not account the I/O to the owner
> of the pagecache page as it should.
> 
> Fix this by always passing the pagecache page to
> wbc_account_cgroup_owner().
> 
> Fixes: 578c647879f7 ("f2fs: implement cgroup writeback support")
> Cc: stable@vger.kernel.org
> Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
