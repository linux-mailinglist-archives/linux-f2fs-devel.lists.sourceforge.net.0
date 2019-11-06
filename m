Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CEFF204D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2019 22:04:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSSTr-0007O6-7d; Wed, 06 Nov 2019 21:04:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iSSTp-0007Nf-VD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 21:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccud3dLMQpcpAkVxqKG6sj5JPueJ0BZXmQ1WfHWHLvw=; b=XSq2t67vSwQMXSatVVhGE8VXmm
 WCVX/bxCStdwYc6Mj+35NQRYGHnqy/7jGINBTbBfamu2QGVhaPt0gIu2wPJ/F8cpaS/ZPPRfH7CYT
 korfV1537ti+FJybIvJRobw2WKsDxd0YRgDalgf45AHfoSsfDeTjMB7h3livVtD/PXyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccud3dLMQpcpAkVxqKG6sj5JPueJ0BZXmQ1WfHWHLvw=; b=lAGQZmPFikrvWQnYtcitZ01RiF
 vFO79M7mfmFiDGXhG8yuYFxQnaaAwkwhgdQd1+y5ZDJQEo1goX0nHLRQk4Cy44fcDUfLykoATpbaO
 hY9xsNiXzpXArb0FyqPpu7C4+qxgF1jPssY9nMgZhCS2XLH3ynAIqHORIsY6yejPI5VQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSSTo-002lAC-Dx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 21:04:41 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D4E020663;
 Wed,  6 Nov 2019 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573074274;
 bh=gjl0DiLR6wZlVim/nV2ye21G7PfWS65h/U6LfKQDhOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ar8VeiM8q2OQT8IoJYh3V+TV427A/Ul9oo2Nc+bBlNFftOaldwb8dJEju6gXLLTK/
 c5jxp1YbNtAI2dpDUDyh2rsJ6O/CA8ifSHEB7Cem82mpMWsqXgP77/aM3UnnzJ9dOF
 8vWJsJMWS7Rj2CGh8Qbh4EcGZaPviVhm4mbJmIo0=
Date: Wed, 6 Nov 2019 13:04:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20191106210432.GB139580@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
References: <20191024215438.138489-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024215438.138489-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.9 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.0 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iSSTo-002lAC-Dx
Subject: Re: [f2fs-dev] [PATCH v2 0/3] fscrypt: support for IV_INO_LBLK_64
 policies
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
Cc: linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 24, 2019 at 02:54:35PM -0700, Eric Biggers wrote:
> Hello,
> 
> In preparation for adding inline encryption support to fscrypt, this
> patchset adds a new fscrypt policy flag which modifies the encryption to
> be optimized for inline encryption hardware compliant with the UFS v2.1
> standard or the upcoming version of the eMMC standard.
> 
> This means using per-mode keys instead of per-file keys, and in
> compensation including the inode number in the IVs.  For ext4, this
> precludes filesystem shrinking, so I've also added a compat feature
> which will prevent the filesystem from being shrunk.
> 
> I've separated this from the full "Inline Encryption Support" patchset
> (https://lkml.kernel.org/linux-fsdevel/20190821075714.65140-1-satyat@google.com/)
> to avoid conflating an implementation (inline encryption) with a new
> on-disk format (IV_INO_LBLK_64).  This patchset purely adds support for
> IV_INO_LBLK_64 policies to fscrypt, but implements them using the
> existing filesystem layer crypto.
> 
> We're planning to make the *implementation* (filesystem layer or inline
> crypto) be controlled by a mount option '-o inlinecrypt'.
> 
> This patchset applies to fscrypt.git#master and can also be retrieved from
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=inline-crypt-optimized-v2
> 
> I've written a ciphertext verification test for this new type of policy:
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=inline-encryption
> 
> Work-in-progress patches for the inline encryption implementation of
> both IV_INO_LBLK_64 and regular policies can be found at
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=inline-encryption-wip
> 
> Changes v1 => v2:
> 
> - Rename the flag from INLINE_CRYPT_OPTIMIZED to IV_INO_LBLK_64.
> 
> - Use the same key derivation and IV generation scheme for filenames
>   encryption too.
> 
> - Improve the documentation and commit messages.
> 
> Eric Biggers (3):
>   fscrypt: add support for IV_INO_LBLK_64 policies
>   ext4: add support for IV_INO_LBLK_64 encryption policies
>   f2fs: add support for IV_INO_LBLK_64 encryption policies
> 
>  Documentation/filesystems/fscrypt.rst | 63 +++++++++++++++++----------
>  fs/crypto/crypto.c                    | 10 ++++-
>  fs/crypto/fscrypt_private.h           | 16 +++++--
>  fs/crypto/keyring.c                   |  6 ++-
>  fs/crypto/keysetup.c                  | 45 ++++++++++++++-----
>  fs/crypto/policy.c                    | 41 ++++++++++++++++-
>  fs/ext4/ext4.h                        |  2 +
>  fs/ext4/super.c                       | 14 ++++++
>  fs/f2fs/super.c                       | 26 ++++++++---
>  include/linux/fscrypt.h               |  3 ++
>  include/uapi/linux/fscrypt.h          |  3 +-
>  11 files changed, 182 insertions(+), 47 deletions(-)
> 
> -- 

Applied to fscrypt.git#master for 5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
