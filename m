Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A4B82C32
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 05:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-Id:MIME-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38uUKrNNMxojRBfvE4WW4dN7etI4c4DvVTf36LMahFE=; b=V4YM35gL+dDA5ephxGskKNAs3R
	CPCx94IBBkWPcnupMYom0CNWACxUTsODw8Aqma9M4BbVEdZMbPLLktNzYHjpwEHNVoLxirwQGYSgd
	E3ZT/0XDIzS7Da8ryeesZsMy9IQMhtemsTPTWmNzUV7fZFAu08y51gqp3sPCzPFbROJo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz5OG-0004Bs-FF;
	Thu, 18 Sep 2025 03:33:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull+jiucheng.xu.amlogic.com@kernel.org>)
 id 1uz5OE-0004Bl-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 03:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Subject:Date:From:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aq8uSFN/LDqP+lWUNot6+40l3t8oT+vcbAtJc7KgqFM=; b=EvOB07HoT2gNzZCN8S7R0AltNa
 y9YMpozZU5fFTOxYN40MowSIgQnpeLa4hh+i87JK0RrQcYavxuCEA5JLJx3riIAlZ/cPE+vJghEGa
 Ig2Ol5PQuHuAKb5snWwl6LETSyUsLi5o61lfnMZoNHSvfONSomNY0hci8xyS67c2iu6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aq8uSFN/LDqP+lWUNot6+40l3t8oT+vcbAtJc7KgqFM=; b=mxEeyXjzjXa2gS9nXnYD4sGw8t
 1UxSQ35DWXl/7Wz1efujMp/xinke++ottQO3SaKbSg9LXSR32oD3xbBcamYE5QrVJoZFYllxYmaoS
 7ZxYAxwl23TF0au7l9fizXh9HXoV+XTV7qGgtdH99KCunRcga6quGlChqs7FKpWoeRpQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz5OE-0002U5-8c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 03:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A4DE60010;
 Thu, 18 Sep 2025 03:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FC9BC4CEEB;
 Thu, 18 Sep 2025 03:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758166372;
 bh=G+ajCIiOtZPxJxQ7IluxlTc2+l1bJUWORu9oDo3Rh8Y=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=Yx/E+x59so/anGGuFDyTaVyPcFub3sZ9XwchY07VF5SsYHACj5LOrFtByv1/Ypqg1
 X8TrKQWSTQPS602SKNW9z1qClRMAGBputePFdXhSp6tRU9HqB/tjg3lIG8cfAh+Y/c
 YJ5NCw9/shAv7t83SS72QEbVPB3pG+lsrqcGMs/YyUsK6fntt6D3RkmzcC+wFWxdDG
 o4vOGJFUg8nkvVQPqeGGt3K8YQcs2YBLFCK/XKx6Ts3UH36j604RD7LK0Yfw5JJcUk
 G0XViqE9b/+pZdAlwgiPaa2fQbhDpOw3d2jfKOlwl12Yo/mNhZxoU6YtY+LsVgfj7D
 arvi2SQZG8wuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB00CAC5A7;
 Thu, 18 Sep 2025 03:32:52 +0000 (UTC)
Date: Thu, 18 Sep 2025 03:32:42 +0000
MIME-Version: 1.0
Message-Id: <20250918-origin-dev-v1-1-8d9877df9e77@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFl9y2gC/x3MQQqAIBBA0avIrBtQwaiuEi0sR5uNhoIE4t2Tl
 m/xf4NCmanAJhpkqlw4xQE1CbhuGwMhu2HQUhu5Kokpc+CIjiou1ng/n0TKaxjBk8nz+8/2o/c
 PLoFscVwAAAA=
X-Change-ID: 20250910-origin-dev-8a5ff6bee1f2
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758166370; l=1204;
 i=jiucheng.xu@amlogic.com; s=20250821; h=from:subject:message-id;
 bh=Cfox4dJD5Z2I7UJ/AEjRgz28jZFDDgARsCgPQjW/S2A=;
 b=Tt6i/YFFmrIxDb3zDxPDh8BLNgR4ijbjwG/tkeEdWisUTLHUlLWv8JzFkU0BNDud+e04A9d1f
 U6Q8769JzCRCiUr5cpMFT+GqDKx2k6WOhaq6ElusJ12hhH59FX8Uyn/
X-Developer-Key: i=jiucheng.xu@amlogic.com; a=ed25519;
 pk=Q18IjkdWCCuncSplyu+dYqIrm+n42glvoLFJTQqpb2o=
X-Endpoint-Received: by B4 Relay for jiucheng.xu@amlogic.com/20250821 with
 auth_id=498
X-Original-From: Jiucheng Xu <jiucheng.xu@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jiucheng Xu <jiucheng.xu@amlogic.com> On 32-bit
 architectures, 
 when GFP_NOFS is used, the file cache for write operations cannot be allocated
 from the highmem and CMA. Since mapping->gfp_mask is set to
 GFP_HIGHUSER_MOVABLE
 during inode allocation, using mapping_gfp_mask(mapping) as the GFP flag
 of getting file cache for writing is more efficient for 32-bit architect [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz5OE-0002U5-8c
Subject: [f2fs-dev] [PATCH] f2fs: Use mapping->gfp_mask to get file cache
 for writing
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
From: Jiucheng Xu via B4 Relay via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: jiucheng.xu@amlogic.com
Cc: Jiucheng Xu via B4 Relay <devnull+jiucheng.xu.amlogic.com@kernel.org>,
 tuan.zhang@amlogic.com, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jiucheng Xu <jiucheng.xu@amlogic.com>

On 32-bit architectures, when GFP_NOFS is used, the file cache for write
operations cannot be allocated from the highmem and CMA.

Since mapping->gfp_mask is set to GFP_HIGHUSER_MOVABLE during inode
allocation, using mapping_gfp_mask(mapping) as the GFP flag of getting file
cache for writing is more efficient for 32-bit architectures.

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3aaa332b7dbd4985ae7766551834f..9fbc41f9accb2626da22754f1a424da4805ca823 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3587,7 +3587,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Will wait that below with our IO control.
 	 */
 	folio = __filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT, GFP_NOFS);
+				FGP_LOCK | FGP_WRITE | FGP_CREAT,
+				mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;

---
base-commit: c872b6279cd26762339ff02513e2a3f16149a6f1
change-id: 20250910-origin-dev-8a5ff6bee1f2

Best regards,
-- 
Jiucheng Xu <jiucheng.xu@amlogic.com>




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
