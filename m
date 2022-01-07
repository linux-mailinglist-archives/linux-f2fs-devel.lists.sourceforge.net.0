Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4518487F3E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Jan 2022 00:13:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5yQB-0002VS-GL; Fri, 07 Jan 2022 23:13:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1n5yQA-0002VM-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jan 2022 23:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9AGEmEGwLh2KlTx8sBzygc+TK21tTPCZUulONoDuLhs=; b=hX8HnFiKtw8MHaCPeNIcRhto7m
 +WGL1/cqDc8rsuzL5r3QCpvnZzOrKAR9R+XWXDUKxT7d+QdIZfCPOOJUTnx6dtgY+RX5T/gHja4V1
 McyNIxTP3rUFUH4PguwIKjSD1Lfunu6ej1DqxPl83B1WRhu1V2inwHKlrZPNdJ2Zn0bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9AGEmEGwLh2KlTx8sBzygc+TK21tTPCZUulONoDuLhs=; b=A5O8d7i3gWybKq1JiIKfSLXHUZ
 ZDXoJTgQQwVC4ta2eEotsPNK3Zq/yxupVwBzyqFwoe8qV3vSRUY72uaDqTb8LhJ2ao4x4lFvhIwwv
 vi+CXmI14vpPyKUeBpgbuXD9ixqZzqihFQLGKdFspMBDdpfDHZiTlKP9yPSKIda92Yjo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5yQ7-005Yuf-EK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jan 2022 23:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 709C962016
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Jan 2022 23:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1552C36AE9;
 Fri,  7 Jan 2022 23:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641597186;
 bh=ICdoyhLp4mfXiHECs/IAYYg5cV1mgJexXdcbH5yA24A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=We7ZfrlbepKtokTbFzqyCMUcoDW79GKYBwQIZtKFESHnEWhsq6AuOnm5nSJv8qCXF
 aVeg17F+lH6k2ol+fWCp980eHzmH2cV0o5u3s0N3O1tpv4S3LM0wOnN0YHtT2tkYiz
 /0MXWEcAO2MgZ/9vDrhXg9MKMNDcRsn7Y6+XYAxLPy08b+xh3JBHpI9xEQrbu2Mw6b
 5MMuUpxptY3chVnEaqNqGD93EcgZxRAgKGiiaJklmhv7bFi1Y68M3NcF3E7i4VAexN
 gQGChSnFzb2HWw0yJrmhj7FPWRZ/mVPgDzQEcR/JkLCEUMV0txKS+4kr0vrAuEP/ud
 Jauf6p4+t/fIQ==
Date: Fri, 7 Jan 2022 15:13:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YdjJAS7Ua4aJEFhz@sol.localdomain>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
 <20220104212419.1879225-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104212419.1879225-3-jaegeuk@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, On Tue, Jan 04, 2022 at 01:24:16PM -0800, Jaegeuk
 Kim wrote: > DIO preallocates physical blocks before writing data, but if
 an error occurrs > or power-cut happens, we can see block contents from the
 [...] Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n5yQ7-005Yuf-EK
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: do not expose unwritten blocks to
 user by DIO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On Tue, Jan 04, 2022 at 01:24:16PM -0800, Jaegeuk Kim wrote:
> DIO preallocates physical blocks before writing data, but if an error occurrs
> or power-cut happens, we can see block contents from the disk. This patch tries
> to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> unwritten blocks from error or power-cut.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c  |  5 ++++-
>  fs/f2fs/f2fs.h  |  5 +++++
>  fs/f2fs/file.c  | 27 ++++++++++++++++++---------
>  fs/f2fs/inode.c |  8 ++++++++
>  4 files changed, 35 insertions(+), 10 deletions(-)

Unfortunately, this patch doesn't completely fix the uninitialized data
exposure.  The problem is that it only makes DIO writes fall back to buffered
writes for holes, and not for reserved blocks (NEW_ADDR).  f2fs's reserved
blocks are *not* the same as the unwritten extents that other filesystems have;
f2fs's reserved blocks have to be turned into regular blocks before DIO can
write to them.  That immediately exposes them to concurrent reads (at least
buffered reads, but I think DIO reads too).

This can be reproduced using the aiodio_sparse program from LTP, as follows:

	aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 6

This was reported at
https://lore.kernel.org/r/20211226132851.GC34518@xsang-OptiPlex-9020 as a
regression from the commit "f2fs: use iomap for direct I/O", but it actually
failed before too.  Note that it's nondeterministic; writing random data to the
block device before creating the filesystem helps with reproduction.

I see only three possible solutions:

* Make DIO writes to reserved blocks fall back to buffered writes, just like
  writes to holes.  This would mean that a file would have to be written to
  before direct writes would work; fallocate() wouldn't be enough.  Note that my
  patch https://lore.kernel.org/r/20210728015154.171507-1-ebiggers@kernel.org
  would have done this.

* Or, change the f2fs on-disk format to support unwritten extents.

* Or, split up block allocation into two parts, so that blocks could be
  preliminarily allocated and not exposed to reads yet.  This would be like
  Ted's suggestion here: https://lore.kernel.org/r/YQS5eBljtztWwOFE@mit.edu

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
