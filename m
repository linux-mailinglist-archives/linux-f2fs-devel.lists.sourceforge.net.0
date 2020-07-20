Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015C22731F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yacicszSU/jcdRNvzHzutVHe9VzkWjjfjxh6mjZ8gQ=; b=GZsVzu7HVXkDw3e6KlMyCyViY5
	i+nh91JyjdoDGrq+Yt/y5xYXXXb8OLQUntg8hXMyulcL/WkFWtcg2c3yeVgWbihFlpED0CMaCWJ0n
	vBm9OVxbfu5ivtlAig+fFVIusE0ysZD/0Xb79G1IiTh3LZD4zNXqriKvhjIL0YvVTZ7Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfM2-0006kn-A1; Mon, 20 Jul 2020 23:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xioWXwYKAHMjRkpRkXffXcV.Tfd@flex--satyat.bounces.google.com>)
 id 1jxfLx-0006kS-Gl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKlpB9JflgOJW0lsaq+hMYnQNitRzPyz15HBElBY3z8=; b=Vh9PHkRctfGe2dA/rSUDvVGpJ4
 PO03ai6WrkNQZEtWmuMlJvILoOcfy7LcdC+gZEznBVPsUNPe44dRpanWgx+VI6Mn9Gly8wpEP38y9
 +wPC+RbINgd+DXMtbryyPQkeaEi6UEro+xjK/r48ElU9vnK13jx0b+eyePoJnaWlnpSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oKlpB9JflgOJW0lsaq+hMYnQNitRzPyz15HBElBY3z8=; b=B
 pBvi03gFF8W1gVidTEOyaROBNB138hhxhfG8EaYTpTcUULQNEEPkdRxym0T7S9xZJvr4hffGMVsN8
 N2rZuS0R+pF28/pDvItkTRocBohFPtHaOLogDIALfn4IotxLwRIRlphsFHAxH04PMbIdQ4LtxHwPz
 CWWvQxAHXVcgNpqc=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfLw-00BOmZ-4V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:49 +0000
Received: by mail-qk1-f202.google.com with SMTP id h4so12512074qkl.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oKlpB9JflgOJW0lsaq+hMYnQNitRzPyz15HBElBY3z8=;
 b=i17qPxIQ+FYgs3/oOkOTA5egde4Z8SYqICXc/pdjW+3WlCsYt5Ni8BXkdy6av3PK9M
 q10Dc6or8ugIU4p7j4z+lX1BMSKSUBjbUKPTbnQ2pj4kjL4yUWDHbPar9ysEPBmCd00E
 RtQLja8gf0x2Lyf2Urkel1+HH1DQoGfS8C86KzqnVbhAGPkdYqrCpEGINpz0h8/oI5SU
 IR0EaVXQIAeQZ4yNPLmyksD9kfZmAsxiWyKNilqbtimuctJbIkWpZEkyK24hZ3d+tcAb
 1bw3VNgz1m7X133cTcDXWo2m3DeD+0yX7sg26+tp3PzZZXsaJjovcak1mqDzUPd0b2pl
 xGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oKlpB9JflgOJW0lsaq+hMYnQNitRzPyz15HBElBY3z8=;
 b=uTEwc1G9kixJnzhCXVWdhR9d9+Uhkx+3g5+N7WDPqH/hGct9Qa71vL/0Utz1sVl389
 Y398kEWCsLDKoET3j3Xrm6TZ7h8XC7lTuxExqcKbDuJhLU6OlHd8gLyU/kIaue7EAxUw
 oMTqsZu1wdR2d2NwQu9trKFNjWuXSkmHVZH+yLmSe+y39I83Ww5wlXFdO4+Qih15A2+p
 U3nKdonzCkkLwC1WEbiVa44ltJwxNn+tFEucVbkGdYN2aCnzvkT+ORZg8Gqyd4kIOjqr
 aJuSLJwm7R7QH0fZGkLthc9r2OQF1GpUEG3hGdUC4kQu9vIwOaGp5OSI4h/5WfxtrNm7
 0sSA==
X-Gm-Message-State: AOAM533AqWWHHuPnrYHgg4CqSsEZ0CeGbNBBv3GD+7ix/eNRnVljSolJ
 xMG7xYg7u4ceRldsEOUzATDHDdwA+4U=
X-Google-Smtp-Source: ABdhPJyBkI/ohJhicP2uZzD/rrAaWCmvyhCaVPrvr7OjYU3dPRB2s26/Urv6XxL5AogW5RzjOXaC57U0VCg=
X-Received: by 2002:a0c:e308:: with SMTP id s8mr24750179qvl.127.1595288262100; 
 Mon, 20 Jul 2020 16:37:42 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:32 +0000
Message-Id: <20200720233739.824943-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jxfLw-00BOmZ-4V
Subject: [f2fs-dev] [PATCH v4 0/7] add support for direct I/O with fscrypt
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
blk-crypto. It has been rebased on fscrypt/master.

Patch 1 adds two functions to fscrypt that need to be called to determine
if direct I/O is supported for a request.

Patches 2 and 3 wire up direct-io and iomap respectively with the functions
introduced in Patch 1 and set bio crypt contexts on bios when appropriate
by calling into fscrypt.

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

 Documentation/filesystems/fscrypt.rst | 36 +++++++++++-
 fs/crypto/crypto.c                    |  8 +++
 fs/crypto/inline_crypt.c              | 82 +++++++++++++++++++++++++++
 fs/direct-io.c                        | 15 ++++-
 fs/ext4/file.c                        | 10 ++--
 fs/f2fs/f2fs.h                        |  6 +-
 fs/iomap/direct-io.c                  | 12 +++-
 include/linux/fscrypt.h               | 19 +++++++
 8 files changed, 178 insertions(+), 10 deletions(-)

-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
