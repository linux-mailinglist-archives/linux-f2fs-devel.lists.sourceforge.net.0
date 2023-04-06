Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BED6D953C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 13:32:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkNqn-00029u-Ho;
	Thu, 06 Apr 2023 11:32:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1pkNqm-00029i-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 11:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XsHAHmzGaISYqBFoaAdDI6vQ3bt2rPTJK4l3IuY9l8=; b=iY3RIwEiJD/P2q2jPKapnARsv5
 desryOKF9jFYgK02f/DbFROkPLk7gZZGxwiIosiCa7N3GSq5Xz3koFgse4L4nJ8jYf0K6qgoRZgDO
 zvf/bqg43Ry0t+QUwlPT+lCCU641JD5gvABsAjtW4lC12B000RCh8RZkS/CP3MREvBz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1XsHAHmzGaISYqBFoaAdDI6vQ3bt2rPTJK4l3IuY9l8=; b=M
 sYA1Qv5PCZZn9CeE6nteZB2c5x/iMMNPX3uVsPMwaZuaXx+Gp/hejH1yEzyi5i9BpK2v6+s+sUUgw
 FA3QFhpxPzSoHKkds12hiKkTTAHCI/H/FcQkOcQ86lrmJ4iX9OnS27WwhnlLZEM5tSTH1+jsbtYR/
 tV/PhCtPUNy2s6NI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkNqm-0003J1-KW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 11:32:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4305B64671;
 Thu,  6 Apr 2023 11:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45BFC4339B;
 Thu,  6 Apr 2023 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680780734;
 bh=T7sPgeZWaMHUXeeot7fb5Pe61axswwSYZIpjGPzNdjc=;
 h=From:To:Cc:Subject:Date:From;
 b=ha1bPC/kiAzB1lDjpOAg43O3MHYvxDRYXWIcWuQgg86sl3UpZKVZ8ke7neomsH3Ml
 FmeYFgKQMr4C9WAjcHwUVB0Fji4hleRaE50ac5UBanBTsvACjOLlX84Yyuj4aBifo5
 CMVVseKD83nHFGpWv+NUzxuze9/q/7K4NG0OjQ2UWyq8EP3IqOb/cUkO5xufP9zj9B
 V4U3ekRkORnCVvWvp7K/2Jq+t1Int32WgzavXPM1vwE1alvsHrcxvXmE0GN6pyxDZY
 PNz4KwN6iYqtQABvURYDmbgcUf1eiG0AImUjKUiqKsR6kMcD5uGUEHOC/DqDDu7HEQ
 qYABnpR4+zWnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  6 Apr 2023 07:31:55 -0400
Message-Id: <20230406113211.648424-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Douglas Raillard <douglas.raillard@arm.com> [ Upstream
 commit 0b04d4c0542e8573a837b1d81b94209e48723b25 ] Fix the nid_t field so
 that its size is correctly reported in the text format embedded in trace.dat
 files. As it stands, it is reported as being of size 4: 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkNqm-0003J1-KW
Subject: [f2fs-dev] [PATCH AUTOSEL 6.1 01/17] f2fs: Fix
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
index e57f867191ef1..eb53e96b7a29c 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -505,7 +505,7 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
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
