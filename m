Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDDB327A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Aug 2025 10:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfnWZaAyig7YIz3zVt1/kn2n47JwdonyC+nhXuPhVcg=; b=ZNG0b8lO31Yay9ShB9/Acnv2cK
	bFLkEaLXYt6ggCDWwcZuZ+ZORFLuLYy0g1AzC3JXkXvKR9w9vCi4gItvoiNSkTM2etiho+WpcHYMi
	/i58PsXSW5ZjA77lxnohr4sTkXaSbhmQv/w+13FpB8Z4dvUreFFl+7aal1FgNiHFpn9k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1upji7-0000vh-5o;
	Sat, 23 Aug 2025 08:34:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1upji6-0000vb-1V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79ghNfcLyq30uKso022RRCvbnX4AOLU/eJqzkJiFhJQ=; b=Dzdv2U2ep+7kO7SfNGGRlA52+c
 QcfAioB6X/KDjFiVzSUBteeCJEh15ulYHssecIUVAT8kMtpLOfJ7uTJHj/kefLcIBcbooWLVM+lO0
 N2+WpGSfL2WszSKTyv6fJsTSyxQOqCdQg3IQgrE4l9fzqZPwkenDB2owE7GXD78Uy6d8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79ghNfcLyq30uKso022RRCvbnX4AOLU/eJqzkJiFhJQ=; b=HHpMC5Pn/2++Xn58YjeCKyO7PB
 X325/m9QHZYaxzsFp1zwGZyr6+S1XlBX7cS7LTaRYYSY1u5FFKXvU2vtGJlBaNs/eZXj80+z8anax
 tlslXjKyMc4k4tCivJbu+th2kxVcRX37CXx9PopxoUAxv9cjLfJNuabdRRSRuS0hMWEI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1upji6-0008Pr-Ai for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A384F6000A;
 Sat, 23 Aug 2025 08:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389A1C4CEF1;
 Sat, 23 Aug 2025 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755938084;
 bh=VTmZoCkFJpMvtwTolLvBsQF/3mFw+eggV6I0WwnBf/8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y032EtlNhsxSPiz0hd92KkOyScqzqOGAtDj7XBUXD5GCJWCvbdCclS6ifPUfYU3z1
 HpfXhs+EVQPcdOXogR+f+mzvfjaZ8Bep3thCLl5nMfFsvXIAOcaSFGgDNMitDIrTWO
 ujHur1/ak/GXJ/d7eBEBsHX944Ep+B2awBZuQrnR5//is3gvFi27tCrikb6JTMPpur
 ZEYdFgFrElHQ87I6qMM1aKxP5PzgaC4bNy8U2bURmEoEJrubZwzgAiBBCTMT//UwAt
 PCyNW5vkan6DA6j7NwHn8FKoDKRDGkTAK2hgnL2u5kG1e+3jWmycWVJcUXi3dXFKdl
 x5aLnKDXcjNkA==
Message-ID: <08ec4cbe-b140-4dc7-94a4-85d6044f4643@kernel.org>
Date: Sat, 23 Aug 2025 16:34:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/20/2025 8:42 PM, Sheng Yong wrote: > Hi, all, > > Since
 we have not yet determined how to check the test result properly, > I split
 patchset v2 into two parts on Chao's suggestion. This is the > [...] 
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
X-Headers-End: 1upji6-0008Pr-Ai
Subject: Re: [f2fs-dev] [PATCH v3 00/13] f2fs-tools & inject.f2fs: bugfix
 and new injections
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/20/2025 8:42 PM, Sheng Yong wrote:
> Hi, all,
> 
> Since we have not yet determined how to check the test result properly,
> I split patchset v2 into two parts on Chao's suggestion. This is the
> first part which contains some fixes/cleanups for f2fs-tools, and adds
> new injections for inject.f2fs.

There is one missed entry in inject.f2fs manual page in 10/13, once you
fixed it, feel free to add:

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> Changes from last version are also updated in individual patch.
> 
> v3: * split original patchset into two parts
>      * update manual
>      * refactor inject sit/nat in journal
>      * fix memleak
> v2: * add some fix and cleanup
>      * remove img.tar.gz from testcases
>      * add testcases for injection
>      * cleanup helpers script and simplify filter.sed and expected.in
>      https://lore.kernel.org/linux-f2fs-devel/20250610123743.667183-1-shengyong1@xiaomi.com/
> v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/
> 
> Sheng Yong (13):
>    fsck.f2fs: do not finish/reset zone if dry-run is true
>    f2fs-tools: add option N to answer no for all questions
>    f2fs-tools: cleanup {nid|segno}_in_journal
>    fsck.f2fs: fix invalidate checkpoint
>    dump.f2fs: print more info
>    f2fs-tools: add and export lookup_sit_in_journal
>    inject.f2fs: fix injecting sit/nat in journal
>    inject.f2fs: fix injection on zoned device
>    inject.f2fs: fix and cleanup parsing numeric options
>    inject.f2fs: add members in inject_cp
>    inject.f2fs: add member `feature' in inject_sb
>    inject.f2fs: add members in inject_node
>    inject.f2fs: add member `filename' in inject_dentry
> 
>   fsck/dump.c         |  15 +-
>   fsck/f2fs.h         |  12 +-
>   fsck/fsck.c         |   2 +-
>   fsck/fsck.h         |   4 +-
>   fsck/inject.c       | 515 ++++++++++++++++++++++++++++++++++++--------
>   fsck/inject.h       |   1 +
>   fsck/main.c         |  14 +-
>   fsck/mount.c        |  61 ++++--
>   include/f2fs_fs.h   |   1 +
>   lib/libf2fs_zoned.c |   6 +-
>   man/dump.f2fs.8     |   3 +
>   man/fsck.f2fs.8     |   3 +
>   man/inject.f2fs.8   |  43 +++-
>   13 files changed, 552 insertions(+), 128 deletions(-)
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
