Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569987A0D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:33:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDUS-0001Uz-GP;
	Wed, 13 Mar 2024 01:33:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rkDUR-0001Us-1o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/MjwKeZpJuiT73oPm+iQiv6L3Nkkc7fj1Lzdya382rw=; b=LFs887S6GOwDwN79OrlXk09XW5
 WzIJGzZqqCHIfo1dhdJxC81tmaSlp13IyUE8yFPs+JfTXrJqT0WzKuyYc7snESkjYy0f1LBSGL6cv
 WFMfn5KBWKdiG9mT1kAQCdErFZ3SYS8s0Dk7VtaLifN6uWdLxukqH760u005W9VfVz/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/MjwKeZpJuiT73oPm+iQiv6L3Nkkc7fj1Lzdya382rw=; b=OtEbpu7Z8LGJ1NWypfrX9TL59q
 HC2gPy8zKONnN75WiTJ/R4bLONq2mRG0gG6Zzo8YsRL3IsrAuDMuGUHF4YgyiB8vXgOYV+UKDfe48
 J922xpYI4yEM/78uSj2GjTzTBtXsPilb7fe+Nf7F6WCLt3V4mjHYy1PWf130KfLegZEs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDUG-0002FT-Hh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4036861335
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 01:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3151C433C7;
 Wed, 13 Mar 2024 01:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293571;
 bh=EAz1/6jNZeGT0Jk5yAvRhXaOHjMPAnEwzSGhMuY4HW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEBvRbzjRtPWBJ1/1vZKlBVP8tancA/wCkjhjid3RO+JtETbJY2mnhNzzOMFyDxG9
 JmTDIttjOjYjUPfEii4N+4sPj2MN3E9Wy+Ti/JkxjmDDDYdmNmIjE1HPWYvoRPXGCk
 C9FmY3kbpTWhMhB37rFijCqXBsLA+XpcseoDvnLMyU4DTnwFxLVaQbxDqOYvSxkh7T
 1/oyh6kqaQ0pyNfefSvV9auzWPAx26mLSoPSOsaQi7pfjxjCksGZ9EjgDhbdQ3cGIx
 Tt4tycSSLe35h0Ug5ti7eOLBxpSICaDnvJlpM66RZFmuM/jzjE2JSvPRJ+YrfDbK1d
 nM6XILA5Nrd7A==
Date: Tue, 12 Mar 2024 18:32:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZfECQpk3QliirSlb@google.com>
References: <20240206032513.2495025-1-chao@kernel.org>
 <ZcQd3DtIpiA5P9DQ@google.com>
 <8e69aa15-9779-4696-98ab-f173666a87a7@kernel.org>
 <23aa8351-e002-4185-89c7-ccde6b5b0549@kernel.org>
 <5f335b3b-7edc-458f-819d-40012b61672a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f335b3b-7edc-458f-819d-40012b61672a@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  So, I was wondering we can give data even in cp_error case.
 On 03/12, Chao Yu wrote: > Ping, > > Jaegeuk, do you have any comments on
 this patch? > > Thanks, > > On 2024/2/26 16:00,
 Chao Yu wrote: > > Any comments?
 > > > > Thanks, > > > > On 2024/2/19 11:13, C [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDUG-0002FT-Hh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return EIO when reading after
 device removal
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

So, I was wondering we can give data even in cp_error case.

On 03/12, Chao Yu wrote:
> Ping,
> =

> Jaegeuk, do you have any comments on this patch?
> =

> Thanks,
> =

> On 2024/2/26 16:00, Chao Yu wrote:
> > Any comments?
> > =

> > Thanks,
> > =

> > On 2024/2/19 11:13, Chao Yu wrote:
> > > On 2024/2/8 8:18, Jaegeuk Kim wrote:
> > > > On 02/06, Chao Yu wrote:
> > > > > generic/730 2s ... - output mismatch (see /media/fstests/results/=
/generic/730.out.bad)
> > > > > =A0=A0=A0=A0 --- tests/generic/730.out=A0=A0=A0 2023-08-07 01:39:=
51.055568499 +0000
> > > > > =A0=A0=A0=A0 +++ /media/fstests/results//generic/730.out.bad=A0=
=A0=A0 2024-02-06 02:26:43.000000000 +0000
> > > > > =A0=A0=A0=A0 @@ -1,2 +1 @@
> > > > > =A0=A0=A0=A0=A0 QA output created by 730
> > > > > =A0=A0=A0=A0 -cat: -: Input/output error
> > > > > =A0=A0=A0=A0 ...
> > > > > =A0=A0=A0=A0 (Run 'diff -u /media/fstests/tests/generic/730.out /=
media/fstests/results//generic/730.out.bad'=A0 to see the entire diff)
> > > > > Ran: generic/730
> > > > > Failures: generic/730
> > > > > Failed 1 of 1 tests
> > > > > =

> > > > > This patch adds a check condition in f2fs_file_read_iter() to
> > > > > detect cp_error status after device removal, and retrurn -EIO
> > > > > for such case.
> > > > =

> > > > Can we check device removal?
> > > =

> > > We can use blk_queue_dying() to detect device removal, but, IMO, devi=
ce
> > > removal can almost not happen in Android, not sure for distros or ser=
ver,
> > > do you want to add this check condition into f2fs_cp_error()?
> > > =

> > > Thanks,
> > > =

> > > > =

> > > > > =

> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > > =A0 fs/f2fs/file.c | 3 +++
> > > > > =A0 1 file changed, 3 insertions(+)
> > > > > =

> > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > index 45b7e3610b0f..9e4386d4144c 100644
> > > > > --- a/fs/f2fs/file.c
> > > > > +++ b/fs/f2fs/file.c
> > > > > @@ -4462,6 +4462,9 @@ static ssize_t f2fs_file_read_iter(struct k=
iocb *iocb, struct iov_iter *to)
> > > > > =A0=A0=A0=A0=A0 const loff_t pos =3D iocb->ki_pos;
> > > > > =A0=A0=A0=A0=A0 ssize_t ret;
> > > > > +=A0=A0=A0 if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return -EIO;
> > > > > +
> > > > > =A0=A0=A0=A0=A0 if (!f2fs_is_compress_backend_ready(inode))
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EOPNOTSUPP;
> > > > > -- =

> > > > > 2.40.1
> > > =

> > > =

> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
