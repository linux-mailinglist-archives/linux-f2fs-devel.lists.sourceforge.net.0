Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA44667348
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 14:36:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFxkp-00033K-FJ;
	Thu, 12 Jan 2023 13:36:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pFxkm-00033B-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 13:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=duWOs/Ix8uyKICEfM8mPMrrqsEq4KNTHqbffA8TiPWs=; b=ky5aYzdgJoC4zrliNiPYzPuSAN
 97qKOGL4/y+asygsPEX91HQ9YgNHrJVQ+nWmLE+ko1DaT2Bv8f/YqudyCFPmlJC06XhK2TpejnF1l
 XIjUNBmU6PMX7r/+X2DPwshk5uYbjbxa3+oZnQ8o/r+azC/M02V0F/OL+7bVUiu6ZD5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=duWOs/Ix8uyKICEfM8mPMrrqsEq4KNTHqbffA8TiPWs=; b=T
 qTqpzXgLIqKcN41LuTR1yS3y88Dgu4ZjSAOYl+LSl6iCOCZ+Y5tgHOnUizZ9pe9Hcaex/XcMF0pFy
 ltzbLFbt37awBauk6exc5kxYhsodKJbU0iIWjmzJEB0AFjT0mqjzBs/CaA3VaPoeI0qwPBZ0+Sk/S
 f2hrXOLr6NGlsGSg=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFxkj-0007NQ-UH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 13:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0McbLsk0V25JRAbNBRRoWEI+7HoK0HVi/rcrweNfWQQ96CuS6+qx5uoCqvbH7dHzdxV1tAHkDUyvp8a/jUsyOC/BjqvUePuUUxsxAol2CppMBL9L0poIU9jUxqgDBmxfvxyahDqUTCyd+E1p7BKUuIf1CnL/oUWxFwDJ3QklED0IcAaftERBxQUtDOLkWt1rsttteW5QOCvEeRdFFnOsIT5tTe9OPeotIrawWtpo6sTKTxS71J8wJmo9aJDCvZfD37/dM3MSaZgbCgItanQA/sN/CVQih/GtalVrD5hddCFgAaQepBILiDe0CqRbpKclPFNIDgCKjKoQgBqr3e4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duWOs/Ix8uyKICEfM8mPMrrqsEq4KNTHqbffA8TiPWs=;
 b=j6eQqI4G8nCC3aKr6yC4JfMzIh2o4wEklo1+Cod64jVk3vdV6RBa6bq95ZoznRXA0KDsWn9SFA4UgkGc7RaqAq/uOUivQq5qr/3mO8NZ8GSwkGyGtcwAEtygmjqlaWLWtVOdIVazJDbuClB049vnWNLWYxA0c38gSJaYsVPPsIpXBuN0FZVfjrjW/TJ0a+4o0RBFBGRAFOPrfOp6OGZ/fRF6ICunuzaQKK2DbFntyu0Q3vbG0Te8SZrZPDslxii4L8uKh+ddDprwuFiSgHASJmwvM91Wm7+EizLE2NDacQ35SVTj2QbCKBFAqdFQ+b7UqGjpOx5f9PS6d5OkPVMcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duWOs/Ix8uyKICEfM8mPMrrqsEq4KNTHqbffA8TiPWs=;
 b=S0YwLyDRmeAy6DG/RJnPbp2vsaMt/Pz15HF9zifFm4Lnp5b6u9AugCWcG/GURxN5tYPpZVG0zQ6qi+ZGSC5rehpmFDiEQkOG2Xuv5gKLqW8z/hMDZHuguPhAOVV3R+HNrcIVnFtmSttD8FxQFWN19HvDmZ9pu1rer3esyHJ8bkyUtFmQ5YymKiaLxCq0fmgFW0YWbD7I76sGnTkjpfRvF0fnVUxhq1cO3O8WfrNPrbRKkrRWXC0efKfvshxcXStveZwuKIF77HfeIqEkX4reWoVWCdjs8gUMx4pljzG2G6nKsqk397QrZvJzAcFVzOZSwp3+pfDsI975qi9z2y4x0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5072.apcprd06.prod.outlook.com (2603:1096:101:38::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 12 Jan
 2023 13:36:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 13:36:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 12 Jan 2023 21:36:05 +0800
Message-Id: <20230112133605.16957-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG3P274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::22)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 070f66d2-1999-47ad-0611-08daf4a1f9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtDrrmbeiBq+B1MUGmC453aWbyEvC2WSH9p2205Y8/QFPNgS94IS03IRav448bkDgxk4KTNCvSczVxCmyh54PYiwuzLNPis0Us73RbQonEChr66btgVvi0VhnW0SX5bbgQqmAF7y3qGLQ/1ks858FjejaZNZLqaBkZ3e2w738/AZKp2h3FbDonMUKzchBq0z9N9yzUsPJvLRMvyb/BsPSY/6WVcon6/ZW3hiCSerWKS450NW9iUXwDcFwgk2QTH4iyFSsTMLSgVXenLvrD83tfnPhYiTNeza8szx4ho0Alq6yxRDGD5KulWh135djGxdySYHxSjmb4swsGX0jlolA5HCtkxoml6JzkNPiD5iVba94a0udPrn0m3VpSiRtc0OrQN24OZPA1on7TNYW/LahTwgf5REj1s4CPInJKdWnSr2Kbg0iikwnN+mQObQX5B7KeCLqb/UnqD9Sx6ZjfWb3aa3aaiUE+DLNuyHWJkGy8LtvMNVtETYVeqhBqpQG1Heq26SfGMxSaWnIkgsSXk11CFHc7D9eN0TAfCjbCs4Y2m9jBXHdJFOWoHxav2BSE3uHwOKeW4gqBxbIntIhm9SJYL4eQh0DeHEpncVTiHiBByOP3P7tmpbLqYuQCgm1ewvj7GjYTTgzWBkjRuvwmI/kW380ofyIEhqUXtfE4zm4aJW5OqzzSKDwhvyn9mkCLmUQ4yoQhlMv1X0F7JheIfojA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199015)(107886003)(6666004)(478600001)(6506007)(6486002)(86362001)(2616005)(38100700002)(6512007)(186003)(52116002)(38350700002)(36756003)(83380400001)(26005)(1076003)(66946007)(8676002)(8936002)(66476007)(4326008)(66556008)(5660300002)(316002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dszGwjnXolIu0pMWhQj6Byf5Gs2ieG1lq0bHTGovf0/5S2RkwKYhrO4B9LiC?=
 =?us-ascii?Q?cMRUlsF1NY5zolNLwlb9i3TCDp8dgi2lxsKCk89khVR799/iybiVj3f4jrt5?=
 =?us-ascii?Q?PbZ/JpMKf0aWyQ+V6D7NXebtVnldFNREMxMOmoo1e3zyY4hdn3ztTXSQ8Xco?=
 =?us-ascii?Q?FPwc6EI4nNvZ7uWpO1zItxQkpaGSKo2Mi1hXSeHsYX9GyzGBV4X36gmJAc4u?=
 =?us-ascii?Q?gfW9B+vIaQiTOKYRYGzCpFwhhiz6xMyFmcYtPiIkXJEV4MC84QVUIJnDAL7O?=
 =?us-ascii?Q?6k8beueCMzIlXFVeMSoKVeMovFwWEKEZnIF5kmqf5OW9huUGIekCCB9YwI6N?=
 =?us-ascii?Q?3gXrqaGrRlCcDCmksdH59vK/wD9i4tAeZEZIp33Fnzped8e8/Ag2Ng+6vr6O?=
 =?us-ascii?Q?ZkY6Dvxsln12eD++adJR1mAgBXC93d50eJdfU3ycBoa+rIU3N/lVkOtRqIU2?=
 =?us-ascii?Q?HCZu+/ruopxMUSf9PIeiY2nAabio/qZuwYAUaS15KCNjQX8HjVlijX6iL6nq?=
 =?us-ascii?Q?vx1fDkFfXyUXk0R1ta3ysEz/fx4CcRSklGW65I7I8ck4veiULfOmfFlyJ2k9?=
 =?us-ascii?Q?iI+0EwW2NkMhqL7f6C8lJOzeXNGydq0ccYQPxXqIpQctdIfjItImIJynsXWV?=
 =?us-ascii?Q?3/J5dufsbgmbRUMCH6PZSnVjBHguY/KKyiBwscGcoeeoRM8y1v+4B9Fgg/wa?=
 =?us-ascii?Q?g9leZk1cBfatYMuICKO22P4/lvykPRsPCHC8gd5tUh+sOQwVhsdq17v64FF8?=
 =?us-ascii?Q?cLwZf0NGqXEna6fno6830IjBBtA3t7l855kurCCXH2NoOQqkissqn6s5DhRK?=
 =?us-ascii?Q?4AAQ3EPxVPKy7qr4FjGOCkupfW2xDTOhzez4dqUBvcBxNjziRslPL2fl9Vnr?=
 =?us-ascii?Q?Y5Pkw4jjNxi2DIXm1TpdXMsDz8/h2dbzjE/RkWWj1OqxSN1jLMOf4QPTHUF8?=
 =?us-ascii?Q?f5V6ttd9ASHnrPRwVn2E8Kxo4O5gG0hPgz0Ey3gY1KCYhi6a/oDoQgVE84mU?=
 =?us-ascii?Q?bGGDJSDR2Y11js16AGK72GRsxI32pXFTg2PCtRjRYAgogsh3sF0VOFqO/qOi?=
 =?us-ascii?Q?Kx9SUYqHFaEE2CraWqEabicLd4nh5kIILS53RK2RqgE2BQ1VMSyyLcZqEg5H?=
 =?us-ascii?Q?1EcgGOIX+esUHnZIJd5H6N0POa/X8s5QfbX5o1cVU2PQccJ/G8iBucywJOS/?=
 =?us-ascii?Q?RdMPfkB25LSRREBaHi9XHGqay3CwGXPm2pVa8jjY1Etdj+YMTv1WbML0fG5B?=
 =?us-ascii?Q?aYthkUlsPGydrPi3quIV8hxSwbsJIPLaD+fonVYyHlhWRe7Xsq9imPAX0zBq?=
 =?us-ascii?Q?VuMPdByFWWVmyGuiLyW0bRUnBDgZCe7/FkgzSrwBXdK76Iey6UR5u2d56To9?=
 =?us-ascii?Q?lnnH1v9yV0yM8s+pO7FUOsbuPBF03OBWZcxD9T+pIMdai7rW2zRm/KzX0i6S?=
 =?us-ascii?Q?CWsJCaoWkDeXnahPHYzzgWMh/JSxF3p2h5P4CKzj2pO79JezECSq5Wikyi4o?=
 =?us-ascii?Q?yka62Y8E5XIj5WrKMAYGTcwTaNi9lRZTS6v+XMHYFhQpPj7AoeHs1WEEQU+i?=
 =?us-ascii?Q?bbybkhvSSut29HcfDDuv0Wf/7wv7hzTKzg1418a/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070f66d2-1999-47ad-0611-08daf4a1f9bc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:36:14.4369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 298oVOnn+GbBYEzm0vxpM1WIGjL1O4hhQMB6cMqN9tni2LrnmnuFn0fVbs3bFZ05U9mtTB4ZOZRnIseGPDZKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5072
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Added a new F2FS_IOC_GET_COMPRESS_OPTION_V2 ioctl to get file
 compression option of a file. struct f2fs_comp_option_v2 { union { struct
 { __u8 algorithm; __u8 log_cluster_size; __u16 compress_flag; };
 struct f2fs_comp_option option; }; }; 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pFxkj-0007NQ-UH
Subject: [f2fs-dev] [PATCH 3/3] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION_V2
 ioctl
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

Added a new F2FS_IOC_GET_COMPRESS_OPTION_V2 ioctl to get file compression
option of a file.

struct f2fs_comp_option_v2 {
	union {
		struct {
			__u8 algorithm;
			__u8 log_cluster_size;
			__u16 compress_flag;
		};
		struct f2fs_comp_option option;
	};
};

struct f2fs_comp_option_v2 option;

ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION_V2, &option);

printf("compression algorithm:%u\n", option.algorithm);
printf("compression cluster log size:%u\n", option.log_cluster_size);
printf("compress level:%u\n", GET_COMPRESS_LEVEL(option.compress_flag));
printf("compress chksum:%s\n",
		(BIT(COMPRESS_CHKSUM) & option.compress_flag) ? "true" : "false");

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c            | 20 +++++++++++++++-----
 include/uapi/linux/f2fs.h |  4 +++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 719706ef0d46..e011fb50ccc3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3885,10 +3885,12 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg,
+										unsigned int cmd)
 {
 	struct inode *inode = file_inode(filp);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
+	int len;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3902,11 +3904,17 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 
 	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
 	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	if (cmd == F2FS_IOC_GET_COMPRESS_OPTION_V2)
+		option.compress_flag = F2FS_I(inode)->i_compress_flag;
 
 	inode_unlock_shared(inode);
 
-	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
-				sizeof(option)))
+	if (cmd == F2FS_IOC_GET_COMPRESS_OPTION_V2)
+		len = sizeof(struct f2fs_comp_option_v2);
+	else
+		len = sizeof(struct f2fs_comp_option);
+
+	if (copy_to_user((void __user *)arg, &option, len))
 		return -EFAULT;
 
 	return 0;
@@ -4244,7 +4252,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SEC_TRIM_FILE:
 		return f2fs_sec_trim_file(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_OPTION:
-		return f2fs_ioc_get_compress_option(filp, arg);
+		return f2fs_ioc_get_compress_option(filp, arg, F2FS_IOC_GET_COMPRESS_OPTION);
+	case F2FS_IOC_GET_COMPRESS_OPTION_V2:
+		return f2fs_ioc_get_compress_option(filp, arg, F2FS_IOC_GET_COMPRESS_OPTION_V2);
 	case F2FS_IOC_SET_COMPRESS_OPTION:
 		return f2fs_ioc_set_compress_option(filp, arg, F2FS_IOC_SET_COMPRESS_OPTION);
 	case F2FS_IOC_SET_COMPRESS_OPTION_V2:
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index aaf7f55273fb..b42f6b322b8b 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -45,6 +45,8 @@
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_SET_COMPRESS_OPTION_V2	_IOW(F2FS_IOCTL_MAGIC, 26,	\
 						struct f2fs_comp_option_v2)
+#define F2FS_IOC_GET_COMPRESS_OPTION_V2	_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_comp_option_v2)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -65,7 +67,7 @@
 #define F2FS_TRIM_FILE_MASK		0x3
 
 /*
- * Flags used by F2FS_IOC_SET_COMPRESS_OPTION_V2
+ * Flags used by F2FS_IOC_SET_COMPRESS_OPTION_V2 and F2FS_IOC_GET_COMPRESS_OPTION
  */
 #define COMPRESS_CHKSUM				0x0 /* enable chksum for compress file */
 #define COMPRESS_LEVEL_OFFSET	8
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
