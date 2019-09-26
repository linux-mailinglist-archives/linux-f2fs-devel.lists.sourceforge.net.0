Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D15DBFAA1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2019 22:38:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDaWf-0001IQ-GV; Thu, 26 Sep 2019 20:38:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iDaWd-0001IJ-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 20:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dMIiSb4Vcjz/dbLL+Alk7FB/2RvnkOCh6/NrWjt/Y8=; b=TQbfVqqCc3v6Rk208c8aFj5mmZ
 uGAX589DAe+E2Q31xQw9ef1OgVKN9rvI8hGXN2XBoOGtyjviEnF7BmJ/zwGFZ+oLA5GLU1FYxggJU
 7UrDSAcPC0++loCUjy4XP1JCve7m1kG0ixrWi+REl7hCeaFoai1ly3Bvci1Brv7dDdss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4dMIiSb4Vcjz/dbLL+Alk7FB/2RvnkOCh6/NrWjt/Y8=; b=R1vskxsDLO5oJhKyWwums1ADjw
 +6MruEXhpozKtLJNBu6DuEHb8EpXFZ2Rf68/GyDH2JgLIU/oI3nmvW/+q9vqeKo6xM9GlIK+YzyDv
 npnrXBpwkP4XN8RUJtaZhSigYEgQ8a3a6o8VIKgAdR4uuYK43b8NfTb6bjlrOluIMt10=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDaWa-00ALlF-03
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 20:38:07 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D5A1222C3;
 Thu, 26 Sep 2019 20:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569530278;
 bh=tl77Fa8o20Wcg+cK5PotYO32YWsmNhCUsbBLzQpNIyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+rOV8/bubTG9L7PMtt35j56ED88jy7zgGX/fqzv7qF2xmJ5r0qe7dD6cPQRqwPi2
 bP5xugJnHMkk7AOz8pEKIPoMj5hizkC5qhXpSRBsylY19uJPkyIxQMuxRfNaDCs8TF
 +DTKKw0wnva0tZl3wwfA8D8sD+Io/ep9TzwGXA5g=
Date: Thu, 26 Sep 2019 13:37:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190926203755.GA142676@gmail.com>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190816030334.81035-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816030334.81035-1-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDaWa-00ALlF-03
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 16, 2019 at 11:03:34AM +0800, Chao Yu wrote:
> There is one case can cause data corruption.
> 
> - write 4k to fileA
> - fsync fileA, 4k data is writebacked to lbaA
> - write 4k to fileA
> - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
> - write 4k to fileB
> - kworker flush 4k to lbaA due to SSR
> - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
> data
> 
> One solution is tracking all fsynced file's block history, and disallow
> SSR overwrite on newly invalidated block on that file.
> 
> However, during recovery, no matter the dnode is flushed or fsynced, all
> previous dnodes until last fsynced one in node chain can be recovered,
> that means we need to record all block change in flushed dnode, which
> will cause heavy cost, so let's just use simple fix by forbidding SSR
> overwrite directly.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9d9d9a050d59..69b3b553ee6b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  		if (!f2fs_test_and_set_bit(offset, se->discard_map))
>  			sbi->discard_blks--;
>  
> -		/* don't overwrite by SSR to keep node chain */
> -		if (IS_NODESEG(se->type) &&
> -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> +		/*
> +		 * SSR should never reuse block which is checkpointed
> +		 * or newly invalidated.
> +		 */
> +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
>  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
>  				se->ckpt_valid_blocks++;
>  		}
> -- 

FYI, this commit caused xfstests generic/064 to start failing:

$ kvm-xfstests -c f2fs generic/064
...
generic/064 3s ... 	[13:36:37][    5.946293] run fstests generic/064 at 2019-09-26 13:36:37
 [13:36:41]- output mismatch (see /results/f2fs/results-default/generic/064.out.bad)
    --- tests/generic/064.out	2019-09-18 04:53:46.000000000 -0700
    +++ /results/f2fs/results-default/generic/064.out.bad	2019-09-26 13:36:41.533018683 -0700
    @@ -1,2 +1,3 @@
     QA output created by 064
     Extent count after inserts is in range
    +extents mismatched before = 1 after = 50
    ...
    (Run 'diff -u /root/xfstests/tests/generic/064.out /results/f2fs/results-default/generic/064.out.bad'  to see the entire diff)
Ran: generic/064
Failures: generic/064
Failed 1 of 1 tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
