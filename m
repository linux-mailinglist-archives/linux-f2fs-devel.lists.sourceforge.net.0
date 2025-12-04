Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F8CA4BA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Dec 2025 18:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fttReNjJHW6dbIhTg98igXGWpElCccx+9cuO7LorGdQ=; b=QHrH1I60tO3fyXr25Ai/IZY5/V
	XnMF7cAtDL/SLuNQTuc8Vsch+6VD66Xgf4v142gUuJdtC6a1/p2gQ60grb4oL6K5oZ+YJNeVoiueI
	SrZ8JkxLHyeuXNTpSins82mL6+XUXjglCLV4G9fQCIiczE0fxSE4tnKaEAUufvEnvulY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRD0N-0006Ic-VI;
	Thu, 04 Dec 2025 17:20:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vRD0M-0006IL-BN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 17:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zykMUt/mXCr5ecefYRvnGtvNibNlDuJ2dM4AGdTY3Ec=; b=JGiXqMWbD0A5esoMQr3wu+6X4A
 79mhmMo3tb1XzSJlnN8BpWG39r1B6CNnIjBQ5AVMTb0o9X5bXKpuTRtlBFk4nKrwf9d4Xt0AllEKW
 7aGyxGWK+3yy0R3U+Xis437KKN1NR8GIviINRi8thLX/XSA5bP6rWDnSbNecPQp3N+tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zykMUt/mXCr5ecefYRvnGtvNibNlDuJ2dM4AGdTY3Ec=; b=fZwMEP7J/JRmBtMM9sZ8E0eIv4
 xhKaDjQIhjOJqicolL1FsKLL8Ypw1nZooQAJFFtdKmsYS1bCmfB1wP6Z4AM4IWkZlTnSFA9ZZYOM2
 Bk9UZZ1upzNtapT8JX96tcwFQRZj4p+d4Ym736+C8kz8SZynPnEmudMJfVtmhzC/03O0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vRD0M-0003zX-If for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 17:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47ED543213;
 Thu,  4 Dec 2025 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D75C4CEFB;
 Thu,  4 Dec 2025 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764868829;
 bh=tK+eY6Vb4Ife1n+uhuaMnmqsWLcoPqv6F/KpnpZ34cY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tlva8RoewqIBhqyRHgIqO1o8YoXo24jG0VpiNy3ittTIuxLVuZhWPj9bKrLrueSef
 xPUdBfMNu6ynsBbxfr9nSEecOvp6gUT06b5MfLx13dF0L6/KzwbewTKra5Gv4gTzVw
 0WY8KMpTHvO4it5MsAiG2GavflG6j/mDCeAKvBcDIkCkVvPqynV2j1/NC22YpVbdDM
 CqPN5OeQeVRCGkwQtM+f9aykZAjvn6kMMRieN/aVTLRMbF4rXN/zpJnejTBGtqoWLb
 yGrnswSMi+yBwJbVfXxtOlyneSUSWI3BNLlisLpL2K7vgOiUdusLeeGlSZNC2vTZjB
 gv35q14cwfUjQ==
Date: Thu, 4 Dec 2025 17:20:27 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <aTHC2wtlC5d00xYL@google.com>
References: <20251202043952.GA70808@macsyma.lan>
 <CAOtxgyeik6kgF6SktvFj=anntmJZ_aWneqq1XzLpqpHK1XMb+Q@mail.gmail.com>
 <20251203021709.GA71988@macsyma.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251203021709.GA71988@macsyma.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Theodore Tso wrote: > On Tue, Dec 02,
 2025 at 09:30:44AM
 -0800, Jaegeuk Kim wrote: > > > For now, I'll exclude generic/204 from the
 f2fs configs in my test > > > appliance; if you have a cha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vRD0M-0003zX-If
Subject: Re: [f2fs-dev] generic/204 is crashing on linux-next when testing
 f2fs
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/02, Theodore Tso wrote:
> On Tue, Dec 02, 2025 at 09:30:44AM -0800, Jaegeuk Kim wrote:
> > > For now, I'll exclude generic/204 from the f2fs configs in my test
> > > appliance; if you have a chance to take a look at this and let me know
> > > when it might be safe to re-neable generic/204 for f2fs, that would be
> > > great.  Thanks!
> > 
> > Thank you for sharing the report. I didn't hit this in my setup tho, let
> > us try to reproduce it first.
> 
> I'm not able to reproduce it by running generic/204 by itself; only
> when running the full auto group.  (See below).  The generic/204 test
> reformats the scratch partition at the beginning of the test, and
> doesn't depend on the test partition.  Presumably, a previous test
> when running the auto group is somehow setting up generic/204 to fail.
> 
> I'll try doing a run with KASAN enabled, in case that gives us some
> insight.

Thank you. fyi; I found some other xfstests failures, hence dropped some
suspicious patches and pushed today. Currently, my setup passed all the
test-cases with it, so if possible, could you please check probably tomorrow
linux-next?

Thanks,

> 
> 						- Ted
> 							
> TESTRUNID: ltm-20251202161646
> KERNEL:    kernel	6.18.0-rc4-xfstests-kasan-00072-g6fb67ac89690 #314 SMP PREEMPT_DYNAMIC Tue Dec  2 16:05:26 EST 2025 x86_64
> CMDLINE:   --kernel gs://gce-xfstests/kernel.deb -c f2fs/all -a -C 30 generic/204
> CPUS:      2
> MEM:       7680
> 
> f2fs/default: 30 tests, 6043 seconds
> f2fs/encrypt: 30 tests, 6209 seconds
> f2fs/compress: 30 tests, 6140 seconds
> Totals: 90 tests, 0 skipped, 0 failures, 0 errors, 18392s
> 
> FSTESTIMG: gce-xfstests/xfstests-amd64-202512020012
> FSTESTPRJ: gce-xfstests
> FSTESTVER: blktests	4badb27 (Fri, 31 Oct 2025 19:53:27 +0900)
> FSTESTVER: fio		fio-3.41 (Fri, 5 Sep 2025 14:21:17 -0600)
> FSTESTVER: fsverity	v1.7 (Tue, 4 Nov 2025 17:28:17 -0800)
> FSTESTVER: ima-evm-utils	v1.5 (Mon, 6 Mar 2023 07:40:07 -0500)
> FSTESTVER: libaio  	libaio-0.3.108-82-gb8eadc9 (Thu, 2 Jun 2022 13:33:11 +0200)
> FSTESTVER: ltp		20250930 (Tue, 30 Sep 2025 13:53:45 +0200)
> FSTESTVER: quota		v4.05-77-g22ff3d9 (Tue, 2 Sep 2025 08:12:02 -0400)
> FSTESTVER: util-linux	v2.41.2 (Mon, 22 Sep 2025 12:56:34 +0200)
> FSTESTVER: xfsprogs	v6.17.0 (Mon, 20 Oct 2025 16:49:00 +0200)
> FSTESTVER: xfstests-bld	gce-xfstests-202504292206-34-g84a091b7 (Tue, 2 Dec 2025 00:09:25 -0500)
> FSTESTVER: xfstests	v2025.11.04-12-g64e3dbda7 (Thu, 13 Nov 2025 19:58:03 -0500)
> FSTESTVER: zz_build-distro	trixie
> FSTESTSET: generic/204
> FSTESTOPT: count 30 fail_loop_count 0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
