Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4042D9E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Oct 2021 15:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mb0YE-0002ur-7o; Thu, 14 Oct 2021 13:13:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mb0YC-0002uf-10
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Oct 2021 13:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=563VCLhdaVE94uxloZFPW8Z1b1E0DPcn4EbPKB2UrsI=; b=lVKpmHmiMvPNNpVAlHpxoYKLhR
 VeAih2ExBKekNAGHr4R9tzEdqP9gqVuGl//CRntNVaIyHFYBpZL3Zq7DtYbJ1DkcqDnmXHotYmO+S
 mUSlDouopc4aaC53xwRC47eyZYlDW/0GrpnkT582/Ow6PctHsiqTjPtwi3e+az7+xRvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=563VCLhdaVE94uxloZFPW8Z1b1E0DPcn4EbPKB2UrsI=; b=T
 CThzfk8RqS4wxadlkmouAO81CHGXdU/8RfW7klvfKmwIA2HebyCRyO6bIwjtF4dooXPMs6dW/iBia
 6C+rDqJJJ33lqRUaOznno/QtdWE/fsoBEnDP0cZ9h1vl2xFG3Hn/dHix0eilpxjvzrYLHUc5DZkRE
 qI0BW8vUK5flEXh4=;
Received: from mail-eopbgr1320139.outbound.protection.outlook.com
 ([40.107.132.139] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mb0Y7-0007af-H9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Oct 2021 13:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJGFh0/7fjNgJTPQ5XFZ4OiHZA3ASXovc3lPC5rGLZtDapLNaOf3jaX/RjW2Hi11kqofSf28g0V3QlCcoZCbqHtM3qgkrf2BJZZtJzdvs1CN8Jj6GpQ50vKg2jnJU56Byfmq4DZcFa1T2l3NPugC3WumGPVTT69oCq6mUWyg7qK2aTDiUWQubEgTWF42UjkJ9KTwrjavyGVMosWW2VwpAibvivt8RGXan/nkkTbr+Hi40EsD94cN3FhmmSpLCVI+sbtdfqZ6LSPkeMp1jCJzbFiB9m+N7NQfwTQjIccHEln71MK/uMaIBBv4KcRyGVC8ntHr7i7tlAsdlfeFYzKbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=563VCLhdaVE94uxloZFPW8Z1b1E0DPcn4EbPKB2UrsI=;
 b=ZHPPAd1o0H45s8hE6OORROV/Qjojqam3ri1nxBpEoTqXPrkgP61osZAMi6IetdRWLUjdX98v+9oIDfSeg7yWXfjXBqRUr5ULyRI561+j5FCXci/EB76dGJ5y5gBMtMLtNFsM9m2uaQkmhZX6DQdvVkKx2v2nHlrdDOj0AUc0hmYwouRTnqq3k5t/l5UhXp/Hke+oxZ8DC+MucGUroOAmQ+ClyvnCCdNYOdnazF9U6Ti69qFADYEbnHU43lXw0nBgDlM1avPgeuwHHvwGAHq5My6GMrLT5rXixDdaWsTtwCKRPWVYnn67HcAT0VM/Rf299GAfVC6gWtueQ1z49fxNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=563VCLhdaVE94uxloZFPW8Z1b1E0DPcn4EbPKB2UrsI=;
 b=nhxz5qd2twWoPZgqKmu8f2yEAGfAjoOk7YFkWTgsuQvxy8hkWEG50dB62pJatauDioCEh4MhuS+8j39uNVyTIjWKDDey1jEO4wa/S2fW9lVE4IvBbIv+8TZS9i0TkZaofMkfMJ3P1zD2e7c2uH/i7En5vtSj/Jhu8VHAQNZqT54=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3703.apcprd06.prod.outlook.com (2603:1096:820:12::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Thu, 14 Oct
 2021 13:13:19 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 13:13:19 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 14 Oct 2021 21:12:43 +0800
Message-Id: <20211014131243.148009-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.2 via Frontend Transport; Thu, 14 Oct 2021 13:13:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c97ec2c-e31a-4049-da8e-08d98f14641a
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3703F3DBE3F02A781DAD2D29BBB89@KL1PR0601MB3703.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZNAsE96lG97252MsQ9M34skzvtJiHy6htGevEAqzSP76wquvQjRLARjpPMGNGSfcQb5kC29iBaVrdJaauomNuqNSlmCwsBc4PYkQcdh3QaMgPLqfp0SeyP+QQ++coaGatBnQt4zp9aHTb5y1EVY4mOn64BmLVStsqesv/+av36VPtdJXDfxEPWYc2n+HiFFJDfU6wyTc8LvEiQ4IejQ9Bj0wUwCB2A/eUmi3KDTOl2aC8bYAtmthmZ4el42O4S1LnfN2rynEcoEHdiPpnKXSjJHhI37rt1fnhaCxg4xgt1kDZZsawRngQ05qqrdT/vf3s+oVAVmcRqioJxsT8c55yLOmDFsf1LDecqmxCtcQWk5Lc2bLhhSxtL2JMgn8dKMKJUdfKsoKppVUle+AcWqGoPYa0JNrsUz0Jg28ntEScASfeFaxN74bDML9JYB7xwF1Qx6VLHXbXwxX4AMSY2dgWBMNFuxq1H7EbAxjQeTZLBA8Hc5dIGlnKVCn+2+s4h/keQoTBPlnm1aRLCnYUUNPysoTxw2Lumc0zLIsjqjTPGHSsZrvPpGI94+HepshgjFt8EivIJ1X0D/XotFAG9CcpyV/pisrXip5CWioUTInpRpTfM8qyoVmqb+agrug2pvw97v2zp59jgdgCVHcamIPjemlz8rb3bgLetwt4sMxBPsLo+1/63XwAzd/Km9S1vbdzB+gg1rlXUjrgdok9sNeMy7VS1a8Vp41BxPGRLo8K8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66476007)(6666004)(956004)(2616005)(508600001)(4326008)(66946007)(66556008)(36756003)(8676002)(26005)(38100700002)(83380400001)(316002)(38350700002)(2906002)(6512007)(8936002)(52116002)(6506007)(6486002)(5660300002)(1076003)(107886003)(186003)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHE/P8rElnbB5K8hoUFBwORa609s2Kz/OfaE6HPsKeUZN/pkHXL2yasog3sH?=
 =?us-ascii?Q?SqFLWd5jDk/vKVMjA4qwiQmAaq7hXmAl4LqY1w9cvx/Q/Qy7BgnxkqjVL5fu?=
 =?us-ascii?Q?BUyEmjJvjV1dz1x9TU8VBAjEVMpOm+0yJfqM5ZI/HrJrFEE9qpi7z5NwOjKe?=
 =?us-ascii?Q?cuOguCU5uTm8c/fogGEKCyo7Bcx8Rg8tzPsMFMO/Wux15fPZLVn+49EQ/n/f?=
 =?us-ascii?Q?OL8AyC5baPwxX4tq3MoJQ9aYmT2W5mqVmO6Kb7j6jkzvUhQJ5xN9dMqVbJll?=
 =?us-ascii?Q?xX7G9ed/PqYZyDYAAQb9tDGwaK6x5ih9hlOGu+cLG8YblJ0g+OFClBZZNPW5?=
 =?us-ascii?Q?RZ0N4ob/o05tll66JEVgrHkDbYDraduCDa3ljzl2WHec5H6Su+xVeAKhaLCY?=
 =?us-ascii?Q?jrR+maLq76zXQAQ+gDwqKwPLM30dh3OvaxGKzBezElc2sGUml3N2yElZKEJO?=
 =?us-ascii?Q?41W35A5nCitr7s7myHUn4/nPvUdlmoItELxI1SsqZJDos7spVdEGPl1cN2Ld?=
 =?us-ascii?Q?49SzJKWS2lin0uRRQneXfa0XzNbuDhjrMxpedhs0YOfvao0mSoiLew7IJ+Cn?=
 =?us-ascii?Q?btSxi1ZqS+rQNlD6HdwhIBO7A4h4CC5KbbiJtGFL8YyvXkt5kegQ4Xb7vqN4?=
 =?us-ascii?Q?H6Uh5qwglViqa0kTB+6DIE38pzZTI3JgVcC5w1Ut6+iVJ2xTchJ42jFoWV6U?=
 =?us-ascii?Q?H2Tt5XAHl9hHHmV1PGAtbOD3u+JberWMCLHMeDk39NYlHyFvlrhLbfR88T3w?=
 =?us-ascii?Q?ZkJyzTxh6lPJO9B3vYWNK05GmZXvwb74Sik3KjuUuAugfxyfE2yWQWxaqAmv?=
 =?us-ascii?Q?Qkx7/iu+nT4ysxARtfAR+eC7Q0bewYzVehuAE/rMbsAMHtUikK+7V/JWiel4?=
 =?us-ascii?Q?3YYEdJp1DE3n65lsOKP856gOxY3ZWkpDY4D5B5wpkeF1Jj9bjSPtZ+vmgLCR?=
 =?us-ascii?Q?aADvGIMM8KVFpNmKq2ASbTThAbGfzl3PRX1RZWtmt7ddhA9VlbqqA65G5oOe?=
 =?us-ascii?Q?pghoHR8Ygygo+Sek6ACWxV968CLDZ6dS5gavjvf/r/GJqEvDiFbYjWsu62MH?=
 =?us-ascii?Q?6qfrCKwoEVRsQYO++TWwQPDrjzpEvDZ+hYHqODzB6jf9PhtdcrEU5HY/Gz43?=
 =?us-ascii?Q?QF4a192UcGTHwfRL8tEOgr1uXSRnv1jW3DqfwG7/r+AyVEvV+0jQaCw3KIlj?=
 =?us-ascii?Q?Y2scGq1Hkn+nN1gxRTNvP/jsPT7jdDgv5L3PpWuYaXzbIjfu3qdlKO7CBmzx?=
 =?us-ascii?Q?y92Ah0ItvLicBKSC1sRPumDcs5KmXPgsIOwNKFHjI5I3vRNPXrIba9aQxMJ7?=
 =?us-ascii?Q?fDjSHQ7NDXi0vzQ+SrZD5n2B?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c97ec2c-e31a-4049-da8e-08d98f14641a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:13:19.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyEtf73hDO4XzhJtdaxeCKd1xuI7WzAceJrqBfoo00YWzyodjBgLqH3mDcVi5/OR/gkt0lwJeZ0kgk68ogPS7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3703
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  when overwrite only first block of cluster, since cluster
 is not full, it will call f2fs_write_raw_pages when f2fs_write_multi_pages,
 and cause the whole cluster become uncompressed eventhough data ca [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.139 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mb0Y7-0007af-H9
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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

when overwrite only first block of cluster, since cluster is not full, it
will call f2fs_write_raw_pages when f2fs_write_multi_pages, and cause the
whole cluster become uncompressed eventhough data can be compressed.
this may will make random write bench score reduce a lot.

root# dd if=/dev/zero of=./fio-test bs=1M count=1

root# sync

root# echo 3 > /proc/sys/vm/drop_caches

root# f2fs_io get_cblocks ./fio-test

root# dd if=/dev/zero of=./fio-test bs=4K count=1 oflag=direct conv=notrunc

w/o patch:
root# f2fs_io get_cblocks ./fio-test
189

w/ patch:
root# f2fs_io get_cblocks ./fio-test
192

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 12 ++++++++++++
 fs/f2fs/data.c     |  7 +++++++
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 20 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c1bf9ad4c220..c4f36ead6f17 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -857,6 +857,18 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 		f2fs_decompress_cluster(dic);
 }
 
+bool is_page_same_cluster(struct compress_ctx *cc, struct pagevec *pvec, int index)
+{
+	int idx = cluster_idx(cc, pvec->pages[index]->index);
+	int i = index + 1;
+
+	for (i = index + 1; i < index + cc->cluster_size; i++) {
+		if (cluster_idx(cc, pvec->pages[i]->index) != idx)
+			return false;
+	}
+
+	return true;
+}
 static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
 {
 	if (cc->cluster_idx == NULL_CLUSTER)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..33ccabbe9f92 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3025,6 +3025,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 								1)) {
 						retry = 1;
 						break;
+					} else if (ret2 && nr_pages - i < cc.cluster_size) {
+						retry = 1;
+						break;
+					} else if (ret2 && nr_pages - i >= cc.cluster_size &&
+						!is_page_same_cluster(&cc, &pvec, i)) {
+						retry = 1;
+						break;
 					}
 				} else {
 					goto lock_page;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 039a229e11c9..f225ea36bb60 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4031,6 +4031,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
+bool is_page_same_cluster(struct compress_ctx *cc, struct pagevec *pvec, int index);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
 						int *submitted,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
