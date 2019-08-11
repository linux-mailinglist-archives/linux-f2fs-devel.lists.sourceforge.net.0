Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0A89488
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwvWr-0001vC-Co; Sun, 11 Aug 2019 21:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hwvWp-0001uv-GJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRtfjN+8ynXfa5yziXSWR8Uf5EMcXATc3O/29llpZ6I=; b=PlpxX+Et6tyPyw5KndIy8Kde5j
 HMdnTHWISg+Y2E0+ZE1hKqNzACFCmONnyCM6tmwWowbazzlQ0qrSVCSWur7wBsGyn4KPIw5go9tNI
 BVwCuXg0ymrw+GMAyZgrKpnYldjscqEnvAyFp7lCWWRG6ofrqfPlMzxGsNBtT2WYuYyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cRtfjN+8ynXfa5yziXSWR8Uf5EMcXATc3O/29llpZ6I=; b=kLSAXnaV0GwjgsdHXqRo6DajxG
 6aKDI/yCYqrO8Tt/6CUm87Buo3g0ddBAe3z+4+6Bvf30HIp+ZYPsRXWuY+lYuVhRPHOVq7hjVp49w
 e9HGBzjafZDj1CCL+kr11rT7lYuwcrzg/BU81opFdCuw82f4fqivAI4OUldJAsST+qfo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwvWn-0022P7-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:27 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4C5E2173C;
 Sun, 11 Aug 2019 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565559433;
 bh=u8BxT9tQSHf5ZOVsehPoiYiYgC4+Zhfv2J2bExWNYqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q2oOqANPN/hXWIFA8+pGhszghBRjkfyAX2dae3QJMC1lP+6wiUBR5fv6sPW5uaCu1
 b4ZkAGpYnIZ0R4diwtbEmI2QGLtphv/ht7O+e9ZEL8DSbWX6+5gBzQFVT+olcR/VYs
 5Me/KYJFmTBNQWy0EYjfQLAEmouY1g4bmkI4wB2A=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 11 Aug 2019 14:35:57 -0700
Message-Id: <20190811213557.1970-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hwvWn-0022P7-Hc
Subject: [f2fs-dev] [PATCH 6/6] f2fs: use EFSCORRUPTED in
 f2fs_get_verity_descriptor()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

EFSCORRUPTED is now defined in f2fs.h, so use it instead of EUCLEAN.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/verity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 6bc3470d99d00..a401ef72bc821 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -210,7 +210,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
 	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
 		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
-		return -EUCLEAN; /* EFSCORRUPTED */
+		return -EFSCORRUPTED;
 	}
 	if (buf_size) {
 		if (size > buf_size)
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
