Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2C648AC9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 23:36:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3lyH-0002nq-Fs;
	Fri, 09 Dec 2022 22:35:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wufan@linux.microsoft.com>) id 1p3lyF-0002nj-Gg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 22:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2p3lV/i3GYggsKEuSqhvyowXaG6c8Gams0z3H4jil0=; b=aozxH0IYi66uSm0bDuhnH35jTr
 dpOuga7QWB6Pp2PVJv6pmEH8Xi/gRUHjJnrF7d8d//i+mm6tf+by0eVnZruTYBsHYqEPu/Ow0XTsB
 327eFkvjI/7bBKHCacEDzhkiS2uJFeXAphEaduLfgbaFlcjcs/B1vqvUsE/IELr78aVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e2p3lV/i3GYggsKEuSqhvyowXaG6c8Gams0z3H4jil0=; b=fLQhepTywaY/qBspof9zy4ICEV
 yX31rJaRf8p+6ofLAUxbBP5nUERBX3aSgHcb4lNKb/KyRiJfq7/CIn5Vcl/i7X+MAvbc+Gr+md+i/
 tBGhRmLFDyu/shgeoiO2qCW1m4cTih1nlYBmGXg+A4wG0/UaeN60hQMrzI1fnQInHKYg=;
Received: from linux.microsoft.com ([13.77.154.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1p3ly9-00BySB-B0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 22:35:55 +0000
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 7DF0F20B6C40; Fri,  9 Dec 2022 14:17:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7DF0F20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1670624239;
 bh=e2p3lV/i3GYggsKEuSqhvyowXaG6c8Gams0z3H4jil0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QQVD5MN/Bc4ZIZqfQdAh9+57E5pB8OGU4pOmwEw7LuQykQ8ooFVM0VSHz4CG2MRfn
 ZVjurNF0kAR9+C8Egnd96+QaTTnJ2CpJCfUjfSEF4gMxbzk5LgLZaEh8taX/uWXy4L
 diC/Vdgj9F+HJ12ACN7d0NrY7lZhnd2q6MxEbkU0=
Date: Fri, 9 Dec 2022 14:17:19 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20221209221719.GA3055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20221208033548.122704-1-ebiggers@kernel.org>
 <eea9b4dc9314da2de39b4181a4dac59fda8b0754.camel@debian.org>
 <Y5JPRW+9dt28JpZ7@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5JPRW+9dt28JpZ7@sol.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -17.9 (-----------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 08, 2022 at 12:55:33PM -0800, Eric Biggers wrote:
 > On Thu, Dec 08, 2022 at 10:43:01AM +0000, Luca Boccassi wrote: > > On Wed,
 2022-12-07 at 19:35 -0800, Eric Biggers wrote: > > > From: Er [...] 
 Content analysis details:   (-17.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fedoraproject.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [13.77.154.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1p3ly9-00BySB-B0
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
Cc: Victor Hsieh <victorhsieh@google.com>, Jes Sorensen <jsorensen@meta.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Luca Boccassi <bluca@debian.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 08, 2022 at 12:55:33PM -0800, Eric Biggers wrote:
> On Thu, Dec 08, 2022 at 10:43:01AM +0000, Luca Boccassi wrote:
> > On Wed, 2022-12-07 at 19:35 -0800, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > fsverity builtin signatures, at least as currently implemented, are a
> > > mistake and should not be used.  They mix the authentication policy
> > > between the kernel and userspace, which is not a clean design and causes
> > > confusion.  For builtin signatures to actually provide any security
> > > benefit, userspace still has to enforce that specific files have
> > > fsverity enabled.  Since userspace needs to do this, a better design is
> > > to have that same userspace code do the signature check too.
> > > 
> > > That allows better signature formats and algorithms to be used, avoiding
> > > in-kernel parsing of the notoriously bad PKCS#7 format.  It is also
> > > needed anyway when different keys need to be trusted for different
> > > files, or when it's desired to use fsverity for integrity-only or
> > > auditing on some files and for authenticity on other files.  Basically,
> > > the builtin signatures don't work for any nontrivial use case.
> > > 
> > > (IMA appraisal is another alternative.  It goes in the opposite
> > > direction -- the full policy is moved into the kernel.)
> > > 
> > > For these reasons, the master branch of AOSP no longer uses builtin
> > > signatures.  It still uses fsverity for some files, but signatures are
> > > verified in userspace when needed.
> > > 
> > > None of the public uses of builtin signatures outside Android seem to
> > > have gotten going, either.  Support for builtin signatures was added to
> > > RPM.  However, https://fedoraproject.org/wiki/Changes/FsVerityRPM was
> > > subsequently rejected from Fedora and seems to have been abandoned.
> > > There is also https://github.com/ostreedev/ostree/pull/2269, which was
> > > never merged.  Neither proposal mentioned a plan to set
> > > fs.verity.require_signatures=1 and enforce that files have fs-verity
> > > enabled -- so, they would have had no security benefit on their own.
> > > 
> > > I'd be glad to hear about any other users of builtin signatures that may
> > > exist, and help with the details of what should be used instead.
> > > 
> > > Anyway, the feature can't simply be removed, due to the need to maintain
> > > backwards compatibility.  But let's at least make it clear that it's
> > > deprecated.  Update the documentation accordingly, and rename the
> > > kconfig option to CONFIG_FS_VERITY_DEPRECATED_BUILTINSIG.  Also remove
> > > the kconfig option from the s390 defconfigs, as it's unneeded there.
> > 
> > Hi,
> > 
> > Thanks for starting this discussion, it's an interesting topic.
> > 
> > At MSFT we use fsverity in production, with signatures enforced by the
> > kernel (and policy enforced by the IPE LSM). It's just too easy to fool
> > userspace with well-timed swaps and who knows what else. This is not
> > any different from dm-verity from our POV, it complements it. I very
> > much want the kernel to be in charge of verification and validation, at
> > the time of use.
> 
> Well, IPE is not upstream, and it duplicates functionality that already exists
> upstream (IMA appraisal).  So from an upstream perspective it doesn't really
> matter currently.  That's interesting that you've already deployed IPE in
> production anyway.  To re-iterate my question at
> https://lore.kernel.org/r/YqKGcdM3t5gjqBpq@sol.localdomain which was ignored,
> can you elaborate on why IPE should exist when IMA appraisal already exists (and
> already supports fsverity), and why IPE uses the fsverity builtin signatures?
> And are you sure that X.509 and PKCS#7 should be used in a new system?  These
> days, if you go through any sort of crypto or security review, you will be told
> not to use those formats since they are overly complex and prone to bugs.
> 
> - Eric

IPE is just a different approach, like btrfs and ext4,
for a small subset of IMA's features: appraisal.

IMA is a fantastic solution for a whole lot of scenarios that IPE will not
cover, now or ever. In fact, in production, we use IMA (both measurement
and appraisal) and IPE side-by-side. They're not mutually exclusive.
 
IPE's approach is to really focus on the policy enforcement side, delegating
the authenticity (or even just integrity) claim to other subsystems. It does
this by enforcing an opaqueness between these integrations with other subsystems,
drawing a clear line between the mechanism of the authenticity claim,
and the enforcement of that claim against authorized values in policy. This
allows for a variable security bar based on what mechanisms are selected to
be used in the system, and what are present in the policy. For instance, the security
bar of a system using dm-verity with signed root hashes as its primary authenticity
claim, as opposed to fs-verity will have a different security bar.

This is why IPE uses the built-in signatures: they are managed by fs-verity,
and IPE does not implement its own signature format or other method of
validating either the integrity or authenticity of a data source,
explicitly, as that would be contrary to its design philosophy.

We have also noticed many use cases for the fs-verity build-in signatures. Proposals
exist to use them[1]. Package managers were updated to use them[2]. We are
successfully using them in production. Therefore we prefer to keep the existing
build-in signatures.

[1]https://fedoraproject.org/wiki/Changes/FsVerityRPM#Enable_fs-verity_in_RPM
[2]https://github.com/rpm-software-management/rpm/issues/1121

- Fan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
