Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53901847602
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Feb 2024 18:23:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVxFe-0004xS-0f;
	Fri, 02 Feb 2024 17:22:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_jhugo@quicinc.com>) id 1rVxFb-0004xM-Mf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 17:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mfoB8ipfy0L6OloPCbkGz5gD4ZpAk/e1jBDItP4Z7sE=; b=Va+3M8XAKxkmd94ZUO5PTwUq6B
 kzUNrpvbtVgmdGxasHHLNI1lRaSU/0PhzibTdDHu+yo9AZjM3JghEpy0Zrs94wVmKJFQ55SxLiX/y
 WtDg4h2VPMacjU542kQSz9oEhQS92LyH/kZXFZNrUnyeU8h/7piS8MseoDn1HKGSZ2ms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mfoB8ipfy0L6OloPCbkGz5gD4ZpAk/e1jBDItP4Z7sE=; b=T
 4NP0M3pCGMHUs+kbvwRrweBFe8UwzoqnWVoxJ423KgAJkkdoRzkDZSGsYWApM6Myprmp5oUJwTn5a
 PyOyOYNqcQoVs5pbT2qo76mQ1Ek/V0VhD7kqhz6nzW79AUt/i5im901nK+dt+KsmzBZ8e8aoLy2o+
 m6CSVGI//RoroMMw=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVxFZ-00011u-QC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 17:22:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412DjtRg015707; Fri, 2 Feb 2024 16:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=mfoB8ip
 fy0L6OloPCbkGz5gD4ZpAk/e1jBDItP4Z7sE=; b=MUTu1QGJqk3zZdN8AIVKUtE
 mFcQWxkLVJFTvhDfzpIzuV0U/Z7WaRwJ4HLOwDIto12izImUD/X9LEYrcblH2mhA
 STql53jX9YK9R3VJ6s+KGrBTlxL373f/LFCzCTwP5DzLkk3xf8m+TQHzjr9Sal6s
 Kye2eU8cdsPZvBhbk3IQpc3M5/OhjHapoKBDmtl+X8Mm5jHf4msWO0Ui1FXivxGS
 qKCiGY0s+y/EfEWYZv5Kr/vhZ+1/DHzZvbdU++32+AGqCy0shsXRK6Zp6wjla2Rz
 fpsQFp39SRqjffq7oaiN6W5DM3qEsshMVFZ36ybL3PcPYmOuuo+jdjwOhtRxShg=
 =
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwjhws5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 16:52:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412GqNLP014387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 16:52:23 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 08:52:22 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <quic_stummala@quicinc.com>,
 <quic_bjorande@quicinc.com>
Date: Fri, 2 Feb 2024 09:52:08 -0700
Message-ID: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6-HTTPrKvZyBZbc5_9FVnicmaTolsfVZ
X-Proofpoint-ORIG-GUID: 6-HTTPrKvZyBZbc5_9FVnicmaTolsfVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 phishscore=0 mlxlogscore=452
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020121
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The servers for the @codeaurora domain are long retired and
 any messages addressed there will bounce. Sahitya Tummala has a .mailmap
 entry to an updated address, but the documentation files still list [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVxFZ-00011u-QC
Subject: [f2fs-dev] [PATCH] f2fs: doc: Fix bouncing email address for
 Sahitya Tummala
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The servers for the @codeaurora domain are long retired and any messages
addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
updated address, but the documentation files still list @codeaurora
which might be a problem for anyone reading the documentation directly.
Update the documentation files to match the .mailmap update.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 48c135e24eb5..22d070c0de40 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -205,7 +205,7 @@ Description:	Controls the idle timing of system, if there is no FS operation
 What:		/sys/fs/f2fs/<disk>/discard_idle_interval
 Date:		September 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Contact:	"Sahitya Tummala" <stummala@codeaurora.org>
+Contact:	"Sahitya Tummala" <quic_stummala@quicinc.com>
 Description:	Controls the idle timing of discard thread given
 		this time interval.
 		Default is 5 secs.
@@ -213,7 +213,7 @@ Description:	Controls the idle timing of discard thread given
 What:		/sys/fs/f2fs/<disk>/gc_idle_interval
 Date:		September 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
-Contact:	"Sahitya Tummala" <stummala@codeaurora.org>
+Contact:	"Sahitya Tummala" <quic_stummala@quicinc.com>
 Description:    Controls the idle timing for gc path. Set to 5 seconds by default.
 
 What:		/sys/fs/f2fs/<disk>/iostat_enable
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
