Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C245753F64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 17:59:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKLCd-0000u4-7r;
	Fri, 14 Jul 2023 15:59:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qKLCZ-0000ty-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 15:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YiYeolEfEqG3+oCCwnbWCcHlDKCqXu645GWI40nmHJc=; b=QUqK5AtR7zJhIa6nF9yjuG4tFY
 10qc+N82BPVU8yDda3UQgfmPTYeh092ozbRRhhXFiJfCaV7Ae4RfprdZtk2s0cegi/4KmaNeytRwu
 CFVz2K3RnpjBSCGYzl0Dxhiu49urMR2o3/CfjNz6SspFygMQTH7X/QVzS0h7On53tAUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YiYeolEfEqG3+oCCwnbWCcHlDKCqXu645GWI40nmHJc=; b=f
 Cv6/eictkZ7vDxjTxymSJGbp4E+GD6U0jntlFDIuylpVYXll9RoTtT1coHFP/rmgqE08l8eu5u4zO
 V40rNsj5M9F9bJhORNIFEC9kS94l0D7JZmpz/EEDOk5cX+DvLxVuAYD2TvDcmR3Pg02WA1nDviCbj
 rLxJDbYHjLIWmFrg=;
Received: from mail-psaapc01on2058.outbound.protection.outlook.com
 ([40.107.255.58] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKLCU-0003qH-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 15:59:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndQ2epljDtjtWLWvk81OewUvalKLDiOZw8pISD/66i2RdHXqX+lMuKXiC4AZrgvSjejIZl+aT3ewhA2N71ZzLLKGK49VZ+idc47rR+KbcImLiPqgFuTSWMZHSo8/qA8Xi5aQBlCxm4SlRStc+B7d7lhf48z/jAAjM3GM3hu7daKfYExhGA2iMvy8LlgyO6Arg9VJ6mHKvdEi3EQhKh+B9+/HOYs1Po0+0OmsKvTH6JmHw3SBFTy+NYEp2T5X4FwEaONQKMsSStfeKq5Og5YiGFyJD3LL1K3sMckJ0XWJCv5FWMogQeYVYI7bxt2Snc7IgoS3XoQYJvRjTKlsliuppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiYeolEfEqG3+oCCwnbWCcHlDKCqXu645GWI40nmHJc=;
 b=WhVURtBxEPKv4F79Ns+MdqJvMxGWFG+i3VBXvCabE7o9oGZqGO9+48u45C8xbHRYSvLvrrL1hSCJ1NTAw9yKu4RcZJg6iCbZhxJ1LWGi/yZrW98KnuIQKu0riZzD8qJG9FGilGRPLq6cbjisVMwMiZsNBJULftVuR9gpNeIIUqgKl2YreH65npst9TTpGeQ9pxKAAVdV6Z+KnCAS4TVFdyaP9wmVXRYoH/rg0xGdesnWg7rrzrddvXXhdVo2aw6pu9vB1tC/KPLOVnuSC1nVJTt14lkKCinbeqtWweDyuincLVHibZiPXwoph89zikb0NBLqwvntfjGsnauZGDB4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiYeolEfEqG3+oCCwnbWCcHlDKCqXu645GWI40nmHJc=;
 b=pnvttafHJ6p3axtXyvyJ8t9DDexOS75IFPHgLrQQgHBeQTSqealGYSWwNhOYiGmZ6430ZnKnqCZGq8YFqlWGY18CUaz2yu1umDRGpc10rCFDVBXYtuGD+ET3H7+HNMGqZIROZDsgxWtxikW8MKhRD1nYREmVfc57auCnTW+fSNU=
Received: from PS2PR02CA0043.apcprd02.prod.outlook.com (2603:1096:300:59::31)
 by TYZPR02MB4942.apcprd02.prod.outlook.com (2603:1096:400:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:59:08 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::3d) by PS2PR02CA0043.outlook.office365.com
 (2603:1096:300:59::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Fri, 14 Jul 2023 15:59:07 +0000
Received: from oem-PowerEdge-T550.adc.com (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 23:59:06 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <ebiggers@kernel.org>
Date: Fri, 14 Jul 2023 23:58:43 +0800
Message-ID: <20230714155843.1884065-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|TYZPR02MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db4fbdb-0299-4ccb-7eb1-08db848341b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RkiLREEXhE1jyyj+05uXpuM4mVCv3ag3yv+UJe2BQgQDbFXlqsqqKkHBPr7lu2lMkq9Z9rpJ9Vu78XBaJdHHwyfew3aQPTxevqQOm60ToL15+n2GsQxoHw37sJ1Qce9D2FkC7hjLrL5uAeTYTPeRRnuX5kORyWqraEJsqmCT5jcQWDZpC55v1JcLsZym4no2/x/ukn7YxLJwyuLUONpgx9Ly/i5gykgTtSL4zoEl3PcZZntpt+iPa4pgMaytZb5MD6x60p0zVqyzL9p5BbxnhcECQZOi8j12Hrhoklha9UBCIhyB5PC07jvC2sNHJsSX/fpBTMLwNlflUqp50r8oVn08v9G3mRKDSo1damFCHbX9XCgrDXyZP6z/fhUPkgr299sLDvd15hyO8j1WIdW7se4n6t53iG6mpsxKzGF/yLhTGnNicC+RDrw3SG9OMblx09DBQVniAdnGMfFLEyNkVHFqx6xyvIMLMtdpKv71zxKXcngDG/GNJytXk0VLMIZcKkh3uh26fjX5/5CWrQb8anZlv5GpD39oaUUQgAWailUjDrdYL6kIx2VXVqRuvyq9keQaMAvkG0K6lUIhfSFxMrWrQK+T+9BDsc4kd7wWsRn1jlNdcNuvGujqe+smhy/tIErvCMK0Y20DQ2vIXELNVnwQsxC6PB/29GW8UNdrooBe+a16iOsrpXKOiONXX2HmP+DnXGlxZs3Ne/mvM6FyOU13ENOUyuzBXvMgm8h4ISHU3YedR5fVTbbBTCNdCtejGJNjN8VtvMsC1lFmnqcFg==
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(2906002)(83380400001)(8936002)(8676002)(336012)(316002)(41300700001)(82310400005)(2616005)(5660300002)(47076005)(81166007)(110136005)(54906003)(70206006)(36756003)(4326008)(70586007)(16526019)(186003)(26005)(1076003)(356005)(107886003)(82740400003)(478600001)(40460700003)(40480700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:59:07.9228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db4fbdb-0299-4ccb-7eb1-08db848341b1
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4942
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As the fscrypt context has two versions now, this patch adds
 the support of fscrypt_context_v2 for print_xattr_entry. Signed-off-by:
 Weichao
 Guo <guoweichao@oppo.com> Signed-off-by: Sheng Yong <shengyong@oppo.com>
 --- fsck/mount.c | 46 +++++++++++++++++++++++++++++ fsck/xattr.h | 54
 +++++++++++++++++++ [...] 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.58 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 FORGED_SPF_HELO        No description available.
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qKLCU-0003qH-1Q
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: support to show
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
 fsck/mount.c | 46 +++++++++++++++++++++++++++++---------------
 fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 76 insertions(+), 24 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..fce01d1 100644
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
 		return;
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
+		return;
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
