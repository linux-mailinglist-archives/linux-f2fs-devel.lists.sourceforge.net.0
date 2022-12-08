Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21785647789
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 21:55:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3Nvo-00049H-1b;
	Thu, 08 Dec 2022 20:55:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p3Nvm-00049B-Ee
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 20:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ye5/i5vKiKHdXu1tq/AokYNcDLYuZn5TQQWUufUrro4=; b=OcM6GxuRPwJxFvOHF04F86W8RC
 Ba7sayFcJ66AyoGYIcZytEhY1VKiS/8S/R3UCrdmqklQ/hVn+CoqYCrzxku4Jf+xVRP7nxR+vLfmu
 N/v/iJqJ4TcYxuSPRxebBytsMp7I53phS1IJjJttZpnI284rJrLwwOAqm1Cv8TmR/uQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ye5/i5vKiKHdXu1tq/AokYNcDLYuZn5TQQWUufUrro4=; b=Kz/vh4ojhK1oET082ehrvzsEQK
 9L6JgABLeBRXMDEiRX5I1Qe4jxh7OoYuuZL8o29c2Zy5OfqB4PFc2nF7iIOEECRX1GFxV79m0ISsf
 O+boFZsaHqD5NACxpntsMg6RMqrBrHZDnShBDxkV1r25Ey56KKSTXmUec6QGE6RYp9Pk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3Nvh-0008KK-Hh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 20:55:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24C1661F2E;
 Thu,  8 Dec 2022 20:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44762C433F0;
 Thu,  8 Dec 2022 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670532935;
 bh=rbuH8ivUiGqEUNAE8E1MZzREUenrlcc3yHgPx3wu918=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3riEFg9pwcCA2/bl24yKGEzPVFIY31TIBifX49pOMVNxi4yRcVO/qrZYfFD6FqZI
 yeEg/YOK8tVYivQ4DhG8zU90S/HBfVqQ6Q6E3f2EFAzuNSIQaRS7DnLSbGglZV27+/
 xtSXDIhRE5hNnMWA+4dzYFn/J788Sl/AecJvpIh4wojkqI2fwiHo5WuUHt5oWyJG5P
 L5EPtz3Z7V8EskcDOPe8U1y+xrPJXtv5L4i9NtD/ferwJluJoZ9co8H9aYcuQpwE0s
 AmHflod78yvrdz1ynEXqHiljwBzSjO2SEVqWrBbM55mLL/XBamdnD5BpX3W6Zx9wB4
 iAsL13h/Y3TMw==
Date: Thu, 8 Dec 2022 12:55:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luca Boccassi <bluca@debian.org>
Message-ID: <Y5JPRW+9dt28JpZ7@sol.localdomain>
References: <20221208033548.122704-1-ebiggers@kernel.org>
 <eea9b4dc9314da2de39b4181a4dac59fda8b0754.camel@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eea9b4dc9314da2de39b4181a4dac59fda8b0754.camel@debian.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 08, 2022 at 10:43:01AM +0000,
 Luca Boccassi wrote:
 > On Wed, 2022-12-07 at 19:35 -0800, Eric Biggers wrote: > > From: Eric Biggers
 <ebiggers@google.com> > > > > fsverity builtin signatures [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fedoraproject.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3Nvh-0008KK-Hh
Subject: Re: [f2fs-dev] [PATCH] fsverity: mark builtin signatures as
 deprecated
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
Cc: Jes Sorensen <jsorensen@meta.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 08, 2022 at 10:43:01AM +0000, Luca Boccassi wrote:
> On Wed, 2022-12-07 at 19:35 -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > fsverity builtin signatures, at least as currently implemented, are a
> > mistake and should not be used.  They mix the authentication policy
> > between the kernel and userspace, which is not a clean design and causes
> > confusion.  For builtin signatures to actually provide any security
> > benefit, userspace still has to enforce that specific files have
> > fsverity enabled.  Since userspace needs to do this, a better design is
> > to have that same userspace code do the signature check too.
> > 
> > That allows better signature formats and algorithms to be used, avoiding
> > in-kernel parsing of the notoriously bad PKCS#7 format.  It is also
> > needed anyway when different keys need to be trusted for different
> > files, or when it's desired to use fsverity for integrity-only or
> > auditing on some files and for authenticity on other files.  Basically,
> > the builtin signatures don't work for any nontrivial use case.
> > 
> > (IMA appraisal is another alternative.  It goes in the opposite
> > direction -- the full policy is moved into the kernel.)
> > 
> > For these reasons, the master branch of AOSP no longer uses builtin
> > signatures.  It still uses fsverity for some files, but signatures are
> > verified in userspace when needed.
> > 
> > None of the public uses of builtin signatures outside Android seem to
> > have gotten going, either.  Support for builtin signatures was added to
> > RPM.  However, https://fedoraproject.org/wiki/Changes/FsVerityRPM was
> > subsequently rejected from Fedora and seems to have been abandoned.
> > There is also https://github.com/ostreedev/ostree/pull/2269, which was
> > never merged.  Neither proposal mentioned a plan to set
> > fs.verity.require_signatures=1 and enforce that files have fs-verity
> > enabled -- so, they would have had no security benefit on their own.
> > 
> > I'd be glad to hear about any other users of builtin signatures that may
> > exist, and help with the details of what should be used instead.
> > 
> > Anyway, the feature can't simply be removed, due to the need to maintain
> > backwards compatibility.  But let's at least make it clear that it's
> > deprecated.  Update the documentation accordingly, and rename the
> > kconfig option to CONFIG_FS_VERITY_DEPRECATED_BUILTINSIG.  Also remove
> > the kconfig option from the s390 defconfigs, as it's unneeded there.
> 
> Hi,
> 
> Thanks for starting this discussion, it's an interesting topic.
> 
> At MSFT we use fsverity in production, with signatures enforced by the
> kernel (and policy enforced by the IPE LSM). It's just too easy to fool
> userspace with well-timed swaps and who knows what else. This is not
> any different from dm-verity from our POV, it complements it. I very
> much want the kernel to be in charge of verification and validation, at
> the time of use.

Well, IPE is not upstream, and it duplicates functionality that already exists
upstream (IMA appraisal).  So from an upstream perspective it doesn't really
matter currently.  That's interesting that you've already deployed IPE in
production anyway.  To re-iterate my question at
https://lore.kernel.org/r/YqKGcdM3t5gjqBpq@sol.localdomain which was ignored,
can you elaborate on why IPE should exist when IMA appraisal already exists (and
already supports fsverity), and why IPE uses the fsverity builtin signatures?
And are you sure that X.509 and PKCS#7 should be used in a new system?  These
days, if you go through any sort of crypto or security review, you will be told
not to use those formats since they are overly complex and prone to bugs.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
