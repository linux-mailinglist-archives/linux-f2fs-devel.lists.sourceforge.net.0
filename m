Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BBFB995
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 21:20:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUz8C-0000sb-1Z; Wed, 13 Nov 2019 20:20:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iUz8B-0000sT-40
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J36MeCdDmZVO9gHifAOFkA4+LNpvhMYIQRt5DTEy/uc=; b=LjScWQ8Wt9yo1hRoDx3B6yayHK
 LHBTi1NkiATGfDB3Wwq+KcEKcx7cTiGu/d3InV3EKhulIdcUYyRtSZx03MafHEpJKhduIkx3pIqVu
 BI/kSw9CMhEzch1+2MRU9lhOM4PPD67LwJIIgRUBhE9sSlhNxqTOwmrTxpQtIZ1wYyMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J36MeCdDmZVO9gHifAOFkA4+LNpvhMYIQRt5DTEy/uc=; b=OCZNLX4BuQF3omstGeaEdZ67MU
 fmyKvBmXcDP+Rp3sAttU4dX4jZ6N3dgtNvbr08QUNQt1po2kYxexEHbKqESD1Cb86d5V3gInDt8cG
 raEGX0rvXT2CI8qDQ6yGUgmoGJvf1z9tCEhC2d+twNIRT5wmb29VGTPofnH0M1zfNmxI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUz85-00210A-2G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:20:47 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED3B1206EF;
 Wed, 13 Nov 2019 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573676431;
 bh=/lqrjW/pn3WHkfsTZg1madMY7TYvVOk19QgXgKLRxDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wFDEg7TtVMd+mogcu4QvSikB8pCMLL6azG1RBdmMTMRHJWE+I+RkyC8kier70EeA+
 YhhotBOkCzPRNSLXgWRPX0XHp7hn9kdAY0jZzZOWpmltpdaRufbiNvdzEqrqb1c+Kk
 jgW3uy3nC/PSuLFzUniKazSIhj1GrgtCQg/x+Je8=
Date: Wed, 13 Nov 2019 12:20:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20191113202027.GG221701@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-api@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Victor Hsieh <victorhsieh@google.com>
References: <20191029204141.145309-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029204141.145309-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUz85-00210A-2G
Subject: Re: [f2fs-dev] [PATCH 0/4] statx: expose the fs-verity bit
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 29, 2019 at 01:41:37PM -0700, Eric Biggers wrote:
> This patchset exposes the verity bit (a.k.a. FS_VERITY_FL) via statx().
> 
> This is useful because it allows applications to check whether a file is
> a verity file without opening it.  Opening a verity file can be
> expensive because the fsverity_info is set up on open, which involves
> parsing metadata and optionally verifying a cryptographic signature.
> 
> This is analogous to how various other bits are exposed through both
> FS_IOC_GETFLAGS and statx(), e.g. the encrypt bit.
> 
> This patchset applies to v5.4-rc5.
> 
> Eric Biggers (4):
>   statx: define STATX_ATTR_VERITY
>   ext4: support STATX_ATTR_VERITY
>   f2fs: support STATX_ATTR_VERITY
>   docs: fs-verity: mention statx() support
> 
>  Documentation/filesystems/fsverity.rst | 8 ++++++++
>  fs/ext4/inode.c                        | 5 ++++-
>  fs/f2fs/file.c                         | 5 ++++-
>  include/linux/stat.h                   | 3 ++-
>  include/uapi/linux/stat.h              | 2 +-
>  5 files changed, 19 insertions(+), 4 deletions(-)

Applied to fscrypt.git#fsverity for 5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
