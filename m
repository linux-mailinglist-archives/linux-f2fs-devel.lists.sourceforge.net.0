Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95A7A19C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Sep 2023 10:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qh4dV-0004bV-Dj;
	Fri, 15 Sep 2023 08:57:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qh4dT-0004bN-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vcg/BlOPPLSVDdAueTKxRQ7L+trTouB4xRipa78SnFE=; b=YtOQEJb1/O2gDP556j5AaCPowL
 Y1KXUiIch/nvnAEYoG6+mPDKTjqMztymaouP/2HNW5GEcEVDufQN3PJgMRskwh8558dez7rVa7YRY
 b9YNvvIMcgjDByeR9nKppHrdG3zDE/KxnXLw1btnHF1PWQqKdwklYpY7kgW8jtpGEHqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vcg/BlOPPLSVDdAueTKxRQ7L+trTouB4xRipa78SnFE=; b=bFRVIbH3bic1dPM22aY4XgvipK
 /tZLj/BH5INeqn6LU3nK2vhop2gTle7tkODXAymd4phzNHTYewqxiZrHnHj3bAKQTfJRAuNKb2bTW
 cmdD7mze5snqBONauXoisYFQYvDIiTHdlLeFBOT6XRtJZPttzqi1E/QJOafr1D9J8UEE=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qh4dQ-0076BY-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkchxKDCNVIU5ImrjFEOK5HZOsu+BeRaT5RyMfNctyh1+oNpRZxxQF9LBHZZYcINsotYdlz5lgl0O2CUMW37FQSeal92rC4ICHQBmd8CMitLJiPnFiYyg7j6GZBieC6+m6+qMljvN0sU2cTzm15QBszo2ByOIk7WD99i4QTz5BL7lXd2HBtkOj960ELnkFcC296i+EB8v77UnzZu1tjFnfhGoXec7sshCTBSXZ6EhAbuCyJ7ciTEkTY2mxS9+7sPPp+BrqnggJ3w69rUlMlwWdfNoSshOUG8DyPaPFfRSR5he15MuWjc7SYWgb8psmuLoLWGQIB70wzvy8wtDfX7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcg/BlOPPLSVDdAueTKxRQ7L+trTouB4xRipa78SnFE=;
 b=lEoPN+9pYnADlqiXM4T5DOXuzbLbS1xhvEe57yJD+jhOG1xXNTv896R4RbbHsmqtLZqGt+UG3Y6wVEDRF08drK6kYFOYGEl9OlnnGSyNz3oyccQPEJAuUhwsmXyKYSPiiOHhBVuOW0+aoNfc/5hfeFq5jRjDlq3WIFlUNZwhlcDrVBTXdbFj2wJ6Cb+D/AABmgbXKlBnmAjSvLgGCOjLApPn5Ou4UfNLVWXUdRDrKN1rGkn841bbP9DGYic9ld3Izw3ZWZ6U8JkAFbOAz/NIbNOk08MV/m7VcZ/wyC8IjA1lrEYApu+WwWTWA8i2MlIPxNIldBseS5Hr1BNq/BokiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcg/BlOPPLSVDdAueTKxRQ7L+trTouB4xRipa78SnFE=;
 b=ZeRKkKAFZ7zVeObisxjJD4vn0vXtO7Y+sTC0gmfVoU79mtP6LWxT8CNyzyMlIYLPsToQgl5ftGkD4Y8Y2FUoxEPfSk9vYx7dNIsbcQn0DH51L1eQ3bL/3egiMcC6G6XnJNwMjZq1sgY+kM1aC8tUzWP5PL1sPImCj4BdKzJtiHBHR3gEfqZihkVbrfuVexjO06D8U4zy2nbDxYs99oKGmEfFDMWm/vbV7ihFB2CUCnr27pyAhg/XocjlDUgB8aWnHh1AeBpw0GCxwHSR8y+VDPV8BhZhXie1M8XmjeLzEyAnWdJtU3UfadurZr3kgTPui493Fl6HJJ+xGJAU16GbYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYSPR06MB6693.apcprd06.prod.outlook.com (2603:1096:400:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 08:56:58 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 08:56:58 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 15 Sep 2023 03:04:43 -0600
Message-Id: <cc15b558e202197a424323e44ccece7bbb807434.1694768423.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694768423.git.bo.wu@vivo.com>
References: <cover.1694768423.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYSPR06MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: c0747da3-5774-4146-4ead-08dbb5c9b7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDep9s4cz8Vnm/hBKJ8k6Em3wpm3xErr1vXUjADDHTHKdE07EjBA3f4JLvrrxobhMzT6OFxL/rW6hghnroDMV0+7ecDMB/ImwFDrW63GB42RrMKj8F2fbmFC8nnpWkatQilZbXS8Kt9ZZF8Wcb3wCrSPJujssyscvsRz+qb4ScdiKt9HmCU9q6SkBvxoC5E8CIAlVjsQxbWcEISvzG9sT+NDsxc60IX9HODiDZbkVsia89dbZN8oQXF4y/GqmGJrN/b9fI9BsK7mM557+OWfT6A54rvgMVGFK8e+BJtZItJt7ztLDY80QpZUWtl//qDlvDtpJW2ezc1MZmSw3EnbceWXV1LAfhXV5h0FUzHiynG2BvhwK4YojxZjAcVSNYnhY/2QXBw/I6sfZirc3PQUOD1fQWXeaJ9SspSrrS+u9vDBmY0spueVdpVUvVh6qXtwCNmu/APCPi3hcOLavDP1KR9DOG7oA+5oKOyUWYk90v7q95JC9roKrgVHlWk94Exv2zLfooy7eGSHrf3M4JUIrwfuzuroxizW+Yv4pNP48Bob/ZtfiXjZXVWx+/faRM9XW7ynQsFWePzDjMU7dbWjRyrQ6YYdIqfWKUd+UB/9vrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(86362001)(83380400001)(6512007)(2906002)(2616005)(26005)(107886003)(6666004)(6506007)(6486002)(52116002)(478600001)(38350700002)(54906003)(66556008)(66476007)(66946007)(316002)(36756003)(38100700002)(5660300002)(41300700001)(110136005)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ccbJoqBl9HyBZEdg9ETGbxgR14ylGPuRl3b8WDXznABf3HLD90QYi4j44aOi?=
 =?us-ascii?Q?Ta9cuNFegvV3exdnEMagsYkikGj5IbQthYarXtvstsuhZkvsYr9VPoEvmoyc?=
 =?us-ascii?Q?FVjM1No3dti/14EJsTvLOKC7z0TX3UhamhSXvgwr7fKKMo0GQcIRkY4Jjmrz?=
 =?us-ascii?Q?3fHQS0yf7EimUar+xM4NQkoMMIJJeHUoGDrkknq22j5BbdFbCHnSGIsAx+dt?=
 =?us-ascii?Q?hlXCk+TXWiGff1Zm5Go7L+fiKexbZzLqxtMU7LpgJMnXxFyBTD5uID+uFLBj?=
 =?us-ascii?Q?xqHArqWgJCusmFjs27QYEYcnUlHuWB3QKUeeGgLXnQCBze7LKCB55CDigIl1?=
 =?us-ascii?Q?WGG62nV4MPUfz5xF2Cgz1ofrfAYDBqnfCSJp/c27XBPTXgYUTGIMOfALdzIk?=
 =?us-ascii?Q?DXTET6lcPD9M8/rHVVVLEi70xen75BS7mOqkwDbATyltLfp5gH+N0dO1pSOJ?=
 =?us-ascii?Q?LDre6KuHcA6fTeJbSf53sBepCNGlCv75CrSsMGOZkZ862vkZiw+R22Imy/sl?=
 =?us-ascii?Q?rEUUGs0QNbXkz0h+xSLNuprxyWLrO4SUtWSYbkqNHnWASP7PzMtwpqpJUsse?=
 =?us-ascii?Q?doTHd5eQZ1itzhRlb7cnbw7RnuTewXkd7CG1sAQlvYYtiIdzjr/TkMWNrL92?=
 =?us-ascii?Q?RVYuj71WfFEyirZ/1k2BEedEruNkQqYVJPXsntXcQU+VtuPU3gWbUFlq2+jj?=
 =?us-ascii?Q?5XVBF6k04epwmlyRilB5sBxz1BKT9CSVXb2hX1l3q7dq2bzxTIlWFFcQhsR8?=
 =?us-ascii?Q?w4ZMAC4CmdzyO76Ps4TB0K4jaNvuCqOT584Y9pVM50zZPxTRFE4/JIXsXRyx?=
 =?us-ascii?Q?TQlWexZ2aVBPdpjspRQd55ds3zGEqMaaPt4Ve5u0McRgFimpDQIDGRdxBIM6?=
 =?us-ascii?Q?meDwfcDEG6s0UG+vSXiOUdI77hZ/wcN7gI9UWWrVco5YXZEvoxitIeBInO1W?=
 =?us-ascii?Q?bUVmqYuRtXmTWUhS52uF1o9rF3SI/0v0YYLcnVPoGaVVreGNujyPaj22IUGs?=
 =?us-ascii?Q?z7R95rkhfsuikBJK33+Vr+pPl82qiGg5IXeX2p/8BUZVJBwk8mKW2Z36RRvf?=
 =?us-ascii?Q?OfB9yh8Tt8Vn2Z/SERIt0cr1UBhPBzQZBMDKmhx/OLN7IMdQ7uPuwBUX1Dj3?=
 =?us-ascii?Q?0CwzbnnXzy8tbhthXxA5rCJ45zFwK6Y9eZ3VpPjFf7pAfuW3g4qRCBBF4oCo?=
 =?us-ascii?Q?7+GjEmGZDMBuWCQVOMoL/y3qju6g7+SoBWNoLX9HpTkOTon6Q5UCs4NRuskM?=
 =?us-ascii?Q?7cYwaRK3efc5A8gz+XPbjqmyP/iGn6kvvU43uUpdX7bAupquW0b1Sm5Bt938?=
 =?us-ascii?Q?LGoEffRpX4thBq86Gw6pTPqWq+2ZNmre13c7hfXFFcoskkKlxmXtVAGTfgwI?=
 =?us-ascii?Q?hHuFrgL4pjyRguZmZpPVHnjC2i5Ff6858mpHls3lpWbKHfeYRf9NyTnougjs?=
 =?us-ascii?Q?oSJb53knUirlwZfVKNP85puhNZKKYuXYF9190pds8edugTVpfL4NBhbMaT8j?=
 =?us-ascii?Q?berIGxBjlhBdjHTqjsJe9My6s/PGhdbRJGnUYR5STtqjT9mLwER2eK/uerV/?=
 =?us-ascii?Q?fcK/CvyLhXnJkdR9h2hZNLWPulQvc8JqkVfh0PCs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0747da3-5774-4146-4ead-08dbb5c9b7ba
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 08:56:58.0578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +36JMx35Cyonmjiya/ekLUHkRoLJaXvi/uBR+s0uGxOaZOKGDUdCtXyovEEBwjaF9zi46qn+vXDO0jcslB30Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6693
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use IS_CUR_SEGNO() here can make code more concise and
 readable.
 --- fsck/mount.c | 17 ++++ 1 file changed, 4 insertions(+), 13 deletions(-)
 diff --git a/fsck/mount.c b/fsck/mount.c index df0314d..00940b8 100644 ---
 a/fsck/mount.c +++ b/fsck/mount.c @@ -2531, 20 +2531,
 11 @@ void build_sit_area_bitmap(struct
 f2fs_sb_info *sbi) memcpy(ptr, se [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qh4dQ-0076BY-Pr
Subject: [f2fs-dev] [PATCH 1/3] f2fs-tools: use 'IS_CUR_SEGNO()' to check if
 it is current segment
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use IS_CUR_SEGNO() here can make code more concise and readable.
---
 fsck/mount.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..00940b8 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2531,20 +2531,11 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
 		memcpy(ptr, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
 		ptr += SIT_VBLOCK_MAP_SIZE;
 
-		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
-			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[1]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_node_segno[2]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[2]) == segno) {
-				continue;
-			} else {
-				free_segs++;
-			}
-		} else {
+		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno) &&
+				!IS_CUR_SEGNO(sbi, segno))
+			free_segs++;
+		else
 			sum_vblocks += se->valid_blocks;
-		}
 	}
 	fsck->chk.sit_valid_blocks = sum_vblocks;
 	fsck->chk.sit_free_segs = free_segs;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
