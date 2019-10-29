Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B28E9104
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 21:44:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPYLW-0002z7-My; Tue, 29 Oct 2019 20:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPYLV-0002yv-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTFWuz0Xf22B75B/I7+kiIiMH6pmcPiYXIEIit2eyxQ=; b=PvKBEZ/PFyvu+hxkF4vK7Y8PZY
 QxvD40bt1jHCpzrGz7eyCigo0S85/IukaI1gY7WVLl6AuM8rq9TlE3PF85TXz6KnCDQSKb99ETtNR
 i5e4krdOSAnfzKUKwO8duCBGPIHeETQzSJNHKTFQPcaXUhyupNlFWGTbnqsYjXwNPuc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTFWuz0Xf22B75B/I7+kiIiMH6pmcPiYXIEIit2eyxQ=; b=g7iq2S3zeHtR+YB+l3klGlLalN
 /kpKTddXpPvy7Zbg2m0Th6C8sZaIGmEMRC0CwC7WbREMGWrRZh2gCCcwyHUHcRyqQRH3+BZfRQiHf
 qbHpZdc9UfnJoJg3HsqPeX4tZtZE1kezJlFlUxPs7rHcCdyNRy6xg8ueGT2GVT+VtTWw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPYLT-009Lgj-3w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F32721835;
 Tue, 29 Oct 2019 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572381836;
 bh=p5iqeRBG0wAn8vG31RO8K0J2sdKd+zlwDuiiVCe/arU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fqLabC+4M1549VLoHu+fT+YMZrTGGCI6h26q23IVXUV+l623EaOFPGHWTbPJw6rZQ
 z6+Hb6lOhwnAuiq9iVMCCKczLZk3npUaZaH86ZnpoxrQvfeVOOuYLC9FnrJvJznCMQ
 fH9S1BHEqrrcJqKGPANaSpjGiCl63Sl7zkWvb3wE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 29 Oct 2019 13:41:41 -0700
Message-Id: <20191029204141.145309-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191029204141.145309-1-ebiggers@kernel.org>
References: <20191029204141.145309-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPYLT-009Lgj-3w
Subject: [f2fs-dev] [PATCH 4/4] docs: fs-verity: mention statx() support
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document that the statx() system call can now be used to check whether a
file is a verity file.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 42a0b6dd9e0b68..3355377a24398d 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -226,6 +226,14 @@ To do so, check for FS_VERITY_FL (0x00100000) in the returned flags.
 The verity flag is not settable via FS_IOC_SETFLAGS.  You must use
 FS_IOC_ENABLE_VERITY instead, since parameters must be provided.
 
+statx
+-----
+
+Since Linux v5.5, the statx() system call sets STATX_ATTR_VERITY if
+the file has fs-verity enabled.  This can perform better than
+FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
+opening the file, and opening verity files can be expensive.
+
 Accessing verity files
 ======================
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
