Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B692230D7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dAE8c1q8ieGkx5YJbfL+e0QH6BgjyBndIt7ziOk7aw=; b=Stl4GYGXP/LBlrXQ17FbWIIf5j
	LhW4VrPW4oLBaDWs4852mJBchqiMeoeDRlpL6dds+7mPtLt+k7sG159h8726akbpX+4/trKM8jxV/
	XuEhQf5/rEl3HsFe0HPRR3/wbrMuZSrrOho/JK4eT2g+ERounzu0WGRm9nUpngv3GYzk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFZe-0003Mz-E0; Fri, 17 Jul 2020 01:54:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xwIRXwYKABA8q9Eq9w44w1u.s42@flex--satyat.bounces.google.com>)
 id 1jwFZd-0003Ml-5J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+7NEyAtngBQ+NtsVner/xkX+DqdKiAPFh6L75+tULz8=; b=Xx4YDX363qODnThygwyUl5+RGG
 TQN1H9bODJ65OM1lAtPUWmza9Y98Jg5Jp7wqQXbqyWaTigeJLj4/vSqU9Qadqt5GunPcnaqATQjU7
 x6I/jbk8RFR82PlT9yGPtyF3AaCcu6i5PW4LRb1BotgqpiGRjxDVMqpIAXXUJQRffJAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+7NEyAtngBQ+NtsVner/xkX+DqdKiAPFh6L75+tULz8=; b=G
 CoxsNVM/JnMOQibG4Bq5boO1NwpDORlS/nqY444/sqYhP2GZGAtjcDXUVoFqhP1+Hesrlp6fA5oa+
 /npvfaTynCWmsB2idQNcYg5vsJsn87doGtK5yQy0UeYEE0kJ04jmDHhxPYGpOfeMr/5b50NTvhBTg
 rodGLL4kgFCtRqSU=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFZb-00BMQe-MA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:54:05 +0000
Received: by mail-pg1-f201.google.com with SMTP id x184so6840852pgb.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+7NEyAtngBQ+NtsVner/xkX+DqdKiAPFh6L75+tULz8=;
 b=J+mnXJRVYMafFS+o+P1bnt+16uWofUiyPCntsNg3XT8Ib1llpcyxPal6f8PIhCbEDg
 Bo3vrtVP+ewSO7mAdmr/5QJ9Q+8lznYArog6g6Yn/TfIOxtFnyBUbMMAwMzb387Hy+4n
 NQYc29hAipQB21eO+fNDCbt/nxbJdxHIpwdS6q5E+lrkLVzIPyKreakfHHlXU24OaGvS
 3sXbnd44eyIaABhMDfgRBS8/v+RMqJjd4+Y7VXgScSnrFKX+q5auEO7ITSrLsysG3q8i
 cwejZgsFGxkO262PT1lH8HbVFmp3uClJ+EgYMnzYiw35fV3DZjxG3i2PWmg+wIKT4XiR
 t2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+7NEyAtngBQ+NtsVner/xkX+DqdKiAPFh6L75+tULz8=;
 b=Cwkn1n8GrGdNWSF7Fc7PuJ1RdnjPiOvkTTimO354IazeX53aZ7OU7Uv2Alw83hHc67
 TaB7vxLaxoFFm1S+uhLa6aOJXaoflsOxte5+U1J9yCVY4//BFo4LlWiwXaHar6x5Ja/L
 q2Rd4nfi1jAATFNFnm+HUAEQ+Z/7ILEgNC2zx3Hwcqr/9XnIbNN2GfSnl/E2Xjsi4tuc
 bNVAbpWjNXux0lNrZL119OAOsIWmrtOizM88e+fI1vdbm/z4o99AzH6wXl4by88Yju9u
 UpyxQIuCwMAsC+BRA4d9g+Hc5mDWyM6K+UeHAEivTOfvM7cvDCPSZ4lCAZjcj4BY4Gcg
 XDXw==
X-Gm-Message-State: AOAM532OplI2gayeY21OmD1Z3FiI42fe8/hXx4vMIICeBesMJR/Xa7xs
 Reb8ltDRH2AGBiykiQLqv9uph5qvmoc=
X-Google-Smtp-Source: ABdhPJyaOqu4ad+t9uE7Zf0fPE6MJrUBppYirFS0r4ZA4lohiyuJAJadPtXvIAZN/YC0+AHkJyLwA8Dg4AI=
X-Received: by 2002:a17:902:ed13:: with SMTP id
 b19mr5756330pld.294.1594950343440; 
 Thu, 16 Jul 2020 18:45:43 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:45:33 +0000
Message-Id: <20200717014540.71515-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFZb-00BMQe-MA
Subject: [f2fs-dev] [PATCH v3 0/7] add support for direct I/O with fscrypt
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
 fs/crypto/inline_crypt.c              | 80 +++++++++++++++++++++++++++
 fs/direct-io.c                        | 15 ++++-
 fs/ext4/file.c                        | 10 ++--
 fs/f2fs/f2fs.h                        |  6 +-
 fs/iomap/direct-io.c                  |  8 +++
 include/linux/fscrypt.h               | 19 +++++++
 8 files changed, 173 insertions(+), 9 deletions(-)

-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
