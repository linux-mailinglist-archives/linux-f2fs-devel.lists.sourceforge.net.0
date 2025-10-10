Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3ABCC972
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Oct 2025 12:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-Id:MIME-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGbmHMIYMoJd5W1dDt/iPMA3Ez0PVG0RYHEIFPDUVfo=; b=hWC2UIDT6nuYn0neDQq+dEA4D1
	M3krJyafcdmreLIkSn/7jPuIqLRkbDfCi4zG+0oSZpHEMnsB4r2bO5UrcIZJpOTvk4RwOwpKUJBQy
	q6xk5Yi3aURkbrvQnNU9go7mFrx4rg2K2D9NbVpzUQ991NpPMa3gr4ik4ZHzAbrOIzjk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7Adk-0003Yf-3C;
	Fri, 10 Oct 2025 10:46:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull+jiucheng.xu.amlogic.com@kernel.org>)
 id 1v7Adj-0003YZ-7b for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 10:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Subject:Date:From:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kZpyK/Nwz7HVKJr8lfGtW5Lep1AG1J4MNqr+H5E9/z8=; b=X9EzUQ+Rk6M6M4FCe8Vtnr16Op
 cOS9wA/Taely8U/xU57fYf39SMSuP49fmBItCT50FeVyDAQFrjqGsDvGO23AqcjiUUEYLdA6SUyVT
 uz05phGeDc2xfGZaATlPLbrCQrTK6NA1WPXfRGAqPJYZSsxglztjMZZZq5zw10hj51KY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kZpyK/Nwz7HVKJr8lfGtW5Lep1AG1J4MNqr+H5E9/z8=; b=GStHrEo1P8WQhUDer9BtH447PV
 LQoFVP+/m5Gq8qDQwJvUbjq1ZRDOLltID2aXfVc0G/KKqtNspeVWNIQ6Hx2GZglp97cMhCJ83es93
 IP6XWAA3vpCexh1p3a/ueajDeN9/RdXVK6NCG85HcbAb0oW0C9f9lED54bTHa84sRq24=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7Adi-0007Yl-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 10:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C3674370C;
 Fri, 10 Oct 2025 10:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3420CC4CEF1;
 Fri, 10 Oct 2025 10:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760093172;
 bh=tu/3YXWndspnmW1FhqUQCHSgsgn+D8yeWmdhNr94be0=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=P1dbetcxC7JH6TiV0CYv7t7Hz7X+nYXsccRgu4vFt0+W3c/SYSaXQkSRBOOMiejgZ
 Qyl11SDtdEptqVsbFRxej1C2gAfgZKQ4mMw5MTpo6P21gFZd0N49xveVnRWfq1q7m6
 TndqzwPj137LadyPNN/cgLE3IChtjPaSEDZjPKrGF+On426L4Q3R4OuHa0l9cEL4E6
 vR/XrDF6ipbsH289YVitAlzsuJ6V9hq/VVeA2pLHW2PWEQMVhdqqEv6KGeZdiYVv2C
 B620MtLb5szFkSvbwvCMiqP+m8kLUhnlXbYvSa9D2QpIeKIB2JQsbeVdfkXvFbIehs
 3s3gDfVv/AYag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 212B3CCD185;
 Fri, 10 Oct 2025 10:46:12 +0000 (UTC)
Date: Fri, 10 Oct 2025 10:45:50 +0000
MIME-Version: 1.0
Message-Id: <20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAN3j6GgC/03MwQoCIRSF4VcZ7jpDhUlt1XvELEyvzoVmDA0pB
 t89Gwha/gfOt0HBTFjgPGyQsVKhtPaQhwHcbNeIjHxvkFyO3AjOUqZIK/NYmbZjCKcboggS+uG
 RMdBrx65T75nKM+X3blfxXX+M/meqYIJpb7RSPhhU6mKXe4rkji4tMLXWPrgQj7OmAAAA
X-Change-ID: 20250910-origin-dev-8a5ff6bee1f2
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760093171; l=1482;
 i=jiucheng.xu@amlogic.com; s=20250821; h=from:subject:message-id;
 bh=ys2NNWUvMRWSNrqqE75d/Agpj0X5GunxR0O5cIjS0+s=;
 b=zBpqK6IpjtdrVtovPKjZFXMscyFRS/aovVGopagjDr07kHZ2g+Rn8Bz2l8yn850QC/rwg1Z2W
 5EdQvlweuoxAm5ybl4mHETIzsjc2dHIS0i4oIw3YzP9HmnTx/8heVz7
X-Developer-Key: i=jiucheng.xu@amlogic.com; a=ed25519;
 pk=Q18IjkdWCCuncSplyu+dYqIrm+n42glvoLFJTQqpb2o=
X-Endpoint-Received: by B4 Relay for jiucheng.xu@amlogic.com/20250821 with
 auth_id=498
X-Original-From: Jiucheng Xu <jiucheng.xu@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7Adi-0007Yl-P4
Subject: [f2fs-dev] [PATCH v2] f2fs: Use mapping->gfp_mask to get file cache
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

Additionally, use FGP_NOFS to avoid potential deadlock issues caused by
GFP_FS in GFP_HIGHUSER_MOVABLE

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
Changes in v2:
- Add FGP_NOFS to keep original GFP_NOFS flag.
- Link to v1: https://lore.kernel.org/r/20250918-origin-dev-v1-1-8d9877df9e77@amlogic.com
---
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3aaa332b7dbd4985ae7766551834f..b449edb519d9069f58572685d607a2502e4c9473 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3587,7 +3587,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Will wait that below with our IO control.
 	 */
 	folio = __filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT, GFP_NOFS);
+				FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
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
