Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1676D9563
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 13:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkNrs-0006GV-S1;
	Thu, 06 Apr 2023 11:33:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1pkNrp-0006GN-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 11:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+TpZOHsz4uqQb8mOuNfwLWGiI4qCPGe/4uYxch+v4zw=; b=VzY87ey3nFEyHoR1E8kIngkBi4
 uYs0AhYJG/DKismbZsa1uByv3D+UbIqj4AiCkRVHy81qOXzplTsy64X8f4gCTfVQizsp4s0eLRBGF
 CgNm55fhXw6yyR3hOo1DkO8hUmCCbbwv5L2wEi6ZsyOksVuYRQ7hmEjLmcec/Stelcw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+TpZOHsz4uqQb8mOuNfwLWGiI4qCPGe/4uYxch+v4zw=; b=c
 7Td/yuM++hI4DKoNv+238thmCXEPW+qxQzS18Y5RmbOVJ2ya+xRBtVmzje53G40FhylKKzU3buIt7
 y2mqZy9rVJ6KP+F0tQbotoe00W3/drlHsAzIv7FfeskpKe21Tf1nsiTkcj5t7ZbpuuLWa9rlWVI8q
 PbFYeszFguab0NQM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkNro-0003MU-6q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 11:33:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB0864478;
 Thu,  6 Apr 2023 11:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B99C433D2;
 Thu,  6 Apr 2023 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680780798;
 bh=j3/iw94mKIuIrszdGI4ABTDK7tgs5kCINVzSTavDhAs=;
 h=From:To:Cc:Subject:Date:From;
 b=WNSd6aR+ezYQQVgm4Lz+/Bi2nkE7RxhOy4KJmeV4Af7Exdnp6+D2iqVshefIbpWPK
 nHUjgY79AyWiT4D8PhWw7vim5Z/9ybKGdT3ZUBwldXAESjDh/AhTYlrcNbZIzghjtV
 mH27sh8K3eNxDf/qPoYegY1NJrw9fXdU+GXaaxxcHMPuVnAD2AL98zB/yoTajSjJ4G
 2E8bPg49D7VRIPW2UGfdo3iVbN7eagTF2IrT2qZDeE1Cle0v3UomCKFaC6JA8t2rfp
 xvhuIQG5I8b6f2lhaxsotK3QCAq69KzmSmvHL2yucAJJmTAjJo5jFTK+4xljNA/VLe
 5areM3NU4fmPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  6 Apr 2023 07:33:07 -0400
Message-Id: <20230406113315.648777-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Douglas Raillard <douglas.raillard@arm.com> [ Upstream
 commit 0b04d4c0542e8573a837b1d81b94209e48723b25 ] Fix the nid_t field so
 that its size is correctly reported in the text format embedded in trace.dat
 files. As it stands, it is reported as being of size 4: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkNro-0003MU-6q
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 1/9] f2fs: Fix
 f2fs_truncate_partial_nodes ftrace event
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
Cc: Sasha Levin <sashal@kernel.org>, rostedt@goodmis.org,
 linux-f2fs-devel@lists.sourceforge.net, Mukesh Ojha <quic_mojha@quicinc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-trace-kernel@vger.kernel.org,
 Douglas Raillard <douglas.raillard@arm.com>, mhiramat@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Douglas Raillard <douglas.raillard@arm.com>

[ Upstream commit 0b04d4c0542e8573a837b1d81b94209e48723b25 ]

Fix the nid_t field so that its size is correctly reported in the text
format embedded in trace.dat files. As it stands, it is reported as
being of size 4:

        field:nid_t nid[3];     offset:24;      size:4; signed:0;

Instead of 12:

        field:nid_t nid[3];     offset:24;      size:12;        signed:0;

This also fixes the reported offset of subsequent fields so that they
match with the actual struct layout.

Signed-off-by: Douglas Raillard <douglas.raillard@arm.com>
Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/trace/events/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index df293bc7f03b8..e8cd19e91de11 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -513,7 +513,7 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
-		__field(nid_t,	nid[3])
+		__array(nid_t,	nid, 3)
 		__field(int,	depth)
 		__field(int,	err)
 	),
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
