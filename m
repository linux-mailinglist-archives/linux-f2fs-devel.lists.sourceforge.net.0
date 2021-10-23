Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A3438174
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Oct 2021 05:09:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1me7P7-00005E-Al; Sat, 23 Oct 2021 03:09:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1me7P6-00004x-DS
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Oct 2021 03:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcPqDGvWLK4W1UmfL1idbG953C2aLyTuucNBFbsEtZI=; b=buYohEf983rvNXN5qAaAVIf/Yu
 jBcc4bQJzOLUmjUVUH2J2I3GehuasiieUgUXENAQtlfm8hI7OzCWmTMupcVlKWx83ExnZ48obLGX4
 GLct1ta//FKjKwmGKrXyh7aCw8nE+NN2mbF6AXW8clBoAiTTAPz77RTtCVWbVT91mzkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bcPqDGvWLK4W1UmfL1idbG953C2aLyTuucNBFbsEtZI=; b=h
 LLl/w0i/ntHZqNosPKVnYr+GWhnn8aTPnhJ14uvlwMMveGhRikH6uniOJI37Z3rgqFnprb6OIkbjY
 YZYGAJHJctCKxMjkiLuptaCBsdf6fyp3yPhpf1nLcZ7bIURgL2DEMHK+ve0KCOimoh0Sj7KzhGYie
 3nQ0MdAg27DM1OS8=;
Received: from mail-eopbgr1320124.outbound.protection.outlook.com
 ([40.107.132.124] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1me7Ox-00Cj0w-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Oct 2021 03:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMXjdqaTn8OB64p+NHDM0QiH+Rw1RlVZ+qEfBNJNStm/rqRNdTdWArL9I6HDBon/t3u1llebrB1YknXykHqPHXGRpdLV2NdPDuxljvMDxFCMLKNvHDm3gLfj6scuDco5gnel4xjshBayWmw60NhDAGNOLsLvF02ZhTNrdylBo+sSBRbV4aEuncsaW600o+cGoXHTDIFoyXhcrFqikHxcC8fl2n98P7dI6p9iwoC8SX42KbHnUMoS3P3NLqZ9csJ2O0IJW0xSVz8sZQzBSBc5mKvfytOiY5DsTEtbJ65IlW4uDvQFfnfL4uDK0bQanQxj1zVp7V969VQ/1ixP452mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcPqDGvWLK4W1UmfL1idbG953C2aLyTuucNBFbsEtZI=;
 b=BY+D/LdbqrCyu/7/342elHxWH9CSdfAp9AE2rbklUYsMcV/S7gbH90ju7QbvcEPvnxbG+OCtSiKed5f3m6pkeSFAVNFH+T4IefKFFkbghnjCknvXGXOQPNNg0+AYLO33wRTEHd8WTjoK5Bn6gGBG4efpuEh46HtfhxqS2ophzTnbdollhOjw2YFTx/5LP3Z/XK8uiS2+qdPJDvJ4pBMNnO/GrOH89QSYOieHh5kSP6rVegbC7HFMZiGTp1JnEtVXfdnOnwOOgKY+X6kqefd5g4w3IjqDL5bO4ZunBY/VlIeEOjB1kiIDHkjRvKmhwpxkAoo8a+Gbkxs684KBF2N/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcPqDGvWLK4W1UmfL1idbG953C2aLyTuucNBFbsEtZI=;
 b=hk1372jrq4rgknRuiQbpZIADpH1iVOIvvGcXCcJVCGQtnAq2ymOUQmezsNaarUAhP/PGk3PTTzk+565rx8c9aQFLB4jLKf+wijecIuMSVwqkzVpX8WSfq1kHtK/iO2jw4mNY/PIYG/GaHifa1+IGucRFpRzp6jIO9wRcSSPqLgk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TY2PR06MB3040.apcprd06.prod.outlook.com (2603:1096:404:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 03:08:43 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1%5]) with mapi id 15.20.4628.018; Sat, 23 Oct 2021
 03:08:43 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 23 Oct 2021 11:08:35 +0800
Message-Id: <20211023030835.218219-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:202:16::12) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:202:16::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 03:08:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 826b7aad-5212-4671-3f58-08d995d26bdd
X-MS-TrafficTypeDiagnostic: TY2PR06MB3040:
X-Microsoft-Antispam-PRVS: <TY2PR06MB30408304B8D3FDFB9201C6AABB819@TY2PR06MB3040.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dORCp4oDNkijZQAa5dlbb+LUK62LNLpd2vXdF9qeBcGB/oD5rAyFAfp9BAmp1KMJd7BFp18BSgdvBKg52mgLHCUMqK9RSBvWJMd1yKvXi85bqkEbmLmLRHq45FRZql6DJCa01SfDDgS+RTNtwcPsZ3nzoFZRrkbMuYimKEZ8pxuzGCHrp3e0vzmtHUOJXLpGY7vZUWDL7M5ztlygofL/DFmHepa/Vkb+yO82fdZtao+CeozSkPFpc9YM2PEJLGU3rr812YUGa2xvD9ixNqOgy5bHEbXjuP1bAo0Dm3bku5ny1rk5UPg7sMRT/feSoBIzAD7VsWHE+Oed6PSM/oJMm6h9EhJSC3069Sp4W99k2GKbldRhSZB3xIQt3IqG3shoaViI7EtaFwm9eXgKwREUxlWJEp4a3TWVzE7PozjxhkrGMn1jlodNtQj+evK+k5lRsoxrNrwU3/dqTvLRxxdmPaDBQW1KXCl5/A59lC4cb3RA6o94U/IHhBpoGBlSOc6n7G12uBa6ucGbabymcl0n5cCJ0O1kFGI3G6ZUDmCxNrEJnm3BXwb39V5tHH5jIEHB2f9kQ/SfcsaPX2l4UgtFYVFrN5o1gEj6iFOMoBHj1CmG5gkEpEJJr24nkcWq+RG2Zk/+eKeKHsrG6CHZKuddjrtLh/oC3Fv6g1Pyzgc+30WCuxeHaze8bZ2tdwgqEp7DPxJYZolKeuBB4sZdaMhBVL5dqyNBYviRgG16j+O5Fqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4014.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(2616005)(4326008)(66946007)(6666004)(316002)(83380400001)(36756003)(6512007)(107886003)(6506007)(8936002)(38350700002)(1076003)(66556008)(52116002)(5660300002)(508600001)(186003)(26005)(66476007)(38100700002)(956004)(6486002)(8676002)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kopQZzEcZip2m4LyBz+icNkJfyswd/+rOLZQfDqlVyZg6FwUJBEXALr4lBy1?=
 =?us-ascii?Q?GUnbEAXQ5dmAwnB1j5XkF0Rr8OJqA8LzXSKFqoJg745X7PuqNHvCoFFnWFvM?=
 =?us-ascii?Q?KcIhZrNZMQhAJwzPhpQS/WM68yDpLYlxRQTomvqftijbPrfqcUfFWnaHmsFx?=
 =?us-ascii?Q?lYyL/cw2vVq74kXdylNioPbcGzJ0hBU+x9Tlax33jEZG7VK6/Kalg+xpjjId?=
 =?us-ascii?Q?Tq1VngRSYSAhAKD4rrLuYy1b40QiEJSZ/UQ7bc6wuAdJPe82k0rUfeUVUJIN?=
 =?us-ascii?Q?hc2XTIwmP4nliciD4PdLLANJveR+PjoQRs3gHEB9GVM3EnhDVP8oIO2SkSNI?=
 =?us-ascii?Q?6usVd1tBKtgosIvNma4+6p3Jrjg0HVDZ5ezIdExPDkgL2XmtrAzrhoNRiRgL?=
 =?us-ascii?Q?ie0EqWqEjGT+lHnJDCfKoswHhsxrzw+AZTHhag368vZsoFH4UHavKyAweWfh?=
 =?us-ascii?Q?O3TfMXoJyHeNMK58ppWlkjC0MEJMRMsTTgciUM3sDwy3ndoRFxSlo05/ngOX?=
 =?us-ascii?Q?oJY7aYTZdZV51ME1ve4jzMjS9HZ8tURhLwZ6ZY/gDy5AnZENlRw8nb9TOjyh?=
 =?us-ascii?Q?4QXp1dtW5cKo5X8cJLF4eR8FR1zReIkk0i7le7qDBPC1WKCx3w6B5qurWuQ0?=
 =?us-ascii?Q?qaWU/Ca25s+A2Xu3jRNMdSQIdgbF8b2EYybzCVogoVNKPbPL6Vv775WUi9eU?=
 =?us-ascii?Q?AjS06G6t1kC4KZGoNxGoVNZypdCYAggJTGeglftwadg2U12kA/h+P5ip/div?=
 =?us-ascii?Q?MqDu1k/DZNwhRkeYDr2DebrJ/IGsenmduiH7GEXbNFzaw89fohdqkyIpex/5?=
 =?us-ascii?Q?orAaUk+PlRVT1FSCKhQO7twpv9A2hfOxeWgOXs+c9JsJNCbMNIy1CuGMikSL?=
 =?us-ascii?Q?lcXmUaEQg/f8aPL66Y18sDfeL8uzs/G2ZQz5XmGCLGnuc30H0JuhGBCW6YO2?=
 =?us-ascii?Q?PRIh/MNkoVsykTQLc+H49GrJNw9BFaFjJu27F+Xx48JWJ5ICXSQC+YyjXLQ0?=
 =?us-ascii?Q?H6Wd8CSMFql4Ot6kzjIFeRPhPXT1GyDRC//qYYiagxyBpr4eTF6u3JKyHrEx?=
 =?us-ascii?Q?UNnfEMF5zi5J/3a/nTAIhQpBQUavviGhfc9Ztpr9cCK5fVipgu2wbQubsg14?=
 =?us-ascii?Q?/Xjn6+qvorxFREFOYBa3JaG1fK6YnSJ9kh1ao5obb3fGzavMTK3YeeT3QRtx?=
 =?us-ascii?Q?4WmThMfIwN1JrTUhmZ05j1JAPI5cq/Yo1k62Qz4ARMrXAMv3jQs6RwOxcVOw?=
 =?us-ascii?Q?ihVwZ3p02qB3PvWh+UEYgQmAlKi9IknRZBQY6Zfbbx02kACa9aoxrf57Spwb?=
 =?us-ascii?Q?sMzrN1xtJMwij7ni4w52rLc6uz79Bqd2mIsogMDzrFVDJCZofucptudH6qIz?=
 =?us-ascii?Q?fDsp4kWj0n3oXMiiWWt9nvdP7QsK6JqVi6AqWAIT+yt23Nrtj6a+A9wi8fpG?=
 =?us-ascii?Q?FA3gnEmmXCFhXashlWVG8Ht4WUwC/fAur3TL5aQZBn89qgPhSdArQV+gLZwv?=
 =?us-ascii?Q?4Yk8mFPCKsZ9vKA4bq0ixvSZtfHiZ61zAhdLNox6ze7iizWHsXwyYk2eFVkY?=
 =?us-ascii?Q?lDMVxNMaT1hQ9EaG/KUaa/0vcQo0T7PYeqyCyfyzMNO0iabEt6qLpXAowzQW?=
 =?us-ascii?Q?s0xcK1v1ws0CvnHg0kDJsIY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826b7aad-5212-4671-3f58-08d995d26bdd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 03:08:43.5685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvTMapRLIC/MFggfnNPrl0TxWs/rRZPyC2ja/Ecmmy4N+4FBN8GluI9SdI9eGrCzluqJTClUBN4Qb8WV5mKxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3040
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1me7Ox-00Cj0w-RJ
Subject: [f2fs-dev] [PATCH v3] f2fs: compress: fix overwrite may reduce
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
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 19 +++++++++++++++++++
 fs/f2fs/data.c     |  7 ++++---
 fs/f2fs/f2fs.h     |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c1bf9ad4c220..bec3176ca682 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -881,6 +881,25 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages)
+{
+	unsigned long pgidx;
+	int i;
+
+	if (nr_pages - index < cc->cluster_size)
+		return false;
+
+	pgidx = pvec->pages[index]->index;
+
+	for (i = 1; i < cc->cluster_size; i++) {
+		if (pvec->pages[index + i]->index != pgidx + i)
+			return false;
+	}
+
+	return true;
+}
+
 static bool cluster_has_invalid_data(struct compress_ctx *cc)
 {
 	loff_t i_size = i_size_read(cc->inode);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..7a0e26f3e575 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3020,9 +3020,10 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 						done = 1;
 						break;
 					} else if (ret2 &&
-						!f2fs_compress_write_end(inode,
-								fsdata, page->index,
-								1)) {
+						(!f2fs_compress_write_end(inode,
+							fsdata, page->index, 1) ||
+						!f2fs_all_cluster_page_loaded(&cc,
+							&pvec, i, nr_pages))) {
 						retry = 1;
 						break;
 					}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 039a229e11c9..6f8eda811350 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4030,6 +4030,8 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
