Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4D44A569
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 04:55:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkIES-0003zH-TR; Tue, 09 Nov 2021 03:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkIER-0003zA-57
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 03:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFq6p/ZwuEdO2eupxHWbxj50paJi70AXbL8KRFW3Ds4=; b=LdXPmVK8dGjG9MaBaHJb5PUdOv
 Mhy64VwVJPeB4ACk7RnLdb0poI+60lQFCzhqDjc+KtHuEqiA31JlM3vvbffpbWUIXdqCIw1jB+H+Z
 qpgX9An96OMfTMNufEw5N0Co/ly54k79n9ydKPfdIxX6gaWN8ai3HNDLRghliWzDbiAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VFq6p/ZwuEdO2eupxHWbxj50paJi70AXbL8KRFW3Ds4=; b=V
 NUnCm7P1judWikd/J93Rh/ZCNvXBDjmXFtmB/HHdE8jTHLVFVYZLflN3VJkeWJDb5+wbCKAczNP6r
 1KmzjIYicZHUzqWQ+0dDrJpmZ6LSN2WIyt1eaem41F025eLslPM2JUnRawPjs/PJAKInIzH3tjmua
 Q4lKFSRw/Na6ZmYs=;
Received: from mail-eopbgr1300125.outbound.protection.outlook.com
 ([40.107.130.125] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkIEO-006nNs-Nu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 03:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/o8CuBw8qpMr3uZZp/j/MlMj/FNTf/yIxOtiR82SLoc8I/vhGxWaN1wLEJtOSyvm24DxmicfP1VIlVZyKrLhEck3A8KTll4bw6Kt7xMjdRiz2quGg2fhVb3IcQ3Tdj/ZCVxYnG3PyCEOg37Sh3tVxBqGsRSDJAssE+XPxH6tIbG+oTX5UEQ+NYQTlhQPp7PWXHRwMFw7+RkD8lzUXULAw2+0S5am5evEK9oSPE1hnPYgr29xxBPQyXy1siSf1OE46Jxmz/OJIUsHGK3s82WuVye3adbYFEWnhZ+n6+oITtrJM0RiCpabEoa1lt6mGeuH0vvzmfzGLZmGV9fM7zpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFq6p/ZwuEdO2eupxHWbxj50paJi70AXbL8KRFW3Ds4=;
 b=N8zIj6yjWPTRKNw9KIhUSPBY+kYSH1whA8PxPwKqZwoWXwUobo0BghQj1mzjujsp/fXR+et57i0FtTEpzQ8x1fEgI3Rfd+G/GEhpcx4zU0fZkSJAYluTxSJw2XPvni3vLPv35l77SaOKsT70RAYsji7gmdDl0ucnan1EGkQkJq/Ja3sT1qcfcjhz+19AlzjqDOwJgz5bvBZS4C7BFnwUFoYyu285NpIasQl2jUQaUypsyRu0N7vC8jgEFNgezgFvzqc0gmTMTOoU8JslFMThlAg9+DQIQjIxWjBI1o1viG5LdaerYA0Iva5Gjv0Z8WNvVPo6uP/8SGnHXjHRkVqSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFq6p/ZwuEdO2eupxHWbxj50paJi70AXbL8KRFW3Ds4=;
 b=ZkBwKl/RD5kvV/tJTdyAilJspRIJMnCsaWGYFu8QOwO58jwXXtETzw7TYdFOLyKQcmo3aO4+nrqnQq5a94t2XhUskm3TAMKxerYgGDZDcsHXcefR5tsXxJm+T6k9DJz/INBJ8UWqwrcvR3W04ONTpu6JLvy/PT8VyIiYocZqC5c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1973.apcprd06.prod.outlook.com (2603:1096:802:a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 03:55:21 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%6]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 03:55:21 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  9 Nov 2021 11:54:08 +0800
Message-Id: <20211109035408.260852-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 03:55:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 572d9496-69f0-4588-bdd2-08d9a334c00e
X-MS-TrafficTypeDiagnostic: KL1PR0601MB1973:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB1973C00F2DE753FDCBCE66C3BB929@KL1PR0601MB1973.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGM83mD67OCvsQGYCUFClCgo0xLGwHEJnCeX5o83nQHteYpxi8YkZHznUk1rXOI5G+xl8LIz6vYmJxTE7nV8S0o+Z0qKKyCTcHslYsLwxn2TH1f7p9krCwREgtWK4AvO/FuVJ0BSbbm0OPgDFbAwfcIaqjlEIATTyF1nZwwmrZyqhhJ22en4iRPvImSbyomsOcMMs4SFXre5b/3qnf/jc2GxqUj2s94UEZafAbJdWXnISwQqOphgjEHKJ1c4vEu8iqExjIXTgXXCGZwGyKdakZFl9p4qofkcsod/cE3u2jhzEc2vW9lXEdlqKaVdsYV97zmH/t4QxK+ZngM7B1DaX0zu2K8ysHrkEJTfZW4PwuQeaGglgFv8i6beX26oZNl5vKphiAFlRICBtV/yY7b41aaaN1dsBsBI4mju7g3NsdxulXB93LAs2EUsneeeQlzMjq2qSEqyXI4SeY/g34k/x6Afez6qNcPbDNAhghNU4vh5xQBE3Jl5O8kG3UrRHEK9Ouo4q3/3SKZR+r3EsGk0ANoqJjtXFt1IAZywNApG7UbFObAJC5MN4jPzGKgly2NPv0A5C+mNUUYx7avDd60/B6Qo0ZZx5SDXt+xW9z+OC/lMW5icwyHJo2in+jJRv2WHfwmEur16rogo6PUPgjk8L563xfav0JWvhiS59xCouToIiwJq4SN1DADfYjq1PIPmiqjRx+I2IYcdfglgtF98l9rSnfaP+VIZ3wIKXFTqWIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(66476007)(38350700002)(8676002)(8936002)(66556008)(38100700002)(26005)(36756003)(66946007)(83380400001)(6666004)(6486002)(508600001)(5660300002)(4326008)(316002)(2906002)(86362001)(956004)(6512007)(52116002)(107886003)(2616005)(1076003)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?msYlZt8OEgbEiPjXNgrAxl3yxIFkGYidUmoooDOz3o8FOIQMfqZ4wc5gpG8S?=
 =?us-ascii?Q?TKCdTUlNU/SgDgUXkt4DYninZe2q1TIpIvnurVbA8SPthodhqIp1z6zv3ozR?=
 =?us-ascii?Q?jlVUNwkB14LtLm75hua9y9R4VzMbd+Rj0vDY415JSljLmzObhWKtX5muiAmk?=
 =?us-ascii?Q?cJyNRCUTpP/8ID1GgqGkG/zAxvCJFSZAgn4VFWqU8lH4DIeS9h8t06JrQLbT?=
 =?us-ascii?Q?pPbeibSr6hZQWkbQEb5VJ+jsuo3ZaKcs1+bPqm35PwRu/O3rszC+oIHV2irw?=
 =?us-ascii?Q?D2sHfEvAZjj8JYaF98Nx1INdvSZG41Tc48Bk+CssX+T3jNuzBPwKMXCIaUTo?=
 =?us-ascii?Q?veiUC8dOZJ1BV9zVgd7/524gKzqjS04kCxduIEEbVgSBGL/Up//PmxBF92f2?=
 =?us-ascii?Q?i0CB82GF9c8ICXUtzxgFdS2jyPPN6TRXGLBcNTizZ3VqN/SkJ895+1nsSXhn?=
 =?us-ascii?Q?4dTZPiyMmFltRpnqi/+09MZj5Nv5OLIehVi9O6gd8r99ZhXn8Rw/CcEfzUW1?=
 =?us-ascii?Q?dRysIt9+wFkms3mCMLE2b169Ds283oseyOWvRY5bbZWRypYW0ENb3fErEB/d?=
 =?us-ascii?Q?c8M0AWvmKPdNZjxgtuYiXlq4j49ZsQ4vsgjbaeLsy8AJK3+FAMzJRGHbjJ5y?=
 =?us-ascii?Q?tMOopoJoSYYtkgsAbKZ8m90Df8DRGpYwxVfetcrN84ELaudg6hs/tJd1XYJQ?=
 =?us-ascii?Q?6hR/s9ow01albaBRcCUE4JuPrqxyZHVcUWviT2TvQDgE4bKmKZU311p0sZnn?=
 =?us-ascii?Q?PLZ0QdYcuSUV1xIpKeClRysovBPFgSzu+OmcfYTzhOix42497CR0wcyaFpZk?=
 =?us-ascii?Q?hkkXkh4G/vR5wsxehC8SM2R/eb51wXTe8mwatXQlvIQaiXr5X1DOpuA6XLH4?=
 =?us-ascii?Q?BY88H/+9qZ6f63YgjwaA07X4AnevRP9Ue54Xlfwq2OEklWXz8Oc6UbEQxxrO?=
 =?us-ascii?Q?PRtqT9E3Dn4R/sId66Oqc/bFPRnCKjpHiNW0LF4qFKXoSzpSGI+h9rZOzID0?=
 =?us-ascii?Q?CCTic1QIyyQOQXtoXWf7hjxCejQ7qQFZROTjeiZI/Bwcdis/z9NVoQwyOCmR?=
 =?us-ascii?Q?alY9JdOrSztmCEku+5uOXuMxHeYx/y2HQxtArcIP5EKrSUnyoSNikEOOwtT9?=
 =?us-ascii?Q?fhkXm4DlyN0Q4HNA9vXG99lbW6uZmXNza3pGej2Bbo0nKeXy6jENzsTjm/rr?=
 =?us-ascii?Q?hybhsKbDqt8TqIZmyoNiw4CMKyFOkU1aGik6vySi5WK9ujTKN8S0ZBV4qBNN?=
 =?us-ascii?Q?c5mdtK+pekNrFzl9RasZEO/AvSEH9s+8yoc5gxaEqM15BqJB4sOpAiYs0JR8?=
 =?us-ascii?Q?xJWFt7Nz/cO7ANW9L+QzQYXSjJUMznUp++Tb0PQPr+hdRkTwNntU07BMe9a8?=
 =?us-ascii?Q?S6k9EUMqQDEIx9tevsJ2+cfNYYCi8YNHD3GX7MZ0geZ/ItBIXnHXeDdxk1rx?=
 =?us-ascii?Q?Luygj8PUUwmwD0EDe5D6ntdZNR+KUgnN4BtpM8Ff1iY2dl0BcjFP0qsc+vf1?=
 =?us-ascii?Q?ppNq2EWLihsV3YtIsdwpxpXsN3PWo6q18J7Kyt9I0DmN99gw55+FGZKLJ/Hz?=
 =?us-ascii?Q?anI5l20q53Dav9UUxADzqRH9lv1TOUHufpT24URL/y1Tas898nqWNE/lRdWr?=
 =?us-ascii?Q?9VjJaCc/7fvRp6FEGKPd31Q=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572d9496-69f0-4588-bdd2-08d9a334c00e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 03:55:20.7236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJgPVheFj9jCbBDgu30z7o7FO9RUZC5wq9/E66sgEGpF6hQiGO2QciGMqAP5yXZ6YaiZAofSwEKN/a6avgmy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1973
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Don't alloc new page pointers array to replace old, just use
 old, introduce valid_nr_cpages to indicate valid number of page pointers
 in array, try to reduce one page array alloc and free when write c [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.125 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.125 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mkIEO-006nNs-Nu
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: reduce one page array alloc
 and free when write compressed page
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

Don't alloc new page pointers array to replace old, just use old, introduce
valid_nr_cpages to indicate valid number of page pointers in array, try to
reduce one page array alloc and free when write compress page.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 27 +++++++++------------------
 fs/f2fs/data.c     |  1 +
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9b663eaf4805..28785dd78c6f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -153,6 +153,7 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
+	cc->valid_nr_cpages = 0;
 	if (!reuse)
 		cc->cluster_idx = NULL_CLUSTER;
 }
@@ -619,7 +620,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
 	unsigned int max_len, new_nr_cpages;
-	struct page **new_cpages;
 	u32 chksum = 0;
 	int i, ret;
 
@@ -634,6 +634,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
+	cc->valid_nr_cpages = cc->nr_cpages;
 
 	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
 	if (!cc->cpages) {
@@ -684,13 +685,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
 
-	/* Now we're going to cut unnecessary tail pages */
-	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
-	if (!new_cpages) {
-		ret = -ENOMEM;
-		goto out_vunmap_cbuf;
-	}
-
 	/* zero out any unused part of the last page */
 	memset(&cc->cbuf->cdata[cc->clen], 0,
 			(new_nr_cpages * PAGE_SIZE) -
@@ -701,7 +695,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	for (i = 0; i < cc->nr_cpages; i++) {
 		if (i < new_nr_cpages) {
-			new_cpages[i] = cc->cpages[i];
 			continue;
 		}
 		f2fs_compress_free_page(cc->cpages[i]);
@@ -711,9 +704,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	if (cops->destroy_compress_ctx)
 		cops->destroy_compress_ctx(cc);
 
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
-	cc->cpages = new_cpages;
-	cc->nr_cpages = new_nr_cpages;
+	cc->valid_nr_cpages = new_nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
 							cc->clen, ret);
@@ -1288,14 +1279,14 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
-	atomic_set(&cic->pending_pages, cc->nr_cpages);
+	atomic_set(&cic->pending_pages, cc->valid_nr_cpages);
 	cic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
 	if (!cic->rpages)
 		goto out_put_cic;
 
 	cic->nr_rpages = cc->cluster_size;
 
-	for (i = 0; i < cc->nr_cpages; i++) {
+	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_set_compressed_page(cc->cpages[i], inode,
 					cc->rpages[i + 1]->index, cic);
 		fio.compressed_page = cc->cpages[i];
@@ -1340,7 +1331,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		if (fio.compr_blocks && __is_valid_data_blkaddr(blkaddr))
 			fio.compr_blocks++;
 
-		if (i > cc->nr_cpages) {
+		if (i > cc->valid_nr_cpages) {
 			if (__is_valid_data_blkaddr(blkaddr)) {
 				f2fs_invalidate_blocks(sbi, blkaddr);
 				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
@@ -1365,8 +1356,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	if (fio.compr_blocks)
 		f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, false);
-	f2fs_i_compr_blocks_update(inode, cc->nr_cpages, true);
-	add_compr_block_stat(inode, cc->nr_cpages);
+	f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
+	add_compr_block_stat(inode, cc->valid_nr_cpages);
 
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
 	if (cc->cluster_idx == 0)
@@ -1404,7 +1395,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	else
 		f2fs_unlock_op(sbi);
 out_free:
-	for (i = 0; i < cc->nr_cpages; i++) {
+	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		if (!cc->cpages[i])
 			continue;
 		f2fs_compress_free_page(cc->cpages[i]);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..4ddc0ba0f2c0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2934,6 +2934,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		.rpages = NULL,
 		.nr_rpages = 0,
 		.cpages = NULL,
+		.valid_nr_cpages = 0,
 		.rbuf = NULL,
 		.cbuf = NULL,
 		.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 039a229e11c9..acb587f054db 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1481,6 +1481,7 @@ struct compress_ctx {
 	unsigned int nr_rpages;		/* total page number in rpages */
 	struct page **cpages;		/* pages store compressed data in cluster */
 	unsigned int nr_cpages;		/* total page number in cpages */
+	unsigned int valid_nr_cpages;	/* valid page number in cpages */
 	void *rbuf;			/* virtual mapped address on rpages */
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
