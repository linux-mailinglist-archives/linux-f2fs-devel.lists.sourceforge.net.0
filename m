Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B692DD51B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:23:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpw3x-00012u-SI; Thu, 17 Dec 2020 16:23:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpw3w-00012n-Go
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pKE6jFW26KS1ufUCtfoiQKnrId0LlHBSj8pwsJcx95c=; b=kontsLD++NF8VOnuQV0zMNO1Fq
 fkCEFlhJUtpO8h/D8N6Lc9iDF2TKBeukTU6Tdx2BqOKi3C46Ge+yMHDW2mebrxSn4ckek34T1dKjW
 lrVb8Mot40JFcbIrx2zVmZ3YWqDcUYlRM+X+41bIWxIwB4StBKsTYeVm9y0/N7J7SruQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pKE6jFW26KS1ufUCtfoiQKnrId0LlHBSj8pwsJcx95c=; b=IlhN11cYl5gNII1IUcy72Afs5G
 C+9P90N9CQ9AvSX6PP+OVnY7dobl7XlJSYk/RzLXYosJlcqcPeW71ci4uRw37bnekHZKaAnijkjbP
 S2NkKVHhNClm5aUJD/LMHEaqVab+j/pkykWv6S4ZQjFGql/Eg4pK0fqgiuGedYv9VZZw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpw3p-0007bF-Do
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:23:32 +0000
Date: Thu, 17 Dec 2020 08:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608222200;
 bh=FMmMjljEOp+bHuNqcOl5KSSyovWSAAXnB0VcyxYZPgw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=LqK0/OvtFHpE9TkJ+OoRyMv/mwPGyfTqxyGRFUmS78LFm5x8LiDzl/X0FmhruF81W
 L034jf4Pp65ZCKO7fDmUgDHh5n/dBM/5crmNlQpUBCPwRWi4W2EpgrQ1T3qxHw9bLI
 MFKSmidrJAHQNhS/gYj0kzmRbdrc8kaabVHxjm+jHNwkNWUY7/t9NN6tjtls+RLjyK
 0PeufVFjZIPnw0kiFjMcF9Z0NQUxligxxEofDHCougp61E+FGehJtlETIMnkR38GRK
 uVB9c6Azmmfai7FqL1SYaT0YWTwXtUt9Wjz30uC2U0nI1/QpcDtDX7JuwwUIeJhbnm
 mRKjEWgIkM/VQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X9uF9kNjWFq8KlL9@google.com>
References: <20201005074133.1958633-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005074133.1958633-1-satyat@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpw3p-0007bF-Do
Subject: Re: [f2fs-dev] [PATCH 0/1] userspace support for F2FS metadata
 encryption
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

Could you please consider to rebase the patches on f2fs-tools/dev branch?
I've applied compression support which will have some conflicts with this
series. And, could you check this works with multi-partition support?

Thanks,

On 10/05, Satya Tangirala wrote:
> The kernel patches for F2FS metadata encryption are at:
> 
> https://lore.kernel.org/linux-fscrypt/20201005073606.1949772-4-satyat@google.com/
> 
> This patch implements the userspace changes required for metadata
> encryption support as implemented in the kernel changes above. All blocks
> in the filesystem are encrypted with the user provided metadata encryption
> key except for the superblock (and its redundant copy). The DUN for a block
> is its offset from the start of the filesystem.
> 
> This patch introduces two new options for the userspace tools: '-A' to
> specify the encryption algorithm, and '-M' to specify the encryption key.
> mkfs.f2fs will store the encryption algorithm used for metadata encryption
> in the superblock itself, so '-A' is only applicable to mkfs.f2fs. The rest
> of the tools only take the '-M' option, and will obtain the encryption
> algorithm from the superblock of the FS.
> 
> Limitations: 
> Metadata encryption with sparse storage has not been implemented yet in
> this patch.
> 
> This patch requires the metadata encryption key to be readable from
> userspace, and does not ensure that it is zeroed before the program exits
> for any reason.
> 
> Satya Tangirala (1):
>   f2fs-tools: Introduce metadata encryption support
> 
>  fsck/main.c                   |  47 ++++++-
>  fsck/mount.c                  |  33 ++++-
>  include/f2fs_fs.h             |  10 +-
>  include/f2fs_metadata_crypt.h |  21 ++++
>  lib/Makefile.am               |   4 +-
>  lib/f2fs_metadata_crypt.c     | 226 ++++++++++++++++++++++++++++++++++
>  lib/libf2fs_io.c              |  87 +++++++++++--
>  mkfs/f2fs_format.c            |   5 +-
>  mkfs/f2fs_format_main.c       |  33 ++++-
>  9 files changed, 446 insertions(+), 20 deletions(-)
>  create mode 100644 include/f2fs_metadata_crypt.h
>  create mode 100644 lib/f2fs_metadata_crypt.c
> 
> -- 
> 2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
