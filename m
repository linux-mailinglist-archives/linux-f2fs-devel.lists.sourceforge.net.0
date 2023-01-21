Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7816763F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:12:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6BF-0004oL-SP;
	Sat, 21 Jan 2023 05:12:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJ6BE-0004oA-0R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F6I6DBa4v9rMn+5+loHiuPsJUZqIj5HPxrbzwCe4L98=; b=XSSExY32jWTua6FpWcDIrSF/+P
 uhS5fX3D7MGujJs/WDni7nhPpltw5kjIdLpOE7UclJwfu6oxEsybMgVQtoV5JxxIAoQJWJ5jWt9+D
 QFY5rCNRn3DSbLFBI8qJ9ypKbf5eyKEWfx/YxYaFwQ0Q4fqQzGw8Ci3muUiCdmslYlxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F6I6DBa4v9rMn+5+loHiuPsJUZqIj5HPxrbzwCe4L98=; b=R
 axnnn46GaoxbGYh038asRQR3uMcBkR5v7MAscDWVk/uRbj7BfhQqVtrNwJGwUJi0qzkXOkaPjykzC
 hgQcvNDxf46k0KJf6Hl35L0WwRRF8029ffgT+yCN82Pn0+AnZl1lEKoXg28gZdhM0uwIP7S6iFZUe
 R03+nIwXTyMtS6QU=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6B8-0004FR-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buIZAvirdL5M6z7mqoeiyyY34gEdNGZZqK+re0ZzN5SG4P01JpMDDHvj1zF+qN/G16C6gaFD17S77e3PW4OxUzC5hf5yTXUxosvZh6urw9Vl/pVOySbyB2IlaubYnABugBXMeiOZK0sS7lrjSx1yznZm/einb0yEBHt1gH55r69yvZeLTHaHK7JkrE2CGLZQdSG26bT9nHSK8Ih71l9q+hxuKld80YqoVr4KqyAfIK5sPJQ1aZeJmWYzj4hE61UnG/JnEOkwUZKEZU7Sn2Tpug80qrw+nzB7Ul3sHNQJOshEhAw4A0yvYfN7SchIpS31f5qcsL5HUzo0i7hPvbeuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6I6DBa4v9rMn+5+loHiuPsJUZqIj5HPxrbzwCe4L98=;
 b=TPYjTzVRiHmLC8gSnSid+qEqJBr+RO5neVGvqUaMQpR8yZ6J7qOA/GrDRToeBnr9NpHZVgWrqIveAKs8pI9ejgSREmnmLA2yFqT9j6kzaLgwWZjlrJqrZrHGXu3JnvFneMpg7lkRMEUa8+EyItOt5oC9TO+3pvIWjps5+RG1/sornwtVYO0n5Qrt3JPe1bS7E8ZjfNFY07f2gVYfZyepOGVx8LkjuiqvEDgEQzJRIBYpKF+uxTAFHC/s/lJK7tqJoqF2/M/FoyPdlvd1HpmrKT5ixVyy9nw4SuuXJmduNpkOC9WOrUHazvf897eaEX1HicgZ28XPoIDELfXCMUJSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6I6DBa4v9rMn+5+loHiuPsJUZqIj5HPxrbzwCe4L98=;
 b=D8gUBKtUNosIzmTije3bOVUv+6rP4t76g+quUfiz0Ch4/grwP/3uKnnjY1342/i9/lRw+HDf6/433YyVdX4EQ28bNYUiPBUH2qkqt2H4Qk/lsJS1D/RxnO++Ofh8UDlo/t8/GilcN0cr/3ohMn8JZf1TcyEoSLq3KTeX7Zj9MT3OGJayqe7s0NPBa0y5861vZk7OQXFKr4jIoc7XVldnxq/TiY8gHxIO61+azK2SIvdeoiM9c99QxojzMcKacqLidhQ3WNSNT/r4rpq5nqnKDxsOr8pekwGIL7XsXCAvG+0q8/JpRYL6ZFoMY9NJqwUcbLY9D7N2GJp8Rf+Utvsn2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3885.apcprd06.prod.outlook.com (2603:1096:400:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sat, 21 Jan
 2023 05:12:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Sat, 21 Jan 2023
 05:12:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 13:12:00 +0800
Message-Id: <20230121051204.81251-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f0235f-20b2-4ff5-fe45-08dafb6e1156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BItqD6sKQgWbN+bW9blq/u7/rhXqf4YQsu+FN5S5MAz00V89U+bI5TE7ZtdciPxRAJpRjDiIjsKPsflZHJHuOMZvRubJ6WecA1L2YKvNwlvkZQksJ6gS2HXj5EFm71fFYfNqNZ/r0522V22ktmSejAFgHGMFIhaWLbzHM0sI4PSAqgHv4qa/wAAPMXFTMAOK5SZLSUNBo2b8FBNnE13XJ13Kt0SDwotlaiWgxqcCq93J4aB7vDEgd/BVXrK4bRJxx88PSHHl7y/bzasnxO1jnxvxbtCNQWma7xMP3lvpntZbneVmefJODHj6ISYgAoQ46us/HEkRWL7AXybj2RZTwasmqDVat9btVgf1BmdLvw5j3YJi5U9OoJXvrGYB5LNvmXyopkpTIspdTppg+ofoZvvGDl2kWpBHhv9CnpQ1MJu6lEDgGrsoNj3laAlT49CDrIC4iXc9waRdnlw+InIFe92LMQ35EZaqoBOzCLI1UlmUL0DOFsX8jBPWt5dhw0u8UvlTFC8opPN+64xAdR+cPsonUKKWg3uDoD2TlxCDH9XQ2NNjigJtGM9BFCHcw7FWq+UJKCUqIo9XA9CsI8CL5gpFyk/FXve1sO77oMJx3ghCBHnIvBGwvhu3yuMHYbhZXtCWyaXce6RW8wUfu9ZYfoKCZ3AQWggbg2E+Z8DodnR6mt4SfkGmWo5l5QvNW4yEB2FPE1NNyuInuZONM3a2wZHIHeluCbb6d9TaDLmOWQc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(86362001)(6666004)(5660300002)(8936002)(30864003)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(41300700001)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(316002)(107886003)(52116002)(478600001)(6486002)(966005)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fp2wBEh2m/4ca7R6LdGZfWuPL7vg8IfQ9XQXzLZBPOZERy67O4fyBwySYI7I?=
 =?us-ascii?Q?NnPXe8aGSp0bDcQ77sBxTN29Cw5tJUBOUM/jm5SsToWIXcI4yK79JC5BO8qk?=
 =?us-ascii?Q?tyuiWHUs7An8TlW8s0kdETySWLPIgBAIsgByQN5667quaGXJKPe/5c/tiVgu?=
 =?us-ascii?Q?PU2+/VqGXDOGlyFq09i5Sp0cci0VIc0Y80LwezyA0h/pO1SDLwFZROn230tQ?=
 =?us-ascii?Q?l0o9C6mUbEVxEm9r4MiClv3MVO0S/zulXz+Nwi9N9hEGlIuA5p0xwB569lsw?=
 =?us-ascii?Q?sRTucq5qX5/k2+mGGp7ys+Sqx9AHD7ndozQ4xjIu2h5bhnvhJ7qZ5/PJ/HbQ?=
 =?us-ascii?Q?4fkWzwum18fR2bR6K/U6K1d0NMYDmVbIIcGugi1gDtBJqz6b46qCbIBPnhj3?=
 =?us-ascii?Q?FDbyRXz37bkgK9Q7haGVsGE93u3HxfnfRe0CAICBtdr+hJIDBHlS594BU1Tc?=
 =?us-ascii?Q?BWiMLOZ41Jf83rUd63Qcd0qy3s5SacAeIZIen8ckwRTFA6/rErF8MAaxK++D?=
 =?us-ascii?Q?Bh9y3/EKIrk1kTO5i7fBEmT2n7H5O2B8lUvGeouMCvv9QkjDlOsGQDTTai9h?=
 =?us-ascii?Q?/c5dQdjb48Ftq9Pmpqq1n/xGumhPIPnyScrRBKEQmcfaKUr7jMEFZNXYHeyo?=
 =?us-ascii?Q?1XgMFY6X6asnN4Tr1rsB0WhKzlh8TlEcyFAIINnp2SNUMSDwbjvgRY5m2g8j?=
 =?us-ascii?Q?ryZpyDQa4jx4VqLvX6cs9dClwpiw5HFzPIJz8qaosN2nbk7c+rNKp3q7KZbb?=
 =?us-ascii?Q?vvrtQlf7+50r3sco/y2IlZxdxUPAA8mXNQvasMBtV4by1fsj1f0LQKg3Ncy8?=
 =?us-ascii?Q?ChC/KEjtbBlvt399SDnGYgqc5wMoNomPhC0GInMMiN0WliPGhuY4YEQzMnDi?=
 =?us-ascii?Q?CCLxNxtwsJS+Nyiwv1UsE50Sms2ZqFitp54viF3VL2Gx7K+YZVIjq5C1L7GX?=
 =?us-ascii?Q?mfmDtOsjy2h4xaVaKYOzdBvzTxTFMwzw8DlLFX6nDLen3aUTFxOLD1+ge/Vt?=
 =?us-ascii?Q?3cduLru4CTEMqapdl0cKONTsPTGTU2GdWJt0XGKxJhdhZZkNKlv33W7rcFKP?=
 =?us-ascii?Q?JmqDby+m3HYv0oQjFhT08QdbmXjRB1dqN4q/l0+GiJTrpo+C3zJe9yesvV4+?=
 =?us-ascii?Q?rwx8iIMSduoLorr37ikqpcqPkZCE3GJSilTx+JVwBPBnwMxH6O19J9ePUrkI?=
 =?us-ascii?Q?nKxT8R/pGhb9PXZgEfiOW7eJ73WTM3K6s3WM+//7pZ2kilk3PkwHxnRRT6cV?=
 =?us-ascii?Q?p4yZlTUFcr4jE7sF/4qr147eRSdkUrXbsfgyNj3YYNUNlZRkUfbdgiLrolNW?=
 =?us-ascii?Q?kv0dD4jEBlKGLbsUtuq0xrv432aeBQoPRbxmhatQRpIglc/0HA2gI8EAKHm1?=
 =?us-ascii?Q?TMX6nQ7EbtM1XPVzPq72NFBQCCH3DhpFrAoc+uMggm9vmEENoA2eTRBzNECg?=
 =?us-ascii?Q?M3xUYH+FjHFkHDggnpw5ZzELgO8+c2xG3PBYtu0p3qKbFfMyNeVT4Zb6xmEg?=
 =?us-ascii?Q?810ygem3uYFbZ3PgJxosPl+Ti0tBhaHAgRnNrm9vdg4iI+IETYwMewVmCXo0?=
 =?us-ascii?Q?Bv2GC+8Dttheqtd2d82DMRBkDOfXyWZTYFFT3GbL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f0235f-20b2-4ff5-fe45-08dafb6e1156
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 05:12:18.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBauoIwxaenwimWyLqe0LqP2wGmd/3v42mm1Sljw9Qw/tWoPPQthl6eJDGc0KClIovVBzEBl1egddwiOJcvK/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3885
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: commit bdc48fa11e46 ("checkpatch/coding-style: deprecate
 80-column
 warning") increased the limit to 100 columns. Let's remove some unnecessary
 newlines. BTW remove a unnecessary blank line and fix blow warning: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJ6B8-0004FR-W5
Subject: [f2fs-dev] [PATCH v2 1/5] f2fs: fix unnecessary newlines in super.c
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

commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
warning") increased the limit to 100 columns. Let's remove some
unnecessary newlines.

BTW remove a unnecessary blank line and fix blow warning:

WARNING: printk() should include KERN_<LEVEL> facility level
+               printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
					PAGE_SIZE, F2FS_BLKSIZE);

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
+               printk(KERN_ERR "F2FS not supported on PAGE_SIZE(%lu) !=
					%d\n", PAGE_SIZE, F2FS_BLKSIZE);

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 493 ++++++++++++++++--------------------------------
 1 file changed, 167 insertions(+), 326 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d8a65645ee48..0cedb693db58 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5,6 +5,9 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
+
+#define pr_fmt(fmt) "F2FS: " fmt
+
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/fs.h>
@@ -378,8 +381,7 @@ static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 					F2FS_OPTION(sbi).unusable_cap_perc;
 
 	f2fs_info(sbi, "Adjust unusable cap for checkpoint=disable = %u / %u%%",
-			F2FS_OPTION(sbi).unusable_cap,
-			F2FS_OPTION(sbi).unusable_cap_perc);
+			F2FS_OPTION(sbi).unusable_cap, F2FS_OPTION(sbi).unusable_cap_perc);
 }
 
 static void init_once(void *foo)
@@ -417,8 +419,7 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
 		if (strcmp(F2FS_OPTION(sbi).s_qf_names[qtype], qname) == 0)
 			ret = 0;
 		else
-			f2fs_err(sbi, "%s quota file already specified",
-				 QTYPE2NAME(qtype));
+			f2fs_err(sbi, "%s quota file already specified", QTYPE2NAME(qtype));
 		goto errout;
 	}
 	if (strchr(qname, '/')) {
@@ -457,23 +458,18 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
 		f2fs_err(sbi, "Project quota feature not enabled. Cannot enable project quota enforcement.");
 		return -1;
 	}
-	if (F2FS_OPTION(sbi).s_qf_names[USRQUOTA] ||
-			F2FS_OPTION(sbi).s_qf_names[GRPQUOTA] ||
+	if (F2FS_OPTION(sbi).s_qf_names[USRQUOTA] || F2FS_OPTION(sbi).s_qf_names[GRPQUOTA] ||
 			F2FS_OPTION(sbi).s_qf_names[PRJQUOTA]) {
-		if (test_opt(sbi, USRQUOTA) &&
-				F2FS_OPTION(sbi).s_qf_names[USRQUOTA])
+		if (test_opt(sbi, USRQUOTA) && F2FS_OPTION(sbi).s_qf_names[USRQUOTA])
 			clear_opt(sbi, USRQUOTA);
 
-		if (test_opt(sbi, GRPQUOTA) &&
-				F2FS_OPTION(sbi).s_qf_names[GRPQUOTA])
+		if (test_opt(sbi, GRPQUOTA) && F2FS_OPTION(sbi).s_qf_names[GRPQUOTA])
 			clear_opt(sbi, GRPQUOTA);
 
-		if (test_opt(sbi, PRJQUOTA) &&
-				F2FS_OPTION(sbi).s_qf_names[PRJQUOTA])
+		if (test_opt(sbi, PRJQUOTA) && F2FS_OPTION(sbi).s_qf_names[PRJQUOTA])
 			clear_opt(sbi, PRJQUOTA);
 
-		if (test_opt(sbi, GRPQUOTA) || test_opt(sbi, USRQUOTA) ||
-				test_opt(sbi, PRJQUOTA)) {
+		if (test_opt(sbi, GRPQUOTA) || test_opt(sbi, USRQUOTA) || test_opt(sbi, PRJQUOTA)) {
 			f2fs_err(sbi, "old and new quota format mixing");
 			return -1;
 		}
@@ -502,8 +498,7 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 		.type = fs_value_is_string,
 		.string = arg->from ? arg->from : "",
 	};
-	struct fscrypt_dummy_policy *policy =
-		&F2FS_OPTION(sbi).dummy_enc_policy;
+	struct fscrypt_dummy_policy *policy = &F2FS_OPTION(sbi).dummy_enc_policy;
 	int err;
 
 	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION)) {
@@ -530,20 +525,16 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 	err = fscrypt_parse_test_dummy_encryption(&param, policy);
 	if (err) {
 		if (err == -EEXIST)
-			f2fs_warn(sbi,
-				  "Can't change test_dummy_encryption on remount");
+			f2fs_warn(sbi, "Can't change test_dummy_encryption on remount");
 		else if (err == -EINVAL)
-			f2fs_warn(sbi, "Value of option \"%s\" is unrecognized",
-				  opt);
+			f2fs_warn(sbi, "Value of option \"%s\" is unrecognized", opt);
 		else
-			f2fs_warn(sbi, "Error processing option \"%s\" [%d]",
-				  opt, err);
+			f2fs_warn(sbi, "Error processing option \"%s\" [%d]", opt, err);
 		return -EINVAL;
 	}
 	err = fscrypt_add_test_dummy_key(sb, policy);
 	if (err) {
-		f2fs_warn(sbi, "Error adding test dummy encryption key [%d]",
-			  err);
+		f2fs_warn(sbi, "Error adding test dummy encryption key [%d]", err);
 		return err;
 	}
 	f2fs_warn(sbi, "Test dummy encryption mode enabled");
@@ -783,8 +774,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_active_logs:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			if (arg != 2 && arg != 4 &&
-				arg != NR_CURSEG_PERSIST_TYPE)
+			if (arg != 2 && arg != 4 && arg != NR_CURSEG_PERSIST_TYPE)
 				return -EINVAL;
 			F2FS_OPTION(sbi).active_logs = arg;
 			break;
@@ -1078,8 +1068,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!strcmp(name, "lzo")) {
 #ifdef CONFIG_F2FS_FS_LZO
 				F2FS_OPTION(sbi).compress_level = 0;
-				F2FS_OPTION(sbi).compress_algorithm =
-								COMPRESS_LZO;
+				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
 #else
 				f2fs_info(sbi, "kernel doesn't support lzo compression");
 #endif
@@ -1090,8 +1079,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 					kfree(name);
 					return -EINVAL;
 				}
-				F2FS_OPTION(sbi).compress_algorithm =
-								COMPRESS_LZ4;
+				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
 #else
 				f2fs_info(sbi, "kernel doesn't support lz4 compression");
 #endif
@@ -1102,16 +1090,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 					kfree(name);
 					return -EINVAL;
 				}
-				F2FS_OPTION(sbi).compress_algorithm =
-								COMPRESS_ZSTD;
+				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_ZSTD;
 #else
 				f2fs_info(sbi, "kernel doesn't support zstd compression");
 #endif
 			} else if (!strcmp(name, "lzo-rle")) {
 #ifdef CONFIG_F2FS_FS_LZORLE
 				F2FS_OPTION(sbi).compress_level = 0;
-				F2FS_OPTION(sbi).compress_algorithm =
-								COMPRESS_LZORLE;
+				F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZORLE;
 #else
 				f2fs_info(sbi, "kernel doesn't support lzorle compression");
 #endif
@@ -1128,10 +1114,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			if (arg < MIN_COMPRESS_LOG_SIZE ||
-				arg > MAX_COMPRESS_LOG_SIZE) {
-				f2fs_err(sbi,
-					"Compress cluster log size is out of range");
+			if (arg < MIN_COMPRESS_LOG_SIZE || arg > MAX_COMPRESS_LOG_SIZE) {
+				f2fs_err(sbi, "Compress cluster log size is out of range");
 				return -EINVAL;
 			}
 			F2FS_OPTION(sbi).compress_log_size = arg;
@@ -1148,10 +1132,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			ext = F2FS_OPTION(sbi).extensions;
 			ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
 
-			if (strlen(name) >= F2FS_EXTENSION_LEN ||
-				ext_cnt >= COMPRESS_EXT_NUM) {
-				f2fs_err(sbi,
-					"invalid extension length/number");
+			if (strlen(name) >= F2FS_EXTENSION_LEN || ext_cnt >= COMPRESS_EXT_NUM) {
+				f2fs_err(sbi, "invalid extension length/number");
 				kfree(name);
 				return -EINVAL;
 			}
@@ -1172,10 +1154,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			noext = F2FS_OPTION(sbi).noextensions;
 			noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
 
-			if (strlen(name) >= F2FS_EXTENSION_LEN ||
-				noext_cnt >= COMPRESS_EXT_NUM) {
-				f2fs_err(sbi,
-					"invalid extension length/number");
+			if (strlen(name) >= F2FS_EXTENSION_LEN || noext_cnt >= COMPRESS_EXT_NUM) {
+				f2fs_err(sbi, "invalid extension length/number");
 				kfree(name);
 				return -EINVAL;
 			}
@@ -1229,14 +1209,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!name)
 				return -ENOMEM;
 			if (!strcmp(name, "block")) {
-				F2FS_OPTION(sbi).discard_unit =
-						DISCARD_UNIT_BLOCK;
+				F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_BLOCK;
 			} else if (!strcmp(name, "segment")) {
-				F2FS_OPTION(sbi).discard_unit =
-						DISCARD_UNIT_SEGMENT;
+				F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SEGMENT;
 			} else if (!strcmp(name, "section")) {
-				F2FS_OPTION(sbi).discard_unit =
-						DISCARD_UNIT_SECTION;
+				F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SECTION;
 			} else {
 				kfree(name);
 				return -EINVAL;
@@ -1248,11 +1225,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!name)
 				return -ENOMEM;
 			if (!strcmp(name, "normal")) {
-				F2FS_OPTION(sbi).memory_mode =
-						MEMORY_MODE_NORMAL;
+				F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 			} else if (!strcmp(name, "low")) {
-				F2FS_OPTION(sbi).memory_mode =
-						MEMORY_MODE_LOW;
+				F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_LOW;
 			} else {
 				kfree(name);
 				return -EINVAL;
@@ -1263,8 +1238,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, AGE_EXTENT_CACHE);
 			break;
 		default:
-			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
-				 p);
+			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value", p);
 			return -EINVAL;
 		}
 	}
@@ -1284,8 +1258,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #endif
 #if !IS_ENABLED(CONFIG_UNICODE)
 	if (f2fs_sb_has_casefold(sbi)) {
-		f2fs_err(sbi,
-			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
+		f2fs_err(sbi, "Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
 #endif
@@ -1296,11 +1269,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	 */
 	if (f2fs_sb_has_blkzoned(sbi)) {
 #ifdef CONFIG_BLK_DEV_ZONED
-		if (F2FS_OPTION(sbi).discard_unit !=
-						DISCARD_UNIT_SECTION) {
+		if (F2FS_OPTION(sbi).discard_unit != DISCARD_UNIT_SECTION) {
 			f2fs_info(sbi, "Zoned block device doesn't need small discard, set discard_unit=section by default");
-			F2FS_OPTION(sbi).discard_unit =
-					DISCARD_UNIT_SECTION;
+			F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SECTION;
 		}
 #else
 		f2fs_err(sbi, "Zoned block device support is not enabled");
@@ -1316,16 +1287,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #endif
 
 	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
-		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
-			 F2FS_IO_SIZE_KB(sbi));
+		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO", F2FS_IO_SIZE_KB(sbi));
 		return -EINVAL;
 	}
 
 	if (test_opt(sbi, INLINE_XATTR_SIZE)) {
 		int min_size, max_size;
 
-		if (!f2fs_sb_has_extra_attr(sbi) ||
-			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
+		if (!f2fs_sb_has_extra_attr(sbi) || !f2fs_sb_has_flexible_inline_xattr(sbi)) {
 			f2fs_err(sbi, "extra_attr or flexible_inline_xattr feature is off");
 			return -EINVAL;
 		}
@@ -1408,8 +1377,7 @@ static int f2fs_drop_inode(struct inode *inode)
 	 * drop useless meta/node dirty pages.
 	 */
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-		if (inode->i_ino == F2FS_NODE_INO(sbi) ||
-			inode->i_ino == F2FS_META_INO(sbi)) {
+		if (inode->i_ino == F2FS_NODE_INO(sbi) || inode->i_ino == F2FS_META_INO(sbi)) {
 			trace_f2fs_drop_inode(inode, 1);
 			return 1;
 		}
@@ -1434,8 +1402,7 @@ static int f2fs_drop_inode(struct inode *inode)
 			sb_start_intwrite(inode->i_sb);
 			f2fs_i_size_write(inode, 0);
 
-			f2fs_submit_merged_write_cond(F2FS_I_SB(inode),
-					inode, NULL, 0, DATA);
+			f2fs_submit_merged_write_cond(F2FS_I_SB(inode), inode, NULL, 0, DATA);
 			truncate_inode_pages_final(inode->i_mapping);
 
 			if (F2FS_HAS_BLOCKS(inode))
@@ -1469,8 +1436,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
 		stat_inc_dirty_inode(sbi, DIRTY_META);
 	}
 	if (sync && list_empty(&F2FS_I(inode)->gdirty_list)) {
-		list_add_tail(&F2FS_I(inode)->gdirty_list,
-				&sbi->inode_list[DIRTY_META]);
+		list_add_tail(&F2FS_I(inode)->gdirty_list, &sbi->inode_list[DIRTY_META]);
 		inc_page_count(sbi, F2FS_DIRTY_IMETA);
 	}
 	spin_unlock(&sbi->inode_lock[DIRTY_META]);
@@ -1505,8 +1471,7 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
-	if (inode->i_ino == F2FS_NODE_INO(sbi) ||
-			inode->i_ino == F2FS_META_INO(sbi))
+	if (inode->i_ino == F2FS_NODE_INO(sbi) || inode->i_ino == F2FS_META_INO(sbi))
 		return;
 
 	if (is_inode_flag_set(inode, FI_AUTO_RECOVER))
@@ -1566,8 +1531,7 @@ static void f2fs_put_super(struct super_block *sb)
 	 * But, the previous checkpoint was not done by umount, it needs to do
 	 * clean checkpoint again.
 	 */
-	if ((is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
-			!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))) {
+	if ((is_sbi_flag_set(sbi, SBI_IS_DIRTY) || !is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))) {
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT,
 		};
@@ -1708,8 +1672,7 @@ static int f2fs_statfs_project(struct super_block *sb,
 		return PTR_ERR(dquot);
 	spin_lock(&dquot->dq_dqb_lock);
 
-	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
-					dquot->dq_dqb.dqb_bhardlimit);
+	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit, dquot->dq_dqb.dqb_bhardlimit);
 	if (limit)
 		limit >>= sb->s_blocksize_bits;
 
@@ -1717,18 +1680,15 @@ static int f2fs_statfs_project(struct super_block *sb,
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		buf->f_blocks = limit;
-		buf->f_bfree = buf->f_bavail =
-			(buf->f_blocks > curblock) ?
+		buf->f_bfree = buf->f_bavail = (buf->f_blocks > curblock) ?
 			 (buf->f_blocks - curblock) : 0;
 	}
 
-	limit = min_not_zero(dquot->dq_dqb.dqb_isoftlimit,
-					dquot->dq_dqb.dqb_ihardlimit);
+	limit = min_not_zero(dquot->dq_dqb.dqb_isoftlimit, dquot->dq_dqb.dqb_ihardlimit);
 
 	if (limit && buf->f_files > limit) {
 		buf->f_files = limit;
-		buf->f_ffree =
-			(buf->f_files > dquot->dq_dqb.dqb_curinodes) ?
+		buf->f_ffree = (buf->f_files > dquot->dq_dqb.dqb_curinodes) ?
 			 (buf->f_files - dquot->dq_dqb.dqb_curinodes) : 0;
 	}
 
@@ -1759,8 +1719,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	user_block_count = sbi->user_block_count;
 	total_valid_node_count = valid_node_count(sbi);
 	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
-	buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
-						sbi->current_reserved_blocks;
+	buf->f_bfree = user_block_count - valid_user_blocks(sbi) - sbi->current_reserved_blocks;
 
 	if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
 		buf->f_bfree = 0;
@@ -1769,8 +1728,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	spin_unlock(&sbi->stat_lock);
 
 	if (buf->f_bfree > F2FS_OPTION(sbi).root_reserved_blocks)
-		buf->f_bavail = buf->f_bfree -
-				F2FS_OPTION(sbi).root_reserved_blocks;
+		buf->f_bavail = buf->f_bfree - F2FS_OPTION(sbi).root_reserved_blocks;
 	else
 		buf->f_bavail = 0;
 
@@ -1779,8 +1737,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 		buf->f_ffree = buf->f_bavail;
 	} else {
 		buf->f_files = avail_node_count;
-		buf->f_ffree = min(avail_node_count - total_valid_node_count,
-					buf->f_bavail);
+		buf->f_ffree = min(avail_node_count - total_valid_node_count, buf->f_bavail);
 	}
 
 	buf->f_namelen = F2FS_NAME_LEN;
@@ -1819,16 +1776,13 @@ static inline void f2fs_show_quota_options(struct seq_file *seq,
 	}
 
 	if (F2FS_OPTION(sbi).s_qf_names[USRQUOTA])
-		seq_show_option(seq, "usrjquota",
-			F2FS_OPTION(sbi).s_qf_names[USRQUOTA]);
+		seq_show_option(seq, "usrjquota", F2FS_OPTION(sbi).s_qf_names[USRQUOTA]);
 
 	if (F2FS_OPTION(sbi).s_qf_names[GRPQUOTA])
-		seq_show_option(seq, "grpjquota",
-			F2FS_OPTION(sbi).s_qf_names[GRPQUOTA]);
+		seq_show_option(seq, "grpjquota", F2FS_OPTION(sbi).s_qf_names[GRPQUOTA]);
 
 	if (F2FS_OPTION(sbi).s_qf_names[PRJQUOTA])
-		seq_show_option(seq, "prjjquota",
-			F2FS_OPTION(sbi).s_qf_names[PRJQUOTA]);
+		seq_show_option(seq, "prjjquota", F2FS_OPTION(sbi).s_qf_names[PRJQUOTA]);
 #endif
 }
 
@@ -1862,18 +1816,13 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	if (F2FS_OPTION(sbi).compress_level)
 		seq_printf(seq, ":%d", F2FS_OPTION(sbi).compress_level);
 
-	seq_printf(seq, ",compress_log_size=%u",
-			F2FS_OPTION(sbi).compress_log_size);
+	seq_printf(seq, ",compress_log_size=%u", F2FS_OPTION(sbi).compress_log_size);
 
-	for (i = 0; i < F2FS_OPTION(sbi).compress_ext_cnt; i++) {
-		seq_printf(seq, ",compress_extension=%s",
-			F2FS_OPTION(sbi).extensions[i]);
-	}
+	for (i = 0; i < F2FS_OPTION(sbi).compress_ext_cnt; i++)
+		seq_printf(seq, ",compress_extension=%s", F2FS_OPTION(sbi).extensions[i]);
 
-	for (i = 0; i < F2FS_OPTION(sbi).nocompress_ext_cnt; i++) {
-		seq_printf(seq, ",nocompress_extension=%s",
-			F2FS_OPTION(sbi).noextensions[i]);
-	}
+	for (i = 0; i < F2FS_OPTION(sbi).nocompress_ext_cnt; i++)
+		seq_printf(seq, ",nocompress_extension=%s", F2FS_OPTION(sbi).noextensions[i]);
 
 	if (F2FS_OPTION(sbi).compress_chksum)
 		seq_puts(seq, ",compress_chksum");
@@ -1931,8 +1880,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else
 		seq_puts(seq, ",noinline_xattr");
 	if (test_opt(sbi, INLINE_XATTR_SIZE))
-		seq_printf(seq, ",inline_xattr_size=%u",
-					F2FS_OPTION(sbi).inline_xattr_size);
+		seq_printf(seq, ",inline_xattr_size=%u", F2FS_OPTION(sbi).inline_xattr_size);
 #endif
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
 	if (test_opt(sbi, POSIX_ACL))
@@ -1982,19 +1930,14 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	if (test_opt(sbi, RESERVE_ROOT))
 		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
 				F2FS_OPTION(sbi).root_reserved_blocks,
-				from_kuid_munged(&init_user_ns,
-					F2FS_OPTION(sbi).s_resuid),
-				from_kgid_munged(&init_user_ns,
-					F2FS_OPTION(sbi).s_resgid));
+				from_kuid_munged(&init_user_ns, F2FS_OPTION(sbi).s_resuid),
+				from_kgid_munged(&init_user_ns, F2FS_OPTION(sbi).s_resgid));
 	if (F2FS_IO_SIZE_BITS(sbi))
-		seq_printf(seq, ",io_bits=%u",
-				F2FS_OPTION(sbi).write_io_size_bits);
+		seq_printf(seq, ",io_bits=%u", F2FS_OPTION(sbi).write_io_size_bits);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
-		seq_printf(seq, ",fault_injection=%u",
-				F2FS_OPTION(sbi).fault_info.inject_rate);
-		seq_printf(seq, ",fault_type=%u",
-				F2FS_OPTION(sbi).fault_info.inject_type);
+		seq_printf(seq, ",fault_injection=%u", F2FS_OPTION(sbi).fault_info.inject_rate);
+		seq_printf(seq, ",fault_type=%u", F2FS_OPTION(sbi).fault_info.inject_type);
 	}
 #endif
 #ifdef CONFIG_QUOTA
@@ -2057,8 +2000,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
 
 	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
-	if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_main) <=
-							SMALL_VOLUME_SEGMENTS)
+	if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_main) <= SMALL_VOLUME_SEGMENTS)
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 	else
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
@@ -2242,9 +2184,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
 	for (i = 0; i < MAXQUOTAS; i++) {
 		if (F2FS_OPTION(sbi).s_qf_names[i]) {
-			org_mount_opt.s_qf_names[i] =
-				kstrdup(F2FS_OPTION(sbi).s_qf_names[i],
-				GFP_KERNEL);
+			org_mount_opt.s_qf_names[i] = kstrdup(F2FS_OPTION(sbi).s_qf_names[i],
+								GFP_KERNEL);
 			if (!org_mount_opt.s_qf_names[i]) {
 				for (j = 0; j < i; j++)
 					kfree(org_mount_opt.s_qf_names[j]);
@@ -2259,8 +2200,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	/* recover superblocks we couldn't write due to previous RO mount */
 	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
 		err = f2fs_commit_super(sbi, false);
-		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
-			  err);
+		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d", err);
 		if (!err)
 			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 	}
@@ -2350,8 +2290,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 * or if background_gc = off is passed in mount
 	 * option. Also sync the filesystem.
 	 */
-	if ((*flags & SB_RDONLY) ||
-			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
+	if ((*flags & SB_RDONLY) || (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
 			!test_opt(sbi, GC_MERGE))) {
 		if (sbi->gc_thread) {
 			f2fs_stop_gc_thread(sbi);
@@ -2383,9 +2322,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
-			f2fs_err(sbi,
-			    "Failed to start F2FS issue_checkpoint_thread (%d)",
-			    err);
+			f2fs_err(sbi, "Failed to start F2FS issue_checkpoint_thread (%d)", err);
 			goto restore_gc;
 		}
 		need_stop_ckpt = true;
@@ -2556,11 +2493,9 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 	int tocopy;
 
 	while (towrite > 0) {
-		tocopy = min_t(unsigned long, sb->s_blocksize - offset,
-								towrite);
+		tocopy = min_t(unsigned long, sb->s_blocksize - offset, towrite);
 retry:
-		err = a_ops->write_begin(NULL, mapping, off, tocopy,
-							&page, &fsdata);
+		err = a_ops->write_begin(NULL, mapping, off, tocopy, &page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
 				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
@@ -2572,8 +2507,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 
 		memcpy_to_page(page, offset, data, tocopy);
 
-		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
-						page, fsdata);
+		a_ops->write_end(NULL, mapping, off, tocopy, tocopy, page, fsdata);
 		offset = 0;
 		towrite -= tocopy;
 		off += tocopy;
@@ -2638,8 +2572,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
 				enabled = 1;
 				continue;
 			}
-			f2fs_err(sbi, "Cannot turn on quotas: %d on %d",
-				 err, i);
+			f2fs_err(sbi, "Cannot turn on quotas: %d on %d", err, i);
 		}
 	}
 	return enabled;
@@ -2700,8 +2633,7 @@ static int f2fs_enable_quotas(struct super_block *sb)
 					 type, err);
 				for (type--; type >= 0; type--)
 					dquot_quota_off(sb, type);
-				set_sbi_flag(F2FS_SB(sb),
-						SBI_QUOTA_NEED_REPAIR);
+				set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
 				return err;
 			}
 		}
@@ -3021,8 +2953,7 @@ static const struct super_operations f2fs_sops = {
 #ifdef CONFIG_FS_ENCRYPTION
 static int f2fs_get_context(struct inode *inode, void *ctx, size_t len)
 {
-	return f2fs_getxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION,
-				F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
+	return f2fs_getxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
 				ctx, len, NULL);
 }
 
@@ -3041,8 +2972,7 @@ static int f2fs_set_context(struct inode *inode, const void *ctx, size_t len,
 			inode->i_ino == F2FS_ROOT_INO(sbi))
 		return -EPERM;
 
-	return f2fs_setxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION,
-				F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
+	return f2fs_setxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
 				ctx, len, fs_data, XATTR_CREATE);
 }
 
@@ -3130,8 +3060,7 @@ static struct dentry *f2fs_fh_to_dentry(struct super_block *sb, struct fid *fid,
 static struct dentry *f2fs_fh_to_parent(struct super_block *sb, struct fid *fid,
 		int fh_len, int fh_type)
 {
-	return generic_fh_to_parent(sb, fid, fh_len, fh_type,
-				    f2fs_nfs_get_inode);
+	return generic_fh_to_parent(sb, fid, fh_len, fh_type, f2fs_nfs_get_inode);
 }
 
 static const struct export_operations f2fs_export_ops = {
@@ -3203,10 +3132,8 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 	u32 segment_count_main = le32_to_cpu(raw_super->segment_count_main);
 	u32 segment_count = le32_to_cpu(raw_super->segment_count);
 	u32 log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
-	u64 main_end_blkaddr = main_blkaddr +
-				(segment_count_main << log_blocks_per_seg);
-	u64 seg_end_blkaddr = segment0_blkaddr +
-				(segment_count << log_blocks_per_seg);
+	u64 main_end_blkaddr = main_blkaddr + (segment_count_main << log_blocks_per_seg);
+	u64 seg_end_blkaddr = segment0_blkaddr + (segment_count << log_blocks_per_seg);
 
 	if (segment0_blkaddr != cp_blkaddr) {
 		f2fs_info(sbi, "Mismatch start address, segment0(%u) cp_blkaddr(%u)",
@@ -3214,42 +3141,33 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		return true;
 	}
 
-	if (cp_blkaddr + (segment_count_ckpt << log_blocks_per_seg) !=
-							sit_blkaddr) {
+	if (cp_blkaddr + (segment_count_ckpt << log_blocks_per_seg) != sit_blkaddr) {
 		f2fs_info(sbi, "Wrong CP boundary, start(%u) end(%u) blocks(%u)",
-			  cp_blkaddr, sit_blkaddr,
-			  segment_count_ckpt << log_blocks_per_seg);
+			  cp_blkaddr, sit_blkaddr, segment_count_ckpt << log_blocks_per_seg);
 		return true;
 	}
 
-	if (sit_blkaddr + (segment_count_sit << log_blocks_per_seg) !=
-							nat_blkaddr) {
+	if (sit_blkaddr + (segment_count_sit << log_blocks_per_seg) != nat_blkaddr) {
 		f2fs_info(sbi, "Wrong SIT boundary, start(%u) end(%u) blocks(%u)",
-			  sit_blkaddr, nat_blkaddr,
-			  segment_count_sit << log_blocks_per_seg);
+			  sit_blkaddr, nat_blkaddr, segment_count_sit << log_blocks_per_seg);
 		return true;
 	}
 
-	if (nat_blkaddr + (segment_count_nat << log_blocks_per_seg) !=
-							ssa_blkaddr) {
+	if (nat_blkaddr + (segment_count_nat << log_blocks_per_seg) != ssa_blkaddr) {
 		f2fs_info(sbi, "Wrong NAT boundary, start(%u) end(%u) blocks(%u)",
-			  nat_blkaddr, ssa_blkaddr,
-			  segment_count_nat << log_blocks_per_seg);
+			  nat_blkaddr, ssa_blkaddr, segment_count_nat << log_blocks_per_seg);
 		return true;
 	}
 
-	if (ssa_blkaddr + (segment_count_ssa << log_blocks_per_seg) !=
-							main_blkaddr) {
+	if (ssa_blkaddr + (segment_count_ssa << log_blocks_per_seg) != main_blkaddr) {
 		f2fs_info(sbi, "Wrong SSA boundary, start(%u) end(%u) blocks(%u)",
-			  ssa_blkaddr, main_blkaddr,
-			  segment_count_ssa << log_blocks_per_seg);
+			  ssa_blkaddr, main_blkaddr, segment_count_ssa << log_blocks_per_seg);
 		return true;
 	}
 
 	if (main_end_blkaddr > seg_end_blkaddr) {
 		f2fs_info(sbi, "Wrong MAIN_AREA boundary, start(%u) end(%llu) block(%u)",
-			  main_blkaddr, seg_end_blkaddr,
-			  segment_count_main << log_blocks_per_seg);
+			  main_blkaddr, seg_end_blkaddr, segment_count_main << log_blocks_per_seg);
 		return true;
 	} else if (main_end_blkaddr < seg_end_blkaddr) {
 		int err = 0;
@@ -3266,9 +3184,8 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			err = __f2fs_commit_super(bh, NULL);
 			res = err ? "failed" : "done";
 		}
-		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)",
-			  res, main_blkaddr, seg_end_blkaddr,
-			  segment_count_main << log_blocks_per_seg);
+		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)", res,
+			main_blkaddr, seg_end_blkaddr, segment_count_main << log_blocks_per_seg);
 		if (err)
 			return true;
 	}
@@ -3294,10 +3211,8 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	/* Check checksum_offset and crc in superblock */
 	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
 		crc_offset = le32_to_cpu(raw_super->checksum_offset);
-		if (crc_offset !=
-			offsetof(struct f2fs_super_block, crc)) {
-			f2fs_info(sbi, "Invalid SB checksum offset: %zu",
-				  crc_offset);
+		if (crc_offset != offsetof(struct f2fs_super_block, crc)) {
+			f2fs_info(sbi, "Invalid SB checksum offset: %zu", crc_offset);
 			return -EFSCORRUPTED;
 		}
 		crc = le32_to_cpu(raw_super->crc);
@@ -3310,8 +3225,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	/* Currently, support only 4KB block size */
 	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
 		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
-			  le32_to_cpu(raw_super->log_blocksize),
-			  F2FS_BLKSIZE_BITS);
+			  le32_to_cpu(raw_super->log_blocksize), F2FS_BLKSIZE_BITS);
 		return -EFSCORRUPTED;
 	}
 
@@ -3323,17 +3237,14 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* Currently, support 512/1024/2048/4096 bytes sector size */
-	if (le32_to_cpu(raw_super->log_sectorsize) >
-				F2FS_MAX_LOG_SECTOR_SIZE ||
-		le32_to_cpu(raw_super->log_sectorsize) <
-				F2FS_MIN_LOG_SECTOR_SIZE) {
+	if (le32_to_cpu(raw_super->log_sectorsize) > F2FS_MAX_LOG_SECTOR_SIZE ||
+		le32_to_cpu(raw_super->log_sectorsize) < F2FS_MIN_LOG_SECTOR_SIZE) {
 		f2fs_info(sbi, "Invalid log sectorsize (%u)",
 			  le32_to_cpu(raw_super->log_sectorsize));
 		return -EFSCORRUPTED;
 	}
 	if (le32_to_cpu(raw_super->log_sectors_per_block) +
-		le32_to_cpu(raw_super->log_sectorsize) !=
-			F2FS_MAX_LOG_SECTOR_SIZE) {
+		le32_to_cpu(raw_super->log_sectorsize) != F2FS_MAX_LOG_SECTOR_SIZE) {
 		f2fs_info(sbi, "Invalid log sectors per block(%u) log sectorsize(%u)",
 			  le32_to_cpu(raw_super->log_sectors_per_block),
 			  le32_to_cpu(raw_super->log_sectorsize));
@@ -3349,8 +3260,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	/* blocks_per_seg should be 512, given the above check */
 	blocks_per_seg = 1 << le32_to_cpu(raw_super->log_blocks_per_seg);
 
-	if (segment_count > F2FS_MAX_SEGMENT ||
-				segment_count < F2FS_MIN_SEGMENTS) {
+	if (segment_count > F2FS_MAX_SEGMENT || segment_count < F2FS_MIN_SEGMENTS) {
 		f2fs_info(sbi, "Invalid segment count (%u)", segment_count);
 		return -EFSCORRUPTED;
 	}
@@ -3411,29 +3321,24 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 			(le32_to_cpu(raw_super->extension_count) +
 			raw_super->hot_ext_count) > F2FS_MAX_EXTENSION) {
 		f2fs_info(sbi, "Corrupted extension count (%u + %u > %u)",
-			  le32_to_cpu(raw_super->extension_count),
-			  raw_super->hot_ext_count,
+			  le32_to_cpu(raw_super->extension_count), raw_super->hot_ext_count,
 			  F2FS_MAX_EXTENSION);
 		return -EFSCORRUPTED;
 	}
 
 	if (le32_to_cpu(raw_super->cp_payload) >=
-				(blocks_per_seg - F2FS_CP_PACKS -
-				NR_CURSEG_PERSIST_TYPE)) {
+				(blocks_per_seg - F2FS_CP_PACKS - NR_CURSEG_PERSIST_TYPE)) {
 		f2fs_info(sbi, "Insane cp_payload (%u >= %u)",
 			  le32_to_cpu(raw_super->cp_payload),
-			  blocks_per_seg - F2FS_CP_PACKS -
-			  NR_CURSEG_PERSIST_TYPE);
+			  blocks_per_seg - F2FS_CP_PACKS - NR_CURSEG_PERSIST_TYPE);
 		return -EFSCORRUPTED;
 	}
 
 	/* check reserved ino info */
-	if (le32_to_cpu(raw_super->node_ino) != 1 ||
-		le32_to_cpu(raw_super->meta_ino) != 2 ||
+	if (le32_to_cpu(raw_super->node_ino) != 1 || le32_to_cpu(raw_super->meta_ino) != 2 ||
 		le32_to_cpu(raw_super->root_ino) != 3) {
 		f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
-			  le32_to_cpu(raw_super->node_ino),
-			  le32_to_cpu(raw_super->meta_ino),
+			  le32_to_cpu(raw_super->node_ino), le32_to_cpu(raw_super->meta_ino),
 			  le32_to_cpu(raw_super->root_ino));
 		return -EFSCORRUPTED;
 	}
@@ -3477,8 +3382,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
 	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
 
-	if (!f2fs_sb_has_readonly(sbi) &&
-			unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
+	if (!f2fs_sb_has_readonly(sbi) && unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
 			ovp_segments == 0 || reserved_segments == 0)) {
 		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
 		return 1;
@@ -3487,10 +3391,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	segment_count_main = le32_to_cpu(raw_super->segment_count_main) +
 			(f2fs_sb_has_readonly(sbi) ? 1 : 0);
 	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
-	if (!user_block_count || user_block_count >=
-			segment_count_main << log_blocks_per_seg) {
-		f2fs_err(sbi, "Wrong user_block_count: %u",
-			 user_block_count);
+	if (!user_block_count || user_block_count >= segment_count_main << log_blocks_per_seg) {
+		f2fs_err(sbi, "Wrong user_block_count: %u", user_block_count);
 		return 1;
 	}
 
@@ -3523,8 +3425,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
 				le32_to_cpu(ckpt->cur_node_segno[j])) {
-				f2fs_err(sbi, "Node segment (%u, %u) has the same segno: %u",
-					 i, j,
+				f2fs_err(sbi, "Node segment (%u, %u) has the same segno: %u", i, j,
 					 le32_to_cpu(ckpt->cur_node_segno[i]));
 				return 1;
 			}
@@ -3542,8 +3443,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
 				le32_to_cpu(ckpt->cur_data_segno[j])) {
-				f2fs_err(sbi, "Data segment (%u, %u) has the same segno: %u",
-					 i, j,
+				f2fs_err(sbi, "Data segment (%u, %u) has the same segno: %u", i, j,
 					 le32_to_cpu(ckpt->cur_data_segno[i]));
 				return 1;
 			}
@@ -3554,8 +3454,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
 				le32_to_cpu(ckpt->cur_data_segno[j])) {
 				f2fs_err(sbi, "Node segment (%u) and Data segment (%u) has the same segno: %u",
-					 i, j,
-					 le32_to_cpu(ckpt->cur_node_segno[i]));
+					 i, j, le32_to_cpu(ckpt->cur_node_segno[i]));
 				return 1;
 			}
 		}
@@ -3574,10 +3473,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	cp_pack_start_sum = __start_sum_addr(sbi);
 	cp_payload = __cp_payload(sbi);
 	if (cp_pack_start_sum < cp_payload + 1 ||
-		cp_pack_start_sum > blocks_per_seg - 1 -
-			NR_CURSEG_PERSIST_TYPE) {
-		f2fs_err(sbi, "Wrong cp_pack_start_sum: %u",
-			 cp_pack_start_sum);
+		cp_pack_start_sum > blocks_per_seg - 1 - NR_CURSEG_PERSIST_TYPE) {
+		f2fs_err(sbi, "Wrong cp_pack_start_sum: %u", cp_pack_start_sum);
 		return 1;
 	}
 
@@ -3613,8 +3510,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *raw_super = sbi->raw_super;
 	int i;
 
-	sbi->log_sectors_per_block =
-		le32_to_cpu(raw_super->log_sectors_per_block);
+	sbi->log_sectors_per_block = le32_to_cpu(raw_super->log_sectors_per_block);
 	sbi->log_blocksize = le32_to_cpu(raw_super->log_blocksize);
 	sbi->blocksize = 1 << sbi->log_blocksize;
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
@@ -3622,8 +3518,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	sbi->secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	sbi->total_sections = le32_to_cpu(raw_super->section_count);
-	sbi->total_node_count =
-		(le32_to_cpu(raw_super->segment_count_nat) / 2)
+	sbi->total_node_count = (le32_to_cpu(raw_super->segment_count_nat) / 2)
 			* sbi->blocks_per_seg * NAT_ENTRY_PER_BLOCK;
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
@@ -3646,8 +3541,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->interval_time[DISCARD_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[GC_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_INTERVAL;
-	sbi->interval_time[UMOUNT_DISCARD_TIMEOUT] =
-				DEF_UMOUNT_DISCARD_TIMEOUT;
+	sbi->interval_time[UMOUNT_DISCARD_TIMEOUT] = DEF_UMOUNT_DISCARD_TIMEOUT;
 	clear_sbi_flag(sbi, SBI_NEED_FSCK);
 
 	for (i = 0; i < NR_COUNT_TYPE; i++)
@@ -3680,8 +3574,7 @@ static int init_percpu_info(struct f2fs_sb_info *sbi)
 	if (err)
 		goto err_valid_block;
 
-	err = percpu_counter_init(&sbi->total_valid_inode_count, 0,
-								GFP_KERNEL);
+	err = percpu_counter_init(&sbi->total_valid_inode_count, 0, GFP_KERNEL);
 	if (err)
 		goto err_node_block;
 	return 0;
@@ -3704,8 +3597,7 @@ static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
 			      void *data)
 {
 	struct f2fs_report_zones_args *rz_args = data;
-	block_t unusable_blocks = (zone->len - zone->capacity) >>
-					F2FS_LOG_SECTORS_PER_BLOCK;
+	block_t unusable_blocks = (zone->len - zone->capacity) >> F2FS_LOG_SECTORS_PER_BLOCK;
 
 	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
 		return 0;
@@ -3739,31 +3631,26 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 		return -EINVAL;
 	}
 
-	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
-				SECTOR_TO_BLOCK(zone_sectors))
+	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz != SECTOR_TO_BLOCK(zone_sectors))
 		return -EINVAL;
 	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
 	if (sbi->log_blocks_per_blkz && sbi->log_blocks_per_blkz !=
 				__ilog2_u32(sbi->blocks_per_blkz))
 		return -EINVAL;
 	sbi->log_blocks_per_blkz = __ilog2_u32(sbi->blocks_per_blkz);
-	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
-					sbi->log_blocks_per_blkz;
+	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >> sbi->log_blocks_per_blkz;
 	if (nr_sectors & (zone_sectors - 1))
 		FDEV(devi).nr_blkz++;
 
-	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
-					BITS_TO_LONGS(FDEV(devi).nr_blkz)
-					* sizeof(unsigned long),
-					GFP_KERNEL);
+	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi, BITS_TO_LONGS(FDEV(devi).nr_blkz) *
+						sizeof(unsigned long), GFP_KERNEL);
 	if (!FDEV(devi).blkz_seq)
 		return -ENOMEM;
 
 	rep_zone_arg.sbi = sbi;
 	rep_zone_arg.dev = &FDEV(devi);
 
-	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
-				  &rep_zone_arg);
+	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb, &rep_zone_arg);
 	if (ret < 0)
 		return ret;
 	return 0;
@@ -3793,8 +3680,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 	for (block = 0; block < 2; block++) {
 		bh = sb_bread(sb, block);
 		if (!bh) {
-			f2fs_err(sbi, "Unable to read %dth superblock",
-				 block + 1);
+			f2fs_err(sbi, "Unable to read %dth superblock", block + 1);
 			err = -EIO;
 			*recovery = 1;
 			continue;
@@ -3811,8 +3697,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 		}
 
 		if (!*raw_super) {
-			memcpy(super, bh->b_data + F2FS_SUPER_OFFSET,
-							sizeof(*super));
+			memcpy(super, bh->b_data + F2FS_SUPER_OFFSET, sizeof(*super));
 			*valid_super_block = block;
 			*raw_super = super;
 		}
@@ -3834,16 +3719,14 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	__u32 crc = 0;
 	int err;
 
-	if ((recover && f2fs_readonly(sbi->sb)) ||
-				bdev_read_only(sbi->sb->s_bdev)) {
+	if ((recover && f2fs_readonly(sbi->sb)) || bdev_read_only(sbi->sb->s_bdev)) {
 		set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 		return -EROFS;
 	}
 
 	/* we should update superblock crc here */
 	if (!recover && f2fs_sb_has_sb_chksum(sbi)) {
-		crc = f2fs_crc32(sbi, F2FS_RAW_SUPER(sbi),
-				offsetof(struct f2fs_super_block, crc));
+		crc = f2fs_crc32(sbi, F2FS_RAW_SUPER(sbi), offsetof(struct f2fs_super_block, crc));
 		F2FS_RAW_SUPER(sbi)->crc = cpu_to_le32(crc);
 	}
 
@@ -3879,8 +3762,7 @@ void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
 
 	err = f2fs_commit_super(sbi, false);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
-								reason, err);
+		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d", reason, err);
 	f2fs_up_write(&sbi->sb_lock);
 }
 
@@ -3900,8 +3782,7 @@ static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
 
 	spin_lock(&sbi->error_lock);
 	if (sbi->error_dirty) {
-		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
-							MAX_F2FS_ERRORS);
+		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors, MAX_F2FS_ERRORS);
 		sbi->error_dirty = false;
 		need_update = true;
 	}
@@ -3923,8 +3804,7 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
 
 	err = f2fs_commit_super(sbi, false);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d",
-								error, err);
+		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d", error, err);
 out_unlock:
 	f2fs_up_write(&sbi->sb_lock);
 }
@@ -3947,10 +3827,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	 * Initialize multiple devices information, or single
 	 * zoned block device information.
 	 */
-	sbi->devs = f2fs_kzalloc(sbi,
-				 array_size(max_devices,
-					    sizeof(struct f2fs_dev_info)),
-				 GFP_KERNEL);
+	sbi->devs = f2fs_kzalloc(sbi, array_size(max_devices,
+					    sizeof(struct f2fs_dev_info)), GFP_KERNEL);
 	if (!sbi->devs)
 		return -ENOMEM;
 
@@ -3964,25 +3842,21 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 		if (max_devices == 1) {
 			/* Single zoned block device mount */
-			FDEV(0).bdev =
-				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev,
+			FDEV(0).bdev = blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev,
 					sbi->sb->s_mode, sbi->sb->s_type);
 		} else {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
-			FDEV(i).total_segments =
-				le32_to_cpu(RDEV(i).total_segments);
+			FDEV(i).total_segments = le32_to_cpu(RDEV(i).total_segments);
 			if (i == 0) {
 				FDEV(i).start_blk = 0;
 				FDEV(i).end_blk = FDEV(i).start_blk +
-				    (FDEV(i).total_segments <<
-				    sbi->log_blocks_per_seg) - 1 +
+				    (FDEV(i).total_segments << sbi->log_blocks_per_seg) - 1 +
 				    le32_to_cpu(raw_super->segment0_blkaddr);
 			} else {
 				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
 				FDEV(i).end_blk = FDEV(i).start_blk +
-					(FDEV(i).total_segments <<
-					sbi->log_blocks_per_seg) - 1;
+					(FDEV(i).total_segments << sbi->log_blocks_per_seg) - 1;
 			}
 			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path,
 					sbi->sb->s_mode, sbi->sb->s_type);
@@ -3997,8 +3871,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			sbi->aligned_blksize = false;
 
 #ifdef CONFIG_BLK_DEV_ZONED
-		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
-				!f2fs_sb_has_blkzoned(sbi)) {
+		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM && !f2fs_sb_has_blkzoned(sbi)) {
 			f2fs_err(sbi, "Zoned block device feature not enabled");
 			return -EINVAL;
 		}
@@ -4009,22 +3882,17 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			}
 			if (max_devices == 1)
 				break;
-			f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: %s)",
-				  i, FDEV(i).path,
-				  FDEV(i).total_segments,
-				  FDEV(i).start_blk, FDEV(i).end_blk,
-				  bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HA ?
-				  "Host-aware" : "Host-managed");
+			f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: %s)", i,
+				FDEV(i).path, FDEV(i).total_segments, FDEV(i).start_blk,
+				FDEV(i).end_blk, bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HA ?
+				"Host-aware" : "Host-managed");
 			continue;
 		}
 #endif
-		f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x",
-			  i, FDEV(i).path,
-			  FDEV(i).total_segments,
-			  FDEV(i).start_blk, FDEV(i).end_blk);
+		f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x", i,
+			FDEV(i).path, FDEV(i).total_segments, FDEV(i).start_blk, FDEV(i).end_blk);
 	}
-	f2fs_info(sbi,
-		  "IO Block Size: %8d KB", F2FS_IO_SIZE_KB(sbi));
+	f2fs_info(sbi, "IO Block Size: %8d KB", F2FS_IO_SIZE_KB(sbi));
 	return 0;
 }
 
@@ -4038,30 +3906,25 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		encoding_info = f2fs_sb_read_encoding(sbi->raw_super);
 		if (!encoding_info) {
-			f2fs_err(sbi,
-				 "Encoding requested by superblock is unknown");
+			f2fs_err(sbi, "Encoding requested by superblock is unknown");
 			return -EINVAL;
 		}
 
 		encoding_flags = le16_to_cpu(sbi->raw_super->s_encoding_flags);
 		encoding = utf8_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
-			f2fs_err(sbi,
-				 "can't mount with superblock charset: %s-%u.%u.%u "
+			f2fs_err(sbi, "can't mount with superblock charset: %s-%u.%u.%u "
 				 "not supported by the kernel. flags: 0x%x.",
-				 encoding_info->name,
-				 unicode_major(encoding_info->version),
+				 encoding_info->name, unicode_major(encoding_info->version),
 				 unicode_minor(encoding_info->version),
-				 unicode_rev(encoding_info->version),
-				 encoding_flags);
+				 unicode_rev(encoding_info->version), encoding_flags);
 			return PTR_ERR(encoding);
 		}
 		f2fs_info(sbi, "Using encoding defined by superblock: "
 			 "%s-%u.%u.%u with flags 0x%hx", encoding_info->name,
 			 unicode_major(encoding_info->version),
 			 unicode_minor(encoding_info->version),
-			 unicode_rev(encoding_info->version),
-			 encoding_flags);
+			 unicode_rev(encoding_info->version), encoding_flags);
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
@@ -4080,10 +3943,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	/* adjust parameters according to the volume size */
 	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		if (f2fs_block_unit_discard(sbi))
-			SM_I(sbi)->dcc_info->discard_granularity =
-						MIN_DISCARD_GRANULARITY;
-		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
-					BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
+		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
 	}
 
 	sbi->readdir_ra = true;
@@ -4147,8 +4008,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_sbi;
 	}
 
-	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
-								&recovery);
+	err = read_raw_super_block(sbi, &raw_super, &valid_super_block, &recovery);
 	if (err)
 		goto free_sbi;
 
@@ -4159,8 +4019,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* precompute checksum seed for metadata */
 	if (f2fs_sb_has_inode_chksum(sbi))
-		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid,
-						sizeof(raw_super->uuid));
+		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid, sizeof(raw_super->uuid));
 
 	default_options(sbi);
 	/* parse mount options */
@@ -4174,8 +4033,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_options;
 
-	sb->s_maxbytes = max_file_blocks(NULL) <<
-				le32_to_cpu(raw_super->log_blocksize);
+	sb->s_maxbytes = max_file_blocks(NULL) << le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
 
 	err = f2fs_setup_casefold(sbi);
@@ -4206,8 +4064,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_export_op = &f2fs_export_ops;
 	sb->s_magic = F2FS_SUPER_MAGIC;
 	sb->s_time_gran = 1;
-	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
-		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
+	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) | (test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 	memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));
 	sb->s_iflags |= SB_I_CGROUPWB;
 
@@ -4232,8 +4089,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_iostat;
 
 	if (F2FS_IO_ALIGNED(sbi)) {
-		sbi->write_io_dummy =
-			mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
+		sbi->write_io_dummy = mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
 		if (!sbi->write_io_dummy) {
 			err = -ENOMEM;
 			goto free_percpu;
@@ -4285,13 +4141,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
-	sbi->total_valid_node_count =
-				le32_to_cpu(sbi->ckpt->valid_node_count);
+	sbi->total_valid_node_count = le32_to_cpu(sbi->ckpt->valid_node_count);
 	percpu_counter_set(&sbi->total_valid_inode_count,
 				le32_to_cpu(sbi->ckpt->valid_inode_count));
 	sbi->user_block_count = le64_to_cpu(sbi->ckpt->user_block_count);
-	sbi->total_valid_block_count =
-				le64_to_cpu(sbi->ckpt->valid_block_count);
+	sbi->total_valid_block_count = le64_to_cpu(sbi->ckpt->valid_block_count);
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
@@ -4310,9 +4164,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			test_opt(sbi, MERGE_CHECKPOINT)) {
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
-			f2fs_err(sbi,
-			    "Failed to start F2FS issue_checkpoint_thread (%d)",
-			    err);
+			f2fs_err(sbi, "Failed to start F2FS issue_checkpoint_thread (%d)", err);
 			goto stop_ckpt_thread;
 		}
 	}
@@ -4320,14 +4172,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* setup f2fs internal modules */
 	err = f2fs_build_segment_manager(sbi);
 	if (err) {
-		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
-			 err);
+		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)", err);
 		goto free_sm;
 	}
 	err = f2fs_build_node_manager(sbi);
 	if (err) {
-		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
-			 err);
+		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)", err);
 		goto free_nm;
 	}
 
@@ -4341,8 +4191,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* Read accumulated write IO statistics if exists */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
 	if (__exist_node_summaries(sbi))
-		sbi->kbytes_written =
-			le64_to_cpu(seg_i->journal->info.kbytes_written);
+		sbi->kbytes_written = le64_to_cpu(seg_i->journal->info.kbytes_written);
 
 	f2fs_build_gc_manager(sbi);
 
@@ -4365,8 +4214,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		err = PTR_ERR(root);
 		goto free_node_inode;
 	}
-	if (!S_ISDIR(root->i_mode) || !root->i_blocks ||
-			!root->i_size || !root->i_nlink) {
+	if (!S_ISDIR(root->i_mode) || !root->i_blocks || !root->i_size || !root->i_nlink) {
 		iput(root);
 		err = -EINVAL;
 		goto free_node_inode;
@@ -4403,8 +4251,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto reset_checkpoint;
 
 	/* recover fsynced data */
-	if (!test_opt(sbi, DISABLE_ROLL_FORWARD) &&
-			!test_opt(sbi, NORECOVERY)) {
+	if (!test_opt(sbi, DISABLE_ROLL_FORWARD) && !test_opt(sbi, NORECOVERY)) {
 		/*
 		 * mount should be failed, when device has readonly mode, and
 		 * previous checkpoint was not done by clean system shutdown.
@@ -4436,8 +4283,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			if (err != -ENOMEM)
 				skip_recovery = true;
 			need_fsck = true;
-			f2fs_err(sbi, "Cannot recover all fsync data errno=%d",
-				 err);
+			f2fs_err(sbi, "Cannot recover all fsync data errno=%d", err);
 			goto free_meta;
 		}
 	} else {
@@ -4498,8 +4344,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_tuning_parameters(sbi);
 
-	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
-		    cur_cp_version(F2FS_CKPT(sbi)));
+	f2fs_notice(sbi, "Mounted with checkpoint version = %llx", cur_cp_version(F2FS_CKPT(sbi)));
 	f2fs_update_time(sbi, CP_TIME);
 	f2fs_update_time(sbi, REQ_TIME);
 	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
@@ -4619,8 +4464,7 @@ static void kill_f2fs_super(struct super_block *sb)
 			truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
 #endif
 
-		if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
-				!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
+		if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) || !is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
 			struct cp_control cpc = {
 				.reason = CP_UMOUNT,
 			};
@@ -4644,9 +4488,8 @@ MODULE_ALIAS_FS("f2fs");
 
 static int __init init_inodecache(void)
 {
-	f2fs_inode_cachep = kmem_cache_create("f2fs_inode_cache",
-			sizeof(struct f2fs_inode_info), 0,
-			SLAB_RECLAIM_ACCOUNT|SLAB_ACCOUNT, NULL);
+	f2fs_inode_cachep = kmem_cache_create("f2fs_inode_cache", sizeof(struct f2fs_inode_info), 0,
+			SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT, NULL);
 	return f2fs_inode_cachep ? 0 : -ENOMEM;
 }
 
@@ -4665,8 +4508,7 @@ static int __init init_f2fs_fs(void)
 	int err;
 
 	if (PAGE_SIZE != F2FS_BLKSIZE) {
-		printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
-				PAGE_SIZE, F2FS_BLKSIZE);
+		pr_err("not supported on PAGE_SIZE(%lu) != %d\n", PAGE_SIZE, F2FS_BLKSIZE);
 		return -EINVAL;
 	}
 
@@ -4789,4 +4631,3 @@ MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
 MODULE_SOFTDEP("pre: crc32");
-
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
