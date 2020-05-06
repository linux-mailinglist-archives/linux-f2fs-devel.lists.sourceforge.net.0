Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B211C731B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 16:42:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWLFM-0002IK-9A; Wed, 06 May 2020 14:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWLFK-0002Hq-V6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWXCyXYhoJ6soDqPUgX4G2gGf8WoPCs2FQ2pOWgf2OE=; b=fAF0gwYzEfEv06ONqMHBBbmyqR
 pD3EFcarZ86xsbYn18bCr5DAd0/8ALejHEeBpwWSPpGAyAgpA1rPaF4UtBNze6pWniAjHFyqSgHK5
 YyszlHNtfWGO1EAwpwue1qGa1/6nu2fNPDDfp54rfWrQtWo2Jy/3kOzdV6m+L9D5kECE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWXCyXYhoJ6soDqPUgX4G2gGf8WoPCs2FQ2pOWgf2OE=; b=jqfXRi/gr0VHDOii+2yMYnS+XT
 QKwvwqOFEq8wZ2QbmnZSIC5H0ESV3O1H67sQn7yaqYuhmICaAY7qF/VQgoFwGyG2vtGG2mG4OKsWR
 EA3Crzbr3X525/k0JBxo2SUHN6R8U3/C4Z2ctYbmiUhiBiflPEX8UKVTxgsCmFfhosz8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWLFJ-00Cytr-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:42:02 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1729620936;
 Wed,  6 May 2020 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588776116;
 bh=PWlrTy5kTNmuJs1QvlitmYALV23Ws9TQULSu0qf5rLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLztY7TtKKmW311lmBZgCaoaYckI+jLMQt3Ns8IXGsvUrG4dvzvOm4PunQVCSHO5K
 Oyx+Xuq5sPQuZWRE+5pbM+I2uFXnMCVYA6syZ4QjxgWwhY0bAbG2GlkDOthSOWnYrs
 BjpK30zIpypBl6oXrgNzj0FMGNyBOaSl2z2IgADo=
Date: Wed, 6 May 2020 07:41:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200506144155.GC107238@google.com>
References: <20200501233523.50037-1-ebiggers@kernel.org>
 <d44cb4c9-ad2b-2f21-06eb-ad386ebf2c18@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d44cb4c9-ad2b-2f21-06eb-ad386ebf2c18@huawei.com>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1jWLFJ-00Cytr-Ns
Subject: Re: [f2fs-dev] [PATCH] f2fs: use strcmp() in parse_options()
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/06, Chao Yu wrote:
> On 2020/5/2 7:35, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Remove the pointless string length checks.  Just use strcmp().
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> [...]
> 
> > -			} else if (strlen(name) == 4 &&
> > -					!strcmp(name, "zstd")) {
> > +			} else if (!strcmp(name, "zstd")) {
> >  				F2FS_OPTION(sbi).compress_algorithm =
> >  								COMPRESS_ZSTD;
> 
> lzo-rle will be added, Jaegeuk, please notice that the late applied patch
> should adjust a bit here.

Sure.

> 
> Thanks,
> 
> >  			} else {
> > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
