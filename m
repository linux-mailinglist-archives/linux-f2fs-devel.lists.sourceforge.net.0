Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A47546FC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jul 2023 08:10:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKYTs-0001DG-Vz;
	Sat, 15 Jul 2023 06:10:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qKYTr-0001D9-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 06:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RKtpr4Dt9/5l23YqnUVVKEGc2HoI/6S0EJcx3LlxWr8=; b=h7dMwQGd4HNIgm2FNG2WqyCzsA
 ZANTSRxITXpxE2vrnsQqetlpNKBlSNUG2UuL8jmGNUSuzDUxy6BQMmOGH/LBORbgQiPHjL6dYdSuJ
 GjY7NBye0uOUxOpC9bWPmAAN/TgDr2s+4obXpVFSK5gSWC/94NgIxc4fKnMnr3LSUYAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RKtpr4Dt9/5l23YqnUVVKEGc2HoI/6S0EJcx3LlxWr8=; b=A
 1iG7Vg57g7edXCJCho4KIOCrqGpBRyobtWgvRO3bUUJ+/hV1T1/irhhucGBPCa5P/k9GFcFVfSH+S
 OMO4By0UYAKlkbocJ2MR5Qq/rPH2jVTUraMnCQtzf/IC5/cqX3Brxi01f0Ui/M+hgxqjufLR13g6N
 OqVs4+HFac5vH8o8=;
Received: from mail-sgaapc01on2055.outbound.protection.outlook.com
 ([40.107.215.55] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKYTq-0003Lo-Pn for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 06:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkD0+JCIaPTCKrcDh9AdjVxXOBNb+5C29BvVcJcOpcOIAF3gq/8BurorwltTWiCzpVy2ME30B0poUggz1adwKOUNGSVfdJTh8L8DWr4j7Tpi3gZz8mkDk27llF7guEcYckBxmyhQRphdzM1molVKxRowiS5gFTeMKaHNA75+lP4k9I9YazjNUC8q5vKsdwUEnAdOfEfM8Vk5ho4JNogqAl43TN475UwRwrZEY8my+x0ruwwLw0UAlWRRMYNc4mUf6xfffwtqFRGFyu5AQN0IhNEMryMgfzpT53Ys+Z8sNttwUytw0EcnHwzlTHF2Kp2HXQ9X+sRcaE43MM9SUn2O0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKtpr4Dt9/5l23YqnUVVKEGc2HoI/6S0EJcx3LlxWr8=;
 b=nZ6gYr17YPBpg551LQ4ZKmr2939iQasVGeuBKqob1a3CAcHZYrYADmS6V6+I/sffwT7OaM0HIjeozvQLtuNQ7eQLHBANM3t1rrOxAOTf4lG2ydrFH05sRSJivSsOZaN1LAq9eDwjTnZvLn04uNcN19QUHDlVt6x03l7L0V3keWjS5jsjDYEoF3xGxX+hXjUmCA6S6PChSELUmQm0adLM7xxU9tvhj149CoDs9t0tdXDUDeH3o7IcTexe9qYapVOgWV+te8AJdHoGsRve8dN99dRvY/s7BSIhu4wJ8DoqDG6lMtU7I2h4L3k4l7+ttafE+LjtoTsGVMNYRZtuWPVPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKtpr4Dt9/5l23YqnUVVKEGc2HoI/6S0EJcx3LlxWr8=;
 b=mFEtWyxh+jaWa18zmPUBbjACOQJce5kFIms5+DLJXgjwHrkCTaWRslinCxQWrcjzV+QUW6qP/Q+BfoK7RKUH/DSaP9Ms2mwpvhoUi/RKRix1xk+3ON+YonjIKkWHV/Gbn8FjoA37qA8Z9uWR04NllavcljPXK/WVAnUNq0EQmRk=
Received: from SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) by JH0PR02MB6516.apcprd02.prod.outlook.com
 (2603:1096:990:17::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sat, 15 Jul
 2023 06:09:56 +0000
Received: from PSAAPC01FT023.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:41:cafe::bd) by SL2PR01CA0017.outlook.office365.com
 (2603:1096:100:41::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28 via Frontend
 Transport; Sat, 15 Jul 2023 06:09:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 PSAAPC01FT023.mail.protection.outlook.com (10.13.38.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.15 via Frontend Transport; Sat, 15 Jul 2023 06:09:55 +0000
Received: from oem-PowerEdge-T550.adc.com (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 14:09:45 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <ebiggers@kernel.org>
Date: Sat, 15 Jul 2023 14:09:36 +0800
Message-ID: <20230715060936.2343780-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT023:EE_|JH0PR02MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbacd68-3762-48a8-a6f6-08db84fa1ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6DBogDwmh8X9iinTc1tFrzeef7L9Q9qgWl3KebWOhztoNmay2CsO8HNgKmrkLgsrv8xJ3oXlOk0JKSENwLY40KM7h77sPZ7Jwrdgqa2HhXmDEpJC1pEwO3E6E3tYLGCsaVTxmd0BG3MsWc/v8l7Qqj1c0qA27RARlvt4lyEwVFuTPOmTMKTEZIq1BQptHFp4m4YN72UfWQKwcXuquriR0T5qPspqIlpb97LAuo+Xm5pRkW2JhzI2ESnP3QY2boIE9y3iHT2rmKDIvcOiQLW3MQ8h9JaMmxuX1/w5VWh732dlCDYUos4px60lnhhvU8E4CvoJaXTVsRCeXYrECIbsug3/i2nICtVhCvWOZ9Oq6cKFDMf/HAIejNBgxtqC9r8S3LnHQ7N5N3WxuWeZVjm14PMfq4Xyqn2u2F3MYy54FQU419mu9oGUZfsdjThBPOU55XxGjQuAkWxAMTraBAGPL8bu3fmZPzJ3hrs5o3SE1FxlT7WhqX6pBVhPZxFo0Jf76kf2co9XVm/oEEquA5TgzXtZ5gJmfM33B6vAuxZiXyN1bE7X880t7CZZpsYCrlowMBFHfagaaM2i6xuCb088vRD/Bzjo9iyJoE7UkwmnWQxutG5nKmKqOjnfzTQCfFwMVz/MzMyyNZcdnzZzHirtZ2iwowMr1Y1+wCaJW5uhJWhsoQVVf/bcPQwaI44AfJytmBMCDrZwroUDlZBbT+ORqKk0pSLCIkqpOMT0ymaM6LnKqtmTvXEhCU7CRjHdTYd3FDjH4d/+1QRtkCQ7mHHqg==
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(8676002)(8936002)(2906002)(5660300002)(4326008)(70586007)(70206006)(316002)(478600001)(110136005)(54906003)(6666004)(36860700001)(40460700003)(1076003)(26005)(40480700001)(107886003)(186003)(36756003)(83380400001)(47076005)(16526019)(336012)(81166007)(356005)(82740400003)(2616005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2023 06:09:55.8138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbacd68-3762-48a8-a6f6-08db84fa1ca2
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT023.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6516
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As the fscrypt context has two versions now, this patch adds
 the support of fscrypt_context_v2 for print_xattr_entry. Signed-off-by:
 Weichao
 Guo <guoweichao@oppo.com> Signed-off-by: Sheng Yong <shengyong@oppo.com>
 --- fsck/mount.c | 48 ++++++++++++++++++++++++++++++ fsck/xattr.h | 54
 +++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.55 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qKYTq-0003Lo-Pn
Subject: [f2fs-dev] [PATCH v4] f2fs-tools: support to show
 fscrypt_context_v2 in print_xattr_entry
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As the fscrypt context has two versions now, this patch adds the
support of fscrypt_context_v2 for print_xattr_entry.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/mount.c | 48 ++++++++++++++++++++++++++++++----------------
 fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..97d56f4 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -194,7 +194,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 {
 	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
 	const int size = le16_to_cpu(ent->e_value_size);
-	const struct fscrypt_context *ctx;
+	const union fscrypt_context *ctx;
 	int i;
 
 	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
@@ -211,22 +211,38 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 		return;
 #endif
 	case F2FS_XATTR_INDEX_ENCRYPTION:
-		ctx = (const struct fscrypt_context *)value;
-		if (size != sizeof(*ctx) ||
-		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
+		ctx = (const union fscrypt_context *)value;
+		if (size == 0 || size != fscrypt_context_size(ctx))
 			break;
-		MSG(0, "format: %d\n", ctx->format);
-		MSG(0, "contents_encryption_mode: 0x%x\n", ctx->contents_encryption_mode);
-		MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->filenames_encryption_mode);
-		MSG(0, "flags: 0x%x\n", ctx->flags);
-		MSG(0, "master_key_descriptor: ");
-		for (i = 0; i < FS_KEY_DESCRIPTOR_SIZE; i++)
-			MSG(0, "%02X", ctx->master_key_descriptor[i]);
-		MSG(0, "\nnonce: ");
-		for (i = 0; i < FS_KEY_DERIVATION_NONCE_SIZE; i++)
-			MSG(0, "%02X", ctx->nonce[i]);
-		MSG(0, "\n");
-		return;
+		switch (ctx->version) {
+		case FSCRYPT_CONTEXT_V1:
+			MSG(0, "format: %d\n", ctx->version);
+			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v1.contents_encryption_mode);
+			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v1.filenames_encryption_mode);
+			MSG(0, "flags: 0x%x\n", ctx->v1.flags);
+			MSG(0, "master_key_descriptor: ");
+			for (i = 0; i < FSCRYPT_KEY_DESCRIPTOR_SIZE; i++)
+				MSG(0, "%02X", ctx->v1.master_key_descriptor[i]);
+			MSG(0, "\nnonce: ");
+			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
+				MSG(0, "%02X", ctx->v1.nonce[i]);
+			MSG(0, "\n");
+			return;
+		case FSCRYPT_CONTEXT_V2:
+			MSG(0, "format: %d\n", ctx->version);
+			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v2.contents_encryption_mode);
+			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v2.filenames_encryption_mode);
+			MSG(0, "flags: 0x%x\n", ctx->v2.flags);
+			MSG(0, "master_key_identifier: ");
+			for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++)
+				MSG(0, "%02X", ctx->v2.master_key_identifier[i]);
+			MSG(0, "\nnonce: ");
+			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
+				MSG(0, "%02X", ctx->v2.nonce[i]);
+			MSG(0, "\n");
+			return;
+		}
+		break;
 	}
 	for (i = 0; i < size; i++)
 		MSG(0, "%02X", value[i]);
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 22ea35c..b155cc8 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -34,22 +34,58 @@ struct f2fs_xattr_entry {
 	char e_name[0];		/* attribute name */
 };
 
-#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
-#ifndef FS_KEY_DESCRIPTOR_SIZE
-#define FS_KEY_DESCRIPTOR_SIZE 8
+#define FSCRYPT_CONTEXT_V1 1
+#define FSCRYPT_CONTEXT_V2 2
+#ifndef FSCRYPT_KEY_DESCRIPTOR_SIZE
+#define FSCRYPT_KEY_DESCRIPTOR_SIZE 8
 #endif
-#define FS_KEY_DERIVATION_NONCE_SIZE 16
+#ifndef FSCRYPT_KEY_IDENTIFIER_SIZE
+#define FSCRYPT_KEY_IDENTIFIER_SIZE	16
+#endif
+#define FSCRYPT_FILE_NONCE_SIZE 16
+
+struct fscrypt_context_v1 {
+	u8 version; /* FSCRYPT_CONTEXT_V1 */
+	u8 contents_encryption_mode;
+	u8 filenames_encryption_mode;
+	u8 flags;
+	u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
+};
 
-struct fscrypt_context {
-	u8 format;
+struct fscrypt_context_v2 {
+	u8 version; /* FSCRYPT_CONTEXT_V2 */
 	u8 contents_encryption_mode;
 	u8 filenames_encryption_mode;
 	u8 flags;
-	u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+	u8 __reserved[4];
+	u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 };
 
-static_assert(sizeof(struct fscrypt_context) == 28, "");
+union fscrypt_context {
+	u8 version;
+	struct fscrypt_context_v1 v1;
+	struct fscrypt_context_v2 v2;
+};
+
+static_assert(sizeof(struct fscrypt_context_v1) == 28, "");
+static_assert(sizeof(struct fscrypt_context_v2) == 40, "");
+
+/*
+* Return the size expected for the given fscrypt_context based on its version
+* number, or 0 if the context version is unrecognized.
+*/
+static inline int fscrypt_context_size(const union fscrypt_context *ctx)
+{
+	switch (ctx->version) {
+	case FSCRYPT_CONTEXT_V1:
+		return sizeof(ctx->v1);
+	case FSCRYPT_CONTEXT_V2:
+		return sizeof(ctx->v2);
+	}
+	return 0;
+}
 
 #define F2FS_ACL_VERSION	0x0001
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
