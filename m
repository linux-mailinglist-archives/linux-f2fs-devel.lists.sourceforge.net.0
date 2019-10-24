Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B160E3D80
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 22:47:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNk0l-0000VA-Qi; Thu, 24 Oct 2019 20:47:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iNk0k-0000V1-7W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 20:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NFeOE+rLFk+Yp5PiLBN3oJPpICjLHV6n++qqL8qcqyc=; b=LzqOl7Y3mMMo+71AUyMjLz0OIK
 zrj8JsXr7c0/bA0y/xUzt9+jHxL3eGIhfgKzDCjch9xaa6mxIxwg3Vd+3XT4gPeEcck3+Vglyt2X6
 ia3uqieON6LVoW7pLCrmDyzJeZMdWT7fIyjg7wzwsKN+lPZQZ9kADIbW9zbt5Fm3VrnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NFeOE+rLFk+Yp5PiLBN3oJPpICjLHV6n++qqL8qcqyc=; b=A
 tU4VHEfUQ8d4yI+d1xMeQ/Qppg8qkrKExcCdpGZn8efa/Vm86IcFf98/EHqs7seKcJ+fNocth6TI3
 uhYEu3sQjkPnf5DEkVkjYbVeG+vKs4eBARL7cKx7l9Pz4wPgf9ZOhlG7sKzr35LEhJU6ILEawG8Eg
 Roaj62y7YWB4N008=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNk0i-002MHv-T5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 20:47:10 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B5CC20578;
 Thu, 24 Oct 2019 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571950018;
 bh=qG//jemOf0oV7yOFCo4p6dDb+1bp2vMf1ErKHQyQct0=;
 h=From:To:Cc:Subject:Date:From;
 b=BFsIDGH6/024dJ2xIIQ7ihyt6NIegUJ5bXhyScRWsj0UNXJZKfMNrB7tsv8pnQTWu
 uDl89+oVJLG33wo3AbKwcDK2LuGFuZb2LEPjjEQSQXPyhiEgJmKvedkODYJIsKglqx
 UiViBdydGTvrFYA50tJkpzYjndSIbYEOFwU98lzA=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 24 Oct 2019 13:45:29 -0700
Message-Id: <20191024204529.90714-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
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
X-Headers-End: 1iNk0i-002MHv-T5
Subject: [f2fs-dev] [PATCH] common/rc: skip encrypted direct I/O tests on
 f2fs
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Skip the O_DIRECT tests on f2fs when the test_dummy_encryption mount
option is given, for the same reason as given for ext4 in
commit 9b154b26e4a1 ("common/rc: ext4 doesn't support O_DIRECT with
encryption").

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/rc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/common/rc b/common/rc
index cfaabf10..7c94307a 100644
--- a/common/rc
+++ b/common/rc
@@ -2216,10 +2216,13 @@ _require_xfs_io_command()
 # check that kernel and filesystem support direct I/O
 _require_odirect()
 {
-	if [ $FSTYP = "ext4" ] ; then
+	if [ $FSTYP = "ext4" ] || [ $FSTYP = "f2fs" ] ; then
 		if echo "$MOUNT_OPTIONS" | grep -q "test_dummy_encryption"; then
-			_notrun "ext4 encryption doesn't support O_DIRECT"
-		elif echo "$MOUNT_OPTIONS" | grep -q "data=journal"; then
+			_notrun "$FSTYP encryption doesn't support O_DIRECT"
+		fi
+	fi
+	if [ $FSTYP = "ext4" ] ; then
+		if echo "$MOUNT_OPTIONS" | grep -q "data=journal"; then
 			_notrun "ext4 data journaling doesn't support O_DIRECT"
 		fi
 	fi
-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
