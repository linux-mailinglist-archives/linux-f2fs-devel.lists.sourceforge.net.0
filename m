Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB4C7B28F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 18:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFWF0SlnAyeutgYbXNG8S/gbHnTD6nDMsjUz1PsnCOs=; b=H+W461msu2z84bZrmqr2EZeAy3
	7ajpaSfJKZITcFQ6RYQ3gmqsR92dWF8rWXoY5Spx/XKey5zojKxBd93pfu8PzPfGz0MEOHu3EEXf4
	wnxbTy9eha1rnhBkjwrY5aXeULzbFR1H6XKLYM3o0mTuB2HOdkIN+wUIMPAPXJT6qoXY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMVQ2-0006Jg-V5;
	Fri, 21 Nov 2025 17:59:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMVQ1-0006Ja-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 17:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9RJHXei8D0a8HmCAuzDkZPXzdHEI8z34ECclW7GXg4=; b=hvkCXuuTXAdG2kK9TjIMUNtpbj
 a7CeK6pGz4pDFTzbErfcUOfrLvRm43ThKARGV03K1+Ms+E5sbC/+pKgfbOJWooKZiFgZDrAhXRReI
 9VFjaOrn7J5+aGTX/THJGjCTwp/WS1/T8rKh/aVsXQ+k7P6IYCofbrdzBU8xAl1EvJHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9RJHXei8D0a8HmCAuzDkZPXzdHEI8z34ECclW7GXg4=; b=XUszuqwOowur+y0cbxpl348QZ9
 vcpwXIGeChCCLEsc2BYy8T7/rkQMPrOQhNUcshzbbIWiz8nSbKT7CYO8usm+iF5Y66KuwVSyRvp+g
 ltYF2mOf5eTm3b7XHsjg6LjlS3Riq3JBxooX4FoNRVyWap8Q24MRs/hE/WQh4+pHY+1M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMVQ0-0007a4-MT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 17:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10F5960139;
 Fri, 21 Nov 2025 17:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680B9C116C6;
 Fri, 21 Nov 2025 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763747965;
 bh=qw8xtHsNX2lkUcj9Nrr20MMZRduTEzBJEup2i4clE4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYf5he1ouY16pWpPbCphnFCzi5qQppitk3XAQL3OY93xCeJU0xoNdsNRFgvS/NnhH
 0YpasOAZ0HhuSfTByCa0ss1U24klpZ3aM/XAbOET3iT4hfbZGg/FAwR5wEpS0IAAbi
 RZCYTMPR2WHkACmI+AQB7vrdWndqsLBf13OpjNUSJeL5epvNfWZfhFJNmpWOvHhxdR
 HwMJNUMl1yVsSflLSvxfTLwdCn3UVAqczwuB4J4yJ6IRqXvHLj4SdxVhKIB+1oR6DQ
 JfTuWW8ivxMI3IK3MhTtBxcpf7wefHmM/3gXH67nGuMw1kp1VoXChjpULq/rposUlv
 HKY+3OMpDXcUw==
Date: Fri, 21 Nov 2025 17:59:23 +0000
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <aSCoe_0bMTaqQ6tD@google.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
 <87fra7tgyk.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fra7tgyk.fsf@trenco.lwn.net>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21,
 Jonathan Corbet wrote: > Masaharu Noguchi <nogunix@gmail.com>
 writes: > > > Sphinx's LaTeX builder fails when converting the nested ASCII
 tables in > > f2fs.rst, producing the following erro [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMVQ0-0007a4-MT
Subject: Re: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
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
Cc: akiyks@gmail.com, Masaharu Noguchi <nogunix@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Jonathan Corbet wrote:
> Masaharu Noguchi <nogunix@gmail.com> writes:
> 
> > Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> > f2fs.rst, producing the following error:
> >
> >   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
> >
> > Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> > render them verbatim. This prevents nested longtables and fixes the PDF
> > build failure on Sphinx 8.2.x.
> >
> > Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> 
> Jaegeuk, are you planning to pick this up, or should I take it through
> docs?

Let me queue this in f2fs.git. May I get your SOB?

> 
> Thanks,
> 
> jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
