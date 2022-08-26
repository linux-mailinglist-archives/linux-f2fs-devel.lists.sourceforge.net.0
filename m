Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FE5A2D4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Aug 2022 19:20:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRczq-0002kf-Vq;
	Fri, 26 Aug 2022 17:19:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1oRczp-0002kZ-GK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 17:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O647hDHVHlGHlXHr+NPoi3ojRiR8qSxK27+WnVTYW4c=; b=Wj8Gd0oWyQnVsT68sTXdrqvkNr
 SMiRAsgQmneOTE2atV5UrTZE9lTg6Tkxw3/8mjRI1V8DaP4ajoitvxnzZdsTTud9ql71p0EEObqaf
 NDiHioIE/2gxcq5iLK9bxqOyk3xYCGmAGIkYoRaYhHGucLegNg8csv05gUta3aas9Nrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O647hDHVHlGHlXHr+NPoi3ojRiR8qSxK27+WnVTYW4c=; b=Y+skAvyK43SJEoKBvZ0N8cFAsY
 WKfQ5A+ro+mlu/9JkJZw8eFi2RQwBoOUVAC4TigEL6MlUoexLcFRk6GTYEJIESeabT5bo09If1/k1
 PYWS7NsVj8WequkoYdMkvRZ29Zz8JPMDmBzaN5xS+d1lx8c85wWIlLqdaktpRua9CXyE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRczo-0005bC-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 17:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BB51B831BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Aug 2022 17:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C497C433D6;
 Fri, 26 Aug 2022 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661534379;
 bh=vuEokndF506qRdyhDYmaWg4LZphgo/7UF9f2EnSu4xo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=uRV4ZO47e1JugjRw4RVdrrpCHpR5bO4DvYgEkHIvcIjZ+lXuT1cBKl/AuPb6guZUs
 QDU296S9F4xsGChwu2sswCDeANzItTmyiRPDt6L/ni7NfFynjd6RN0vlCwH3F/fc3f
 Z7QIZ8FofXlaZRyedQNWiiJWSr7mo/69bslYAgkEK6/ZTwfbW5WEqidCS4+rh06SXl
 uR6fLYO46w9SsnXWQkpOf/CXGbw+yUMdxsKsyu7+e2IoLr1PpifubP3Z7lS5cInr3b
 lCgvHJstqBOvz0YgwjFkINWO/qDNOg0Bsi4POKI573SdJdMEwyHTJNhufBaI8tlffl
 iZpkxUmjkk3jw==
Message-ID: <3543250c8157c3e0e7e410b268121e4d7d3e9bc2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 13:19:37 -0400
In-Reply-To: <20220722071228.146690-1-ebiggers@kernel.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 2022-07-22 at 00:12 -0700, Eric Biggers wrote: > This
 patchset makes the statx() system call return direct I/O (DIO) > alignment
 information. This allows userspace to easily determine > whethe [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRczo-0005bC-Ii
Subject: Re: [f2fs-dev] [PATCH v4 0/9] make statx() return DIO alignment
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

On Fri, 2022-07-22 at 00:12 -0700, Eric Biggers wrote:
> This patchset makes the statx() system call return direct I/O (DIO)
> alignment information.  This allows userspace to easily determine
> whether a file supports DIO, and if so with what alignment restrictions.
> 
> Patch 1 adds the basic VFS support for STATX_DIOALIGN.  Patch 2 wires it
> up for all block device files.  The remaining patches wire it up for
> regular files on ext4, f2fs, and xfs.  Support for regular files on
> other filesystems can be added later.
> 
> I've also written a man-pages patch, which I'm sending separately.
> 
> Note, f2fs has one corner case where DIO reads are allowed but not DIO
> writes.  The proposed statx fields can't represent this.  My proposal
> (patch 6) is to just eliminate this case, as it seems much too weird.
> But I'd appreciate any feedback on that part.
> 
> This patchset applies to v5.19-rc7.
> 
> Changed v3 => v4:
>    - Added xfs support.
> 
>    - Moved the helper function for block devices into block/bdev.c.
>    
>    - Adjusted the ext4 patch to not introduce a bug where misaligned DIO
>      starts being allowed on encrypted files when it gets combined with
>      the patch "iomap: add support for dma aligned direct-io" that is
>      queued in the block tree for 5.20.
> 
>    - Made a simplification in fscrypt_dio_supported().
> 
> Changed v2 => v3:
>    - Dropped the stx_offset_align_optimal field, since its purpose
>      wasn't clearly distinguished from the existing stx_blksize.
> 
>    - Renamed STATX_IOALIGN to STATX_DIOALIGN, to reflect the new focus
>      on DIO only.
> 
>    - Similarly, renamed stx_{mem,offset}_align_dio to
>      stx_dio_{mem,offset}_align, to reflect the new focus on DIO only.
> 
>    - Wired up STATX_DIOALIGN on block device files.
> 
> Changed v1 => v2:
>    - No changes.
> 
> Eric Biggers (9):
>   statx: add direct I/O alignment information
>   vfs: support STATX_DIOALIGN on block devices
>   fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
>   ext4: support STATX_DIOALIGN
>   f2fs: move f2fs_force_buffered_io() into file.c
>   f2fs: don't allow DIO reads but not DIO writes
>   f2fs: simplify f2fs_force_buffered_io()
>   f2fs: support STATX_DIOALIGN
>   xfs: support STATX_DIOALIGN
> 
>  block/bdev.c              | 25 ++++++++++++++++++++
>  fs/crypto/inline_crypt.c  | 49 +++++++++++++++++++--------------------
>  fs/ext4/ext4.h            |  1 +
>  fs/ext4/file.c            | 37 ++++++++++++++++++++---------
>  fs/ext4/inode.c           | 36 ++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h            | 45 -----------------------------------
>  fs/f2fs/file.c            | 45 ++++++++++++++++++++++++++++++++++-
>  fs/stat.c                 | 14 +++++++++++
>  fs/xfs/xfs_iops.c         |  9 +++++++
>  include/linux/blkdev.h    |  4 ++++
>  include/linux/fscrypt.h   |  7 ++----
>  include/linux/stat.h      |  2 ++
>  include/uapi/linux/stat.h |  4 +++-
>  13 files changed, 190 insertions(+), 88 deletions(-)
> 
> base-commit: ff6992735ade75aae3e35d16b17da1008d753d28

Hi Eric,

Can I ask what your plans are with this set? I didn't see it in
linux-next yet, so I wasn't sure when you were looking to get it merged.
I'm working on patches to add a new statx field for the i_version
counter as well and I want to make sure that our work doesn't collide.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
