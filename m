Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7405B7DAF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 01:59:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYFo8-0003SP-LL;
	Tue, 13 Sep 2022 23:59:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@collabora.com>) id 1oYFo7-0003Rw-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6F0xwcHL6L4gNVraO/E7NM6Cpq7lMKxqn0Ymd0DHVBY=; b=dR3cHrL/78XD+sfmoxdirJmbWA
 YnVF+59Z27poPHhIxxccg4hQz1QeXjc7DPfpeIzI8eSZ5RNP5xvPo3Cto0W4uOcOLMVez48F18Tcg
 LpPcMgcVByh9GBICxsiQioy+kC7kGkyal6ZT+sXRFhD8webeTgDlLgdEr75M5dseJyGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6F0xwcHL6L4gNVraO/E7NM6Cpq7lMKxqn0Ymd0DHVBY=; b=RQWCSU8Wi6tldWs+ZdG1yg2dME
 NLW8GumhKBJvW6AekhQQgP2MhSa2xw+zu0XgWWNZOnj49rCTtxRCkBfI59Pnom7qSp2S3cW2NG8DN
 0eM6id5xqxk8RstwW0fqWQYd2MOcAJzKGGK54PM8aK2Dyq3Uj643gw4ALOxenq+Y4kp4=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYFoI-007NNu-4h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:59:22 +0000
Received: from localhost (modemcable141.102-20-96.mc.videotron.ca
 [96.20.102.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: krisman)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3046E6602024;
 Wed, 14 Sep 2022 00:42:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663112543;
 bh=gGSyEUDYeLCnC3+4gmoON9rz46oKzm7qQXXp3d6fhOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g40DmvHnSB/vv232nUN/wN2D4qLR3XHL8VLmDg17kXRG48tO0F4PmSZLU08cUCjIb
 u6qBIRiJqZsjn67sLC7Yne808Q5tl5w0gmt95duZM9v6QNXr7emsdh78lkrpviJ+cC
 LDwDSXRQgEZyexetcjY2puq71Sz+8LrCjp+BuCW9a2xhR87FAGjfWe8zgicPIecpyt
 QE08gwqdi+bVDFjmq028/4j65bFoOo6fjToWvP4j4YIAgEaEKGPyFEb02YQ4FhJEAF
 Mnas0AZb7iY7f0Iubka1SF7hqbwaSWlOUgw4Go5Kg5ZBCEmw9/xnOk40H1Gn0AtdM/
 QdiiMPYgb192g==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Tue, 13 Sep 2022 19:41:48 -0400
Message-Id: <20220913234150.513075-7-krisman@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913234150.513075-1-krisman@collabora.com>
References: <20220913234150.513075-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the volume is in strict mode, ext4_ci_compare can report
 a broken encoding name. This will not trigger on a bad lookup, which is caught
 earlier,
 only if the actual disk name is bad. Reviewed-by: Eric Biggers
 <ebiggers@google.com>
 Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oYFoI-007NNu-4h
Subject: [f2fs-dev] [PATCH v9 6/8] ext4: Log error when lookup of encoded
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
Cc: linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 kernel@collabora.com, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the volume is in strict mode, ext4_ci_compare can report a broken
encoding name.  This will not trigger on a bad lookup, which is caught
earlier, only if the actual disk name is bad.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---

changes since v4:
  - Reword error message (Eric)

Changes since v1:
  - reword error message "file in directory" -> "filename" (Eric)
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 9c892c58abf2..959346950b3c 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1452,6 +1452,9 @@ static bool ext4_match(struct inode *parent,
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
2.37.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
