Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F969B874
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Feb 2023 08:14:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pTHQR-00072a-Nf;
	Sat, 18 Feb 2023 07:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pTHQP-00072T-F5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Feb 2023 07:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=35Y02bPB0vDINB8bzJx+1bXADY1F1W7MaQSpb5ux9Fs=; b=CFudlISB6kK9Keg+iSwZcu5B3X
 7Ta6GPKKxQNzhUKy2/7wJzOmtcOx/UU7aMt0NrOArCw1CzS3EJnB2r+pU6/AK9gGCUoHD1tHLA1p0
 PTc+l6Ko4EZ3t/yp2L7Mt6wyfVZ1SNvCuhNDTlz1zmcwjYr314s1QXBrUthi+Pssvx5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=35Y02bPB0vDINB8bzJx+1bXADY1F1W7MaQSpb5ux9Fs=; b=k
 6PtmC2C3qC4ayR/PiFFdnAp6Hse0ySSkG5Lcm4J9bq5+EJJawiqk5SM7PDhGnp0mozLLOzIIFYOzK
 nLZufMZuMh0q3jm0jf/kSBJ9RWB/OMBfhihLpN9tElRNAJG+ILzgWCP81XiuroFnbVPKJRiQGOw9t
 gavm9uOxR5AESoSU=;
Received: from mail-sgaapc01on2103.outbound.protection.outlook.com
 ([40.107.215.103] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pTHQE-0005j3-Oq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Feb 2023 07:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHbhf8O4cTGsPq0ZqjmJkBh5z/+x9JZsWvAbp6VykJaG+TGjoAcE3Zc/B4Pslsrbu1z87bxOzyyKpOehKY1igN8K/FHE8hBg3sATPlj4eM4sgWPzbZ2WBPVC87ts4a7tL3TxtmT9ai5ZWX0DqFIoBiJydZx3I82pwDav2Ng2Gv9qNhv/8RIz80luo79+Yf+3UOOp+5tIc4rEb5FKK5aRqo/HYGczW71RsQ5p08G2XLb1VExEPek5nLymIBQ/b29wLZWbMs956Jd9t4+j1Rq2KmfIdJENjuJQriKVzQnS1ZtUVicj4ZvQVHVyezAmaBaXasUcHl9FXrTwG+Klj2Vplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Y02bPB0vDINB8bzJx+1bXADY1F1W7MaQSpb5ux9Fs=;
 b=isT1u0tVEAhdTg5t4XkxXnndCBHbLpvhhJ1NQmuYC6OM8xSm6clLjXg26rLDxTC6TTxY6uqgx5ai2wSXHXwVcJbKy8elKA2kYhYqK2acKgnOPAul8NLJcxg78DZ30UpaxBCGgK5sdtePG15fOe01f2KyceHGAc6GeMgMjUyZNuoQ1FO1zvzxhvVXgLJG9eahPz7r/VEidqPlkzQaAP6fSaVjbl2DyKOdcj2NHh9EMde3Bx4SwEC5FiAIGLYnNjC3anBBEltAgf2rf7nRRCdsPatKWMPfbI6YMa1Fh5tTQDEJFPC9mjeP8BNkAMQDy+aU+wM+FbGPbZ3q5Be3E300Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35Y02bPB0vDINB8bzJx+1bXADY1F1W7MaQSpb5ux9Fs=;
 b=ENPBzPk1axsT7JZ+iQoA1TSIb8EXLFV2rJrGucz1aS+t2a4n1CJbiHOQ1LLg795qpYp2PswsUm2w+9xF3NbU+mZhHNcfaXjOTo9B+ISStrmHiEBXfJ1UGHDd/m1SnHRFNN7XR0drC0vo0YWblHuwZOEXXkUxD0bowsIzsVcNZy+x6ZbuEmrvf7/Em4Vcwc959ZiklV8oCfeztB6IkEn7eLWYg9JD+dptXUBuBj4M45UHyjFSxwY4iqM58Lkp5srGHEHox/Js0IJ/Hu1X4tDS0n7r8lItNh0LAtm/5SqZliQ9HCWPJNcjEfbG8yR/pFXRQK3rltwelrMOd9pXA5RdIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6069.apcprd06.prod.outlook.com (2603:1096:820:de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Sat, 18 Feb
 2023 07:14:01 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Sat, 18 Feb 2023
 07:14:01 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 18 Feb 2023 15:13:46 +0800
Message-Id: <20230218071346.80086-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: bad27ebd-66c1-485a-01c6-08db117fb58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHkCLFyGsPmk6XW4DNcQpLjRKKtZk55NGLD4sl/Nwk4wvhPP/aumjkZ7qJKXwXrSgNCortqbzstNzfJdPGczpHWtBDJrfUsu0Q5Hz15w1B3WQ60tbXFOaAOLmSxqjLuPh7lJeCQsNAccLA6ccKCzS5f0bIpTkih2ul23ksntcBU7BDR6t69waDn+IJh6/dTXrUJLZ9dg9s8EhehXd2ehkrWJihdZ19mfHUUA77hGmYUvzfocnNaEZF63+Fyx+fJMbpMOVaRuT5uhJZpYr9Ghc4kfxqdgEoCOy0buN/D8PAPYsgMfivDGMeCLuT/sUH1rOOZCM2pNINjW31IcUYy/Ucfxcm8ulTAUuVG90LD78IPICLOurzvtFT9Zn3a5vRLWpXhrSnlPK2IRcSUwtMum6+Svc6FAvpJS5VfnMXjSAT7VESIKHV3jAyMowx4f6bsMPlQGKGjOX4kNw0fwkbKDhKn/IWPm1DEtyl9ZfmpeceL3/RaX3Qr0sW2QGDI5uISP0OHJmwDcgUVuYpaCoAvkW4ND8rGtokim9SLo7ttJmYeAMX8cbI3Z46qTHNVkYa0vLwxH5vxSbHZHxfBJWbLF5JvJDR1bm3XE9j5x9M9Du37ueiqcuilPiU/0ivxCZbz7yyf+7yPaTlnSzrakNoft2naT1pKQCiiFKo56MM+t2GmvHywXCGfezPhdsxoAtpnWy+Y/qXMfWpeDB/1nS4JS3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(6512007)(186003)(26005)(2616005)(1076003)(4326008)(8936002)(8676002)(6506007)(41300700001)(5660300002)(86362001)(19627235002)(107886003)(6666004)(52116002)(2906002)(316002)(66946007)(66556008)(38350700002)(66476007)(38100700002)(478600001)(36756003)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uirTCNBrsNoMu5NmeKDMNFP4jqcvodMR6BXY3aiF5TI2AeoZVJ6OCCa+6iDP?=
 =?us-ascii?Q?48hV1nBbcH1Eq0mx4PPxy5sRfQvMKh+bQ+RFxxb/nNmE3nV3CvvT1QGcNyPw?=
 =?us-ascii?Q?Zk3D5g0wLVs94nKmcYjWgSodTSn9WmZHILn7M98UccMKHw4JCvsA96WDeZ8F?=
 =?us-ascii?Q?lpuyAz4yJKyMUFjUROEy/u9v1Xn4MbEwLt8Ar+U+m4+mfRDJa/K2L55RsctC?=
 =?us-ascii?Q?KRCWIdb2GdQwKds4nXqF8JNdVcJtOE2zV1lgLDdPjQAqA7K8hVsP0EjJ5XjL?=
 =?us-ascii?Q?CEDnImabHK7G0UCQsg4Ndx58LlSRIbwJSqzFiDvqtI4oX6ckPkuH2XiqUQlT?=
 =?us-ascii?Q?Caosd89bEayq09v+MKvgqoQx6C+Tw31IVFBeYFNfOP9BaE2CW2/BR1DSZqWE?=
 =?us-ascii?Q?TiC+KdQsxAOv+sQT5N9SVYaj4G/4IybKVVkzfvQ+3LgIbuS100JbZ25FbZwC?=
 =?us-ascii?Q?pghzhxObPcN0rKpxvCOqjbzygIkDxOqXGId8u0uXAwOQsgN8AcPWKEY7Jibl?=
 =?us-ascii?Q?nDg9cJXb6ZCDXUK8hgnCFSBjPyrW3UK6Ag/5n+6zi9yxCpB4bj4+IRLZPI+u?=
 =?us-ascii?Q?HkWCrIB1i84IlZ/FaNvHQOViL4a2XZCCtGlaHzJfzvcMAcs48c/8OLejiar5?=
 =?us-ascii?Q?KTwnVnK2zLx95U61xJ7Gwu73PTnTx0f5wBHr4FDMLnkJGDnJgFUasMKkSOuT?=
 =?us-ascii?Q?ngs2aFNZhCJ4eIhTH5V4nKkSJjl3ZjIKNHCaS6+bvTXWRqKjaFnnmfmvHTHE?=
 =?us-ascii?Q?tzegKZBKBCotLlrV/8ZQUyUXiT97NANdWUu7q07/EpvaLBVjOgvSbf4zTQQD?=
 =?us-ascii?Q?k3hpUC0rb7ooEUqcZGvZD4kqzjMq123lNsP+fB6e4fy1ur1pG3qwZfNQchs3?=
 =?us-ascii?Q?Na4zbARE3pwii+S2fIYtTN8DeWZvWXFH5nTHM/wN4hsFy274gEQeGMZlZv5V?=
 =?us-ascii?Q?wcKqXSbphiYXeLULHEPVhNhKVlpjwuvNNsVs+nVYOt1nMQVQuhU6bP7dlUNW?=
 =?us-ascii?Q?3WbZuPKPcaaig46v6mKNuda5xs/l9NO0xRqF85tviV4dy/uPHZF+Suy0tlQ6?=
 =?us-ascii?Q?Fe7IrtnBme6wJkQxvlyZ0pqy0IEyzHKNFOFqGCdiKiQ/t+DBn62BFeD2IrKS?=
 =?us-ascii?Q?3ZQEp2BMmzF0r7FTSnVSig4aPQFG3s35R2A4Rvf3nE4YuhyLGqULHLET1vFI?=
 =?us-ascii?Q?VTW09Ua/3LpCPd0iCshQApAk0Z82ebaXDCrszkI8bc2kZPRt9tJvtFnAqOsb?=
 =?us-ascii?Q?26gUPCiDynBxfH0TJgZedlRo8+IGbwMKf/ktoANwvn/Lj3RC2nDjSsLEYH9c?=
 =?us-ascii?Q?A0SX6eeDCn6AmHwwv/FUeDp4Qwkuq7hvOjM7cwnDyfdSL/xj4+sV/IG8dM7S?=
 =?us-ascii?Q?g3TN9rjT2UF1Mma/MthmF/fLYBAVkdV+WcjYBd+Vikc0jre6WGZ2b5i3uGIw?=
 =?us-ascii?Q?MofgXAL98krNCQrpNFwT/mGQtNL0lemSh0xFlUicfBxdMXdlwusqHwoKvDb3?=
 =?us-ascii?Q?2ZdCKUkGNGj/z8ap8ceE94+ZGVeK/OI2AU6czWxfwiMQnGvx44t8kRLEoMgL?=
 =?us-ascii?Q?jOOehv4g6RL3iFnGfZSO/y4t8tu/LJCVstXXAC5j?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad27ebd-66c1-485a-01c6-08db117fb58a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2023 07:14:00.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh6fGYD2zn1m6qGKsEnm/8ptfZWXv4jfyNVjJC0kdi/n9B/JHOl5e5u7TctticAb0Zozgek8eGPJreu5+gc+Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6069
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to inject fault into
 f2fs_down_write_trylock().
 Usage: a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or b) mount -o
 fault_type=524288
 <dev> <mountpoint> Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/f2fs.h | 16 +++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.103 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.103 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pTHQE-0005j3-Oq
Subject: [f2fs-dev] [PATCH] f2fs: support fault injection for
 f2fs_down_write_trylock()
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to inject fault into f2fs_down_write_trylock().

Usage:
  a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
  b) mount -o fault_type=524288 <dev> <mountpoint>

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
 Documentation/filesystems/f2fs.rst      |  1 +
 fs/f2fs/checkpoint.c                    |  4 ++--
 fs/f2fs/f2fs.h                          | 16 +++++++++++++++-
 fs/f2fs/file.c                          |  8 ++++----
 fs/f2fs/gc.c                            | 10 +++++-----
 fs/f2fs/node.c                          |  2 +-
 fs/f2fs/super.c                         |  1 +
 8 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 94132745ecbe..a34507fbd01f 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -714,6 +714,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_DQUOT_INIT         0x000010000
 		FAULT_LOCK_OP            0x000020000
 		FAULT_BLKADDR            0x000040000
+		FAULT_LOCK               0x000080000
 		===================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 2055e72871fe..a81c896464ff 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
 			 FAULT_BLKADDR		  0x000040000
+			 FAULT_LOCK	          0x000080000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1369ec892a2c..93cee10d3244 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -372,7 +372,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 		goto skip_write;
 
 	/* if locked failed, cp will flush dirty pages instead */
-	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
+	if (!f2fs_down_write_trylock(sbi, &sbi->cp_global_sem))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, META);
@@ -1182,7 +1182,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
 	if (!is_journalled_quota(sbi))
 		return false;
 
-	if (!f2fs_down_write_trylock(&sbi->quota_sem))
+	if (!f2fs_down_write_trylock(sbi, &sbi->quota_sem))
 		return true;
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
 		ret = false;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21596e0266ba..462e478528e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -61,6 +61,7 @@ enum {
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR,
+	FAULT_LOCK,
 	FAULT_MAX,
 };
 
@@ -2207,8 +2208,21 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
 	down_write(&sem->internal_rwsem);
 }
 
-static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+#define f2fs_down_write_trylock(sbi, sem) __f2fs_down_write_trylock(sbi, sem)
+
+static inline int __f2fs_down_write_trylock(struct f2fs_sb_info *sbi,
+					struct f2fs_rwsem *sem)
+{
+	if (time_to_inject(sbi, FAULT_LOCK))
+		return 0;
+#else
+#define f2fs_down_write_trylock(sbi, sem) __f2fs_down_write_trylock(sem)
+
+static inline int __f2fs_down_write_trylock(struct f2fs_rwsem *sem)
 {
+#endif
+
 	return down_write_trylock(&sem->internal_rwsem);
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ca1720fc1187..4fa9a5468e61 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2462,7 +2462,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 		return ret;
 
 	if (!sync) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
@@ -2506,7 +2506,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 
 do_more:
 	if (!range->sync) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
@@ -2851,7 +2851,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
 	if (src != dst) {
 		ret = -EBUSY;
-		if (!f2fs_down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
+		if (!f2fs_down_write_trylock(sbi, &F2FS_I(dst)->i_gc_rwsem[WRITE]))
 			goto out_src;
 	}
 
@@ -2971,7 +2971,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	end_segno = min(start_segno + range.segments, dev_end_segno);
 
 	while (start_segno < end_segno) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0a9dfa459860..8f4c99741f03 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -104,7 +104,7 @@ static int gc_thread_func(void *data)
 		if (foreground) {
 			f2fs_down_write(&sbi->gc_lock);
 			goto do_gc;
-		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		} else if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			stat_other_skip_bggc_count(sbi);
 			goto next;
 		}
@@ -1546,7 +1546,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				return submitted;
 			}
 
-			if (!f2fs_down_write_trylock(
+			if (!f2fs_down_write_trylock(sbi,
 				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
 				iput(inode);
 				sbi->skipped_gc_rwsem++;
@@ -1589,11 +1589,11 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			int err;
 
 			if (S_ISREG(inode->i_mode)) {
-				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
+				if (!f2fs_down_write_trylock(sbi, &fi->i_gc_rwsem[READ])) {
 					sbi->skipped_gc_rwsem++;
 					continue;
 				}
-				if (!f2fs_down_write_trylock(
+				if (!f2fs_down_write_trylock(sbi,
 						&fi->i_gc_rwsem[WRITE])) {
 					sbi->skipped_gc_rwsem++;
 					f2fs_up_write(&fi->i_gc_rwsem[READ]);
@@ -2113,7 +2113,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
 
 	/* stop other GC */
-	if (!f2fs_down_write_trylock(&sbi->gc_lock))
+	if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock))
 		return -EAGAIN;
 
 	/* stop CP to protect MAIN_SEC in free_segment_range */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 19a1fee88a36..e35cbf0fc56b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -517,7 +517,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	int nr = nr_shrink;
 
-	if (!f2fs_down_write_trylock(&nm_i->nat_tree_lock))
+	if (!f2fs_down_write_trylock(sbi, &nm_i->nat_tree_lock))
 		return 0;
 
 	spin_lock(&nm_i->nat_list_lock);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa55dc12aff2..33a315795deb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 	[FAULT_LOCK_OP]		= "lock_op",
 	[FAULT_BLKADDR]		= "invalid blkaddr",
+	[FAULT_LOCK]		= "lock",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
