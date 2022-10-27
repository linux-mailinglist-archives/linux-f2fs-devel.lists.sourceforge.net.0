Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1CB60F3C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 11:34:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onzHc-0005NM-6k;
	Thu, 27 Oct 2022 09:34:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_mojha@quicinc.com>) id 1onzHb-0005NF-DK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 09:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X4HZsC2UHwmsaiEO54dlFpkcDdriC3RIpdAYueIPt+w=; b=hkOU+aEu+SQ045U6nZPQLNN1N+
 CW+ya/Ur+8qjIwIY7HWYtyNtyF9jvCIE7b40lWOKdGk0kAjQGQfRwz2H9RprW4Y1QdApMcs7YzEzK
 L/9kgCkle1TV1P2SIhHqRJpDKOAp55SukoMK9LxZhi1SMg/dmBKuGxtzbU4ha401WjF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X4HZsC2UHwmsaiEO54dlFpkcDdriC3RIpdAYueIPt+w=; b=nG1BnSXPNwr/WHqlPbq3SHZZdn
 BhSz2bHQdHp5j5y4QUdscukEiJi1nujWwktVwOBsPb04hzR7MJM+zh68tXF2J0CEkJAxxW9F2/C7h
 Hx4+c0UDIv2aYFU6l2S5eJuVziOAZE9s/eU+zHMAf3roOJoK0kyhdY/6NqH1sGVWm/FU=;
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps (TLS1.2:AES256-SHA:256)
 (Exim 4.95) id 1onzHZ-001hAe-Mt
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 09:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1666863277; x=1698399277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=X4HZsC2UHwmsaiEO54dlFpkcDdriC3RIpdAYueIPt+w=;
 b=axByz0WuwHWczxg/QuuHg9qx/lRkkNSr1nKQFi6tOt+zDPLovryDc9iV
 0DoI3+Y9dDKbh2Ufx2TzxoK4y6Y+CIc5exI10Ml9Q7b+gfHbnl9Peer9v
 PPfVjRMx4utdhvDSU5yh5yF6AanPzzzmJM5qucCOoQEH9sACQyi+PrXlK c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2022 02:20:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 02:20:01 -0700
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 27 Oct 2022 02:19:58 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <mhiramat@kernel.org>
Date: Thu, 27 Oct 2022 14:42:41 +0530
Message-ID: <1666861961-12924-2-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
References: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Data type of msg in f2fs_write_checkpoint trace should be
 const char * instead of char *. Signed-off-by: Mukesh Ojha
 <quic_mojha@quicinc.com>
 --- include/trace/events/f2fs.h | 2 +- 1 file changed, 1 insertion(+), 1
 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [199.106.114.38 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1onzHZ-001hAe-Mt
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix the msg data type
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
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, quic_pkondeti@quicinc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Data type of msg in f2fs_write_checkpoint trace should
be const char * instead of char *.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 include/trace/events/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index ff57e7f..7fbfce4 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1404,7 +1404,7 @@ TRACE_EVENT(f2fs_readpages,
 
 TRACE_EVENT(f2fs_write_checkpoint,
 
-	TP_PROTO(struct super_block *sb, int reason, char *msg),
+	TP_PROTO(struct super_block *sb, int reason, const char *msg),
 
 	TP_ARGS(sb, reason, msg),
 
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
