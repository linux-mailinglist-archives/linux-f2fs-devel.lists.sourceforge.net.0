Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B70494821
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 08:16:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nARgQ-0005Ws-Vm; Thu, 20 Jan 2022 07:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nARgO-0005WN-NM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0A6Q+AtYVMcXP/GsdnTka+MkmDHp4XSPQ2vv+shDn70=; b=Zordhsp2FtKoAu7A0SXmKmXCDr
 luPOr7xGdUm9lafjhJCux7diuHR5PpjESgJstXmCnyYJa3Ulf8wfZ70Wype2+pHUW3WrUOMwVNsHn
 YGG3s/Aet9o/uyskcPxRNg/xC71EVGw2Hlz3TyOfbmgAw0DhzbOOn9ujeR9OnFQ5HHHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0A6Q+AtYVMcXP/GsdnTka+MkmDHp4XSPQ2vv+shDn70=; b=X
 zGoMNKmi/Hk4JMF/b0OFKfXzf4XKOfvruJ/0xC1OFZcXjjtvTpdQVIjZA6Pxl64GSVvTSjfP1ZAay
 oKjLlNYvv44QDRSuGgxKnbG1wcf/FqjBP2rJygbX+ogR36xpLboRNZIAebr1Q33vWUJfUculRvTrY
 tx64UYlyx+1kbnZc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nARgJ-0002k3-Th
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 947A8CE1BFC;
 Thu, 20 Jan 2022 07:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B753EC340E0;
 Thu, 20 Jan 2022 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642662974;
 bh=YfVf7rAvgCs/3ET6tKl91x/+y+054s6VdI88iVi2crE=;
 h=From:To:Cc:Subject:Date:From;
 b=PAlOlzacCH2/P3OqiqE/xQAyMQxkbvDpWWaF3mSbkECHkWdbNB3Pkfhdi7TgkKZM4
 BFoV7ewBtSy2vNip6LmTlBCekvL4uPu07h+n/AoifvoAD3TpvOz+VfTz8In8lj7Hyk
 o1PD5/yFkvRk3bbYrx5PbtceEkvBJiAMrM0pJXgKYT45Hy7A9wCjlsOwtEDL/nM4RQ
 kmp9owsKM1ed0iN5+iFWARjZCq1fe9exZMZEGFBi2IbYD463R2L8iFu5eqmiSSSEgf
 pZB3oCs7fKv4fJ6/eABBNsOWdfaE5RZ02o2lZEKPi1GW2xs0kgblUGLGx4JVArZH3x
 vWGUG/jsWCi+w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 19 Jan 2022 23:12:10 -0800
Message-Id: <20220120071215.123274-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Encrypted files traditionally haven't supported DIO, due to
 the need to encrypt/decrypt the data. However,
 when the encryption is implemented
 using inline encryption (blk-crypto) instead of the tradit [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1nARgJ-0002k3-Th
Subject: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with fscrypt
 using blk-crypto
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Encrypted files traditionally haven't supported DIO, due to the need to
encrypt/decrypt the data.  However, when the encryption is implemented
using inline encryption (blk-crypto) instead of the traditional
filesystem-layer encryption, it is straightforward to support DIO.

This series adds support for this.  There are multiple use cases for DIO
on encrypted files, but avoiding double caching on loopback devices
located in an encrypted directory is the main one currently.

Previous versions of this series were sent out by Satya Tangirala.
I've cleaned up a few things since Satya's last version, v9
(https://lore.kernel.org/all/20210604210908.2105870-1-satyat@google.com/T/#u).
But more notably, I've made a couple simplifications.

First, since f2fs has now been converted to use iomap for DIO, I've
dropped the patch which added fscrypt support to fs/direct-io.c.

Second, I've returned to the original design where DIO requests must be
fully aligned to the FS block size in terms of file position, length,
and memory buffers.  Satya previously was pursuing a slightly different
design, where the memory buffers (but not the file position and length)
were allowed to be aligned to just the block device logical block size.
This was at the request of Dave Chinner on v4 and v6 of the patchset
(https://lore.kernel.org/linux-fscrypt/20200720233739.824943-1-satyat@google.com/T/#u
and
https://lore.kernel.org/linux-fscrypt/20200724184501.1651378-1-satyat@google.com/T/#u).

I believe that approach is a dead end, for two reasons.  First, it
necessarily causes it to be possible that crypto data units span bvecs.
Splits cannot occur at such locations; however the block layer currently
assumes that bios can be split at any bvec boundary.  Changing that is
quite difficult, as Satya's v9 patchset demonstrated.  This is not an
issue if we require FS block aligned buffers instead.  Second, it
doesn't change the fact that FS block alignment is still required for
the file position and I/O length; this is unavoidable due to the
granularity of encryption being the FS block size.  So, it seems that
relaxing the memory buffer alignment requirement wouldn't make things
meaningfully easier for applications, which raises the question of why
we would bother with it in the first place.

Christoph Hellwig also said that he much prefers that fscrypt DIO be
supported without sector-only alignment to start:
https://lore.kernel.org/r/YPu+88KReGlt94o3@infradead.org

Given the above, as far as I know the only remaining objection to this
patchset would be that DIO constraints aren't sufficiently discoverable
by userspace.  Now, to put this in context, this is a longstanding issue
with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
not specific to this feature, and it doesn't actually seem to be too
important in practice; many other filesystem features place constraints
on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
(And for better or worse, many systems using fscrypt already have
out-of-tree patches that enable DIO support, and people don't seem to
have trouble with the FS block size alignment requirement.)

I plan to propose a new generic ioctl to address the issue of DIO
constraints being insufficiently discoverable.  But until then, I'm
wondering if people are willing to consider this patchset again, or
whether it is considered blocked by this issue alone.  (And if this
patchset is still unacceptable, would it be acceptable with f2fs support
only, given that f2fs *already* only allows FS block size aligned DIO?)

Eric Biggers (5):
  fscrypt: add functions for direct I/O support
  iomap: support direct I/O with fscrypt using blk-crypto
  ext4: support direct I/O with fscrypt using blk-crypto
  f2fs: support direct I/O with fscrypt using blk-crypto
  fscrypt: update documentation for direct I/O support

 Documentation/filesystems/fscrypt.rst | 25 +++++++-
 fs/crypto/crypto.c                    |  8 +++
 fs/crypto/inline_crypt.c              | 90 +++++++++++++++++++++++++++
 fs/ext4/file.c                        | 10 +--
 fs/ext4/inode.c                       |  7 +++
 fs/f2fs/data.c                        |  7 +++
 fs/f2fs/f2fs.h                        |  6 +-
 fs/iomap/direct-io.c                  |  6 ++
 include/linux/fscrypt.h               | 18 ++++++
 9 files changed, 170 insertions(+), 7 deletions(-)


base-commit: 1d1df41c5a33359a00e919d54eaebfb789711fdc
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
