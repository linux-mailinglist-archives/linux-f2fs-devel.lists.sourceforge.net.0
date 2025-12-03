Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50441C9D902
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 03:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47/UWx0Sh603e5AueYRFfRGEnbFYNyb8ILhwrXYkhRA=; b=caRxFIt9uYKY1PcyTUGDkrRNnf
	cWRobGXtMiD+Lhym0gHUbIZOxOcTLlQdnNRDovtNv3M0wMCrjIHA4nEGbad/EUr3VQPrSaPc2jGkc
	hBp36u226jzF2lXPxih67fimslNOU2F8Tc/jQjt2YI+Dn6NoZG4MCM2jRm4pf4GYXxLs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQcRr-0003ZC-FM;
	Wed, 03 Dec 2025 02:18:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1vQcRp-0003Z3-6V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 02:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OA5BPPFPWdY1GGA+qoGP4dlLrTO9cnCg3u+3vMgwFRc=; b=dL/bJQuD2lhRgRMHXFztd1u9LN
 w8YfBiEFtdMmfNTs7dg588ViA3dfdS4UDdQ1xxNOlAeF+LW5iv7XnIguPN5+2/Mq1npZGdH7ypOfe
 bar6qNX+9Vjzf8AZzxQr+euj/yoRZJX5IaZvuV9ddT0UPfnL1KZG+PY5urUwvkEbl6bk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OA5BPPFPWdY1GGA+qoGP4dlLrTO9cnCg3u+3vMgwFRc=; b=SdNKpg9OuphoYCFsdM1SyXoqto
 Tuc/evgj4FUKAlY99MySLAWIXgFn28I7RIzA4gMV2JU/TLHpHRSITGv/w3X5EejDyp1gSQ76Qgg7W
 IgfPavn1iA4dmExWiOGR8SSbEOxabKR2WoZGRtUi6Lt8J1BxkKgGUI9hI1YL9z2OqWW0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQcRo-000874-G0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 02:18:29 +0000
Received: from macsyma.thunk.org (pool-173-48-102-12.bstnma.fios.verizon.net
 [173.48.102.12]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 5B32I9N4002251
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Dec 2025 21:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1764728291; bh=OA5BPPFPWdY1GGA+qoGP4dlLrTO9cnCg3u+3vMgwFRc=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=Eti7T6Qk1jdPBi8XpZLNi7KBPC8jLhcgPL7SUMH4826Pgw2qlj17gyb1HelDJHUvm
 Spx347nVL2ud3eCKU6QXGsnvkVnkFhj5YZbKIAxSJdJ9lX12gjgrY85+xJcMxZiA/G
 SSw33AISQZ0xn4QoM5F+k6aAqaQOwVWSbI2LErknV1iZHPnkrgecAHnEpUZdfqAcnB
 9rX8trbgEBMaVPiKmGEqLKwpXiA+HcW7oaXOWZ3YNgnMXWcbKRaGKkrxUEoCE4DSxm
 Ni2+VFdZnuG6Hu5sQa/XZRRyp9EEJCUigTeJ2JlcsieHWX+/w07DB2DEQzeAeVHauo
 bvsJtvon/TFHQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 75E604DF2C06; Tue,  2 Dec 2025 21:17:09 -0500 (EST)
Date: Tue, 2 Dec 2025 21:17:09 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>
Message-ID: <20251203021709.GA71988@macsyma.lan>
References: <20251202043952.GA70808@macsyma.lan>
 <CAOtxgyeik6kgF6SktvFj=anntmJZ_aWneqq1XzLpqpHK1XMb+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOtxgyeik6kgF6SktvFj=anntmJZ_aWneqq1XzLpqpHK1XMb+Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 02, 2025 at 09:30:44AM -0800, Jaegeuk Kim wrote:
 > > For now, I'll exclude generic/204 from the f2fs configs in my test >
 > appliance; if you have a chance to take a look at this and let m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [18.9.28.11 listed in list.dnswl.org]
X-Headers-End: 1vQcRo-000874-G0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 02, 2025 at 09:30:44AM -0800, Jaegeuk Kim wrote:
> > For now, I'll exclude generic/204 from the f2fs configs in my test
> > appliance; if you have a chance to take a look at this and let me know
> > when it might be safe to re-neable generic/204 for f2fs, that would be
> > great.  Thanks!
> 
> Thank you for sharing the report. I didn't hit this in my setup tho, let
> us try to reproduce it first.

I'm not able to reproduce it by running generic/204 by itself; only
when running the full auto group.  (See below).  The generic/204 test
reformats the scratch partition at the beginning of the test, and
doesn't depend on the test partition.  Presumably, a previous test
when running the auto group is somehow setting up generic/204 to fail.

I'll try doing a run with KASAN enabled, in case that gives us some
insight.

						- Ted
							
TESTRUNID: ltm-20251202161646
KERNEL:    kernel	6.18.0-rc4-xfstests-kasan-00072-g6fb67ac89690 #314 SMP PREEMPT_DYNAMIC Tue Dec  2 16:05:26 EST 2025 x86_64
CMDLINE:   --kernel gs://gce-xfstests/kernel.deb -c f2fs/all -a -C 30 generic/204
CPUS:      2
MEM:       7680

f2fs/default: 30 tests, 6043 seconds
f2fs/encrypt: 30 tests, 6209 seconds
f2fs/compress: 30 tests, 6140 seconds
Totals: 90 tests, 0 skipped, 0 failures, 0 errors, 18392s

FSTESTIMG: gce-xfstests/xfstests-amd64-202512020012
FSTESTPRJ: gce-xfstests
FSTESTVER: blktests	4badb27 (Fri, 31 Oct 2025 19:53:27 +0900)
FSTESTVER: fio		fio-3.41 (Fri, 5 Sep 2025 14:21:17 -0600)
FSTESTVER: fsverity	v1.7 (Tue, 4 Nov 2025 17:28:17 -0800)
FSTESTVER: ima-evm-utils	v1.5 (Mon, 6 Mar 2023 07:40:07 -0500)
FSTESTVER: libaio  	libaio-0.3.108-82-gb8eadc9 (Thu, 2 Jun 2022 13:33:11 +0200)
FSTESTVER: ltp		20250930 (Tue, 30 Sep 2025 13:53:45 +0200)
FSTESTVER: quota		v4.05-77-g22ff3d9 (Tue, 2 Sep 2025 08:12:02 -0400)
FSTESTVER: util-linux	v2.41.2 (Mon, 22 Sep 2025 12:56:34 +0200)
FSTESTVER: xfsprogs	v6.17.0 (Mon, 20 Oct 2025 16:49:00 +0200)
FSTESTVER: xfstests-bld	gce-xfstests-202504292206-34-g84a091b7 (Tue, 2 Dec 2025 00:09:25 -0500)
FSTESTVER: xfstests	v2025.11.04-12-g64e3dbda7 (Thu, 13 Nov 2025 19:58:03 -0500)
FSTESTVER: zz_build-distro	trixie
FSTESTSET: generic/204
FSTESTOPT: count 30 fail_loop_count 0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
