Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE507926DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCfy-0004yr-8E;
	Thu, 04 Jul 2024 02:58:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfx-0004yl-Lq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7x9qjhusIjWHMla9FWay4LUiPeDRlZSJKiBgatdQzQM=; b=AYMdPVvf0FzYbbgN0hXZ2QKtKR
 bCwQJHTgck7vAyEg5kz0NrMgsnNomH0AbWNMr7vpUqXUzGEqgNjn+T6kVk0Ac3wKEQIT9xCPWlCrx
 ysXKZu9k3Af7kjJtgPy2MOHUGBwhMj2fvcsReD5mf7JTgeLkuOXSrKCFAn7BVQknmtao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7x9qjhusIjWHMla9FWay4LUiPeDRlZSJKiBgatdQzQM=; b=JoM9MCbgeCx+jTFImWlCigGeaf
 6wU9hPqzHWNXg0W6ZSUiD7xYrHiLY4hUfZo74LDmdehlo4juQpto1w7AKMn1mdt1BVys2rGHSChkH
 SLA+8l4USKyLRlKO5s9j2GBjC/iuqIwFK5I0vnTb3vC4Mk2RGd9OPjvRBXGZvE6aFTE8=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCfw-00010i-RU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjdJpqk91V0ZBN87E5WCctfG1OxFtF9r2jLEtHECm67Tw5jO2LYTlBNysTeWa6EkOYypWU+3JAgZ5MbnRKaI68tyvlyacyczKVB45pCo7MyGPGuoB2uCXLuOa+XIUt2iVOVHiuc2VnDXkuIHYJndibA827f73z/QRiu+i50PrDshV3/JoeUwORVi8KZ//e4f1uvt9LhTer9m7LJUJQGTdoIyF7jDh5pszziLJroUYAFgus/09rMVHgtOrOrvsIDt7tOBwO4KkfxhWIXmA4LTX6RKbKIY8bk9treaawHw+zTkP0hLZCEK3JxLiSMDx6Gab3aYsJTwY0C1Z/VqCb2+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x9qjhusIjWHMla9FWay4LUiPeDRlZSJKiBgatdQzQM=;
 b=Wu6CSsTn4HNn68J3OyyRqEA3IUq0fT/KUj8sJdXKfKqLrGpD6FAj61T1y/7nuIAq9+mXMu26ERmcdZqvNFX8P/gHHTSb31lOTt8/zXgpvnE+aF7v77t13sXlRsrCmTCyVZMv8u2J3Vhm6i1GdzXbX6XoMCmT24RIEdlTnUcqnsy9j2bEKOkigG3fuASij8+OHLfI7eW5OTewrI/jSZm/DEueaCrOBw7iXFKNPAv52J4Rhrfdhj77gZDThUxbB20/B6TVesGJ+ebpWqptUpXaPlUIz4Zk1ehy0LKnpRbUMQGwJrVGs6zoE0/R90ycPhdKjXjgYIzrdiOOlih0FBN4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x9qjhusIjWHMla9FWay4LUiPeDRlZSJKiBgatdQzQM=;
 b=NjTxJrHHm/NVBSIP6Qs5BrmML3xBnTP6JLdN6C4X426lDFNEc7jVYdC1Cr4f8dk5rZfsVM4rA0noiJ9vpsJ/Cazjqvz+moj/PbbBPIFULA+3cp02mchJjhBLLbSEcfwx53xvXa2g/WE5QGUOp9IyRvF/mOCpOsGyxf/MGSEZe4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:11 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:11 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:34 +0800
Message-Id: <20240704025740.527171-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: af756a24-8112-4fb6-022b-08dc9bd523e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7IuXdXvpKf35Lf3ZUnlE6tNTjjcKHHGqNcm9/9UFEMaXj03N2iw+6qhs84DP?=
 =?us-ascii?Q?5//b+sN96uWFUUykehPdZlZI35YW1nqrR9Y3ZtBlwBlWaYA4+y1GgDtz/NSw?=
 =?us-ascii?Q?IgGWwMGp3DKzslHznoSQQ5Y9D1Nbp/z5kaj8aiyMR4H6CK4oZkzWXhGUx15e?=
 =?us-ascii?Q?d4wtXXuX0mykRgFZRn5pUn2EY/P9eWRZNQ8s5MVvOzi4j+YApMY3QZj6ji75?=
 =?us-ascii?Q?+xsEaukKzgbgstPNojdw3LDffzkXlSPvGF5wrSRnCCo+Xgl1Q8mJIwATww0T?=
 =?us-ascii?Q?qOxztNpwDk9jGi9f4QWFUP41a2uP63NLCuSxaUe7tDcypHZgqNJlwaLHyPkv?=
 =?us-ascii?Q?4enHZHhce4Cu4JMakEgtoukWXWNxl4veM9WfImUDr1DDcv8fnkzKNqY0j6Bv?=
 =?us-ascii?Q?lUQBhrIrHjDgsmyBHqi0Mtj2SrGd7qN7u18yP4Vblu1eYCRNvO4uGDaHGEYm?=
 =?us-ascii?Q?RP7aM2kGQnS/n7uLaWC53N7M18ytCkJknV5o4uYfiMqAno81EdrzUJFBA29Z?=
 =?us-ascii?Q?FsOGHOCJkBi3Dg3PAuiDPO9bKu8V7DBjFQyBa2M6RvZudWgW4Y3r/exLCLx1?=
 =?us-ascii?Q?Jc6u9rEZUBDwYnGb0lOcRKV/Lq/drAPOh3v3ubLrEnf7RqCxkBlMPZ+pqAf9?=
 =?us-ascii?Q?V2r+nTDpC86o0ewmIdmbSCxhDqlPsPoR3Fnj7Htwn7YeFMMDlpPZ00ObYrRJ?=
 =?us-ascii?Q?5qFmQ04CUG/M02ID+j/Y1eA6R7smYVvi30Mxt477hUYHX+5URERWEpQWsnAa?=
 =?us-ascii?Q?v5yZZHbyuxmRwpLWOwum2ci/M2ySVutx0uYx+L4F0TUgs32N36jLPiCieTTh?=
 =?us-ascii?Q?4GXN0+vvyV0wEgXIOa5XknmkDvywMIAaF8HPLCNegEuWjqojFqh0CO10Fwgc?=
 =?us-ascii?Q?0md99xjZBMOsKIdK/cyuXdXo8JQOBEz9hyP9XZAV0R1bkORnXZSRGgegiw0Q?=
 =?us-ascii?Q?o4SiYaU/B5h55UVCCvo5auyjSRzTobhfAI+iHjqMJ2/usXRiGCWr+vD1i49A?=
 =?us-ascii?Q?0Ra7DtIEBS2n3HufMwi4qtiLBC7lm5bkBTEPY9l7MEFzEoGtYKVPFRqawSVG?=
 =?us-ascii?Q?obENSVa8BN5cd5mgkfsDY02qCOwhysxW67LHFt2Ea27NqJghgo9+aHqyFIFe?=
 =?us-ascii?Q?FEiLvdiKDVdmtEu1kRcPTUv8nwdmOb1T48cpkRti4UOpnIAX6iY0mJ7XZ4HI?=
 =?us-ascii?Q?b1+8ss8I8TD9vBhEG/VXma1R9PSduwq0IGSvS2C2QVj/gBjvvd+dO5uM3vy8?=
 =?us-ascii?Q?X+PKYzbePqlwGTtVAitTtdZU5gi5fiTWtW45NEwIB5EGhIceBjH236lKXkmz?=
 =?us-ascii?Q?RheIFMxbFRJB6yr75YEIxyPXS/tRDFcTgC9IH1gtll7LAK234usQ9mSXzyLp?=
 =?us-ascii?Q?F8Ysr1M1wsocoZu7SCOgvirKXtzegoaNM8x63bldd7e4IEYfxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJDlLFOoKJUlRqUojr0lHmGTmZiXsZ4dsBxu/a/v2t67zTN4dWLrU2hYHvWD?=
 =?us-ascii?Q?Lg7Ww4OmtC1q1LbN4mpUu3M7xlr7RV90n7qvvsdIf9762pGxk2DsMt+++zjh?=
 =?us-ascii?Q?PDBKFs5WLTBCKlwoCsjdKADESmfcYZ2vOV1tBQ7tcD5cZm4i1/563VCGHRDD?=
 =?us-ascii?Q?mvBnCgqssxj0KMqM6NLsIFT96AB2uNfwpwQWHk2E1FiSRl9qpsyUiVMfcO5F?=
 =?us-ascii?Q?aX62fP+MXH711C9D7lo43nL6N8sDERT5/FfJmsSNTWf/zf3otySVlz8OW4WO?=
 =?us-ascii?Q?wwF/s7WNc2aZ18C4rbrtpojzgDT/VRRCoPFsYfKTawJNUtUfqKjdYGZR23gM?=
 =?us-ascii?Q?ugDnKW1+DfTmSdTInBSyjFAiPBvKYd/oJRZ90u+Qkhecl/oBHEq/i5b1hQ+Y?=
 =?us-ascii?Q?Ea7AgYMkfDGNo7VBFNIZR3GNU+BnykBDgjBQ+Ss+Xg/egNdzK8QF8z1gVOZm?=
 =?us-ascii?Q?9mTXCToVuhp4I0m0+LHjlCbmwHSe65sg8VX9ALjYMBUeMjI97pvhx+VFmMLI?=
 =?us-ascii?Q?sxm1pZ/XVyzpxP5CHeO/TFT/NjpyxDKQORQIWW+NYYskp0o380I2DKxoxtKY?=
 =?us-ascii?Q?WneI1QWpCUZ1JUwGEPhuDTk8Y/nBrg24ezF5fdwB028z3rslCfT/PZTwz/l5?=
 =?us-ascii?Q?jc9e8C+KBexfEKVCo4Id1gUAjE4uxIv74/M+NcpO5MtDyGQV9GrbElp6uAE7?=
 =?us-ascii?Q?9MhU35Czkt8VslPvPCqwmi/0nhZiUpEtuDIdT1nI3kMokn2gmbeIivJNXir8?=
 =?us-ascii?Q?cLLrUU9dAqfd4CTRnOr9yhCBWCn9ncKth2ERj0fzKSYLQKcneUEGBQa4uxPO?=
 =?us-ascii?Q?TfeTCk3OmwgatV74xPHbBSbPrZ9sKp6f6TMwm2iznTEPGhJugI5lG5S5pCL0?=
 =?us-ascii?Q?9UyprweIrK85tLNpcLq8dmDSP9guOwqG8c+iNJsUBBnYn9E5MsWPDARnRVDu?=
 =?us-ascii?Q?4Ssv2DHbjzIfv4ibGmzs61pLVjaVqnimNJAOjpVS7uZV92BhdoAReIyYAx2b?=
 =?us-ascii?Q?hwX4Cb9VokNCI1V3PMILbL6cntNJaKuvR0h+lLe0JIQFGQRP+IGH2/cA21Md?=
 =?us-ascii?Q?Z3x8/7MvkkymtKmBGTbMIzbdA5FDsjrd2atOkkJP7NdeQ8sfIrl12XfG+TcR?=
 =?us-ascii?Q?KKO1ral6iiFv19d6ZXcp31tUFMisZubIItPiIDAJ+eSe2yu8LQ0jEXae6xre?=
 =?us-ascii?Q?Bs4S9ZyIgvnCzD8Htz641dg5yJ00ZAh7XUF+E3TWiqcG1BUNvtvyKP/p1ig7?=
 =?us-ascii?Q?tuTSd6wtOtc5fe4R3S/Z719pFmY9fzU1EmLE7jeNeB0CdlvcnpI105f0lMU+?=
 =?us-ascii?Q?ZWo1O7ARq3HbAI+9VUGwHjQ7lTDKWF9w+zJdRtYw5EggSc4XAF3jpN0pN/36?=
 =?us-ascii?Q?O5Y3zT0lF31xgRApRwKndQdllrSSr1MmwnxgU/A4fWnDpk3+U/5m7cprgvEj?=
 =?us-ascii?Q?RNqlOWCkbRqRFZrPhhI5xeYmSgV1lOWe6Rxrbcgj2JFVjkG9nzR31VTg1PFX?=
 =?us-ascii?Q?D5I+PU2hyo7vkda3ch78oUjetiyXsxPfNASOeKyWInix9lkx2c3zTgmB4zDe?=
 =?us-ascii?Q?aBGV32JKk8CHD7mY+pC9cStkghrDY9jrFd86gRqJ?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af756a24-8112-4fb6-022b-08dc9bd523e4
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:11.4018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY+YE+BCibP5PubnFwbYa2ukQrknyyI3zU1FmKuJ5EQD8r2jmrokitfNNWE4+sY+6rNC6wIfKQEplcujdxJwiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting checkpoint. To archive this,
 a helper write_raw_cp_blocks() is added to write the first and last blocks
 of a specific cp. And print_ckpt_info() is exported to show new che [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCfw-00010i-RU
Subject: [f2fs-dev] [RCF PATCH v3 04/10] inject.f2fs: add cp injection
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

This patch enables injecting checkpoint. To archive this, a helper
write_raw_cp_blocks() is added to write the first and last blocks
of a specific cp. And print_ckpt_info() is exported to show new
checkpoint info.

The meanings of options are:
 * cp: means cp is injected, its argument chooses which cp pack to be
       injected, where 0 means the current valid cp is choosen
       automatically.

The members could be injected in cp contains:
 * checkpoint_ver: checkpoint version
 * ckpt_flags: checkpoint flags
 * cur_node_segno: cur_node_segno array
 * cur_node_blkoff: cur_node_blkoff array
 * cur_data_segno: cur_data_segno array
 * cur_data_blkoff: cur_data_blkoff array

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h   |   3 ++
 fsck/inject.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 fsck/main.c   |   1 +
 fsck/mount.c  |  26 +++++++++++
 5 files changed, 158 insertions(+)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 4ca75b3..02986ef 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -236,12 +236,15 @@ extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
+extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
+			struct f2fs_checkpoint *cp, int which);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
 			struct f2fs_node *);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
+extern void print_ckpt_info(struct f2fs_sb_info *);
 extern bool is_checkpoint_stop(struct f2fs_super_block *, bool);
 extern bool is_inconsistent_error(struct f2fs_super_block *);
 extern pgoff_t current_nat_addr(struct f2fs_sb_info *, nid_t, int *);
diff --git a/fsck/inject.c b/fsck/inject.c
index f29e746..da4356d 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -23,6 +23,7 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
+	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -42,6 +43,22 @@ static void inject_sb_usage(void)
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
+static void inject_cp_usage(void)
+{
+	MSG(0, "inject.f2fs --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "[cp]:\n");
+	MSG(0, "  0: auto select the current cp pack\n");
+	MSG(0, "  1: select the first cp pack\n");
+	MSG(0, "  2: select the second cp pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  checkpoint_ver: inject checkpoint_ver\n");
+	MSG(0, "  ckpt_flags: inject ckpt_flags\n");
+	MSG(0, "  cur_node_segno: inject cur_node_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
+	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -55,6 +72,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"val", required_argument, 0, 4},
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
+		{"cp", required_argument, 0, 7},
 		{0, 0, 0, 0}
 	};
 
@@ -97,6 +115,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
 			break;
+		case 7:
+			if (!is_digits(optarg))
+				return EWRONG_OPT;
+			opt->cp = atoi(optarg);
+			if (opt->cp < 0 || opt->cp > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -111,6 +137,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			if (opt->sb >= 0) {
 				inject_sb_usage();
 				exit(0);
+			} else if (opt->cp >= 0) {
+				inject_cp_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -190,6 +219,102 @@ out:
 	return ret;
 }
 
+static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	char *buf = NULL;
+	int ret = 0;
+
+	if (opt->cp == 0)
+		opt->cp = sbi->cur_cp;
+
+	if (opt->cp != sbi->cur_cp) {
+		struct f2fs_super_block *sb = sbi->raw_super;
+		block_t cp_addr;
+
+		buf = calloc(1, F2FS_BLKSIZE);
+		ASSERT(buf != NULL);
+
+		cp_addr = get_sb(cp_blkaddr);
+		if (opt->cp == 2)
+			cp_addr += 1 << get_sb(log_blocks_per_seg);
+		ret = dev_read_block(buf, cp_addr);
+		ASSERT(ret >= 0);
+
+		cp = (struct f2fs_checkpoint *)buf;
+		sbi->ckpt = cp;
+		sbi->cur_cp = opt->cp;
+	} else {
+		cp = cur_cp;
+	}
+
+	if (!strcmp(opt->mb, "checkpoint_ver")) {
+		MSG(0, "Info: inject checkpoint_ver of cp %d: 0x%llx -> 0x%lx\n",
+		    opt->cp, get_cp(checkpoint_ver), (u64)opt->val);
+		set_cp(checkpoint_ver, (u64)opt->val);
+	} else if (!strcmp(opt->mb, "ckpt_flags")) {
+		MSG(0, "Info: inject ckpt_flags of cp %d: 0x%x -> 0x%x\n",
+		    opt->cp, get_cp(ckpt_flags), (u32)opt->val);
+		set_cp(ckpt_flags, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_segno")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of cp->cur_node_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_node_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of cp->cur_node_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_blkoff[opt->idx]),
+		    (u16)opt->val);
+		set_cp(cur_node_blkoff[opt->idx], (u16)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_segno")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of cp->cur_data_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_data_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of cp->cur_data_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
+		    (u16)opt->val);
+		set_cp(cur_data_blkoff[opt->idx], (u16)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_ckpt_info(sbi);
+	write_raw_cp_blocks(sbi, cp, opt->cp);
+
+out:
+	free(buf);
+	sbi->ckpt = cur_cp;
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -197,6 +322,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
+	else if (opt->cp >= 0)
+		ret = inject_cp(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c7d0e33..907309f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,6 +25,7 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	int sb;			/* which sb */
+	int cp;			/* which cp */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 40edf35..da58f0c 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -824,6 +824,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #ifdef WITH_INJECT
 		static struct inject_option inject_opt = {
 			.sb = -1,
+			.cp = -1,
 			.idx = -1,
 		};
 
diff --git a/fsck/mount.c b/fsck/mount.c
index 77e3919..77b6144 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3426,6 +3426,32 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 	write_checkpoint(sbi);
 }
 
+void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
+			 struct f2fs_checkpoint *cp, int which)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	uint32_t crc;
+	block_t cp_blkaddr;
+	int ret;
+
+	crc = f2fs_checkpoint_chksum(cp);
+	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
+							cpu_to_le32(crc);
+
+	cp_blkaddr = get_sb(cp_blkaddr);
+	if (which == 2)
+		cp_blkaddr += 1 << get_sb(log_blocks_per_seg);
+
+	/* write the first cp block in this CP pack */
+	ret = dev_write_block(cp, cp_blkaddr);
+	ASSERT(ret >= 0);
+
+	/* write the second cp block in this CP pack */
+	cp_blkaddr += get_cp(cp_pack_total_block_count) - 1;
+	ret = dev_write_block(cp, cp_blkaddr);
+	ASSERT(ret >= 0);
+}
+
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
