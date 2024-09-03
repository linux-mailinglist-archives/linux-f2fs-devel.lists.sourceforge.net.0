Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45B96A44B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 18:29:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slWPe-0004q8-EJ;
	Tue, 03 Sep 2024 16:29:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1slWPY-0004py-UK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 16:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C86PEr1XhwhBenjNEO6dMgSwx2bLiE0KYyM/M7q4kvk=; b=L9VEFkGMaBrczxj1VaD94zSncw
 z6pJXvHFHmdvqLhYxABf3V0n/n5PBgnOvxkF/QWUrjtcFWMOyffv97YI+egmvNgGRbujHX89ZXyJL
 5urPo7HifNx2M+XPyzCJlwlPfQN514iX4qYhUC3mO6Klw/85YN1EA5IGEzQeMSBHSSLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C86PEr1XhwhBenjNEO6dMgSwx2bLiE0KYyM/M7q4kvk=; b=fIvcH0j/Eb9KtZzaB6SOa5yKwk
 Di6pp4bspgw5mWg53rd7gVHpuvzONQ4FaZoRtlGaAytrBKC+ylUpnS7Kf5vNSRyiyWqrjPHsZfDyS
 Z25JBfHpWC+TQn4fpDY4QG7mMKgk625m5g/uLNIxQmztn58/uAiqfa+k8uICw5CnlOHI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slWPY-0002HT-1e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 16:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 13429A43CCB;
 Tue,  3 Sep 2024 16:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2E8C4CEC8;
 Tue,  3 Sep 2024 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725380972;
 bh=EJ6Qf87LF+8EEuxbRvNJ7RXNZ9lSq9Z1jt1pM/CA0DI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7zc3eXbphsEbKYxwNbQdLIaLm6GjCC8A3CYECftE8c8++uAYSOXmPebtZ1SvlBcN
 8+kaFR2E52gOgpcOpPYa9pMSp07q8bpuulsarniDXsnF3QZu2OLMT6QFAWbcIEmpFo
 jkAkAikjSDaQB3jLs8vRZ5G5n02j3Y8wzW9pmKS+HQFyN+XC43LbkBAqUSIipDvKwB
 DuA8nJopOoGjvjJavbPSAkgddgtwtrc/nZJhO84il/3fDAFMRWaqtoFy5MNRnUbt23
 Y55ErbW/KqIk9VXD53olQds6nbEPxXhJYcy6R+8ZlZIMrLPtefEQykfdoTqwPo1v5i
 hKH+QEZHg7HPw==
Date: Tue, 3 Sep 2024 09:29:30 -0700
To: Wu Bo <bo.wu@vivo.com>
Message-ID: <20240903162930.GA2743@sol.localdomain>
References: <cover.1725334811.git.bo.wu@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 03, 2024 at 02:54:44AM -0600,
 Wu Bo via Linux-f2fs-devel
 wrote: > The inode in F2FS occupies an entire 4k block. For many small files, 
 this means > they consume much more space than their [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slWPY-0002HT-1e
Subject: Re: [f2fs-dev] [PATCH 00/13] f2fs: introduce inline tail
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 03, 2024 at 02:54:44AM -0600, Wu Bo via Linux-f2fs-devel wrote:
> The inode in F2FS occupies an entire 4k block. For many small files, this means
> they consume much more space than their actual size. Therefore, there is
> significant potential to better utilize the inode block space.
> 
> Currently, F2FS has two features to make use of the inode block space: inline
> data and inline xattr.
> 
> Inline data stores file which size is smaller then 3.5k in inode block. However,
> for slightly larger small files, there still have much waste.
> For example, a 5k file requires 3 blocks, totaling 12k of space, which is
> more than twice the size of the file itself!
> 
> Additionally, the end of a file often does not occupy an entire block. If we can
> store the end of the file data within the inode block, we can save an entire
> block for the file. This is particularly important for small files.
> 
> In fact, the current inline data is a special case of inline tail, and
> inline tail is an extension of inline data.
> 
> To make it simple, inline tail only on small files(<64k). And for larger files,
> inline tails don't provide any significant benefits.
> 
> The layout of an inline tail inode block is following:
> 
> | inode block     | 4096 |     inline tail enable    |
> | --------------- | ---- | --------------------------|
> | inode info      | 360  |                           |
> | --------------- | ---- | --------------------------|
> |                 |      | extra info         | 0~36 |
> |                 |      | **compact_addr[16] | 64   |
> | addr table[923] | 3692 | reserved           | 4    |
> |                 |      | **tail data        |      |
> |                 |      | inline_xattr       | 200  |
> | --------------- | ---- | --------------------------|
> | nid table[5]    | 20   |
> | node footer     | 24   |
> 
> F2fs-tools to support inline tail:
> https://lore.kernel.org/linux-f2fs-devel/20240903075931.3339584-1-bo.wu@vivo.com
> 
> I tested inline tail by copying the source code of Linux 6.9.7. The storage
> space was reduced by approximately 8%. Additionally, due to the reduced IO, the
> copy time also reduced by around 10%.
> 
> This patch series has been tested with xfstests by running 'kvm-xfstests -c f2fs
> -g quick' both with and without the patch; no regressions were observed.
> The test result is:
> f2fs/default: 583 tests, 6 failures, 213 skipped, 650 seconds
>   Failures: generic/050 generic/064 generic/250 generic/252 generic/563
>       generic/735
>       Totals: 607 tests, 213 skipped, 30 failures, 0 errors, 579s
> 
> Wu Bo (13):
>   f2fs: add inline tail mount option
>   f2fs: add inline tail disk layout definition
>   f2fs: implement inline tail write & truncate
>   f2fs: implement inline tail read & fiemap
>   f2fs: set inline tail flag when create inode
>   f2fs: fix address info has been truncated
>   f2fs: support seek for inline tail
>   f2fs: convert inline tail when inode expand
>   f2fs: fix data loss during inline tail writing
>   f2fs: avoid inlining quota files
>   f2fs: fix inline tail data lost
>   f2fs: convert inline tails to avoid potential issues
>   f2fs: implement inline tail forward recovery
> 
>  fs/f2fs/data.c     |  93 +++++++++++++++++++++++++-
>  fs/f2fs/f2fs.h     |  46 ++++++++++++-
>  fs/f2fs/file.c     |  85 +++++++++++++++++++++++-
>  fs/f2fs/inline.c   | 159 +++++++++++++++++++++++++++++++++++++++------
>  fs/f2fs/inode.c    |   6 ++
>  fs/f2fs/namei.c    |   3 +
>  fs/f2fs/node.c     |   6 +-
>  fs/f2fs/recovery.c |   9 ++-
>  fs/f2fs/super.c    |  25 +++++++
>  fs/f2fs/verity.c   |   4 ++
>  10 files changed, 409 insertions(+), 27 deletions(-)

This is disabled on encrypted files, right?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
