Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDC3E21CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 04:45:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBprm-0000GY-Eb; Fri, 06 Aug 2021 02:45:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mBprk-0000GS-BI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 02:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tuu5M4ARPBvMUi9cuAeDpw8sAG0VUS0LMMiq1AA9ZDQ=; b=UQYibDEawEViHmioMrT6pY6kbW
 PFjeRxOSq42CDO5Y4pYAdniOao7S5p/M3BFnhezFS7CYiZpLRwp6RIHT/cYSqb7wENbCj/KG6LdMe
 4PfqjlrsPPJ1HZzWmg1IGMXRPkeP/LhiPSQcf5bYlF4KkMNhZvNNq9ZpKJjzBU67Fda4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tuu5M4ARPBvMUi9cuAeDpw8sAG0VUS0LMMiq1AA9ZDQ=; b=I
 Ay03EWFFegONWEijOXR0QJdWhDg1Fnn+MclYg3gZvk9FJaJdUvqgxJx3fl2ygByvGym6TIF7uNdkw
 jbjQBG/CT5MtHw9P3IhJ10pZwxnFk1VQ6FD7uyiOP05ZqkO1Xq1t0iJoZsQKAJfWncaBKVJZYoCsa
 DvDTk40+TLs6Xo2A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBprb-0002K6-PV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 02:45:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5872E6115C;
 Fri,  6 Aug 2021 02:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628217925;
 bh=4WG3Xy5a28hpnUiSoPP15oFF0Y1VPccNAl4XAoX006E=;
 h=From:To:Cc:Subject:Date:From;
 b=aH8LQa0SU+wbfB0EqM6lmUcBBLxn2Wv7+KOFcOpU/65iUzD2W0XBz4hZTj9yccKTg
 7Ee+VR/OQ1Shuiq1w5g9e+PM7ozHa30uNWUGlodS04pVCnxBtzmrERhPkH3X7sWHfe
 yskb9TNx4bcTfKItonEQXUAoPHJMWa1CQxtsHXAaiDvi0IsWkk8Uhr9OohRt1rjCYi
 CUFlZxeaWo6Ht+3OGPisGkYP/AMew39/JJhLwWsTByJRgUUea9oOcui63r6FAB4daq
 K1RRWw2Nql5lXAHeP1B+6FmggtpvW5To0WvZ4e1S/l8T7+RjzxkN5zofbDciYlTkid
 CGul8gsVgTJtw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  6 Aug 2021 10:45:20 +0800
Message-Id: <20210806024521.52089-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBprb-0002K6-PV
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to keep compatibility of fault
 injection interface
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The value of FAULT_* macros and its description in f2fs.rst became
inconsistent, fix this to keep compatibility of fault injection
interface.

Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 1 +
 fs/f2fs/f2fs.h                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 8f251a662542..8fe1450670bb 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -185,6 +185,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_KVMALLOC		  0x000000002
 			 FAULT_PAGE_ALLOC	  0x000000004
 			 FAULT_PAGE_GET		  0x000000008
+			 FAULT_ALLOC_BIO	  0x000000010 (obsolete)
 			 FAULT_ALLOC_NID	  0x000000020
 			 FAULT_ORPHAN		  0x000000040
 			 FAULT_BLOCK		  0x000000080
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8e1c2766eee2..0f4349e6979a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -43,6 +43,7 @@ enum {
 	FAULT_KVMALLOC,
 	FAULT_PAGE_ALLOC,
 	FAULT_PAGE_GET,
+	FAULT_ALLOC_BIO,	/* it's obsolete due to bio_alloc() will never fail */
 	FAULT_ALLOC_NID,
 	FAULT_ORPHAN,
 	FAULT_BLOCK,
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
