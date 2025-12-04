Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD9CA5948
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Dec 2025 23:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9q/H5vzbCEQsyP3Um5bq7V7gpJkQzYWxMrodHBJBoY=; b=RH2iTJCmFPFsKzq8YR06jag8QH
	3riArm00CPs3egDuJmsdIxaHPks1b8Y3a/bpKafkvVPKyiF4RJ6fPvTlJo1U+xqgQtuHrdRZnIvPq
	9uMoht6P7Qd7XIG7RajJyAAIB916DVXCBv4+G2DByI1wQ9i0Sq+aTjQ8kKQMeDkJHl3o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRHMg-00027b-SD;
	Thu, 04 Dec 2025 21:59:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vRHMe-00027U-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 21:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjkv0FHMLLHRqOLb46t9bx7SvQm2somUmiWS3ldyNk4=; b=Z6snQzFWVmR26F/46kChkeRaCI
 0s6EtpVsr4KbVF0mrh8AUNQCFlPYpwY7mBW7kylJ6Uhsj2DaB2rvqwmi0crXODCSwFiEgf+Z4gdVI
 7DO9+EUlylVx8ocDBcOEsnunoxl4VUlANX86ctj1w9zdLHuK7gMu1mzaubs3aoXXiHuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wjkv0FHMLLHRqOLb46t9bx7SvQm2somUmiWS3ldyNk4=; b=ZuhbJBFEWPylYtKzqcWdq9nBfN
 mpy3tfv3lfNunsLjomzh7CH/AzbbD3nV/eKGxGBURAxWOKUsmNzMbMNeZu4CXCkJAhXRfhVrF+mBG
 fh7/INwvyYF2yHFWxfjbnVIGlDTTv2Ym75NYfmbUxNwH0ZxEVGRNSvjZn906ja9hCNAo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vRHMe-0001Ze-B4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 21:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4DF840400
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 Dec 2025 21:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F997C4CEFB;
 Thu,  4 Dec 2025 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764885581;
 bh=BUcQWs/vguk/FMfGF4LR6FgNh7gOnALaP4H43tcWHiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9qNF8JWq7GPOc1KdDKsljVo2f+4Fv1ZaR347BDYJzVbTD9vzOt1PakXyezZkWlY5
 2MBfTviQQrco2t57MKKWYrTKwHFJFLYRLmsWmiF1le9K1+skMzc/SdDMRdYzDowECY
 W5IbN/HXb/EshSjJY+uUUJ8zc5uPsdU+mfXIGGJd8gTWFhFHEsTYbMFEjOXsIzvJK3
 bfRQdzanIeh0DUqpvDwer9wXVTI9pTHtzRvAsqRPz98X7rYBL2gq/OBgTrBb83k509
 7QU1Bsqgawy3CZrJReJ8UPRPq3mZHUH3gkVD3QXJoUmY7hSNKq1ZGYgu+yOKn3DJmM
 a777KwSTEs8cw==
Date: Thu, 4 Dec 2025 13:59:41 -0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251204215941.GF89454@frogsfrogsfrogs>
References: <20251203193147.3320893-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251203193147.3320893-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 04, 2025 at 03:31:47AM +0800, Chao Yu wrote: >
 generic/233 3s ... - output mismatch (see
 /share/git/fstests/results//generic/233.out.bad)
 > --- tests/generic/233.out 2025-01-12 21:57:40.25 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vRHMe-0001Ze-B4
Subject: Re: [f2fs-dev] [PATCH] common/quota: fix to wait for all inodes
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

On Thu, Dec 04, 2025 at 03:31:47AM +0800, Chao Yu wrote:
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
> in between in-memory one and on-disk one.
> 
> The reason is cgroup v2 implementation requires to increase inode reference,
> and then attach it to thread related cgroup writeback structure, once it
> needs to switch once write owner changes of target inode, a kernel thread
> will process it and then release inode reference via evict_inode().
> 
> So, sync & drop_cache may not guarantee all inodes being evicted, as cgroup
> has one more refernece on inodes during the time.
> 
> If inode has not been evicted, dquot inode reference will not be release, it
> will lead to inode quota mismatch.
> 
> Let's add a delay to wait for cgroup switching completion before quota check.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/quota | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/common/quota b/common/quota
> index a51386b1..de7e84e8 100644
> --- a/common/quota
> +++ b/common/quota
> @@ -333,6 +333,9 @@ _check_quota_usage()
>  	# XXX: really need an ioctl instead of this big hammer
>  	echo 3 > /proc/sys/vm/drop_caches
>  
> +	# wait for inode_switch_wbs_wor_fn() to release inodes
> +	sleep 3

Odd -- I've never seen this problem crop up on ext4 or XFS.  What's
different about f2fs such that writeback is still in progress?

Oh, XFS cycles the mount and ext4 does ... quotaoff???

Perhaps the sleep 3 thing should only be done for f2fs?  Or do you see
it on other filesystems as well?

--D

> +
>  	VFS_QUOTA=0
>  	case $FSTYP in
>  	ext2|ext3|ext4|f2fs|gfs2|bcachefs)
> -- 
> 2.49.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
