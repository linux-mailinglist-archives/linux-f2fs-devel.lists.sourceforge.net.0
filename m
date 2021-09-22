Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A54141B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 08:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gqNxrAkC15YLZ8B0ifMmV6XavQq/qUNbhGHIHY0jKq4=; b=ANvkwNlAAgeukFF+p8GD1veA2
	rmhkQOLmNOBRrIKMvAi00pMMh2jX/ENTwZanS85p8xk3rOMcIfXSpH5VtBDflRW/8OYXOOP+k7hCE
	AJJw3M5nT9UnfRhj1zPyXqDz5AhIYR2YH1TsBazwcPUAT4bwhfdV8jrFHm+1ST9JCcmW0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSvha-0002s4-ES; Wed, 22 Sep 2021 06:25:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mSvhK-0002ro-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 06:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cV298BP++I+ngWHs1GaCuaQJGmpgNzbWfxkGPHShY6E=; b=VIoSEqcfvmwG6zb+B5dX9xmo96
 LCbAeVbPHiUXF2Acnz+rp6iLM4U9+YoeIWlmnjqMyOfQa2sdBMR2OvbgCQTuYzGggldF2HKNJP4WL
 Ez2TTQ9ZuLIP+9MYCCd46yKJ/5xY9nmjEd68TWTOrA1kGed5az2Z3pa5y3SAavPD1MOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cV298BP++I+ngWHs1GaCuaQJGmpgNzbWfxkGPHShY6E=; b=iGN+VBkfuP3Cuc8iymGIvgW+xc
 0mPXesn8ARcMdGaOZDvkSMuPm3k6Gn4NhQG14JofKd1RoQCy+cQ1QjouzfT8cDe3WQha1ggZYU06b
 ZaxPkUIJ3COjVr1S8c2uLXOOEIdBFXSeMhhV0L2Bc7DKodeeH7iin6gvg8R6X8w2r3ik=;
Received: from mail-eopbgr1300124.outbound.protection.outlook.com
 ([40.107.130.124] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSvhK-0008D3-7N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 06:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpYIUiCwyHgvMXUPEiUhjhDU94Xat44KHmzRAkCurzj9U8SVQC9uPP3G3QMIiUAvMfZgDIaBpRah5XV2YByivTaDs8nxG7xcvOv0FHLAJwEXyG20oxpBn9ittMDEhmGTNSXL+UQJl3mNHPO7/7URcs2IyQ8R1/7Mi6Q8LR3gTfnfBcwJGSn9O4YjVB7t+g9P/i+MzUrkWx+Czn4HNiJOBWMdgcOSMig/+vL6Hxcyoir6H2JeBJ+hNgzt+HfFI1y7okVxXbSXBzKqsWs4EgTC8f+Pu++r+5cJMZuWEQmZf4uBWeiPIRU66vPt44bjFhqJdUJaVnYHDmXDGaq5PmUflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cV298BP++I+ngWHs1GaCuaQJGmpgNzbWfxkGPHShY6E=;
 b=VKmLCxWXNJfutz9p8re86WqQSu8qDogbOoulJTxBx43Bu13LZlOMzH7AvxCUGo9hATxqnK8J6EBgHyjt/s/8ovlCl3WrDV0eyLbniv5fW86tOkxtxoO4Qd5jP9JhzRfoJcdEInBZ69GV7ahBIJN8CbH+BM6ilrNA8Qyl7QpbZnOsTHr0UP4l78iTTVN2ub1jvXJhTteshjtH6q6aQSKfP5zqM+hFJv5NcxWe7ho4/Zu9qKbq0GwxtQhsV4O+Ip9EcLNQgB3ax9MJMhpCTlH6zCV3d+OLRpA2PLC6i6QMNAFWILQJyWARFAUpTPn6j0BaO2W2pHPc3XXbn98TRgKAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cV298BP++I+ngWHs1GaCuaQJGmpgNzbWfxkGPHShY6E=;
 b=bSAiH2oh4D6w0xw+unOzEQd8UhGS0rARCrZ+bD5J1fr2Ym0/qpFdUS2aqFzz7E8F5+E7rgKzcS+RLR+3aJ4OagEeKjM0AyaqRGAQzBF04oMWTo36UdP1L7u2iBUIIrCC2GmBaJG//I+2h/KTUEMwm1Hi21X5WCuxgCjyZgS8wWQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4241.apcprd06.prod.outlook.com (2603:1096:820:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 06:25:23 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 06:25:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 22 Sep 2021 14:25:05 +0800
Message-Id: <20210922062505.412057-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922062505.412057-1-changfengnan@vivo.com>
References: <20210922062505.412057-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR03CA0063.apcprd03.prod.outlook.com (2603:1096:202:17::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4566.7 via Frontend Transport; Wed, 22 Sep 2021 06:25:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f14def3-abdf-47f3-2462-08d97d91c1e3
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB42410FC1630A620666CE97AABBA29@KL1PR0601MB4241.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSpDLk9AnyZ+zIjq36nJNo4YG01tr8Q2mvz9Tco9hOp5ZSaENz0+d7+bu4URUwqL8M69P7NzHfQRsgRofwuYSY/g3DQzDcaVdcCIvNYlJ0+nIvaKpMvgwnKjcG/4tMZHQTSppTJ69eA23ympSVNBPz1O9siMLL0Qjs2QZYTn9H3ph5bzmLyV1Kewyxcib4NnBweV3YrRyAXk0g+8H40PzMlN+yVUfsVPDk2PP4MWW2VEvVkXH6s2oyNZVoFTbce16ty6mbwUL2lOKLl8itG3XwAIjZOYWVYNJrHcEf/Ak1n6uU5cUQp4FIR2e6E35ite0siFGp+Cqm0fzNpbxfAIRIUm+5Hfa/hikaq9mjd/TgMy47hMFnySagamnUM65Cg8lnkawgwIyxG3m5lrIn1GpaCZ8+GMV+2O7Jb2AOhFnmozzj9qmnOGWok0UygLEivLndmDx8MruoS9dxeytJHgzUZyxRF0bicr2tY8jIY8o7iaslv8ghlXPdJ7O8ixs0LiICt3KmHh7WSPPz9gusXT8ymNQwAcskHriqn8D4qmUV3Py5QzijlCMiXwGrcdsOpyKweVN0CTZRb5WNyc9fvvPbFL4PACbMi/pI4MDiK3/qBYASs0yNn3gY/b15S1nw4Cg8e0NS2L+AdG7fwDsa6uFsJjeV+58qHsqBny3PgVOOwnOlDUpGBd1gvqqkPWrFmBAazJSGDb8Knk8YoUZNakvXdeXEn+s1q/ru3jXBDBTH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(83380400001)(2616005)(6512007)(2906002)(38100700002)(86362001)(508600001)(8936002)(107886003)(66556008)(4326008)(1076003)(66476007)(66946007)(6666004)(316002)(8676002)(186003)(6506007)(6486002)(26005)(52116002)(38350700002)(36756003)(5660300002)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOEp1Mdjr6tOrZtVNaKYF7MKljpy4DkmgkRAZnKzZ8NMu6af9Aeih+PMVpIX?=
 =?us-ascii?Q?LRif5lMT1BuGB4TQcfMpwCFVAu9fPdCw/6MPL3Sd3OOynQQX9sMKfg6A6vRq?=
 =?us-ascii?Q?nk6n8UbZQsYFK3um2gKODMDTPSviZ+h6ZURKzUJPM1Kokp3SCZPRq10ENoAo?=
 =?us-ascii?Q?nShS8acS0HduBSbMTiEa/52ZNZSY//0q+1q9336+Vu3QJMK/hpD0dYG3iEue?=
 =?us-ascii?Q?tacLCdn9UmCIpJat3Wv2k4dVJKEHR3C26ya96EPLSCh8DtFduVN1jEQ285tJ?=
 =?us-ascii?Q?vdaMX0zBGNBVt9mm5N5AzYy3BpkCGfQIOVe3uxkgEVOvgnnu1jSmCgWzQ+QO?=
 =?us-ascii?Q?c0vcrVHfGuEUC7xiMZl29FzT5g9FHVhtaQ0FbxJwQa7I0Fz8/Yrw2OxlOzBY?=
 =?us-ascii?Q?PwPWPSib1XTsJWApA4BbT/DjzgKOXxRemKAjz5o/IQR/2FeRTyqblTxHc1Yw?=
 =?us-ascii?Q?BjVrNwGBrumWeOR5pigGtf/qr/aYgtcZyNkltWB0YndnBTV2+o0u8F7W0nIH?=
 =?us-ascii?Q?GtIsaLS8BjLw+qg7nfj5qwTgDi+j6tBIC/gbWglZGcs8cMtNuU2EEWSFv1c5?=
 =?us-ascii?Q?rd3IrSKuRFzlCyKK6vdYxurTi6FlBjHTR1MQH6ivyKphKerOCVOFC8jqq9i9?=
 =?us-ascii?Q?pveZ6x4cRuqPzsqoDTKRMu8YvJD+nrVER3i7t5uybtjCgJYhfObC9V6g5RjU?=
 =?us-ascii?Q?RGmO7RaQQTFZkOkIhVkGPZdgvm6y8WuPemZ5m7yKHqUMVf3/dufzM113XSZO?=
 =?us-ascii?Q?8Hb8EXUBvFL2CECCKcvsbm9FKUr+aKPCZOtZlvvw4YGMHAI77gyxZJyRfGz9?=
 =?us-ascii?Q?p5l1r+FkOQO/0ZXygMnDdUGSiL5v7j530Gq/fj+CjtCJsg0uzCA3Z6SGR9Hq?=
 =?us-ascii?Q?0lVqouwPsSeILhhBJh8eLboSt/8Rr9OWhh0z8trsusOdROcShZX02++/VmSt?=
 =?us-ascii?Q?4p2SY2a39LEL5xCCS5sSgOai+rNHUXP7rlg8Q5EdO14BufilHF/NPJEOQWme?=
 =?us-ascii?Q?HyZHoxUfr6AoKkfxnX+xcuvAOp5OTFqdLZs441jqSOkZHysFJDikd/ChuzwG?=
 =?us-ascii?Q?kf5ZXcqtjVw0Zo6Vn3b2ei0kAyn+URNls+jogsf0XRdUICLRK3Xqan0/uukG?=
 =?us-ascii?Q?ooaZYDg/+dp6MQmgKcveHBq+EMgeGRgcXdDLG3nnHDV6DhKjPP8tXcbjzPHq?=
 =?us-ascii?Q?RQWXwElelxIXIv49JR3wXrJE+ZEh1c4Hpk0Me4khHofk6vR77FNzkJxcAo28?=
 =?us-ascii?Q?EgUnDMgNGEGNq10+QhsdkBYUvN6qzqGXUzOX9ps08gbA/upEG7vnTy5C8xsZ?=
 =?us-ascii?Q?D62qzG3SxVLWzdyCDNTbfUHZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14def3-abdf-47f3-2462-08d97d91c1e3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 06:25:22.7986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkVIApF81oNKIQNAHYJIsaorIUtBDttMWWNQ/KCbrebvYQN/L8tQ+M0S3rISQKNm4twnZbS7kVlPIkpSv5wzlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4241
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For now, overwrite file with direct io use inplace policy,
 but not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, ) instead
 of stat_inc_inplace_blocks(sb,
 ). Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
 --- fs/f2fs/data.c | 4 +++- fs/f2fs/f2fs.h | 8 ++++---- fs/f2fs/segment.c
 | 2 +- 3 files changed, 8 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mSvhK-0008D3-7N
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, overwrite file with direct io use inplace policy, but
not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
instead of stat_inc_inplace_blocks(sb, ).

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 4 +++-
 fs/f2fs/f2fs.h    | 8 ++++----
 fs/f2fs/segment.c | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1490b9a1345..7798f7236376 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1553,7 +1553,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
-		}
+		} else if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_PRE_DIO &&
+				map->m_may_create && create)
+			stat_add_inplace_blocks(sbi, 1, true);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 20d715cacf49..3895a4f44ecf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3785,12 +3785,12 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		else								\
 			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
 	} while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)					\
+#define stat_add_inplace_blocks(sbi, count, direct_io)			\
 	do {								\
 		if (direct_io)						\
-			(atomic_inc(&(sbi)->inplace_count[0]));		\
+			(atomic_add(count, &(sbi)->inplace_count[0]));  \
 		else								\
-			(atomic_inc(&(sbi)->inplace_count[1]));		\
+			(atomic_add(count, &(sbi)->inplace_count[1]));	\
 	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
@@ -3877,7 +3877,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
 #define stat_inc_block_count(sbi, curseg, direct_io)		do { } while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)			do { } while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)		do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ded744e880d0..c542c4b687ca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi, false);
+	stat_add_inplace_blocks(sbi, 1, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
