Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A442796B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Oct 2021 13:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xKUevJ+he1RJH5+W85Wwp9MssHbZhtsB+fWpkC+tEZM=; b=ju5Q0e7Knytl1ZV+Zn9poOOUC
	IhcjmfgHt2vX/+15LKNadL5ZPfhhYWka5WcyF6B6RNrsDzyHV9elqqc8CSakd9YvqGGYDKSsiZc8Q
	1ABDHPKuIwsvfAsd9WWI9JihHZx/M92iz1aQ1Cj0Nd4tAvXWGKk+d4K2OBNrqaiC1ZaCM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZAWQ-0000gS-Lw; Sat, 09 Oct 2021 11:28:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mZAWP-0000gL-AR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 11:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXK51+RT59USktkWn4LtcWAhGWZMvtGzBaMpfkWZTro=; b=exfQjHAmasiSWk5z8Z6sws3cmA
 4a0yivzcLAJSCHOuLMBBdkMnHli0aL1If1VkOvn0mhENApza2VfRp/RxxQfAs92Bo5k+Pno4KKCFh
 2ou3EQQgKM4SQRisntY8SBgEkzJomJkyEgwrGBW7a6Gf3+jBeKMtuoxbUsEihrbaYKm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXK51+RT59USktkWn4LtcWAhGWZMvtGzBaMpfkWZTro=; b=UOTxvsoCa/YaNjf8GQXuJrDRXs
 37rCRjuxrxM3bVh2188bnFarZ7U7lXjd/Iz5kxf1higHGMfkuJd7QQkybKtNCA9n1uSLiluf1HuB1
 iwXcbtuF4P8dd4PAt+5/TsV+gGBWb/70meADJJiXryUnL6dJ7TDWjFQWgbhhJyQ7Vdjw=;
Received: from mail-eopbgr1310117.outbound.protection.outlook.com
 ([40.107.131.117] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZAWL-0002t1-9X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 11:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHXsiG5pSO8qREAEql7jhyMLypZ/XkufvuHnE1BLXCDej2SpWpYDJoQLiff9B+ioUMDmQP+CPFb2TOkJJb2FqC6wuKqBUDa+kOZDcqcXuFXb90tXHtnCGTwaG2Q1eBUvhPmFgAUgLtQ6iYDp+ifTdO04bxIc8FT+EiT6Ho+3sB/MxMIhE90f4UC8/EJMW8aTcb+OPJLQEBrnVdqw3bKW0uPvXX2XUeWlkLPptlivNblkjn0321akLA+QRPdXFNPwmMnSN81P1fg0pAY/YZCA/1J+2OLH9TusHNEe2KY4WUVuIbD3HU5TRjLNhIZ2nO7hTucy9jYkCg3F5njUL1TU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXK51+RT59USktkWn4LtcWAhGWZMvtGzBaMpfkWZTro=;
 b=WAw4wAgIw2gDabkBMvDpnSWNf1tQUv63tsvVV2dViakdOTEcbxp6ycDTOdIb4TT10/pvFEiWoTMXX8sRZ6lQnG4q5GXUNLDCfgU3yGA0QO6c0t7qHfTtXhrUjFB0v0KdbrLGi0CuEK9ybZjC88eFWjtMLGqDhfitBa/94PmQyB2j43yIrXTg74AEYOIsGw9iH734oTYVwISsszl4fYoOzb0vtafaIrdigxe4n2+3gLCmIXgNv04tTUJN9eNluWstu2p1KnrIzp0Chnbu8LbpTAAy7YszoNnaIOoNFFyZGXJAoMgakSuNxb1AzX0q5d76OtRpxO1NGrUQ8LE5z9Uhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXK51+RT59USktkWn4LtcWAhGWZMvtGzBaMpfkWZTro=;
 b=OKhTOTnMc0BClBkDeEomledJEDhv/hSvvXxk/bNproMlFFInvKZjDUT4IoUzFhIXUgsBCvd6BkNQKQRj1mDFEsQdpovGAQusvzv88s4qAdnlggu17lgV2AqeRJOWxpJpYEQf1q44LVeQkJEajsTyRM5bZS82r5Kgh999Cy7QsBA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3873.apcprd06.prod.outlook.com (2603:1096:820:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 11:28:02 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3%5]) with mapi id 15.20.4587.025; Sat, 9 Oct 2021
 11:28:02 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  9 Oct 2021 19:27:44 +0800
Message-Id: <20211009112744.33698-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211009112744.33698-1-changfengnan@vivo.com>
References: <20211009112744.33698-1-changfengnan@vivo.com>
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.4 via Frontend Transport; Sat, 9 Oct 2021 11:28:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb5af975-ffa1-4ade-55ad-08d98b17db02
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3873:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3873EC277D87E441DBEB69E5BBB39@KL1PR0601MB3873.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XrsGtKQ9fkfxzZHBB6RMIDfnOsISG8RA8rriDUyAaC1R7aNBOy+jDocGGpwb25LevDa0LUwkLb2QN3sMouEYKnyELOYybGKg3JTJVrB3o9kkw4zLMvokwvrNaZWkDpjdmkIqRGLdTmjKSfl0heaQCriYAA4ZPF7A3WC2m8z2m6199lIbfyhUzR4gzje8AArEpcZUtUyBLkobcvkmFAr8ttFU7H5+4APbTXyTvm2jIpkmD4p9BCL5bfLQVLtcmSPS9DHyyHkyP6hSpAeZamlvZsAImRxbQWhHWKDiaQCMrv03d1YjpaOykJHKQET5UaEl45SLgGeyAvKr0OP64ho+nuJw189pGkP0D/kfHPayorslcziek9q353dUxgeXoNFpvpa3Uxlj9gXgyqa1LacbnB3jezE6Bhufv74zyjdlENmaerFji9T9LUZZC1zHQT8grhsIpSShfoPZFvDQIAZ4AYKHQ4s6ZWQB5TvWSbc0KHTXLsNvmDNe3/EAwZBPelV3IT/1BJk6jzCNvDkdaEDpTPJ0tPA6PzM/i8vnHYZhu5WOlcdQw2swZ9suPGuBZhllmUr5UUPijpt+Xaln7TjlYEzX7ovmRmyAFaKdhGIbkL+e/TJqEuaKfn9Au5Iqol2xGztBZBrjkVyBdcuU+YwWy3qiXrPsDp9DgS5xhx97H6/Ml3o0xTinG4BQKmiWzcM4yD3FP1V3y7Nc6Mz9DJSotm5YkxaaKXvyqWEc9thR6tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(6506007)(956004)(2616005)(38350700002)(6512007)(8676002)(38100700002)(2906002)(316002)(1076003)(86362001)(6486002)(83380400001)(36756003)(186003)(66556008)(508600001)(66476007)(4326008)(66946007)(52116002)(26005)(107886003)(5660300002)(8936002)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pd2Og4bamvhJ8OX99Ga1y3plJYxL/MXbeNBll59Lwv6Pwal+6q4WbA0ft5M3?=
 =?us-ascii?Q?ecFU3Qys1gFUGEkbr2bmKOp2I/CK9UBRVRzkJvO7ZjNWYlGJTvoHXl2k1BEt?=
 =?us-ascii?Q?oxdJoI+nZ054vXkg5bSrlha132KWMBoPEaAFNa5OmugdXjXIT/5rTX4bS+uU?=
 =?us-ascii?Q?eZHeTUmUdpeKSKGx5nQwrwNMTNd44z7L1w8jV3IKlzBAmEt3UFGi2xHxqYaG?=
 =?us-ascii?Q?2mb0ss7mhV5OSqBU0QZ6oVioHNLAs3Q13sbbjmLFMrrUVcBcscSKTsZ991rL?=
 =?us-ascii?Q?u1McBWYZTMXAhiZCMIf2LE+2orF3VZU7IJ5lYUUjuWjD3jCf0o23ZcG+OsEp?=
 =?us-ascii?Q?+P+SkbFc/vD27bJtNMS/xJjQmKT97dl03WOof6M2Z60eh7a3OpkVPo8scm55?=
 =?us-ascii?Q?iWvxSeq3zLOkWafSJGRUOBm4rrJ9pmk7TnLC6E9fQH7DIPMu9YrKj4NprDfA?=
 =?us-ascii?Q?b45/ft5a8udeKhemwUFMBJnL/+sgTysy0+MrPsNMv5l1cUBASAdEFsvHU03P?=
 =?us-ascii?Q?8ZhNM6nbtOGEC5r/HUBoe6CvW2DZzFrrikGqWB/50MZvzf3om4FwGsu+P5Gh?=
 =?us-ascii?Q?ajrY1Or7OBU3qPXRjR0M2Cex9+0qMy+N4k93/JM6aIQIKx+EcvirFxTvQL74?=
 =?us-ascii?Q?DaLDSP6Im8O/BZHFkZ2wtu23O3ph7DZ1pYyUrF+oKmPIK2ifPZnkPn8xvA4d?=
 =?us-ascii?Q?TRiscX+UalRN/ZVh9bzDsjQ2fpun4hT4FHIRjGudPnSXzrJDD7BJfEwlz0Xq?=
 =?us-ascii?Q?r2w3gC56bwqlU5Ntf48dzocXIZQ0fGydp9MA7GT1TUnWSYKQzgsnjAbqZmBV?=
 =?us-ascii?Q?9wfRiORBnRKgUQ3F7n4gzE2Qjm0N0DhEnwWP9SzIdiFgBxOZsvqhql/wPgaX?=
 =?us-ascii?Q?S9Rj571RwBiMAE7PpWG+vJumAihAkBx4DI288ODKpYm96jYBLrajVTFUFXav?=
 =?us-ascii?Q?3AY36pEWD0EWto7VALWvKLkkBrG9eeg3lUaFQJtooMPhsBuPm7TV44JMQ3tC?=
 =?us-ascii?Q?OWCVoIaMTGCsgMRNMAV0yvvRMQsEjOhTdaOORzswcGvKyCGpMSCRfhGjuOnu?=
 =?us-ascii?Q?A2OCYgmJCRb2xSlMMP1twfPYU5HwDX7WpIqs65IoArsz09qIwjmcISLq+bYv?=
 =?us-ascii?Q?KN5p2Fu74cWlom3wxAANBMtLW0jbkUruazr6XAE4Iu6No7FGsGTBGhBld4hM?=
 =?us-ascii?Q?iFLOo5jyvRbzefw6stclVOC2tce2ukixKnGmWa2kin/LRRa3OHVGnRgLKlfW?=
 =?us-ascii?Q?9I8d25aqu0UppK8Kv/iZ8xg0OnhLBKPtDVP7rtxt7qC987uiBf/A8Nl49z9R?=
 =?us-ascii?Q?XBh/XMBhH9E9YlBK5wy9Phsm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5af975-ffa1-4ade-55ad-08d98b17db02
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 11:28:02.5921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7iLk+HsV7e+JPZtILUVPgirqwoXYWlLBFcWOYjwU9I+jLHEbkaWFY/L1PTX3LklTFi47082wArzmQt9B3itWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3873
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 [40.107.131.117 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.117 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mZAWL-0002t1-9X
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: fix missing inplace count in
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
index bf2e73e46304..a7da836ca64f 100644
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
 #define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)	do { } while (0)
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
