Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 548336E0B46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 12:17:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmu1E-0004fF-Sr;
	Thu, 13 Apr 2023 10:17:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1pmu1E-0004f8-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1n+7wl6xIVBWWUp/3w4OHwmry+/ILPdgrLrQPRTU8/g=; b=X3QswHT2sL4+b6cW7zXtIJHYNc
 aXiL+YRivhx2WB0EmeIFCKdtMoxxX3fWKQ/vqsj7+KpCYFEbgjdov2w0yoowX6HFBQXNJiPWan9kD
 cOabRvVLMiF5PTtvbYcG9fuXV1lQeC7/Bel2Vu5t78LHPYMcR51TmgGzmrbkREsqVJl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1n+7wl6xIVBWWUp/3w4OHwmry+/ILPdgrLrQPRTU8/g=; b=S
 OnPjaedhx9Upj+5IaXY2NMQbYNpdUmaCq+p52b/SUoEyP/0f10NWgWMZP46QweukO1LVd2bESj/um
 dM0kWK5779NEDeZLWKY6ywy3p0zTqp/6S65k6uFYeDVpetclOXSwjP8QinonCbEe/3kgWFsmMvCro
 FP7W/4RGeBiwqFSk=;
Received: from mail-psaapc01on2108.outbound.protection.outlook.com
 ([40.107.255.108] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmu1C-00026M-3B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 10:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WayzWY1q3hmdLED0RI9iur+9rmYtL12UBj4ll7ukyLTRz1CdQeQSbtUvfnVuxKa6PZocJO98OqjDYyXSjmYt9hnTrOCLAnGf5jARbyaZVx46IxqurBc4/BQk1yBjFU/tPR+WKgs4RvzD/s/hmJXcL6LyezRRnZjLAKdWzyRzVbNKz0jljgrT292bqB1cSyMBX+RvisFfu0jNspfjX/IpPMEXL1UxrJOmi8tOg+fo1uDDonbe50I0Txhn6jgot2kod32777HwsEiRHZkqR3f0yqnX8Dgk+9M+dEuqXwydJB68CcH8WBgIQqxuCGbJXt0SKryODe1koI8g+taR5/Zz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n+7wl6xIVBWWUp/3w4OHwmry+/ILPdgrLrQPRTU8/g=;
 b=i8O6erv0aEkbHhWEuQ81dBuv6Mg2dp9Lk/gTVZGWsIQeKtUhOSOrWa8AM8LuuoVmemhgyw0dRlJRKZaxC3IRheqigZMBTBZtW6dSurgqWVF0B316YXEtR79L2piflVt5TxNkLdmQfc/GPJpvWF9tkvyCqnJxtlPXk3LrjYfVeUjF+Qrk9mDufRHftadgTXy7+BfVmqfUNTxufm4DDLByIkLcc3Xt7CRApTrqkXfa5SZXgw7JaZamhkCLMWIPAx0X3iwMa7opzakhg9iRIHllkcXP9QoraTRdvqkt3rCXcskHtg8hHg8PNIFNZyuacM+UD6EdZiYh5u21rCyWiUYGdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n+7wl6xIVBWWUp/3w4OHwmry+/ILPdgrLrQPRTU8/g=;
 b=RCgtj1aPuh6kfVGX3gCktGV0X/vR4wFAXPDBtvogZ0CXgndJudbOj2yw8dy5oERbnV9cbvxICbZY3hIuBWVzpdUjcZfcOnQfGNGQ4i1xLJ2l62xNP1qRbpAd8jfoHbUZTVRbDLLo/lhriaC8bcc+VOiSNbccRB6f2MI1Xbl7V4/VxujwAjRCl+SqbDNB0Cmw7VjmGbWF4Q0+2pYu/fafnoTSQfyK0RizjIcTlb794jjLJICZntl7QLkLnkrGRIVFln2L8rGE+my6h/5rWYpzmjhxwXKVkxeTVkumGt8ekS3NDBj7n+hp5Go7I4VfNm8cwzF2T6uFuk2WV0htdYWLeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by KL1PR0601MB4227.apcprd06.prod.outlook.com (2603:1096:820:65::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:17:21 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:17:21 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 13 Apr 2023 18:17:11 +0800
Message-Id: <20230413101711.13682-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|KL1PR0601MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de269f7-7c57-420b-bc07-08db3c0844aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZhnYSEjzrSCm77LYohTB9d3kpG+oqt+3xBr1CQfiPIYlw1QdLG3QdVVy0cwoFAHtsgUHLSIswA9mttbl4BBjgtnSfw5Rvsp7Hon5EswllzXgmIsevLKEqHGIXaVfNaTqX16gERYnk1olOnJweDt2iEKwdZQiq7tT+pdN0zOOk5Lry/YN0mrq6vK2zhytS2SN7NJYHBdh36IU681wH3KX8f/28V2HZvsJs6zOyce5SPF5mfa2dWCIOES8P3QJiVISPOzDiIDrmGXX3oLOL8aiuPZ9lHj/cNCMdGoxrTDX9TMgpctr8egJ/QbgiSEViv2LIi/kevZJWRNe5+gFtfKkkk9KGaIMYbeEV5Do57cbZrchfwsIJejjFQ6wU6R/v1yJQO1qzcUgPwDnBpiB1Ip+u7xN2iVD7lCz81uveLtFCjRnjGqMQUxKxHXFs/Dqa2Xw0Mhv8TbH2/anwkmK2wFulDL035CIZ6FLhwS3BaI9hoVvmvxme2XDV6D6cgOkCAoFozAO7K/XB+nH1hW1R9pbG0TvJH56/dfPov1r+Sf6QO8unVrE8RD+c/3I5fwItU1XrjCPvmVzGCQYeIPVY8GZzqTTLBfWoQ4H7SNsJTXGmwZJx2/Zme1vAMqJDoZkIDa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(66476007)(86362001)(2906002)(4326008)(66946007)(316002)(66556008)(38350700002)(4744005)(8676002)(2616005)(8936002)(41300700001)(38100700002)(110136005)(5660300002)(1076003)(6506007)(6512007)(26005)(186003)(36756003)(478600001)(107886003)(6486002)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Nu72j6yoWGNmm5vJBTbRWdClb3sT9HOtRDMWP4S9F5WbKXB01qWqYHmlorB?=
 =?us-ascii?Q?/S1eTc3zKAmDl7CW3cYZReIafZpbwIAckfPRG9E5G96QyLge0K4nIAqRoc0y?=
 =?us-ascii?Q?GCTM/FrLxSAw8fuA274e/WmMvbiFFsnJXrnrR/jG9LLxyy1bOweGF6TXn9tW?=
 =?us-ascii?Q?a8Hl8bmUWHY3Ejhjs7bJLKpCQA0QSE4b1JAAwvRMpOkDDGuYtWmGsOYdDqgs?=
 =?us-ascii?Q?mQRCSYuYPrlnc5Ct+AWu82iMaqD+6Sw7UmNgt+sGIt+hf0XdiTzdrthhrhbU?=
 =?us-ascii?Q?IdIg0S8WJCNJ01aUDp+9qq+9dgdOQyfEMbo0pIiTwhVC5QKgxB9/q7b9LUCe?=
 =?us-ascii?Q?oXs5Y8XI6o2HnpI+NpOYQtjD8IHL7r8yOl7r/nptueSyIHO4RNksaO6rp842?=
 =?us-ascii?Q?48lqTewAcvhTymKxkAnLRJOR/BiDwKiVnt1Th5qj+aVV2mfjiT/SEkMaPy/u?=
 =?us-ascii?Q?1byQwY4dNjblTjy6A4oo+NDRKZQItpU4byQMDy9NfgKuL1QwwmOYniMu8Wlg?=
 =?us-ascii?Q?1bBIEfcb3Ydf7qxhHQ+T2VIfFb3sxrtM6/Wdux5B2GT27m+mCu4dxJijMiLV?=
 =?us-ascii?Q?adP07d4QIBqMh6v8MP7Q+QM71chAy2XnjOVSqsyQ/7jUp1VPSZmNLMSosJQz?=
 =?us-ascii?Q?ONb1K2XyYM3NIwQuAJ1R8KDUxPC/XiH1a7Cr2JqtDf8bsAX+9rCvE5VL7k7n?=
 =?us-ascii?Q?WmjeOahFQSWYWdTEI3pBsbAfmBzJrl8/OZsEK8rGrCx73qaR8MReUGG4jW02?=
 =?us-ascii?Q?XQISZGC8aVIbfLT4GJpCaKHuidB4y1ebQpf8SRZWL50JhjvuPj29fi5ggBj/?=
 =?us-ascii?Q?I5ljPrFYc2HoZ526+F65oJgciqjhvqEb1P/KFkQ8VBEOTSMmk0+0QPg/TCIq?=
 =?us-ascii?Q?Zb0+hIUolO9YQLOchgnLG0OEUz1k7yzwlkD03XkUi9pYbxMf3Opnxq9Aifz7?=
 =?us-ascii?Q?Xwv4jFbXr6kRi66bZH9aHSOJlK/oEUQKm9xOs1Ei8pBu3nfFtuuAmTw8bwQe?=
 =?us-ascii?Q?8e0cu2uLQlDq9MSNTw6bXN+kVvIahDut2+Pk9U9uCS8ZOuNKXHYWCmYpdIih?=
 =?us-ascii?Q?GwkvUf/+yBISebDbHGxk9w54/fs7S3LZp3yPinX6SlftX7T4i3CbUvySB0Cs?=
 =?us-ascii?Q?Z3cxkIQiUFy95GaK7h9Z1Peg6qDA8yaM1LuC4cAuAl6dIJtfi6ukDMUS+3H7?=
 =?us-ascii?Q?xNduPECuvjlCclN0ouPRGhCMM77fvOivO+E+ObQtWDVYzZNh8hniBeDKsbmX?=
 =?us-ascii?Q?t43GT7UhiwkysjMiRStMyeVOM9P6GUrPFZpeysXdDw9yTnxk3kV7Ysuxn6ff?=
 =?us-ascii?Q?DtfTEJt3p1n162kBqW8c3WYD08vXJzfmoSRWKax6xXkCQViQNheqX7RcoMTs?=
 =?us-ascii?Q?HOoiey2HcAF/dQ9DL2qnBB1D/utUs8oCZKka5/zYv5Cp+b22pq/7dijW/n2x?=
 =?us-ascii?Q?faKvRUoKPLrXddeYV34l85Dx2c4w1NLYWbEeuKrE2p9H8KqWhSi63diRpjsq?=
 =?us-ascii?Q?ItrEF/meF9dXS43CnJazSoozvb44uSKh/UAPSGocBVB3uOTU6HyO1mI+EwAd?=
 =?us-ascii?Q?vKA/klNJAoIqOI05tUnCzBWfu3FCgTk8ErklOGfW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de269f7-7c57-420b-bc07-08db3c0844aa
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:17:21.5697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC7DHiViDEhn5S8i75nqFdD813GjeFQThR3MafGXkrS8LCcLolZgjpkgVWjcshM3c62DFX1okLeVRBiUJ1DOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4227
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Wire up the iopoll method to the common implementation. As
 f2fs use common dio infrastructure: commit a1e09b03e6f5 ("f2fs: use iomap
 for direct I/O") Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/file.c
 | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.108 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.108 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pmu1C-00026M-3B
Subject: [f2fs-dev] [PATCH 1/1] f2fs: support iopoll method
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wire up the iopoll method to the common implementation.
As f2fs use common dio infrastructure:
commit a1e09b03e6f5 ("f2fs: use iomap for direct I/O")

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15dabeac4690..ced796ef615b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4879,6 +4879,7 @@ const struct file_operations f2fs_file_operations = {
 	.llseek		= f2fs_llseek,
 	.read_iter	= f2fs_file_read_iter,
 	.write_iter	= f2fs_file_write_iter,
+	.iopoll		= iocb_bio_iopoll,
 	.open		= f2fs_file_open,
 	.release	= f2fs_release_file,
 	.mmap		= f2fs_file_mmap,
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
