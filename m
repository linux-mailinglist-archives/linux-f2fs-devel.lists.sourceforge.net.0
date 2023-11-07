Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F837E4CE8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 00:24:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0VQZ-0007jn-NU;
	Tue, 07 Nov 2023 23:24:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1r0VQX-0007jh-Lz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5GPYDrKrHOcV7RdC+Qp/RiFS+g83/O4GF200mHidIU=; b=L/MumkvZ1emDPsgMA31rDnN0JM
 E+LIQYevhr2tVGWZLhbDXo/1UVcOBDvruwighX8KATPvWIFdcrEF6xvOXQAHVOjP4EXfUxlTZrNeA
 6yEwANozfNyQt1CCmLykAOQIJRtEaHhWXVeEJZPX+1wdXiWxOTiEtlv3iVdL18urxiUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w5GPYDrKrHOcV7RdC+Qp/RiFS+g83/O4GF200mHidIU=; b=D3BRJAl0xmmc4x2LrHIpt/n7A9
 3YkxJcl1Vj05m8UIekr5N5NTvHrZzPMs4COq8L5A3AaHpTXJrkn0glvvik7oZ+a2uo8LEoN/CKLsV
 CwLl0cQIrFkln8/gBAlrhrk0FWJIZ1KNAjpXwcRAT8QhtAGzc+jkgPQa5PEMtYXa9SCE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0VQW-00CeoC-Vj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B5F3BB81A19;
 Tue,  7 Nov 2023 23:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF38C433CA;
 Tue,  7 Nov 2023 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699399442;
 bh=brWxIczyVCBvO4AyUa+zsOYOVfm9JnL6XsF7XTe1ClA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5DO18TLNY1f9uKYRAhQIwhdo1egF2sI4sBDn3C6fZH7Jk4hAd7D1nEpUbNrnLuGL
 4Hz4Pq6ImRAV4hwOIEb/3rJD0YjJLTZ2/Yc3FO0cFQy+I05vxL6BGPsA8eLmWucJJS
 vRbjPUnWj7Vfs4V2dJP4QTMX/vp+dxotPT4XLhQSz0Z6ob8Xd3UZMq4LuRA0QC9Lc3
 yXBAFjtJLt6BpAN9xzw5O7m1lpuIRScPfy787Dvf6A4brwDZOCEJdHxK0OU+SsNTi7
 Jut/5P+LnfO+Tzd8zwJr6Foz0u+f5Rx7QsI0CCLjf+GWXp4WLD4KK5ONsxgxtVjgSi
 W/PjjZH1A1IPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  7 Nov 2023 18:23:09 -0500
Message-ID: <20231107232330.3776001-14-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Zhiguo Niu <zhiguo.niu@unisoc.com> [ Upstream commit
 9b4c8dd99fe48721410741651d426015e03a4b7a ] Use f2fs_handle_error to record
 inconsistent node block error and return -EFSCORRUPTED instead of -EINVAL.
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0VQW-00CeoC-Vj
Subject: [f2fs-dev] [PATCH AUTOSEL 6.5 14/18] f2fs: fix error handling of
 __get_node_page
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

[ Upstream commit 9b4c8dd99fe48721410741651d426015e03a4b7a ]

Use f2fs_handle_error to record inconsistent node block error
and return -EFSCORRUPTED instead of -EINVAL.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 248764badcde8..ed963c56ac32a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1467,7 +1467,8 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(page));
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
-	err = -EINVAL;
+	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+	err = -EFSCORRUPTED;
 out_err:
 	ClearPageUptodate(page);
 out_put_err:
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
