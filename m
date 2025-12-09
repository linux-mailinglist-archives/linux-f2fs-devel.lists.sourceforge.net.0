Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4FCB0E07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 19:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOILwZgbrvc3G+J05nMmUCbdK1ezyFXW7KHoJ25t9OI=; b=Fd8o4dcf047z8t/dQJg1GhAsG7
	tXzss/dIxTAna4dkjUsWRCo/fQKWovUfnu5uSrKee0Aqfvq3mNecI9A4uxjKneRfUExleXrbx0K28
	jylkpHePqLEfmbaeSWZTyn0N41zO/dGGXpyZtpgN9xF5FQldLGnJMlpyQXBCZJeTVrt0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vT2rv-0005aN-Sf;
	Tue, 09 Dec 2025 18:55:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vT2ru-0005aF-JI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 18:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u0fsDuKfCBr2/axpYS/mERssG3vRqc5iTj1PW2ds7ys=; b=Affk7Zj52tybt0gtsSWilDBDZY
 kjkrMhiTKnRgFxcg5fZyuWPHdDC8YEPygfy3n5fxVENewwOGmMs4l8xb3K5A1yEGrrYLQY/Ge4uHi
 +eKdA4R3BzLjbpp6CyoVtoCl2FmTbQTT6tVD8alFMUBXG3OeB/nHgsQ0PeT41ZWYVyJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u0fsDuKfCBr2/axpYS/mERssG3vRqc5iTj1PW2ds7ys=; b=Wv3sgTunxHF00YWfzFg91F0nnR
 YLb+PJLEKur1U1yR98YLt/qimeAg6h8dkmAoIDY/IxLt8O/iWuQGbKzKHLckCfXhlhTFCVy65oQy8
 Cs47Oxnr40saES1/h1kn6pNqbnZx8j+UPbnQ6t/vMymjxJTahnUNifCqKNKLMGV6tiEo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vT2ru-0007gV-48 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 18:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5AD36600B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 18:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF51C4CEFB;
 Tue,  9 Dec 2025 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765306515;
 bh=3WrozUFqPGB8+e4lk3pq31YrQsM8LNegYZnVEuog13M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D+mztOHe+FeCSu07tHaEVA2ee4K4K44jgtN3WE2LTv7ovqkbzpO8o90oJJBwMM0rO
 0Uf/XEq2DDKnBp0rvs8BSwAH/4PxQCIem1QnkVXHUopUtlaj/TwObyYXgcYoQbC9JS
 ohvLChsr4noa/9gLCSpCBQl7rMKANWcq34kipuFFaiqxcIc2OQmsS2Kht3v2XPlZNl
 DTb66PGHHXf5io/UPlXvKU1RJ/eGY+Yp1mvQYy/kSZdj4WikyqxAgx9jhunn6FWQJU
 fKK9gz4enjsHLC44wowQbRRRD769rcjLmqxN+GgsLpePFaX3KnWBbA3pw732ofDDsA
 tL/hIYMkYpLVA==
Date: Tue, 9 Dec 2025 10:55:14 -0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251209185514.GK89492@frogsfrogsfrogs>
References: <20251209075028.909869-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251209075028.909869-1-chao@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 09, 2025 at 03:50:28PM +0800, Chao Yu wrote: >
 generic/233 3s ... - output mismatch (see
 /share/git/fstests/results//generic/233.out.bad)
 > --- tests/generic/233.out 2025-01-12 21:57:40.25 [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vT2ru-0007gV-48
Subject: Re: [f2fs-dev] [PATCH v3] common/quota: fix to wait for all inodes
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

On Tue, Dec 09, 2025 at 03:50:28PM +0800, Chao Yu wrote:
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

Looks fine to me now,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
> v3:
> - sleep in existed case statement rather than in newly added check condition
>  common/quota | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/common/quota b/common/quota
> index a51386b1..5d351fdf 100644
> --- a/common/quota
> +++ b/common/quota
> @@ -335,7 +335,14 @@ _check_quota_usage()
>  
>  	VFS_QUOTA=0
>  	case $FSTYP in
> -	ext2|ext3|ext4|f2fs|gfs2|bcachefs)
> +	ext2|ext3|ext4|gfs2|bcachefs)
> +		VFS_QUOTA=1
> +		quotaon -f -u -g $SCRATCH_MNT 2>/dev/null
> +		;;
> +	f2fs)
> +		# wait for inode_switch_wbs_wor_fn() to release inodes
> +		sleep 3
> +
>  		VFS_QUOTA=1
>  		quotaon -f -u -g $SCRATCH_MNT 2>/dev/null
>  		;;
> -- 
> 2.49.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
