Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F315E607DD7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 19:47:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olw6n-0004bV-0v;
	Fri, 21 Oct 2022 17:47:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olw6l-0004bJ-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 17:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=szFsz5ab2NvukvLV4jgwWzggM+83qK0bSyJwHLhmyBE=; b=Rcze5wOqXK3qyr/x1pHhyO5HIf
 tWfaGjljOG8r5y4+tbpOJ5VlVjWpi1wWJ28jAu17Q6oMJeTYXrd6Tt2RKJeR2FLubj6Sgfk5lJ9Ur
 WUBepUwXVhFZhj9+Raq6DLRM0rJNbL2dT/k19dxzvHyIcSy8ruQxDHjmZq7zmYCIAJx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=szFsz5ab2NvukvLV4jgwWzggM+83qK0bSyJwHLhmyBE=; b=JnoOeX3ZMaNTuSqxH90GNX6eaP
 WrUcjdjM9DZ5rTUDb1HPxbUYekEd9uq41Ihdnv96Wf37q76NnjzzYBMnNVmYlmRQB1t+9nlt176Vg
 yBjRkvk35GZuYwNXER03Yi/SzZGw8g7UDE5r1IdwFCQouBD5QdVa/BdaY+ghMif0pbGg=;
Received: from mail-tyzapc01on2122.outbound.protection.outlook.com
 ([40.107.117.122] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olw6k-0002Xg-Ai for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 17:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et3PBZMKSnxExP8KKhom6OtERJf9tYFwuNBsFRVXMGaWA32wn0iJEj+uDb2XZF02IH1FP2MgI6C/gCjr83fMH5b6q+q3bq6bqLTmCZ4xw52Ak0xs4azq88nlrRn/R1o7xzODDqKKlE0qculaojLHp2qPIrkNTp+NhnQWTviRm17a9yHG2Pe6ARJf4Kq5StLl0YqTRD/vVoPqAqvU92hKO+SRTPjK0SVMAGyqFdL8/n0SDKHjFgh/c2Tn8TtseENtb2zYoQRInQ/p7StxrB2fmYYO8Wk+cJG6GbrMbIW08SRUZbLI0MXRUi9pdSpA2n8GSqWVelzjxx0e7yvnV7lClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szFsz5ab2NvukvLV4jgwWzggM+83qK0bSyJwHLhmyBE=;
 b=dRVSuw+eRNhftGTlXl1ZBObMnt6I8IYamZrxJyEd3CAzaQSIPYyM2JgtZOiAy8srHT8qLGMa/T3NVjqAqQNR3VQbHV8mzLZmKFeKdtgJHgC2vhiUX1iLIhHdf4VbbnRQobq3BV61v7O7+2Ju8VdnY5v/EcmTA+GLdk+hq9zhx2+e1lfW3ak52H1mnPFzgrttSito7Fz+yLlgM7sImoz7lq3/ZwS/KOG9mQvIW2RtVdOXM1LSDYaT/Pb2vGfrICCwzSOvj4wRBduC1rO7WbxyEhVy1QvqIRcXWD7lXqHEjlyo4cRILIlvzkzFKbuYgLiT3GPjzNmePbMdiFNQF85aGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szFsz5ab2NvukvLV4jgwWzggM+83qK0bSyJwHLhmyBE=;
 b=pCPYCHPxCToxLgNIf2f4MSLvsJatStXxEFBdw3OfDhfOCZhJcjdnf0ReQ3nLtPJ0GddPKNGsHKsV00pBZqxtqZmqzUihJp9ML//RGwLo7GjxWlbZH1IetXfHCe4dJUxpGAfVsCqHYGW2kGLkGV0gd0dkOuvvHKUz4QpQHlLmo+1czNTwR67ftAST/wekhdCIk+ouvKtYpRSdxkuLqOVJ1JWNmFUxHZH8h5tZwjK+PkQs39gM/SMkCY6kpd9rnrcQnvbUOQ3Z+Ia5kmgWi4ICb5wWFibjQZNRsh8srDLU1gUdWEaZj5yJdh2H+sb/5hRCwsfbpDA+lTUjsIgaNJFAsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5056.apcprd06.prod.outlook.com (2603:1096:400:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 17:46:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 17:46:48 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 22 Oct 2022 01:46:33 +0800
Message-Id: <20221021174633.12541-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021174633.12541-1-frank.li@vivo.com>
References: <20221021174633.12541-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: a5269bd7-3d11-4dbc-9ffe-08dab38c3a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MSyWa1dopUFUvN87pQ7FaAFdvkjPzFNj6jlN6cBjWt2ZRtWAA3WOrmPwHZHiw5AzBDu5gGQv3Zfk9DrspyJlANyQwdrEO+RAWPTSKZXWMH5Ao+OS1q04OmnBEpgs+Mcyjk3I4ZbOUfFETNp8NFjSaccjmZzCD1W+JO5QzVrhj2fVnOV8Ce3vtVQeXbw/YpeeAMBYwXMsVXSryafUP9Mm0dtcW8g1wDu07zdXHLFZkUEHaRKAuGMLs2fmjyubnjZuDlmkLtAooeIjgBrSz7Qxp1tIkbPgn9ziSAV4gUc3qDrNBaWpXZcLldR0h0W9pRxy3EdsY5NDGoB9T73VkN28VP4VCaMNWKj9PEyZfDFkp9rhAnZgUVBndC6AjrzAmA0DI+bCW9kN+0/RsRv+YZKkEu0Ok1RT1xgheDWgj0jE+Di/EeOp3HAVl3hhWt7rL30JiK2zbgDYW2CYHzfdveOoI3pyuUnmZ0SvOaHiQfYjDiUhtnZ1uYkPeGKsX5nnMGemylo6r7qqqC5XhvYmopSFxh/66Ot3qmR1Pc0Aqb40tzwWqW7TzjC0Y/g8p/glayYwBZCaKpUeTcpw+9N2ffDVRXVu3o2gL+5EogS4+XECp14oYAstPwOkELy28Vx4fEQKGfQdSXBjd4tZKuIzQss9PQ937JktXFVJr2cSJMxCukXDrl/s+menWp+/c1gZ7qQ/qfz3DE6vCZL9CLrbppjT7PccBB5wVcAIT2TFg+QhDMYJVG2SNDjYeWgII1oJR1L+uGmRLaBFL54BQs4T64Qa1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(36756003)(316002)(38100700002)(38350700002)(6666004)(86362001)(2906002)(107886003)(66946007)(478600001)(19627235002)(4326008)(8676002)(66476007)(5660300002)(8936002)(66556008)(6486002)(83380400001)(26005)(6512007)(41300700001)(6506007)(52116002)(1076003)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IP9t/rsWlhhMxSxtZsh/JXeaTI0cXXHz8YZA9l9sAJfy0/+UEEujXXx+jtSt?=
 =?us-ascii?Q?Wl+MKfY5/Qllr5olVBFqOrNgDjQrFU7oOEtxxIji0wlNdt/nZsaovgUwxs+f?=
 =?us-ascii?Q?OofUZuHbujPH+ZrTNn4dRzgEg8ARIvhSEbsGrrjFeLiTnJTuh6ZKhFzUtTTK?=
 =?us-ascii?Q?iUoh5YlTKdobgndeHZQjnzxY4rRV4YXSrbgl+qD3eDdmacn+Y4b7S9vubk1O?=
 =?us-ascii?Q?I/1uE7Mv1xEsO7DgLOlgGXX4WNIXF918R+2FPBd3VGtTfb/82Oyt4gvkgW9/?=
 =?us-ascii?Q?mFw5jK4wfmOUBz7ALVOR+Ye97uaPUXja1pB7FTyRk4k171koMZ784EA2sGJh?=
 =?us-ascii?Q?9YGUCNpVzALOmzafn1LWlbBHWj3kFy181T/hY+B9jinweq2z0lT2F5nmRo+4?=
 =?us-ascii?Q?gt8cdzXXa5uk14e9g0/0jXrMb838bohk06CCsTmruGQDmD8tQIPsoVgvbCNq?=
 =?us-ascii?Q?tV+Hcy7lD7y4A+NzXpONgtsPDuNI+a05TXQQkegFXzhrvbYGW9Pm/NjE5G4m?=
 =?us-ascii?Q?CrZvUbBWaAaTcnYdxgBK3LqnEMtASFDZa05LulF+kgXgaf1hOV1RED7wUuG+?=
 =?us-ascii?Q?XF1XdQaR6XIqVQRXhc59CKakLISPjUPAO1Vu22FxnLPqNHkvJuunIQGXR3c+?=
 =?us-ascii?Q?lRRFigy/PiR32WEq1Ty3cNYCL2wtXkep+e/DfA9u5vVOvtgh/kSoLcRCgvKH?=
 =?us-ascii?Q?T/7jAVj0efSuW2pB1OHba5++qDTI/3rCaR7iHruqzPwzSb2qtXPrbxIydM8L?=
 =?us-ascii?Q?8IjJagY6MbVcWi9ZK1Htn4LAR/aLPLiZb8zsDRdunz1XImTJUjf0+IKuGUEO?=
 =?us-ascii?Q?FFsAcOi1Ak8CIp+EbfA+TmkqN2zE26JgemnzvybEmGAyCviYSEUgqeeXhH7r?=
 =?us-ascii?Q?DvsE+NunCW0sTzvfmX3tEQKevbTmbjv92P2LwmM3+VWtWDmqYf321NuFg2H4?=
 =?us-ascii?Q?mV+eFV8sCl9rgo1U+JT8yLcWTMl1eadiIelyngi//TWpSOtRLCsIA+zYXYNe?=
 =?us-ascii?Q?M1XZj/5yBInhBnTuQelrrVWZTrUUss6YL/ze1ZSxD5y+/pBM8Tgggc1VWZiX?=
 =?us-ascii?Q?7jGl5TEEfTxzok7SqIAtH3fjjM0xPFZoEcyIedGRoFEAxJd0s3/jIUQW9irC?=
 =?us-ascii?Q?iyffvGOJyQ9ZBsHwc5apcosf6zcU8jamDqrDhCIwvc32Jb+rVfdLI7g/0Q6x?=
 =?us-ascii?Q?NKdnTO/mgUbn6hD33q4MsGXGHHNyXuF/FFx8vcVGikhZ9QPS9c4KQecvq6o3?=
 =?us-ascii?Q?kaNtahJ9bR9gHMueEH26UYh1IW9t0HVmgwMhH7+mXoUqk2nOThFK1TvaNN1y?=
 =?us-ascii?Q?iBdbrIpV02ovr4yv5Q/Y2CzzgmPDzVHb/sTUxd4E8UGhwuVSozr4fVybuTL+?=
 =?us-ascii?Q?NUTsGFRFu3SbzCduSENeOgnvtO4OBH5yqcxj7IgRXM93OSB9h3L4UPWYjGfJ?=
 =?us-ascii?Q?Qa0mejxbNr0zPT155lwmEwZqVGvzsvnIYXMf1O21/tILtT9HW8AJ15WARtsl?=
 =?us-ascii?Q?2jg19QCzGuuNOLX31ZojsJ2ujldYHcvgiWgu+mprPnW6Y9gf8fnZGTNOpbmc?=
 =?us-ascii?Q?/gaHyNYUYp1elptNT8QGUT8yVQS8GVi92srZLDT3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5269bd7-3d11-4dbc-9ffe-08dab38c3a58
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 17:46:48.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZK5zDp8ocLyIIeBQAkaW2dewQkF4Nz169W/WN/90kNnLVh7MjI/Z55jJs9fIZ/FWkFHCkInQ9NPceB0h886mQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5056
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Added a new sysfs node called gc_urgent_idle_remaining. The
 user can set the trial count limit for GC urgent and idle mode with this
 value. If GC thread gets to the limit, the mode will turn back to G [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.122 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olw6k-0002Xg-Ai
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introducr gc_urgent_idle_remaining
 sysfs node and mark gc_urgent_high_remaining node deprecated
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

Added a new sysfs node called gc_urgent_idle_remaining.
The user can set the trial count limit for GC urgent and
idle mode with this value. If GC thread gets to the limit,
the mode will turn back to GC normal mode finally.

This method is not only applicable to gc_urgent_high,
but applicable to all gc modes. Also mark
gc_urgent_high_remaining as deprecated, so that the node
can be removed in the future.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
 fs/f2fs/f2fs.h                          |  6 ++++--
 fs/f2fs/gc.c                            | 12 ++++++------
 fs/f2fs/super.c                         |  2 +-
 fs/f2fs/sysfs.c                         | 14 ++++++++++----
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..859c4e53a846 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -598,6 +598,14 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can set the trial count limit for GC urgent high mode with this value.
 		If GC thread gets to the limit, the mode will turn back to GC normal mode.
 		By default, the value is zero, which means there is no limit like before.
+		<deprecated>
+
+What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	You can set the trial count limit for GC urgent and idle mode with this value.
+		If GC thread gets to the limit, the mode will turn back to GC normal mode.
+		By default, the value is zero, which means there is no limit like before.
 
 What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
 Date:		January 2022
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..2bad69cf9fd9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1734,8 +1734,10 @@ struct f2fs_sb_info {
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
-	spinlock_t gc_urgent_high_lock;
-	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
+	spinlock_t gc_urgent_idle_lock;
+	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
+	unsigned int gc_urgent_idle_remaining;
+	unsigned int gc_urgent_high_remaining;	/* deprecated */
 
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2f113fbcb85c..9641edc281b3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -97,14 +97,14 @@ static int gc_thread_func(void *data)
 		 * invalidated soon after by user update or deletion.
 		 * So, I'd like to wait some time to collect dirty segments.
 		 */
-		if (sbi->gc_mode == GC_URGENT_HIGH) {
-			spin_lock(&sbi->gc_urgent_high_lock);
-			if (sbi->gc_urgent_high_remaining) {
-				sbi->gc_urgent_high_remaining--;
-				if (!sbi->gc_urgent_high_remaining)
+		if (sbi->gc_mode != GC_NORMAL) {
+			spin_lock(&sbi->gc_urgent_idle_lock);
+			if (sbi->gc_urgent_idle_remaining) {
+				sbi->gc_urgent_idle_remaining--;
+				if (!sbi->gc_urgent_idle_remaining)
 					gc_normal_mode = true;
 			}
-			spin_unlock(&sbi->gc_urgent_high_lock);
+			spin_unlock(&sbi->gc_urgent_idle_lock);
 		}
 
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..f90a8c0a53ec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3616,7 +3616,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
-	spin_lock_init(&sbi->gc_urgent_high_lock);
+	spin_lock_init(&sbi->gc_urgent_idle_lock);
 	atomic64_set(&sbi->current_atomic_write, 0);
 
 	sbi->dir_level = DEF_DIR_LEVEL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..2b1c653b37cf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -531,10 +531,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
-		spin_lock(&sbi->gc_urgent_high_lock);
-		sbi->gc_urgent_high_remaining = t;
-		spin_unlock(&sbi->gc_urgent_high_lock);
+	/* deprecated */
+	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
+		return -EINVAL;
+
+	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
+		spin_lock(&sbi->gc_urgent_idle_lock);
+		sbi->gc_urgent_idle_remaining = t;
+		spin_unlock(&sbi->gc_urgent_idle_lock);
 
 		return count;
 	}
@@ -826,6 +830,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -953,6 +958,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
 	ATTR_LIST(gc_urgent_high_remaining),
+	ATTR_LIST(gc_urgent_idle_remaining),
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
