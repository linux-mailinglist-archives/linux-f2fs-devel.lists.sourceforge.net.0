Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB469829D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 18:47:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSLs4-00048v-5j;
	Wed, 15 Feb 2023 17:47:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pSLs3-00048p-5n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 17:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5poC0LpVhAarYkprGC+MonB+HsITDl9SkZOBG7j9LOY=; b=ELGPRvJne9VnSj8uwX6cUo9nuP
 iIgG0K5I+s2cpmQlicVtGfwpGSaDSZjxKT2prQxUGBhxztmZ1wnKBWzBkoio67YcaviAi7YAuLX22
 pbP/B79UIJtFUSBJW4Tu35hwLTiJU9cAeRgbJOuo+BdyZk5Hwc01cl7RWQYigMKlweIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5poC0LpVhAarYkprGC+MonB+HsITDl9SkZOBG7j9LOY=; b=RixrkBCsP4vyD9LDWfJu/zf89J
 Qj6qHgao+OT7WP0veT8+MxRyun07L+F0xjy/BbURgz3lZ0sZtH691gA6Lwez3Y8WAoBlYtMBHsoLt
 L3m5vl3TFMuWLJ3fTxsCZGHLLddXnb4Nj8iCmn2uD/fMmTW0+T32B42WsaBY+ftIdSAg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSLs1-0006Ti-4t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 17:47:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FD3161D0A;
 Wed, 15 Feb 2023 17:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21BCC433EF;
 Wed, 15 Feb 2023 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676483219;
 bh=lJ13sfplKi9wVIbjK9iTUN/dZmrxheytiIyXNADUn+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLCm5calblgP6bIiv0xKzWrdZQoK0KViVHN4fe+W3z6MtQ9NcAdSiP6/ilDmr0BFi
 cKU8+vWInxpVVJSMzdJWFKw2uyvl6P8aqVVDVwnBmybMsyOXZKFB/bfXJJGys9KM+R
 av73wr7ZdWNMgGwFWljrKxDFVOG2WM7cMRUCCQIC9/D5RygM8i/oCJbOmzOVD+d81y
 aNRMTIW1liJrwwB2uT0Vg1G3ME383ECRY5iTQzjwnJgJWc65IKe9yn8HvXI2TKlIN8
 jZOwwfP4rAG8+DNpyvLqEEfnW8OdrWKA6KLyhYHVsp8QaG0b9PHCY7TjrggXwXsds0
 bsmuesZlbI2sw==
Date: Wed, 15 Feb 2023 09:46:58 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+0aklEpswHoxlF2@google.com>
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
 <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
 <Y+p4jezz5asWoPhu@google.com>
 <abb12474-f338-dedf-115b-da70e4946cec@kernel.org>
 <Y+vN18flpTqWwvll@google.com>
 <10a80557-50f6-f563-56ca-eb3df7e4ea93@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10a80557-50f6-f563-56ca-eb3df7e4ea93@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/15, Chao Yu wrote: > On 2023/2/15 2:07, Jaegeuk Kim
 wrote: > > On 02/14, Chao Yu wrote: > > > On 2023/2/14 1:51, Jaegeuk Kim wrote:
 > > > > On 02/13, Chao Yu wrote: > > > > > On 2023/2/9 11:20, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSLs1-0006Ti-4t
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

On 02/15, Chao Yu wrote:
> On 2023/2/15 2:07, Jaegeuk Kim wrote:
> > On 02/14, Chao Yu wrote:
> > > On 2023/2/14 1:51, Jaegeuk Kim wrote:
> > > > On 02/13, Chao Yu wrote:
> > > > > On 2023/2/9 11:20, Thomas Wei=DFschuh wrote:
> > > > > > Since commit ee6d3dd4ed48 ("driver core: make kobj_type constan=
t.")
> > > > > > the driver core allows the usage of const struct kobj_type.
> > > > > > =

> > > > > > Take advantage of this to constify the structure definitions to=
 prevent
> > > > > > modification at runtime.
> > > > > > =

> > > > > > Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> > > > > =

> > > > > Reviewed-by: Chao Yu <chao@kernel.org>
> > > > =

> > > > Hi Chao,
> > > > =

> > > > Note that, next time, I won't apply/modify any patches merged in -d=
ev,
> > > > unless it has a problem.
> > > =

> > > Hi Jaegeuk,
> > > =

> > > Oh, any particular reason, to avoid unneeded commit id change when th=
e time is
> > > close to merge window?
> > =

> > Hi Chao,
> > =

> > I'm trying to avoid breaking the -next branch.
> =

> Jaegeuk, so why do we need to avoid breaking -next branch? I didn't get i=
t. :-(

That's not for linux-next, but my -next work.

> =

> > =

> > > =

> > > Is there any period of grace before merging patches from dev-test bra=
nch into dev
> > > branch? Maybe a week is reasonable? so I may have time to catch up in=
 time.
> > =

> > No rule, but I'm trying to wait for several days while running my local=
 tests.
> > If the patch looks okay, sometimes I'll queue it right away.
> =

> Sure, not problem.
> =

> Thanks,
> =

> > =

> > Thanks,
> > =

> > > =

> > > Thanks,
> > > =

> > > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
