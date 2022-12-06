Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9793643D2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 07:36:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2RZR-0002Xi-0M;
	Tue, 06 Dec 2022 06:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p2RZM-0002Xb-7i
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 06:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YCO0C3ciguaCm5OANzldz3giTAeNlHiaCts2N+odNUA=; b=hbW0surgtBHJl8it4EQFROL5wC
 C2JqXVDcUPhlkj1Ob5PWRoqVD4KXgI1Gbj1Ct3uXLxgztHG0WleGuMVDn3Cq/67EecE4ge8n14aEG
 FYAp6u+XgqNFd1vHfHX4j3vaMihtPYvlSPf5p7tIkuo/5Nyoggdh+0CB5x07e9TTh1Ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YCO0C3ciguaCm5OANzldz3giTAeNlHiaCts2N+odNUA=; b=m
 sY6czvYS4wq362DXIrE9ci9AzcCv5V2qBVPYREgPNEo/ou2uJHsoaLeBUjz297g/9OyyOhc/emv2J
 ++hREcbDLADFR2oJVY2rWpP5GrI59CJbdfrQd2X0a/20HpSZTE6J6rwJ5TwPEGWNebuTky066vqZ2
 oiWVAfRuDSzZAH0M=;
Received: from mail-sgaapc01on2099.outbound.protection.outlook.com
 ([40.107.215.99] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2RZF-007VwA-VI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 06:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFFWiZzk/bZ9DY/zNLwZ+OjetJhljtjuyY4A4zIwMLMrpF1t9zNf0KyC1xnt8bI5+j0ouFuenqO3Pri7f043/izWHK1IKYWVTcJCt08r8FRXOMWPP58p9p865AaFbkrhCzPVMrKcSDcX5yBVJaP3zSxL0eSZ3H62ZOLVLvaG/EpsYk7O+kMRGLTp7TzbnLpgNT9+gksCnvUWSa/LL2acH69iHp9vz9wxkhUut8eKnJudytt59pypYACO+rHVmj+fvoAOaHDK74eBpGoieu/zd/tWfl+5NvNoUzhxICbuTbUfX+WM3SIOQ2exYFLs4zh1PM/7a+fEI3c/urHrXhvCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCO0C3ciguaCm5OANzldz3giTAeNlHiaCts2N+odNUA=;
 b=OskVYYnPQS4vqrVUJM9HEk3Hl3SM55E+6YLyrGz1vDd2hOsidJm89wWWpiiOFbFgB52WFPGBwkLcxwjQC0kDhTO65ftUpmXfIMeQieHVNULgXTn5Rpmf8jb0dag7HV8Cj8flt99GAdCIQZvCxgYV5+KyA9fSqVaQQi+v/XH/IWarsb39OHtskGenMbZt3xhv20mg20xrK/g2M1v+zjKPU0G95c1l7+AMinAMvUuZA5gnjsm9K3bpjltxJgyQMSKKsOHK9QDzorNoB7yayqtmEpPQxqLjYkP1uKlgxfweyTi6lRbUFVhVl4EVdRK2HS+IHDboRqcOVQTq7uW7tNQbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCO0C3ciguaCm5OANzldz3giTAeNlHiaCts2N+odNUA=;
 b=BMdbQ+nG13WHJtRpSSqvdgv0yvkc6PwqwYxS+eLAjagWou/wOA2OJg0At6IUsFG4QH57yBpwTTgtpGyd4aHMcg1IFQFrHhZzedot3Fa9orq1xpJ+b4aLZxoHOujwnIWJNpm2MazDwsAb88QAQ103XMvhqRM4hbnXnFcdxp9TG77cb0y37/YzapAEKYlbv+2qCczzhTXKjAUgQyK3ZWXabeb1e7+Di+ZLHRnsgAV3hc40pS2x+9NCQ18VwxfyCA9MQp54MThJ8j9I8QFpmo6grbbXvFeQU2fDSUHwcNuGoGEtiKemghRi94/UW9ElFyqmm5ky/vxP7jTv6RUTkY19qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5087.apcprd06.prod.outlook.com (2603:1096:101:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 06:36:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 06:36:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  6 Dec 2022 14:36:16 +0800
Message-Id: <20221206063616.68522-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0197.apcprd06.prod.outlook.com (2603:1096:4:1::29)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 2143f4a1-10bf-4fe3-645d-08dad754349a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PuHELNvRG7Zq17R60QFWlpBcZaRvNdbm/ZKRzAp5BcXM4knmgLAjBzU6iKvEjy2e265QGWhXQZ3loLEaTanfAzQ60Ro6fXwCtwN+4Ik5hy/OgzocV3hIlv6lf6xiN7rMoe/XAC32bF56oqc8hZeUHkwBBXj89BKwvoFJe4M+7fZ39Dz225OKTgS9ABQu7+/EZAV+R8VNKvJpakS4YJtNjOa1uTnuksO5XK5KYPrDYHlf0sS74kTFhqNIusbnMuPz7JV5P9qO1r/LZHQ/5cZi8IXKCFNUlTgNQj9rw1Zoek/NSs98Q6PHX8duwUDXRQHAJDrHSst9lBliiA1rPwKPvQLGpYhcJFHvgGTQj+OhsRfkEd+LBpu39zziuxaqg3kGcDrMevmYBl6Act+F/ClNzzeu793ZEW7C7X9xcAcT+184elNKiUxtn/1X1+AeDUUcHSR0fp8WaaC78+FSnbCNfs5J51w4K8YQ+wuV7LBQH9DB4s7WWjvwmwBAQERD1SMM0WdaY10pOefRsgml/Dwf0kCC26m7suOGnt577uaFPT6TDo3Ysd70Opu7AVZZCDUvuvs0HrWceM1M/evX1yQvkDTKdGcMfOFjuleRf8P0JQEe3dO7o3V6pu2wSQCxKCZwxbrxX/kaAxzBPquN7GGYXLhtsihwNHtpNsz1R3c/PdhwtGCnGdbASE/we9IhgSZT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(478600001)(83380400001)(38100700002)(38350700002)(2616005)(1076003)(186003)(52116002)(107886003)(26005)(6666004)(6506007)(6512007)(41300700001)(66556008)(8936002)(2906002)(8676002)(66476007)(4326008)(30864003)(36756003)(6486002)(66946007)(5660300002)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTuR4ckL0L+JxFyZfBJ9YN1Sr19E4Pr1PRr9vOcrB5ey6lTC8W2dxFr1Tm7J?=
 =?us-ascii?Q?ufyT5qFIfinNztgaPYnQu2+pQPWo3eEfTibSO7/NTfP7m408hSEL2OFTSrdz?=
 =?us-ascii?Q?uBs3NehSAqu0xGEyWNp/vxDlyYY9rGWjxXTBuJU+ugExzYYPFCaOkVS8gp0O?=
 =?us-ascii?Q?6Ga1gAHh5C+9qiNbeyggYGzZPAIIkPrL+Ol2UZJ4wAIxgl3QC4gj1yQ86YVy?=
 =?us-ascii?Q?+DMbAlXjEUgspP4+Lc8ZJA7GVFk1Dl7O4Grh+IgelJBQYFTNWFXLGz8nWcUe?=
 =?us-ascii?Q?gmtqPNYl2e/v4UJBjBZDjwXY0eQYPN4l3onq51E7mpb0/eP6L+73nM0/WUTN?=
 =?us-ascii?Q?flxJvRbtGvZqQWMrnBhVSiLS/kiBbTEXAvtpIjsClQimJJibqQ0b4DeaBgMU?=
 =?us-ascii?Q?8q9hssvn+t5GNcSr6Nq7VGFGo4+ne+QBs6qC3nrZrkmtOS6rrOektFjKCjO6?=
 =?us-ascii?Q?NeHx3eV2luRAeepVL06J2rlrsxjpElerN2AiX3DIDDJbt9dEHWqp/skTwv5Q?=
 =?us-ascii?Q?2tKdxxEnjeESWiYC5M0tJCYYCNki5TK7i94Rlz6XvOvH2vt5eMuORZLZ8vcM?=
 =?us-ascii?Q?tghJfp7a8d5IAp2DOhRY4JIZPGz5XWRvV0Hzm7zLkqDyT66n195cv/q5wA7r?=
 =?us-ascii?Q?cx+ztiqzenyorlfcLh+T/9sipU2e7e5zoSg8rCjuLh1YYtWOyt6R9oT+cYsb?=
 =?us-ascii?Q?AoUV+rjc7IZP51g87ewsjOTCtmJaMQX2SvWdfwFhj4rdkysU3tUMoN1pCOxX?=
 =?us-ascii?Q?APC7IErus87O/mY+akGc/ExhzSNnqYdxMG9BJlGv+1I/rZpgW7VpMK5eEwNs?=
 =?us-ascii?Q?+LTZAbEG8H3apwdY+mpmIqIHI44FLRItW66XoojgpCpzZLWiHARP4BCKFRak?=
 =?us-ascii?Q?BoM2AfCCxDrQ2+Hr5ZFkhIIgEyMXgL+Unu5xEtzNpofl1h58g79i89/dbVzY?=
 =?us-ascii?Q?TydoPWeYVeIN2bNSRoMNAN6Hrkm1t+Wtt8NfHdSNXRgvv5ZSx+cykiISx51a?=
 =?us-ascii?Q?JIMZGwzJR/6rXbBauFrxgTXRAxxq4USzDW/436Bz8j+wudMyyQogd8W9+hrk?=
 =?us-ascii?Q?zaf2vFyYhpcU8uAJJVoz15Z5kIFsU+gFdZwos+VXwc2lak13eh+6KagYIGsA?=
 =?us-ascii?Q?F3II0sMdibr+mrOuZcJyQFETLPJieA7L7nYpNZiJ9tfM4SJi7KFOygj+fx4C?=
 =?us-ascii?Q?ms2j/YmxJ4eI/2F1Ep5hWuNgSWyaKRO8OVpfzBvQXiq0wCf0l3BR4V6XVWZO?=
 =?us-ascii?Q?jc13mPZL71reirs3uH3Ec6Qo6iAJD0myTiXuj3dPFVg1dW1BQ29NTjhBHGcC?=
 =?us-ascii?Q?rJxA/SAWlhK3x7zhu6zkocNrTjBgmVPiqFA9hUOGadw+Hf0hi8/vz4ycA2Lc?=
 =?us-ascii?Q?CB+JbZidEck9HkyoP2fF9o6SyP7tLQ3OkF6mfywX3T5jGx8qA4OjhLeTFMVo?=
 =?us-ascii?Q?T8oNLqsqkbyBw7Q1Yspv3lpVkGQ9gDbV9G67J9BLm9DW+pEAoyuWA72hTtiU?=
 =?us-ascii?Q?BXZK2/Gl6MyNRGfPekOQpkI9vtqtXS8eo2odEBJdm40MoD0Z7IHp6YApyCSu?=
 =?us-ascii?Q?YZslB1pDy2+8FZtLQNuGVULNE6UCcoFHb6urcjrZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2143f4a1-10bf-4fe3-645d-08dad754349a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 06:36:28.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjuBVfGFm0fzoo5WZaATveAPpHt5iMAw+tQBxOQXyghhXV9RYfNCG38iRrvkZo6BzuE1+JwIaJFf1fr+hnH4tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5087
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports parsing these two parameters from mount
 opt, so that we don't have to dynamically modify the parameters through the
 sysfs node after the system starts. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- Documentation/filesystems/f2fs.rst | 6 +++++ fs/f2fs/debug.c | 3 ++-
 fs/f2fs/extent_cache.c | 14 +++++++---- fs/f2fs/f2fs.h | 14 +++++++----
 fs/f2fs/s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.99 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p2RZF-007VwA-VI
Subject: [f2fs-dev] [PATCH] f2fs: introduce hot_data_age_threshold and
 warm_data_age_threshold mount opt
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
Cc: xiongping1@xiaomi.com, Yangtao Li <frank.li@vivo.com>, qixiaoyu1@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports parsing these two parameters from mount opt,
so that we don't have to dynamically modify the parameters through
the sysfs node after the system starts.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst |  6 +++++
 fs/f2fs/debug.c                    |  3 ++-
 fs/f2fs/extent_cache.c             | 14 +++++++----
 fs/f2fs/f2fs.h                     | 14 +++++++----
 fs/f2fs/segment.c                  |  8 ++++---
 fs/f2fs/super.c                    | 38 +++++++++++++++++++++++++++++-
 fs/f2fs/sysfs.c                    | 16 +++++++++----
 7 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 220f3e0d3f55..12a04d7cd634 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -351,6 +351,12 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
 			 data block update frequency of the extent per inode, in
 			 order to provide better temperature hints for data block
 			 allocation.
+hot_data_age_threshold=%u	 When age_extent_cache is on, it controls the age
+			 threshold to indicate the data blocks as hot. By default it was
+			 initialized as 262144 blocks(equals to 1GB).
+warm_data_age_threshold=%u	 When age_extent_cache is on, it controls the age
+			 threshold to indicate the data blocks as warm. By default it was
+			 initialized as 2621440 blocks(equals to 10GB).
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8f1ef742551f..5bf9c1ed7a2f 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -62,6 +62,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_DEBUG_FS
 static void update_general_status(struct f2fs_sb_info *sbi)
 {
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	int i;
@@ -89,7 +90,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->hit_total[EX_READ] += si->hit_largest;
 
 	/* block age extent_cache only */
-	si->allocated_data_blocks = atomic64_read(&sbi->allocated_data_blocks);
+	si->allocated_data_blocks = atomic64_read(&fai->allocated_data_blocks);
 
 	/* validation check of the segment numbers */
 	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 2fc675c45606..601659714aa9 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -883,9 +883,10 @@ static unsigned long long __calculate_block_age(unsigned long long new,
 static int __get_new_block_age(struct inode *inode, struct extent_info *ei)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
 	loff_t f_size = i_size_read(inode);
 	unsigned long long cur_blocks =
-				atomic64_read(&sbi->allocated_data_blocks);
+				atomic64_read(&fai->allocated_data_blocks);
 
 	/*
 	 * When I/O is not aligned to a PAGE_SIZE, update will happen to the last
@@ -1216,13 +1217,18 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
 
 void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
 {
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
+
 	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
 	__init_extent_tree_info(&sbi->extent_tree[EX_BLOCK_AGE]);
 
 	/* initialize for block age extents */
-	atomic64_set(&sbi->allocated_data_blocks, 0);
-	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
-	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
+	atomic64_set(&fai->allocated_data_blocks, 0);
+
+	if (!fai->hot_data_age_threshold)
+		fai->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
+	if (!fai->warm_data_age_threshold)
+		fai->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
 }
 
 int __init f2fs_create_extent_cache(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eb71edcf70de..32a0bf2977bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -64,6 +64,12 @@ enum {
 	FAULT_MAX,
 };
 
+struct f2fs_age_extent_info {
+	atomic64_t allocated_data_blocks;		/* for block age extent_cache */
+	unsigned int hot_data_age_threshold;	/* The threshold used for hot data seperation*/
+	unsigned int warm_data_age_threshold;	/* The threshold used for warm data seperation*/
+};
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define F2FS_ALL_FAULT_TYPE		((1 << FAULT_MAX) - 1)
 
@@ -148,6 +154,7 @@ struct f2fs_mount_info {
 	kgid_t s_resgid;		/* reserved blocks for gid */
 	int active_logs;		/* # of active logs */
 	int inline_xattr_size;		/* inline xattr size */
+	struct f2fs_age_extent_info age_info;	/* For block age extent */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	struct f2fs_fault_info fault_info;	/* For fault injection */
 #endif
@@ -173,6 +180,8 @@ struct f2fs_mount_info {
 					 * unusable when disabling checkpoint
 					 */
 
+	/* For block age extent_cache */
+
 	/* For compression */
 	unsigned char compress_algorithm;	/* algorithm type */
 	unsigned char compress_log_size;	/* cluster log size */
@@ -1674,11 +1683,6 @@ struct f2fs_sb_info {
 
 	/* for extent tree cache */
 	struct extent_tree_info extent_tree[NR_EXTENT_CACHES];
-	atomic64_t allocated_data_blocks;	/* for block age extent_cache */
-
-	/* The threshold used for hot and warm data seperation*/
-	unsigned int hot_data_age_threshold;
-	unsigned int warm_data_age_threshold;
 
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dee712f7225f..c9b779fd7041 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3159,14 +3159,15 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
 static int __get_age_segment_type(struct inode *inode, pgoff_t pgofs)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
 	struct extent_info ei;
 
 	if (f2fs_lookup_age_extent_cache(inode, pgofs, &ei)) {
 		if (!ei.age)
 			return NO_CHECK_TYPE;
-		if (ei.age <= sbi->hot_data_age_threshold)
+		if (ei.age <= fai->hot_data_age_threshold)
 			return CURSEG_HOT_DATA;
-		if (ei.age <= sbi->warm_data_age_threshold)
+		if (ei.age <= fai->warm_data_age_threshold)
 			return CURSEG_WARM_DATA;
 		return CURSEG_COLD_DATA;
 	}
@@ -3242,6 +3243,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		struct f2fs_summary *sum, int type,
 		struct f2fs_io_info *fio)
 {
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned long long old_mtime;
@@ -3316,7 +3318,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
 
 	if (IS_DATASEG(type))
-		atomic64_inc(&sbi->allocated_data_blocks);
+		atomic64_inc(&fai->allocated_data_blocks);
 
 	up_write(&sit_i->sentry_lock);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5bdab376b852..feea2006b070 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -164,6 +164,8 @@ enum {
 	Opt_discard_unit,
 	Opt_memory_mode,
 	Opt_age_extent_cache,
+	Opt_hot_data_age_threshold,
+	Opt_warm_data_age_threshold,
 	Opt_err,
 };
 
@@ -243,6 +245,8 @@ static match_table_t f2fs_tokens = {
 	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
+	{Opt_hot_data_age_threshold, "hot_data_age_threshold=%u"},
+	{Opt_warm_data_age_threshold, "warm_data_age_threshold=%u"},
 	{Opt_err, NULL},
 };
 
@@ -658,6 +662,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 static int parse_options(struct super_block *sb, char *options, bool is_remount)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
 	substring_t args[MAX_OPT_ARGS];
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
@@ -1262,6 +1267,32 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_age_extent_cache:
 			set_opt(sbi, AGE_EXTENT_CACHE);
 			break;
+		case Opt_hot_data_age_threshold:
+			if (!test_opt(sbi, AGE_EXTENT_CACHE)) {
+				f2fs_info(sbi, "age extent options not enabled");
+				break;
+			}
+			if (args->from && match_int(args, &arg))
+				return -EINVAL;
+			if (arg == 0 || arg > DEF_HOT_DATA_AGE_THRESHOLD) {
+				f2fs_err(sbi, "hot data age threshold is out of range");
+				return -EINVAL;
+			}
+			fai->hot_data_age_threshold = arg;
+			break;
+		case Opt_warm_data_age_threshold:
+			if (!test_opt(sbi, AGE_EXTENT_CACHE)) {
+				f2fs_info(sbi, "age extent options not enabled");
+				break;
+			}
+			if (args->from && match_int(args, &arg))
+				return -EINVAL;
+			if (arg == 0 || arg > DEF_WARM_DATA_AGE_THRESHOLD) {
+				f2fs_err(sbi, "warm data age threshold is out of range");
+				return -EINVAL;
+			}
+			fai->warm_data_age_threshold = arg;
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1963,8 +1994,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",read_extent_cache");
 	else
 		seq_puts(seq, ",no_read_extent_cache");
-	if (test_opt(sbi, AGE_EXTENT_CACHE))
+	if (test_opt(sbi, AGE_EXTENT_CACHE)) {
+		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
+
 		seq_puts(seq, ",age_extent_cache");
+		seq_printf(seq, ",hot_data_age_threshold=%u", fai->hot_data_age_threshold);
+		seq_printf(seq, ",warm_data_age_threshold=%u", fai->warm_data_age_threshold);
+	}
 	if (test_opt(sbi, DATA_FLUSH))
 		seq_puts(seq, ",data_flush");
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2ab215110596..5b8e08aff0a6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -36,6 +36,7 @@ enum {
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
 	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
 #endif
+	AGE_EXTENT_INFO,	/* struct f2fs_age_extent_info */
 	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
 	CPRC_INFO,	/* struct ckpt_req_control */
 	ATGC_INFO,	/* struct atgc_management */
@@ -81,6 +82,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 					struct_type == FAULT_INFO_TYPE)
 		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
 #endif
+	else if (struct_type == AGE_EXTENT_INFO)
+		return (unsigned char *)&F2FS_OPTION(sbi).age_info;
 #ifdef CONFIG_F2FS_STAT_FS
 	else if (struct_type == STAT_INFO)
 		return (unsigned char *)F2FS_STAT(sbi);
@@ -669,7 +672,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
-		if (t == 0 || t >= sbi->warm_data_age_threshold)
+		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
+
+		if (t == 0 || t >= fai->warm_data_age_threshold)
 			return -EINVAL;
 		if (t == *ui)
 			return count;
@@ -678,7 +683,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
-		if (t == 0 || t <= sbi->hot_data_age_threshold)
+		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
+
+		if (t == 0 || t <= fai->hot_data_age_threshold)
 			return -EINVAL;
 		if (t == *ui)
 			return count;
@@ -942,8 +949,9 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_bl
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
 
 /* For block age extent cache */
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
+F2FS_RW_ATTR(AGE_EXTENT_INFO, f2fs_age_extent_info, hot_data_age_threshold, hot_data_age_threshold);
+F2FS_RW_ATTR(AGE_EXTENT_INFO, f2fs_age_extent_info, warm_data_age_threshold,
+							warm_data_age_threshold);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
