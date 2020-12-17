Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC72DD3CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qyz6lMmW4XAYLpC2kKXFZVAnjPIjDBznSl5vYOm9LEY=; b=i3kXkR44018QaSimVwRRctG3RF
	mKqwSzbGGFpzgqupvUldEMvuoaAuQCDMOGmbK/zF6Dti59v3dbTynK+sIu1Im2lKIhMPfnTJKmgG4
	iidGHtyEFLk1QMIg8nWcSGzAcy5kOzlFEkEuFiPiwt6idgOcmYG3zuSbpLd+w/Id23kE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpuvV-0005gQ-Lr; Thu, 17 Dec 2020 15:10:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <35HTbXwYKAEEvdw1dwjrrjoh.frp@flex--satyat.bounces.google.com>)
 id 1kpuvT-0005fv-1V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGunUAkPZkLdzEm8qPy3d/adbk+pmXOhemXYmmHVe8o=; b=gWyrW1745/SltTw/hGAMFSlOBE
 Jw7Ori57IPfHVMsPz1GGWtpJ97PjZdXSWhBLFDWOxVCVVYfaTq3lus7un9hTbCyruL13PIL6b564I
 khGf9cXjIXkFjm7ImtWIE9hxt48o7874CO3ayVKnajzEvuca6vfnhdp34plu0WQ4E0GE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tGunUAkPZkLdzEm8qPy3d/adbk+pmXOhemXYmmHVe8o=; b=N
 ZvvO6dmz4mx36W6lW5wf44f3BuwltjvVFA0DbaS1tG6bmMmT9B2OrEXPIDqNY3JovFs+Jij6ehnXN
 ZVgMkQBIST5XjUJ64IybFM+qDYkRWtduYKmOSp60HLgy0ItFNDP/2TxzW4Xfny2w/aTk6z+1QrFBU
 9S17iY8s3+df1Sgc=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpuvJ-0002XZ-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:10:42 +0000
Received: by mail-pl1-f201.google.com with SMTP id f10so15559297plr.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=tGunUAkPZkLdzEm8qPy3d/adbk+pmXOhemXYmmHVe8o=;
 b=rtd/gAnZz5hjSfqpN9DVSalBykFdajLIazA/JrtkH3UX8B64TA1J20tWZzdmKKSfFz
 A83z80dS9ORSrlya08Q2WjzvDgF2hnvnFNEzr5bYqcEEejEZ3ekqp5yheuRioC+MJx7J
 E5YBqG0880fa6mv1zU/htNlex4e8mpY4O71SxKnI0rHKoggQc07urcBJTYwHYMWxuMIY
 ZYOyxCDyzlml+vrw8AJJjHvjUXcCQaWir16YL3wDDUEgi4fr7v6p/0oKEjD1P7aktWiS
 xotLua7GnY6wqfEOQnDGSzWZybnS9iRLtbyUIM3o0+eZX+4YnQNL/fq2mUcOmzJg6Lqf
 meog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=tGunUAkPZkLdzEm8qPy3d/adbk+pmXOhemXYmmHVe8o=;
 b=YqbExtOHumJE+2Zpeer/L6mKAOJuw0ZhxxYTwcXIkftfBTwUu7LocxpyG63CYZZYn+
 NKCL30dfEwlc2QNrofxvEAMxnKwV8t1q1XS9brOk1ZRm3SM3+Lhvgy/xRVl8ixE/qGOf
 1fZFk5WwET2XuDBv+XE5fwQVYHqTQTxY7187KMlr6SK3cm5SlHmJkOwAm8vTBsZ7i1m3
 38ucjRztCWqAJO8olR0FXnusnqqY2aWzfSgvQhubREiOjyfDrwjhCWcA6vnkK4Q/CvCK
 3lVFsWrqxbSAhYNzckt7XaJ4MdQORL8k01taKS9AeGDIGzlgkPYhGsAqaVPYspEuscDi
 WjiQ==
X-Gm-Message-State: AOAM532POas+MgmJHMHJWROOBc9ySdo4sYnZNH7oD7qiggC/Ij0qlvwP
 fFKGJQ3eSDUCzGmMmffgFGSimAm/jBc=
X-Google-Smtp-Source: ABdhPJxxJdUo//XJkMvmdzzSgI8dE/1V/lOerMW+Ar5zU51w3g9gWEKFFxHQP1AAuivISTQWjbeqhTGL8rA=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:902:42:b029:da:e72b:fe9e with SMTP id
 60-20020a1709020042b02900dae72bfe9emr37015856pla.31.1608217828046; Thu, 17
 Dec 2020 07:10:28 -0800 (PST)
Date: Thu, 17 Dec 2020 15:10:11 +0000
Message-Id: <20201217151013.1513045-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpuvJ-0002XZ-Oc
Subject: [f2fs-dev] [PATCH v2 0/2] userspace support for metadata encryption.
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The kernel patches for metadata encryption are at:
https://lore.kernel.org/linux-fscrypt/20201217150435.1505269-1-satyat@google.com/

This patch series implements the userspace changes required for metadata
encryption support as implemented in the kernel changes above. All blocks
in the filesystem are encrypted with the user provided metadata encryption
key except for the superblock (and its redundant copy). The DUN for a block
is its offset from the start of the filesystem.

Patch 1 introduces two new options for mkfs.f2fs: '-A' to specify the
encryption algorithm, and '-M' to specify the encryption key.
mkfs.f2fs will store the encryption algorithm and the key identifier of the
key used for metadata encryption in the superblock itself. The rest of the
tools will obtain the encryption algorithm and the key identifier from the
superblock of the FS, and don't need any new options.

Patch 2 is an attempt at getting metadata encryption to work with sparse
mode. It is currently untested because I haven't yet figured out how to set
up the environment to compile and test sparse mode, but I've included it
here in case there are already objections to the approach.

Limitations: 
This patch requires the metadata encryption key to be readable from
userspace, and does not ensure that it is zeroed before the program exits
for any reason.

Changes v1 => v2:
 - update userspace tools to work with the kernel changes for v2
 - mkfs.f2fs stores the metadata crypt key identifier in the superblock,
   and the remaining tools use it to obtain the metadata encryption key.
   As such, only mkfs.f2fs requires new options.
 - use libkcapi for all encryption tasks.
 - updated man pages
 - cleanups and improved docs/error messages
 - added an attempt to make metadata encryption work with sparse mode


Satya Tangirala (2):
  f2fs-tools: Introduce metadata encryption support
  libf2fs_io: Make metadata encryption work with sparse mode

 README                        |   2 +
 configure.ac                  |   2 +
 fsck/main.c                   |   2 +
 fsck/mount.c                  |  27 +++-
 include/f2fs_fs.h             |  21 ++-
 include/f2fs_metadata_crypt.h |  33 ++++
 lib/Makefile.am               |   4 +-
 lib/f2fs_metadata_crypt.c     | 284 ++++++++++++++++++++++++++++++++++
 lib/libf2fs.c                 |   3 -
 lib/libf2fs_io.c              | 189 +++++++++++++++++++---
 man/fsck.f2fs.8               |   5 +-
 man/mkfs.f2fs.8               |  44 ++++++
 mkfs/f2fs_format.c            |   8 +-
 mkfs/f2fs_format_main.c       |  35 ++++-
 14 files changed, 624 insertions(+), 35 deletions(-)
 create mode 100644 include/f2fs_metadata_crypt.h
 create mode 100644 lib/f2fs_metadata_crypt.c

-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
