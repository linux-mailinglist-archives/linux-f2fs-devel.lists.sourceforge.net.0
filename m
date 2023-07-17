Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8400E755A32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 05:48:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLFEB-00056T-Kq;
	Mon, 17 Jul 2023 03:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qLFE9-00056C-H7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 03:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fVJ/C8u0eeC+DXiLQ/FTQTjvIoA+3JJY99pVxeRuIQY=; b=V95zrr206JjG38z0OH5ENMgBj7
 ad+z4dTJMAMwZCN9NyKaSKgxmlnQNJpOsiuLxxsEkLmnI7q17tUBWfTUbPSd0DDApK39cIvoSpneH
 ozuQluXemnqkUf43k+XN3iWqcHyPj9Wn/5sdMpdJW5rGQueeWIkd1BW/3V6HKBpgbBYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fVJ/C8u0eeC+DXiLQ/FTQTjvIoA+3JJY99pVxeRuIQY=; b=N
 lxA5raxxLik6jI7RhlJFHOtQpk6kWXhwiMXv9xIxJY8rZj37ItOBM+AqzgHmbI+EyA4g8ZfrbA88r
 2E9IWu3kldE82Izo4GRLceuK282PY78eTcGvyyRb1pnvxP5v8c65aMcyv3pL/PNYR2+dbqyWxoPx/
 i7toJYsyTnX8CO5U=;
Received: from mail-psaapc01on2087.outbound.protection.outlook.com
 ([40.107.255.87] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLFE0-00ABU5-O5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 03:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOYGKMTyTVvsAS5Ra4uEr/0XrUJLZNeA9XcqU6UFWjl3hM0oxkfRO7VvGTz7gDWvPns/dp5BIaA1gOZVrJQoCNh2VRakZL7Q3d4t3uZGhM0n3tX+IeYP1E66bv4E92Yo1dc5bzGWRBC+UhJSIeNZExYBnwlidwrQ3r5cKLcsERcm0EOh43f8XBj2981aG7bch4njM0T7OWnr4g3cEwdbP7x+Lu9Wi50t4NdntFthbiumz/0Ng8IQefpeK5zN7JAXGlKmmaAT9IUTORYSq1tm/4EUodEuBiYJWJMlm8bA9XS8qVXUI9dpXXG/chGudJ0/BT1YesdDwhPmrrSzppp6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVJ/C8u0eeC+DXiLQ/FTQTjvIoA+3JJY99pVxeRuIQY=;
 b=jCvxYc72Af8mkPf57MNIuk9qlRY8XSQ2ztXIvay820fRU/7NBqIbJIJBLFBIagz7lSysG9su+QlWLYF7bjKBF4+g1+Unlwu071nACSwyMhFt8FgaghqII69/z3EW8MMe+UoMV61HuhEfSPo611mFX7HycQSHHzlj9kZFub/AdUhftlCBZ1teiBayaj9XtmRxX0IzLy0MUdZmxWnVYKCqN+f9F83RM1xZUEzJ5lDYqZxqJYCgMTcJHZ5Ssh1Kwt+Flvg9ggSQ1d2PDZRrXqfHE2wLK6XxDQqueCNF3ILthV5oE6MD4FiJgkgCFFBJxTrLocSjfzdbzObObWuVVq66Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVJ/C8u0eeC+DXiLQ/FTQTjvIoA+3JJY99pVxeRuIQY=;
 b=NlRLYFCzMqMtopTAGkZUR+nHefEPX9U6wLYd9c1JLYVa/zoPeSewXrnQY50Rv2cTaYpLf9tTXwQgqnJHWKy93I4bqgSpwXzQI5TopBEN9pnvExTza8twVePKtSpny7v6/BYheDt22imQd+4H40pOFkUz+VjmIINJ4U3p0t3rl+U=
Received: from SI2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:4:186::18)
 by SI2PR02MB5065.apcprd02.prod.outlook.com (2603:1096:4:155::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 03:48:32 +0000
Received: from SG2APC01FT0041.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:186:cafe::3a) by SI2PR06CA0013.outlook.office365.com
 (2603:1096:4:186::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32 via Frontend
 Transport; Mon, 17 Jul 2023 03:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG2APC01FT0041.mail.protection.outlook.com (10.13.36.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.22 via Frontend Transport; Mon, 17 Jul 2023 03:48:32 +0000
Received: from oem-PowerEdge-T550.adc.com (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 11:48:32 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <ebiggers@kernel.org>
Date: Mon, 17 Jul 2023 11:48:24 +0800
Message-ID: <20230717034824.149711-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0041:EE_|SI2PR02MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b57b03-1ad6-4676-0361-08db8678b11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxvY2ZiZH8s9ui9b8TZXm4xaj1ddjDBYzmWQLO3aZei9pa/dySm/7zrZToerAfSvBRTFkVDMNQeSYQp/hm52EZcdmWT5Rwrjb7yojdrigeeF2eJWOcTvPu99UfdOvA5KgMFnvEUIU6tfZ4SVFGZOLtZVtOgWXdYOPMXG5vwQC/efbA+8QQ9XXYS2g9vwADBasxvQYlS9RXvwuYsJPee8wmwp72iNwBGHQof0pI+ErKt70Way+9pfpMPi3SYTA9584tj9QhzvqVdE1yAVa9jFT1clUZBuYa5Ht8IIHJozAg8J9R2Zo21X08oSSpGJhon44KiVTaHsCnzg1TSNcn3vYdcUJOFFKgWCKxwI2vcI3d6kSVppnw2wn1it66Q1kw5c1LGL1gBHnPnVdLKQb5fHNoQjuJGoANxrIYEab8F6SFPgfFardqo+1jRmU5RPmKqrLZvM1E15W8xMlwnavNZfSxUufCtGYK6QAmm34oCnHCiv4uo+5ZP/k4z9aZMcNVNb+VUIsGsRIgBMX1ex6Er6Y+zll+yw8tgSJ9hwDmyy8VdHZXVdyVBQ+N74uTNdbvUgA03bpnIN8qEXfRvBO3PyIYJrU9aaelUCK+QlqMoACSfSsbo+F31cOWRkS9IhLA8RCqA/zYakFrBH1wctRjL1+cZnTFNuyQqeF3afMHZoYrytzuYRdUHH6jUFC4+DRYPke9DTmsQx/Tt4QpZ3siPhn5AoJrtkpdRKHnH7xfIMwBGuCRj7b6QdULWxN26G0uBYB9iWXJre4RnZ26xsdyN+gw==
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(54906003)(6666004)(110136005)(82740400003)(356005)(81166007)(478600001)(41300700001)(5660300002)(8936002)(8676002)(316002)(70586007)(4326008)(70206006)(2616005)(16526019)(336012)(36860700001)(186003)(83380400001)(47076005)(1076003)(26005)(107886003)(86362001)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 03:48:32.7433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b57b03-1ad6-4676-0361-08db8678b11a
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5065
X-Spam-Score: -0.2 (/)
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
 --- fsck/mount.c | 53 +++++++++++++++++++++++++++++++++++ fsck/xattr.h | 55
 +++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.87 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.87 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qLFE0-00ABU5-O5
Subject: [f2fs-dev] [PATCH v5] f2fs-tools: support to show
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
 fsck/mount.c | 53 +++++++++++++++++++++++++++++++++++---------------
 fsck/xattr.h | 55 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 83 insertions(+), 25 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..75bed75 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -194,7 +194,9 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 {
 	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
 	const int size = le16_to_cpu(ent->e_value_size);
-	const struct fscrypt_context *ctx;
+	char *enc_name = F2FS_XATTR_NAME_ENCRYPTION_CONTEXT;
+	u32 enc_name_len = strlen(enc_name);
+	const union fscrypt_context *ctx;
 	int i;
 
 	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
@@ -211,22 +213,41 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 		return;
 #endif
 	case F2FS_XATTR_INDEX_ENCRYPTION:
-		ctx = (const struct fscrypt_context *)value;
-		if (size != sizeof(*ctx) ||
-		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
+		if (ent->e_name_len != enc_name_len ||
+			memcmp(ent->e_name, enc_name, enc_name_len))
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
+		ctx = (const union fscrypt_context *)value;
+		if (size == 0 || size != fscrypt_context_size(ctx))
+			break;
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
index 22ea35c..73784a3 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -34,22 +34,59 @@ struct f2fs_xattr_entry {
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
+#define F2FS_XATTR_NAME_ENCRYPTION_CONTEXT    "c"
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
