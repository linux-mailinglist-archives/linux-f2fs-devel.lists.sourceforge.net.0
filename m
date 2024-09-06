Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6396FE21
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Sep 2024 00:53:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smhp7-0004WO-N3;
	Fri, 06 Sep 2024 22:53:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1smhp7-0004WI-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 22:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2kQ2ZJbEsxiWL9QofeOtNPsrELYoA3HOFgCEIrc6zE=; b=Hqh1SMwDtSuEAS6tNdHDlQgI4G
 J/o0HYy3JyalhSAvyKKN8iBXsXc2FjAYTtj+dY9+v83Fq3YtBX3WJtm9hNjRkjtkjBOZfqnXcYlqb
 70Lh5UZ0WpTX+GaKRrmqRPM/u11VJki3PCzIupyXTEcdp5gDByzJo9aNwnX8GkQYBYgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2kQ2ZJbEsxiWL9QofeOtNPsrELYoA3HOFgCEIrc6zE=; b=EmjfKGSYpG+6jJUlvzoI6wwngd
 oh/HzYgMr7jxerbUw4hr+sfnZLerpkjW+9XjpFfMQOHPUIGgN1Eg4MR8y/24JOAShsCI/GY/1PQ6S
 TJoHYKnnGjTxLwMJlD7fTimPa0RIaejLUo86xN8aHlQQasCOe2VU71h9aBjdeQiCYaB8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smhp5-0002iU-OL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 22:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE7595C574C;
 Fri,  6 Sep 2024 22:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45AAC4CEC4;
 Fri,  6 Sep 2024 22:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725663169;
 bh=NDnhJYHmPd2gD/xHsSON9t0iaghHfHefv1ORSmknexs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmOMbz1Yng608S7ZHV8nL7P33mP/I1cgtxwld3tlPtgBimMvyn/i3RrPZeskoiy1E
 vbP8PjWpEdhJlckEfJgZDQL/5/W5FJ4ya1rKqx2TEJCI9QYLvVBzt9WA0rQ/+xggy0
 gmtSIPLnVlirDUNqJeQK7gZzwmxwRAfxemJ31J/GThvr7ZrAs9Z8khggJhW9LKLb2d
 aBXD+tcAHqvCEq7YGzxhE3mftg7/f5GsBiz5qnbOOYRCFUK9v9odrl7Eia4tnqH2mg
 cSJ4Ubrqyy4D0ztFqQM6HLscdAeduk6jPItefUuZY+6Fh5cyalk6NzK93yuZn/z6eC
 +w5Zm1Liu+wEA==
Date: Fri, 6 Sep 2024 22:52:47 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ZtuHv9ZbCxLmzuZp@google.com>
References: <20240906083117.3648386-1-bo.wu@vivo.com>
 <d5505e7f-19db-44dd-8c3f-5b43cfff6b29@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5505e7f-19db-44dd-8c3f-5b43cfff6b29@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/06, Chao Yu wrote: > On 2024/9/6 16:31, Wu Bo wrote:
 > > On Tue, Feb 20, 2024 at 02:50:11PM +0800, Chao Yu wrote: > > > On 2024/2/8
 16:11, Wu Bo wrote: > > > > On 2024/2/5 11:54, Chao Yu wrote: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smhp5-0002iU-OL
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: stop allocating pinned
 sections if EAGAIN happens"
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
Cc: Wu Bo <wubo.oduw@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/06, Chao Yu wrote:
> On 2024/9/6 16:31, Wu Bo wrote:
> > On Tue, Feb 20, 2024 at 02:50:11PM +0800, Chao Yu wrote:
> > > On 2024/2/8 16:11, Wu Bo wrote:
> > > > On 2024/2/5 11:54, Chao Yu wrote:
> > > > > How about calling f2fs_balance_fs() to double check and make sure=
 there is
> > > > > enough free space for following allocation.
> > > > > =

> > > > >  =A0=A0=A0=A0=A0=A0=A0 if (has_not_enough_free_secs(sbi, 0,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GET_SEC_FROM_SEG(sbi, overprov=
ision_segments(sbi)))) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_down_write(&sbi->gc_lock);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stat_inc_gc_call_count(sbi, FO=
REGROUND);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_gc(sbi, &gc_contr=
ol);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err =3D=3D -EAGAIN)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_balance_fs(sb=
i, true);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err && err !=3D -ENODATA)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_err;
> > > > >  =A0=A0=A0=A0=A0=A0=A0 }
> > > > > =

> > > > > Thanks,
> > > > =

> > > > f2fs_balance_fs() here will not change procedure branch and may jus=
t trigger another GC.
> > > > =

> > > > I'm afraid this is a bit redundant.
> > > =

> > > Okay.
> > > =

> > > I guess maybe Jaegeuk has concern which is the reason to commit
> > > 2e42b7f817ac ("f2fs: stop allocating pinned sections if EAGAIN happen=
s").
> > =

> > Hi Jaegeuk,
> > =

> > We occasionally receive user complaints about OTA failures caused by th=
is issue.
> > Please consider merging this patch.

What about adding a retry logic here, as it's literally EAGAIN?

> =

> I'm fine w/ this patch, but one another quick fix will be triggering
> background GC via f2fs ioctl after fallocate() failure, once
> has_not_enough_free_secs(, ovp_segs) returns false, fallocate() will
> succeed.

> =

> Reviewed-by: Chao Yu <chao@kernel.org>
> =

> Thanks,
> =

> > =

> > Thanks
> > =

> > > =

> > > Thanks,
> > > =

> > > > =

> > > > > =

> > > =

> > > =

> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
