Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20F64F772
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 04:53:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6OGR-0001zK-Ku;
	Sat, 17 Dec 2022 03:53:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p6OGQ-0001zE-8H
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 03:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aQSOprobNbd+6jrn5QD+kNnzjk79RkuNsA0skg8Tj8=; b=HJvcuw3x7305X3gqbcQLzC7FsG
 ZYyPYBZpHj5d+2KFQw1LLLcvDVf99bLYsyqgaGPyipHe0IH9dUUd2iELT3a3fvwObp/HbzJfq+N+/
 bjzFXjvMZ7Hv5Qfa2br4hH1CPlA19EssbBwDhijsRdv2JGHmKDRSXUEKwDxKPNGJThDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4aQSOprobNbd+6jrn5QD+kNnzjk79RkuNsA0skg8Tj8=; b=mdLujoNpp9tD13RbrE8BqEubuZ
 uVWIUoki4mLr60OuMibI03FG3oEQS3ndNh7t5IOo90HglW6WywiyWDVVBzVHBi4aWKbxITzu5uqpU
 FsWj4MDdiStXpbxEOpkO2SsQoWCpfKPhSrSnwTkwA0jUi0HEyzeyScoLIPClP55qdOqY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6OGL-00081Q-9Z for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 03:53:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4082622FB;
 Sat, 17 Dec 2022 03:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2F8C433EF;
 Sat, 17 Dec 2022 03:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671249190;
 bh=tvtSBxOjRjr8AD1Nit2OYvq2xfn8/939ipq48vK7DLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQ2qyig1Ro+5frbEspzt9RXufwAwYshGg5d/dnepFr7yiNB6dz+tgePcHbW3H1RT7
 8d6i52uzaJJyvYaWAVgr19fW4UdciX/9S1s+C6SNHKoGAXFV0QFHu8bwtVAcClSo8p
 kOV6h2wVMqvmCis34nqkPTeRqwqxPC+GsoBhuGquiUVVdiDW6Z/m5tDHT/+79HUzsV
 pjzmUlxnremRXcnNzaH3wrqw2Hi2D++kss1HCA8m3PNijYr8JELSHf54b1fzz00O9s
 DZ8XBgSOtMmMoBQ+jkerirWRfZ1IxljS3goEfWl9Dz2gXH15Y5aTcWjR4a40EKqkwF
 mENXqYKlr8Vag==
Date: Fri, 16 Dec 2022 19:53:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luca Boccassi <bluca@debian.org>
Message-ID: <Y509I/WlKJWwRhM2@sol.localdomain>
References: <20221208033523.122642-1-ebiggers@kernel.org>
 <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
 <Y5zd6ucBc20CV7Le@sol.localdomain>
 <CAMw=ZnS5mXpQYtGHEK7-Q-VEojhooXiQVsGPT3e8NCW8uxnWyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMw=ZnS5mXpQYtGHEK7-Q-VEojhooXiQVsGPT3e8NCW8uxnWyA@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 17, 2022 at 02:06:04AM +0000,
 Luca Boccassi wrote:
 > On Fri, 16 Dec 2022 at 21:06, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > On Thu, Dec 08, 2022 at 08:42:56PM +0000, Luca Boccassi [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6OGL-00081Q-9Z
Subject: Re: [f2fs-dev] [PATCH] fsverity: don't check builtin signatures
 when require_signatures=0
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Dec 17, 2022 at 02:06:04AM +0000, Luca Boccassi wrote:
> On Fri, 16 Dec 2022 at 21:06, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Thu, Dec 08, 2022 at 08:42:56PM +0000, Luca Boccassi wrote:
> > > On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > An issue that arises when migrating from builtin signatures to userspace
> > > > signatures is that existing files that have builtin signatures cannot be
> > > > opened unless either CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled or
> > > > the signing certificate is left in the .fs-verity keyring.
> > > >
> > > > Since builtin signatures provide no security benefit when
> > > > fs.verity.require_signatures=0 anyway, let's just skip the signature
> > > > verification in this case.
> > > >
> > > > Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> > > > Cc: <stable@vger.kernel.org> # v5.4+
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >  fs/verity/signature.c | 18 ++++++++++++++++--
> > > >  1 file changed, 16 insertions(+), 2 deletions(-)
> > >
> > > Acked-by: Luca Boccassi <bluca@debian.org>
> >
> > So if I can't apply
> > https://lore.kernel.org/linux-fscrypt/20221208033548.122704-1-ebiggers@kernel.org
> > ("fsverity: mark builtin signatures as deprecated") due to IPE, wouldn't I not
> > be able to apply this patch either?  Surely IPE isn't depending on
> > fs.verity.require_signatures=1, given that it enforces the policy itself?
> 
> I'm not sure what you mean? Skipping verification when this syscfg is
> disabled makes sense to me, as you noted it doesn't serve any purpose
> in that case.

Currently, fsverity builtin signatures are only useful if
fs.verity.require_signatures is set to 1 *and* userspace actually checks that
files have fsverity enabled.  However, IPE would change that if it actually gets
merged upstream, at least based on the version that was most recently sent out.
It would introduce a use of fsverity builtin signatures directly in the kernel
(https://lore.kernel.org/r/1654714889-26728-14-git-send-email-deven.desai@linux.microsoft.com
and
https://lore.kernel.org/r/1654714889-26728-15-git-send-email-deven.desai@linux.microsoft.com).

IIUC, the IPE patches add code that checks whether a file has a fsverity builtin
signature, and if so it assumes that it was verified by fs/verity/ and creates a
*boolean* file property "fsverity_signature" for IPE to operate on.

Since the IPE patches check for the presence of a builtin signature directly,
instead of indirectly by checking whether the inode has fsverity enabled at all,
there would be no need for the fs.verity.require_signatures setting with IPE.

The IPE patches do assume that the signature, if present, always gets verified
by fs/verity/.  That's what this patch would break.

Of course, for upstream I shouldn't care about breaking out-of-tree code.  So I
could apply this anyway.  But I'd at least like to be consistent.  If "fsverity:
mark builtin signatures as deprecated" isn't going to be applied because of IPE,
then I'd think this patch shouldn't be applied either, for the same reason...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
