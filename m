Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EF54EAB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 22:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1vwk-0008Rv-9v; Thu, 16 Jun 2022 20:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o1vwj-0008Rk-7r
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZbo0H/dA7rC2UEnryNIZTqD/0DUVPDwvXxQ//0oEsg=; b=IS+1AayW+9JnRCMhEBYbp+sZ9U
 OHITDg3lrkkZC3UKteibfB+h9Lb2cZOx4CTJZgZAwYekkvM+g000AEua6udhuiKC8nCcvb1z1HbJA
 SaH/xbGWmJLTX/1zeWtHPyTo7ETxJakO0n8xYa9al8FRKyx7kLJaH/QiXFmdn80kW2oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YZbo0H/dA7rC2UEnryNIZTqD/0DUVPDwvXxQ//0oEsg=; b=e
 7PbeU/NCt38VYe6h163y6n3j5JHHm1GsvwwNj3HWc8mAKEfswwfx7ZpEF4no6yR7NwWGw2iWAnnAK
 VPjWQiRmtocfocCkQaj/RxHNBZaxzFLreJAbZMMv3ymjo/eZZlB8J4s7w277Qhx5xJk90mOMrmrBh
 l7vG2t6SSMxKugRo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1vwc-0005ai-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73882B825C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jun 2022 20:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B59C34114;
 Thu, 16 Jun 2022 20:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655410695;
 bh=uHvrE+2KCGPR9N5AeXBgCBnYJvNxKl74BJyMaayUJlE=;
 h=From:To:Cc:Subject:Date:From;
 b=FE409cquZhNFTvUkhTz7aypxXcp8WVokxBhnOgrLH7rlE98ZDV8l1GdGcslnY0oFx
 ByeEMsNBaXb9VYG8LFVjl1S+79f5i0YjMkfvsUE9Wj3myE3PSK8zfRz0/EtowyYHBO
 iOw2iLltOMlau7xeqpRv3LdCm6DGDeTZUolKc2IzonnbO9+6YbZOwCNo8qGlEkRTWs
 hqpSWrzTz01/8v2Q3ZThHothFD/mn5Nhs+a+vL4u/yf4s+PM80d04AO9bKkU0tNZug
 OemXtvGjdbXjqfvdtyPIPCgcGjA799xlqEljsmrYSlYgC4GqLRYODBx4O/scdI2HT6
 b92/3YjwKg2Ow==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 16 Jun 2022 13:14:58 -0700
Message-Id: <20220616201506.124209-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -3.3 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset makes the statx() system call return direct
 I/O (DIO) alignment information. This allows userspace to easily determine
 whether a file supports DIO, and if so with what alignment restrict [...]
 Content analysis details:   (-3.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1vwc-0005ai-Bp
Subject: [f2fs-dev] [PATCH v3 0/8] make statx() return DIO alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset makes the statx() system call return direct I/O (DIO)
alignment information.  This allows userspace to easily determine
whether a file supports DIO, and if so with what alignment restrictions.

Patch 1 adds the basic VFS support for STATX_DIOALIGN.  Patch 2 wires it
up for all block device files.  The remaining patches wire it up for
regular files on ext4 and f2fs.  Support for regular files on other
filesystems can be added later.

I've also written a man-pages patch, which I'm sending separately.

Note, f2fs has one corner case where DIO reads are allowed but not DIO
writes.  The proposed statx fields can't represent this.  My proposal
(patch 6) is to just eliminate this case, as it seems much too weird.
But I'd appreciate any feedback on that part.

This patchset applies to v5.19-rc2.

Changed v2 => v3:
   - Dropped the stx_offset_align_optimal field, since its purpose
     wasn't clearly distinguished from the existing stx_blksize.

   - Renamed STATX_IOALIGN to STATX_DIOALIGN, to reflect the new focus
     on DIO only.

   - Similarly, renamed stx_{mem,offset}_align_dio to
     stx_dio_{mem,offset}_align, to reflect the new focus on DIO only.

   - Wired up STATX_DIOALIGN on block device files.

Changed v1 => v2:
   - No changes.

Eric Biggers (8):
  statx: add direct I/O alignment information
  vfs: support STATX_DIOALIGN on block devices
  fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
  ext4: support STATX_DIOALIGN
  f2fs: move f2fs_force_buffered_io() into file.c
  f2fs: don't allow DIO reads but not DIO writes
  f2fs: simplify f2fs_force_buffered_io()
  f2fs: support STATX_DIOALIGN

 fs/crypto/inline_crypt.c  | 48 ++++++++++++++++++++-------------------
 fs/ext4/ext4.h            |  1 +
 fs/ext4/file.c            | 10 ++++----
 fs/ext4/inode.c           | 29 +++++++++++++++++++++++
 fs/f2fs/f2fs.h            | 45 ------------------------------------
 fs/f2fs/file.c            | 45 +++++++++++++++++++++++++++++++++++-
 fs/stat.c                 | 37 ++++++++++++++++++++++++++++++
 include/linux/fscrypt.h   |  7 ++----
 include/linux/stat.h      |  2 ++
 include/uapi/linux/stat.h |  4 +++-
 10 files changed, 147 insertions(+), 81 deletions(-)

-- 
2.36.1

base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
