Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B8435897
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 04:22:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdNid-0006RO-Tt; Thu, 21 Oct 2021 02:22:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mdNib-0006RI-Os
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 02:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jg2sI670rAsLhTRFhBEKa7TV3LIMVNJDnw1d9NkBGZY=; b=F7sFnHgdT7PO8Czzpjkv+ipVZC
 B23HSKtQ2ovkV2XOMme99bjX92zSBmZFdro4a9Dl8Yejuujwli4o5oRZuyCyNdGPhq+p2BqwUbluR
 F5HE4/qvInqeCDfW2B62AsQ8grR1i8GhUtk3GdA4Ac5LxqQkyJz8Mj/GJi3mj5uWnsGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jg2sI670rAsLhTRFhBEKa7TV3LIMVNJDnw1d9NkBGZY=; b=g
 h6kMATL/qerkvgalN8XE3zZbcWjAfwjk7d1QWQbKCSr0gwdNZuIkF6Z5CLaS3GGdOdu3zNLHo77P+
 QDw6wib0e/kWwba0jMvgL3eCNP57dysqqMssT9C6QWpzj8c83kOydAqta2vgeWU1/orIbR6VOMxqR
 cflfcQGPIUVHCu8o=;
Received: from mail-eopbgr1310111.outbound.protection.outlook.com
 ([40.107.131.111] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdNiT-009Zay-3e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 02:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lk+KN0lAYvhAZMTGjvXG7hf7PjIvcg6xVGsDh5InfP/AuomAopudxyKaei8pbNRDG23vaflCdIHkKemBD6fDiNN9RzAsfrKjART/x8LYE6Z389CncLOclt9dZPTBJAw87yXGOQPlSN9k/gImqkOMKqUTcWQA5FZHWnovVZtaWn44oswfRBUyZXV0O0JvN06NPdmy1ZUd2SrC+q3oiNk1mKp6gCHSOjWIzwqU1FP28R5zZY8zIpplUpygbC3Lh1HNAY7vl6nUMZT545tQGGg56A2auf8o3mfrb1NOp1AhbWsUeWY8xTsNj7YbWuWgkeignAlvbLIjGLiWTncIEknlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg2sI670rAsLhTRFhBEKa7TV3LIMVNJDnw1d9NkBGZY=;
 b=VOiwkXW47neBOZmKH1cp+IxBJZdxZwf6llE1a+CXsY/eTphEvQ0V1vTlM2aST9dG63I9UMI9WoKBYejIdIhc1JwmNKok8eo12H1R645KzMlIX1lGXl5sVHWQy750ukIcQBaV+zSeBDt3Oe83PChPBuSUecgNs0v70sjkNs4T7KcqXF0PEo2ua76/o7uwfbFhz8oNmx1B26V+Qf6xQp3I2PijGPJQQiF6LNMqIKa/WziiEnvfBtLOlYHLjR7VtoS8ZOV7sSi9LIxbAgkcrP4TdzZd11r3KuSNTLmudbHdHPXS28qAoujNNjvTnQdWSBC2UWDFwYX9AtMzih2So1Jecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jg2sI670rAsLhTRFhBEKa7TV3LIMVNJDnw1d9NkBGZY=;
 b=S5kTL+FkKLats5Lp/Md2XbyLowGuhURbztEwmospqIsrL0v2oCtI8ctCsshRFoVuRqOnc5SN3vW1/VCRX4MWEmT1E1exE8WF7BauvdLzoRjHnLVvBfM19e3zuK2MuChA6M6pwxnBXqkfdV7kyjRGf79rq2DXDrENgOEZUzuSGzo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1912.apcprd06.prod.outlook.com (2603:1096:802:7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 02:21:49 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 02:21:49 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 Oct 2021 10:21:40 +0800
Message-Id: <20211021022141.246051-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.18 via Frontend Transport; Thu, 21 Oct 2021 02:21:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73e6762e-e3f6-460d-9624-08d994398970
X-MS-TrafficTypeDiagnostic: KL1PR0601MB1912:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB1912295FBA6E9BBA40D3D01EBBBF9@KL1PR0601MB1912.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loilAyWt8W67/T+VqX9dXVDiSVXWGeeFCBu18ezBAL4ZDMPhGXF2HSwC97Z5KQhbvNO7hud/zOW4X2wny9JPRIsDp9Jz1DmFoHQvAIMvmuuaMsp7wzgrzBEqnj+ynkmETu9xfrLRTSlE0B2GFPrZ5HgdfB3gSFVTNYCK73P9mtyPq+dVF9oiF9ZGucL45ZsWtWhJGZWGlgwqayc1CwvGf1GGshKRa++TscFJV2ae7lFqGnMFkVDu3FGXuK5Kp7Scnvt4zIzOIThFYfK9Q7Ml40VW1FUjJEctoOk76FvCNG1OOKIDPU8/iUM0dEOWNxkhBgiGf0eH3tAjSbiurs/hoW2GsDCRFBcTFHCRqZn1wZUixtOgCwLYoG2x+XTSG5RvHVgLXh3omsn3tnpFvqp6fwDFWbQeeQ+hRtCtS7mPw+hZQ37jPdDatPs7IsK0Bs47Ye8iZ1tYg111k5lY4RgDi0kzVjPj6dGLVn6a5TgF75crp4ugYdCzkUYmV6MQt/FEYiVFGP7X+FVuKjbnEctUTn4NOx4YnUCwk4dKOcH2ZUo4pAR2OSZlOWMVpxXCSK61R4f0D4ACsLi2ioLsoG9SPy7TGC4Ek5r9kH7xMy53+AU7C//hIDL9MPeRj7Wt2mEMluZFuoFvtOcM3Htscnlq4DFXBV1bg7rgdESpOyozDj2ciSO1HHzko+BBfyr7rY2hLYVo68BnkgaRfCmvY+ooTcZ8JhRZ5iceEHSlAlThbe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66476007)(66556008)(2616005)(956004)(4326008)(83380400001)(6486002)(66946007)(38100700002)(38350700002)(26005)(86362001)(316002)(107886003)(1076003)(8676002)(6512007)(186003)(5660300002)(6666004)(508600001)(6506007)(52116002)(8936002)(36756003)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vLIHNZw3Lyfye9IBVte2Qg5Jdi9xcwVRUTfo/HumkDYak8aEBQiR/eaa9sxy?=
 =?us-ascii?Q?aEWEHIRlNS+nmw0pMW1/q7Nc4ZO/7Ffo1dssjfBJIkt43KUn/89+rAsGXl6U?=
 =?us-ascii?Q?r9VlLxZ0VpCPp/zFmMUSkSPLFSKti0aYCWRpxEuRKDmzc6VBPNa/f1qcZmz0?=
 =?us-ascii?Q?AmyCLmhOT2OV9SyWBxih0pqajKJlzzkxJuVOgYhVC5JryHcw6we2r6XOUxQw?=
 =?us-ascii?Q?tyy5g9OW3Il8Vx2iEV742cMti7ITkb2FpkYL36QBcgzs1ZjW0FfOP6GRFrSS?=
 =?us-ascii?Q?4tPQsdh4Wzqy83/aaOTvlmLa0PoWU4YCz5Nm7URTlynTBhmOP1IJs5IQ3aW8?=
 =?us-ascii?Q?/CICWghFH4lQTQkXfdx/SH/OCSYVZoVKVvAnfjLOyC1Ufck5fl47vy4o7W1Z?=
 =?us-ascii?Q?x/RPKoIWQrvNd3RIxodURvas/6IqZcfG/EwLAiP3GTBc60NdhDnPyWP2lzFJ?=
 =?us-ascii?Q?SyTA5Q/iREB9UZkWvQ1GTD815kRDRNLeMnJrqysBxYPxsLhiAv8VeTh/0ZE7?=
 =?us-ascii?Q?SDVvGvQjf1ji+qyjjPcuxZpDeFJrCirY7ObisLXLTujQL955Rtu/TAx3lU2t?=
 =?us-ascii?Q?BcVXAVlG8X9TZZvB686rn9jLE9R+OOnNuMnoFMh3IOLBqBQl0T46Hvjx5tVs?=
 =?us-ascii?Q?zfTVN+Ku3Gix3BPDwONQ+D78+qpi062BcyPqp/rtJ2gXaZjZeBC0uQmcsTXx?=
 =?us-ascii?Q?wCqAjAia3Bp4nu13zxHSuHZEuM5a/Ut/0899u7MfpkMtmdqzF2VMvMZh2Dyl?=
 =?us-ascii?Q?A9Se/IOK5Ox0UElxZrOfIGCTtN+tX8EYAUB5IDdYfXoISQ+L6zAu7xvFN2b+?=
 =?us-ascii?Q?ou98g2B39cTIsA/YKu5F1jjUzGN5dkd2yn4O3T0vPaBshTuX1eRfP9n3YQov?=
 =?us-ascii?Q?p27hqA0JtzqIn8MCV6kmdyzdvRyeK9lE4MhgdsNTQYhqJFMyvTeooD6BPyak?=
 =?us-ascii?Q?2mSTosx0/krjzH8H0SqZDtbyAyDmBtqFIMirtHuESmKRcxy9SEn1k+Ca0K1X?=
 =?us-ascii?Q?zbF8W8Cd6gEbSEguTIwG2UDEiVbvpaC78F2SgkRUmVFsYdB6GfppUFlcAEfF?=
 =?us-ascii?Q?zhmxyRZF09xi86hLyDl22HXGVUK0Tys+OTobgaq1hAwmLioT1offmzUwf66P?=
 =?us-ascii?Q?nhNAzZWeVkcjcVqQQScvw3R1Ut9XcnQ0Ux9f/8aDmzZBFpaZUHA7QhACPSLQ?=
 =?us-ascii?Q?UkEHcoKUXDs2MFONbCdZ4tpLld80ZpgbhBf8YNPNJejKaT/ssIictqcUB0Yz?=
 =?us-ascii?Q?oMK7xsbwG0SEIDkHn7+cNNxGuCXVDmqYlh5nPP+Shk8f4wcRLI2bcKF6jq3t?=
 =?us-ascii?Q?gk5+HpyIRTtXbDBiwcmtUlqM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e6762e-e3f6-460d-9624-08d994398970
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 02:21:49.1311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11126892@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1912
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: separate buffer and direct io in block allocation statistics.
 New output will like this: buffer direct segments IPU: 0 0 N/A SSR: 0 0 0
 LFS: 0 0 0 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> ---
 fs/f2fs/data.c
 | 10 ++++++---- fs/f2fs/debug.c | 25 +++++++++++++++ fs/f2fs/f2fs.h | 33
 ++++++++++++++++++++++ fs/f2fs/gc. [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.111 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.111 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mdNiT-009Zay-3e
Subject: [f2fs-dev] [PATCH v6 1/2] f2fs: separate buffer and direct io in
 block allocation statistics
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

separate buffer and direct io in block allocation statistics.

New output will like this:
           buffer     direct   segments
IPU:            0          0        N/A
SSR:            0          0          0
LFS:            0          0          0

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 10 ++++++----
 fs/f2fs/debug.c   | 25 +++++++++++++++----------
 fs/f2fs/f2fs.h    | 33 ++++++++++++++++++++++-----------
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c |  8 ++++----
 5 files changed, 48 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..c1490b9a1345 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 	return page;
 }
 
-static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
+static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct f2fs_summary sum;
@@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-				&sum, seg_type, NULL);
+				&sum, seg_type, NULL, direct_io);
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
@@ -1548,7 +1548,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		/* use out-place-update for driect IO under LFS mode */
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create) {
-			err = __allocate_data_block(&dn, map->m_seg_type);
+			err = __allocate_data_block(&dn, map->m_seg_type, true);
 			if (err)
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
@@ -1569,7 +1569,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
-							map->m_seg_type);
+					map->m_seg_type,
+					flag == F2FS_GET_BLOCK_PRE_DIO ||
+					flag == F2FS_GET_BLOCK_DIO);
 				if (!err)
 					set_inode_flag(inode, FI_APPEND_WRITE);
 			}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8c50518475a9..9f6880094fd1 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
-	int i;
+	int i, j;
 
 	/* these will be changed if online resize is done */
 	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
@@ -208,12 +208,14 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->valid_blks[type] += blks;
 	}
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < IO_TYPE_NUM; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
-		si->block_count[i] = sbi->block_count[i];
+		for (j = 0; j < 2; j++)
+			si->block_count[i][j] = sbi->block_count[i][j];
 	}
 
-	si->inplace_count = atomic_read(&sbi->inplace_count);
+	for (i = 0; i < IO_TYPE_NUM; i++)
+		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
 }
 
 /*
@@ -551,11 +553,13 @@ static int stat_show(struct seq_file *s, void *v)
 		for (j = 0; j < si->util_free; j++)
 			seq_putc(s, '-');
 		seq_puts(s, "]\n\n");
-		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
-		seq_printf(s, "SSR: %u blocks in %u segments\n",
-			   si->block_count[SSR], si->segment_count[SSR]);
-		seq_printf(s, "LFS: %u blocks in %u segments\n",
-			   si->block_count[LFS], si->segment_count[LFS]);
+		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
+		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
+				si->inplace_count[0]);
+		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
+				si->block_count[0][SSR], si->segment_count[SSR]);
+		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
+				si->block_count[0][LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
 		f2fs_update_sit_info(si->sbi);
@@ -611,7 +615,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->inline_dir, 0);
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
-	atomic_set(&sbi->inplace_count, 0);
+	for (i = 0; i < 2; i++)
+		atomic_set(&sbi->inplace_count[i], 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 039a229e11c9..09d871c00dd2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,7 @@ struct decompress_io_ctx {
 #define MIN_COMPRESS_LOG_SIZE		2
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
+#define IO_TYPE_NUM			2	/* buffer io or direct io*/
 
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
@@ -1695,8 +1696,8 @@ struct f2fs_sb_info {
 	struct f2fs_stat_info *stat_info;	/* FS status information */
 	atomic_t meta_count[META_MAX];		/* # of meta blocks */
 	unsigned int segment_count[2];		/* # of allocated segments */
-	unsigned int block_count[2];		/* # of allocated blocks */
-	atomic_t inplace_count;		/* # of inplace update */
+	unsigned int block_count[IO_TYPE_NUM][2];	/* # of allocated blocks */
+	atomic_t inplace_count[IO_TYPE_NUM];	/* # of inplace update */
 	atomic64_t total_hit_ext;		/* # of lookup extent cache */
 	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
 	atomic64_t read_hit_largest;		/* # of hit largest extent node */
@@ -3494,7 +3495,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
-			struct f2fs_io_info *fio);
+			struct f2fs_io_info *fio, bool direct_io);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -3702,8 +3703,8 @@ struct f2fs_stat_info {
 
 	unsigned int meta_count[META_MAX];
 	unsigned int segment_count[2];
-	unsigned int block_count[2];
-	unsigned int inplace_count;
+	unsigned int block_count[2][2];
+	unsigned int inplace_count[2];
 	unsigned long long base_mem, cache_mem, page_mem;
 };
 
@@ -3781,10 +3782,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 	} while (0)
 #define stat_inc_seg_type(sbi, curseg)					\
 		((sbi)->segment_count[(curseg)->alloc_type]++)
-#define stat_inc_block_count(sbi, curseg)				\
-		((sbi)->block_count[(curseg)->alloc_type]++)
-#define stat_inc_inplace_blocks(sbi)					\
-		(atomic_inc(&(sbi)->inplace_count))
+#define stat_inc_block_count(sbi, curseg, direct_io)			\
+	do {								\
+		if (direct_io)						\
+			((sbi)->block_count[0][(curseg)->alloc_type]++);	\
+		else								\
+			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
+	} while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)					\
+	do {								\
+		if (direct_io)						\
+			(atomic_inc(&(sbi)->inplace_count[0]));		\
+		else								\
+			(atomic_inc(&(sbi)->inplace_count[1]));		\
+	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
 		int cur = F2FS_I_SB(inode)->atomic_files;	\
@@ -3869,8 +3880,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_update_max_volatile_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
-#define stat_inc_block_count(sbi, curseg)		do { } while (0)
-#define stat_inc_inplace_blocks(sbi)			do { } while (0)
+#define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 77391e3b7d68..7c47082f73cc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	/* allocate block address */
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
-				&sum, type, NULL);
+				&sum, type, NULL, false);
 
 	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3189537a19dc..139db3c709e3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3410,7 +3410,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-		struct f2fs_io_info *fio)
+		struct f2fs_io_info *fio, bool direct_io)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -3444,7 +3444,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	__refresh_next_blkoff(sbi, curseg);
 
-	stat_inc_block_count(sbi, curseg);
+	stat_inc_block_count(sbi, curseg, direct_io);
 
 	if (from_gc) {
 		old_mtime = get_segment_mtime(sbi, old_blkaddr);
@@ -3534,7 +3534,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		down_read(&fio->sbi->io_order_lock);
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio);
+			&fio->new_blkaddr, sum, type, fio, false);
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
@@ -3630,7 +3630,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi);
+	stat_inc_inplace_blocks(fio->sbi, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
