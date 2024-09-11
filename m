Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF93974864
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 04:57:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soDYK-0004f5-74;
	Wed, 11 Sep 2024 02:57:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liuderong@oppo.com>) id 1soDYI-0004ez-UB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q9oclsWyfE1RckQagOejlQqJpLIxCW1Wl2J22LW9tQA=; b=d+eGJjkcqPIhgtMIqbD9o8ZD0I
 BJQK5ziWWg8BiulmbvpjW06AoTHKnmwj2iX+OxQUXGYvlBruWHXM9FPwbsIzHNlLStkrB6+M3h57A
 Sa68flxtb9MPeeTi7Wjjc7mLEI3QBDIXzE8gkfgKZhnef4QrVfU4AJpm1H+itmqfG9/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q9oclsWyfE1RckQagOejlQqJpLIxCW1Wl2J22LW9tQA=; b=X
 cMbRkM07gXIgoiX236wHrgssCpiPmU0E2qxa15Jk9gSTzVdFl9kdr7GhHh8iGZVakbVwYLFogQHAJ
 W/lZZdJhD9BYe69jCqBSdxZy4R7k7ruJGW2eVLDcw8sHyFiiLAh9fj7aRTT+JGazn33eND710aEKH
 CNXvpb9/SSJROH+M=;
Received: from mail-sgaapc01on2045.outbound.protection.outlook.com
 ([40.107.215.45] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soDYH-0006mF-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTEiSCvSeGuyknEF1qi4gDkqp6gEBnRa1FcTPOKLXj/xe8+hkIxcFc10BZt0UHg0iVn/rpc/mBH2HCFKPgbNrNfWP4BJJz1ffNH7F/kjhg3IIktptbsuCbi4tDqKJRh/PZwkqvP/K+54G11uUo5A+EORagaI5WIFGDDU5HMaYgR2htfNLhwPdyillbEVozQSDtff4B8BK1+JwiNNAuXZZLLSbqmudobPIKHquAtjV3+phJb1RQg5WBgQyW4JRx14j5EwH+uFF4X6nfWS/pEdmd8hqWoB8yICfCfhw0aF3D+1COZj1GOUf7XbUfb5A+aZC/M9C3EV8dXLkOAVzGs9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9oclsWyfE1RckQagOejlQqJpLIxCW1Wl2J22LW9tQA=;
 b=nqCtz/ggfMHCVhXyzM0W5hsbD0NokMzjGfYWFYTodC3oqMA8ywxw01awwQOxLE4UVQRf/sxjnw/kYsiIB1DlsDa2yv0WNrTBNhJjw7cEr8DhG9khfNQjh6UhhLnu2ofCoN3i28pug+X5Gcym7o69OO2Ypo9pdebpG6JdI5NZpPyLKB1vjw+J5VTLAugtazid4iumPIRNnJ3drOMAne6eM313C25SvDtG+CzHlRz+lhcdAxpRokkTLRhAANbspcaIyTlL339fsLCh9HUU/pscws+HIFbGz0QT7dOb+5+S5da6SuDqiVbIbTheTjoKyezx4vr0ZIZbapVndWx60KNY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9oclsWyfE1RckQagOejlQqJpLIxCW1Wl2J22LW9tQA=;
 b=Ty0RCFD1AJhWTIVA5PRYZlQCmaB7E1TkiibaBs11x4ds/wkirIXgInwi+7SKekOTdyur7J4RlS1YdKltZCh5jB/Tye8/Qf4kqwrHzum2G0BiiHwG7r9sopwlY7noznHKzDW0lcUg2PvOo2NDhLyUB3MlOgaLOzn8XGN+wIFr8Ac=
Received: from PUZP153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::18)
 by SEYPR02MB7518.apcprd02.prod.outlook.com (2603:1096:101:1d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 02:41:33 +0000
Received: from HK2PEPF00006FB5.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::8) by PUZP153CA0016.outlook.office365.com
 (2603:1096:301:c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.6 via Frontend
 Transport; Wed, 11 Sep 2024 02:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK2PEPF00006FB5.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 02:41:32 +0000
Received: from cndgdcavdu0c-218-29.172.16.40.114 (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 10:41:16 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 11 Sep 2024 10:40:19 +0800
Message-ID: <1726022421-58677-1-git-send-email-liuderong@oppo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB5:EE_|SEYPR02MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: eef89567-f0b8-4e14-b92a-08dcd20b3f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QBT8x2oBUUo2omxmVn8559Z4K0/9jUvrQhAwjVXy74AZMO8ilYLDC+/O+k4d?=
 =?us-ascii?Q?ar20jvLgjcoVz75awbp/czobNMOsdecTRxKjkQr4wXTqeP7kTZoVWHQy1Cez?=
 =?us-ascii?Q?QVwe/TRl60zKr6m0UMKzzPGyYRyb6WdZJbPf7YPhePtxFNcrq0hGoG8SUFT5?=
 =?us-ascii?Q?4/8f8SXCLrIpwMQfaU7IdPRL7irz0CI3w+Dk5Q4X0EfXzRek+FJOeoj0+cuh?=
 =?us-ascii?Q?CHs3pec/ZkTz6lb9QDqcebjDdKu2ZSeG4tk/X54RThA/waHIi5wpn9uiVUNf?=
 =?us-ascii?Q?RrIx3lkeJcar/B5yF+hNiIirLTrFGo82yExwOAcqAJcMTJvkQLl76VmscfC0?=
 =?us-ascii?Q?MHfCMmJNs0lHQjikwMDIIi0T3Kyaba4japCEbw6A4pd/e3Iu+li2ZrDca8AW?=
 =?us-ascii?Q?5qcBkW8DJClPNU/b4OWKdDwh3RLNcNaCzn85YZRUm/seH8icqaWOj6IfR6gl?=
 =?us-ascii?Q?0nF/ns1+VGlL2D5quRBr3yTbI0qYT5QfvY8lX39LPXyEQQHL60/1oNsZCQsv?=
 =?us-ascii?Q?dHCRPgMfkaFwy++JbrrJZlETPPya7KsEU/BQgRW6lWmertP9h7E0P2sJk1aR?=
 =?us-ascii?Q?XKcB+3dD0H6ABUB+s9pMPSK7kK/wP2z9Xqr3yyWKIaQorB7G6615ZFdyylfI?=
 =?us-ascii?Q?DSaGM4mUXT3crPoOgZOQSWEefbkGWEXKDAHkj+EUj3GQHjLsr/l3qt9Y5I5+?=
 =?us-ascii?Q?IO5j3UvHkLGKKfBU6E2PRMJpD2pg+GOQiEHAn3Apk6og9vjlcc37Zf9uHp6m?=
 =?us-ascii?Q?eOYJJ/FoJ+ycGnXc2eku7bU5dPX/5IlwlW/+O+IgIHCJcGapye0KzY7OUtBd?=
 =?us-ascii?Q?DBmKaLdx56wdAkJ6St7Ga7PNPkCYV5dAaGtfw85QcqevCDfEp8wC7YvOyGgZ?=
 =?us-ascii?Q?98zV2KKBSQUL7zo86hoqjqsE29vszDsjwqOB0KBieJUyYGSpWdMDhNysUz/Q?=
 =?us-ascii?Q?OVquJWgMPv5VGdJm5qsS1Zhr2FLaHN5dkRW/YmkGB3Z8Gzjgf2VdcbHzwUWt?=
 =?us-ascii?Q?QQCHOkrwm9JFYPNz4qPd/d/0ueRBWygHDwVdaHwgf/IUy4JzvJhtLyn34aSq?=
 =?us-ascii?Q?UCW6hV5v1CBUZixHXYqM6c/XhljmSSJtoyK3F5dc0euRS2wHd5c5/YhuU5tt?=
 =?us-ascii?Q?aRSRSXw8Gwumzk19fWRQg86GnunFpM9vswsg3QxeLylDpBj3sldKAGWH2Ykp?=
 =?us-ascii?Q?sN0Y193kneOsJfEg6TpU1a1HdgpUz8DQQG6Z1OXQ5pgq2J5UjKBp/8f8RYxP?=
 =?us-ascii?Q?8AgJatAfsfZ4xdOLQejbmLxWkfrrTqxBuyU/G6Yrq3ZahdgeEGsIOwos6W8y?=
 =?us-ascii?Q?wfef2B0pdC2RnICIfup11zyLWED0OEtHlnwVbzMqqpAE+qajlPHaPDwdq68u?=
 =?us-ascii?Q?B3M34dYHUXPFG+BJSHG+K1qC8et19RsoTzGNCPtcE0+ej95vrQ4kVkKuFIax?=
 =?us-ascii?Q?ij7jBzeefTjS3+6+A30oYhEyds9ss+/e?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:41:32.9005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef89567-f0b8-4e14-b92a-08dcd20b3f72
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7518
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liuderong <liuderong@oppo.com> In cost-benefit GC
 algorithm, 
 mtime will affect the selection of victim segment.For a large section, mtime
 should be the mean value of valid segments, in order to select correct victim
 segment, it nee [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1soDYH-0006mF-Qx
Subject: [f2fs-dev] [PATCH v1 0/2] f2fs: modify the calculation method of
 mtime
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
From: liuderong--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: liuderong@oppo.com
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogbGl1ZGVyb25nIDxsaXVkZXJvbmdAb3Bwby5jb20+CgpJbiBjb3N0LWJlbmVmaXQgR0Mg
YWxnb3JpdGhtLCBtdGltZSB3aWxsIGFmZmVjdAp0aGUgc2VsZWN0aW9uIG9mIHZpY3RpbSBzZWdt
ZW50LkZvciBhIGxhcmdlIHNlY3Rpb24sCm10aW1lIHNob3VsZCBiZSB0aGUgbWVhbiB2YWx1ZSBv
ZiB2YWxpZCBzZWdtZW50cywKaW4gb3JkZXIgdG8gc2VsZWN0IGNvcnJlY3QgdmljdGltIHNlZ21l
bnQsCml0IG5lZWRzIHRvIG1vZGlmeSB0aGUgY2FsY3VsYXRpb24gbWV0aG9kIG9mIG10aW1lLgoK
bGl1ZGVyb25nICgyKToKICBmMmZzOiByZW1vdmUgdW51c2VkIHBhcmFtZXRlcnMKICBmMmZzOiBp
bnRyb2R1Y2UgZ2V0X3NlY3Rpb25fbXRpbWUKCiBmcy9mMmZzL2YyZnMuaCAgICB8ICA1ICsrKy0t
CiBmcy9mMmZzL2djLmMgICAgICB8IDIxICsrKysrLS0tLS0tLS0tLS0tLS0tLQogZnMvZjJmcy9z
ZWdtZW50LmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tCiBmcy9mMmZzL3NlZ21lbnQuaCB8ICA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT1BQTwoKwrHCvsK1w6fDl8OTw5PDisK8w77CvMKww4bDpMK4
wr3CvMO+wrrCrMOTw5BPUFBPwrnCq8OLwr7CtcOEwrHCo8ODw5zDkMOFw4/CosKjwqzCvcO2w4/D
nsOTw5rDk8OKwrzDvsOWwrjDg8O3wrXDhMOKw5XCvMO+w4jDi8KjwqjCsMO8wrrCrMK4w7bDiMOL
wrzCsMOIwrrDl8OpwqPCqcOKwrnDk8ODwqHCo8K9w7vDlsK5w4jDjsK6w47DiMOLw5TDmsOOwrTC
vsKtw4rDmsOIwqjCtcOEw4fDqcK/w7bDj8OCw5LDlMOIw47CusOOw5DDjsOKwr3DisK5w5PDg8Kh
wqPDiMOnwrnDu8OEw7rCtMOtw4rDlcOBw4vCscK+w5PDisK8w77Co8Ksw4fDkMOOw7DCtMKrwrLC
pcKhwqLCt8OWwrfCosKhwqLCuMK0w5bDhsKhwqLDk8Khw4vCosK7w7LDisK5w5PDg8Kxwr7Dk8OK
wrzDvsOWwq7DiMOOwrrDjsKywr/Ct8OWwrvDssOGw6TDi8O5w5TDmMOWwq7DiMOOwrrDjsOEw5rD
iMOdwqPCrMKywqLDh8Orw4HCosK8wrTDksOUwrXDp8OXw5PDk8OKwrzDvsONwqjDlsKqwrfCosK8
w77DiMOLwrLCosOJwr7Cs8O9wrHCvsOTw4rCvMO+wrzCsMOGw6TCuMK9wrzDvsKhwqMKw43DuMOC
w6fDjcKow5HCtsK5w4zDk8OQw4jCscOPw53Cv8OJw4TDnMK1wrzDlsOCw5PDisK8w77CscK7wr3D
mMOBw7TCocKiw5DDnsK4w4TCocKiwrbCqsOKwqfCocKiw4bDhsK7wrXCu8OywrDDvMK6wqzCvMOG
w4vDo8K7w7rCssKhwrbCvsK1w4jCssK7wrDCssOIwqvDh8Opwr/DtsKjwqxPUFBPwrbDlMK0w4vD
gMOgwrTDrcOOw7PCu8Oyw5LDhcOCwqnCtsO4w5LDvcOWw4LDlsKuw4jDjsK6w47Di8Oww4rCp8K4
w4XCssK7wrPDkMK1wqPDlMOww4jDjsKywqLCscKjw4HDtMOTw6vCscK+w5PDisK8w77Dj8OgwrnD
mMOWwq7DksK7w4fDkMOIwqjDgMO7wqHCowrCs8O9wrfDh8ODw7fDiMK3w4vCtcODw7fCo8KswrHC
vsOTw4rCvMO+wrzCsMOGw6TCuMK9wrzDvsOOw57DksOiw5fDt8OOwqrDlMOaw4jDjsK6w47CucO6
wrzDksK7w7LCtcOYw4fDuMOWwq7DksKqw5TCvMKhwqLDlcOQw4DCv8K7w7LCs8OQw4XCtcKjwqzD
ksOgw47DnsOSw6LDl8O3w47CqsOIw47CusOOwr3Cu8OSw5fCu8OywrrDj8ONwqzDlsKuw5XDvcOK
wr3DiMK3w4jDj8KhwqMgwrfCosK8w77DiMOLwqHCosOGw6TDi8O5w4rDtMK7w7rCucK5wrvDssOL
w7nDisO0wrvDusK5wrnDlsKuwrnDmMOBwqrCu8O6wrnCucK7w7LDiMOOwrrDjsOJw4/DisO2wrvD
usK5wrnDlsKuwrnDicK2wqvCocKiwrbCrcOKw4LCocKiwrjDn8K8wrbCucOcw4DDrcOIw4vDlMKx
wqHCosOUwrHCucKkwrvDssOGw6TDi8O7w4jDjsK6w47DiMOLwqPCqMOSw5TDj8OCwrPDhsKhwrDC
t8KiwrzDvsOIw4vCocKxwrvDssKhwrBPUFBPwqHCscKjwqnCssK7w5LDssKxwr7Dk8OKwrzDvsOW
wq7DjsOzw4vDjcK2w7jCt8OFw4bDusOGw6TDi8O5w4/DrcOWwq7DiMOOwrrDjsOIwqjDgMO7wqPC
rMOSw6DCssK7wrbDlMOSw7LCucOKw5LDosK7w7LCucO9w4rCp8OKwrnDk8ODwrjDg8K1w4jDkMOF
w4/CosK2w7jDksO9wrfCosK7w7LCv8OJw4TDnMOSw73Ct8KiwrXDhMOLw7DDisKnwrPDkMK1wqPD
iMOOwrrDjsOUw7DDiMOOwqHCowrDjsOEwrvCr8Kyw67DksOsw4XDu8OCwrbCo8K6w5LDssOIwqvD
h8Oyw47DhMK7wq/CssOuw5LDrMOTwrDDj8OswqPCrMK1wqXCtMK/w5LDlFlFU1xPS8K7w7LDhsOk
w4vDu8K8w7LCtcKlwrTDisK7w6PCtcOEwrvDmMK4wrTCssKiwrLCu8K5wrnCs8OJwrfCosK8w77D
iMOLwrbDlMOIw47CusOOwr3Cu8OSw5fCu8OywrrDj8ONwqzDlsKuw5XDvcOKwr3DiMK3w4jDj8K7
w7LCvcOTw4rDnMKjwqzDh8Orw5PDq8K3wqLCvMO+w4jDi8OUw5nCtMOOw4jCt8OIw4/DksOUwrvD
scK1w4PDg8O3w4jCt8OKw6nDg8Omw5LDosK8w7vCocKjwrfCosK8w77DiMOLwrLCu8K2w5TDiMOO
wrrDjsOKw5zDjsOEwrvCr8Kyw67DksOsw5PCsMOPw6zCtsO4wrXCvMOWw4LCucOKw5LDosK7w7LC
tMOtw47Ds8OKwrnDk8ODwrjDg8K1w4jDkMOFw4/CosOLw7nDlMOswrPDicK1w4TDiMOOwrrDjsOW
wrHCvcOTwrvDssK8w6TCvcOTw4vDsMK6wqbCs8OQwrXCo8OUw7DDiMOOwqHCowpUaGlzIGUtbWFp
bCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZy
b20gT1BQTywgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkg
d2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQg
dG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1p
bmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVh
c2UgZG8gbm90IHJlYWQsIGNvcHksIGRpc3RyaWJ1dGUsIG9yIHVzZSB0aGlzIGluZm9ybWF0aW9u
LiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIHRyYW5zbWlzc2lvbiBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGJ5IHJlcGx5IGUtbWFpbCBhbmQgdGhlbiBk
ZWxldGUgdGhpcyBtZXNzYWdlLgpFbGVjdHJvbmljIGNvbW11bmljYXRpb25zIG1heSBjb250YWlu
IGNvbXB1dGVyIHZpcnVzZXMgb3Igb3RoZXIgZGVmZWN0cyBpbmhlcmVudGx5LCBtYXkgbm90IGJl
IGFjY3VyYXRlbHkgYW5kL29yIHRpbWVseSB0cmFuc21pdHRlZCB0byBvdGhlciBzeXN0ZW1zLCBv
ciBtYXkgYmUgaW50ZXJjZXB0ZWQsIG1vZGlmaWVkICxkZWxheWVkLCBkZWxldGVkIG9yIGludGVy
ZmVyZWQuIE9QUE8gc2hhbGwgbm90IGJlIGxpYWJsZSBmb3IgYW55IGRhbWFnZXMgdGhhdCBhcmlz
ZSBvciBtYXkgYXJpc2UgZnJvbSBzdWNoIG1hdHRlciBhbmQgcmVzZXJ2ZXMgYWxsIHJpZ2h0cyBp
biBjb25uZWN0aW9uIHdpdGggdGhlIGVtYWlsLgpVbmxlc3MgZXhwcmVzc2x5IHN0YXRlZCwgdGhp
cyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBhcmUgcHJvdmlkZWQgd2l0aG91dCBhbnkgd2Fy
cmFudHksIGFjY2VwdGFuY2Ugb3IgcHJvbWlzZSBvZiBhbnkga2luZCBpbiBhbnkgY291bnRyeSBv
ciByZWdpb24sIG5vciBjb25zdGl0dXRlIGEgZm9ybWFsIGNvbmZpcm1hdGlvbiBvciBhY2NlcHRh
bmNlIG9mIGFueSB0cmFuc2FjdGlvbiBvciBjb250cmFjdC4gVGhlIHNlbmRlciwgdG9nZXRoZXIg
d2l0aCBpdHMgYWZmaWxpYXRlcyBvciBhbnkgc2hhcmVob2xkZXIsIGRpcmVjdG9yLCBvZmZpY2Vy
LCBlbXBsb3llZSBvciBhbnkgb3RoZXIgcGVyc29uIG9mIGFueSBzdWNoIGluc3RpdHV0aW9uICho
ZXJlaW5hZnRlciByZWZlcnJlZCB0byBhcyAic2VuZGVyIiBvciAiT1BQTyIpIGRvZXMgbm90IHdh
aXZlIGFueSByaWdodHMgYW5kIHNoYWxsIG5vdCBiZSBsaWFibGUgZm9yIGFueSBkYW1hZ2VzIHRo
YXQgYXJpc2Ugb3IgbWF5IGFyaXNlIGZyb20gdGhlIGludGVudGlvbmFsIG9yIG5lZ2xpZ2VudCB1
c2Ugb2Ygc3VjaCBpbmZvcm1hdGlvbi4KQ3VsdHVyYWwgRGlmZmVyZW5jZXMgRGlzY2xvc3VyZTog
RHVlIHRvIGdsb2JhbCBjdWx0dXJhbCBkaWZmZXJlbmNlcywgYW55IHJlcGx5IHdpdGggb25seSBZ
RVNcT0sgb3Igb3RoZXIgc2ltcGxlIHdvcmRzIGRvZXMgbm90IGNvbnN0aXR1dGUgYW55IGNvbmZp
cm1hdGlvbiBvciBhY2NlcHRhbmNlIG9mIGFueSB0cmFuc2FjdGlvbiBvciBjb250cmFjdCwgcGxl
YXNlIGNvbmZpcm0gd2l0aCB0aGUgc2VuZGVyIGFnYWluIHRvIGVuc3VyZSBjbGVhciBvcGluaW9u
IGluIHdyaXR0ZW4gZm9ybS4gVGhlIHNlbmRlciBzaGFsbCBub3QgYmUgcmVzcG9uc2libGUgZm9y
IGFueSBkaXJlY3Qgb3IgaW5kaXJlY3QgZGFtYWdlcyByZXN1bHRpbmcgZnJvbSB0aGUgaW50ZW50
aW9uYWwgb3IgbWlzdXNlIG9mIHN1Y2ggaW5mb3JtYXRpb24uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9QUE8KCuacrOeUteWtkOmCruS7tuWPiuWFtumZhOS7tuWQq+aciU9QUE/l
hazlj7jnmoTkv53lr4bkv6Hmga/vvIzku4XpmZDkuo7pgq7ku7bmjIfmmI7nmoTmlLbku7bkurrv
vIjljIXlkKvkuKrkurrlj4rnvqTnu4TvvInkvb/nlKjjgILnpoHmraLku7vkvZXkurrlnKjmnKrn
u4/mjojmnYPnmoTmg4XlhrXkuIvku6Xku7vkvZXlvaLlvI/kvb/nlKjjgILlpoLmnpzmgqjplJnm
lLbkuobmnKzpgq7ku7bvvIzliIfli7/kvKDmkq3jgIHliIblj5HjgIHlpI3liLbjgIHljbDliLfm
iJbkvb/nlKjmnKzpgq7ku7bkuYvku7vkvZXpg6jliIbmiJblhbbmiYDovb3kuYvku7vkvZXlhoXl
rrnvvIzlubbor7fnq4vljbPku6XnlLXlrZDpgq7ku7bpgJrnn6Xlj5Hku7bkurrlubbliKDpmaTm
nKzpgq7ku7blj4rlhbbpmYTku7bjgIIK572R57uc6YCa6K6v5Zu65pyJ57y66Zm35Y+v6IO95a+8
6Ie06YKu5Lu26KKr5oiq55WZ44CB5L+u5pS544CB5Lii5aSx44CB56C05Z2P5oiW5YyF5ZCr6K6h
566X5py655eF5q+S562J5LiN5a6J5YWo5oOF5Ya177yMT1BQT+WvueatpOexu+mUmeivr+aIlumB
l+a8j+iAjOW8leiHtOS5i+S7u+S9leaNn+WkseamguS4jeaJv+aLhei0o+S7u+W5tuS/neeVmeS4
juacrOmCruS7tuebuOWFs+S5i+S4gOWIh+adg+WIqeOAggrpmaTpnZ7mmI7noa7or7TmmI7vvIzm
nKzpgq7ku7blj4rlhbbpmYTku7bml6DmhI/kvZzkuLrlnKjku7vkvZXlm73lrrbmiJblnLDljLrk
uYvopoHnuqbjgIHmi5vmj73miJbmib/or7rvvIzkuqbml6DmhI/kvZzkuLrku7vkvZXkuqTmmJPm
iJblkIjlkIzkuYvmraPlvI/noa7orqTjgIIg5Y+R5Lu25Lq644CB5YW25omA5bGe5py65p6E5oiW
5omA5bGe5py65p6E5LmL5YWz6IGU5py65p6E5oiW5Lu75L2V5LiK6L+w5py65p6E5LmL6IKh5Lic
44CB6JGj5LqL44CB6auY57qn566h55CG5Lq65ZGY44CB5ZGY5bel5oiW5YW25LuW5Lu75L2V5Lq6
77yI5Lul5LiL56ew4oCc5Y+R5Lu25Lq64oCd5oiW4oCcT1BQT+KAne+8ieS4jeWboOacrOmCruS7
tuS5i+ivr+mAgeiAjOaUvuW8g+WFtuaJgOS6q+S5i+S7u+S9leadg+WIqe+8jOS6puS4jeWvueWb
oOaVheaEj+aIlui/h+WkseS9v+eUqOivpeetieS/oeaBr+iAjOW8leWPkeaIluWPr+iDveW8leWP
keeahOaNn+WkseaJv+aLheS7u+S9lei0o+S7u+OAggrmlofljJblt67lvILmiqvpnLLvvJrlm6Dl
hajnkIPmlofljJblt67lvILlvbHlk43vvIzljZXnuq/ku6VZRVNcT0vmiJblhbbku5bnroDljZXo
r43msYfnmoTlm57lpI3lubbkuI3mnoTmiJDlj5Hku7bkurrlr7nku7vkvZXkuqTmmJPmiJblkIjl
kIzkuYvmraPlvI/noa7orqTmiJbmjqXlj5fvvIzor7fkuI7lj5Hku7bkurrlho3mrKHnoa7orqTk
u6XojrflvpfmmI7noa7kuabpnaLmhI/op4HjgILlj5Hku7bkurrkuI3lr7nku7vkvZXlj5fmlofl
jJblt67lvILlvbHlk43ogIzlr7zoh7TmlYXmhI/miJbplJnor6/kvb/nlKjor6XnrYnkv6Hmga/m
iYDpgKDmiJDnmoTku7vkvZXnm7TmjqXmiJbpl7TmjqXmjZ/lrrPmib/mi4XotKPku7vjgIIKVGhp
cyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1h
dGlvbiBmcm9tIE9QUE8sIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3Ig
ZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBs
aW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3Ig
ZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGll
bnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgcGxlYXNlIGRvIG5vdCByZWFkLCBjb3B5LCBkaXN0cmlidXRlLCBvciB1c2UgdGhpcyBpbmZv
cm1hdGlvbi4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyB0cmFuc21pc3Npb24gaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1haWwgYW5k
IHRoZW4gZGVsZXRlIHRoaXMgbWVzc2FnZS4KRWxlY3Ryb25pYyBjb21tdW5pY2F0aW9ucyBtYXkg
Y29udGFpbiBjb21wdXRlciB2aXJ1c2VzIG9yIG90aGVyIGRlZmVjdHMgaW5oZXJlbnRseSwgbWF5
IG5vdCBiZSBhY2N1cmF0ZWx5IGFuZC9vciB0aW1lbHkgdHJhbnNtaXR0ZWQgdG8gb3RoZXIgc3lz
dGVtcywgb3IgbWF5IGJlIGludGVyY2VwdGVkLCBtb2RpZmllZCAsZGVsYXllZCwgZGVsZXRlZCBv
ciBpbnRlcmZlcmVkLiBPUFBPIHNoYWxsIG5vdCBiZSBsaWFibGUgZm9yIGFueSBkYW1hZ2VzIHRo
YXQgYXJpc2Ugb3IgbWF5IGFyaXNlIGZyb20gc3VjaCBtYXR0ZXIgYW5kIHJlc2VydmVzIGFsbCBy
aWdodHMgaW4gY29ubmVjdGlvbiB3aXRoIHRoZSBlbWFpbC4KVW5sZXNzIGV4cHJlc3NseSBzdGF0
ZWQsIHRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgYXJlIHByb3ZpZGVkIHdpdGhvdXQg
YW55IHdhcnJhbnR5LCBhY2NlcHRhbmNlIG9yIHByb21pc2Ugb2YgYW55IGtpbmQgaW4gYW55IGNv
dW50cnkgb3IgcmVnaW9uLCBub3IgY29uc3RpdHV0ZSBhIGZvcm1hbCBjb25maXJtYXRpb24gb3Ig
YWNjZXB0YW5jZSBvZiBhbnkgdHJhbnNhY3Rpb24gb3IgY29udHJhY3QuIFRoZSBzZW5kZXIsIHRv
Z2V0aGVyIHdpdGggaXRzIGFmZmlsaWF0ZXMgb3IgYW55IHNoYXJlaG9sZGVyLCBkaXJlY3Rvciwg
b2ZmaWNlciwgZW1wbG95ZWUgb3IgYW55IG90aGVyIHBlcnNvbiBvZiBhbnkgc3VjaCBpbnN0aXR1
dGlvbiAoaGVyZWluYWZ0ZXIgcmVmZXJyZWQgdG8gYXMgInNlbmRlciIgb3IgIk9QUE8iKSBkb2Vz
IG5vdCB3YWl2ZSBhbnkgcmlnaHRzIGFuZCBzaGFsbCBub3QgYmUgbGlhYmxlIGZvciBhbnkgZGFt
YWdlcyB0aGF0IGFyaXNlIG9yIG1heSBhcmlzZSBmcm9tIHRoZSBpbnRlbnRpb25hbCBvciBuZWds
aWdlbnQgdXNlIG9mIHN1Y2ggaW5mb3JtYXRpb24uCkN1bHR1cmFsIERpZmZlcmVuY2VzIERpc2Ns
b3N1cmU6IER1ZSB0byBnbG9iYWwgY3VsdHVyYWwgZGlmZmVyZW5jZXMsIGFueSByZXBseSB3aXRo
IG9ubHkgWUVTXE9LIG9yIG90aGVyIHNpbXBsZSB3b3JkcyBkb2VzIG5vdCBjb25zdGl0dXRlIGFu
eSBjb25maXJtYXRpb24gb3IgYWNjZXB0YW5jZSBvZiBhbnkgdHJhbnNhY3Rpb24gb3IgY29udHJh
Y3QsIHBsZWFzZSBjb25maXJtIHdpdGggdGhlIHNlbmRlciBhZ2FpbiB0byBlbnN1cmUgY2xlYXIg
b3BpbmlvbiBpbiB3cml0dGVuIGZvcm0uIFRoZSBzZW5kZXIgc2hhbGwgbm90IGJlIHJlc3BvbnNp
YmxlIGZvciBhbnkgZGlyZWN0IG9yIGluZGlyZWN0IGRhbWFnZXMgcmVzdWx0aW5nIGZyb20gdGhl
IGludGVudGlvbmFsIG9yIG1pc3VzZSBvZiBzdWNoIGluZm9ybWF0aW9uLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
