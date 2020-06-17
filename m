Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A01FC80A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 09:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/fXE1TLoTZU3tRmoOSuBZn24slklrcBictzsHv5mkI=; b=UF83CKvht9CMNSt+G8YQFRX8Pc
	v0fIFY0X1dhGtSZTX/CPvd0q6i4Jc0RT6cvjXQM236cN/kqYIhKfrSibjfn4sNEkuUGtbpez8FKgg
	NhVi4d/5fpJxuQoe+QfWs63Y/skWcF37U8V7uQIFd5mnxGJt6pK3o7uWc6TbnnocaqDc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlSxI-0007Fe-N6; Wed, 17 Jun 2020 07:57:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <38MzpXgYKAC8dLejLeRZZRWP.NZX@flex--satyat.bounces.google.com>)
 id 1jlSxG-0007FR-On
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 07:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrGLoue5k9cA5koD7/PO4iQoD6IjWXOUupBIS3VbDWk=; b=ZqxYcMGWTjScay/RvAII9UBZIa
 2aFaBg2StWcVlI5blaj/XNUpLTarQEu6gAGmwuxfWbPpm0hG6wUWAtuEEdCcqdwuRZmjnnMFr4Pdi
 mKixLt2rW+Z1yYEJ/wx1OmaHFAfoi4qnCVXZcstnxfO4aaaNaq8ZDRvje3oN1VWtRRgQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YrGLoue5k9cA5koD7/PO4iQoD6IjWXOUupBIS3VbDWk=; b=e
 nDyGJcP8BhC68Yd6uNcXf3IWxj5vO6Ne2YfzBCm2W7jsbIsfMnj8GoBSTo7IUE/+kAPzcAe9Qr/pr
 dWqJ3L8IWBrKFosTsJN1B6DlCfZ2Z/x/qtoUC3kX7OIjfLIxy2j3td1kg8pbOC6ouUIathBOTO0XO
 gp2UkCpG33rxbt/U=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlSxB-0094B3-UN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 07:57:54 +0000
Received: by mail-yb1-f202.google.com with SMTP id p22so1574100ybg.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=YrGLoue5k9cA5koD7/PO4iQoD6IjWXOUupBIS3VbDWk=;
 b=iFNqldV2E0w+7bBQ385IjyHcqfjU9mHdgYgoOylqrDwynqv0FkaVUtzHYnx9jORWBx
 nqLhO71PXhAxR/dettLy3H8elFoRNQ1xrwhbvwSjSMpTnH6Z3jQ1IJTsOZv7+sTTeATu
 ewCeVTcWVzetIlVH5/jaGuMBKUpHxMpGioqjOhAzRFBPHmVm36fnLoOaHDgjrTe4Vq5W
 WkrYAx7DiBNschMNjM2VxKdeL1pAKB/MwZJao3YSAovK798PHpRlhrY11GWKavUHDcr7
 aypJl1ncfu6qAqOj9ec3P89dwmhW89iV6fJz4PAYy3IWXtr9brGu8umUFOvmmF5C0398
 MWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=YrGLoue5k9cA5koD7/PO4iQoD6IjWXOUupBIS3VbDWk=;
 b=tbMnlT7Y6a4sZcBoqyHeSWHiLOO2+4NhhO2LVtVv3Fib5Qt8YJyqI6nTCFSmfz8Vaw
 mGAhTmt6sGVMRZ1yLXylGSl0oTlEnRWY3JI1XYku8bMn67qYofw0dbmPlMvAlzBNbCQp
 PP2u9kM/ucE/Bl7+qjIEtPd/2EHtcGbND/naAa5ZTFLVA+Fu8pBJ3X8MpYp02WHn2bd8
 cu54pYANk485/rhBjlzqh3B39qa4swrgzXbg/jtIvXCyko9Pgwuc5GH8VVbvSYT5zgq/
 07fgFDZWT8t8E1fF259EpSBXnNTPWBDPQOrpWD9zG1qDMpS7+Lljb+k3pddapnayBC/o
 bmCw==
X-Gm-Message-State: AOAM533BMK5rOoEREKqIcQXb4eJjc7bORuULKuGaUK1mToFxM/I0N4TF
 1IFywHsJ0uScylcBOJUReCc1UEs3Vk4=
X-Google-Smtp-Source: ABdhPJyi+r7Mo3g9hSD3snev85cZk7qSVEtvV2RBZ+GdzakmAaT064tsDCrF7yalJdTdipPDsMh0KpvnBYc=
X-Received: by 2002:a25:cbcc:: with SMTP id b195mr10932034ybg.91.1592380656942; 
 Wed, 17 Jun 2020 00:57:36 -0700 (PDT)
Date: Wed, 17 Jun 2020 07:57:28 +0000
Message-Id: <20200617075732.213198-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jlSxB-0094B3-UN
Subject: [f2fs-dev] [PATCH 0/4] Inline Encryption Support for fscrypt
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for Inline Encryption to fscrypt, f2fs
and ext4. It builds on the inline encryption support now present in
the block layer, and has been rebased on v5.8-rc1.

Patch 1 introduces the SB_INLINECRYPT sb options, which filesystems
should set if they want to use blk-crypto for file content en/decryption.

Patch 2 adds inline encryption support to fscrypt. To use inline
encryption with fscrypt, the filesystem must set the above mentioned
SB_INLINECRYPT sb option. When this option is set, the contents of
encrypted files will be en/decrypted using blk-crypto.

Patches 3 and 4 wire up f2fs and ext4 respectively to fscrypt support for
inline encryption, and e.g ensure that bios are submitted with blocks
that not only are contiguous, but also have contiguous DUNs.

Eric Biggers (1):
  ext4: add inline encryption support

Satya Tangirala (3):
  fs: introduce SB_INLINECRYPT
  fscrypt: add inline encryption support
  f2fs: add inline encryption support

 Documentation/admin-guide/ext4.rst |   6 +
 Documentation/filesystems/f2fs.rst |   7 +-
 fs/buffer.c                        |   7 +-
 fs/crypto/Kconfig                  |   6 +
 fs/crypto/Makefile                 |   1 +
 fs/crypto/bio.c                    |  50 +++++
 fs/crypto/crypto.c                 |   2 +-
 fs/crypto/fname.c                  |   4 +-
 fs/crypto/fscrypt_private.h        | 118 +++++++++-
 fs/crypto/inline_crypt.c           | 349 +++++++++++++++++++++++++++++
 fs/crypto/keyring.c                |   6 +-
 fs/crypto/keysetup.c               |  68 ++++--
 fs/crypto/keysetup_v1.c            |  16 +-
 fs/ext4/inode.c                    |   4 +-
 fs/ext4/page-io.c                  |   6 +-
 fs/ext4/readpage.c                 |  11 +-
 fs/ext4/super.c                    |   9 +
 fs/f2fs/compress.c                 |   2 +-
 fs/f2fs/data.c                     |  81 +++++--
 fs/f2fs/super.c                    |  32 +++
 fs/proc_namespace.c                |   1 +
 include/linux/fs.h                 |   1 +
 include/linux/fscrypt.h            |  82 +++++++
 23 files changed, 794 insertions(+), 75 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

-- 
2.27.0.290.gba653c62da-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
