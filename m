Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85A60C247
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 05:32:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onAgG-0005if-OT;
	Tue, 25 Oct 2022 03:32:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onAgF-0005iY-TK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WSeboihTMheBmII6ZDUPfIbdD40SKL/aSPKoFHjyIgo=; b=LtVaHm1uv0ckfPLLQssBXFvveI
 tmVzONVTVl/fDAIZmnT8gixxT/GWchKJzuLcX6uya76k3KPaDWW286HmFYpTKnC2Jak+KhaFn0ljg
 1wmUCgEja2/OsP46MVCYlixkKyFpF20W4vZMYTxtHmcmsbFjsSiBoNLiRXGpc7ZQPZ4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WSeboihTMheBmII6ZDUPfIbdD40SKL/aSPKoFHjyIgo=; b=iLrhxlZY3idmiWlvtf5SQui2a8
 FtuCUgVAgjaBo6y38U527iy9eZfPhR/YifHOSE9ElEjGmPTb7VSYlwF3E6ysQ56UdAjGrA49lblHl
 UZBsZSJ5XyU+Q8pyELgasQIDD82If5jBm5Q/qGqbG3GJk+m/SNjOlZNM3J/6WwVCZMMs=;
Received: from mail-sgaapc01on2122.outbound.protection.outlook.com
 ([40.107.215.122] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onAgC-0002Fj-9L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO5BtC1Ip7l9dGE/nUdOnUZlqDmIGZO6I5X/cdeFXyMWQAtK2g0xYw+2pUVhP0kj1PMIYzhRGvithQMKpJf5qrMhmP0BfJK/UiNeXCtptkmiX+8qpfSIb5+4HpfN0t/1MohncpxafMYI05na7b9LduhTTXGTFuZ40W7dIh5MPDSI5SFQ6gU9tD40kk28FOx2XOlLKr734f0jCaAMz+etDHreb2MKsUaDrI0W0i5o+7ZzfEZPnI5D3wzJDrqAM1HH73ZFYDs1zTiDxxfpbAnry2rgj+LiO5bVmt2p2clR+NtNuYCuxyubIDOECa8Jm1plt5fpd0XWmTgyOaExoGjzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSeboihTMheBmII6ZDUPfIbdD40SKL/aSPKoFHjyIgo=;
 b=FoZE7LA8M+rtIkQd29X8xzvmgoWa5/AIaL5Lk3kLdX7IKfnXJ8Y/UFvMuRDHXnHRte4CRFNLDt96OUaGg7CRSCUCR4EUbIiDrt+IzAH1E+AnyV+9CLjVFwhaOv1zvIu9rsWf5IONsc7UTKzJvoOCRRUZVJRDt6gCQGroJl8asWlOGeeMdjmjsOvaxCmSHFYgkBf2lqEd53C2kLICWtgvOVJbciNhrmkZd42IX5iKeCHHqPtsAJiN6GhzsAtDXDTLgzIF37BeD6SJzX8BWtVt24k//r0fMqDvlK1OyWUeAHf4KPS1EX8MT2+0CC6Nxfzr0BSfbKEHd9FYNkiimFrfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSeboihTMheBmII6ZDUPfIbdD40SKL/aSPKoFHjyIgo=;
 b=pdDc/RftWa28RtqtHNxmINxoDqVuHv9clcIChkHmDyw/TaW6fffS9q3QHf0p0UZIjQiHmIcWUFVsfWnYxUMptfH4Gn5C1WLXV4cMK8QgyWyoDPMnvnypKBVZAtYltizO2Yaa9n7tJ4cH5N1m+VHuq5oR4BbObnREpBp3GQhaHrFGOT4mpfvig3o+9u5GpQyB7OJ0LmfN902suil32e0j3enj5UJYeghJN99CUs16hBngjPCyiIS9HfswsfN7SoBfH1CgGOnL5yACq20nyv14bzHS8PXG+bZ7wWB8qqHQjoffAD0Fj2ybcpCYLXdsaplymwP1kpla9TfL/00LlNqMcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6247.apcprd06.prod.outlook.com (2603:1096:301:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 03:32:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 03:32:30 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 11:32:17 +0800
Message-Id: <20221025033217.14840-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221025033217.14840-1-frank.li@vivo.com>
References: <20221025033217.14840-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR06CA0248.apcprd06.prod.outlook.com
 (2603:1096:4:ac::32) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 761666b8-d08b-465f-9dd9-08dab6398bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9IShIxQPhPDrM648KxPWmW3Cov4yLJUBX5UhgwoLwPFAZKtxoWQ/K75BLImaNS/czhl39CQA22YAvSU4a/V1sz0LXqY+fqnIhdpv/NaTXsFe6+NnD4m7GwxwclxgVRXQnab6AaFhUimZeDot/ynLODHOGz5edeo9ZHLcHeUcvd6X7sQUGia1aWpggmJSiBDe+O11kBEnRrNx3N3U9PUwHGvUy2EThZla/r8lJYig48GULcWdb1Hx2sk6NNKolWJ8kP/fkzzUpvcDrzeLiqi7QvaSFTm4S2sDWYEfxKFbJB+T8CWgqpfFOEC+RLsl4i9mV0hjWk4qZx6rseZmzrSyEOpBDkNKV8AW/bPE4R0ZN7DY5zP+wE0qF6eTHfQ4h6GpelPlqyxPzgf4OiAKbxpTpXCu1AO2vgiaHN7N2KmWx26lfDws+E1Hlu2VM2mdQ/xR4TuzEFSNjY/zGyCM2yRL3D70eV/a+73a8sPO+yFAdICqdmggisjjNU8gGROVbLd5pg3XmxfL6+lKiTMoVZl9eEVIkczAnFDq6kXLbA/X5YtibTGb9AmWs4TNQemou5ZadpifrwVuZXp+/G2D5ma0gux+wpt5NW/qMtuNThV2v3PxIIcUexb9F+cE7GEYPCpy0VQlvGK1nA1s+RZO5cUmuuTvhY6v4ykVpu0Y/SAFi3lEuNoeV8Vuc7Qm+mIh7BAkrzn8IfFokbvCacuDoptzqLRaI4AQNTnzhJQFdeUyuM2EoNy8Nn/QfI1kMbBFGl9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(19627235002)(107886003)(41300700001)(36756003)(66946007)(4326008)(66556008)(52116002)(66476007)(6666004)(6506007)(8676002)(86362001)(8936002)(2616005)(83380400001)(6512007)(26005)(5660300002)(186003)(478600001)(316002)(6486002)(1076003)(38350700002)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PXfPuCFj2/Hjrnc5OwQtFsqmH8duchs5apbWDsuL7zs3EoN+L3/Zt6FAANLQ?=
 =?us-ascii?Q?CANx+kg5qholc/tM46FDBOimyI8xsx1cAhjkwgX8tzAI1V0EYwgIEpG1YnDJ?=
 =?us-ascii?Q?2zdVByvY0PF++r/uuZSUcUJRoWUglO87mJhofBMJ7u6QmSzzSdbvkPMFrxH4?=
 =?us-ascii?Q?OO3Vd0EnD9Nen5Pfz2JhJtTSrALupCO66PwBpSs9n8l46zkb+djwxvfE+GHi?=
 =?us-ascii?Q?xT0fxP92FaxkwlSu6pvgLHFsxKtXc9W/tOq29KHa4Jj5sX3Dp2YJmLOJWc1l?=
 =?us-ascii?Q?5uMNO7TM9aUfVr71KcuxqFMttJtm7EFDGX5yEWEDXIOUP6oVPGbEBzJ+EXIg?=
 =?us-ascii?Q?tUKK93olFVU3l709hIW1Oax4Mb0i1rMTb+75jlMHp86OG89fcTPReTPuRWNG?=
 =?us-ascii?Q?AsX0dZrF2mwmfo/Wjvk99tZ7ugnpLyjlCCviXOw6Eh80pN/KzYZNP4VxEs5y?=
 =?us-ascii?Q?pN5dhoRrXTZcD+FjYvRh6b9ua+LLgmolytjukXc388Zua00k/rClnyaH7OAz?=
 =?us-ascii?Q?laUfZHNwc8KpC7j/YcmSJbhAZZ/LZg98usMXul32e/DdTEhlaeusGe4RZ711?=
 =?us-ascii?Q?9hAUUW9PgNq6D0+a9nYXiDpPrYv4xWnj5Jo5TOsAnEe4kOcg02JiCoMl5sKK?=
 =?us-ascii?Q?BTpAFDJvq9FJjW5n276LXxb070At8Wj2Vzx8txv8Ht4v6qvD0eVsQVZkO7Z3?=
 =?us-ascii?Q?1JUTG4eXqlySfOMrV7hQUfCvag6OLFjcCEWBWBUm4PnYg5xwS+tdDk7utaB0?=
 =?us-ascii?Q?yunf7LMXEsWE+fuHdHArnmlTub58vw0sxupUEv7H3Jllof6MaDYAcZSlNx38?=
 =?us-ascii?Q?CE6r67z3KvJPO2cloHNGOQhXPLGC8cSDGkvfiuV2AGUbUmAL7cDqc5Sbfzuq?=
 =?us-ascii?Q?qZ2syg3uE5/rxNaKqIVNrqsxMjXpDb/WN9Rm59AaYoHqnCKgPh2YX1kcgQA4?=
 =?us-ascii?Q?NJOEsoxlW40aF5X3z/LPYfNLmYUBFZnSFNyIxQbdeREVHGds3n6khc09KMV2?=
 =?us-ascii?Q?g1zVtk5he7iabcZxbY8U3zePXca4rCMMmvXiMxXujbb/gP+laQud79gwa9Kg?=
 =?us-ascii?Q?aA9KJfR7g5aTT9aqwvKMbe7dvUvkB/uRiQOHdPcZhiYnlhkevb/yySQRylJh?=
 =?us-ascii?Q?dNUNR6Bkk8UnKSaVe5cNEEkHy1SZ/z4o5jb7IrBYKkw/zZsbguniPJDQWHp6?=
 =?us-ascii?Q?2T2ymPThKdAf9mEeRcYnA+NVF24Mqc5/8th+5P2p9eNNPw1Ogv8kQBMVGUI3?=
 =?us-ascii?Q?iZpnkWiE9cbi4R0hAAId3Qe2BAt5G0K9xKtwodf7qffKG0uH46WYvlyeJNiJ?=
 =?us-ascii?Q?JFSJBW0INbKfctb4/8ULvVqbi3HLAQunLEKak814l7tgLjWodoq0IwQNPSSl?=
 =?us-ascii?Q?YjIakEWMcYETeGPQQN6aLiWB78rbqkZXmp33F+HvV9JR+Imt4eVPkYiGwWLV?=
 =?us-ascii?Q?k4/v6Iss67fT0jLqMAwwo8nVZJYgsXkuO0GEIBVTCPv7+yeTF1aJI7hdpjTC?=
 =?us-ascii?Q?Ey8Z9byfO8X/8wQ4aGZjT5w6gaO2BWDc+SpctbyeP+MCG+UGpwUXvxC9Xgfg?=
 =?us-ascii?Q?bUH1fhf1eS04ifjmAnJxIUvIuriqTbEChhSS3KK5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761666b8-d08b-465f-9dd9-08dab6398bf5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 03:32:30.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm10aPh+X1sfcvmI1CFQqVJzSzCRqC1ZkValzvpRosAtyjyfP3UvS6htYFILvbRe1aL/4jVvqZ7noK6ZJeiumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6247
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: gc_mode sysfs node can show the current gc_mode as a string.
 Introducing it increases readability. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++ fs/f2fs/f2fs.h | 1
 + fs/f2fs/sysfs.c | 18 ++++++++++++++++++ 3 files changed, 25 insertions(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.122 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onAgC-0002Fj-9L
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce gc_mode sysfs node
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

gc_mode sysfs node can show the current gc_mode as a string.
Introducing it increases readability.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..6466f3b1f0a9 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -634,3 +634,9 @@ Date:		July 2022
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Show the accumulated total revoked atomic write block count after boot.
 		If you write "0" here, you can initialize to "0".
+
+What:		/sys/fs/f2fs/<disk>/gc_mode
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Show the current gc_mode as a string.
+		This is a read-only entry.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..80f23e44a442 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1318,6 +1318,7 @@ enum {
 	MAX_TIME,
 };
 
+/* Note that you need to keep synchronization with this gc_mode_names array */
 enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 49898a7243ba..058857d8b3b9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -41,6 +41,16 @@ enum {
 	ATGC_INFO,	/* struct atgc_management */
 };
 
+static const char *gc_mode_names[MAX_GC_MODE] = {
+		"GC_NORMAL",
+		"GC_IDLE_CB",
+		"GC_IDLE_GREEDY",
+		"GC_IDLE_AT",
+		"GC_URGENT_HIGH",
+		"GC_URGENT_LOW",
+		"GC_URGENT_MID"
+};
+
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
@@ -133,6 +143,12 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
 				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
 }
 
+static ssize_t gc_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -823,6 +839,7 @@ F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
+F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -904,6 +921,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(pending_discard),
+	ATTR_LIST(gc_mode),
 	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
