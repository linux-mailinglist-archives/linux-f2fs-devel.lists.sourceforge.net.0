Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBC481164
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Dec 2021 10:47:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n2VYc-0001YA-FM; Wed, 29 Dec 2021 09:47:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1n2VYH-0001Xt-1L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Dec 2021 09:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o4kp0npKP+fQfEjSysiYSnyb3l1okQYjxbUzVVtlO+4=; b=R1CVdK9cQxp6Vu0VDEY9J9S8NC
 U68O9pnvhs0RIXsy8jaUvHXJbx0IiAWtK0m2pnTSZjPAumhCPzDW4d9cEZV/zsCsy5Ix9qFGQ6Gmd
 tP6r1ZQyw7yuA56tc3stGcgg5ZipJeZn0af9UupwsjVQRXm1x1Tq2OiDzxMatWnAt7gg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o4kp0npKP+fQfEjSysiYSnyb3l1okQYjxbUzVVtlO+4=; b=G
 o8Lx8Y87mWzKTx+YmwpK4IMx5cbrgrlobf6OW4Jqs6vlJuSKdJWUHoAfyJkPwJtjlphQ3j2/8FTdN
 zb3/6phjSNEHGj/YsPP8e+fN0cAUBesmtFt+jMIjsNWSeyuCT8n6js38FSgTzGofp8OeaGVleKkLl
 /RDX3BOfU7EoaGio=;
Received: from mail-eopbgr1300119.outbound.protection.outlook.com
 ([40.107.130.119] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n2VYC-0007Zy-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Dec 2021 09:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaGiat6MgiHlh4dT0qeDO+ONWnxna490kh/BsEuxGYhXOKRWLQ74tncobjF29iNaxYgE1+mUCK++zNSBFHOkeNIyriHeKvVpdl3+/OxQf9tYslDbSy4S7adH/JYfoq1RxsCP2JEYplRljMqqMFtCVCl4XCoBflOYAJ+iJ7T8kqFf6TWfw9CsFyjVgGkHqf0bEbHQlS7Voqp5xe8wxhgfjpQaSuPhRZN/JNn1yOQFHb/rIup0eSrbb4o4go9TOzTETzys12ATJs4DzNW3T0tWm2McIH0HTNjAAh2p1f1vvE28pyF35UNN+YkRDihFiJptOry/Skovgs6SbSoHYFax+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4kp0npKP+fQfEjSysiYSnyb3l1okQYjxbUzVVtlO+4=;
 b=jUOMjCLXWraNf6fbQgxKh4+QW+diEFoFHPcO7FvschGl1PZprYtUrGRTYM/g+HlTcyOhYx0NRpn8+CjhR7+8XSv9hmLeh4kA+NC/lYf5Ztp3S5aMcYiomamx0hXu1g8cMs1rbrYyt4BUkj4gkXbot0E7E3ylbZZjP5UyRgrAnQuwNCd9M9wWQwxhACWL0CsDAoCgNTdQegYVuqIe1J8mGpte19sXJ0KPjAturgsAloJxylIPMSJHjkLFwwv0XbDeTZwjYSklEsGLQh5UIpKtxkhhQD53Z+ShbP8wiTm3OiGRT/qCSt/6lSfbHrqwdOm+RcY/T2IIAYquaAChh3dGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4kp0npKP+fQfEjSysiYSnyb3l1okQYjxbUzVVtlO+4=;
 b=RGYtphjIwsmL8OKO0TscZtzLdw/JBXXdX+zOKS5dyCuOIPfMctDSCerS6Xo1uMWqu7PW1Eay/69avCBE43giCWE4il+Wi1v3UZBKvcuFZ4nv8llOyaYdIIiKTjsoBh35qPH2BL0nxTt7Wvx4hSR62Z+cVj1kjOlU+JeQATLa/Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TY2PR06MB2864.apcprd06.prod.outlook.com (2603:1096:404:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 09:47:08 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::645e:7cde:465d:ff76]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::645e:7cde:465d:ff76%3]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 09:47:08 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 29 Dec 2021 17:47:00 +0800
Message-Id: <20211229094700.197169-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 374dc92c-c229-4292-d61c-08d9cab02e0d
X-MS-TrafficTypeDiagnostic: TY2PR06MB2864:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB286414F14B5E0128E4024F62BB449@TY2PR06MB2864.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnbY8P1IsZa8GsAL+hq3XbEbiKojVrJs0HZc6JDD8XhLdg9u0saOkUl0wZbLOYkjzCguVz6TTjkCrmeldYXff6h1dXXBzG2VyF7RFrqdwmEoODi1L4fIgrXl4MP2W5FYf95/Tkpdz+O0gWoMQwil2tLhmxEbtRqDb9JccKZHSJxRv/tf33rdTXKlrYOrHiT6wda/xhsJdaak20E6vY1sNhlrpsA0BARDf+3MUD7zw7ij01NAmOffLgwQI5qvGbCbbEMsbSSDXLTnvm3aFuNFldQPSJcAFZPvCsliKVP+BfH0Ww5VCdBkVUA+7Nq5JJW06WhjUCHKS07zWKnNKGRXJrbR4b764qknSetoeZ9lGDkCE1S8UsjdQUUJQw6hhIpja+Ea69/szj2W4cKQBdgDy2u0vHcXcqDzTgjWoF9biBPE/CLbjKQwkCN7IXy/0ziGW+FmFlLTVJfR5ugzPizEs5btPZQI5iMTwZhXOnYCmenpy3oyJPdRJRG03hXVQ81ep9PtENFx+4nrCWiVRGPJkqDDZX1xFZeCf0nqxy6S4IyMdT1bofij5TaRAikvjIx/Je2/cj5xbUtZKpWNT7Bpw0/OPSHkaH6OlSPD/mkXyi47yiFUMed4xrlZCqyEN6YUlBqGaZnSreaDltJaGymS4PS/UVNNoUDhJ9/LhMNCptVt2S027VX0WLmzgGt3a5eFYfMKbd1KPDtOvh1nSw5VHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4014.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6512007)(83380400001)(316002)(66476007)(4326008)(38350700002)(1076003)(86362001)(6486002)(8676002)(2616005)(6666004)(107886003)(186003)(5660300002)(508600001)(26005)(8936002)(66946007)(38100700002)(52116002)(6506007)(4744005)(2906002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xxtZO0nYNHJxEQj35XK6TdxIbamxquSQVJoQlNtxt2WanlJdodEF6gTeZLQn?=
 =?us-ascii?Q?7R5MoL3gSDBcs6q2Y9Os6zRhgjf+geBVlVZHs1d3EkCKqRMjkGt29uHa3OI6?=
 =?us-ascii?Q?Lqeckqlw32XtoL8C7sgmoQE2LTGzHOb2EFDtN1dBBSamsrAbWvT2WgNAnfMJ?=
 =?us-ascii?Q?zudp9ljOohdRgkc9dTd30qjDL/WrAOgl6MhVAdNnhg1lqEUTJq8ZTsj4lMhc?=
 =?us-ascii?Q?vhohZRrB+JjG5FGkZJkNm4DuF3+z7d1LXw/1aJ+i9y1YY9UtmNQJ8Gl+QCNP?=
 =?us-ascii?Q?F2Y5obwpCEUMscrcA4/ntnnlyP9TwvAzl++/clXSpRiEvZzDcSbhmitK+rro?=
 =?us-ascii?Q?Hinx8KhLA9sFW6T3fnTkkhsGeMk0/zsBIjlLcgmGAxdaaVyDIb+0ZrWi4buz?=
 =?us-ascii?Q?lFHDcbFq7puuFw4QGF+hN2UgHKglVB4pB6Uoqika+/6DPEW/vwLaUg+hhkW5?=
 =?us-ascii?Q?taFldukt0F0gTjs97E5UZNUnZakm2HTCSl3m2TeJ8CvTl+wjxUunT4rtD4VH?=
 =?us-ascii?Q?vaq8SRBPgXtMnvyjqGG7Kenl1OrRb3DY7rLlB8zaMR+M0dg5qyXcPCXvheA9?=
 =?us-ascii?Q?XtMHCvojBCVct9Slw7plTAcSD+5Q9t2vQt6Jh85pI91BgSEXD+G1QTAijquo?=
 =?us-ascii?Q?ud3vdfnvDaX7rF53I/dZ/vq9G711i+LqmV8LMtQiHfaLF16N7MG2ZtjsmtdD?=
 =?us-ascii?Q?4XOPy84Ywp6WO1wJsu8BdhqNRL2Kth4T2HoewCzNQaVRuMmfX2xZyZ/v7WxQ?=
 =?us-ascii?Q?qRa7ptwty+lST+8SFwb+ItB/j5m/BT3cFw0RfNdqLM8osNIwv3dyNmazOEIX?=
 =?us-ascii?Q?JZTWcC9+4menKmMNcO8Mf8dOKqCN+LGtMBY1FBG7u5J3El6dQCP/SbNy1t0E?=
 =?us-ascii?Q?vB1Rk6z1IIOJVv+btK28JLvIY8Wc8PlSoSjOyGDuFAbEs2PfcTRH5Ze4u6yg?=
 =?us-ascii?Q?aK9Zkyd7J5C894r/GF+1z1Qw3OUrDBJjM9Bo93CAKriK41HlCnh1Q+vqEMOh?=
 =?us-ascii?Q?Nfs1V+wGlGRuCyQ8Bsu6il25QryuwRzkVd6kA0e3usIKjR7FH73GD7MmzslP?=
 =?us-ascii?Q?jjyZ1rC6T64ZV3qG6/+9np33mqfcfQlclAqWUihZIrq82+6wleK8yLRoAh5J?=
 =?us-ascii?Q?broy9n/US8dIjcQYhX2eEHb35ofSoojMaMpy2Tc+FB1gOqwE7yNJuTFw1Uk1?=
 =?us-ascii?Q?dLuwAEeL4G4yaqzNIlwNqMCAPTxHFLmtOoYz3GasMaj1mnWiJqBUgChYvQTN?=
 =?us-ascii?Q?Mb2qP60Ec6lZRion+uuQFdyUDmf1yuOrWLCNgAMPy3nahdL9AV2N40hSoTEV?=
 =?us-ascii?Q?9HkukQgLPuCsjTcbLs48OZlCvMO5onTUzS/bnHb3D4KyT8x7x2ORgq9/3c4f?=
 =?us-ascii?Q?/90K2lCX8c7ne/yPNu7g9WOvyBhwYXfrMtG/kdoHcTYRKeCgYgOMJX5XVL//?=
 =?us-ascii?Q?y/n/0K9u+PE9xKV0tc00b0yJKV98eEXyXgCjEqdZYKdHija0Bcp40+i8DTfb?=
 =?us-ascii?Q?YkpijKnzNV0dUFV4FbNHJ95KR46O0tS0EyN0Xl/i6rN45AySnwZD5NG0/5xP?=
 =?us-ascii?Q?rYsmijXKWzqUrt+moWzznKQdCfjKOvr4TnZTAlg91m3D0wWB1QccIu09fm2u?=
 =?us-ascii?Q?uw8Q2dZ5tGGjrsfcii7veU4=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374dc92c-c229-4292-d61c-08d9cab02e0d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 09:47:08.6755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL7yy+LwY9fjiKWTFWCFLV57MuuNQpIsZD+rDH6DADTvqi+oEomGyjkQMrWWGPVzx8J/coBVwW9X14vg2LqkTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2864
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compress page will invalidate in truncate block process too, 
 so remove redunant invalidate compress pages in f2fs_evict_inode.
 Signed-off-by:
 Fengnan Chang <changfengnan@vivo.com> --- fs/f2fs/inode.c | 3 ++- 1 file
 changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.119 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.119 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n2VYC-0007Zy-Ir
Subject: [f2fs-dev] [PATCH v3] f2fs: remove redunant invalidate compress
 pages
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

Compress page will invalidate in truncate block process too, so remove
redunant invalidate compress pages in f2fs_evict_inode.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2ab3b424735a..1d85f1e58d32 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -751,7 +751,8 @@ void f2fs_evict_inode(struct inode *inode)
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
-	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
+	if ((inode->i_nlink || is_bad_inode(inode)) &&
+		test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
 		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
 
 	if (inode->i_ino == F2FS_NODE_INO(sbi) ||
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
