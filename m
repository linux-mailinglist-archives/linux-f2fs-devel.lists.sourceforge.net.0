Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974160BEB4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 01:36:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on6zv-0001WA-Hh;
	Mon, 24 Oct 2022 23:36:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1on6zu-0001W3-G1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bKrObDZwtU/biK5Z2ervaty4fZpvJ8TS4JvElAK31E=; b=aQn3syH5+4t2qdhj0zM64HFjCj
 Y4BJkjxoimZqXwrhykZA/+NF3NNE7AGpI0iTJkot5q1XRs/TiwvGfPHEqw6UeKgrZcpD9eSM+XDnC
 Z8xiidkR6g7Coc6I4eYsEKs8YkBp+cXok2DOEqAHJWqs+uQQb7/HG00hXb22is4sM364=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5bKrObDZwtU/biK5Z2ervaty4fZpvJ8TS4JvElAK31E=; b=E
 MDxfU3M0RifXwJ6UTk+sfjefZfmlNr8YQ1vkIJt0bV+VVqZX/gRTBRhx8JOxBW2jqAJ8G+ezo+XyA
 Wol5PIJFVoe/W73F/NLWsSOnyDTGnQnILczIMFIII/RzbA18dKJ6lze0V4xWSyxL8SFkI/A4BEpUA
 t+pA+0aXdldK0FLg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on6zs-00GBiP-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:36:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D185C6153B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 23:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ACBC433B5;
 Mon, 24 Oct 2022 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666654596;
 bh=N+eoJ9Y4rEs3YSsl7usF2YxvUJ1yMmWw/73dM3wnX7g=;
 h=From:To:Cc:Subject:Date:From;
 b=QzcPBFUwqZHTnmwC4YE/ioV4IVP6l7urzv0ljg/nLA6j3ZgQE1YZyoqYoNfeHUPl6
 fk/aL5Pk09G+Pn6LOKQjq3LdKHYpymqTgU3jMTa1u6lXRD+U4FYH5nAdYAmOEml+UP
 UDcF0QEegpoEW+aoLdETjZsn0zfcNqI8ITdf6Ju4OplJSmrdXOHt3Q8iPHQIk7ayq8
 QxunYY73J1hnQXgmeFH1sFl6bTvGwuG1kYWk+Y0rK4FGr47O0L6Y8WUbUMfW7vP6gn
 Lc+heoSQJJCyveIVo77+zdxx6aU+rojIVzzi/L7xMcAcOTUoSgI2dxqqhlkZCCTian
 nC9R+i0jPNqSw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 24 Oct 2022 16:36:34 -0700
Message-Id: <20221024233634.803695-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The below commit disallows to set compression on empty
 created
 file which has a inline_data. Let's fix it. Fixes: 7165841d578e ("f2fs: fix
 to check inline_data during compressed inode conversion") Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c | 3 +++ 1 file changed,
 3 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on6zs-00GBiP-Kl
Subject: [f2fs-dev] [PATCH] f2fs: allow to set compression for inlined file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The below commit disallows to set compression on empty created file which
has a inline_data. Let's fix it.

Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1c4004c9245f..304fe08edc61 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1915,6 +1915,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			if (!f2fs_disable_compressed_file(inode))
 				return -EINVAL;
 		} else {
+			/* try to convert inline_data to support compression */
+			f2fs_convert_inline_inode(inode);
+
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
 			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
-- 
2.38.0.135.g90850a2211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
