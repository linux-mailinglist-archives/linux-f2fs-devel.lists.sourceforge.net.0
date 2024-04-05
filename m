Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C8899C96
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 14:14:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsiSb-00080i-NB;
	Fri, 05 Apr 2024 12:14:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rsiSX-00080D-Ul
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ih2S6pyJj+FNOX2FaVqCPxiJGRm/mQyzBzMM/MkTjGU=; b=RaHLEwSL8oBDZyP2q4jlrJgWlP
 WrzrZI2Yig3zSK24q9fpGIwU2DLT4yoDfeJLOWDWcPPP0q5DkXTeF/6qEJAFNir7tsbmNriW3VkK/
 MoYKWqST4YcOmDEmbX8+LcTApegdTtgeGdTS9JtEGNqhraqSFLW/bKt4M34Th/ZfkJeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ih2S6pyJj+FNOX2FaVqCPxiJGRm/mQyzBzMM/MkTjGU=; b=PRR8gdse8rsQZ6V3v1bmCMagws
 PljRvr1rVM1G56ejj1oE9/8vFy7XOooeyQEhOVs5A1lgXkAzXrHczGZixEAEgTeh85zdECMEazxCT
 kX7UnrwbjYZVutqAkPXGB51cUthuGC44Wu9Z0/RjKqlUHWfhkZ8rsaJ99zrk1cQEUwYY=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsiSX-0004Xm-LA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 12:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712319248;
 bh=3qqbmy6OIcOoO07cO28FmCqjE206p+74Pkl9CCe0L8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TKDOJxOER7MirF21hVhlJQygRmK3/cJqX67xIv56OiHAy+8ouFLN8Y6MoZIeZQr5U
 gKEX2b9K15sZy9+GBZ5VAAd6GKpxvEtgt1iY8IO47IB2Gze+5MDekZvgpveB2GyG6x
 LNGantlVyvkzvkODN1PXwCuEDdlHax/3eCJLn5OT2wVHpWe16Af4a9/Pjgistv+my2
 L99lBBpVAW/4p4xOhSqzNSEuA9P9vS/m2fnRgFtI5a8OBNhBOQPz8DCeITHkwotFTs
 TUOc9wHNQNQY7H1FvAo3RaxedEuZxNziGZH5t4GHqnaZMGt2KjAK7ynt+aT8NiIv1O
 3evyYq2Hw6Q9w==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 289F53782134;
 Fri,  5 Apr 2024 12:14:07 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Fri,  5 Apr 2024 15:13:29 +0300
Message-Id: <20240405121332.689228-7-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405121332.689228-1-eugen.hristev@collabora.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com> If the
 volume is in strict mode, ext4_ci_compare can report a broken encoding name.
 This will not trigger on a bad lookup, which is caught earlier, only if the
 actual disk name is bad. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsiSX-0004Xm-LA
Subject: [f2fs-dev] [PATCH v16 6/9] ext4: Log error when lookup of encoded
 dentry fails
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz,
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

If the volume is in strict mode, ext4_ci_compare can report a broken
encoding name.  This will not trigger on a bad lookup, which is caught
earlier, only if the actual disk name is bad.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 2d0ee232fbe7..3268cf45d9db 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1477,6 +1477,9 @@ static bool ext4_match(struct inode *parent,
 			 * only case where it happens is on a disk
 			 * corruption or ENOMEM.
 			 */
+			if (ret == -EINVAL)
+				EXT4_ERROR_INODE(parent,
+					"Directory contains filename that is invalid UTF-8");
 			return false;
 		}
 		return ret;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
