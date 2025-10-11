Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E611DBCF2A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 10:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whEshhw9uJJq8h9a96Je0YUkG+9U0kT0ZHAxYn0QRPc=; b=COO0XFf+BsdMCFYsELNkbtcQWQ
	iEzCOlqQSJSlnnpSOHe5FgLcA/lMrcFtUfl/SYUtQqX3/dr7r3grfeflv+0Its33tW42FhHhqG+Qf
	+fO/CqF2YWyeUfQ8q1n/nsbdKaipFB00tMo3G5r1Qyx6uM+8f8yeiFaiq81tRM1SeESY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7VOd-000757-QL;
	Sat, 11 Oct 2025 08:56:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7VOc-00074y-BK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ErNxcMZ7E+LedeOpLde+l96985Eg+N98xwY1sV31XkY=; b=AFZBGZXW9BFcbS+4OjOKKPs02C
 Q5mrmteDokpZKljOwTbjo5LONJKxROG3lu7QRHYDxtUZm7LIttFEsNnkGyso4IZFbN61LgXQXoLde
 ss60TrbKIGPdidfKegSbS58qsES6X6Te+326gqR8t+DfY9BLlIwHonqYi7Gxvozc66eU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ErNxcMZ7E+LedeOpLde+l96985Eg+N98xwY1sV31XkY=; b=b2Uxz3tIjcwWk+vKgtRoat6xyK
 jsjU1RRKEJvJr2NwjDmbO0q/SkUGh6UbaaI51x3YjnAQdDDFmO1RzxZq2TWjXyns7xzB2+DtnpPFL
 vieKnba+ycJfUoGLhvLyB9xqCN92RfAZ/yC+gJhkWp8a+BpLHMy7RN/ieGFjXAsOePt0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7VOb-0005fS-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 08:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 019FD603AB;
 Sat, 11 Oct 2025 08:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14EC4CEF4;
 Sat, 11 Oct 2025 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760172958;
 bh=fLYnOhy30DZWeHYLaHtHGNFxE3G/vpcQ8+keFi5zBxA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PJjEPlvkadUtIuyTmWlzC+t/CvfJIIWz6Cwoh0am1ln4py5i0+28WUQ5CGmZtRn6E
 JP1cPhTlqW7XyERg1IaZ2J0ZL4je/IOvKB3QNL85TEGM2haW5yN+vU0f3CG+4KtgLr
 a8Gz7vLYVEnihhc1uoTGasDc8w6PdFEV00Yu69eO17v1PXTd3R+/1gRvEsibQXbERo
 DoE4IDKb5vMVWm72Knz+IMS2s34mAxh4MI4EzuLvY3c7L5c3w2mYsk5R/MwbYLT7f5
 OoDZxBklRm6da+nBLjeyETrzW/aHBxV62N7jOeJZyscChoyZGSKjUqpAuLTUdbcY3c
 kG9CtmU3/tvvQ==
Message-ID: <abf317f1-0b7d-4ef6-8a85-6f8b15e15ce4@kernel.org>
Date: Sat, 11 Oct 2025 16:55:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, Could you please consider merging this patchset?
 Some testcases may rely on these new injection functionality. On 8/25/25
 09:54, Sheng Yong wrote: > Hi, all, > > Since we have not yet determined how
 to check the test result properly, > I split patchset v2 into two parts on
 Chao's suggestion. This is the > firs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7VOb-0005fS-P4
Subject: Re: [f2fs-dev] [PATCH v4 00/13] f2fs-tools & inject.f2fs: bugfix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

Could you please consider merging this patchset? Some testcases may rely on these
new injection functionality.

On 8/25/25 09:54, Sheng Yong wrote:
> Hi, all,
> 
> Since we have not yet determined how to check the test result properly,
> I split patchset v2 into two parts on Chao's suggestion. This is the
> first part which contains some fixes/cleanups for f2fs-tools, and adds
> new injections for inject.f2fs.
> 
> Changes from v3 are also updated in individual patch.
> 
> v4: * update manual page of injecting cp
> v3: * split original patchset into two parts
>     * update manual
>     * refactor inject sit/nat in journal
>     * fix memleak
>     https://lore.kernel.org/linux-f2fs-devel/08ec4cbe-b140-4dc7-94a4-85d6044f4643@kernel.org
> v2: * add some fix and cleanup
>     * remove img.tar.gz from testcases
>     * add testcases for injection
>     * cleanup helpers script and simplify filter.sed and expected.in
>     https://lore.kernel.org/linux-f2fs-devel/20250610123743.667183-1-shengyong1@xiaomi.com/
> v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/
> 
> Sheng Yong (13):
>   fsck.f2fs: do not finish/reset zone if dry-run is true
>   f2fs-tools: add option N to answer no for all questions
>   f2fs-tools: cleanup {nid|segno}_in_journal
>   fsck.f2fs: fix invalidate checkpoint
>   dump.f2fs: print more info
>   f2fs-tools: add and export lookup_sit_in_journal
>   inject.f2fs: fix injecting sit/nat in journal
>   inject.f2fs: fix injection on zoned device
>   inject.f2fs: fix and cleanup parsing numeric options
>   inject.f2fs: add members in inject_cp
>   inject.f2fs: add member `feature' in inject_sb
>   inject.f2fs: add members in inject_node
>   inject.f2fs: add member `filename' in inject_dentry
> 
>  fsck/dump.c         |  15 +-
>  fsck/f2fs.h         |  12 +-
>  fsck/fsck.c         |   2 +-
>  fsck/fsck.h         |   4 +-
>  fsck/inject.c       | 515 ++++++++++++++++++++++++++++++++++++--------
>  fsck/inject.h       |   1 +
>  fsck/main.c         |  14 +-
>  fsck/mount.c        |  61 ++++--
>  include/f2fs_fs.h   |   1 +
>  lib/libf2fs_zoned.c |   6 +-
>  man/dump.f2fs.8     |   3 +
>  man/fsck.f2fs.8     |   3 +
>  man/inject.f2fs.8   |  46 +++-
>  13 files changed, 555 insertions(+), 128 deletions(-)
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
