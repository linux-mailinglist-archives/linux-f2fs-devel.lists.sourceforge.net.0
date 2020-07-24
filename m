Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D822C4F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 14:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PXf7ikhzHo15uIP4gVmg9Z2cfCyDiHKVRP27RFjKAv8=; b=ZSR9p87r4YzAC1uExjZc82Ds7P
	mcPAKI0/H9127VbgW1WTOyEEASg+WoawjhrCgQSkm44yPWR1rRV08xBUYpffu2uTdAryx3ZPAL3jm
	WpPzWmMi7Z3dzwyJblRW+8+D+RPqM8h7MRCXJE1IsK/WS61KYxTVNjngmG9jOc1OkdhE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jywes-0003AF-Cd; Fri, 24 Jul 2020 12:18:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3BdAaXwYKABA8q9Eq9w44w1u.s42@flex--satyat.bounces.google.com>)
 id 1jyweq-0003A5-QV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iD4FUEMenVr5lbrZY3MfjlLwUfP0+0if0gfZ+EqYyLI=; b=KVvLhue0dzmmMn8a/55A8qVFcS
 /QpTDHRvKt6sFsdYdKRmgXO9ycQW/sHG26Yq7LCKFjrCN0k2QbeoR8rxALztUsysJ+U+WtS+tW9Zu
 NxCY42tzzEalOcJzGUNksZ/kWYVd4SD2axGw+Q9l7ChfXTU+ICCOXiVX9zDvQbRPJ8PE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iD4FUEMenVr5lbrZY3MfjlLwUfP0+0if0gfZ+EqYyLI=; b=R
 IXj97j94F/3VUZ/l5I/Vwh+E3VxwirRpxiwYPuLaC+Nt2Q2SwCwDmW7PSIKvrMePH8UIal/l5ZIrw
 z2qVhsTCk6Tu6JPhQ7ybs1mmM4BPdbF+UdP5ZZ0tueSgYKO32igirREt75uz9WE/0HDnhruhgEZln
 ujlB98ZDhqHQFfWU=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jywef-001Mhy-9D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:18:36 +0000
Received: by mail-pg1-f202.google.com with SMTP id z16so6186437pgh.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=iD4FUEMenVr5lbrZY3MfjlLwUfP0+0if0gfZ+EqYyLI=;
 b=LU3Hl6Xb+kMb570dums3X91bS1lNWjAd6VAivVVwirnidnc44D39+JcML+BJHAGiYb
 /hLd0zQi1FE3LxsnU7ZCOiHAwNYFdEQm0Bw4lVG08rIUvLsp792e/7XMSZZKpfCuj9Wi
 Mc8RxN2om8nGrDd3CaWoXZVr6lkr8/IILg3NAUhby99DW4FbyIdip+AGS2zLfcAtbz/F
 O9L2jZzffcKwr1Nl0ZHrIcY6HnWsZBa3k0OuPKOQb9xFpTMvj12C/tW6+hn7DR9DEsn4
 VKLlFLHhKUhRXgHCiOcqBzkEP20Hlp9PqlgiscGHlUoNdDb1QOOHybUTJiChgSWV7ZW+
 1eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=iD4FUEMenVr5lbrZY3MfjlLwUfP0+0if0gfZ+EqYyLI=;
 b=Z/9QbREYYTuNgIlouJkVvfH3gFEahWM2rE3BAfenomULVBA61B9UFFgHalLCQxUcpx
 AOZAaUtE4EW/U48Ua+p69geskRlzyz+Y9wTUmHYlegRgPvsk72nui9FECnaO9VJobTyO
 YUxL8BkT+d5Xq85PRHXPKpniBc56fPpodZ6HzKfUpsJvu1RjG25F7cXqX4/UBJLgw8li
 5n8xzUUR3y/xia3BtO+aC4Y+UQNNfy7qALHOLBjQDzhw7Ox9olSRwnTHD3Zq1xLJvaBw
 y1AF4jUGXiicS/g4kIkzUZXOlP79N4Uv/vHR5SPPdgB+SK9Z8rREknR1RdUHx2NNmjid
 IGUw==
X-Gm-Message-State: AOAM533DZrbv/GYWsyEiavGeVBjkgGR6WGz3Mwml84XRsl/GWbTIlbsD
 dlgTUrY4WPDO7IK7QVl2+2POxQvB42U=
X-Google-Smtp-Source: ABdhPJyWpT2NfcWEy4aLcDx08oXPKDl45eq2YPnQvm8sfH2moUaX/HTt1lJWyIEHpqxaEqJ3QKBmMRx778Y=
X-Received: by 2002:a63:4b44:: with SMTP id k4mr2076411pgl.305.1595592709047; 
 Fri, 24 Jul 2020 05:11:49 -0700 (PDT)
Date: Fri, 24 Jul 2020 12:11:36 +0000
Message-Id: <20200724121143.1589121-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
 -1.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jywef-001Mhy-9D
Subject: [f2fs-dev] [PATCH v5 0/7] add support for direct I/O with fscrypt
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for direct I/O with fscrypt using
blk-crypto. It has been rebased on fscrypt/master (i.e. the "master"
branch of the fscrypt tree at
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git)

Patch 1 adds two functions to fscrypt that need to be called to determine
if direct I/O is supported for a request.

Patches 2 and 3 modify direct-io and iomap respectively to set bio crypt
contexts on bios when appropriate by calling into fscrypt.

Patches 4 and 5 allow ext4 and f2fs direct I/O to support fscrypt without
falling back to buffered I/O.

Patches 6 and 7 update the fscrypt documentation for inline encryption
support and direct I/O. The documentation now notes the required conditions
for inline encryption and direct I/O on encrypted files.

This patch series was tested by running xfstests with test_dummy_encryption
with and without the 'inlinecrypt' mount option, and there were no
meaningful regressions. One regression was for generic/587 on ext4,
but that test isn't compatible with test_dummy_encryption in the first
place, and the test "incorrectly" passes without the 'inlinecrypt' mount
option - a patch will be sent out to exclude that test when
test_dummy_encryption is turned on with ext4 (like the other quota related
tests that use user visible quota files). The other regression was for
generic/252 on ext4, which does direct I/O with a buffer aligned to the
block device's blocksize, but not necessarily aligned to the filesystem's
block size, which direct I/O with fscrypt requires.

Changes v4 => v5:
 - replace fscrypt_limit_io_pages() with fscrypt_limit_io_block(), which
   is now called by individual filesystems (currently only ext4) instead
   of the iomap code. This new function serves the same end purpose as
   the one it replaces (ensuring that DUNs within a bio are contiguous)
   but operates purely with blocks instead of with pages.
 - make iomap_dio_zero() set bio_crypt_ctx's again, instead of just a
   WARN_ON() since some folks prefer that instead.
 - add Reviewed-by's

Changes v3 => v4:
 - Fix bug in iomap_dio_bio_actor() where fscrypt_limit_io_pages() was
   being called too early (thanks Eric!)
 - Improve comments and fix formatting in documentation
 - iomap_dio_zero() is only called to zero out partial blocks, but
   direct I/O is only supported on encrypted files when I/O is
   blocksize aligned, so it doesn't need to set encryption contexts on
   bios. Replace setting the encryption context with a WARN_ON(). (Eric)

Changes v2 => v3:
 - add changelog to coverletter

Changes v1 => v2:
 - Fix bug in f2fs caused by replacing f2fs_post_read_required() with
   !fscrypt_dio_supported() since the latter doesn't check for
   compressed inodes unlike the former.
 - Add patches 6 and 7 for fscrypt documentation
 - cleanups and comments

Eric Biggers (5):
  fscrypt: Add functions for direct I/O support
  direct-io: add support for fscrypt using blk-crypto
  iomap: support direct I/O with fscrypt using blk-crypto
  ext4: support direct I/O with fscrypt using blk-crypto
  f2fs: support direct I/O with fscrypt using blk-crypto

Satya Tangirala (2):
  fscrypt: document inline encryption support
  fscrypt: update documentation for direct I/O support

 Documentation/filesystems/fscrypt.rst | 36 +++++++++++--
 fs/crypto/crypto.c                    |  8 +++
 fs/crypto/inline_crypt.c              | 75 +++++++++++++++++++++++++++
 fs/direct-io.c                        | 15 +++++-
 fs/ext4/file.c                        | 10 ++--
 fs/ext4/inode.c                       |  7 +++
 fs/f2fs/f2fs.h                        |  6 ++-
 fs/iomap/direct-io.c                  |  6 +++
 include/linux/fscrypt.h               | 19 +++++++
 9 files changed, 173 insertions(+), 9 deletions(-)

-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
