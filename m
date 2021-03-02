Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BC32AAFD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 21:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHBGt-0006pp-Th; Tue, 02 Mar 2021 20:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lHBGi-0006ow-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOeeat/3DVIDvppAUCaxrDI3K9RMR/iMMdmdSnPaBRU=; b=K7D/ERO4hAUzXlmV0G6kWLTq8N
 9CTnGYPBfHEOduxrBXyoV4n1uI4/2a76dujBFEjg8rKONuiISW0xI/M2sZDBrzkpFGfO10MKqEIFr
 H8gJKSxV4//ewa4gTL4tsY9K2v2hjB5wS2jdYv7CSAuJ/1DBJXwuPnWF2cAh+Iw0Wnwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TOeeat/3DVIDvppAUCaxrDI3K9RMR/iMMdmdSnPaBRU=; b=k
 nzNeVpd1qOizLHLB5Sy0JKZG6mrke+OV3A/BZrhA/PdfGwHLXmvsNBBbsGyJ518Df4JDcB7QuY4FC
 vRvBg021mTfOcQoN6EwtXf5uyioipjOOFaD7dCPn4hZ1US5aJ9nppYQtCM4cduNHvXQCXkcFSuWFL
 NUyTt0/yYqXwD/+c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHBGX-00Be2C-Ie
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4D1064F2C;
 Tue,  2 Mar 2021 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614715504;
 bh=R0uWWdo55T3Y2P3LKpd1Ma1UuCXVZi07erMDI9ljXRg=;
 h=From:To:Cc:Subject:Date:From;
 b=Oz98igqXh+9c0+eqzJYbO7IcceScj37KATh8VUDVq814CVm02xIfdSrgZs7ItY89X
 lyGILhbaenhs1nXMRlAuJTNj8FTljQqIvO6DDGEN5ylJINfpO5m2hxjZngi29Rnyw0
 zL95MaD/DhnWLLybAB2QzchHr91meBG9YfRNbG6N0jSz+P6aDqXAKt0J2tj3oWH4Zk
 DxlIgkc/qbPdvIexTwIXXbmPaN14zq++fZ7+7VBS71U7IzSdEwEhsXCgDxcNI85kjn
 5tVB/Xhd6SJvV0qiAoS+b/jGmJGyo9MBbWZX2yQLuLbhK7YJ5t6BLBruBIyiwgkW5t
 c5POEGAMRQjyw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  2 Mar 2021 12:04:18 -0800
Message-Id: <20210302200420.137977-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHBGX-00Be2C-Ie
Subject: [f2fs-dev] [PATCH 0/2] fs-verity: fix error handling in
 ->end_enable_verity()
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix some bugs in how ext4_end_enable_verity() and
f2fs_end_enable_verity() handle failure to enable verity on the file.

This is intended to supersede the f2fs patch from Yunlei He
(https://lore.kernel.org/r/20210302113850.17011-1-heyunlei@hihonor.com,
 https://lore.kernel.org/r/20210301141506.6410-1-heyunlei@hihonor.com,
 https://lore.kernel.org/r/c1ce1421-2576-5b48-322c-fa682c7510d7@kernel.org).
I fixed the same bugs in ext4 too, reworked the functions to cleanly
separate the success and error paths, and improved the commit message.

These patches can be taken independently via the ext4 and f2fs trees.
I've just sent them out together since they're similar.

Eric Biggers (2):
  ext4: fix error handling in ext4_end_enable_verity()
  f2fs: fix error handling in f2fs_end_enable_verity()

 fs/ext4/verity.c | 90 ++++++++++++++++++++++++++++++------------------
 fs/f2fs/verity.c | 61 +++++++++++++++++++++-----------
 2 files changed, 97 insertions(+), 54 deletions(-)

-- 
2.30.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
