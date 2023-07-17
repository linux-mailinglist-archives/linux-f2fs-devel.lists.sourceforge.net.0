Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD90E7560F0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 12:52:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLLqU-0004Qe-OJ;
	Mon, 17 Jul 2023 10:52:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qLLqQ-0004QP-0A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 10:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C6UOiYcvLPH/ff4Pg3Q0o18xw89hMxnDJzZG4uXGh6U=; b=iVjAIfkkk3cqYSEt2Lfg5ahEpI
 tsiIc8EvY2A6Rh7cQ5M2CDqjxJs55WW49RBLg5MjlzyodDERSvhaSBEgvxHWzIP4kzHgBFfmjo0V5
 5Y+8vifmXxNEJw4fmcc5DRV/G/LSr3nu6mCNFPSvAjW7hm3FDY9ohMM98mVOYqNi7WQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C6UOiYcvLPH/ff4Pg3Q0o18xw89hMxnDJzZG4uXGh6U=; b=D
 9n9SKR49pI9B6RpFRCdJRArnFz1KmBbCi6KphndJUxzJ2C7c/v2aCkWhgK7JiNySE86d3B9dLgR2K
 XHHLaDEHx5UmC+XQxPLjWEUMPJUW2JOVjtAq/r21slutszBpZO9HXZueRivg2Y3Hj5+mOtt21j11l
 w3nZS7ZpvT8vY2co=;
Received: from mail-psaapc01on2049.outbound.protection.outlook.com
 ([40.107.255.49] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLLqG-00ATeO-7n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 10:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+uh594EJ1umfqz0fOV4mq4zpItnfpV9aZXB/Soq/AFO6o/ihR0FAbIT10c/VoJcE/z9bd0EWRQwQjGaLf7jShfkW+jqK7ZbZ8GhSCd0xjZbxO6vbG2nj61HYzl3w9iUkz9LvfqNfTR6mffsTjBPQXoTvSonju8MY6WjT7D2P7VZrw80cof0O8Vh+YRuaeWTbT2TRO+P0IRTFlipsUc8dvucNTBnkJ/FDTtccxJmPwC9TS4OFLjAi6OM/8715p/EPL85ID7OS4R4Gi+jpHb2LdfYwA0LGg8A60RzN4cE9yV9UdADaNHH49b7msofGOFcPnhvGn5NPNR0jLQD+PnxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6UOiYcvLPH/ff4Pg3Q0o18xw89hMxnDJzZG4uXGh6U=;
 b=Zomkg9JZ1DlkfkEhvL1Y0gMrY1fimt2+kEHM7NhLEGVceNJ56i3GG4oincsXRii+yHbBnfLd8XDGDN0BTWo4bxYrjb+pICnEvE84aNIWDnTTDNbEsFBHl4xYzaakGFuau7C/cnxruzXgYgESPqijLO1alzWHB5as2/katjeTIT5Y0Ib6x4x+4HS6oyBNXJ6gO2uwpRdp4tSn4PYMwxYdxIgop+3LaCYez2y9/cnMhlyV20/Bfb9As7mJdE6O7yhuex+nUcYLgy2p0otGxqaKhMQkNI/XqFHk1CdYhqVStCu2Zd7+G+dkN6sVtOLM/j/pNxBGpPWoUfaK0xxxJpO8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6UOiYcvLPH/ff4Pg3Q0o18xw89hMxnDJzZG4uXGh6U=;
 b=n1aS5drZOaFETMZnZA1iEidJ+IwxoR4Vsod7s6KpmLd49W6NpafpZGmI7lSPIfSCA+Eb53cGCT9Y/N6P0/mHYsgI69ZjXxXG8ZDitLlE+sll7lSPKsLjtaCfvVT5XO5wwSAQSqkgGGkJwaFmJfjLawBYuYjw/1rzA3cw+RU4T0U=
Received: from TYAPR01CA0047.jpnprd01.prod.outlook.com (2603:1096:404:28::35)
 by TY2PR02MB4367.apcprd02.prod.outlook.com (2603:1096:404:8007::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 10:52:28 +0000
Received: from TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:28:cafe::3c) by TYAPR01CA0047.outlook.office365.com
 (2603:1096:404:28::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Mon, 17 Jul 2023 10:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 TYZAPC01FT041.mail.protection.outlook.com (10.118.152.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.22 via Frontend Transport; Mon, 17 Jul 2023 10:52:27 +0000
Received: from oem-PowerEdge-T550.adc.com (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 18:52:26 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <ebiggers@kernel.org>
Date: Mon, 17 Jul 2023 18:52:18 +0800
Message-ID: <20230717105218.610616-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT041:EE_|TY2PR02MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2be2f6-0cd1-4e18-eb3f-08db86b3e9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: epHQlI0Glfx5hSxi6HMaMh/EwlXa6is55HduQjFHbYRhPTxG0yaiQCkTWmcb6ipLNrz1rz1tv52wGWvtXLf+QBYAjQF+7bVHq6Wc9vAcmle1PYACE84bgNgF73gr2aYSl5xsFAETVhAa82rAEU4OZhEsICPz6SaIOzXb5XdIuOTkXIdQK/zexPnLi5hMwCaiiNkscrcmKAbsRTzmRCiunxaOHKtI7rmWNnWw319hNbvQDKrVrMot63Of0jUJ+LPRweI6l3P+YWTq/gnLZvp2RVy0EwzCPlSwtNEZsGH4lMT2tgBQhhjLmZtnNWK5ClLnCGObTxpVr1ws5+6auG7tuzrGb+wXqYkopbYxWOtFY6Z2ZYGzdzwGgqz3qw2HOat8XEM4igO6lFZB6xBK4NzEkSU3k0gJts72q2stTZIfcfl/zY1A3Fb5qrGaXr7V38y2zYvHulbTYWUh1k26/S2g+lttE1j82WXH5QP9/qjSPwqR027HYNEtjHGl4CgXM3ckdKJY30tqjTHjL8WWXOYwgcsZsGSCVSLFCdIeHuoWs2cwF1LkGr60VuXV/MbQ4ZRGsc6yMyLhnqroyckOXrKj4e25RoaQpRLpRF1OX7djH/b9Ojt6+4ij35twwGmwP5c3I9azmzDEh+ND/zbYOMt6aT+sP4U6hVNB1kMNhwggIni8knwpE1Ib0YhdU1pdTirqmvMzJ4KqUrzne8hSs6FUZ7HGATXDHMjpK8HUs6qlljU7f3KkS9G2SVjiXJb3L8Q/vS443DoDRBGXDySgWU4JOQ==
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(86362001)(2906002)(36756003)(40460700003)(40480700001)(186003)(16526019)(336012)(83380400001)(36860700001)(47076005)(1076003)(26005)(107886003)(82740400003)(356005)(81166007)(70206006)(6666004)(54906003)(110136005)(70586007)(316002)(2616005)(4326008)(41300700001)(478600001)(5660300002)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 10:52:27.9241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2be2f6-0cd1-4e18-eb3f-08db86b3e9b4
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB4367
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
 --- v6: - print notice for unsupported fscrypt_context version v5: - check
 if e_name/e_name_len is match [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qLLqG-00ATeO-7n
Subject: [f2fs-dev] [PATCH v6] f2fs-tools: support to show
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
v6:
- print notice for unsupported fscrypt_context version
v5:
- check if e_name/e_name_len is match with F2FS_XATTR_NAME_ENCRYPTION_CONTEXT
v4:
- logic fixs & avoid memory out-of-bounds accessing

---
 fsck/mount.c | 53 +++++++++++++++++++++++++++++++++---------------
 fsck/xattr.h | 57 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 85 insertions(+), 25 deletions(-)

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
index 22ea35c..cddafa7 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -34,22 +34,61 @@ struct f2fs_xattr_entry {
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
+	default:
+		MSG(0, "Unsupported fscrypt_context format!\n");
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
