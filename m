Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4139914FE9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:28:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkgT-0008T2-9Z;
	Mon, 24 Jun 2024 14:28:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkgO-0008Su-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWM2n9SD88FaU7l5JNb4ykZEpdLFdKPp1BXOouJeSWw=; b=OlSocSyEzPzcyw8ZE82LyfwgjU
 u1cpRRO9F3er7WSDu3skc2O1ScQVL0ICnZi1axluqdLmKoesfzOoU6UtuUWQh+Db9t1XgnOwns6d5
 bO/5AP1jnj/mtOq7FE0TCrvnjElJtP+NrElAgv8vhWTE6VUW3ZTnSOogdlPm2TtigJfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KWM2n9SD88FaU7l5JNb4ykZEpdLFdKPp1BXOouJeSWw=; b=fo7xwrYsr5o8F5Nkq3jRVTDoqm
 3qjET72cPtABFfOzNb44XkO+kL7jpI6HCmHdkNaz4bbgG8EFmAenCg1jx8V+k2IVZAdDVu0pjrlVG
 b29X7c1+hdM7oNkSKfrAMeEzy/rMc1jbyyxg4Dzdmobe74L44atvS6bdNdkdDj+7YHwA=;
Received: from mail-psaapc01on2078.outbound.protection.outlook.com
 ([40.107.255.78] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkgN-0004fL-Bf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMfXUDlK8RrqnzHqCUx4gxUdEhcsar5HSggFkqt6O3aXaMCdLKuxE9nYh52ZHBaDqGNXOK0dZJWW5JlsZjnn/poJjYeXcJ/MBPf2fm55FJCGQJ2T4f8GNuwIAHY/Ev2QAtmAWihg7eS/Aki5s0dbfQ1wKqjfQceLyqzT4zDL82/95FzzC/2RyQeg3DhXg4BccAnOyjqJWJvtqIXlyWiuBopYGi5SFiRZuqf9wiB87V1PQ8hMXFBy1PwIhAJJzg/wAOXVsDrOmLZkf4LP2FIGh4oaAKtcVHEU4Pywni9q7oGmXH9YWERYrICeOanJEdvZ8VJaOJaFbul02CCnLYn07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWM2n9SD88FaU7l5JNb4ykZEpdLFdKPp1BXOouJeSWw=;
 b=CoF+2sjr1bSTQU/mSeHB3lDpifR3bbNLB9gL0f9AqqWVvlgNy0iXFzi2Drtvn2SkPY3Ayg8+MCbgmcwADrRWhUu3shLWYfFSzkR3XEIcFDMzg/KfkXE1mplyPK0aFwLDubD9v43adgRJwAviZH6C2NSPees0levIvUv3mVt6XIy0q2grtVbBGxohtFnSac+V0mxAP7leXSaTZGYLCcEG4e5qXWdDICpTEwhAEBF8dY0CQcDDKg83zuVdunJzO4z9I8JN/s3HPQ2F9/zBOI9YLi5re6+Xnaq+GEdowuRGozYMHuFK32LTCX1A5WLfsWiOSxz3qAx5MUnEj5Dc9KL0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWM2n9SD88FaU7l5JNb4ykZEpdLFdKPp1BXOouJeSWw=;
 b=jHywBCnBiqrz1c+aapGJUa6jfX5cy+QEk9hxaTyFFs86ZxFLGw6fGEDL3SrVbnyA9DNYo55J/K4C0JdHGOxTZ+Ls0aq9Wg7ea/CTXYkwPXVMG9UWLK4Amemk+j6rh4bx2g9+TXNFkcmZYKA3eCDAIRbi6BKPLSPdOcjjtvplaRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7515.apcprd02.prod.outlook.com (2603:1096:101:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 13:56:04 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:56:04 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:32 +0800
Message-Id: <20240624135532.3330136-10-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7069de40-4faa-4ad7-c3b6-08dc945563cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5KVBvyxBezSbhwudwbjV29fYlphLb5DwD/T80yln+5BRAwg0p15AgwR1VdR6?=
 =?us-ascii?Q?pSK4monwDYl9S6DNWONIRJ84bsd7B/j/UUc6T9R6MZcmqip6CKYm5Nc9PdVj?=
 =?us-ascii?Q?Zfeft9vS85TRV6pmy+8a9xNNR1e/U2BfGpEez4fr3rdHz+6L1XOeHmtVOTIQ?=
 =?us-ascii?Q?mOkSY8F/1z9ttzBoZEG7QvyM1Q/Poy02GKN5epQvrE4ky5myLEbf/17nsxAf?=
 =?us-ascii?Q?EIsLH1hXmxWpTaLROE7lP7UrFdcRRRBxqVeLFenLPS+Hqw7v1UQDkGU4J7fS?=
 =?us-ascii?Q?j9QCc+L9kw/JR62ZeRlQ/JMLHvWbr7S27a9tiMUwi672W9loM8GJnM+oO5iP?=
 =?us-ascii?Q?FZS19F5EtTdtZp0VFxA6sjUZYFOvKiUFF6a5Jmd8uSq1GKQBcIoKxZacrbuB?=
 =?us-ascii?Q?b9Hj5dVBrNKhUfCTI+USNDEBzTSVm2sg8/zOYse71ixgL+oMJzp/eJ82NBKQ?=
 =?us-ascii?Q?q3X5mFt9gYWM2vSJWqav2Iet3YtWyWOx4t5ZvZyWn7lFtvdCGOR98Wuc47d/?=
 =?us-ascii?Q?Gcc6eVc94YJBiEGLT9S3A/IYtMIC9x/JboHfQaKCUmYEBS4sMID+hbyjQszn?=
 =?us-ascii?Q?HtGTKin+03uEDz89uL+dDruTyL6ig+ZPCyFbpuPsYFDKUiqCiNmRsTtqsa2N?=
 =?us-ascii?Q?3fTuR2mDywM2yWILOKJL+jZJOYiVvhgABzaQrToIrtXEKjRC1GJgPFJcfCHJ?=
 =?us-ascii?Q?qPB/PVX4h9MkpQsgPcDOzSdx07zL6kRj07m4flafHuAwO50w1Fp4aQijOFv0?=
 =?us-ascii?Q?t2D9RCS5nrvDg0GE0NXyiuAhSIpn94fJ3zeBhvX/Ji48RZhswZanICIG6adi?=
 =?us-ascii?Q?KtHQJ7IxnQtsdzpCaALhtMO5hJzujTG0QAV6HXAzUtAdMzCly/Cb2IEWLeaZ?=
 =?us-ascii?Q?w4Xy/SbKdn4O7Hqh4M/Y3syb5Z7hYaJ19pHo7uZSuuxDoPig+3gn+6Hw7vx3?=
 =?us-ascii?Q?e9Ek9uKop01yo1APVhd1CUVsovrnY+dXZSSw0bLSOtbcqS+j+JQ/NEp5CHP7?=
 =?us-ascii?Q?i7bUX2OeP7zsPivt7fyzlyi0m48eNuQAd5dDzMxm3qqBcZbfP/na7dvicfVA?=
 =?us-ascii?Q?Z5A8BDF4ujCKL+YYI9Q/HxdhAcrlKHQ55iPmTo1RUqRDuYY2NobQ3GB8kYPA?=
 =?us-ascii?Q?nkyMkX3YtjokM4PifEbGy/g+HFl3AfMvkLn9J6qWUhb1X7elHZB2FrjO6Hsg?=
 =?us-ascii?Q?qmMOOKF74Mp4X4aa3y6xA3VsxRq0isHA2EFkwk6Ncj3tbEnXtiPUxjUvvgNQ?=
 =?us-ascii?Q?fyym4MRp/iHo+kyCMlBIsBTZKOsvTfiEXNcQQxtbNwtucCAlwochv8CNTVv5?=
 =?us-ascii?Q?jiBDPOdSlAMwLokGF9SnBFBsETAQlkVZUpv9eyX8fUGAgrquXb8FNaLidGjD?=
 =?us-ascii?Q?64xTw+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eZviv5sY6+HnyMpOQ+fV7APlNZ0eQT4JWKIu0j/NLw5ctRUXgbhXr4ln5x8q?=
 =?us-ascii?Q?N3G2Cnut5aN3ftwlnijKsiuRGjmrnfyNcn2aJWZ4N10U4FnIIcHNJrPNNVDZ?=
 =?us-ascii?Q?259ZU/exmVBrKHwo3GmNgPVLMPnaV2ArNicPwaedgVhZ0N2knlcbvYyjgFZU?=
 =?us-ascii?Q?Yb2Nk3fAhwT/njnLdaOJhig/r69HEuc8T9d2NC9nHEcHQbo27XabTVXz93r2?=
 =?us-ascii?Q?YcxRMENNa/HCnx/vz7WG2S+ZPTh6lGn8ivCL6NZmrBgmTM2naCxcnj/DgUMq?=
 =?us-ascii?Q?DMdHSPf+A9pFRHCjEpmnpZbu5XrdZLbMyuI6rORxMK/P/gaCQxKdNP+KwOk/?=
 =?us-ascii?Q?DylUC5pHoLpDwnHmkSk7uctlmM2RjwXWesDhSvtvnrqoHXBcgNX/dnITx2Z4?=
 =?us-ascii?Q?FVG9sNLuJh3pS78dFlgo39E/yx6DEhgAbEtNnqWloJt6Z/wciFTeP0vvg/sz?=
 =?us-ascii?Q?/aalmyR+MC2Iz6VlITxj+FTfTZrILkNgMl+FOsBX8+oO9c/jYkoZaEBxVuxt?=
 =?us-ascii?Q?ok+9qXd9piFsY1GhTWpaN7Bg37agpKIX4QZpKbtK7uX6QqeIzl3fLXoBvT7O?=
 =?us-ascii?Q?6Le8ja88G314T5ykHiWzMr1/89yVm1C38XDprrggMu6f0T5nwQILUaeveRnj?=
 =?us-ascii?Q?PuUyQV7Wo7WZAeFEapWFc2eKfq/Ozp7CZEX2wJR9RymU70Tt9TRte0HRj3kH?=
 =?us-ascii?Q?aNfkSx/k1De30JA4qBSh9l11+B7w4TuH5Ra4axRahgzWYZ+efJz7nJC4Ix4Z?=
 =?us-ascii?Q?ylS2tH3QStDqLi0ON2ygRLKm3P7Iq/JvLpECmZbZH3klpJ8AWfxylvGRh/8m?=
 =?us-ascii?Q?9hCEgMaNTAb5fdZ6RL8kVlK6KSw9xI5b5NTISjzn6tyQ1ZXVGjaxrB11Eo3U?=
 =?us-ascii?Q?P99XJVpQeqMDdrhkP0veAjt1ljikkpNnfL9Zwgvio3bNuWy59w4QL076PGUQ?=
 =?us-ascii?Q?Ul4AiSYu4MV16S6XjSNWE9xqrrROghTkJyK18zm74Kke+Mku2Ijtu16azd9n?=
 =?us-ascii?Q?2j3UElpnnU5t8GXreuG01Iyvb69Cu4+1RmViX+kTZfZplNhi9bOb7kPnJP+m?=
 =?us-ascii?Q?DWpwcQNHGMDBxAcQJYyavJpVSJ0rXJbDtYxod2ihoU9mqVP1FBeztoBiLxHy?=
 =?us-ascii?Q?D6m7nHiE8QrGAZkPCskwPzWVo12p6z5kSYA57FN08YDVwrxiNT9zR/3vROvT?=
 =?us-ascii?Q?Lz+nl4wGzxNCBccjb1XUvTOOGNOVTD7+2T0cBhFWHptiqDOE9+Lrk33zTpQr?=
 =?us-ascii?Q?OZriOuwm9onEtroUwkpvRGVJNRSqvOinEyApWACfbaellSMut1gJ5e5PQmbq?=
 =?us-ascii?Q?akdRDAC3Af9AqzzDboTqJIDKe3ob/D/05uWFNGPO3mD2h24l4ihFlm6F8SFc?=
 =?us-ascii?Q?+3HeZeUQSWshIR+xXOMEBJY/hAALWt2qYdRczeAsHLD/zuturCIs4bCzZotM?=
 =?us-ascii?Q?eOUrsd2Ay6r4uyxH9EsL37vvJEt5xucOeUooLxWKt8nzOFRraWGlTnAevXtY?=
 =?us-ascii?Q?0kFZO6nFl9v1aSdpaOaU4Cn9BGDoBRXB5Yw3cB00D2gq8NmRjH5IZWE87r4/?=
 =?us-ascii?Q?NbgEWXzWKXUMU06UXfJZSTlzoPfzLrnyuMLErX8Y?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7069de40-4faa-4ad7-c3b6-08dc945563cd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:56:04.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96uq2pMVvyy40T4cnnOrVVrw99yfirSn+lb6ffUk2P/NzkR4rgz/awiuW2+ZxuEkFRwGVexniENV/uuLEVu5zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7515
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting dentry block or dir entry.
 print_raw_dentry_info()
 is added to show values of node footer. The meanings of options are: * dent:
 means dentry is injected. The members could be injected in cp contains: *
 d_bitmap: dentry block d_bitmap of nid * d_hash: dentry hash * d_ino: dentry
 ino * d_ftype: dentry ftype 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.78 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.78 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.78 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.255.78 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkgN-0004fL-Bf
Subject: [f2fs-dev] [RFC PATCH 09/10] inject.f2fs: add dentry injection
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

This patch enables injecting dentry block or dir entry.
print_raw_dentry_info() is added to show values of node footer.

The meanings of options are:
 * dent: means dentry is injected.

The members could be injected in cp contains:
 * d_bitmap: dentry block d_bitmap of nid
 * d_hash: dentry hash
 * d_ino: dentry ino
 * d_ftype: dentry ftype

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 149 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 20ae87c..3d26b25 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -74,6 +74,17 @@ static void print_node_footer_info(struct node_footer *footer)
 	DISP_u32(footer, next_blkaddr);
 }
 
+static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(dentry, hash_code);
+	DISP_u32(dentry, ino);
+	DISP_u16(dentry, name_len);
+	DISP_u8(dentry, file_type);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -92,6 +103,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -186,6 +198,16 @@ static void inject_node_usage(void)
 	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
 }
 
+static void inject_dent_usage(void)
+{
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
+	MSG(0, "  d_hash: inject dentry hash\n");
+	MSG(0, "  d_ino: inject dentry ino\n");
+	MSG(0, "  d_ftype: inject dentry ftype\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -205,6 +227,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
+		{"dent", no_argument, 0, 14},
 		{0, 0, 0, 0}
 	};
 
@@ -280,6 +303,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->node = true;
 			MSG(0, "Info: inject node\n");
 			break;
+		case 14:
+			opt->dent = true;
+			MSG(0, "Info: inject dentry\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -309,6 +336,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->node) {
 				inject_node_usage();
 				exit(0);
+			} else if (opt->dent) {
+				inject_dent_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -879,6 +909,122 @@ out:
 	return ret;
 }
 
+static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct node_info ni;
+	struct f2fs_node *node_blk = NULL;
+	struct f2fs_inode *inode;
+	struct f2fs_dentry_ptr d;
+	void *inline_dentry;
+	struct f2fs_dentry_block *dent_blk = NULL;
+	block_t addr = 0;
+	void *buf = NULL;
+	int ofs;
+	int i, slot;
+	struct f2fs_dir_entry *dent = NULL;
+	nid_t pino;
+	int ret;
+
+	node_blk = malloc(F2FS_BLKSIZE);
+	ASSERT(node_blk != NULL);
+
+	/* child */
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	inode = &node_blk->i;
+	pino = le32_to_cpu(inode->i_pino);
+
+	/* parent */
+	get_node_info(sbi, pino, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	inode = &node_blk->i;
+
+	/* locate dentry */
+	ofs = get_extra_isize(node_blk);
+	if (inode->i_inline & F2FS_INLINE_DENTRY) {
+		inline_dentry = inline_data_addr(node_blk);
+		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
+		addr = ni.blk_addr;
+		buf = node_blk;
+
+		for (slot = 0; slot < d.max; slot++) {
+			dent = &d.dentry[slot];
+			if (dent->ino == opt->nid && dent->hash_code != 0)
+				break;
+			dent = NULL;
+		}
+	} else {
+		dent_blk = malloc(F2FS_BLKSIZE);
+		ASSERT(dent_blk != NULL);
+
+		for (i = ofs; i < DEF_ADDRS_PER_INODE; i++) {
+			addr = le32_to_cpu(inode->i_addr[i]);
+			if (addr == NULL_ADDR || addr == COMPRESS_ADDR || addr == NEW_ADDR)
+				continue;
+
+			ret = dev_read_block(dent_blk, addr);
+			ASSERT(ret >= 0);
+
+			make_dentry_ptr(&d, node_blk, dent_blk, 1);
+			buf = dent_blk;
+			for (slot = 0; slot < d.max; slot++) {
+				dent = &d.dentry[slot];
+				if (dent->ino == opt->nid && dent->hash_code != 0)
+					break;
+				dent = NULL;
+			}
+			if (dent != NULL)
+				break;
+		}
+	}
+
+	if (dent == NULL) {
+		ERR_MSG("dentry of ino %u not found\n", opt->nid);
+		ret = -ENOENT;
+		goto out;
+	}
+
+	if (!strcmp(opt->mb, "d_bitmap")) {
+		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
+		    opt->nid);
+		test_and_clear_bit_le(slot, d.bitmap);
+	} else if (!strcmp(opt->mb, "d_hash")) {
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    (u32)opt->val);
+		dent->hash_code = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "d_ino")) {
+		MSG(0, "Info: inject dentry d_ino of nid %u: "
+		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
+		    (nid_t)opt->val);
+		dent->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "d_ftype")) {
+		MSG(0, "Info: inject dentry d_type of nid %u: "
+		    "%d -> %d\n", opt->nid, dent->file_type,
+		    (u8)opt->val);
+		dent->file_type = (u8)opt->val;
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_raw_dentry_info(dent);
+
+	if (inode->i_inline & F2FS_INLINE_DENTRY)
+		ret = update_inode(sbi, buf, &addr);
+	else
+		ret = update_block(sbi, buf, &addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	free(dent_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -896,6 +1042,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_ssa(sbi, opt);
 	else if (opt->node)
 		ret = inject_node(sbi, opt);
+	else if (opt->dent)
+		ret = inject_dentry(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 9b14c31..43c21b5 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -32,6 +32,7 @@ struct inject_option {
 	int sit;		/* which sit pack */
 	bool ssa;
 	bool node;
+	bool dent;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
