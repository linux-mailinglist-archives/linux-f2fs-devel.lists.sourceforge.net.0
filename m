Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744F64782D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 22:44:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3OgO-00072T-MA;
	Thu, 08 Dec 2022 21:43:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <paul@paul-moore.com>) id 1p3OgN-00072M-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 21:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Epi0wvoArwdi93QgOlOJRom7wYA62WnSexI8WZ5n4Kc=; b=dNdfUdECFRBGaqroP98dOS2+Cx
 hVhYjyzNj2Q8qNAJI1GL/fsM2Kl6tuGaTVXohsBpCftNS4JWZpnFdu4DTGdWn0nJDqfwbkZEvZ+Ov
 HVJ5Iv8cOvC42qWR6nYPgm2Rvlj6nswwrDEl4svijl9Yb8qbGLpmAvGMy/bJ+vCpzk18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Epi0wvoArwdi93QgOlOJRom7wYA62WnSexI8WZ5n4Kc=; b=V
 Oei4K4Cib4jwBpNGkA/46Kv93SXuX8uAS334sXYZUzf1Z2AF11CXlAqBXQJBb1HB6pYttuYsmX3ot
 FX0JVvYCPGEZVvGqcsEaY9DpA6dYR6Z4+3RcC8xoZKw0JMKzyUTld5aEtuqtkUUd6Bu9am3c20KGA
 V2UD6CRZVCqKZoio=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p3OgG-0002L5-49 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 21:43:55 +0000
Received: by mail-pg1-f172.google.com with SMTP id 142so2247924pga.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Dec 2022 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Epi0wvoArwdi93QgOlOJRom7wYA62WnSexI8WZ5n4Kc=;
 b=N+6Aj206qvb7iNXVdFQBPg6dnnVNI4o7tNTkSe6INV7p1MkBDypskH6ph7HPR2qqjY
 KCQ6bPOZjbY0MTDlYnXLXzABESm0l2DHnVDDYQQMJeKl0zRPAsQBwj6KR1VRaOI1O5gf
 4Vi3JvR+pav++uv81Rq2FxKSxA2RLAoLZgyjxSk7CphL0/sX0B4pveNMGid5X1ml5gWU
 Dam3H+j4msCo8w7a88s1CSEY83uKMIj3TtSZSbVpcw59ErrVsAAxYcTimgn1e8Y9CI0R
 rM34D9Y2fHYVEuSJ07l2l/3pknRxqPqVwafNeiKJ2scypppjp58BNAxuUzPvn14xjGMF
 6T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Epi0wvoArwdi93QgOlOJRom7wYA62WnSexI8WZ5n4Kc=;
 b=0+1bjOSsxru9KoXrc2Srtu4IXfqZk9qdsu1FW+Do8LkI76efWLqm7Lk9EzM+5ViXWx
 D351zTo4PcFZAf58lBuRplPKteg+EqKEf4/6Ptpi/yFPTee0YxM2HyqGhmsGU53h55Pi
 E4bq8/XQBdsjqZwxDUsVA8+twsCnII/11eOhLKoXCY/ETY14K5RqDeeK0JLaovM+Et12
 wxlc6THRqU/pJVN8LUGxEr0jlaKvvSoQfuI1BNb15RlCFjj8CxHc3f0uQP3f7vibLqIK
 yejYW6JSv9W4GLRRsOI+JrY/Z/VrdUdgNl5pmSg52497ylpHk/AkiwA0vDFoi3dF+J9H
 wusw==
X-Gm-Message-State: ANoB5pnvi3bVpWaQ3t6NtJ1K+NFDGA5ZwKD2fLlfNLUnmiVFSdD7qyTo
 gNLm5uCuESHeqzVfSxCOze43zJ5QAsZmxS/rK/a60q8jcWRXgUw=
X-Google-Smtp-Source: AA0mqf77gpQVrYnOfWw3zdor+Q9b7Q2VDfHXiSgWE1uUCovE3iY2apN7bXxoa9t+H9Tct88fbwCVN8p9mCZ+UQGODpA=
X-Received: by 2002:a17:902:9892:b0:186:c3b2:56d1 with SMTP id
 s18-20020a170902989200b00186c3b256d1mr79125339plp.15.1670521309385; Thu, 08
 Dec 2022 09:41:49 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 8 Dec 2022 12:41:38 -0500
Message-ID: <CAHC9VhTtdYsX5+j-j7sis_dzCOTtrv_=EvU35KRBg+x0gA5p+A@mail.gmail.com>
To: bluca@debian.org
X-Spam-Score: 3.6 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 08 Dec 2022 10:43:01 +0000, Luca Boccassi wrote: >
 On Wed, 2022-12-07 at 19:35 -0800, Eric Biggers wrote: > > From: Eric Biggers
 <ebiggers@google.com> > > > > fsverity builtin signatures, at l [...] 
 Content analysis details:   (3.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: paul-moore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p3OgG-0002L5-49
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
Cc: jsorensen@meta.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fscrypt@vger.kernel.org, victorhsieh@google.com,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 08 Dec 2022 10:43:01 +0000, Luca Boccassi wrote:
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
>
> In essence, I very strongly object to marking this as deprecated. It is
> entirely ok if at Google you want to move everything out of the kernel,
> you know your use case best so if that works better for you that's
> absolutely fine (and thus your other patch looks good to me), but I
> don't think it should be deprecated for everybody else too.

To add some more background on the IPE LSM, it has gone through
several rounds of review on the LSM list and the developers working on
it are in the process of readying it for the next review cycle.

-- 
paul-moore.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
