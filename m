Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1156D0BBF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 18:50:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phvTX-00022o-2f;
	Thu, 30 Mar 2023 16:50:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phvTU-00022g-D0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9jDTYwzuHpy0M7uPUlxv+bYEweovSShVKMF5+6WB5c=; b=THSFuOcHF9Xv1kAc9cy+jaws8+
 Q96dNIcRTt8piYAbaUh6+JIcpcD2bdLIYvEtiL5ALoVi6OwCmYP+GJFdEyvA26ctPMROdfZLOx6SU
 MIbgYIIfRDjUSKpWZpD+JOSY4Z9kiEW5rVXHPEGUDGdnY3Yzqal7dKFCcdcWoiXat8pM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u9jDTYwzuHpy0M7uPUlxv+bYEweovSShVKMF5+6WB5c=; b=I
 EoTueIpg2oi/ikT3wv4B74ph4FaDBxg+I//DCtd/epB6NxiiRHLF3nqXLql7R4dspQuv4weuRpnfR
 U7yaZhEgJXbNETO4WUH5lliuenjgalIcOg8PElcxV+dVa89gylDcJuKXT8N2Hd700trgLUvRC7OtX
 LHfS9QdCL0nqww4w=;
Received: from mail-sgaapc01on2138.outbound.protection.outlook.com
 ([40.107.215.138] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phvTU-009u27-GO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2V98v1xsp16JasHV9+HSBGKsfz8n2QnNG9Ji3M1PfDYLAufC4U0MU5Jon8RULtHeAjjhjVC7Tox2YBN+jilSSRVvv4gVdcD3qcLImMWT1lOfdgFXM7d6idVT8COM9vKOjaqnPJ0Dm8iJVhW3VwhD3RdpFFUe+yZ5yXdXkj2e8dc0ZFYmRF+jF/3rgpDkitJVxQwjEHoci0Xlw+XJX+/EIJ83l77ZqI0FqWFtbjQYjdKVvd0hbKY9ORGPUs3DM8Ajsjt5EMLMOYzTwXsdZnJPuw7BfIBOfqG6PwtZ6iOTZMvDNDkNEycrG4qq9Nc4Vk1bRuud/4QgCel4m1nt4m55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9jDTYwzuHpy0M7uPUlxv+bYEweovSShVKMF5+6WB5c=;
 b=R91tIAI1tAlUIDgMiEMj1bdSDSqvXOrSialqFyqNioMX2l/ETkplCUPcUcA8uk/qe0W9N3X/SJwWs4ZGG+eIVOnA261eP5BeyvNHQuqV53a3DH/rgYo/Ht1nZAA0G9k1AUAxsLW+2WpWi8Dp9tPxPyubMWp8CSjsawfgFcib/wdx/M5vLnSo+5n9poPVXuADGfGLa9J+A2U0xVtFAxRX0K6cIDro42e74nn0YBqJ5TkGxOLBWIuYTKAi+uruCwuBf+BBR4KyFFtfvyXfP4GDM4EKhjwkuYHSuY9XgXVKI8J0I18mXQr/V4sE1y0gIT7RNsdlOkvUBDeUePS4PHvVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9jDTYwzuHpy0M7uPUlxv+bYEweovSShVKMF5+6WB5c=;
 b=qFYWvjZC2qw9+DJUmRp7G0EXW+5lFF5bbwHWTZ23nb54XU0hswPEPIrc82ug3hNTIgPFfWfxN59vUWOs/PHeRDrPYkGltH1KTw9CX+0ngbkhFntR+Tzh59hJSjhcoGLjY2tyNvpv26i9eMqnAyWIg8UbfttyYScMWebYpKA83hK344Ikxi8Q5CO+tstIYzaqKRqeoWfSQsALPjiK9UKhF0IzbWXb6Egna0nTRMVwCFwx3faCXEyylvR8uk1rg5e1pVf1SbeJT74KOtg18uQMHlkCzBuIMexujrJ8rEq/zXYQqF1TelvmuzWb0eIQL80HNhLv4gym6XZgKc/PNESyFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5335.apcprd06.prod.outlook.com (2603:1096:4:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 16:50:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 16:50:00 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 31 Mar 2023 00:49:47 +0800
Message-Id: <20230330164948.29644-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: facdf84c-cc94-4860-1c4e-08db313ecd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvnGr8a7TJUl1gz2R2S+zln3mjJFF5GjgzXjNKJmImNnZAvga7kJyRdq7bOwlHGvmj0vN4NpOaJjzPUT1wVRogiGJ+Uvx3999xyclOAiNRYcmKou/sQZhjvfSwah43hpbHGKC0k2+yftmo6uhwyXejsGfwxwwaFbtDiroq7rtkPlg9vsHk0ltDtYEYj50f8GTIQ1FvtXft19rS87fXJn9TJdrSfpKz5r8WIrg8lKR7CNpM0nfZtxmoc/lJoQ8Y7ITeNipy3T/9FCaJj1DuFY4dh/oEzqSyVmM7iQa3FD8p3v7iNSey4wLLLRqiMYRJ/5hhhDNbPQJTRNco7v5Aws4bvoifN9h4YD6LrsuFMFoCz7LUVi5PM/Fnt6njipWm++t8OdhGIdoNrWmtuxpTktWmfBql4mCDkBglKS9qZXvjyaHL8M4cM9WsC9LIBGvEMR7mP4YETdAyxZPkaRa2JFWGTG9tUft3gqT1nlCIxNf5r65tkcC4boco9CkMbdGb/+aSicOuv/SsLyoudXBSW2ETCb9nS5THze9nFgAcO+gXVWkwD3o1jNv5UqYTyYCY01R86s+lBFZKAo0DKNSRGKP8KuZ1tf7mdzn+IhK7vX1P594RGps5esOKkqiDwHy95u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(8676002)(478600001)(86362001)(6666004)(8936002)(66556008)(66946007)(66476007)(4326008)(41300700001)(110136005)(316002)(26005)(38100700002)(38350700002)(1076003)(6506007)(36756003)(2616005)(83380400001)(6512007)(2906002)(5660300002)(6486002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lj/xoS429nSgmS5UNN5u8Tmbw9qR1Uxo02MC2zn+9bCHqsYBuydiAenJz8/?=
 =?us-ascii?Q?boUqIbT+OF0/lp3WISjoHWLBc5lIqC/1aM23B35vikmDPNrSysr4qE1GH3uu?=
 =?us-ascii?Q?sp7GMa6W6Clus+qPgwCVERTWmsXkkOZ4kHgazWhNpY8figSItqQ37GqL9FR6?=
 =?us-ascii?Q?KAkquzQ48v+jFTHhJY7G5R7uyQDI02c6dqyVMC8riGd0fWBK63aKAhH0ua09?=
 =?us-ascii?Q?hPBMBn6XzwfZxu0/O++0JLakY4b0g3T5ZoGs0q5dtXkVq9GRdZv5EOpUZBvt?=
 =?us-ascii?Q?4UijN8f8Z4CyBRzSLiPjcLyjwrnXXWvK7t2YuO9Jvn7pW89Lb787PRZirdwV?=
 =?us-ascii?Q?T37sOgMKVXwaZdC3rFpMyY5BeQtgXju5hRIS7Kznvgo3W+kCq59gI2rF/rSS?=
 =?us-ascii?Q?YlbBCYBpS5H8OPNgzhgqiK9v6OrANpPjGDzS7UANniS4HGOoZ1SwmJTztG1Y?=
 =?us-ascii?Q?pmX5NTBK3OnzRSssv4YIxVd7o7KuFF/FD/eMVdpnZK7uz4csyz4umlY9zYqm?=
 =?us-ascii?Q?DRTxB9hATdzQTIaLPlIQt02zLjlc+ZzGQefbY3CE628jJUwNlvv4zzDbJalA?=
 =?us-ascii?Q?xi6iF1C2xxC85tvSsDTWO3OLaBHArWbFMyYFAiWo8YM5ql+tSLUqKsiWWj5G?=
 =?us-ascii?Q?pcP5wm4upMiVfC3ECZ7FFPJ5huB7kDj6F7hdRclZYq1P+EkrHC6zKn/QZfVN?=
 =?us-ascii?Q?UAlrE5/ALl4b5Afhy8erenyrC1bqYrjv2mapUW0vluXYnKN030h6XYzrpZGD?=
 =?us-ascii?Q?AwM6vTa0NRD+ET8qtklq2QDQt2JJ2oA58HugrLkZRrES/dmWi1bSCzxU7+Yp?=
 =?us-ascii?Q?sAVW5mrFf5D0RvFzNjfAU/Ctd9dGONgi+LluWYDN5UMG+2dhJ8eTWjyNXjfV?=
 =?us-ascii?Q?BDzwgXC0er9vpv6HZMU4J4pPvcKmjtda94WGA3H3F4XJ4Cwfi963v/Gw3Uf4?=
 =?us-ascii?Q?/jhSzPcpF2AeDCGt1P/iKMabUSlOhGoNklankD/JLhS2M/3MdZhBvRmrxqrA?=
 =?us-ascii?Q?y5CNhXNyQSb0RKUFPyFi4H7m+r+sS4DFzBb8F5UGGEH6MoABiRAEZM40PWSX?=
 =?us-ascii?Q?+PwesN7WwMsYqXYAT5AXCLT1+JlTmDaghEfAZ+nQP63RvmMDR6edh1wn8iFq?=
 =?us-ascii?Q?KlIIzCERRUgb/cNlb2VZvzEaTtvudogBTy7Pgu/rk1YxgwKEDI+xJnRE8G6E?=
 =?us-ascii?Q?k2S/PViAFbaWg6z1p+zIsWCvj0Rv2msCOE42IO/c4iT5okVAkD/9eDsVnfZN?=
 =?us-ascii?Q?UUWrN5+STMBuSqJRw2hhdxuuJ7tpvK9WorJJM/zTnh0Cyw0e1WGt6AMnsD6T?=
 =?us-ascii?Q?023mkW28/lyEOWYNihyaNeLRDvEBg/MgyJ50uQeFMtK/GTpduZoXinWXz9PO?=
 =?us-ascii?Q?LjaXKzHvmWSHAv5DM68j7bfPo3ds50kv6VQIYewnIpS6kM+yV4uSBOEJnO8f?=
 =?us-ascii?Q?PFfR9WgDrNlXhtEMmSQXPxMsGc74RL0LoJ59CRP5rqU+Eod25f/rIOeH+Jfu?=
 =?us-ascii?Q?52IlqAOuHvL/HcVx0pszLlplxBZ6ITYA/Yslz2jciV1GZv1/RKBmQcZ1NCwA?=
 =?us-ascii?Q?3HptbkUoxBIaEfmGiN6YmyQrOXQZ2/O1PDdLf7Lv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facdf84c-cc94-4860-1c4e-08db313ecd09
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:50:00.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1wfjgZgMeuxPBGVi0hIv2bQYmt4XRRt3PkQPJaRtGZgBcx9k+xEjHENNPGXF5gkKZAFvSAcI4WUrGyLk0J1Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5335
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove unnecessary lz4hc_compress_pages(). Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v2: -rebase fs/f2fs/compress.c | 24 ++++
 1 file changed, 4 insertions(+), 20 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.138 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phvTU-009u27-GO
Subject: [f2fs-dev] [PATCH v2] f2fs: merge lz4hc_compress_pages() to
 lz4_compress_pages()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove unnecessary lz4hc_compress_pages().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-rebase
 fs/f2fs/compress.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 3182e1506252..f8b15c932c97 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -264,34 +264,18 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 	cc->private = NULL;
 }
 
-#ifdef CONFIG_F2FS_FS_LZ4HC
-static int lz4hc_compress_pages(struct compress_ctx *cc)
+static int lz4_compress_pages(struct compress_ctx *cc)
 {
-	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
 	int len;
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
 
 	if (level)
 		len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 					cc->clen, level, cc->private);
 	else
-		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
-						cc->clen, cc->private);
-	if (!len)
-		return -EAGAIN;
-
-	cc->clen = len;
-	return 0;
-}
-#endif
-
-static int lz4_compress_pages(struct compress_ctx *cc)
-{
-	int len;
-
-#ifdef CONFIG_F2FS_FS_LZ4HC
-	return lz4hc_compress_pages(cc);
 #endif
-	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
+		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 						cc->clen, cc->private);
 	if (!len)
 		return -EAGAIN;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
