Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6964B1E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 07:17:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIPFi-0004SL-5f; Fri, 11 Feb 2022 06:17:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nIPFg-0004SA-5d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JV9UwaBuPbDUrQrk0P3HuhAamTFPcotRtInwI4IuRI0=; b=O5wzOBV3xGnMr6vMCRvRNTOUBv
 +ktTBBsPQ2J3N+DtYmAp+mByzs30mVKzx0QGcn3sK3JQ0IAwFcPPF4Fo9LXpfOHgcnxnamer8ou+j
 b5wtUXLr1eJtqp9XlpBang8wciJ/+jgNMX9RTldzkDfHBSttRhXYneoIYw0UFhQaOAHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JV9UwaBuPbDUrQrk0P3HuhAamTFPcotRtInwI4IuRI0=; b=KQlrti5Iyogt3gsf6Z1HUI9WWX
 RhX+5MQA3CwZQkeH+VI5ae4XHxEbamgfpJ9mMTVRgNGnjp84AzsiWoJQgaYNlii7HAzMuhBVGdauV
 si/pZNW71PK5UoPeKnclQe5FXtnvzFxrGPinCvADN+7e63ImR8LIeHLyTHOVZ9gWccDw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIPFe-00F0BF-1C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:17:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EDE561AB3;
 Fri, 11 Feb 2022 06:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3C8C340F1;
 Fri, 11 Feb 2022 06:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644560264;
 bh=gY+SW8mDXCVLJFUJPNH/tdEUYgt89QeK8AWxE3ZwQBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6vbGACw3Ah792ljjZrRk/+olQ9AfeLUPMAl5V588ySx/IVsJQnK07PzkJvcRbFkn
 KNmefDP2m5WZNSwTJh98wR2mjNlEU9eSBNLor2qB82UY9PIfIwhYm+Tj4FSTdrw6ZJ
 LTCIGNC2z1iibcS243VKWrb9kmjxa+TDHQM7myQcTmaf6WkFEVKSoPT4I80NRycm8k
 gEwP6XCAY3/7/cCzQbefOwUVITsq2Bqi1l7DV/AjIWgHqZrwa1VXFDxp5+V4CGtaxy
 5us5ng6vuaQllDiBtyey+G4tpaPkrOelsr5xv9/B9XT9biWt6iGiax7OEZHgStolCj
 Rrxf8QPLV7aCA==
Date: Thu, 10 Feb 2022 22:17:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YgX/hl4GK85M9mGs@sol.localdomain>
References: <20220128233940.79464-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128233940.79464-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 28, 2022 at 03:39:35PM -0800, Eric Biggers wrote:
 > [Note: I'm planning to send a patchset adding STATX_DIRECTIO as was >
 discussed
 on v10, but that will be a separate patchset.] > > Encry [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nIPFe-00F0BF-1C
Subject: Re: [f2fs-dev] [PATCH v11 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Theodore Ts'o <tytso@mit.edu>, "Darrick J . Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 28, 2022 at 03:39:35PM -0800, Eric Biggers wrote:
> [Note: I'm planning to send a patchset adding STATX_DIRECTIO as was
> discussed on v10, but that will be a separate patchset.]
> 
> Encrypted files traditionally haven't supported DIO, due to the need to
> encrypt/decrypt the data.  However, when the encryption is implemented
> using inline encryption (blk-crypto) instead of the traditional
> filesystem-layer encryption, it is straightforward to support DIO.
> 
> This series adds support for this.  There are multiple use cases for DIO
> on encrypted files, but avoiding double caching on loopback devices
> located in an encrypted directory is the main one currently.
> 
> v1 through v9 of this series were sent out by Satya Tangirala.  I've
> cleaned up a few things since Satya's last version
> (https://lore.kernel.org/all/20210604210908.2105870-1-satyat@google.com/T/#u).
> But more notably, I've made a couple simplifications.
> 
> First, since f2fs has now been converted to use iomap for DIO, I've
> dropped the patch which added fscrypt support to fs/direct-io.c.
> 
> Second, I've returned to the original design where DIO requests must be
> fully aligned to the FS block size in terms of file position, length,
> and memory buffers.  Satya previously was pursuing a slightly different
> design, where the memory buffers (but not the file position and length)
> were allowed to be aligned to just the block device logical block size.
> This was at the request of Dave Chinner on v4 and v6 of the patchset
> (https://lore.kernel.org/linux-fscrypt/20200720233739.824943-1-satyat@google.com/T/#u
> and
> https://lore.kernel.org/linux-fscrypt/20200724184501.1651378-1-satyat@google.com/T/#u).
> 
> I believe that approach is a dead end, for two reasons.  First, it
> necessarily causes it to be possible that crypto data units span bvecs.
> Splits cannot occur at such locations; however the block layer currently
> assumes that bios can be split at any bvec boundary.  Changing that is
> quite difficult, as Satya's v9 patchset demonstrated.  This is not an
> issue if we require FS block aligned buffers instead.  Second, it
> doesn't change the fact that FS block alignment is still required for
> the file position and I/O length; this is unavoidable due to the
> granularity of encryption being the FS block size.  So, it seems that
> relaxing the memory buffer alignment requirement wouldn't make things
> meaningfully easier for applications, which raises the question of why
> we would bother with it in the first place.
> 
> Christoph Hellwig also said that he much prefers that fscrypt DIO be
> supported without sector-only alignment to start:
> https://lore.kernel.org/r/YPu+88KReGlt94o3@infradead.org
> 
> Given the above, as far as I know the only remaining objection to this
> patchset would be that DIO constraints aren't sufficiently discoverable
> by userspace.  Now, to put this in context, this is a longstanding issue
> with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> not specific to this feature, and it doesn't actually seem to be too
> important in practice; many other filesystem features place constraints
> on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> (And for better or worse, many systems using fscrypt already have
> out-of-tree patches that enable DIO support, and people don't seem to
> have trouble with the FS block size alignment requirement.)
> 
> To address the issue of DIO constraints being insufficiently
> discoverable, I plan to make statx() expose this information.
> 
> This series applies to v5.17-rc1.
> 
> Changed v10 => v11:
>   * Changed fscrypt_dio_unsupported() back to fscrypt_dio_supported().
>   * Removed a mention of f2fs from fscrypt_dio_supported().
>   * Added Reviewed-by and Acked-by tags, including a couple from earlier
>     I had dropped due to the renaming of fscrypt_dio_supported().
>   * In fscrypt_limit_io_blocks(), don't load i_crypt_info until it's
>     known to be valid, to avoid confusion as is done elsewhere.
> 
> Eric Biggers (5):
>   fscrypt: add functions for direct I/O support
>   iomap: support direct I/O with fscrypt using blk-crypto
>   ext4: support direct I/O with fscrypt using blk-crypto
>   f2fs: support direct I/O with fscrypt using blk-crypto
>   fscrypt: update documentation for direct I/O support
> 
>  Documentation/filesystems/fscrypt.rst | 25 ++++++-
>  fs/crypto/crypto.c                    |  8 +++
>  fs/crypto/inline_crypt.c              | 93 +++++++++++++++++++++++++++
>  fs/ext4/file.c                        | 10 +--
>  fs/ext4/inode.c                       |  7 ++
>  fs/f2fs/data.c                        |  7 ++
>  fs/f2fs/f2fs.h                        |  6 +-
>  fs/iomap/direct-io.c                  |  6 ++
>  include/linux/fscrypt.h               | 18 ++++++
>  9 files changed, 173 insertions(+), 7 deletions(-)

I've applied this patchset to fscrypt.git#master for 5.18
(https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
