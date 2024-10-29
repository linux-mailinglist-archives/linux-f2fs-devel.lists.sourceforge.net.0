Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9E9B4940
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4m-0002aR-PB;
	Tue, 29 Oct 2024 12:11:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4k-0002a4-Op
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xq4pN+uvzWSi8xNo4irA6tLUxKSWf/glYr/mQAEgsVs=; b=CI1fBPpokTuNhXS5A08vzjtiEo
 9IWP3wBlI6mtskF9RzX7yu1spNCTPuYXjPxvzaIKjn4PIcjWfP8qA1+qwNJelNxNuBFNN+7YlTqGy
 W23buBVWKA6LhIXrrJbRwhsvwlbSNueC52rHvU1cfC3zlXedLJIS8KYKvi0x2F5FaH1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xq4pN+uvzWSi8xNo4irA6tLUxKSWf/glYr/mQAEgsVs=; b=FD93fiuGL+8te/uExRlPzspG3k
 8sY1b9EtNzUwsnn1BpjIhZPVcP3532CzmvQFgcCUjRATZd0QoFwNpyRmi83G1JlQ/oyNKnKXgZEJ5
 Xq03z+KydX38IBWjRJ45aLxLfRNMtrv7ziqEgrVruex3qiLGr1Pc6olXT5i0jTQ5cEfE=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4k-0007R0-1F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eo8kNqwtsp8rCCCS/p8HjMZKpiqzlX79Yifll8roOi9UxTK+2fORLDNngKsNBA6zL4eFb37v3PCyPMTvuh8CKQRmRoDsS6qPwtI2GTg/a6aXdvVVSGGc+q1worceNou0HzMwHNLBdVoGNDcsPbw6FRAZ0YlUwAl0ifhI1kWNDj2+N1QS/lLq9LFD1rwf7Owefx/SWZB3VRSq85PnPmb+My63DxTk7MLC6BYciexY8q79fvub/J22DeuNbKROQCk3Uq0TdaMvl9TczevNGbgesOwTcz1FZr37rZ43KObsnNw1ILEotxDvkWzqy+1kt8DSKFfgPIaRt7Ny8pFEqDh7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq4pN+uvzWSi8xNo4irA6tLUxKSWf/glYr/mQAEgsVs=;
 b=kLAx/PR2mM+GqHA6fO6fDRUJSkmMqVJIKeSDjGdVbWWdi7bGAUikTsKeC2AG+Oy5Hyx7nDBSinILbdf0in/EXiwt8JJ47Qq7tfbPvzychzII9fDhgyR2Ce6WXk2k7/pBZbvhN5Jfz8eXFOpeB4HVxGudgtNx7gHmQ77EIcy4Z4IpdULQ4hsKiXb4VH40A4FLMHNikluu2Sa/MoTbaRFj57RSlBNHFZB8s1ZJ/kDBbRaxna9igagFpepO6VBmk1GzCxtK5gUvLOZfcoLIdxTWhhHhIxtd/vjVotjjKKxIOIgP6ZFSPlEcRalRVC7ycEZgtTpZodgbF3hT2eMxUjXiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq4pN+uvzWSi8xNo4irA6tLUxKSWf/glYr/mQAEgsVs=;
 b=NNY3W+w7WrScwk1kOFwfO00a0e0YCE8o1WZb9r7UbAhTDozupmJ8LsjTr6Zk6eiY4HI5pgBnWSkFMrARWQAa7T5vMAhasMNUzL9zqTxdOKRmp5TTpf1nB2vdvsaSF7PMBrdnDuFhA29tBSzxNBm+ULmafjLuGNY50iuabCedTnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:39 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:39 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:42 +0800
Message-Id: <20241029120956.4186731-11-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c1033c-a08e-4e2b-71b1-08dcf812d7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IbuKO0kDlY+yXIZmg8n1f4IMBUlQYQQY8H/1o76OdIfyRoIjjhTWL7HDVa9X?=
 =?us-ascii?Q?bn8aH2vKqddX0c9JEyOkdtgonryK9mNeyhE9JniVFkny+k848r09bUNFEIsi?=
 =?us-ascii?Q?E1HLH5BxcZ9bBndwT3WG7j+LjDNB0P9sDmbu+5XFiAxlZ3Y38AlDC9YKEZ50?=
 =?us-ascii?Q?cdqPGO2zo/q68NWoVEFRzdBsAWxrfeRgIYlMIMqnipC27+QQJVe4/68dHgJd?=
 =?us-ascii?Q?1vOMu42OCZ41B9jc3CwfRq5RGm7xEkUeQuc8U8qsvcqxfrvVTlb7WbiUpTKS?=
 =?us-ascii?Q?H19KxgQsw6GUWkOJ+Fy2eRLrh93MPPulukbiUqpFcXdnAYddGa3zy1RFiLp0?=
 =?us-ascii?Q?ydi4+NhlVU8WiMRCbOZz3iP8lTbwjxDH6PZ6h6yIPmDsijHPjHAmDLo1qe3k?=
 =?us-ascii?Q?K97fsodmpizKMIX4mZ1u4/ygtCS9nhVqejBIFhM2/t85OCMAVMPK3WqZg9Vh?=
 =?us-ascii?Q?dBodZqN4toU1CmF/lSCBHPjqtD/ppfwHhtEBuYuRerKjxIoPNNQG7Ko689hE?=
 =?us-ascii?Q?viv05yrcaJPoSJDirLGAWrg+FzPvNcYvxN+CmM0mMsZAFQjiKDr4jS+HsVvJ?=
 =?us-ascii?Q?UvSvCbKpzgRE1kALbmBzGksh4TjRit5mEwLXR9bFc2ZNmXUsCY8deNR1LXfu?=
 =?us-ascii?Q?IESWnbPszXXo29iRnJ5CfKpAmLSv4HzNlCKjmIfDbIuwp7SGkIk03Q58xLxL?=
 =?us-ascii?Q?5vCxCjunvLKmap2PaV14iUjyjgmYkOAKjrhaiMtF+IAf+4S8Tdtx6Hik1kql?=
 =?us-ascii?Q?ow6UE0W8ok2bSB7oDdhJiFfxp6AtNT5ptlZtYSloRTcnb9MfoVgdOK+ovD11?=
 =?us-ascii?Q?Be/vxkoH3De0xHaKl1ADbmtXHectdMdAwsFSEVCZAYT/njvikx0g/fAHb/l8?=
 =?us-ascii?Q?+p+HioZaDpvEemExPTxxk9EfggC9mFixeKJviWevL+zWrvLPGLH84awhr7J9?=
 =?us-ascii?Q?dq+IzUIvbB+1goZgglJFbods1T6lQLZRZKLJYtHxQik0atLQaBI5h3Vq651k?=
 =?us-ascii?Q?Y4zyL8/vvHRmMwL2x+4tJ8Yz3iOONainF0L9g+EBfBn14f87bXyuWb2fiHG1?=
 =?us-ascii?Q?bj5HIwKwInfowOjGac36Twc3rT5VQ/oUcLPMQkbOWVTuTsNIwfzJNNEHlY6j?=
 =?us-ascii?Q?CKvPFarrpy08CgoUN1kQ+WGTbUqACa7PEAYqnxRvgPCK0spy+30/zZueNXXb?=
 =?us-ascii?Q?a/D7Rt2QiLMFLKIJcbo8xmK3ITlbnsMDgyRS0TwW3On/2Ip8NDzCEyxO/7+I?=
 =?us-ascii?Q?aO4TRFY/yYbhDj+ZvO1r7N5uhc5g0ZSwtCdtaRkMU75/gHyRRE8Z+qyBjo7N?=
 =?us-ascii?Q?HB2/bdTqdeLN8eRyU1abegi5jiHV7Sa2IeZboC9SP+uEf6FzL3SbYBAZgu1m?=
 =?us-ascii?Q?0Gp+Ehg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jlPSYSuJ+2M19PoEbg0ypkdNxZ/jjyuQyAzps3J8LitZ1yF/wkmJH2nYh1vH?=
 =?us-ascii?Q?m3lqKvXOckVXyC23cgk2sHCmZN6FPKlcfArIHxbJN1GU+uykbXQ8xdTZPjQ3?=
 =?us-ascii?Q?1mPS6/p4N/UXSawGBmZpWoiKewqAx8A/MmEaEEamryv197zhM3k6aGiRtskW?=
 =?us-ascii?Q?Uvai0UfXxBiTu3s4XniTqFO1GMhlq5Zh1YxnyFGZTrg+SOciEPY+ouQcLbDH?=
 =?us-ascii?Q?djpTw2agEmspql3MGQ7LlDkjRiYquiODcoCBn+lB8uFLwUBCXiedz8K4eSqG?=
 =?us-ascii?Q?S9WwqeuaCai+ds82MG2M0M/21Sh8ciEJFXTtdmtW5JizdPljm7WnU6ca/by1?=
 =?us-ascii?Q?V5eZgsRPeObrITyGsUjh7e1gZL8oQx/1djtFKGpTg4n+yVLd0gLAFbu3d029?=
 =?us-ascii?Q?fdmZCR/P5uGP8CBiP/oGJLeyMe1JaY63P9AVVlnGoBtjktUiwuMfm+tv4idk?=
 =?us-ascii?Q?GqLZ+RiTDLjteU4e9MbiO0ZkhvKo6//QJyxzMt/uNi7Be7qI73ecZUiXhP38?=
 =?us-ascii?Q?lzqZpzBknYQDb2YbhbnUlEUy2w/oX9qsQDUHZ0EvvORbeYsRDozTM00lkNyW?=
 =?us-ascii?Q?R60T8MVdufGNWObK0eHRD8FqjXFGit8+2dCCdSDQ1nvVNpMjr+HJUByKiFdW?=
 =?us-ascii?Q?5DmJWu/NtWe+kNDIN5QPBEZA8GE6G7+iLalphMOztAeBINMYiJQ8C/+zNo3Q?=
 =?us-ascii?Q?v7LAfE+u2lOX4nmbVBMpkyUntD+seaXva/rflEtrcXrgBSu6tUA6UAB5NZKe?=
 =?us-ascii?Q?W5V1jhcRrTFcdYIAYLBRgunkkznmcQ7pp7vGttBjXJ+m1lU3IpEx9cFGa5mm?=
 =?us-ascii?Q?l/DW77zdyGQM4/ZpjjSG5JOKUaZg42ntJJ/Y1ZWq4iFrBvJTOzP/Rzu9Om6V?=
 =?us-ascii?Q?WBII8bMG9jHc+G+LlnJcE9iWxzFqvd7LWiVwW7n3TminYePr+p64d+85M+ij?=
 =?us-ascii?Q?xZxuD9curutC49+jlBr6mmo25y0utgCGdTpgVy1DAHEmMgIFggLBkBqY1+1Q?=
 =?us-ascii?Q?JjigOBktn+Q2yEZqgdLftRWIsNHEGxJvutNqwNZihTNCzIwKJ4z/nL2xNi5U?=
 =?us-ascii?Q?6h1oMSC84oK3cyan3r676PFdn2fMrtqonjE9ttXWzgXAdMJN82q6lrEljUAO?=
 =?us-ascii?Q?LqnX034ZK9W3pDLmjc+oQretDe8OHtJ5YiVQj0zn+uAMmjjuenNLn0Pn/mYT?=
 =?us-ascii?Q?H9zkrO1tDD5JS+2fVOeKuyHzefK7VYKYeFTdqUpFyu4zC1XIPX42Z76/fei0?=
 =?us-ascii?Q?GKCcqFp7sFBzUeEfKEjv6DdOJm8gL1ej/2bZz/nVkYEAcFvR7OOpoULhxeWM?=
 =?us-ascii?Q?Gk8FCdnt6PdP1nDRnV91BOUB7CciIjHu33LoESkzWahFuCDpcCyt+hctNVbx?=
 =?us-ascii?Q?lrMwL7OR4MeEsGfv6JIqDL6K2ml+wHwQDVqqxhxDOm4MBmWK3PLl5ZoB3nEr?=
 =?us-ascii?Q?dtgIRXYfM9yGQVKSZVo0rg3P1OXzIMWFvNouLdC9e9KCxQQkm6/9q/IJbrzz?=
 =?us-ascii?Q?oW4S3VMO4b+6qT621sQXABHf9KqHg3Y/HfAGkPxxWtk7XfKi6kVVElWNVHSF?=
 =?us-ascii?Q?1li+FYx2SbikltsTJVMNwLmPHBzKmjLaDdhoip4j?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c1033c-a08e-4e2b-71b1-08dcf812d7d8
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:39.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCSbTV4bHUy5Y6CEw9mKmNK7niEWzAeXwkThj22iNQrySZfU6b/fO0SRKJpZN+A2TpPwsO2dEqH1eprYbFidnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_sb_errors/README
 | 5 ++++ tests/f_sb_errors/expect.in | 59
 +++++++++++++++++++++++++++++++++++++
 tests/f_sb_errors/script | 23 ++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4k-0007R0-1F
Subject: [f2fs-dev] [RFC PATCH 10/24] tests: add fsck testcase of fixing
 errors recorded in sb
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_sb_errors/README    |  5 ++++
 tests/f_sb_errors/expect.in | 59 +++++++++++++++++++++++++++++++++++++
 tests/f_sb_errors/script    | 23 +++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 tests/f_sb_errors/README
 create mode 100644 tests/f_sb_errors/expect.in
 create mode 100644 tests/f_sb_errors/script

diff --git a/tests/f_sb_errors/README b/tests/f_sb_errors/README
new file mode 100644
index 000000000000..df118e825aac
--- /dev/null
+++ b/tests/f_sb_errors/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. inject s_stop_reason in super block
+3. fsck -a detects error and clear the error
+4. inject s_errors in super block
+5. fsck -a detects error and clear the error
diff --git a/tests/f_sb_errors/expect.in b/tests/f_sb_errors/expect.in
new file mode 100644
index 000000000000..ea93e95c8192
--- /dev/null
+++ b/tests/f_sb_errors/expect.in
@@ -0,0 +1,59 @@
+Info: Automatic fix mode enabled.
+Info: checkpoint stop reason: fault_inject(1) 
+Info: Write valid nat_bits in checkpoint
+Info: checkpoint state = x :  nat_bits compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+[update_superblock: x] Info: Done to update superblock
+
+Info: Automatic fix mode enabled.
+Info: fs errors: fail_decompression 
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+[update_superblock: x] Info: Done to update superblock
+
+Info: Automatic fix mode enabled.
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+Info: No error was reported
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_sb_errors/script b/tests/f_sb_errors/script
new file mode 100644
index 000000000000..664e4f6f49fc
--- /dev/null
+++ b/tests/f_sb_errors/script
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+DESC="superblock[1] with s_stop_reason and s_errors"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+$INJECT --sb 1 --mb s_stop_reason --idx 1 --val 1 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -a $META > $OUT 2>&1
+
+$INJECT --sb 1 --mb s_errors --idx 0 --val 2 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -a $META >> $OUT 2>&1
+
+# both -a and -f cannot detect errors
+$FSCK $FSCK_OPTS -a $META >> $OUT 2>&1
+echo "" >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
