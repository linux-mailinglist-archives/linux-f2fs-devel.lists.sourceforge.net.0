Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 144816DA18C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 21:37:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkVQa-0002Gd-L0;
	Thu, 06 Apr 2023 19:37:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pkVQZ-0002GW-14
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 19:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zU+AuGQXlkLsUMWlCalFEERs5+2GBI4tTG9TJvyNe6Y=; b=dH7iVG/LMYYJlxDIsFXBExp0dA
 UijRhKDnfwWLtG3qvbSs0wSMSswqYsxMzXWKSSksfIVfnNqCTwaOUfsU3kNV8BU60LgyHaC6g7Bvm
 JazpFwWy4z5FqpIodpyev06oKuk4/AeAGZQZRVWKTtNVCsy/b74HHiSyjZG1Y5OnYttA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zU+AuGQXlkLsUMWlCalFEERs5+2GBI4tTG9TJvyNe6Y=; b=S
 wAG0jVtneLTPpTC1koznvwUZC8AmkboUwhBkNZsJVAV0mEQwbN6Ll7L6Jal3KFdWxXIlLW5krJcPV
 wLttIUrAN61faM5QxiLqJqpSjj6ZQSDGh3QdeAhPBpMW7862wH9fHXVFxXjWC9EcSWf5MivrC7M9p
 77jZuOpPxmkHwAdI=;
Received: from mail-sgaapc01on2102.outbound.protection.outlook.com
 ([40.107.215.102] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkVQV-00H7B2-IL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 19:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emAk7AexFGlMyP9zWHUtLHn48Jq5XPWib771PdXlIQ1JJSMFDxAAP8v8ZRj471WMAwX2oHMKC8NxRBSSOwB5G0C45tmvmaW6dbLjrQSFIpj1cS1CI+HMJI35OLw5cB+bPVQ/97QYvt38wobx6SfzzJCIjuUhQc/4a/S6IOQCpDGXuzn3rJCfY7HOgygTEje8f6k+cDqnAaTnbJucil2pxNjcqQhK88FS4i7kP7kP3IzHMSCDwxSbYFs7JQY679EZ8Ncmbbf4mRV5zGTm2vmJl9kNcyDyJncrYt9esyuokwP/QIx/fTXaOH0gvn2aYiGoDBfl7u61+TZZwqPeupK1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU+AuGQXlkLsUMWlCalFEERs5+2GBI4tTG9TJvyNe6Y=;
 b=kDULaSXCz96DSV3d5GpthS8zzkyMKpCdz2suDVo5XZCrLo6VcdO/LfHYhWSiKNTDkeMFBvLCB4l8d6s9IwkuraRgMSQWT7EkwJNloiLziiaHMJiFDZXEN8GLRlYRkupbtnpHSuh/F+7kSJ2/mBEv9AeZQORmKMw1sf/PQXsk1kaCKuPP/pRyoZKIHR2p6W4Q5D/QiEBXOOExvf80XWFsSI3/DUUsyjRtA7EEwsn8V7zEcvuhVi/ftIucfUuiETkJqFVkLTrwhfC1Xk7C7+g7/vG7XPYoZn+HCZpUU5coEr/rk9Y98RXfWjGPiPc199+o3x1AQSHPNElufCnudeEBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU+AuGQXlkLsUMWlCalFEERs5+2GBI4tTG9TJvyNe6Y=;
 b=Y7sO9qK/f1WfT2L7bUjJy15MI14AszE5dxKWnvcIXnhHnJkv2aQvD1a2oBx3HjzZPXa0PrgYH1Z9ZnFsTRuWlo60mPsMAzKQSNZPRFm+BxGlMHU5rMacUpnnl678NdcIf8sr2hTL9PQuLkc7F/O2Q0uJdvrrUPJP1kcpVMcs1+tKxLAgjAw6eGqdeGiXYV5tSd/CreW/B/KnBDS4Dl3rWbnJTCBGbwEDyF/8WYZDbVTRJGntVx6JMaHBRurx7UAbBMXL2IiVM1st9KLZG/OICdiV1CW0QkqcIOWGEvoJb1Rp+PTb7fuA6LVk2V8qZ2RJ20+ZotV6YCl9vudJdY3kBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4185.apcprd06.prod.outlook.com (2603:1096:4:f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 19:37:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 19:37:28 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  7 Apr 2023 03:37:16 +0800
Message-Id: <20230406193716.70796-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f0a4ce-9a86-459d-d9f3-08db36d65ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Du7MGY6CMLgp8tQvyEBkpIOFWoU5ndDjwQdRQwCO7x5/wh+CNYFJUiZAoyuQRq6oo+DHIsr9kEAbYH+vRQYfVrBZ0HRLoUI2wG4+mtxcfeecdNscxq907aAmGciXyyIsVnE6+uBryEiI956vix00xbvi4RlZKKHMMBvQjJimY77nfXfXMtWzQBeNupyPUayeBQomNCgsCi7QMJPwZoFvcKL1PiT8nJ1G05npNikW0r+1I+9PYz5MCRg4OxEINgFvJxukKxCAgo8FocZTHoLajAMhbrn5V//fZzTP2hHrLl7UblPFi97GrT8NXegDD3tsWXBDfP1KL5/O818UkrW2bmC3bIGm4DxjNioFNuWevERVXdlituD/vRcdttQraUSeNIQOdhzmHgnSL4tZLUJtYcJt09wk/v2LUjzJsD1emyrTHDDzTjjl5/F12760ps+esU5V1uHNB0WJteD1WypAMesCgk/fgAf1I4pbRrdyZBqyLi1Mo8BjJKufH5q9oEAh1HUIJpz/cU5FdcAPgTiK2Yc8vVFEG2FmvbhI8Gr5oYh3B60gapbGlXBCljIU7LICcPi7fTW9ph4loIFKTvrcLKo2/QiOW0kmYNSub+woBQZJDYZ3SIXfCQs8y10M77Dc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(66476007)(8676002)(41300700001)(66946007)(4326008)(5660300002)(4744005)(8936002)(478600001)(6512007)(6506007)(52116002)(1076003)(26005)(6666004)(2616005)(186003)(83380400001)(110136005)(66556008)(316002)(6486002)(86362001)(38100700002)(38350700002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRkz4m61HN0fwGD4Q6vNZJxGumOEbsV4BvZZjzJ7mkYOM9o05QnSiea9qReq?=
 =?us-ascii?Q?H+oNvJ8iGaNBK6NwTNdukQd0WwLbPKMO5ZQ5L6EYamgWZ/y5LPvoDWGAJnD5?=
 =?us-ascii?Q?Rw/C+3qXL05rgVVK8bjyDAk6WvaKqTkbgNxIOncgZOzUz4jgL2TCTNT2eBoa?=
 =?us-ascii?Q?8IqXBpcq4yCtAGGBRL9DfyyGTvknNr+Eo+KghoKlBELDT0Vd7xg83OqDpzPe?=
 =?us-ascii?Q?CfubweWre5SKUVHvleMrxR+1yIhdY21Uxx67lwqdwL0qsdnP9CP3YVIJuDzs?=
 =?us-ascii?Q?A2ikV1fGRcJenXnYN9uxEM1rp5ZOT7lHNZGNBoPD//HQusMMPPF9MxEaVP75?=
 =?us-ascii?Q?0bBISIGkOp2bvJeiFmybNIjuYU+Q372nv++jQJc3R7BErYHDzXzGKldzA61V?=
 =?us-ascii?Q?NxPhy3xWN2748hmCP4FjyAWTzsK2exxDhIpK/NW8xQvwf+fpu5rm152In2GC?=
 =?us-ascii?Q?CP3Z1H/wGjxkYzXnsnVzIogDQrEKTXVSNWWSVf3vSMY99WEhjc5VcqzpCQlD?=
 =?us-ascii?Q?TXWwEAmEUbc0GeD0jnvxlCkiLn50QY2f0C5O51tvKqhXHdR6K5OEavzoXHvR?=
 =?us-ascii?Q?HkdKwMKlTceJIL6MzT5RCiwXBqNCApatNUmxDbDoXUbklJUf46ych51o3201?=
 =?us-ascii?Q?ls1u5bzENquk9u83PnxSfJx8ZoGlKdl211UXqM8K7JNrcC/0alRA0MY3GfB8?=
 =?us-ascii?Q?hwUe0+CafSOTL7yS/jPBcNMvYHMY7QI1s5fn1lS44KcyZp4VO3LGsF43+gP0?=
 =?us-ascii?Q?qCv6FE9vSq7BBZXB4CxWRiTiiKRhvMJ6FjvZJnNylRwttSPdO86kavXisTnB?=
 =?us-ascii?Q?vMf5j3hAtZPeJMJ41FM/PygCrgzGDPtX7CmqBWieQY/rOH4I4MIzIBijYv9c?=
 =?us-ascii?Q?HBFpNyJKgDS3dx0JvsFGR+xdAI37Q9I9Jp9q68l3inFZWG7kNbhoHb5GoDXg?=
 =?us-ascii?Q?x0z34ogy8pGO4nlh2cFVBAD0EhMyd66UPhfxUt3mOiwvyqKCSHdhGl0MthR2?=
 =?us-ascii?Q?TtYsRevM9YaUXq2yVoWsnItAdMdaJVM3xPuNa0RolkjpQg8tAS4or+Kmrvit?=
 =?us-ascii?Q?i9UbfcD9AHxmYY9HHTQ2LJAk3CZWbjBrG5Lzs61ZjZuE48RXiMvuPMZEsVrb?=
 =?us-ascii?Q?KuPn/PsMabqz4PywMj90k9G2HKu13HfmFxsP+SdzXVwfrjyM4h4mmkLCr7iw?=
 =?us-ascii?Q?NrJkfNKgeQtLtZh95o9MdGnbaK86zikZLnAcZ/IXu8Q6K/Eb6CwCukC8CuBi?=
 =?us-ascii?Q?oIJlIr4OXonSLeZS8/Ae2Z6L1k/SgHPRVxwEM3WpghCO77BX+Z6kbauLmdNv?=
 =?us-ascii?Q?FsKRkx2RH+yn6VHSr/8jPhprTEa2Pt2PzdM/mt9SFR8sRZIj+eZH08j1LtEh?=
 =?us-ascii?Q?eQXROGZ/h9L7mucpx6g/PQtEZEbYE7A2/xz6LnFVynb8Tkmm0+y64U/t/552?=
 =?us-ascii?Q?EioxokbEH59YyGLz5D3b67dSz4161YH4fyaAASKAgCSOIFC4tbxTcsc5E2Am?=
 =?us-ascii?Q?FL1o3A5IqGDTX6QCvC6Du9iVQ1OrYBWxmMA/NVbG+J6YfKk0kMLKAMm+JL9U?=
 =?us-ascii?Q?jJonqU9u0fp+NfiPNBlom627WwN/EB3R3OPcRlFh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f0a4ce-9a86-459d-d9f3-08db36d65ae4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:37:28.1139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgNEA1Kl8TcJhbJd4Vu+u2toMahPqicy7kIttXsmiuuGIUh0BFw++jFPAvaM0ExyuXa6SZC+c6xKtb2W8r5LpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4185
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Return -ENOMEM when proc_mkdir failed. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/sysfs.c | 17 ++++++++++++----- 1 file
 changed, 12 insertions(+),
 5 deletions(-) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
 index 3aad3500a701..dcd497e0920a 100644 --- a/fs/f2fs/sysfs.c +++
 b/fs/f2fs/sysfs.c
 @@ -1385,12 +1385,19 @@ int __init f2fs_init_sysfs(void) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.102 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.102 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pkVQV-00H7B2-IL
Subject: [f2fs-dev] [PATCH] f2fs: add sanity check for proc_mkdir
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Return -ENOMEM when proc_mkdir failed.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3aad3500a701..dcd497e0920a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1385,12 +1385,19 @@ int __init f2fs_init_sysfs(void)
 
 	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
 				   NULL, "features");
-	if (ret) {
-		kobject_put(&f2fs_feat);
-		kset_unregister(&f2fs_kset);
-	} else {
-		f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
+	if (ret)
+		goto put_kobject;
+
+	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
+	if (!f2fs_proc_root) {
+		ret = -ENOMEM;
+		goto put_kobject;
 	}
+
+	return 0;
+put_kobject:
+	kobject_put(&f2fs_feat);
+	kset_unregister(&f2fs_kset);
 	return ret;
 }
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
