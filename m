Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FD91B4A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tf-0001Va-OR;
	Fri, 28 Jun 2024 01:32:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Td-0001V3-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sJAUlyqq7STQw43aNIX3pt2Z4ocr0X9QP1Iw5EcaABw=; b=XjiRdKE4OIusAPQypd7lDDxmSc
 Gsl/4JWC53LYWHObzKGL54cR4fq5IR1bQxDiy1aSlue+94HyFk5Pb1rscvcqNe6UoBClPGR76Ooo+
 m1VnAXeoEtq4N77ZA2Iyhndq19dA6CzgTFzsH/TKH/HMXeXIcVRBVaI9x69zwoDSiZQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sJAUlyqq7STQw43aNIX3pt2Z4ocr0X9QP1Iw5EcaABw=; b=GKKykp4E1Xz0Pd2y75t0r2ugFJ
 eKIbZiG3ZcC6VzW7gtOBKJGe2IykqoSlrD4L04dPrWiVf8WP7kQN5PJmPn/ixK13et/Fb7GlLz37i
 D3FSp0d/zAMQbSYWycNWzjewajj/x1DNwJIgHAfVj2QVQjNySpMd5GU5XQQ2OUfaowCA=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Td-0006JV-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqaEnzhMvOJ0LfSEOym6JYXcZsTv84EUQFrVd98hIXyCRFBAslKi1LpB0XhaoUoNNbOpNVfPvbWu6C6rmoK0ubbW8u0N+B4UfOUGHdhwEDoJ2ok9Qx9+x+7L/COgru8p4Xru7/VWfKbbpigjCL4rSiNC7xvmdqkw84zT9JZihb+NHoHT+1q6GA3B47N3cJHFmU2uNGiFTb4ptk/HT3EnW7vUE6CdUJFkkjIBr7D/4te6gC67KNYTrzhr+/Hp+EwqarkGN+DdgDUbTOQD0T4SKnNk/JIAwrTi5Mh08yo+K/uEV+Qo24pM+N7OXhm1nWYYDSwPlBVqw33xsM4yJKy2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJAUlyqq7STQw43aNIX3pt2Z4ocr0X9QP1Iw5EcaABw=;
 b=P9FEw3sf5orXyG6D+lk5XF5tTSE6P4oR+gqPqZCIIOmZOV90miTVzkmBdrPVWQs+YJvW5AZod/pfQZwL7FwnMH9f/rYMy9B154/s+9ZudBK8Spjxs10WQ3aIkgVpmN81xFO3xqPbsxFAcFs9F+ZE65Zdn50hTAtgS85qQtAcxxYpnHVqy/RFPtNJ8lLcPyDc0+phcxG8T9VICV2SgGc0jnjv9rWYUd+Wq+jy/lsCEmJpa92b0ANmuiW1pY2GLX+M1EL+Zr74XlgKIGGtUsaID0cPDRhPpFrou5VAMJevC0zEFPHlODKqZV+S5QUqsKKXghL3QEIMLx1T+iOtY8k3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJAUlyqq7STQw43aNIX3pt2Z4ocr0X9QP1Iw5EcaABw=;
 b=tOhWOLu7esb5qpnpN9YylUjw4LS9v6MlKjQ8gUerWBityAWUrAsxhqzr4dniBfHvKCaH0qyqff9RFY/tSvoNabPrlZFbAbc1PXRWKkVwsC7jYgjxkSCz0mFMV5zKZOqoTDIuVK++r4mwGJGMybdIRZ2d9KSagLEQW+Ced+phk8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:27 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:27 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:38 +0800
Message-Id: <20240628013140.2444209-9-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: b12dc162-89f5-4dc2-1246-08dc97122b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SegY68kVVo38KIvg2o/16fJ0bOfmZJhF+wNq35ZOZMj6f7DcaqKiUtl6bI+R?=
 =?us-ascii?Q?22QlP90dNg/DeJ2Jzy/sHbORqBzqTRjNZO6wnQHahGzW1wz5Bh7NWovIHv+O?=
 =?us-ascii?Q?caBiZZVqy3gbzEEy+0VflmANl+cEu/qbu7wRAAHE0vfzuZ8vtJGcUCuWhnob?=
 =?us-ascii?Q?ieGi47TyhjhWnW74gst7GyWArECBOqWbBBAuT+3ispvhKkTkqhP4UsiMkBda?=
 =?us-ascii?Q?HRurmYnOfGvhu2t5ZNRm8y/ogRLZ1rdYW7Es+fimOtD3v4RO5yZr8Lw4hswM?=
 =?us-ascii?Q?pJqlQ9wfchlfgEk9TgDVuXTulKynT1rf6d0jFPsYU8dyLLgFhBTnKFwlfYV8?=
 =?us-ascii?Q?3F0xwyXeaubW1xYC8G8Z9/1xc6KvPvEdB9aVGZaTsfdE+ZYE29t4w00jlHCj?=
 =?us-ascii?Q?8Y7bhvM803Y/98mZClz1iIvFCADvXscTB8jWGYH17n5VeQcHN7oaW7WR1O+4?=
 =?us-ascii?Q?/BxkiuPUYNwQ5RG2MfkiJnDqWJVMh81tL4RNLdZSoqHYEZB/BFBcMXj0BeQo?=
 =?us-ascii?Q?fpIJLmzeus7MFxCZfouFQSNRMQibeFne/yHgrsz021qaMdl2TZLTmb5dEcAU?=
 =?us-ascii?Q?Qgx/iC8pW9U3wiywIwG6xWqHedKYmaLYzpZlE6spn1H3j0NPWaJRT4NmpNy7?=
 =?us-ascii?Q?a4fpmTfcrDsfe13EURLpMoq8Hl59zRiMv6wcoBlzLXAn5ZPY+KcYPBBK281N?=
 =?us-ascii?Q?S10urscmVqY6MPBJ1xCvJTak5IK3qrHhCfrxFNRlQ/vuGLnwobX1kwQqy57F?=
 =?us-ascii?Q?Iz74s2/B9H99eRJ9f/HuZlwyCX5YmhfXUrOBBcSRlCSH9EFXHrzrMhqutnxR?=
 =?us-ascii?Q?uy3rfeSCgD5fRmwdceLJUypHhvZGyKoWB9efhaeXo5jdh00WdoFXSjUhKad1?=
 =?us-ascii?Q?TNYGDFKilgOw9x7N3CjQMdS0IahUGzna4JfxPWhBo1HSH5BUtYcXLJScqtiu?=
 =?us-ascii?Q?ueEOHxzA9kOlVViO32QLuPItnkK6S0yWPugFrKys3K5CKDIv3qbfQHXlgEgp?=
 =?us-ascii?Q?8vu9lL+rpLVwOvF5tFL5HfimrLP9qaXdDpgPYjgfcmgpuoWLVY7CwqgiQ5zh?=
 =?us-ascii?Q?VlvWvfgsWwDm3z+2VCuat1hFSHgLV65hem+y5MYy08zXiKZ87hVDy/h0vu0M?=
 =?us-ascii?Q?GXqy5TS2/Dg9jmkEYx5Eb8mSfjF+yHMLYJLn7am07VpC3oVpZaLjRbCzIh1f?=
 =?us-ascii?Q?PEtFU2tUOZH8RD/9ACUWnMw5MYeINN3JCL52KcoQz1mnn3InToa+XrJXDBTx?=
 =?us-ascii?Q?G5n+/IekAVRVRccpyRBsLYTemrbiJJ0d8beh6qh9VVvLbWZwSgY+mqd6aOEl?=
 =?us-ascii?Q?kjJgiBN5jaJWQY1IqGlgyxLu5VNIpPn40oHO92iFikXFriuv97AIdC2S1Ijl?=
 =?us-ascii?Q?BCIw82q65Dib9c6GrFKNIWpA+H5GOP7VuIKPEtH2Xu4JK2TLsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tLon4rn5Q6m93wGN6l8+pWPo25M+Tn8HUzlfIr23TeMPDIQ65FNWNksTgliK?=
 =?us-ascii?Q?+y7UFV1WCcWMgwtsYBkDbnSJUNeVXvsSjJc91l+RwSKoFyAAsN+aqCpFqxz1?=
 =?us-ascii?Q?CIFPn2qfR5el7nO6pjgfFSiUYXBeF3L1VFiipRu2hd0vMhGXLZxSKC51EOZz?=
 =?us-ascii?Q?8ehLi2sDO3qA/JERfaUUoumlH5HYxEfw8n4fj+19NeY82vMG3rz0Ja7hdG/3?=
 =?us-ascii?Q?btbDlkXY2lUdhYjZGewi1Q+iBfFvkAsQpOTIMmB/Z8yJ6aFy99o67Y3vS7x0?=
 =?us-ascii?Q?QTHr9Vv47V9y56/3EFOAX9PItMUphmlCuhzIih4eYBzu3Dv3MFKmv+OAuwCT?=
 =?us-ascii?Q?LgpFRXHryFmkvsJzuwetr44Spzoe/U0mrYNXjfb8xBAxcXsqQhvHNyQpA5T5?=
 =?us-ascii?Q?J+Hx2Nlw1DdNykyLJGe3MMJezM4w7c4bB8Mer2l+QbQZJKHYj9CxjUI+eyJP?=
 =?us-ascii?Q?U1bBalzgX+Zzw8xTAov5hTb+16y0UkCUok+TKlIhpcboaC6J9wB5s0/bomop?=
 =?us-ascii?Q?PyQpSyqo1q9HMyjchjlykI4ZLxyGoeZRWak77mSAmglVO8FccNh3NdGEI/+V?=
 =?us-ascii?Q?AOxvslJ2ZfHZttHS71PRI+pTrVvSr5o6vrrKziAbG5+mdq4Z28/tsnFTQE/t?=
 =?us-ascii?Q?nkQQ3Po1vGN61Mgn+Dc5MctAHUuYuW0Ci+2Z2Z+CtpsXpfv3iMvhfA71Piph?=
 =?us-ascii?Q?avn2xLZU384a3n4EXEnTwgXE5BaJmh0OVQuXKNFDGm1hhMD2vbJfe4h1NlJN?=
 =?us-ascii?Q?3Yt+p04hG+0udv+vLcBVhhyARFwb5EZEO5KJqKsjdIv1pL4xDwj1U3qJ+xSG?=
 =?us-ascii?Q?cOQ/6dsEvZ+ATSjjpczFTYq/GefPdg2FRIa2T6XbL+Tqh4WzXf358Oi4YoX6?=
 =?us-ascii?Q?W46aOemgzTb1hHPa1Lq9uNj75Omq7Hs6mVk9v+aAA5ODbbK43Ya6yEEtOJ2C?=
 =?us-ascii?Q?jyFmFuiuFv9V6TdVqS94huossnE3Qm2+WrdRHtC0+cnwFHqltSwq2Uk63pTH?=
 =?us-ascii?Q?xsUSZt5pThpM+uCoui1o23s+pHKx6wqOyJxk7mOg8CD/bMBj5yali36kGv2F?=
 =?us-ascii?Q?4sHqjaZBwl6EzqtQEhAcGneYdeVEmjEdV6CL6mvOQcLMmBWm6QM2YHDKX0iC?=
 =?us-ascii?Q?9u1dZVubCA+lhyhfSwCTUax5Zt+kT/bmYcPB9pXGXGhDPzPZ9OPnhDLhE7Fn?=
 =?us-ascii?Q?OUlmBgl1zjkvZUXBesjAuoUcTxjpnc9Fb+Y+fokZVR2iTst0wCUnBkcPTlJh?=
 =?us-ascii?Q?KqcM3N5TqhqSsBYmOFDYoT8aqPrv2bVnZXGkv5pdtEC26xSILCc8x4j3ZpR2?=
 =?us-ascii?Q?oH64GY9bCENJsmMX/bfHcVEafPyUDUls+akW5T36EptEZ0PynaI/aDIRo+0X?=
 =?us-ascii?Q?0vCRd+SxZK3JAmQ2ZR8PBDdwB3fv9vu/KnsgoNLSqm8X2TTXq1IMufQMgb6N?=
 =?us-ascii?Q?qiN27VEqqAlYl1skwLnlOhDcL0RkepbEkI8ALDpeGErE6ljAoCo2Oo49gUrj?=
 =?us-ascii?Q?kKM1Y3iMquNdTpLPQ9poBnokFV15PIwY7nzZuQfTy0UqbnqQDTYrAWSlHM4B?=
 =?us-ascii?Q?AX106oHb6Lbh1ggxDXp313ZYbB5/Hvtk3XSsL6eb?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12dc162-89f5-4dc2-1246-08dc97122b5c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:27.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3B+iCWee6dQaty7K3BWSZV9ww/obhzemYa48zQbNHVeMDpFIjus7MXu63uGmBJLgBsctp09/axZGvJdwnB5cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting node block.
 print_node_footer_info()
 is added to show values of node footer. The meanings of options are: * node:
 means node is injected. The members could be injected in cp contains: * nid:
 node footer nid * ino: node footer ino * flag: node footer flag * cp_ver:
 node footer cp_ver * next_blkaddr: node footer next_blkaddr * i_mode: ino
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.44 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Td-0006JV-Ox
Subject: [f2fs-dev] [RFC PATCH v2 08/10] inject.f2fs: add node injection
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch enables injecting node block. print_node_footer_info() is
added to show values of node footer.

The meanings of options are:
 * node: means node is injected.

The members could be injected in cp contains:
 * nid: node footer nid
 * ino: node footer ino
 * flag: node footer flag
 * cp_ver: node footer cp_ver
 * next_blkaddr: node footer next_blkaddr
 * i_mode: inode i_mode
 * i_advise: inode i_advise
 * i_inline: inode i_inline
 * i_links: inode i_links
 * i_size: inode i_size
 * i_blocks: inode i_blocks
 * i_extra_isize: inode i_extra_isize
 * i_inode_checksum: inode i_inode_checksum
 * i_addr: inode i_addr array
 * i_nid: inode i_nid array
 * addr: {in}direct node nid/addr array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 213 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 214 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 7df9334..c48728e 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -62,6 +62,18 @@ static void print_sum_footer_info(struct summary_footer *footer)
 	DISP_u32(footer, check_sum);
 }
 
+static void print_node_footer_info(struct node_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(footer, nid);
+	DISP_u32(footer, ino);
+	DISP_u32(footer, flag);
+	DISP_u64(footer, cp_ver);
+	DISP_u32(footer, next_blkaddr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -79,6 +91,7 @@ void inject_usage(void)
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -151,6 +164,28 @@ static void inject_ssa_usage(void)
 	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
 }
 
+static void inject_node_usage(void)
+{
+	MSG(0, "inject.f2fs --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  nid: inject node footer nid\n");
+	MSG(0, "  ino: inject node footer ino\n");
+	MSG(0, "  flag: inject node footer flag\n");
+	MSG(0, "  cp_ver: inject node footer cp_ver\n");
+	MSG(0, "  next_blkaddr: inject node footer next_blkaddr\n");
+	MSG(0, "  i_mode: inject inode i_mode\n");
+	MSG(0, "  i_advise: inject inode i_advise\n");
+	MSG(0, "  i_inline: inject inode i_inline\n");
+	MSG(0, "  i_links: inject inode i_links\n");
+	MSG(0, "  i_size: inject inode i_size\n");
+	MSG(0, "  i_blocks: inject inode i_blocks\n");
+	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
+	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
+	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
+	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
+	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -169,6 +204,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
+		{"node", no_argument, 0, 13},
 		{0, 0, 0, 0}
 	};
 
@@ -240,6 +276,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->ssa = true;
 			MSG(0, "Info: inject ssa\n");
 			break;
+		case 13:
+			opt->node = true;
+			MSG(0, "Info: inject node\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -266,6 +306,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->ssa) {
 				inject_ssa_usage();
 				exit(0);
+			} else if (opt->node) {
+				inject_node_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -673,6 +716,174 @@ out:
 	return ret;
 }
 
+static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			struct inject_option *opt)
+{
+	struct f2fs_inode *inode = &node->i;
+
+	if (!strcmp(opt->mb, "i_mode")) {
+		MSG(0, "Info: inject inode i_mode of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, le16_to_cpu(inode->i_mode), (u16)opt->val);
+		inode->i_mode = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_advise")) {
+		MSG(0, "Info: inject inode i_advise of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_advise, (u8)opt->val);
+		inode->i_advise = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_inline")) {
+		MSG(0, "Info: inject inode i_inline of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_inline, (u8)opt->val);
+		inode->i_inline = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_links")) {
+		MSG(0, "Info: inject inode i_links of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_links), (u32)opt->val);
+		inode->i_links = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_size")) {
+		MSG(0, "Info: inject inode i_size of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_size), (u64)opt->val);
+		inode->i_size = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_blocks")) {
+		MSG(0, "Info: inject inode i_blocks of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
+		inode->i_blocks = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_extra_isize")) {
+		/* do not care if F2FS_EXTRA_ATTR is enabled */
+		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
+		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
+		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
+		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
+		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_addr")) {
+		/* do not care if it is inline data */
+		if (opt->idx >= DEF_ADDRS_PER_INODE) {
+			ERR_MSG("invalid index %u of i_addr[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_addr[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(inode->i_addr[opt->idx]), (u32)opt->val);
+		inode->i_addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+	} else if (!strcmp(opt->mb, "i_nid")) {
+		if (opt->idx >= 5) {
+			ERR_MSG("invalid index %u of i_nid[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_nid[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(F2FS_INODE_I_NID(inode, opt->idx)),
+		    (u32)opt->val);
+		F2FS_INODE_I_NID(inode, opt->idx) = cpu_to_le32((nid_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_index_node(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			     struct inject_option *opt)
+{
+	struct direct_node *dn = &node->dn;
+
+	if (strcmp(opt->mb, "addr")) {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (opt->idx >= DEF_ADDRS_PER_BLOCK) {
+		ERR_MSG("invalid index %u of nid/addr[]\n", opt->idx);
+		return -EINVAL;
+	}
+
+	MSG(0, "Info: inject node nid/addr[%d] of nid %u: 0x%x -> 0x%x\n",
+	    opt->idx, opt->nid, le32_to_cpu(dn->addr[opt->idx]),
+	    (block_t)opt->val);
+	dn->addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_node(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb = sbi->raw_super;
+	struct node_info ni;
+	struct f2fs_node *node_blk;
+	struct node_footer *footer;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk);
+
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	footer = F2FS_NODE_FOOTER(node_blk);
+
+	if (!strcmp(opt->mb, "nid")) {
+		MSG(0, "Info: inject node footer nid of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->nid), (u32)opt->val);
+		footer->nid = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject node footer ino of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->ino), (u32)opt->val);
+		footer->ino = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "flag")) {
+		MSG(0, "Info: inject node footer flag of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(footer->flag),
+		    (u32)opt->val);
+		footer->flag = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "cp_ver")) {
+		MSG(0, "Info: inject node footer cp_ver of nid %u: "
+		    "0x%lx -> 0x%lx\n", opt->nid, le64_to_cpu(footer->cp_ver),
+		    (u64)opt->val);
+		footer->cp_ver = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "next_blkaddr")) {
+		MSG(0, "Info: inject node footer next_blkaddr of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(footer->next_blkaddr), (u32)opt->val);
+		footer->next_blkaddr = cpu_to_le32((u32)opt->val);
+	} else if (ni.nid == ni.ino) {
+		ret = inject_inode(sbi, node_blk, opt);
+	} else {
+		ret = inject_index_node(sbi, node_blk, opt);
+	}
+	if (ret)
+		goto out;
+
+	print_node_footer_info(footer);
+
+	/*
+	 * if i_inode_checksum is injected, should call update_block() to
+	 * avoid recalculate inode checksum
+	 */
+	if (ni.nid == ni.ino && strcmp(opt->mb, "i_inode_checksum"))
+		ret = update_inode(sbi, node_blk, &ni.blk_addr);
+	else
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -688,6 +899,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sit(sbi, opt);
 	else if (opt->ssa)
 		ret = inject_ssa(sbi, opt);
+	else if (opt->node)
+		ret = inject_node(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c828f3f..9b14c31 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -31,6 +31,7 @@ struct inject_option {
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
 	bool ssa;
+	bool node;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
