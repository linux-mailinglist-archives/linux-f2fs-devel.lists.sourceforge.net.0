Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C737C6BFFE3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Mar 2023 08:52:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pdnpg-0003N4-L1;
	Sun, 19 Mar 2023 07:52:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pdnpe-0003Mx-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 07:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUWwBkzOfM1kB3c/5VYdcEvnLFhDOME4sOKTv0gGYpM=; b=lv0IPTuryLi/RB9t0LFFkIaKYO
 YlFI808y6YT6Vr33VIKhOneW6R9UK7iBAjpnIuwrvtFHicuR4Baig6ewJ0FrSU9x6+FZHKn4Le1Tn
 y9H1vLnF73FhTIFcD5MQO9e5fW0ZtGdRKpowiNHOaOT+uCsSk7WmR3RGTOYIz+07Q5zM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VUWwBkzOfM1kB3c/5VYdcEvnLFhDOME4sOKTv0gGYpM=; b=W
 kXf0wUwOe6qYJ6Zw5f6KVfl6MaqPgKp2ai8NhK1ii4RucHQgc58GdxSKdz3/bpCcgntKFFQdvBCTq
 Ow2GrCGyjAJCRPP5DqCkvSEetSUkVArYPqSxITpEndQaGQzlaEmGPWLk2sJ8U2Nnvo6jJKqRrLddE
 I2aL05XAqlae0OQ4=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pdnpb-00DJkh-EC for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 07:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbAONHybI8u8v5fs7gkwHN6KIARK48us/fwPo6fPtaAhCULkmvnoQx7A8x5FppOzprcfLPEDT1DbQedLJRQoFreI+hcvSe2zk64VNoysTBhsAxM6nciNIyEO0tRvdZmbv8cCFagCoHkAFMxCaGHAVJ58lEIjUUak117Jvi8cUIMQsQFGptLrzjZtX3aOkwMWXPSC2asPUagCNY33PaSI2bI1cpd2GtjqTYEN057OVhN6P/5NCZZW8BGvzikjl1wsvhiIYejn2Ul4jJeyj6oJSG/igs58yM3ZbQzv2f7CV5rwwQiWA8odl1SysFOstRKRLpUKOKcMMwcqpHt8SSx83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUWwBkzOfM1kB3c/5VYdcEvnLFhDOME4sOKTv0gGYpM=;
 b=Mzz6Y50+vsfvbYtIKhnWWqO8yCIU0prZ9fd3WWiq+kHid7SIJWoGgWxgPhisAvLuHKVcdWfOZEyP0P5EFy+XempPFCjBEW7pvIdCjdnh67Wnx0hNVoqAt9GqfQwf5ARmfi9olecP766dAmRQ7d4nlBGnZA0C7bJag6Sp7xbXO9EUIFUN6poSO06g4Rp5lxDL/f8Ai6jy9B4Vf63YxoSKUQxnhb4OcsPi8NAag3/p4Ybcvwo3TjFQXox28NzAOook+3FiHIsXMRzD5sYePEJB2B0qjM980N8ZfVkcAmohfMuWWFsw131V//nujyIU00LMUyq5+VEzmeXHKaQcqP8K3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUWwBkzOfM1kB3c/5VYdcEvnLFhDOME4sOKTv0gGYpM=;
 b=Varn4LiMc1vDpxyVjT19E9aCEdc7uQBeUoORfPLdo921+QdzUqEPOXBRDbdALc3b0RmBm+Mw/nHuUBTQZ55Or19xSspOo9+SXomuFm6Igd5wZu3CEjZVKuRpdaekOndfHSXKenIBuRHlmIEva4svyJlbKlHWVCXJE07BxO1ml6uquQFLNzghPy6nsmuXdqvxuGiBPM2J4jDWvwUlzRAQ+cn35yolZ8N6P2x7ZwoUMU3rhiNz5AeNGRH0wvUZZlKDUQtmXMgAy8YEswD4vu2D6nmzs3hp/BxIM5Bx82AKaYqFd7rLu2tlF/KqWD8skoFsKDgWFjMUn5idEnx6msSbRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5626.apcprd06.prod.outlook.com (2603:1096:400:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Sun, 19 Mar
 2023 07:51:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 07:51:45 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 19 Mar 2023 15:51:30 +0800
Message-Id: <20230319075130.24962-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0074.apcprd02.prod.outlook.com
 (2603:1096:4:90::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: a36a097b-f488-46c7-f941-08db284ec8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRI9grBx3OlfcClQONykPGfF/kkEyaEQV095ERTsdlfdZ+VpJuRAAeWx71UfEyUfJsXIHz6YvLkgWNAqaRlgG2pbEsztNAuR6F27Ou1icS8khRlunsdufKe4Htau17xoVCuWZHi5w9pvANcLfu5lC52rg52AHK3OxbIe+ItlEf3mdMW59VTIaK0bWNT9FRiHdoZkW69BOEBAKovGD402JAvkeznIj76XG1boBvrE7YToLHs1f78WfJmAc5OglxL5KLbK26kvx084hMDM+QNcY6Ohk0XpsN4rxRpuUvDPH3oWrZmz2HoALvakJuSSVH2uNlLQcPrjCXhftkuNvet0nAY7VLidJC/1qhwPhn/ujUzSlhMtk8Ibar/NkE3IJk3j+aoWKSFC8LbV/lL7vko54jZIsLfbxICjjx0uZih9aHjJ031awCZ1nQUdE6rkBNiisrfv2nOSbN9keMAVPesZFsMAoZEEWlO2zoInD6fTc7v7SuQJsJYLLGasZ2IDMAQlqs5KSdOUMMSPIX0Tj5+mSYi7Y+VXE74vZUKOsH9THJTgKFPN2aDoRy4OFYCTFVEimQWmAAGXWnYLHeGILYmh6x1IK9sjdY7Zwk67SYL31VH84Dx6D6P7/ZegvKcijX7QKwkppBgU8QVJlKf1xxWe0b0YtOCnGIiv6c1FwccVSUi5B7c0l3VOLjprcwuz4kQLDwWdkiwVd5YrYiwRcKQ6Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39850400004)(346002)(366004)(451199018)(316002)(110136005)(66556008)(66946007)(66476007)(478600001)(4326008)(41300700001)(8936002)(5660300002)(8676002)(36756003)(86362001)(52116002)(6512007)(1076003)(6506007)(6486002)(186003)(26005)(6666004)(2616005)(2906002)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZbjM4SqKlKfA2PXX9Cd/4DxchugUhbsuRLWn2h9c7i32OlfsCiVR+gx80BZD?=
 =?us-ascii?Q?MPYpvPAmt3d5VGpsguXhxFhAIxFXrYccdB+0miH18E/o9+AKWUPhTX09dWuH?=
 =?us-ascii?Q?86/nt5m6yeDFSIPnCjrKm1qac+I6XAqntYD+Iishu9i7Nat9yWfkrE5v1lg3?=
 =?us-ascii?Q?wNrWRvJ+3Szxy2cGjRWv2E5i1o7x5IpGOWNDQzQU6e609sYXeRqp5qNSSdrp?=
 =?us-ascii?Q?KH3ADGgbX0VL+k9OxVeh5fwJxumgcnrjf5QqHVcq7zLFoOYAtWsxw3J5giyV?=
 =?us-ascii?Q?AMe1gN6zNqTmSPTa4Xb7TXt6THvhn1MeLRSkmi47zfse1o4Tj+XnKvlnrJzm?=
 =?us-ascii?Q?zNxIi+OCwkdzpRE5qb1LkM1DsOY7G17OAOOK91oeqS9lNvf4KZUScm/ZMFJS?=
 =?us-ascii?Q?NTFs+LLpKhZ5/AedgRJTZ4NgRApCLc90TJa+ozQLAm27NMdqAaAddHwIZUWy?=
 =?us-ascii?Q?SRqOJtZvHO6YWfCDfIV8UGX7CjusxjA+If4GSpSDyXkkPcCeA14dW2LB/4UG?=
 =?us-ascii?Q?BiBC/O6QXR82dj75kRos0uk1/VkWa6kCzUK2iVbmeQ/n04l9Gqia/aFYBjlt?=
 =?us-ascii?Q?zO9htz+Md7D+OMtYuCVnguBN85L4oDn/z7ddlzi1Tl9ZzF8suLt0aP4dYRGo?=
 =?us-ascii?Q?X9ccuuJuvwm1DcdMxl7NqUhyYiplj5Xujip9Zrxm7cXqCeEKiKTMtye2XWpO?=
 =?us-ascii?Q?7xNHPWVdQCdH5kmMqzUCoIgfyv/OHCT71Z2ZDwT8oQ7JNzvkl3dgihgEovIu?=
 =?us-ascii?Q?u7WbhaEv3ayQR1uDZSuFztOtlXgnoby/e84+KH+R6kOXIP6DqZKQ8EOqwzS3?=
 =?us-ascii?Q?Naq4mfgJw4IA/lsLN3HPOnmp9cBgCItp7Rd2mWB3+KKyF12Bd9Wx3EyySE3o?=
 =?us-ascii?Q?n9BMDtWi5ra258ZI9FlGruzPB2Jo4+0RbtSNZ9i5ENFvSMrlMwCPIxmMmHX/?=
 =?us-ascii?Q?oWOpDh5AoZ7TkhnxXHYencrFH3+oPNqyT0uwj1B2rIw5vmmUwrp4QfU+mamv?=
 =?us-ascii?Q?pOosKE0WbwM2LRsa0f16IIjPN2lZYSlZNlS0xADMd7RLwXidq8Tw3LO+KA2C?=
 =?us-ascii?Q?b2NIuqeeaf8dCekpb1VVwavKx4Bzo3bsqh5b4hLvDqKkpSuATT5RHigQA5j9?=
 =?us-ascii?Q?iCbVLQT9T43NSR14zj2iQdrQsNQhJaTbmwk1X434cjHUKrMMYEGZi11lWlo+?=
 =?us-ascii?Q?1cYX1l6Mjp0hRNwTAI8o5tcSNLFvVPHgCU+aIdbBM/8nXmpyiwV9v0CtzNAG?=
 =?us-ascii?Q?AFqFC5xP5CAGi8qyLjzB7rPB+2uP4c0mCkIsGHR+w5JL7axFIQhJBTZ5KIR3?=
 =?us-ascii?Q?2j54RhGE90ITBTTaoCvmkWOj8M3oN4hIFWGOyv1oe3J3He/8RStLrb4EX/ie?=
 =?us-ascii?Q?BI+aK43+h8oibRPBhqwztITHsgHqgoyrnwgVm4a3oQOo2N5qpFR9DXBLqeoW?=
 =?us-ascii?Q?5ms+/d9+jn4yEbQ48iZ6y28wlW5i39i99k0EG3nnGD1YXsuV/njGeUrwI72A?=
 =?us-ascii?Q?J8JYCpBAZ0RUfbFwFZU6Vohi6VV2y7eFaOX5Lnex518AeTYSodf+lMd2pNJp?=
 =?us-ascii?Q?V3YpqZhx53FnkxhanuWQqGBp3fl8sfmIzYqFy6AI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36a097b-f488-46c7-f941-08db284ec8e7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2023 07:51:44.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSRP7/uUvfg1JwTS0F8rZ8p+lPhZBZAkMFfc0ruvFX28gsjpGxyPN/qFF4TZbBy7helu6ABKXFdb9PCx9Evxtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5626
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
 lack the necessary check to see if the image supports compression, let's
 add it. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -drop
 f2fs_mount_opt_need_skip()
 fs/f2fs/super.c | 12 ++++++++++++ 1 file changed, 12 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pdnpb-00DJkh-EC
Subject: [f2fs-dev] [PATCH v2] f2fs: add compression feature check for all
 compress mount opt
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

Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
lack the necessary check to see if the image supports compression,
let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-drop f2fs_mount_opt_need_skip()
 fs/f2fs/super.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9c87d91df61b..a88706bbfc0d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1179,9 +1179,17 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			kfree(name);
 			break;
 		case Opt_compress_chksum:
+			if (!f2fs_sb_has_compression(sbi)) {
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
+			}
 			F2FS_OPTION(sbi).compress_chksum = true;
 			break;
 		case Opt_compress_mode:
+			if (!f2fs_sb_has_compression(sbi)) {
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
+			}
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
@@ -1196,6 +1204,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			kfree(name);
 			break;
 		case Opt_compress_cache:
+			if (!f2fs_sb_has_compression(sbi)) {
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
+			}
 			set_opt(sbi, COMPRESS_CACHE);
 			break;
 #else
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
