Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CC60C67F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onFMr-0005Ye-B0;
	Tue, 25 Oct 2022 08:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onFMg-0005YK-79
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 08:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4wUQSWYqwHXl8TOWG3GD3cLpAWLy2gQPFOmX+dQ+Rs=; b=Sk7jIud4pLNpXro8gsEKM/RxoD
 CZEZ+mrlCP40rfC3LHK+igqmqkpsw1WFHvPBrrBGW0TEU9iHSRKdYi+g2FST+hcCzVF3wg1RkoD02
 YzJIc2kGIzr5dN4Sbb8eMQfvRq2JNJVfmruY64uBqMxi3S7VhelW2UofhkMySbtZPPt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c4wUQSWYqwHXl8TOWG3GD3cLpAWLy2gQPFOmX+dQ+Rs=; b=m
 LN0RC98va/cavzHzwTV8TWodQzBUJB4Ht2b5nR88wPBuXyLVdx6O/njb5r1iDOCqXw4hJKD6N3PB7
 6OZ5DMG50WPLFo+eDUic9UkZ4Irqte4LXJfLaMAAoZIREDKyPQycMYcqRIG0KrfOcM+iHle9KZB9D
 NTMnCzbv0WhE+lWM=;
Received: from mail-sgaapc01on2098.outbound.protection.outlook.com
 ([40.107.215.98] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onFMe-00GiRn-DA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 08:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBZoSqpVkEBXhSjqG5iM7U7rV8OYUAI3zBtWDqXL05g2RmqD/ftdz4o8ih+1aZuG+tMRbybRK5zTnIHJlX40lc2yRm8PTkmg3HiVnYD33YopjRkkw2KBBRSC4oxGwUfyy7NQQBhu6BWHWFDEdpVzHGFe53U8xPI7/ITP6kkImO/x8GwcBSQiwsbmYiVdvwYZDaOqZ9ZJgcCBiLVL3zUQYWQjMd+ft7nU/M7SKYvU+NCxIHLhqS6nz41eG+nO2TC+PMcvtDEHUAB5SSbX8z0XCy4slG6gKY4FMqP567PikJURU3Ntogk3DxUD4L6mFh52CZdrxFB7F37HfeNLomMflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4wUQSWYqwHXl8TOWG3GD3cLpAWLy2gQPFOmX+dQ+Rs=;
 b=Zv2A+rFWwp/ILlhwttLeSSyuuKsMRq+sM2zrSTbc/mcHVL4ooxdTNvsLXjCorEEOJyd7po9Ly+6/HV4y848gPf0qGQfErOG4rCYZM9zkPDM4Yvb7dIs7dFDi40rcyNBiFJlQbwc/yjj2PG2sJ6Ao9vVYEODwwrVSWuOkmN9e4RtX1f3TAv6zySrEPPMczM/RXkMOqEXvaZRSex4PRgAt5TTL982eQCI6Vl9mFuIP/8yAzGySnbScAQolYDsd1k1pp9DfHENuiQqitU+dZB0HFgGp1SmkTjDg2g3ckGgPUYwbuWoTXfwQrDJNoze0eBN4z1Decx3N4ztOjHjFm/0hFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4wUQSWYqwHXl8TOWG3GD3cLpAWLy2gQPFOmX+dQ+Rs=;
 b=aY4azNx4qP24mbt22+9hflWmWM9cC2BfzwvTRGUdG/88MqE1OIyCbl2p5R8Cfoh8nKWzxf4hxZuddgRV83kBXq9+scAzbFqzjO/x9l6dLPn3koiNiZhnEGLNmPJQEb0QYnlJ6S4NAa2H+ECTHwj/GiJGgddkwA6uwiWV8TzwQuGlr1adxh4U5hZpPKGqCURdxYR08H/3FQ+/tRvw0bNE9++TWo30XAElAGdx0XkY9/iyzqb03HpKYJZ4x+2OSe9FhqrYrdtjnPOJ+jlOx5ZdwbeMWOI6YN6I8GEX2ByqJ3Qlj4gteRLcj0LblutXlKTkxYK7p8VxkZqvFeUpRdONMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4034.apcprd06.prod.outlook.com (2603:1096:820:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 08:32:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 08:32:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 16:32:26 +0800
Message-Id: <20221025083226.24858-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4034:EE_
X-MS-Office365-Filtering-Correlation-Id: 21aeeb01-5a95-4d7a-1483-08dab66377d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCMKpO6ZZJ3zc1dTFKneauG8vdqJ7+PwM+ItV2eVsfhB0mOkkZEdWUwygfY2/ckGWQ2DOHY8RgxxsohaTcaVb6p4h1xt+tig++5pPLNHChrcJNOXaI5SQVUEpgn1LDJ8wKwSeVJ67ZWOOBvW8zbWjXzQhd7G547lCMgiNBFs2rLB6zy4/QuFJxd4qVr3dVvQ0jIo/wT2wgEuxuAe+KbeuU/6z1VUQPSTROmpWvRoTIwRibHu9CuedbdWYGYEown3os5nJxoyRkJqzI5RXj0boqIjEjYT7vd5ZuZXqMaN9MQy0z5Vt6jdnteYIZ2L90YLzHY5fJ+DnFrpUiON5Ei5NJVNeJtPPDrfd8F6U7i1ePR9cMvPEnoCopBt6g/BWcjleKG8sXpIH2wFgZFwl6RAM1yR8+VhA3aioSs6LAarzqFzZg99+NByrVocxsOjT8JFmAOsBzZ7Lgvk7yFfRae4fmrw7LEvzkhvn4nbHNtmdRnNstqfkEL1Dw4l9p6sobaPZCSq5I5G8e577DzbPQH7P4Ry7MGSnbL+Yk0i7Zm3I1jWiYK7bNQcQcaTfNiBMA2+brZ/ivrH0N8KJnSdcIJobeAaYNO2/kjZP3PUwHoBfahK1DbyCSu1Jut1NFvGf9tTu6WwArThTnUteW/spJzs2qcjZFhRMIGL2yCSjb5sc0eAjFXq5juLvySpSX93+qJKuP5LgDutddccjcdTE2NBCNMb2DWWQyd8E/jKwAN0fYA5w3yqtpiXVVjMkgYnykdrQQtf8j2GvBtNFig1v6ENGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(83380400001)(86362001)(8936002)(38350700002)(38100700002)(66946007)(66556008)(66476007)(5660300002)(4326008)(52116002)(6666004)(6506007)(6486002)(186003)(26005)(2616005)(36756003)(19627235002)(1076003)(478600001)(316002)(2906002)(107886003)(8676002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a69w4+tfViK/M+3qDDfEfUBWYHiOMedcSMEGhrcUi1i1H4rHVUa/jliDrnoC?=
 =?us-ascii?Q?TRk3upiHloFlnjUrcSyDPuHin3X2rSIUdIjkvnxEK+56JDJQfZ70+5ZVN/i5?=
 =?us-ascii?Q?1dVDyubcOMS61t5Q5OGXz9Wvj8Ryc4IJ/x9Vvsf8kvhUstzncOhcLnRxQ/CD?=
 =?us-ascii?Q?D1ZvYATGJ5T3K77bsRH0v1fQWBI6Zx8YyN2fqEj+Rrv7Fhdw9ClczLJCMFqJ?=
 =?us-ascii?Q?kNf4Owx87h7Lq1ibGOfnkVtV0Soqlxh5eQ6s3hs/tcWHzyHXOMlvS9CKrhGq?=
 =?us-ascii?Q?7bP2dU8A781fc7LpBYwHXDVJpzgehic7s+CsyQq6xhgxKQg8TSTyw8VLYjrZ?=
 =?us-ascii?Q?QXAE53wXSN6d+LKCoU+U4VE2Wg2zaT3ao1boqBDh61T6Eu7uHhjOAGoD/df/?=
 =?us-ascii?Q?BRWNmNP7S9aVDIvpUdzEUAZ517n6P9Qa/aHXffHu6bpZEZM9hCBdvYpYHxdG?=
 =?us-ascii?Q?Q0iUQK8qLa90EiMLOJJ81i6mHMjgr9V/U8yvNa9BlKGNeriPCZAd+o9fbM4Z?=
 =?us-ascii?Q?0uMhxlgvhNmy6JTcRY7WBXZn0CzumDawwzkxl87feAKMP5xoq8e7HrCNw+kw?=
 =?us-ascii?Q?fm5T67hZ/yp6S7Q/vc2LN5MIZmS4+XvOVYgYItlpPwe2QwOcQrwIfVTxcIpZ?=
 =?us-ascii?Q?V5iEsjLnFDe2+KI8MWf69Vi9jzr7UyTuRaFNp0cq+UH45RJkD1EWoeoKyjDh?=
 =?us-ascii?Q?F/6epkyqZclIcWOQMEbtM2MSrPFLHCuQbIZbYdhbszZ4JtfMODWl/vU0Z129?=
 =?us-ascii?Q?WiZUTjpmYigBY0zrfHzg+rZK8J4Vkv93gHAwVy1FULnM8IaiR9vUgL5exw5H?=
 =?us-ascii?Q?L6eNMBq7KLlKo/fGYZm8DpF2oP4BMcN7yG4FpXtGvf9CyQjcH1VDjzWkAFm/?=
 =?us-ascii?Q?No+ttNRwrg73bm0mCeTN8K3zWVTeG72P5M9msKf9bekvccnCGPQElxEqhHkz?=
 =?us-ascii?Q?V9HSBJQOJufTheISpjF+8ygwo8LXg4O2k2eKPnQ3uYwQxJqagtM10XGTRlwV?=
 =?us-ascii?Q?/ElzHn6mzaxoLo0gWq9azB+PnvhktRZ4rlePkLxMi2yuZ7ke8w3FygivW8jg?=
 =?us-ascii?Q?NVgck72owgcoTmL1A4hRHztg2u2zyDV2dzrSrIZGh7FAz3msAxi2hVdOMgW9?=
 =?us-ascii?Q?K73pEAP34ccRlzn3fLczvtsQjBkWDyHVdQ/LIRkhJ5aiDXb1lbr1DHb4P1Xw?=
 =?us-ascii?Q?IL4CS6qvitG9xDuEZr7EIMp014GTCDv2Ilbjrih7bIM5eUc1FRDrbPV5gmc2?=
 =?us-ascii?Q?HIOFBqiC427UGWUsOB0dfJh2U3Mss7pG15Qd4JKNJAfNKWfEsnS7zL2DOA1I?=
 =?us-ascii?Q?Fnoza8PJMitRdR4Qu6tWZgeK59/hKfxdvPU1uDncU8VdlgSM0OGZun1ve2bI?=
 =?us-ascii?Q?ryYjCUxhHCznfzUfNkxhLxqOrPEZ+j/qex4EORiSej/IQgAIigrkmG1yOBNz?=
 =?us-ascii?Q?tHjlLVJ1z8nph7JFzEIA7CMbueoZcqEsk3wE40xkISvBJ9ifsd6Fu1fDhb5E?=
 =?us-ascii?Q?eG91pJhKHankBE+/mKrhvA7+kB04qwWJdXYIqjw2p0Xw8ZlB2F681s/6PpnQ?=
 =?us-ascii?Q?qV4vdXHN5SYSA05A4SZ+kbdfXajky+wF6LcNThD2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21aeeb01-5a95-4d7a-1483-08dab66377d5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:32:35.6212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t49HUJl1TZjN8Y57KY/aaGFvr6C8oo/lzF2NmaF/A6SKIvGrE8ZkYsZBgbwRLmt2693BBZm5kADbZkQ0O/YzCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4034
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current max_ordered_discard is a fixed value, change it
 to be configurable through the sys node. Signed-off-by: Yangtao Li
 <frank.li@vivo.com> Reviewed-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ fs/f2fs/f2fs.h | 3 +++ fs/f2fs/segment.c | 3 ++- fs/f2fs/sys [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.98 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.98 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onFMe-00GiRn-DA
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce max_ordered_discard sysfs node
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

The current max_ordered_discard is a fixed value, change it to be
configurable through the sys node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/segment.c                       |  3 ++-
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..53f70eadec96 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -99,6 +99,12 @@ Description:	Controls the issue rate of discard commands that consist of small
 		checkpoint is triggered, and issued during the checkpoint.
 		By default, it is disabled with 0.
 
+What:		/sys/fs/f2fs/<disk>/max_ordered_discard
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls the maximum ordered discard, the unit size is one block(4KB).
+		Set it to 16 by default.
+
 What:		/sys/fs/f2fs/<disk>/max_discard_request
 Date:		December 2021
 Contact:	"Konstantin Vyshetsky" <vkon@google.com>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..f04a031bc827 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -330,6 +330,8 @@ struct discard_entry {
 
 /* default discard granularity of inner discard thread, unit: block count */
 #define DEFAULT_DISCARD_GRANULARITY		16
+/* default maximum discard granularity of ordered discard, unit: block count */
+#define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
@@ -409,6 +411,7 @@ struct discard_cmd_control {
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
 	unsigned int discard_granularity;	/* discard granularity */
+	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
 	atomic_t issued_discard;		/* # of issued discard */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..dfa9dc3a1bc3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1448,7 +1448,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		if (i + 1 < dpolicy->granularity)
 			break;
 
-		if (i < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
+		if (i < dcc->max_ordered_discard && dpolicy->ordered)
 			return __issue_discard_cmd_orderly(sbi, dpolicy);
 
 		pend_list = &dcc->pend_list[i];
@@ -2046,6 +2046,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
+	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
 		dcc->discard_granularity = sbi->blocks_per_seg;
 	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..eb8924602afe 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -483,6 +483,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "max_ordered_discard")) {
+		if (t == 0 || t > MAX_PLIST_NUM)
+			return -EINVAL;
+		if (!f2fs_block_unit_discard(sbi))
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "migration_granularity")) {
 		if (t == 0 || t > sbi->segs_per_sec)
 			return -EINVAL;
@@ -789,6 +798,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
@@ -918,6 +928,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
+	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
