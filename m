Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 179217546E7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jul 2023 07:21:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKXiH-0006ab-Ah;
	Sat, 15 Jul 2023 05:21:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qKXiE-0006aK-9q
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 05:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=95z9lsUy6l6pIhl26zXwN8Z+zA5oNqL9zM8f+44NIy8=; b=FZbM6e603IAbChKc3GS0RpUeUX
 eVYge+FXwSAL4If/wD3ETmRl0rmNrdKG70/63AOKi+ngFPjyBF+R7/VmYkkhLN2qEKBU2lRsd8Az2
 QFkQ/SO3600sHcTfEgm5lrd0wKGCqWQ9Q8w9JXw6HPmXD+otztTOTbH4wzd0RjZTJRH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=95z9lsUy6l6pIhl26zXwN8Z+zA5oNqL9zM8f+44NIy8=; b=X
 IzCisk8Otr1Dyy8AMFZeubxYA/OKUI2GwUogmntPtA9sqU1d4Swyj3bmCHL6UDoDz9FrCkB0uhubK
 QAVDIiGUqzUTX7koBcxVfH34FoPapzRO6XlnGGnzHo9KTV+UHneKTL+hDTWDvY8pbKU/feQA/mL3b
 F/JRpjyToC4/QhxQ=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKXi6-0001Pa-0k for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Jul 2023 05:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkkG8m2dFlcahzyCWA0H1MUyMe428pnw7SoE4V7QQo4ZFkdqwuNPH/Qjf5S2KKtBq28xlg+HRMDILdiNtczl9uuqhJJRSUxHrJVp0Aq5JBvmfC+WhmAOYvxSjaUHliyI30V2Oq5O5geZ0wtJnu5/QhQenXSjg+BsmYhrWf/lDC368Ycux2YL2r3BTckCV4XTYFFoDXi9PBv7PUr23yyosBhIC/EaBAyekz2ptI+D445nr1Gjz0tNNEFiGzeUhlfG7YIDiQWGHrQyV7BOITg1qxrUkR8/2WimJzlrOvUeZU0RPhWNpWON1Xd3DTE8p6lLkgKqplqZxGhGtPO1WVeHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95z9lsUy6l6pIhl26zXwN8Z+zA5oNqL9zM8f+44NIy8=;
 b=G7hCucahqUGTKTinICxMEPwJQCgxA5STj3iH8Ipgg+FLGSD9cCUApzQTWM9Fk9V0fgXcMwnXKG6WyuuEKRh04z/9s/PDsh36kW3BnnzoCgWcra7RvPIRQVHKrc+Y5gaJXCrsi0Myie/NhG1yeAZ0DQ8FiRHNhBNzaVnWgviCdSEwVYfaN1ZFHI6jD5WMZO0efITEmzbyM027aASjt9nOrj0YnFxS/wyoOd9APRdingQIS4i1psjaNOrQffREYHma2HAlnrZoedcwiaCF0t4Cz6b+eNORHcqWSiEQiVkmIsOBFMhdOyBBoVk/EdlWvZlXNVTN45GIRpazFnWI9ytJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95z9lsUy6l6pIhl26zXwN8Z+zA5oNqL9zM8f+44NIy8=;
 b=nJp0hML4FupfMizWvs0TxR293mmjozN+MsOM8LmEoHZrspGqGVbjcMSRFE9BTC52XTq854C5I81KnF7g0sWQagxOBt1d4fT6POkNxOaKHikxMKHTnqjC6rAgr/o2CaiUrdz9wURG+M75pT9LUUD4vIfLf04s3/rMDbJhgVikrTA=
Received: from SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16) by
 TYZPR02MB4557.apcprd02.prod.outlook.com (2603:1096:400:3a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28; Sat, 15 Jul 2023 05:20:35 +0000
Received: from SG2APC01FT0041.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::40) by SGAP274CA0004.outlook.office365.com
 (2603:1096:4:b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28 via Frontend
 Transport; Sat, 15 Jul 2023 05:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG2APC01FT0041.mail.protection.outlook.com (10.13.36.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.17 via Frontend Transport; Sat, 15 Jul 2023 05:20:34 +0000
Received: from oem-PowerEdge-T550.adc.com (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 13:20:33 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <ebiggers@kernel.org>
Date: Sat, 15 Jul 2023 13:20:23 +0800
Message-ID: <20230715052023.2317307-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0041:EE_|TYZPR02MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f01ed7-4c5f-4078-780f-08db84f337c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nl5qk/aUSjZrQvvbTkIAutvl0aDt517W10paE6kQdwFo3sJIQycDfMmQ92qHaOi707jXnecS9XBzEdy+YIlgieoTbNE4wUfnO7Mmp4kSekyUAhPqiV0mcE0dKDEYJWCOfGg/IP2F3MeyaN89H91RCKoX/ase23TW/gdqIE/pf++t1H5uxbjh7u0bKrvQ4tjfcs0Acmy9YZde7LyDbK2rC+CqceRmaO+p+1ZTY+EjWotSmKM7dUeQkHNQVDg09bvVN3c+Li+Lyrd5u7Z99nIx4HiOBGL4bTn0Ja7wXVrSKrVIsx0gniB7U57TK/MazomdYFH2tGKS/F/jv2R+AUV8OL/MMPRtL6d98n0w39fie6bHCCCYVIV+dps11ktGOyq9UIlhuBPt4OeIIFA1ISyEGRa7+EvFzX7V2Xzpr4BWyUElh/4iVXn3HWx9wWSMoOY02s+zbY5iOxluspM9RMXvMzWfuj7BTpTbIigVJMSr+Oimu5CG6762jC/dxzXFhkv8cQezDme6H35wOXeLQrI//4XrbYGfJMw3o1rd6pCS+mi2C0M8DOzd1W4S1ARkmJKzjoVnP1lPknEVtEj9LUORHxH5hieDjIywIUtmRUoyxAAQUKqORQNvaSPg059iOMDo/a8DO3Zqrd+JRKXShvWIRAdheK+dv6hfzZjWuQgfLLroZQ2GQwwD//cUlDaUAK/hXub6qcs3KmyYigArczc5kIGBcxSuL9octnE3AChlouMjE3lJ4jLcFAO6uR/YImSpa88oJpo/nwqEQG2Z8loWmA==
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(36860700001)(40480700001)(86362001)(36756003)(356005)(40460700003)(82740400003)(81166007)(107886003)(6666004)(478600001)(2906002)(1076003)(26005)(316002)(5660300002)(8676002)(8936002)(110136005)(54906003)(4326008)(70586007)(70206006)(41300700001)(2616005)(47076005)(83380400001)(16526019)(186003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2023 05:20:34.9480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f01ed7-4c5f-4078-780f-08db84f337c6
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4557
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
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qKXi6-0001Pa-0k
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: support to show
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
index df0314d..1900b84 100644
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
+		if (size != fscrypt_context_size(ctx))
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
