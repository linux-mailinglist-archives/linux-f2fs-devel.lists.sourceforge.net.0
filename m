Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595240D969
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHxu0VS4xW69HkFu5YUGV98V/Sszm08HWdGQyfK98NA=; b=FypzeNjySai93cA0hUW+Ufwu7N
	oUQq096HcDl+oWS+HBqgoiyPkJZq9u/sUZE04q/QpPlrK8a9gFHT4TSo0ehq77Pd9Zgn/cgDkKeV6
	ShGoO2GHdDNU+z8d1vZYUyuXt1Iwy+zr7utbn/6fS3fWWd4pEap1TnJWbQSIEhAoeuzk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQq6t-0004am-2E; Thu, 16 Sep 2021 12:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mQq6r-0004aV-GX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=; b=EfdXwkiCQErgcTQaGNzR5Jkezk
 gVGRF8OkCPAkuBl0IWyktJYSBn4VpI9LzFvUUa6JrMtXXuYMr6T54lsmekQOqcdK3n1VmVu6IbxOF
 /qKhb2eCDRVmyyOIAvdFaiROQQTBvaNBAsqqSD4fHRfDIrurGy7Ka44s2ViO/3R9QTB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=; b=G
 1AKy+gjuFM86HObhtnZ+z7RHK0l11lytz5sOJefRc+anDiQ4wHMlLaFWfI5cFbfwkXIgiu2royFnE
 qO2dbZPJ8chNvj5W9xQtMJCTAW/J+GgBN+SW/NTzcRcJdAgBLpvJjXvfDUrZM9FCyYtDTM405oJci
 xN1WPkNXLmUUYPhA=;
Received: from mail-eopbgr1310108.outbound.protection.outlook.com
 ([40.107.131.108] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQq6o-00ChoV-Fj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:03:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9kt7G+U/1yw2BVO8NMqZNwtjhwgvdABfguR9V2vxmXJA0Ws0tF9tpV5zFOty1JE//6S5BgFuRBr4QxOUMOMo68jCjaheetNc/laZxiL/1YYAUIlf/jaAokWIn1G244ZDbPuoVk9A4I2FdEImKFMWcN78G8cdOzm0wLgAG0rT23+v2QIQFB2nAryu0sA15OWtnEyp6uJdtbkq6+XoPhsiYtXZm2ZN0zQs67auz5SxcuoX1WKFTXPGgX9F+4tGOP94o6yubCmHRTISxTx4X66b8PsD2Fp+wXgFR9g0v3obIwCGSV7YdUy90e1vQe1nnMH+JaHQLpkvOsaaWOFVTFTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=;
 b=oJlOqFAE5HVv/FOgUiKVqJT0viivCSXaQhJqdR/urfyePDPLODQSn3joQV4+nnugg00+M8vlvSh3T27aD2I0gl2pcFD4OD8DL16Q5cxBBHd667lWZ+v77eG/tx50WuwfMJAVc6f3VXs2fREtUVrZAp3F8Y7F5lhbnBuTJadOIdxeOaSBQtykUzWBwcCcSgoGs6I2LCCRVzbWTPDSxx7eLIazFSr8CJ31vvSK7RyUil2Mts7O7hj30FKiDXH95Yf0xT716V+Z89kw25UUo5BNJDoYExSDWSkHMdPXKioexBdzPNZNRp0q0Cgf/bfoBswiP/SCQIBlKSwfQYks/IP29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=;
 b=jLyD4oDoxiBL2kSxg1DuBM/hu9DGjp4sDrg/cgOMsWAGsWclF9Tal+J67ZMqkPLD2VCEet4L6qdHaxeSya7hLT0kO8f9uv5zTnVvuUmiaFwOYm/Tr7VI3/6IV2kBGWMSiMCJPuCRkOWdlYitwsX1SIozYdHtF5QEfcJUa06oCfY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3832.apcprd06.prod.outlook.com (2603:1096:820:1a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 11:30:54 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.015; Thu, 16 Sep 2021
 11:30:54 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Sep 2021 19:30:25 +0800
Message-Id: <20210916113026.378385-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:30:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd64b2c-e61d-4707-1f17-08d97905717c
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3832:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB383225FA9EC387492FD27E0ABBDC9@KL1PR0601MB3832.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kmMhQuVzYIbrB1tFCgDHUgIxVRc4VDK1OovVUpywelHZuf6nz5c9Z3+Y4PBzjzh3nyEXcF+3O4Xv5ZMf+QLid5iXwhLgy3Ep11Kj6FqL0uIpn7xxsWyjgbMs1MDHo3qU+e4y588o7aKA7+PlSEXjXbTUFSof+pH2G3f1wG2vMfH57bpUy/leIcZdQ51V98F3A15Dyi+3LxPvEfQix4ZmT6dtkMcdBEZ7ImDHcAKMMVuHIIrKA6k8xHLl2olSBZabSfIi0U0AEUcUCX/4og59agwI+36ij0ZHTBc35tar5+SYGVDPNcEYWuZeGNJJKIVWJTAHopAF4NUoka+d4n+jvth/e/QBaNauBxNkxjsgZXAHXw1vJaj47kbDw8CvycYvSWaclNAIbuQvXK1k9ubIykQV7YBUOB/zMAMdq0ih5bq19LaKsVRIEzTDbcZM/7Z/gHK2gDdWGIVW+LH9u9QfSC87GGTp3aTb5CjLlBgVexpW04VjM/H4KIFQRgQAUSZtLdxOm+UfLxDzerU+LoWGdRl1UK09bSup05xcT+pSZHeMX0JTw7sXvH6rtxpgQm0+G1lg3CLAXyMWb8r1j3V7SWprwJkuBGTCx5oe7gTawZ65tFVEyvwcWAlMQc9d8y3imv2AZ9gBJhctV4UlLGwbibnph22XF6MfkcFIJ/avSDL3Ja+AAk2om5eLcoMqC7hyh5A6VSEbsQjj0tnO4O5zDEZLgqL66oDrarIESgCCK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(36756003)(83380400001)(38100700002)(6506007)(6666004)(956004)(66946007)(52116002)(86362001)(6512007)(2616005)(316002)(38350700002)(66556008)(6486002)(8936002)(8676002)(4326008)(2906002)(26005)(107886003)(66476007)(478600001)(1076003)(186003)(5660300002)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I6WbGADN/BGFgmQimg34GU7bHPtc+XKsYmfUHF45kcUW218yRpxNyhKFoy1+?=
 =?us-ascii?Q?n6OwkE0JzZGJwnD69r7RGVwitM2rfWXifBunkkl6EL2It8dLbNdZeTU/DmUf?=
 =?us-ascii?Q?1Cv9+R5MN1sfU197fhoSeHijsINITglPPdKKFp8GOeY3dvif/fcz2pMW3bWt?=
 =?us-ascii?Q?e+g17R1Z8Zs/1EcDjEkqJbNiBnSRLBBYc9QKVjV0l4y8YKq0mjsqb5kzABb3?=
 =?us-ascii?Q?eyaHslXHkLvUYQ8nwDVasaSc/OCHfsxJ82orKwCytBOOVXpSRqlmbJV3p0TT?=
 =?us-ascii?Q?LpF2tZEj7LqiMLoF85ZGOcu4jGplGxnCS7d7SHAaaY+qhaGziiWCh3PPgtJ6?=
 =?us-ascii?Q?9rbvg0EYju1DY4WPW6l2y5uQZCjSczzSo4wfuxanuvwqvqz11mbJq7J4MnwU?=
 =?us-ascii?Q?EmHa08kh8T6JuOgY9+bIxKoGXBOH5R6kptcMMdb82qnWcnOSBrwqhWzaoyrL?=
 =?us-ascii?Q?YCJcA8ngV5wM4aE62R3FvPqnAClgackTMHfVYIocL8E/6/E3gEkrih+O3Ur+?=
 =?us-ascii?Q?DWRa23Id/AKz2DbPqJP3adf2AtlrwYggyjObW5usBpGczx4V7Aq0f0iSEgDo?=
 =?us-ascii?Q?TI6O2yIEfLjiw2s8wkMgXG4PJ1ArZWURjCdKHzQ9OJ5BA6pUwVV6p4Z9sNw9?=
 =?us-ascii?Q?g3dblpwdOCie7q3RD7ydLM9TCHKF3QCUyKinRuEHuK443douBv8l84EtmO1a?=
 =?us-ascii?Q?ncr/O4R1uNj9LVhXk6gC8GpqbdjXX6cWaRgKbLN5O5EQQW2eynHd/pYuikpt?=
 =?us-ascii?Q?2RLRW9cEUhwmFmOycfeSqaz8QVYh+eedtnm3iox/eCVBY3A38XBbrEgpxnNL?=
 =?us-ascii?Q?9ZRxTJxYeiV5OF7R4Pr+NxEdTtgSuZ6eWCDSQXTlc+HF/NIVuGbF8pwqUoWp?=
 =?us-ascii?Q?M89D31NyJbp4zceME7JV3Y3FD9mEjwSi/Gox+Xh4HTIvLgIGoGtxmQpcVtsM?=
 =?us-ascii?Q?1aDnutLmmTDeglxD2Y02VOX+m2RBpEKzkz1itf1F8JnBtGdHZh9O0P95en57?=
 =?us-ascii?Q?X5CYW9lINH/nae90FKHvqpt+lZi0ZaobDohZGK2C/56RwerMmFX+IM9sTg3P?=
 =?us-ascii?Q?/pLbxy0DrN0GJaCJF0u25UoqYP/KQw8BOLCdqlnluij2N1vQd+ZbjyJYKxt/?=
 =?us-ascii?Q?5xa67JCE+BpiJtYe1EJ62d87Tlv0MacgXckwZHGAS67PGKyjwmqzyeHlXlJH?=
 =?us-ascii?Q?JOlaesf2dt9gIVx0ATP50WIrpcZpgo2iWmmGDrzjoCuoLjTy58fgrDJVql1k?=
 =?us-ascii?Q?LJEJyM8sQLtMDNuXArZHQps9EaYbFtrw0HJR13tPIua9E0gXoiRlUndDKJwv?=
 =?us-ascii?Q?N7Bb+cYqrGVJspdq2qIxkdYj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd64b2c-e61d-4707-1f17-08d97905717c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:30:53.8539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66BLBc1lb+JJwzKyU8YAgcUOmtasL/Zlnfg+EJJ+GZKDnq1z/qgCP0Q2qaz534UYE47g7aC+TzHppvSQKVUjSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3832
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: separate buffer and direct io in block allocation statistics.
 New output will like this: buffer direct segments IPU: 0 0 N/A SSR: 0 0 0
 LFS: 0 0 0 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> Reviewed-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 10 ++++++---- fs/f2fs/debug.c
 | 24 +++++++++++++++--------- fs/f2fs/f2fs.h | 28 +++++++ [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.108 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.108 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mQq6o-00ChoV-Fj
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: separate buffer and direct io in
 block allocation statistics
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

separate buffer and direct io in block allocation statistics.

New output will like this:
           buffer     direct   segments
IPU:            0          0        N/A
SSR:            0          0          0
LFS:            0          0          0

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    | 10 ++++++----
 fs/f2fs/debug.c   | 24 +++++++++++++++---------
 fs/f2fs/f2fs.h    | 28 +++++++++++++++++++---------
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c |  8 ++++----
 5 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..c1490b9a1345 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 	return page;
 }
 
-static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
+static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct f2fs_summary sum;
@@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-				&sum, seg_type, NULL);
+				&sum, seg_type, NULL, direct_io);
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
@@ -1548,7 +1548,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		/* use out-place-update for driect IO under LFS mode */
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create) {
-			err = __allocate_data_block(&dn, map->m_seg_type);
+			err = __allocate_data_block(&dn, map->m_seg_type, true);
 			if (err)
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
@@ -1569,7 +1569,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
-							map->m_seg_type);
+					map->m_seg_type,
+					flag == F2FS_GET_BLOCK_PRE_DIO ||
+					flag == F2FS_GET_BLOCK_DIO);
 				if (!err)
 					set_inode_flag(inode, FI_APPEND_WRITE);
 			}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8c50518475a9..e1aa843b067c 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
-	int i;
+	int i, j;
 
 	/* these will be changed if online resize is done */
 	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
@@ -210,10 +210,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 
 	for (i = 0; i < 2; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
-		si->block_count[i] = sbi->block_count[i];
+		for (j = 0; j < 2; j++)
+			si->block_count[i][j] = sbi->block_count[i][j];
 	}
 
-	si->inplace_count = atomic_read(&sbi->inplace_count);
+	for (i = 0; i < 2; i++)
+		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
 }
 
 /*
@@ -551,11 +553,14 @@ static int stat_show(struct seq_file *s, void *v)
 		for (j = 0; j < si->util_free; j++)
 			seq_putc(s, '-');
 		seq_puts(s, "]\n\n");
-		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
-		seq_printf(s, "SSR: %u blocks in %u segments\n",
-			   si->block_count[SSR], si->segment_count[SSR]);
-		seq_printf(s, "LFS: %u blocks in %u segments\n",
-			   si->block_count[LFS], si->segment_count[LFS]);
+
+		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
+		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
+				si->inplace_count[0]);
+		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
+				si->block_count[0][SSR], si->segment_count[SSR]);
+		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
+				si->block_count[0][LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
 		f2fs_update_sit_info(si->sbi);
@@ -611,7 +616,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->inline_dir, 0);
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
-	atomic_set(&sbi->inplace_count, 0);
+	for (i = 0; i < 2; i++)
+		atomic_set(&sbi->inplace_count[i], 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b339ae89c1ad..3d4ee444db27 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1692,8 +1692,8 @@ struct f2fs_sb_info {
 	struct f2fs_stat_info *stat_info;	/* FS status information */
 	atomic_t meta_count[META_MAX];		/* # of meta blocks */
 	unsigned int segment_count[2];		/* # of allocated segments */
-	unsigned int block_count[2];		/* # of allocated blocks */
-	atomic_t inplace_count;		/* # of inplace update */
+	unsigned int block_count[2][2];		/* # of allocated blocks */
+	atomic_t inplace_count[2];		/* # of inplace update */
 	atomic64_t total_hit_ext;		/* # of lookup extent cache */
 	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
 	atomic64_t read_hit_largest;		/* # of hit largest extent node */
@@ -3491,7 +3491,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
-			struct f2fs_io_info *fio);
+			struct f2fs_io_info *fio, bool direct_io);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -3699,8 +3699,8 @@ struct f2fs_stat_info {
 
 	unsigned int meta_count[META_MAX];
 	unsigned int segment_count[2];
-	unsigned int block_count[2];
-	unsigned int inplace_count;
+	unsigned int block_count[2][2];
+	unsigned int inplace_count[2];
 	unsigned long long base_mem, cache_mem, page_mem;
 };
 
@@ -3778,10 +3778,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 	} while (0)
 #define stat_inc_seg_type(sbi, curseg)					\
 		((sbi)->segment_count[(curseg)->alloc_type]++)
-#define stat_inc_block_count(sbi, curseg)				\
-		((sbi)->block_count[(curseg)->alloc_type]++)
-#define stat_inc_inplace_blocks(sbi)					\
-		(atomic_inc(&(sbi)->inplace_count))
+#define stat_inc_block_count(sbi, curseg, direct_io)			\
+	do {								\
+		if (direct_io)						\
+			((sbi)->block_count[0][(curseg)->alloc_type]++);	\
+		else								\
+			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
+	} while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)					\
+	do {								\
+		if (direct_io)						\
+			(atomic_inc(&(sbi)->inplace_count[0]));		\
+		else								\
+			(atomic_inc(&(sbi)->inplace_count[1]));		\
+	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
 		int cur = F2FS_I_SB(inode)->atomic_files;	\
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 77391e3b7d68..7c47082f73cc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	/* allocate block address */
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
-				&sum, type, NULL);
+				&sum, type, NULL, false);
 
 	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..ded744e880d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3391,7 +3391,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-		struct f2fs_io_info *fio)
+		struct f2fs_io_info *fio, bool direct_io)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -3425,7 +3425,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	__refresh_next_blkoff(sbi, curseg);
 
-	stat_inc_block_count(sbi, curseg);
+	stat_inc_block_count(sbi, curseg, direct_io);
 
 	if (from_gc) {
 		old_mtime = get_segment_mtime(sbi, old_blkaddr);
@@ -3515,7 +3515,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		down_read(&fio->sbi->io_order_lock);
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio);
+			&fio->new_blkaddr, sum, type, fio, false);
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi);
+	stat_inc_inplace_blocks(fio->sbi, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
