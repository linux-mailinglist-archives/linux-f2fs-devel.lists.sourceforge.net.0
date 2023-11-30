Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D007FEB39
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 09:55:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8cpB-00016X-LW;
	Thu, 30 Nov 2023 08:55:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1r8cp4-00016P-TL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 08:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhOQWIDSrpkUEhNm54KZCi5MBz5+sLhyWFhsEkfHCHs=; b=m9/fWL6KAnG8TGzaIs49Aec6Wa
 U0rgAevro1bf1BoZXt6oPf2Bfz4aJAL3B/kQ5x+yzUGrQbVuyj8vgQzyTe0eWS6jWkCculpoiusYw
 RGXiq0tSg40pk3Jb3/iVZSObDhYiMOw5wBZHxu50lYbgSRopJw04SVpMhbINfVMygCsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HhOQWIDSrpkUEhNm54KZCi5MBz5+sLhyWFhsEkfHCHs=; b=L
 ZzP911c0L6jav0DwpUZU3L3Sq4vUUbUzMPnpAK8a6fuSOJ2u9HzuCN23XWiOBGIO3uKv6wDkUyA0y
 A5VJ4muwA2rW7IS8HfLyWQwtOSjnJHmyLCaEYV1QfGhJCF/5xMIeLfzX4k5iomS212EMNRA/Uxlog
 G/KFc9Qw2FC6wRQE=;
Received: from mail-tyzapc01on2097.outbound.protection.outlook.com
 ([40.107.117.97] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8cp1-0006mS-VP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 08:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNvI36iBPL5ld0dCwZM93nU8aicUB9t5pXdPXr6T0y/5Qym3/V5PSkR2/tSbyIOaRRNG3/6o/jorccNLumU6qNc0njvTu3SDiB8QaQ6frL80xW5r/iHsHyM4dabw77a2hN1E1pPEs9J4elYRHnYOwm1XAv3ovBCYLPdgxKuBPQzV1p4Bw/oZkn9wHMgyccKxtkNcLFlGwXVbEQWhR8tWwTzgJJeoZzaDY6seVigZu2LR9p6Eyt0rW9QCx0xUB0Kp9/zltFsMbvA4oJ4RYGo/SeDgtPNEf6xwMcNIHp5Q/V0YUL1xxoJ+Vv4oBuXeznBWQ3truW9Ilzwsn2qiLMTKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhOQWIDSrpkUEhNm54KZCi5MBz5+sLhyWFhsEkfHCHs=;
 b=K5awfn8zF0Hs9F3yZdRPMFPzwjhe73G0SKvh/iyxoUNukCERnHXYGw0evEczvXyapfgzsgSNTFJJafgLNdFjJmG4qKxIWiJJdXvoM7aPQlLNZL2lxJJpAUYPeDJo/WtaM55T1kJwopXBfpVwHpCLY3YYKizzdqPdnctfGq26QhwKRS/rUtSXPbAxbj6xSSF0GBq5RKT7Xp9diOtPCqnQZ8E4inqGY03Tf1fg6PMBT4Xu7e4YoVa2hwQnniHil4KCNnBjgK1sTvNbDcWTCNFMjahFT6q2Gojah0Tf4Vm3U0BhDAwhyvE2z6PWk47BNcqmxR9cz1J7Da9vs2AMIdZscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhOQWIDSrpkUEhNm54KZCi5MBz5+sLhyWFhsEkfHCHs=;
 b=KBOoJXuOHC7j78BALLHiOmDaeJWotDd5vJEuFJmM6zM8JYywNkhkmg6+Cm+FHdGTJ2SR/zb65oZ5y1aeYw3+yBZTZpvMlBWEqrbPY6WXBZKxJb0x+ywR26sRi/Pi1jt12QIpMQFVcQxGOOIKu2iaQbAR6fUZLNVnuqXrnPXJLBCmaRtln05AHI98vD2hNMAJEAssYGdYr3EdHfTk/XR36rXyHfnk3I9SdM6WwyEYgBWJ949SkuWWKRCuUy4mV63BWW7UmSCszPq0lpk2pNauhn/qizZs7F4ra1oUEEMSj/vjq/DLIPzli4EgnA6A/K5Fno7IKSMbK6HBfOByiGjSMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5353.apcprd06.prod.outlook.com (2603:1096:400:213::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 08:54:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8064:576b:554f:5246]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8064:576b:554f:5246%3]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 08:54:49 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Nov 2023 02:04:09 -0700
Message-Id: <20231130090413.1291703-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba562a7-e6a8-414a-0d96-08dbf182020d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEj30fSVArq8kxSK0nBpRha+5c3JMPrs3W4HmPYtnRGuWSySzP7cUTBaDS2tB7jRLfqw61de03kd3gcoz3FIxy/2VcCV1GJyrpfKfIjddgWlU/7OlKkChTfXvT4nY1MHl9aJvMFvfcrQFAehM+YH2HVe1B3qVuJNd28PIbGz2TCd/g8UTs8TYSUptuWY0jAXdVpboLfuXHjHuLHsKVhdcViKxTwG0PHbosfx52IRqSniy4ODxj461S3zkMe6TYc6k4GppDF3GvH4nK+QbZc/o+1Y/C9O68DBiqV86up7PCnQQ4A00r0LotPtSEe2CyzAkFl58yZqbU1Kh59XTpeU6L4l/IRQ+KCphdZsyj3GKbbYvV3gqaJtqefZDQ6P3MFKq0RwLkf6VR2jwyUtojKYCkX6253si0+2+8m5Gws1TgVCk0M8yAEs3Gr6Cd/E9XFS63ATyWndfwjcjJI15TK5Eu4SN1x8SaAlTK/VPgvklOMpOrwj7xMir9buPE2MdBsfomWaUWP569mVf43Wq8wTnX07JM5D0JRpwbNcZckX/Kcv8bSSic1BPhyZXiSoa6pt/ahjIjkioqXRuUVFEVzz8BmaBs7ji0YHSqch/TtkRQhbKowxVVJFAVM1HfCz3H9SUZMXSBYjMcdacBf993OcEBlG+8oGNLDNizB4NYngJ1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(202311291699003)(86362001)(38350700005)(2906002)(36756003)(52116002)(6666004)(83380400001)(41300700001)(6512007)(26005)(6506007)(38100700002)(2616005)(66556008)(66476007)(1076003)(54906003)(6486002)(66946007)(316002)(4326008)(8936002)(8676002)(478600001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/95NXehUiSFeYfNM2pcz7wc1NRxW5gCpEn5E7YNhM+OdcTfwJdosUS5NBvxR?=
 =?us-ascii?Q?JS/QbvKlJCWZ2+f8lHUTrFnXw1f7nbrX/mWZumBBqu7HS8bfLvY2/AfQfSBS?=
 =?us-ascii?Q?l2kfeese0zf8IkAkaG0+rsDm+TgGz0oPj8alRUUU+g5AE07UuQMO63eNa5Yv?=
 =?us-ascii?Q?rKOGGxRpiV9Xu4FkYjehlNVIMCGjg5LXkL6+ff5+Pz6ns6AE9OYaj4z6Vniy?=
 =?us-ascii?Q?LlmOGomNyU2az9ThQyrKWZbv+6lfgWsC6EhCCO36/eN+cA818w38uUwyNYqN?=
 =?us-ascii?Q?UDkvIiDIIHION29KqUcXMXj44LzHrtOvLYEPdRDX11ncjex9uMHVr348rCwr?=
 =?us-ascii?Q?ir6XAw3nifPBmMMlITt/Pyr1DMABnsCmyR/ckcVNZWaOBGBcbLVgZulWN4qn?=
 =?us-ascii?Q?50ywcifZsYHbINGnXCwuIsa7aT6K2MS1idL/FmJhZ65Uu5Ag5sFFYXAHRmpU?=
 =?us-ascii?Q?aZy6XHNa9IMLSDGAKnJ6xUIDIn2ZvItses5TnTNFuyaHSsbKv5uTI6KQkG0N?=
 =?us-ascii?Q?2LChtzbb+BIdrptMMikGBvL1UcTtJ+qMp0pSDeuDg/3RsgOd+h3IuVrmi9oE?=
 =?us-ascii?Q?YiXtrKeUOOn05OrBdhYQDZlOOTDLMoGwimgMPOro0lalp49ZUex1K7kl4TR6?=
 =?us-ascii?Q?CegJmCdEPY/vyJYrOtJ0tr63S7SmFQ+hyk4YgShpT/6CbP+JTNCL+Wj3P8bC?=
 =?us-ascii?Q?nB+g/YWRh6sFEYSmX7yIP7GKx4T76M4xWboyUSMeeiUA8sU+HAYIO2cgp8P4?=
 =?us-ascii?Q?PHWCCDXHDuGPBYJvPrgt6KaIEMZv70OKSJ9C8S/P7UtVAsuAP0IG5bWPeP2G?=
 =?us-ascii?Q?1pRbJEWjIn0cxnH8UBFISnDuhCcnso+nTHcbisb7IQ3a3yKQZ1L9O/lsDmj2?=
 =?us-ascii?Q?85TnZ5QPt6TnhGss0IqBOowAasDlXQTNd4bIEnDVdEHFA+RMo+RgcI7Qhcaq?=
 =?us-ascii?Q?UVVQmaVVAiNPIMBQdEgkowXhM7IqoVehtJrgk4pLde34lNvurY4hQCUPty/C?=
 =?us-ascii?Q?laM2bSglQwKkQDn6lb6JXauqaLbF7Ng88cRuFPgzqF0FLhRrs5o6nNAfNoYU?=
 =?us-ascii?Q?zmOSJjra4qOvHUOpzUKm2UoS1QAvxrf/fivvUT/lkLK9Psg9BPl0cXMm7UsR?=
 =?us-ascii?Q?6H9mJqhCxbpmbGltky1OtRpmOpzfKJlgH2JB8IdB4TP+ryjMZboeWQ508FYS?=
 =?us-ascii?Q?121E1AgaSlF/HWYGsmArlCZ5HVxhKsIX5Co4z2UvKg3pPQT9lQjfNbrg2usM?=
 =?us-ascii?Q?PEJayqtOFnhhBvzfc9DIt9fpBID6QRjo6pSBsC6XtvhDH+ZLLPZgvNmjSKUz?=
 =?us-ascii?Q?WsyokW5G/R9sKlPtGi2aqRjpik1Vbaujdf204arFzZkQNORP6wqoC8g/01o4?=
 =?us-ascii?Q?01ZOsca3i21dJHoo38NOk/iINf1AGd+BE4p9SYEQ05Z2902+gG44VNBPcwBl?=
 =?us-ascii?Q?4Ibne8ELwagFcLNcVuB9qkTxyuMp2uku3hn9MYy/2vR7jLgCCziEPN16q7jM?=
 =?us-ascii?Q?ilsprxEtPAfsu+wWDeasWs7E/THtK4601soK5xRf5mZU6YjbNl3tJxFaHJTs?=
 =?us-ascii?Q?4QN3D86pgjDtElkNlB029/pt0Fqp58gA5VljHMq+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba562a7-e6a8-414a-0d96-08dbf182020d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:54:48.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrvhRa3wP7UNAoTjIAGDOdslz0+wvNUCqZUG1x7SNmjfDaFjGx6KrfK9f58oTh1iUu8F+YFxTIjeQiWD2ztOAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5353
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: NFSv4 mandates a change attribute to avoid problems with
 timestamp
 granularity, which Linux implements using the i_version counter. This is
 particularly important when the underlying filesystem is fas [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.97 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.97 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r8cp1-0006mS-VP
Subject: [f2fs-dev] [PATCH v2] f2fs: add support for an i_version counter
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
Cc: linux-kernel@vger.kernel.org, Wenbo Hong <wenbo.hong@vivo.com>,
 linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NFSv4 mandates a change attribute to avoid problems with timestamp
granularity, which Linux implements using the i_version counter. This is
particularly important when the underlying filesystem is fast.

BTW introduce a new mount option to enable the iversion functionality,
and disabling it by default.

Signed-off-by: Wenbo Hong <wenbo.hong@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst |  2 ++
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/inode.c                    |  2 ++
 fs/f2fs/super.c                    | 17 +++++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d32c6209685d..eac23bc0bb92 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -367,6 +367,8 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 pending node write	drop		keep		N/A
 			 pending meta write	keep		keep		N/A
 			 ====================== =============== =============== ========
+iversion		 Enable the feature of updating the inode I_version field.
+noiversion		 Disable the feature of updating the inode I_version field.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9043cedfa12b..68fd2ef35104 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -28,6 +28,7 @@
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
+#include <linux/iversion.h>
 
 struct pagevec;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 560bfcad1af2..b741eea7e724 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -32,6 +32,8 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
+	if (IS_I_VERSION(inode))
+		inode_inc_iversion(inode);
 	mark_inode_dirty_sync(inode);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1..adae708e869c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -180,6 +180,8 @@ enum {
 	Opt_memory_mode,
 	Opt_age_extent_cache,
 	Opt_errors,
+	Opt_iversion,
+	Opt_noiversion,
 	Opt_err,
 };
 
@@ -260,6 +262,8 @@ static match_table_t f2fs_tokens = {
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
 	{Opt_errors, "errors=%s"},
+	{Opt_iversion, "iversion"},
+	{Opt_noiversion, "noiversion"},
 	{Opt_err, NULL},
 };
 
@@ -1334,6 +1338,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_iversion:
+			sb->s_flags |= SB_I_VERSION;
+			break;
+		case Opt_noiversion:
+			sb->s_flags &= ~SB_I_VERSION;
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -2152,6 +2162,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
 		seq_printf(seq, ",errors=%s", "panic");
 
+	if (sbi->sb->s_flags & SB_I_VERSION)
+		seq_puts(seq, ",iversion");
+	else
+		seq_puts(seq, ",noiversion");
+
 	return 0;
 }
 
@@ -2196,6 +2211,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
+	sbi->sb->s_flags &= ~SB_I_VERSION;
 
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
@@ -2574,6 +2590,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
+	*flags = (*flags & ~SB_I_VERSION) | (sb->s_flags & SB_I_VERSION);
 	return 0;
 restore_checkpoint:
 	if (need_enable_checkpoint) {
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
