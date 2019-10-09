Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DAD1D09
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2019 01:47:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iILg4-0001k1-VG; Wed, 09 Oct 2019 23:47:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iILg3-0001ju-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 23:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b5ei0sjsWWpPvzEzB2Sr96FHsR8pKkPM3BB8TKVmF0o=; b=H0T7JTL/Od9qv+wf+7jQAwdw1s
 Ry2PxyFbhVc6CrtEmSntRxAa7VLl2GzXsBlP+WKtBiLxilfLtwTISFpw3dqcztPbkroBLX6yC1BPN
 94kgxbbrkXGkQ9vqxHF3kPLxp1EFH2TY6T9maznimZQPD4o9f4HvlrrGqBTcflZJf93c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b5ei0sjsWWpPvzEzB2Sr96FHsR8pKkPM3BB8TKVmF0o=; b=K
 XkV5Ndn9kY9nDONQ7n4nZLcu83191OiYlkRzVBgUlqvobFjYr/zZedZ85Vd7QEeatuCRm43A8Yo46
 0QdF/SYp83ZORZ9nkgSh5rxVIkrNFsKU1Y29pqukwFF7GygNHNI7V2i+Ms0uklsofFOk5hWXjB39V
 3VLsgHX/JCUs2zgY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iILg2-004UpY-LK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 23:47:31 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEF4E206BB;
 Wed,  9 Oct 2019 23:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570664845;
 bh=wV/V6DhT0TzJjctQ/covpkwmj5QjFM961Z0/BTrFR5E=;
 h=From:To:Cc:Subject:Date:From;
 b=WhSjfjHstDaamJAnmujsDC4/nz0uLTeh8/TLveamefQGBgi/lSL8EuYxN/EIzVVr9
 tsZ8/Z3e6oCl6a3TRyLojo9Y0MDsX806iF2xqa92qd2JGISQny2e10513j4+2Yf5vx
 +VWo/A62AuNyuQnTzVxy5zEwYqggPzuCnZJ6HmXo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed,  9 Oct 2019 16:45:55 -0700
Message-Id: <20191009234555.226282-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
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
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iILg2-004UpY-LK
Subject: [f2fs-dev] [PATCH] docs: ioctl-number: document fscrypt ioctl
 numbers
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The 'f' ioctls with numbers 19-26 decimal are currently used for fscrypt
(a.k.a. ext4/f2fs/ubifs encryption), and up to 39 decimal is reserved
for future fscrypt use, as per the comment in fs/ext4/ext4.h.  So the
reserved range is 13-27 hex.

Document this in ioctl-number.rst.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ioctl/ioctl-number.rst b/Documentation/ioctl/ioctl-number.rst
index bef79cd4c6b4d..4ef86433bd677 100644
--- a/Documentation/ioctl/ioctl-number.rst
+++ b/Documentation/ioctl/ioctl-number.rst
@@ -233,6 +233,7 @@ Code  Seq#    Include File                                           Comments
 'f'   00-0F  fs/ext4/ext4.h                                          conflict!
 'f'   00-0F  linux/fs.h                                              conflict!
 'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
+'f'   13-27  linux/fscrypt.h
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
-- 
2.23.0.581.g78d2f28ef7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
