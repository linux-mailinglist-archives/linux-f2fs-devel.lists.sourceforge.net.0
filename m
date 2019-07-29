Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2478397
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 05:12:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrw5W-0006h6-16; Mon, 29 Jul 2019 03:12:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hrw5U-0006gz-S7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 03:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nTtGaf/+2Bx1Nfw5Aqudixdg+zTjoGCWtwamkEbg4/k=; b=NIVl75QZbwe1K8zeTzgni9za/8
 oA9dRyXl32BBlSVdSZ55EmGC4jDyrDerVsyqf25fGpwBcbI3A0Hs/6HNAM1mV6f27l5dD+eVA1jl2
 /RzYv69BgBYt53fSbEgQR1Y7O881vl/1g46ex6dSURsuGuN5WMxuv4Koa16Aokftn3U0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nTtGaf/+2Bx1Nfw5Aqudixdg+zTjoGCWtwamkEbg4/k=; b=a
 pWGO+zd4tPeXunoE+VAyVEhhCv6b6tyADcl3pNNISdTNVqujo1bJr4WSOWwEUqfxI9j6eZ/wQFop7
 2yjnGws6NFtHKf1jm/lno4n2MBgrA0xqUQJ+5izzG7tz9TBhQu39pzaHvz08O8RReczPwtGj9A33C
 2HOmpw7kbNk6BraE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrw5S-002Wzs-6u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 03:12:36 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 971712075B;
 Mon, 29 Jul 2019 03:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564369947;
 bh=BKKX38xiDXht50rJXIv/FdzcKNnwvbBHros6Vxt/Dr4=;
 h=Date:From:To:Cc:Subject:From;
 b=Uv3bgux8g0V+8dnXCvzMxhyzS1p+M6PvMZdIWx1U1w9zrjIsFYx7orxJKwDnK9EJJ
 Ii3MOwPd5uYhowVROKEvWWWGm5k2c9PwZaCtsx0fJt0lICeUvecfyDrtinKF4nozAL
 YJht4eyjZJc1Ub1fcfu8QGZSapdLkfH6jqhL8vKI=
Date: Sun, 28 Jul 2019 20:12:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <20190729031226.GA2252@sol.localdomain>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hrw5S-002Wzs-6u
Subject: [f2fs-dev] Add fsverity tree to linux-next
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
Cc: linux-ext4@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-next@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Stephen,

Can you please add the fsverity tree to linux-next?

        https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git#fsverity

This branch contains the latest fs-verity patches
(https://lore.kernel.org/linux-fsdevel/20190722165101.12840-1-ebiggers@kernel.org/T/#u).
We are planning a pull request for 5.4.

Please use as contacts:

        Eric Biggers <ebiggers@kernel.org>
        Theodore Y. Ts'o <tytso@mit.edu>

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
