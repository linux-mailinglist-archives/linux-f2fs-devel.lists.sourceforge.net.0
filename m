Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A76E12F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 19:00:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pn0Iu-0001CF-Ma;
	Thu, 13 Apr 2023 17:00:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pn0It-0001C8-B8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 17:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIy2/Ql2VbmGn5JLo7/7JEGdi3FIBsu/zp0wLdA/Alc=; b=JFRqdhovkiUWt3VJLcv7LJ4DeT
 usSRHitNZf5CC1olyHYrpDMS4hg4BRLS0Ybeek2H//2IUGb5DQrQmy3VtNnpk6AssU8zcJEARZI9J
 yhJgi0pOHVsyNylbuePT49pW+zWp3o/zPfA44G2QEz4ajQtPUKzYKrPzACST24CLi4lQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KIy2/Ql2VbmGn5JLo7/7JEGdi3FIBsu/zp0wLdA/Alc=; b=P
 SjKZfTQrmtCL6A6s5/pFw0FsXR3J9UZ3RwLHyGCwOQ8YDApCreZAzsarphLCPhoIPXApYw6IG7ohD
 AJwFJ8UNoBTh2kTJ/TIdjLn/whP6FSC4W+hYiLK24QXiDq8msC5Teh4wBnC1dTdvgagNYlkZ3HK+q
 VkxjnigeEUAaODe0=;
Received: from mail-psaapc01on2123.outbound.protection.outlook.com
 ([40.107.255.123] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pn0Ir-0000Cg-Um for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 17:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt73Ordig8I2fmxH8O0icn2ikuw2rGJsUpKYk+ZWZEGoY2fuNH6p82Wo4oj3OZbbeWPA6WOYPEdJZhKO9Ia7D/z2l/UCCtmeWxpbA44cIAVNbM7oq5NlYv3syT+BF/RN/WGThXFOZpXp+L9WsvAHUpdiiLoLNzXSxUWzpezpeSFNtKGheX0SwK0ciSskf1STD94s9v+GbFsgcjTPc93VT5810gRI3h8nlaybVvPidVFrsb0skRPn7ewJk3taAHSi6yj58k93QjJEskYMdv/et3MkyegF93G9xPM888eaa4p7f/l4VdNJqw9HEgN+R6jhXBhNGVRDfQ8j620CxyjMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIy2/Ql2VbmGn5JLo7/7JEGdi3FIBsu/zp0wLdA/Alc=;
 b=a61M/7NkfWweWNlvK5XJznJ9qfA1LaaShkyU+89y1EZakuh/FN+3WXEP12VnEIiSQAnxzyQR8vdfi5kQlqXV1xPnlL8k9e2U4CR9Wf9F9Jr6M1YctiPhe9PdoA6g2l8j76A35UUNpLE8ns/5ob2U0/kd2s0OIux0HcgovhJcarVREeQc3UlPhA7f2mtA1H5H+57+mL4M4tZaOJBsqQlxeypvlkiAzxX9QvKEtBunAnPXP8bn1mJ2l3wokzbmWybCuFPbJiV1obCU7Bizuyn3h9PU8i3VqmCRGSPvXH//f9c3zHt0ob3pacLptUOzOi6GCxJIbLRRVnZD97ZcYRPR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIy2/Ql2VbmGn5JLo7/7JEGdi3FIBsu/zp0wLdA/Alc=;
 b=V74WlcxP36vDBl+aUvk356vZuVMP/GX7PO7kBDsXz3VEf/C6veqMeARJwXn881HKDgqyDpjM1ZX4YIPgZxpNdxNf+VCAzEFlWAE86khbgWhrt3QRn4SEQoRtXxI3prdwUGWSW7+Sezyqlf1FKQ9uaWLad19u0MVyETFoV+AR5ASvMqA/Gq1qd8rqNaYek/zwNqMDwPjkDLG1rwrLeKmTWc9fM1LXaopSD3thf/1llVZ1s6BM6ak5V5Oqby7tY5QavMG9yCiLa4V70h2WN37qIfrsJ0Qicdrf6D4nSjiIimD4Mu5VoKyhKdUdvOMHoXzJnHq4hvnH6MHLdriDu9aA+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Thu, 13 Apr
 2023 17:00:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 17:00:01 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 14 Apr 2023 00:59:51 +0800
Message-Id: <20230413165951.54051-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e58605-5212-4402-d8d1-08db3c408554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Byv/3yeKOQ/GasG3lFGKB4f2G/0zMClEJWfnw5rmZGF9FxWrq8yypDGeoUdtd3duvuGGXXtBWHniKGzpUKyeDYtZo8mKU5hCjZRe0Zx8ApLqYSUqHghh59UEcvC6W0AnDeG/ojLruM3W/Q2Mj7qB9tBRep+1e3cKQPGW6zJ4HJDPG7rufIGGl//an7zs/22Qbr8jZVbmHBSGilqJ5fOQFImM5+Rlfd3qFkOazPhG7KnNHkgqoGsXUnbD3D6oWZlL7FhuEhs5QnZLXL1Y3bJXH84y10c0oiV9gBs1WRdfiqxCWgb/HkGPNx71lPabskmHpop9gPvTBrubJB4p5m3yGyL5vHS0nwA8g2zck32frd2eNYZuFIxapDqSgTkR1bGC7Ih/Kai9IhLdP/ihgX+s7RcE+b1qAFhu4EHW/LoYrpzRhieri45rf9tqJ3xlvljOLOh65zpfegZE7xq1rmyVH7PX9VNwJJxXEEopbf6flABAkQCBjjDGDN3F9rQRN0BusPenEGDTgGjmzP4RhwjA17MP1IxPOMbDsg6n+8CUTYYVu6VTDRO6eQEhqGLzaZkq347qH2pjpswq/M56Rud/hb5Ci1a4nYLLq+Hm2giX+CagiUv2COP3bebYD4n93ks8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(316002)(6506007)(1076003)(86362001)(186003)(6512007)(83380400001)(2616005)(36756003)(26005)(110136005)(6486002)(478600001)(52116002)(6666004)(4326008)(66476007)(2906002)(8676002)(41300700001)(8936002)(66946007)(66556008)(5660300002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPjYlz1nNKdq2nv0gPIs74X3554UGJlopip/m/QRgv6irXLufzZG7yyWxTaX?=
 =?us-ascii?Q?PNktS0D2SksRVRu/pHGVCnJF88JA8xoldJZcatm39e2hT4jWKvAyWS/X01an?=
 =?us-ascii?Q?9/qV3UylV8Xda2v7uErwqlYfB2CXbnx10WeoF2ejfp5w//Mmwsa027VJc1Gs?=
 =?us-ascii?Q?yew5E2u94T9uNQeZxCH3+xthlvR+iOc/ZTm+aUvPsXFxTpk8hyrtjN9/JPsu?=
 =?us-ascii?Q?LomFJX6K5SdJFPKv9HTqrcTJ2dcFu8QIQ9NoJ7sErZNZdq71zRT7jQpo7aoN?=
 =?us-ascii?Q?bIso0X9XB/5bqytKk3CZO2yY6oYZjXdI2F3dJZ4S6jJE3OPDxj+VUvP8ntpN?=
 =?us-ascii?Q?SzIrRFyF2QwdgZXZk5fNQDVw7z3RpwIuBewiLKBSyF/t0OH6HtqzdRG9BCZh?=
 =?us-ascii?Q?Dc/4VlRoXLTFAYizqk+1mhaZO8tSdncOYrP4oC5JLWHAGwR29J61ayYENsPA?=
 =?us-ascii?Q?NOHp1p2CP/Yx38KMQy2b5C4tqzry9i+qPzblCkcHjMEbtBYrFIvjUxgMb5n1?=
 =?us-ascii?Q?v/6NCvJGD9K9Rb0i9XKJk3QqRj/W5oTgr6axRmWah1Q9D5+TrUJqV0G64RYv?=
 =?us-ascii?Q?FsPS3ID58pQjel6pXUHl73uq0P2w5gwRcXvvBkPLxD3RhZwcR6SFVACIWX98?=
 =?us-ascii?Q?mxooJfeOElW6Wk+hDLOlrokY8VRWAou70gqdUfepxT28WQPbxIhoUBU3/H18?=
 =?us-ascii?Q?Xk76m/WDSl7UWT7PAOW6RZqKkUdFQHT5qPrUJiWFhbkYP3K9mBaFmnNkCtAY?=
 =?us-ascii?Q?IkOq3VMIxYiC6CDdhac2aulec+KLqv4EzduwMv4ByDSZSwVqEGhH52zSco4i?=
 =?us-ascii?Q?1dKxKlHwemO6d5p5lb9qY08DjlHOqgXeOb0I72OZewSzVYNNM2tYqIexM3+z?=
 =?us-ascii?Q?T6b2FBO7noh3svdqbJQmJqkMp+YA6Qzid7xxuQTfcXYWGERvFKW5law5Z/gG?=
 =?us-ascii?Q?f0XhKe28CaUjJgpeQZ+9Ta3IIXoOdLZCliSQTIoLt9/efZMEWxwiagVBSg5H?=
 =?us-ascii?Q?el+9AY8A1qcVzfw79cLZsVB2b0fMIZAlV1qdK2FuygaKDkVg+zVkjjawcMrM?=
 =?us-ascii?Q?xmN/NQxvk6Vd4KHzCrUxufjQCuOJM/ycSZj4MAwdpO08k+zbWiEC/oEvsYhs?=
 =?us-ascii?Q?uUtCfedAngKtzre6U2tX1XuuhVx/kOQE5bUyaeVuvr9dJk4G5RFjpcopL5me?=
 =?us-ascii?Q?Ub0amr9A7oxutCXPNpy+/0a36aiiHnHLmsu9usLpMQuXS41cK02z1cbU2baU?=
 =?us-ascii?Q?duCMagctgdfJA6g7Capn8SLaKwkR7L0TlWxeY1ylt/ysbawEELDH8wOYMsjI?=
 =?us-ascii?Q?Y2+V4tTiSlvV/5yUuUbvyjDjeKPOcA36fekgGlG3dzwnWzLEVvAxR8ou1ImK?=
 =?us-ascii?Q?6+7zbyZz+vR00p3khxE8001vLfhHBS2/wB0g8LDhNWz0IFvojBcxSkVM56hN?=
 =?us-ascii?Q?WNK+GRPbjJhlpeM7F9hOJcit4hvVZlbxbMjWIov/B1JCtcKChm5LkTCONLsq?=
 =?us-ascii?Q?OTsmo90kF3GGWCz6/Vc9t/TUiavqQarfEPmBpm+DN6OJTKkiDKS31ZSl+GKB?=
 =?us-ascii?Q?S8E0FUa0VrdNZa4CxgK8gbx6JOp5FiYviHqKCN9U?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e58605-5212-4402-d8d1-08db3c408554
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:00:01.7397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBhJzwYXQDCp1etCwiEsWd+Ql14HhuzQDCYue94MdLbf4HuSPQp9FsKy+qqqgaoCciZX/P+tWnwel+4XKHI/wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Replace !has_not_enough_free_secs w/ has_enough_free_secs.
 BTW avoid nested 'if' statements in f2fs_balance_fs(). Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/gc.c | 2 +- fs/f2fs/segment.c | 43
 ++++++++++++++++++++++
 fs/f2fs/segment.h | 8 +++++++- 3 files changed, 30 insertions(+ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.123 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pn0Ir-0000Cg-Um
Subject: [f2fs-dev] [PATCH] f2fs: add has_enough_free_secs()
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

Replace !has_not_enough_free_secs w/ has_enough_free_secs.
BTW avoid nested 'if' statements in f2fs_balance_fs().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c | 43 ++++++++++++++++++++++---------------------
 fs/f2fs/segment.h |  8 +++++++-
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c748cdfb0501..79a7b4e31672 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1872,7 +1872,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
 	if (gc_control->init_gc_type == FG_GC ||
-	    !has_not_enough_free_secs(sbi,
+	    has_enough_free_secs(sbi,
 				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
 		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
 			goto go_gc_more;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 82430f80c5da..c35476b3c075 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -412,27 +412,28 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	 * We should do GC or end up with checkpoint, if there are so many dirty
 	 * dir/node pages without enough free segments.
 	 */
-	if (has_not_enough_free_secs(sbi, 0, 0)) {
-		if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
-					sbi->gc_thread->f2fs_gc_task) {
-			DEFINE_WAIT(wait);
-
-			prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
-						TASK_UNINTERRUPTIBLE);
-			wake_up(&sbi->gc_thread->gc_wait_queue_head);
-			io_schedule();
-			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
-		} else {
-			struct f2fs_gc_control gc_control = {
-				.victim_segno = NULL_SEGNO,
-				.init_gc_type = BG_GC,
-				.no_bg_gc = true,
-				.should_migrate_blocks = false,
-				.err_gc_skipped = false,
-				.nr_free_secs = 1 };
-			f2fs_down_write(&sbi->gc_lock);
-			f2fs_gc(sbi, &gc_control);
-		}
+	if (has_enough_free_secs(sbi, 0, 0))
+		return;
+
+	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
+				sbi->gc_thread->f2fs_gc_task) {
+		DEFINE_WAIT(wait);
+
+		prepare_to_wait(&sbi->gc_thread->fggc_wq, &wait,
+					TASK_UNINTERRUPTIBLE);
+		wake_up(&sbi->gc_thread->gc_wait_queue_head);
+		io_schedule();
+		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
+	} else {
+		struct f2fs_gc_control gc_control = {
+			.victim_segno = NULL_SEGNO,
+			.init_gc_type = BG_GC,
+			.no_bg_gc = true,
+			.should_migrate_blocks = false,
+			.err_gc_skipped = false,
+			.nr_free_secs = 1 };
+		f2fs_down_write(&sbi->gc_lock);
+		f2fs_gc(sbi, &gc_control);
 	}
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index ac2e35170f2d..2ca8fb5d0dc4 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -643,11 +643,17 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 	return !curseg_space;
 }
 
+static inline bool has_enough_free_secs(struct f2fs_sb_info *sbi,
+					int freed, int needed)
+{
+	return !has_not_enough_free_secs(sbi, freed, needed);
+}
+
 static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
 {
 	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return true;
-	if (likely(!has_not_enough_free_secs(sbi, 0, 0)))
+	if (likely(has_enough_free_secs(sbi, 0, 0)))
 		return true;
 	return false;
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
