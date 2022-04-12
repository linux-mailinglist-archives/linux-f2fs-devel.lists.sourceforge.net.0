Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652514FE5EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 18:34:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neJSr-0000pm-Br; Tue, 12 Apr 2022 16:34:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1neJSq-0000pN-9W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 16:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNZMK+bZ3yLyzFbF0oqBEmrIfdRxI6t4CzuLg8FIUcA=; b=G60pP32JHONVHSyF2H5VKP6nAk
 caNp6AehxOvXtlc+EnLghcV0xAvld25u20RyzQKMak62VPxoryeDoeJRh0NvmbXOrl43iMALK4GrB
 pu8+5LeYVARH3ywkGLNWb7QupSGOSZ8kA7gPc1jdbfin7HCzt49KeNEDjV8pceZJT+Vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fNZMK+bZ3yLyzFbF0oqBEmrIfdRxI6t4CzuLg8FIUcA=; b=l4j76lMkb+BTQSv81pd/QH9WAu
 IIahf46JjUcoicmPlXSHdbbdXprG2j/3Z7MW5nY5oXXKE4PPN9QfQW7ziqL2HKOszoBamCg8GgGtu
 +3CX7xFJblPBLANzNDHBwdaNVTDQBWGKIw2Yj5FA8DsmMUkipMMxQFAoHWZeQ2EQNMVo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neJSm-0005q1-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 16:34:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2520061803;
 Tue, 12 Apr 2022 16:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5815FC385A1;
 Tue, 12 Apr 2022 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649781221;
 bh=T/VyxmsfxdCPBK6uIblKsYCQtaXZeyLo4jRWZbFxnB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nGtKdcqPN1neRlBYt+81onq7G1lSyybMwh4CDEUW8f4MtO0120635E9jvTSz76+FJ
 njiYxrW39ZWjdXVJ1tWAmxSHDJPNkryQlfP+INpPPNeoXm7FzFpGOlzdRcb973pdCh
 AKhjKMX2dhNEttw3jg43MBInnj+EpYwgOdSu5SfH8A8aI4VlEm/UFwgXx1s0D8/fYN
 scmveldFLPfdoAFiP6ramq/if0K+buplI3NQBvjvPpc1ZLM1rTQO1wjGr6TUZm2wL3
 ys9RwK5vXCg1qU6cpS4sfE1sRm7CNnVvzOPz75X50nzQEUw/FylhsmhgNz5np6/gFU
 R4QXSGTbruJRg==
Date: Tue, 12 Apr 2022 09:33:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YlWp468pKUrRLFTH@google.com>
References: <CGME20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad@eucas1p1.samsung.com>
 <20220412112745.44108-1-p.raghav@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412112745.44108-1-p.raghav@samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/12, Pankaj Raghav wrote: > F2FS only works for zoned
 devices with power-of-2 zone sizes as the > f2fs section needs to be a
 power-of-2.
 The section size actually supports multiple 2MBs, not PO2. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neJSm-0005q1-Ey
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs-tools: return error for zoned
 devices with non power-of-2 zone size
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/12, Pankaj Raghav wrote:
> F2FS only works for zoned devices with power-of-2 zone sizes as the
> f2fs section needs to be a power-of-2.

The section size actually supports multiple 2MBs, not PO2.

> 
> At the moment the linux kernel only accepts zoned devices which are
> power-of-2 as block devices but there are zoned devices in the market
> which have non power-of-2 zone sizes.
> 
> As a proactive measure, this patchset adds a check to return error
> from mkfs and fsck for zoned devices with non power-of-2 zone sizes.
> 
> Luis Chamberlain (3):
>   libf2fs_zoned: factor out helper to get chunk sectors
>   libf2fs: add support to report zone size
>   libf2fs: don't allow mkfs / fsck on zoned NPO2
> 
>  include/f2fs_fs.h   |  1 +
>  lib/libf2fs.c       | 17 +++++++++++++++--
>  lib/libf2fs_zoned.c | 32 ++++++++++++++++++++++----------
>  3 files changed, 38 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
