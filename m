Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD423D5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBH-0001Va-LC; Mon, 20 May 2019 16:30:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBG-0001VN-Bf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pCirJianIYPIAw13fyJyPnZrFgBJAm12ceFeIlq1u1k=; b=hpR5SdaM8+T8POgQAiUx5z6fa0
 QAvlPBs4Yl9YjrWnHRS9DranE9MIzrfYMpB4xVTD78tG1bn0Qp25qxTE0sr1ESTGwWiNt3JrPhji7
 9xKBgH039HWITjnUac3shnLHuFqXUJND7f3wVPu3Nn55c8R/dOnlyj3lqBcFDWjfCb7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pCirJianIYPIAw13fyJyPnZrFgBJAm12ceFeIlq1u1k=; b=c
 7LN5xxaSbdF3LvFoe9DG5AlblW8jFHkecMc7qv/11WXF22s/8LaL8JOcAQzUh9Unqon+DXwkP7cu/
 Rl/vWTFylhsxZxfw9kkozsbIjjSoB3AHuXZbqkY6qK7tsLKyCEhR0Crxgm1ZLVnIK00MyfhVHioCJ
 wsZ0uW4nzXJRzJPw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBD-00BNft-At
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:30 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0C1620815;
 Mon, 20 May 2019 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369821;
 bh=qgPdUJE/0daEUKkRjmiTlZG0dOGdMLxQxjTzXSw4Rv0=;
 h=From:To:Cc:Subject:Date:From;
 b=O2IH3/wClCcNtvPWFoheNIncMp0iBWfW5iJnR9rn/U9EpHAQ4yYvG79uvBTdU2mdy
 q/0lti2ZK9imVN7kY95KpTwbcixNKBcWoxdHh42Irdd7nmogh191csqMvoScQhkhIQ
 qdNLPAoXphJvOpr/ts88DJe7IQNk+40IxVhYw594=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:38 -0700
Message-Id: <20190520162952.156212-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBD-00BNft-At
Subject: [f2fs-dev] [PATCH v2 00/14] fscrypt,
 ext4: prepare for blocksize != PAGE_SIZE
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

This patchset prepares fs/crypto/, and partially ext4, for the
'blocksize != PAGE_SIZE' case.

This basically contains the encryption changes from Chandan Rajendra's
patchset "[V2,00/13] Consolidate FS read I/O callbacks code"
(https://patchwork.kernel.org/project/linux-fscrypt/list/?series=111039)
that don't require introducing the read_callbacks and don't depend on
fsverity stuff.  But they've been reworked to clean things up a lot.

I'd like to apply this patchset for 5.3 in order to make things forward
for ext4 encryption with 'blocksize != PAGE_SIZE'.

AFAICT, after this patchset the only thing stopping ext4 encryption from
working with blocksize != PAGE_SIZE is the lack of encryption support in
block_read_full_page(), which the read_callbacks will address.

This patchset applies to v5.2-rc1, and it can also be retrieved from git
at https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
branch "fscrypt-subpage-blocks-prep".

Changed since v1 (minor cleanups only):

- In "fscrypt: simplify bounce page handling", also remove
  the definition of FS_CTX_HAS_BOUNCE_BUFFER_FL.

- In "ext4: decrypt only the needed blocks in ext4_block_write_begin()",
  simplify the code slightly by moving the IS_ENCRYPTED() check.

- Change __fscrypt_decrypt_bio() in a separate patch rather than as part
  of "fscrypt: support decrypting multiple filesystem blocks per page".
  The resulting code is the same, so I kept Chandan's Reviewed-by.

- Improve the commit message of
  "fscrypt: introduce fscrypt_decrypt_block_inplace()".

Chandan Rajendra (3):
  ext4: clear BH_Uptodate flag on decryption error
  ext4: decrypt only the needed blocks in ext4_block_write_begin()
  ext4: decrypt only the needed block in __ext4_block_zero_page_range()

Eric Biggers (11):
  fscrypt: simplify bounce page handling
  fscrypt: remove the "write" part of struct fscrypt_ctx
  fscrypt: rename fscrypt_do_page_crypto() to fscrypt_crypt_block()
  fscrypt: clean up some BUG_ON()s in block encryption/decryption
  fscrypt: introduce fscrypt_encrypt_block_inplace()
  fscrypt: support encrypting multiple filesystem blocks per page
  fscrypt: handle blocksize < PAGE_SIZE in fscrypt_zeroout_range()
  fscrypt: introduce fscrypt_decrypt_block_inplace()
  fscrypt: support decrypting multiple filesystem blocks per page
  fscrypt: decrypt only the needed blocks in __fscrypt_decrypt_bio()
  ext4: encrypt only up to last block in ext4_bio_write_page()

 fs/crypto/bio.c             |  73 +++------
 fs/crypto/crypto.c          | 299 ++++++++++++++++++++----------------
 fs/crypto/fscrypt_private.h |  15 +-
 fs/ext4/inode.c             |  37 +++--
 fs/ext4/page-io.c           |  44 +++---
 fs/f2fs/data.c              |  17 +-
 fs/ubifs/crypto.c           |  19 +--
 include/linux/fscrypt.h     |  96 ++++++++----
 8 files changed, 319 insertions(+), 281 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
