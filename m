Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 388BF2CE6C4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 05:02:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl2IF-00026t-Pn; Fri, 04 Dec 2020 04:02:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kl2ID-000267-K0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48AvZ7PEKImUMGHBldSjsIFvuxOOtcBCd/Y7TmuHWLo=; b=NPkQS3XgBxIqnGf+k8HirlLTyq
 v0nO8fHUmtGyQwTKspdyGWG3hmiI1sNweMP/phsag2522cHkj+E5+sTnfJ2hUS11thE3r7HWY2FZx
 zokPLSeoXJ4aUqP900ofe5GxXuheyYKmMI63wOt4rkrc4R8HAASWD6hgqFeBA23eEQq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48AvZ7PEKImUMGHBldSjsIFvuxOOtcBCd/Y7TmuHWLo=; b=P4Hd6yU62XCQkzZ2xHmadYU6Wv
 6qxUQ57mtautUZV2S4CQ8N1CgiGgV1Y78SEa4yadBDvUVLAiU1+dk1Kajl7ZfXzuPf32/UyKDZnMF
 bAYzk8UfOFXkvh3P+6tZrNmgNQ6gKiVpHx9SbYtA1+mqiHco/HdA/yCAN2ffLvVhxH4M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kl2I5-0012Nx-1U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:02:01 +0000
Date: Thu, 3 Dec 2020 20:01:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607054507;
 bh=DcfkWsDbsf/JOEQ79AZ1Kv2EVoF9gtQ63C/irFhCC60=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsJhD0lEDweOLSefcJ+JBO59ev7ZiiljHLUPejv44ascpkB9kMvOsTtR6vDlHT/zF
 sSlYCgX3qzDfw+z4LsfYuI4ymFm3g3SGXWcgvOVmabjVRd5YBYhM31iwRxuemztw7J
 dv9C3i/ZC1PnP9/T8KfEOgHwhi13sMSLTtYyGQYVOFx+U9hrI2V39iVogAqZM5t6dM
 jmXJPqAHUVWC0PYnRciyfXLPFFUWrZEUiRAMAw/e0Z67phzdQAyNFcWWH8k5AjHFKo
 Snwqpbn7+jcPiUv1xfAgTpmS/LHVZeiVEEbQJ+bplOGGELryNjGfVKWm+FhF9q0h+S
 LtZeMi/ZXervg==
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X8m0qbd7rvQyiwOt@sol.localdomain>
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl2I5-0012Nx-1U
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 12:43:23PM +0900, Daeho Jeong wrote:
> STEP_VERITY is enabled by f2fs_need_verity() and the function is like below.
> We already know the second condition (idx < DIV_ROUND_UP...) is
> satisfied when invoking f2fs_alloc_dic().
> 
> static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
> {
>         return fsverity_active(inode) &&
>                idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
> }

Are you sure?  I thought that compression (and encryption) apply to the whole
file, including any Merkle tree blocks past i_size.

Also, even if you include the i_size check, it's still wrong to check
fsverity_active() in the middle of the I/O because FS_IOC_ENABLE_VERITY can
execute concurrently, causing fsverity_active() to return false at the beginning
of the I/O and true later in the I/O.  It needs to be checked only once, at the
beginning...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
