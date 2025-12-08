Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0ECADCC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Dec 2025 18:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOk2gaMT3gitYIlt67GbwIHogK5IbTGYXIgKD7Sbu3A=; b=ZpK+6wAmPachsNgEZi1eyInMxK
	SDAe7YUjar34nCJhjZgCICpTjTbKqFY47XHslX2zjpSK5y0a5lVmN5ZYSOyKEbqY+/e3bqKfCKxNj
	9nFMSJBEsWTbw4yi+aC8kyV4PiYEN70PwLYgyg/yyDgcLQStBSJ1bhcQ4LzNSLxlqkDg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vSed0-0000Nl-EV;
	Mon, 08 Dec 2025 17:02:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vSecy-0000Nf-LS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Dec 2025 17:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F4KOkfq3QHb1omZnV64y6JJ/bcC2vGWRF84zuCHJPDE=; b=SzhsOqWUgK8g2amY8Yl08pYafu
 CkGM18Jw77/2QPqTgH752urgKbiWOWTkNsxUhRCvV5RpXt/RNjizhqnQEfBo7D3HFbpQTHB8p5Mc0
 kpbYupUBfKNhgt1+Ue9/Y/nwJqpGiG/K8JZjFcCCBL7GvKfKl4orRkDQWNzHIFbb2M44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F4KOkfq3QHb1omZnV64y6JJ/bcC2vGWRF84zuCHJPDE=; b=biDwpoLEIAs+jJkIa0+98jnX+Y
 a9NaP2qXEYU137qluvOlw7zJ06QLX5+NCBjxMz2Bn7PEQQah033460K14aiVBgRtYPesOIFOcFoKW
 HF5jFvYfFxQWPVcmqHBMCVSgMx800KGSqrDp/FBwwq/zhlASvjt9mc6Cgbt1qQu3mo+A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vSecy-0002ZN-1f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Dec 2025 17:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3ECA4070B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Dec 2025 17:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817E3C4CEF1;
 Mon,  8 Dec 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765213338;
 bh=oZPuXrKRkIoq5VzN5CkcVRdbw+peJK33IjgtELaMXkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=byvtkpg1RkwaNnO3wX1raUnlM8h67viUmmLVv4K1G55/MJYA7YTPkUtNhWvnnArw6
 9DxJgULeNSRUYxofKtxhAHl9odfesKgGYiDxY0IUv0pr6mTzIIXM93R3zmjlH0ASqM
 egi7G7Te2x97o7Vv+RLwpX6sQi0w8+lx5zMC23DBEeof9Fn+g/dF9WiS3ssVri96wj
 DErq9mnFuGOc78x9sOVsPkKJMa9jQpvc2Orw6ZGLGppq81RirarrHyIhlkaNVsI69u
 xCetFf+MK37frqjOq1Oel1Y280OdgGB58dqnf0jYIqLBojkRAGN0yt7iz9OyEPSsO4
 HH1RSIEJR8C2Q==
Date: Mon, 8 Dec 2025 09:02:17 -0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251208170217.GG89454@frogsfrogsfrogs>
References: <20251206004017.4021067-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206004017.4021067-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 06, 2025 at 08:40:17AM +0800, Chao Yu wrote: >
 generic/233 3s ... - output mismatch (see
 /share/git/fstests/results//generic/233.out.bad)
 > --- tests/generic/233.out 2025-01-12 21:57:40.25 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vSecy-0002ZN-1f
Subject: Re: [f2fs-dev] [PATCH v2] common/quota: fix to wait for all inodes
 been evicted in _check_quota_usage()
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Dec 06, 2025 at 08:40:17AM +0800, Chao Yu wrote:
> generic/233  3s ... - output mismatch (see /share/git/fstests/results//generic/233.out.bad)
>     --- tests/generic/233.out   2025-01-12 21:57:40.259440359 +0800
>     +++ /share/git/fstests/results//generic/233.out.bad 2025-12-04 03:02:26.000000000 +0800
>     @@ -4,4 +4,12 @@
> 
>      seed = S
>      Comparing user usage
>     +4c4
>     +< #1000     --   31476   32000   32000            994  1000  1000
>     +---
>     +> #1000     --   31476   32000   32000            944  1000  1000
>     ...
>     (Run 'diff -u /share/git/fstests/tests/generic/233.out /share/git/fstests/results//generic/233.out.bad'  to see the entire diff)
> Ran: generic/233
> Failures: generic/233
> Failed 1 of 1 tests
> 
> Sometimes, generic/233 will fail due to it founds inode count is mismatched
> in between quota system and filesystem.
> 
> The reason is cgroup v2 implementation will increase inode reference first,
> and then, attach it to thread related cgroup writeback structure, once it
> needs to switch write owner of target inode, a kernel thread will process
> it, and finally release inode reference via evict_inode().
> 
> So, sync & drop_cache may not guarantee all inodes being evicted, as cgroup
> has one more referenece on inodes during the time.
> 
> If inode has not been evicted, dquot inode reference will not be release, it
> will lead to inode count mismatch.
> 
> Let's add a delay to wait for cgroup switching completion before quota check.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - sleep only for f2fs case
>  common/quota | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/common/quota b/common/quota
> index a51386b1..a7239501 100644
> --- a/common/quota
> +++ b/common/quota
> @@ -333,6 +333,11 @@ _check_quota_usage()
>  	# XXX: really need an ioctl instead of this big hammer
>  	echo 3 > /proc/sys/vm/drop_caches
>  
> +	if [ $FSTYP == "f2fs" ]; then
> +		# wait for inode_switch_wbs_wor_fn() to release inodes
> +		sleep 3
> +	fi
> +
>  	VFS_QUOTA=0
>  	case $FSTYP in
>  	ext2|ext3|ext4|f2fs|gfs2|bcachefs)

Why not use case statement down here?

--D

> -- 
> 2.49.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
