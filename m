Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E65B525A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 02:54:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXXie-0002mc-4O;
	Mon, 12 Sep 2022 00:54:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oXXic-0002mW-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 00:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJtnBsrJ6PFSqYFNEgfKJ7NF+9T6DiCRBeZfcGHjna0=; b=BkzxIgWpQC1Ubn9/Y6okl8VY6+
 nyWpMypwcXGTSwkaoCl1/fd2qFOrjDk1KxeqGkk8BjQYEUcWRl8+NAJ82Wg0NaIGFqKQdnSdUKv9P
 K3pZhp468cRWVAn/kd43g6i7TOgRKX0uPs/FbMMdyUIOxSYGIpiDBGRYtR/WMwf3BdxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJtnBsrJ6PFSqYFNEgfKJ7NF+9T6DiCRBeZfcGHjna0=; b=bsKd9vmK6sCbWrQBe3g5qVii6A
 Yv5jfzF0VmRXCQficzfpXTzwPaDvxElOz5m3gxmvuFCgKa7FUpzXAoCIn2VHJ4awyaOWd9tdQwyHW
 FtbZ3w0DJXcTZV9TLgTi23I59Ot9nDjrpDUORx+VDxK9AaMBYMcuTfTzciwVtyfl6uGg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXXiX-005OAB-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 00:54:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6578161149;
 Mon, 12 Sep 2022 00:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F45C433D6;
 Mon, 12 Sep 2022 00:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662944059;
 bh=WDVtmnzEsaEU55TuvLxBRymxTuYaVUC9hgjRIe0bHt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZoxnvrqSSY20wV65g7z6/rwjE02vykYR2j0xgsMFiTFS3wcFoXQgc7ddRv8HVfb3f
 Kwr6X2fw2mafz42Qbx5YdEIQQnsRulU5GDprmsG01tejmSwgFvr4Jx1B47ZL2SiCcG
 Eyn7qIRIzb0YqpOmcociLL5XyxfDzbh0zkynyL7M0TA1icIoVgkGtGXOVtBvjI1oIN
 Iw8cbqxwN+hQUZueBTkmVgQV2RAaCxx5KdzDrA5EkbLK7xfUqnQisUx0ldrLzg3M1r
 oaH/BIP5FZbUDfOMoORvOPkiaFMoOUQT1g/YGC/jN8fIFwm06y/Lc3y+CcDBzZnAwH
 78iOtWwzF2Ivg==
Date: Sun, 11 Sep 2022 19:54:12 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Message-ID: <Yx6DNIorJ86IWk5q@quark>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <YxfE8zjqkT6Zn+Vn@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxfE8zjqkT6Zn+Vn@quark>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 06, 2022 at 03:08:51PM -0700, Eric Biggers wrote:
 > On Fri, Aug 26, 2022 at 11:58:43PM -0700, Eric Biggers wrote: > > This
 patchset makes the statx() system call return direct I/O (DIO) > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXXiX-005OAB-1Q
Subject: Re: [f2fs-dev] [PATCH v5 0/8] make statx() return DIO alignment
 information
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 06, 2022 at 03:08:51PM -0700, Eric Biggers wrote:
> On Fri, Aug 26, 2022 at 11:58:43PM -0700, Eric Biggers wrote:
> > This patchset makes the statx() system call return direct I/O (DIO)
> > alignment information.  This allows userspace to easily determine
> > whether a file supports DIO, and if so with what alignment restrictions.
> 
> Al, any thoughts on this patchset, and do you plan to apply it for 6.1?  Ideally
> this would go through the VFS tree.  If not, I suppose I'll need to have it
> added to linux-next and send the pull request myself.
> 
> - Eric

Seems that it's up to me, then.

Stephen, can you add my git branch for this patchset to linux-next?

URL: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
Branch: statx-dioalign

This is targeting the 6.1 merge window with a pull request to Linus.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
