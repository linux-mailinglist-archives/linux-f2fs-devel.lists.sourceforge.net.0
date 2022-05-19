Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32E52CA7F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 05:43:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrX4S-0004AZ-2D; Thu, 19 May 2022 03:43:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrX4Q-0004AT-Rp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0RnMp/THk5B97tWBa1VI5VSJV/g81ySpO94xdU/7gyo=; b=j4qWBaOKxgDL0pcwEAtgxwzN5s
 oWITrah3X3/3Ye8XWb6rH28Xt04aBCbt9e9RL48HLh6qIS53DM+qk128Q9iM5aveNm5UjM+Gj8E7H
 3nopgZBU9ehkg6x/8PagMPk0pcMKX+SSTFjajkccEF5dX12EQMPSGxMIlQ41BHksKrbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0RnMp/THk5B97tWBa1VI5VSJV/g81ySpO94xdU/7gyo=; b=aB7767pVs2Dy6iYFEvf+44D081
 A6h5tWVa78z35t2I9H5fOrQTIDphPaMBb9nmaKg7ZXE1utBRY1jFFIiN0J6KtgHwSfPYRHkgIaMHQ
 VRI56dAwr8+hUOQupzu3WV7g2NzM6z7lNQ/manamM1DP2jmzodZp229Gyq+bHjiKZZ1M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrX4N-008A8N-MW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 03:43:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5AA7B822CD;
 Thu, 19 May 2022 03:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEA9C385B8;
 Thu, 19 May 2022 03:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652931789;
 bh=eN+YB322uw3mBoCdzG+0eJr0YGcK+eFnSZOu6Ac7z84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mk5u6CwF3JKOcFsw1A+FmfnPm2gEpggvWc3OS4aFz7ojJssuGqAfNw+Qh+O0HlW1K
 fDdR8jyNIaYvVAGrSMfJzvDJWmeBo0r0t1KQIP5w+EFA03vNr02Vn07sNqAOEZSWF8
 kejOkWr3Z5vdkCKy0NLWdZ8CUXZQJ55VtuSTwxVydbcHeszFzYIwR7+IboHc5AxrSk
 reNnUdAj8Ym6NGoFvuP0ZeEn/qkoNN3Z5qbqzCp4/lzLfcrfWazPJ2xKUL3jUA4K0v
 AlpxK9G+5dVVltDgwOh1oF9sytN2z/UotbJlaVwlltdY7uyvUh1H5FI1Z7kQAdKvw+
 UHIOiH1sH/GbA==
Date: Wed, 18 May 2022 20:43:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoW8yx9Fw9Rwiaja@sol.localdomain>
References: <20220519014044.508099-1-krisman@collabora.com>
 <20220519014044.508099-5-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519014044.508099-5-krisman@collabora.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 09:40:40PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of reimplementing ext4_match_ci, use the new libfs
 helper. > > It should be fine to drop the fname->cf_name in the en [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrX4N-008A8N-MW
Subject: Re: [f2fs-dev] [PATCH v6 4/8] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 09:40:40PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of reimplementing ext4_match_ci, use the new libfs helper.
> 
> It should be fine to drop the fname->cf_name in the encrypted directory
> case for the hash verification optimization because the only two ways
> for fname->cf_name to be NULL on a case-insensitive lookup is
> 
>  (1) if name under lookup has an invalid encoding and the FS is not in
>  strict mode; or
> 
>  (2) if the directory is encrypted and we don't have the
>  key.
> 
> For case (1), it doesn't matter, because the lookup hash will be
> generated with fname->usr_name, the same as the disk (fallback to
> invalid encoding behavior on !strict mode).  Case (2) is caught by the
> previous check (!IS_ENCRYPTED(parent) ||
> fscrypt_has_encryption_key(parent)), so we never reach this code.

The code actually can be reached in case (2), because the key could have been
added between ext4_fname_setup_ci_filename() and ext4_match().

I *think* your change doesn't make it any worse, since in such a case the name
comparison is going to be comparing a no-key name to a regular one, which will
very likely fail.  So adding an additional way for the match to fail seems fine.

It's hard to reason about, though.  f2fs does things in a much cleaner way, as
I've mentioned before, since it decides which type of match it wants at the
beginning, when initializing struct f2fs_filename.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
