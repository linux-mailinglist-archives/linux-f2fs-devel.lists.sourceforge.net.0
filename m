Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B179748CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGY-0005iM-8c;
	Wed, 11 Sep 2024 03:43:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGU-0005iD-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iawt2//ESGXq45KJYLKbV05HdYnfgHs31un0npuP4rM=; b=NvGy7DdCDNli/2chwTyq7y1x68
 PVI5iURhV28gNwJ8P1+7hlOwFqV5ZAHG9Xp7YhxI5DDTka0bGaa6QGOB1O34cWEnf5zxQ9LfOeHdw
 1QfItZ9389ZRF2CxWztZ5l6rzESVyJrMiZjzWOHqGucdFKTjf9QtidxGHp5tTfPdDjes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Iawt2//ESGXq45KJYLKbV05HdYnfgHs31un0npuP4rM=; b=l
 EaRW0vzQBeErESMGtxPX0tqb76VYnVtS9e03hCkdwM0aYCkShybE7SrE3Av5kzPC28wl41jsLY8hS
 GMpx9q0Nk+rsCpLVdHuVtmdbQW1gBWqsv/tS8XkZDvqXVt9rH24iPN68tUc3Gq068wiL02Pw7tfbC
 J5MWykQ/3iUKdThY=;
Received: from mail-tyzapc01on2058.outbound.protection.outlook.com
 ([40.107.117.58] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGS-0000Nd-9p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzgwJQwpgyPtjIg3ZPNXE/Ur7W+beb7hN/1UpREGqFsfVQ0MEVLCdRhwhS8DO0+g40ZaRS/nfIn6dVbsTQorxaYUyAeJL2uTKWe498MZeB+fdVuTqGglKYDGOR98Efo3UtsjmwExNw5LYrBxXSnMHa+Rk0V9gCNH/yGPyPlF/xoQ9u8wPwFcFGG2FaLhmeODWfL1W6Fu4tV/rHpPzbEN8BbovblZeg/q6NOJZX6rAWXaAQ14ThC0jcz+U7ZtREFs5WRtwuwO1YvWhc5k9a1ppmdv5FUmeJJ7lhYLonG6bs+CTEuUIJ1+BUGan8qz56es0OYw+v++l2ELkp74gXTgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iawt2//ESGXq45KJYLKbV05HdYnfgHs31un0npuP4rM=;
 b=iwRIdxHLJR1wF+X7va20T4V5W9y5d2VftpjOnlTt6uZ/v2nGLiGFSzVFrNwmHO/eeiJRaQWsSmP8yDrbo1sDqG3VCQKeGnSXwEKv7q2am8HV7w6TtFNNH8hrb8W/Br24nYB5h4kd+MZ37tWkK3e5ji+J52djSFoVTUVpVQdOaOVxlxChltYLr/oPAkwkksWZAPdnOC52K7LQWYLrVf6PXwPGo2ILVEJes/Gp7rL6tRTeDO6Q7NW2UvmatbmADVdSJwsiV67JaY4wq/vLmH6ORiXjaZ4T9nktQk7RaN1uKkQ8f5hzHkKNDc7dLL4TsPK0KfC6WdWuWh3SzsuZZ4i1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iawt2//ESGXq45KJYLKbV05HdYnfgHs31un0npuP4rM=;
 b=CMY+o2vpGJTVuf/RjZHBSHoxpGyp1ldWzYo3BL1i3Md8/KOTPHspX+Fcb+3KjzYaFMSQgLMXrbVqgJ99X1Aj2xiki43ZxNLiAyY+nPCPfdnVjFdsrrxlcFo+spXEz6uqdJiUg7UOf1sGfE6SxNvG1Um1P6rmW2c0V8gyUDoiTXlzMD4FOBm6NZPdmUENeHRf0dF5NJbFxqWso8Y3PNm19d+7HkZuSw5H6ByoQ8GZvMEXq+jMHlaOLRK5TBjqPxpUUpjIpoSo56AoaUl0HpzpVcRoUwDYqyrLDuUosmSixE17oiq4+CBpEuWfVHw84cFh0wN5icWI+ccvvPK9rUZfmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6478.apcprd06.prod.outlook.com (2603:1096:990:38::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 11 Sep
 2024 03:43:19 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:18 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:13 -0600
Message-Id: <cover.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b4e2fb-076b-4f1a-90b4-08dcd213dfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7bIaytHj7fXliI4+fU9SxrICSWpDoxzV3Bz58SXiH5Zwm7P9hC2Jk11vr/x6?=
 =?us-ascii?Q?mt9L+bnONX3tkDAQJUsyjDyHgpsgQ1LjA5COqDigrR2B2YzzubfVqx1siA8/?=
 =?us-ascii?Q?pKBNx3VO2D/8t1yFoce7hXbF4TXA7IynyBOWPVy+0+H6q8VIpmGF48VHNzQW?=
 =?us-ascii?Q?ooU1j8YvPdbcWlD6eDF2p3bIcc5aNP06bs5+8J70m5yI6b5/GL/xfO9tWMJB?=
 =?us-ascii?Q?DEhscwQXUAv0lvFckIvjkyd/hqCurvENJieszSoPLWMrilDg0GYQvqo1E/Yr?=
 =?us-ascii?Q?jDM2srQ847yWGl1P2DOD7vA6HVYXkMn7CaJHMRLfVPU/uN6mfTPZhr3ujoT1?=
 =?us-ascii?Q?wPmjADhe759+oWlAVuEGMFn2dN46XAR7567rcoXz/y8IzLgJwI2rD2OgTttN?=
 =?us-ascii?Q?2QuaFXD1rkl4WN0wd+ezTFwzQjAyUlp/26x5y8fj36nlwVZhUTcR+Rb6gnqm?=
 =?us-ascii?Q?FeHn4a0vr/m+D5bzuPRta+VD1ev7wGbjkaYTBjlEL3q8Mu660UnNKVz90UyD?=
 =?us-ascii?Q?SV7/Z3ybXLGSM8bO4yEDCaYKM+U7g/y0ZvgP0cauhUnBIGmlxzJDuU1tlvcI?=
 =?us-ascii?Q?3T8r4nGbIJXe8kLphMEPAeDQKTv3p0XzZ/Ovj6v5Dm6AX2c7IqYbmMHGAcRe?=
 =?us-ascii?Q?3DKuik02yzSED1UVRcyomchKkZidT4qfIjR5XOigNbi1+0wCSNzaMXmcPO7O?=
 =?us-ascii?Q?kRQoiupZdSH7PW1rapXbeeGcpPAu19cp82pkPpVvE75V4tT16ei8PCpHezA2?=
 =?us-ascii?Q?aqj7ldTH9iLlzY4eeH1vIY2b2AtoMwSfYXmwtxVgwWftydGcN/NMP2x9fVkL?=
 =?us-ascii?Q?PBUBASyuWk9Qw+mfy2H0hhn3Tpe/qTWIVix5BiT4wI6zglqXWlmNgn7lEH6w?=
 =?us-ascii?Q?kocUoxS0T6vAL5cuTkxYMbHoun51xLNKnUVFFUjUpSaZm1km5472Nkn1xJj8?=
 =?us-ascii?Q?YwKIdgeaAYJFGibmSsWrpxqI6BlEfcu0QkKk18hYSPjX6uGeJ1cBcQEAeT+J?=
 =?us-ascii?Q?gvvEwysg4Tq8CO7tisjRgaGQiWQbhcZ7jIK3jp6tV0htmw25F2Tuti+WkUfd?=
 =?us-ascii?Q?tXnUUxxPvTPiQadWnS7QMeP1vJN+csgGiFnh0ILiLU+q++zBUyWs/WPw31va?=
 =?us-ascii?Q?Ud0dkazDhMbaLrGDkOebQ31ylqGmGREZgGvk+YQQY3w5yDxIAxaEz0aAXE2c?=
 =?us-ascii?Q?Dj8B1peZSJd8zLJ17WZipXixy+J2oWQWp6uZWNTfX+nZxbUW6tGlnvysmEKe?=
 =?us-ascii?Q?vI+hzKHtlaV6KUnwvfgyUk4qnSc0WXmbfGJwxqVcP3rUnCkNMVYchV1l5nlW?=
 =?us-ascii?Q?OeXbWbyXF1TxSh7LPY8HQh82pO3unnGb1MU9tEUN3gQMN+0XSZ6EH6TOqlq1?=
 =?us-ascii?Q?4hSgIQo4Qv+dzRWcRxjKUcgLDmNvqRf6qmg7ji95WLMpAIBrOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+zY71GQIKEpwCi77oOQjq2sxjhctuuOSWdfPahM0i5Oe51IPICiHIgWXZH4R?=
 =?us-ascii?Q?3ohkZ1Gyq4Ues8tXxc4gCg/g3wg7boB0g03oTJXHfin/yEXx0sefC498Maqc?=
 =?us-ascii?Q?hhWqurg1Sf2IGkTf3j5+8W4uIJQWKfgNsrJmW1HN9ySOyatWg1lc4o5hd/ok?=
 =?us-ascii?Q?kPiYgWKL1JaDwRMpHxlPJTV/pBjeaK2ckeRrMkB37hXCnMqyxQV4ryBKbcEc?=
 =?us-ascii?Q?HTSPYn8gWiwYHmCXUZHufiMsRZ7Zqfh/EWePQcdQ1urlCYRGDZoYsghfx9J4?=
 =?us-ascii?Q?KDvpCSP/r1Z7Emqqom62tfIE3X+TVve+WnK5iCC3iamruEhoZdEJiZS1Avlr?=
 =?us-ascii?Q?Y8jH4LTBimkZhtjZCk6ZfEyq1H3GGjmYlBI/E32XdNBdcDZjb1mgLcIxp7xS?=
 =?us-ascii?Q?kQ1ZgTGjQjhcDjHP07GTKAlwC3eLyzGDymeLAhOynXE6GDQ2LeIQBmK4tPw6?=
 =?us-ascii?Q?cwBpNucjpe+wHw1RfiVHpJzNvB81JNQ5BsELdAzfC5ZKapcvlbpEwM6703HJ?=
 =?us-ascii?Q?ASMu+o0cz5epekCHbJ7ix3RGCr6olc4cNs/hOZQ0Ml3XC2fcB1OBT3jNu+bD?=
 =?us-ascii?Q?fCOgsXlam4hewyjbxYbvWpI/y6dwrFrM9IYkvzmBVZp+RVpOoeBOS1RkGv38?=
 =?us-ascii?Q?c1blIQai3fCGLRsHMK8Ufnzu+z5BXUer5/p4tOYCdXJHwij3CtLBRBN2rQve?=
 =?us-ascii?Q?CVddARnr118v8rPAzViwNxmdegHcREzdf3rzG6Hu56HRUrCMVm60Ed/VSiYI?=
 =?us-ascii?Q?KGIBCVnCS6Epd9zIyiPQrts4VRnU/Zgvb9BHz9hd3Exxt/VA4aSK8mYZLPrc?=
 =?us-ascii?Q?QylyCs5lsRdWJdnfR5l+z+wkm1NsiSL2ZdrIyAhh8Wgn7VEfWiFcj5ulwpdg?=
 =?us-ascii?Q?j9cfEU/EpIy5kBmd+pougDLQiovt9SuCppXZKF+NTuO6ueHcBzAxpIddM7kC?=
 =?us-ascii?Q?BxndU+gjamzghL0mTjn8ttasPIfJolSbIPUPNsAATpWnPIqfTrS6poRC4uQQ?=
 =?us-ascii?Q?HEGOlU8VHZQUeBy/ukuPd1z95MymdJPo8tgNo8trsEat4LLANyLo+yCdLdMQ?=
 =?us-ascii?Q?bd/jYdEHPQGGP/yuQB6Qhkg95sE3Qc8eCvcyMveF5BejYvFMY+PMEFN2lSBb?=
 =?us-ascii?Q?9dJG/IjkGZZIOdJI2gCoVAY5Y2m3WO82FQ1bFRIBxKatIEcghmXoJ7SLkPkM?=
 =?us-ascii?Q?UbbG6/0rPbDhAZqmjfIHulNK+JBVUptHxRvIG/GnI8o1G9+Ypl1r2I/qh6wm?=
 =?us-ascii?Q?4LEIZGJlr+pMa6BAHcoAeN22Ac/rQZeJlt1w7KTZKVn81n6n+f0Ojswjg1OT?=
 =?us-ascii?Q?YxtwuQ99pkoF3NRQJ1Eu5KN3ZHrqUvQgF6RuRIeuVQyjatibWi/n1QYS3nTH?=
 =?us-ascii?Q?dBKWYK6Xd9cIkLde/CKNxJe5NvMDWaU09jtnfuRXRksP/Qjg7BP4h78TBwsn?=
 =?us-ascii?Q?u6Nl8424+0p+NI9jG6uk9nA5UoB/6b+yw8WtY85coU7GC9jdS9vFsoWYRQ1b?=
 =?us-ascii?Q?WeBY5Soaym/OvoBbMhYa2qX+AEEt3eEqaCiAzjzD3EgDxS9B9LlG4ma4TEj4?=
 =?us-ascii?Q?+3P/iHR99tIbSGq0hPPbLIK8C5LOuW6s9m7lTX8M?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b4e2fb-076b-4f1a-90b4-08dcd213dfe3
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:18.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4koAWgF2SSDieZmVqlRIUu2FwfYaQRxoQIdbxWmZPfN6xPnN332x1WKV1XbOB2JrFgiOW2bUiH1bYHhnA/65tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6478
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The inode in F2FS occupies an entire 4k block. For many small
 files,
 this means they consume much more space than their actual size. Therefore, 
 there is significant potential to better utilize the ino [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.58 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1soEGS-0000Nd-9p
Subject: [f2fs-dev] [PATCH v2 00/13] f2fs: introduce inline tail
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The inode in F2FS occupies an entire 4k block. For many small files, this means
they consume much more space than their actual size. Therefore, there is
significant potential to better utilize the inode block space.

Currently, F2FS has two features to make use of the inode block space: inline
data and inline xattr.

Inline data stores file which size is smaller then 3.5k in inode block. However,
for slightly larger small files, there still have much waste.
For example, a 5k file requires 3 blocks, totaling 12k of space, which is
more than twice the size of the file itself!

Additionally, the end of a file often does not occupy an entire block. If we can
store the end of the file data within the inode block, we can save an entire
block for the file. This is particularly important for small files.

In fact, the current inline data is a special case of inline tail, and
inline tail is an extension of inline data.

To make it simple, inline tail only on small files(<64k). And for larger files,
inline tails don't provide any significant benefits.

The layout of an inline tail inode block is following:

| inode block     | 4096 |     inline tail enable    |
| --------------- | ---- | --------------------------|
| inode info      | 360  |                           |
| --------------- | ---- | --------------------------|
|                 |      | extra info         | 0~36 |
|                 |      | **compact_addr[16] | 64   |
| addr table[923] | 3692 | reserved           | 4    |
|                 |      | **tail data        |      |
|                 |      | inline_xattr       | 200  |
| --------------- | ---- | --------------------------|
| nid table[5]    | 20   |
| node footer     | 24   |

F2fs-tools to support inline tail:
https://lore.kernel.org/linux-f2fs-devel/20240903075931.3339584-1-bo.wu@vivo.com

I tested inline tail by copying the source code of Linux 6.9.7. The storage
space was reduced by approximately 8%. Additionally, due to the reduced IO, the
copy time also reduced by around 10%.

This patch series has been tested with xfstests by running 'kvm-xfstests -c f2fs
-g quick' both with and without the patch; no regressions were observed.
The test result is:
f2fs/default: 583 tests, 6 failures, 213 skipped, 650 seconds
  Failures: generic/050 generic/064 generic/250 generic/252 generic/563
      generic/735
      Totals: 607 tests, 213 skipped, 30 failures, 0 errors, 579s

---
v2:
- fix ARCH=arc build warning

---
Wu Bo (13):
  f2fs: add inline tail mount option
  f2fs: add inline tail disk layout definition
  f2fs: implement inline tail write & truncate
  f2fs: implement inline tail read & fiemap
  f2fs: set inline tail flag when create inode
  f2fs: fix address info has been truncated
  f2fs: support seek for inline tail
  f2fs: convert inline tail when inode expand
  f2fs: fix data loss during inline tail writing
  f2fs: avoid inlining quota files
  f2fs: fix inline tail data lost
  f2fs: convert inline tails to avoid potential issues
  f2fs: implement inline tail forward recovery

 fs/f2fs/data.c     |  93 +++++++++++++++++++++++++-
 fs/f2fs/f2fs.h     |  46 ++++++++++++-
 fs/f2fs/file.c     |  85 +++++++++++++++++++++++-
 fs/f2fs/inline.c   | 159 +++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/inode.c    |   6 ++
 fs/f2fs/namei.c    |   3 +
 fs/f2fs/node.c     |   6 +-
 fs/f2fs/recovery.c |   9 ++-
 fs/f2fs/super.c    |  25 +++++++
 fs/f2fs/verity.c   |   4 ++
 10 files changed, 409 insertions(+), 27 deletions(-)


base-commit: 67784a74e258a467225f0e68335df77acd67b7ab
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
