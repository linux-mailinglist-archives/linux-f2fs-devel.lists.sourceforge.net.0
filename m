Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC6694E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 18:51:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRcz3-0006vp-WD;
	Mon, 13 Feb 2023 17:51:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pRcz1-0006vi-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8tG5RB6ejoZkC4llb8X9dfqftCPALm27DFxx85qnu2A=; b=GGJ0rRaBR9KswnQQbArUV5UN0H
 JpbI8q5Mo2RiGcEIdGcpyqc2zwVLoXyem5cE7knbsKie8QZojx8mn/cmAy4ljF/dNKYHssYVud7ch
 iwPrUQy6rSiyL6nGUpo9aQ9am4VabExOqXgiQwXBLx9TP6s6XjTIkmuKfcmwRJqaBp2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8tG5RB6ejoZkC4llb8X9dfqftCPALm27DFxx85qnu2A=; b=BfgRWeUYHGKGh0iHYeSjIc1v04
 gLNUWJGDpGS7f4PPl+zB43xfqYjbWbIGcsRQiAq856GEce53QpbF3WwVmXHSATVPsc07kAqb2vzUk
 rSmRtkZekCLyVk6ct3rQzjwaOtNNIhgbdyKY3ebU1QMu5twRn8TaI5C/ajM/vetnLpo8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRcyz-003Fqb-VB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:51:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CD1261206;
 Mon, 13 Feb 2023 17:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA75C433D2;
 Mon, 13 Feb 2023 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676310671;
 bh=CsA1YC3h9+17N2G4n4oB6a9IScP2GHFSVsLcAWvNOv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mglqRwxvj8ZNNWXqjBCM25H2ljZLkeKgpNQA9pPqfev/fXL659WjuC0fQK07hYmSA
 xhmVMR/z/0gnclYtSCmJLCdf9m5VDlTEMPKhvO0TrjcV0eVk0C5Z8kA8ttEH5+vwJN
 al7LcJUZm+DuL2N3l2HashUdqb5xrwmuHACAioIxiBT7VCQuSlpr/rDDF9LM5ESkvA
 kXM2u1Xe8zff+OjVrJX9dcUiCA3Y3hgFsO1UTNmIFg/vpOKX+DsUYAxUNkbgrB9gM/
 ZJ9Egcpz1Omv8HJj0Vyij21jO3k0nT4o+foUaHOaO/BsZD1sFSOzijMGW9jiZsFf+Y
 sHdR10yVsIyfQ==
Date: Mon, 13 Feb 2023 09:51:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+p4jezz5asWoPhu@google.com>
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
 <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 02/13, Chao Yu wrote: > On 2023/2/9 11:20, Thomas Weißschuh
    wrote: > > Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
    > > the driver core allows the usage of const struct kobj_ [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRcyz-003Fqb-VB
Subject: Re: [f2fs-dev] [PATCH] f2fs: make kobj_type structures constant
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
Cc: linux-kernel@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/13, Chao Yu wrote:
> On 2023/2/9 11:20, Thomas Wei=DFschuh wrote:
> > Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> > the driver core allows the usage of const struct kobj_type.
> > =

> > Take advantage of this to constify the structure definitions to prevent
> > modification at runtime.
> > =

> > Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> =

> Reviewed-by: Chao Yu <chao@kernel.org>

Hi Chao,

Note that, next time, I won't apply/modify any patches merged in -dev,
unless it has a problem.

Thanks,

> =

> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
