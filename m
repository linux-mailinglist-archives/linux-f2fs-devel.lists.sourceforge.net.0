Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jyRzAf5PVGr7kQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:39:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482B746ADB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=alJ625vv;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="VKR/RmN5";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=GFE3icmZ;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=VmZHZRFy;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf5SCJ56M6NJUgxiPpVOcEExEpPndkYsc4EBHONoQSY=; b=alJ625vveYVKiq7xgLiqx9DUrm
	zPi/LeTYgtB7RWPmBbjZ6iW5s0FnNHFi4+7FgJMhrmYX9036lk+Fa22HNKJk1elsIAmAEJluwn3N1
	6zd2D3PXxR3Tj3n/CFbvPJdoCCG7gQsiMNFRoXVVrEozWTFTVF453lKluFHxHYzBxXS8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj6aI-00064J-DB;
	Mon, 13 Jul 2026 02:39:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wj6aG-000640-OP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3huENAtNragvz5r4Qp0pJND/8Cyxcra8X09kjAT3Wg=; b=VKR/RmN5W7oojtnOnTKLWpQZPt
 PlZ/LOTEKllnGxjG9msJWzeKbEGRiweOUwcL2Ju/+nPWMJEhtZkHjQa02bL7jN1xFX/k37qIC2ZGt
 97XXLPcNgmZgDNVVEUFCZo4a3HOxOUFS9RkIWNDvgtE/eoucTqaZjwkT30AEXFRf2F9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m3huENAtNragvz5r4Qp0pJND/8Cyxcra8X09kjAT3Wg=; b=GFE3icmZNMtYtmPkkYUFrkSGni
 8rxBD7X/k21WuOiZ7V+zFKn4TNLqwofDX0MzmUCCQqeFJrWtBKmK1LHoODTl4E/8gjivlfslCrkbv
 0hSG8ugGZHBVy7QgIBzFO6hSYAqAm8E55gdPKXn3kW9B098fcyhNraoZibz9WpULniW4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj6aG-0003Bm-QL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:39:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8382A43627;
 Mon, 13 Jul 2026 02:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC291F00A3D;
 Mon, 13 Jul 2026 02:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783910382;
 bh=m3huENAtNragvz5r4Qp0pJND/8Cyxcra8X09kjAT3Wg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VmZHZRFyn92wa4cbZ6q0YeacYmnePCqY3poWZ+eNZkfey9boo3dY6QnuMUOArwtKA
 QrJWNEMmgME16v8oLLA8e/58shoq0+van7ONH6QePsaX8Yczo71uRy/GnpL5R2tyY1
 ZvLBB5w8bmD58rzb4ZivD+IyBV1A7RkaMgCxKtUzor8u1ZqoBskNZ7/raGnh6c9fEg
 zV1+WQMkjTJ7hiVyINRdSWnnhkulRTRNmCd8HhJGMIaYdQgBqj7Ilfaxw3eQmnTRFY
 5tWTtSaVOmhEvCUcRa537/OTypFagjarq87yh5uTdaT24MjreMjoY2owe9EZYzoURZ
 u3nTUmyqvu2dA==
To: linux-fscrypt@vger.kernel.org
Date: Sun, 12 Jul 2026 22:36:57 -0400
Message-ID: <20260713023708.9245-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713023708.9245-1-ebiggers@kernel.org>
References: <20260713023708.9245-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update the documentation for the inlinecrypt mount option
 to reflect that it's now just about the choice of whether to use inline
 encryption
 hardware, not whether the blk-crypto framework is used. Also remove an outdated
 statement about the data unit size, and make the ext4 and f2fs docs reference
 the fscrypt docs rather than the block layer docs directly. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wj6aG-0003Bm-QL
Subject: [f2fs-dev] [PATCH v3 06/17] Documentation: fscrypt: Update docs for
 inlinecrypt
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8482B746ADB

Update the documentation for the inlinecrypt mount option to reflect
that it's now just about the choice of whether to use inline encryption
hardware, not whether the blk-crypto framework is used.

Also remove an outdated statement about the data unit size, and make the
ext4 and f2fs docs reference the fscrypt docs rather than the block
layer docs directly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/admin-guide/ext4.rst    |  8 ++--
 Documentation/filesystems/f2fs.rst    | 10 ++---
 Documentation/filesystems/fscrypt.rst | 55 ++++++++++-----------------
 3 files changed, 28 insertions(+), 45 deletions(-)

diff --git a/Documentation/admin-guide/ext4.rst b/Documentation/admin-guide/ext4.rst
index ac0c709ea9e7..742a48e6fc0c 100644
--- a/Documentation/admin-guide/ext4.rst
+++ b/Documentation/admin-guide/ext4.rst
@@ -385,11 +385,9 @@ When mounting an ext4 filesystem, the following option are accepted:
         incompatible with data=journal.
 
   inlinecrypt
-        When possible, encrypt/decrypt the contents of encrypted files using the
-        blk-crypto framework rather than filesystem-layer encryption. This
-        allows the use of inline encryption hardware. The on-disk format is
-        unaffected. For more details, see
-        Documentation/block/inline-encryption.rst.
+        When possible, encrypt/decrypt the contents of encrypted files using
+        inline encryption hardware rather than the CPU. For more details, see
+        Documentation/filesystems/fscrypt.rst.
 
 Data Mode
 =========
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 8c4a14ae444f..b45d7a687625 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -351,12 +351,10 @@ compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
 compress_cache		 Support to use address space of a filesystem managed inode to
 			 cache compressed block, in order to improve cache hit ratio of
 			 random read.
-inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
-			 files using the blk-crypto framework rather than
-			 filesystem-layer encryption. This allows the use of
-			 inline encryption hardware. The on-disk format is
-			 unaffected. For more details, see
-			 Documentation/block/inline-encryption.rst.
+inlinecrypt		 When possible, encrypt/decrypt the contents of
+			 encrypted files using inline encryption hardware rather
+			 than the CPU. For more details, see
+			 Documentation/filesystems/fscrypt.rst.
 atgc			 Enable age-threshold garbage collection, it provides high
 			 effectiveness and efficiency on background GC.
 discard_unit=%s		 Control discard unit, the argument can be "block", "segment"
diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 92b8f311e211..5f1b5b53aa16 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1318,32 +1318,20 @@ Inline encryption support
 
 Many newer systems (especially mobile SoCs) have *inline encryption
 hardware* that can encrypt/decrypt data while it is on its way to/from
-the storage device.  Linux supports inline encryption through a set of
-extensions to the block layer called *blk-crypto*.  blk-crypto allows
-filesystems to attach encryption contexts to bios (I/O requests) to
-specify how the data will be encrypted or decrypted in-line.  For more
-information about blk-crypto, see
-:ref:`Documentation/block/inline-encryption.rst <inline_encryption>`.
+the storage device.
 
 On supported filesystems (currently ext4 and f2fs), fscrypt can use
-blk-crypto instead of the kernel crypto API to encrypt/decrypt file
-contents.  To enable this, set CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y in
-the kernel configuration, and specify the "inlinecrypt" mount option
-when mounting the filesystem.
-
-Note that the "inlinecrypt" mount option just specifies to use inline
-encryption when possible; it doesn't force its use.  fscrypt will
-still fall back to using the kernel crypto API on files where the
-inline encryption hardware doesn't have the needed crypto capabilities
-(e.g. support for the needed encryption algorithm and data unit size)
-and where blk-crypto-fallback is unusable.  (For blk-crypto-fallback
-to be usable, it must be enabled in the kernel configuration with
-CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y, and the file must be
-protected by a raw key rather than a hardware-wrapped key.)
-
-Currently fscrypt always uses the filesystem block size (which is
-usually 4096 bytes) as the data unit size.  Therefore, it can only use
-inline encryption hardware that supports that data unit size.
+inline encryption hardware instead of the CPU to encrypt/decrypt file
+contents.  To enable this, specify the "inlinecrypt" mount option when
+mounting the filesystem.
+
+This causes the filesystem to use inline encryption hardware whenever
+possible, falling back to the CPU only if such hardware is absent or
+doesn't provide the needed crypto capabilities.
+
+For more information about the kernel's support for inline encryption
+hardware, see :ref:`Documentation/block/inline-encryption.rst
+<inline_encryption>`.
 
 Inline encryption doesn't affect the ciphertext or other aspects of
 the on-disk format, so users may freely switch back and forth between
@@ -1425,10 +1413,8 @@ For direct I/O on an encrypted file to work, the following conditions
 must be met (in addition to the conditions for direct I/O on an
 unencrypted file):
 
-* The file must be using inline encryption.  Usually this means that
-  the filesystem must be mounted with ``-o inlinecrypt`` and inline
-  encryption hardware must be present.  However, a software fallback
-  is also available.  For details, see `Inline encryption support`_.
+* The filesystem must be block-based.  (Before Linux v7.3, the
+  filesystem also needed to be mounted with ``-o inlinecrypt``.)
 
 * The I/O request must be fully aligned to the filesystem block size.
   This means that the file position the I/O is targeting, the lengths
@@ -1555,14 +1541,11 @@ Tests
 
 To test fscrypt, use xfstests, which is Linux's de facto standard
 filesystem test suite.  First, run all the tests in the "encrypt"
-group on the relevant filesystem(s).  One can also run the tests
-with the 'inlinecrypt' mount option to test the implementation for
-inline encryption support.  For example, to test ext4 and
+group on the relevant filesystem(s).  For example, to test ext4 and
 f2fs encryption using `kvm-xfstests
 <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::
 
     kvm-xfstests -c ext4,f2fs -g encrypt
-    kvm-xfstests -c ext4,f2fs -g encrypt -m inlinecrypt
 
 UBIFS encryption can also be tested this way, but it should be done in
 a separate command, and it takes some time for kvm-xfstests to set up
@@ -1584,7 +1567,6 @@ This tests the encrypted I/O paths more thoroughly.  To do this with
 kvm-xfstests, use the "encrypt" filesystem configuration::
 
     kvm-xfstests -c ext4/encrypt,f2fs/encrypt -g auto
-    kvm-xfstests -c ext4/encrypt,f2fs/encrypt -g auto -m inlinecrypt
 
 Because this runs many more tests than "-g encrypt" does, it takes
 much longer to run; so also consider using `gce-xfstests
@@ -1592,4 +1574,9 @@ much longer to run; so also consider using `gce-xfstests
 instead of kvm-xfstests::
 
     gce-xfstests -c ext4/encrypt,f2fs/encrypt -g auto
-    gce-xfstests -c ext4/encrypt,f2fs/encrypt -g auto -m inlinecrypt
+
+To test inline encryption hardware on a platform that supports such
+hardware, run xfstests directly with the ``inlinecrypt`` mount option
+enabled.  For example::
+
+    EXT_MOUNT_OPTIONS="-o inlinecrypt" ./check -g encrypt
-- 
2.55.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
