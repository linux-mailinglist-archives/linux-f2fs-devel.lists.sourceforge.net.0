Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15888217CBF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 03:44:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsz8j-0005aj-KP; Wed, 08 Jul 2020 01:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jsz8i-0005aa-5W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRJllKWRsmcrnIHnVViDVaNCOTPfTHpCJpntiUVZzS8=; b=jZ5x+H+aWJoucs7TmCH1eFAhFv
 K0DTYZ6xpbnlMSI7YV3GC+NV/hXFFfszYxujw+qeXEO+tDntZMDZGZra2WN0SUBo7RCgD9BeajeAi
 mR9UjJk9+CYrOTpA0LZ6VWOga+E6tlPWkm1HwEs8/wt7+xAyDolsOGFkrkIJpO8LtHZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRJllKWRsmcrnIHnVViDVaNCOTPfTHpCJpntiUVZzS8=; b=LlQ/FmoTNzWkEYAveD5BdksQKJ
 MAU3EAURmVNpY1SkQ/wtjVqBYqSO0qjIUyJq8sj3m1Rj6Qij5WTIIC2MlcskNx5m7ySriGKSq/VFt
 MXYG2FRmBroGmQGCP2ySGZ8h1egSBxxCaM6x1/TExM1E209dZUBefTFefWGddrvQ8LKI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsz8h-00DkpM-2x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:44:48 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50755206DF;
 Wed,  8 Jul 2020 01:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594172681;
 bh=pc9r2MlQ4YV78AG0esE4ppDqeMfOm93xI5UmXgp5gqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QA5sGO5qUiLKD4ECswpWLjjMFqRtnVqe1TpN2o5l+JL6AMbY49ekIgI2f+lN+1OzN
 CpYzIZysoQcDNnfJWfLju4xO+Q6RkMAy4njljS9zJ24uFFljUEDXTXsHuSFPA9bRdu
 ocaEleHjB6OsO9CNhqwYyabxBcbLRQwGKW2j0Aco=
Date: Tue, 7 Jul 2020 18:44:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708014439.GH839@sol.localdomain>
References: <20200707113123.3429337-1-drosen@google.com>
 <20200707113123.3429337-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707113123.3429337-5-drosen@google.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsz8h-00DkpM-2x
Subject: Re: [f2fs-dev] [PATCH v10 4/4] ext4: Use generic casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 07, 2020 at 04:31:23AM -0700, Daniel Rosenberg wrote:
> This switches ext4 over to the generic support provided in
> the previous patch.
> 
> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> the maintenance burden by unifying them, and any optimizations will
> immediately apply to both.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/ext4/dir.c   | 64 ++-----------------------------------------------
>  fs/ext4/ext4.h  | 12 ----------
>  fs/ext4/hash.c  |  2 +-
>  fs/ext4/namei.c | 20 +++++++---------
>  fs/ext4/super.c | 12 +++++-----
>  5 files changed, 17 insertions(+), 93 deletions(-)
> 

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
