Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BEB5A583D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 01:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSoap-0007zi-Ix;
	Mon, 29 Aug 2022 23:54:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1oSoao-0007zc-I0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 23:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9jNTVvjMRAW6grFHfLBzo2F+51I1/cIt+X3djvXT2II=; b=lLM8DEfB99XGipAgcKP7vZc7lK
 Uwc85YPAGa0EpndjJQR8b6TP1kMF4FMh4CRZTtcJIpDFjRULQQF9sCsxZH1NDNQQmwPac3E3Cnxz/
 UdtUqJYIQs57ErEaIbQzPfxAVaZ+o8t50K9gan6Sv3JiPxM2oMU3Qo8TJL0EbSUjfY6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9jNTVvjMRAW6grFHfLBzo2F+51I1/cIt+X3djvXT2II=; b=l
 /jfFOR6zm8mWxk8vOMdTdfsousQZbEOrE0dvlr6M2FeyagSUIi0b2eAP0X5EZmG+Fj6KnFQTnWoK/
 cMKzHy811pORex47fXNmtWqFSDvVF4BpGlMe+mOesfIflMZEE65HJztIwTgEVpdEg0RUnYIAnLOx1
 9H5+NtJhBOLLrbBs=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSoaj-006v9Q-AH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 23:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=9jNTVvjMRAW6grFHfLBzo2F+51I1/cIt+X3djvXT2II=; b=T58qP97pKEyA1GKZgxVdQ9glHA
 MPSrOCjD6FQsyq1DA/MJj+EGg1/rMoM3bKlxfpiR4QsXgR1tTGxyh8g+y/brA4Ae0AYNkkrfGaL53
 E7bIR/mKnk+FMW1U6/1RVBZk1nORPnbrd9xs7eJkAXfO6kmTZbaCzQcA1FcAm5GMMzfg7wmA4cO8c
 oFSejiPfXIp4DDOF5SywFtc2LMlpzJZh08RV4SV+POPKIxRWSAlg9HRglc9QXZMQ5yKjuiBquWagV
 iyVRDuaE5VMr+pGTGlyVxmtvgALJUSmbc/WujflaVOdJNGDGF6Lsx1MgSASyuNEDoVAqQJJ08Lrwx
 5XjzLG0g==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oSoaQ-003WLW-OL; Mon, 29 Aug 2022 23:54:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Date: Mon, 29 Aug 2022 16:54:29 -0700
Message-Id: <20220829235429.17902-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Change occurrences of "it's" that are possessive to "its"
 so that they don't read as "it is". Signed-off-by: Randy Dunlap
 <rdunlap@infradead.org>
 Cc: Jonathan Corbet <corbet@lwn.net> Cc: linux-fsdevel@vger.kernel.org Cc:
 linux-f2fs-devel@lists.sourceforge.net Cc: linux-xfs@vger.kernel.org Cc:
 [...] Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1oSoaj-006v9Q-AH
Subject: [f2fs-dev] [PATCH] Documentation: filesystems: correct possessive
 "its"
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
Cc: Christian Brauner <brauner@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Seth Forshee <sforshee@kernel.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Change occurrences of "it's" that are possessive to "its"
so that they don't read as "it is".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>
Cc: Seth Forshee <sforshee@kernel.org>
---
 Documentation/filesystems/f2fs.rst                       |    2 +-
 Documentation/filesystems/idmappings.rst                 |    2 +-
 Documentation/filesystems/qnx6.rst                       |    2 +-
 Documentation/filesystems/xfs-delayed-logging-design.rst |    6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -287,7 +287,7 @@ compress_algorithm=%s:%d Control compres
 			 lz4		3 - 16
 			 zstd		1 - 22
 compress_log_size=%u	 Support configuring compress cluster size, the size will
-			 be 4KB * (1 << %u), 16KB is minimum size, also it's
+			 be 4KB * (1 << %u), 16KB is minimum size, also its
 			 default size.
 compress_extension=%s	 Support adding specified extension, so that f2fs can enable
 			 compression on those corresponding files, e.g. if all files
--- a/Documentation/filesystems/idmappings.rst
+++ b/Documentation/filesystems/idmappings.rst
@@ -661,7 +661,7 @@ idmappings::
  mount idmapping:      u0:k10000:r10000
 
 Assume a file owned by ``u1000`` is read from disk. The filesystem maps this id
-to ``k21000`` according to it's idmapping. This is what is stored in the
+to ``k21000`` according to its idmapping. This is what is stored in the
 inode's ``i_uid`` and ``i_gid`` fields.
 
 When the caller queries the ownership of this file via ``stat()`` the kernel
--- a/Documentation/filesystems/qnx6.rst
+++ b/Documentation/filesystems/qnx6.rst
@@ -176,7 +176,7 @@ Then userspace.
 The requirement for a static, fixed preallocated system area comes from how
 qnx6fs deals with writes.
 
-Each superblock got it's own half of the system area. So superblock #1
+Each superblock got its own half of the system area. So superblock #1
 always uses blocks from the lower half while superblock #2 just writes to
 blocks represented by the upper half bitmap system area bits.
 
--- a/Documentation/filesystems/xfs-delayed-logging-design.rst
+++ b/Documentation/filesystems/xfs-delayed-logging-design.rst
@@ -551,14 +551,14 @@ Essentially, this shows that an item tha
 and relogged, so any tracking must be separate to the AIL infrastructure. As
 such, we cannot reuse the AIL list pointers for tracking committed items, nor
 can we store state in any field that is protected by the AIL lock. Hence the
-committed item tracking needs it's own locks, lists and state fields in the log
+committed item tracking needs its own locks, lists and state fields in the log
 item.
 
 Similar to the AIL, tracking of committed items is done through a new list
 called the Committed Item List (CIL).  The list tracks log items that have been
 committed and have formatted memory buffers attached to them. It tracks objects
 in transaction commit order, so when an object is relogged it is removed from
-it's place in the list and re-inserted at the tail. This is entirely arbitrary
+its place in the list and re-inserted at the tail. This is entirely arbitrary
 and done to make it easy for debugging - the last items in the list are the
 ones that are most recently modified. Ordering of the CIL is not necessary for
 transactional integrity (as discussed in the next section) so the ordering is
@@ -884,7 +884,7 @@ pin the object the first time it is inse
 the CIL during a transaction commit, then we do not pin it again. Because there
 can be multiple outstanding checkpoint contexts, we can still see elevated pin
 counts, but as each checkpoint completes the pin count will retain the correct
-value according to it's context.
+value according to its context.
 
 Just to make matters more slightly more complex, this checkpoint level context
 for the pin count means that the pinning of an item must take place under the


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
