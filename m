Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4A676DF4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Jan 2023 16:01:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJbqj-0007jD-To;
	Sun, 22 Jan 2023 15:01:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJbqc-0007j1-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jnjLZ60Pd7PhsNp1UPSHWmQXV1wz1fLOvWQK8N/O3k=; b=SsWmpjqLeIpEtUVdSLk+JzmPon
 jU66yHLbF3wctKsCg5GTtzHeP4jX5l/yz2+0FX2wRjRr8EzHBEE8CDBm0uPPv8l20lmrkm+nSAFHw
 63WphzwYTiBa/FAuPBhLJdCT64mgT4IB1TjgT6iJLhYUxEex35UDWSUUbPz6ExiVm9cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6jnjLZ60Pd7PhsNp1UPSHWmQXV1wz1fLOvWQK8N/O3k=; b=VyXeH1BiSWZ17S14qQvqBTU4uk
 9PrmfSOuE1GlwX6s/l924gJrOAIJhiPIR8lDfI5QZ4opGHEx2nGxvzXM4LVelV4AxhBWrmNgdjWf7
 yGt9bsI0UyvjcYmmXRstNNa7RnW2aNNBIdLHTtNnxNXJOc5bA+vOnosawAHSrYPWzr24=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJbqQ-0002FD-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id8DrF7q3fGz2u6Lj/wUamubfJu4CBYkReSQpS7Vm/xUv/BG4YB5MxuyfBqopDiv6Z4PjQuG8LhC3KU9nWC8Gf5XEtnPs5g9TmS38P/B8wbR6TyDxesZEJAfM5wEgJXQhpzPbZFk8xIfo+iz3Xe9dB5p8vkkw9PDa39AItVRtdKcAPyzChVaOCJXgtPDqDCZnjHqxlKHTMWdu3DQa6kgDKHObEDiW0o2m8TD5regiYfc1lNYH9zTpoqqo+6BWS5z+eV3cazvEZOznlXdLU1cAU0ZiCYsTJ0YqwfjK3XjM6rKjVf86mhh6xhJ8LFZIw1q5DJr0fc13MqUAmnLiOFx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jnjLZ60Pd7PhsNp1UPSHWmQXV1wz1fLOvWQK8N/O3k=;
 b=k+ihVqdmj9f0cTaxY5HvB3+4kQ21pZ8DUREMWUHGZKszSSk0+k82+Ox7WjpIfnu+/Sz6tmyirDEzr9+rvHLsXzy0SpbH9DirnQKn/s36NQ4iKSkX7rpdZt3vwXdrXMEEtjrJNPvsgtGUGILwKHsSxx6fl7ByFJJg5oQ81aXg6fqUjkf4COwD5TKYpEWGG0IQEkWuhO+DQ11hx4Pca95vZTFzVT5TTY7ehFnD6udGBsltkQgRj0JJEPsgFWFoNte/uji2VpqUdBLEP38dyP2MRIbr0PqvGGYck3XyDI8UA0YxlSLsP82ZoYEFRxNFIYnVwOkF/z2u/+EQHuFNTBrCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jnjLZ60Pd7PhsNp1UPSHWmQXV1wz1fLOvWQK8N/O3k=;
 b=Puls/jiPBbHYvkPrPVCqM7ihLf+0qXIrm1Y6ywJstgs4XEhCOk73D7e2f5tCGmbdzNR88hnr6D50mAHF8oyHwvotsY65FQorjK9TJkyuci0rkeZBYWrVIT4sCLUhrg8P6m8/eIFSrgUTvKmBbQCINT1CBhH808Sg6UTeVrs2CRrK4a9kd44/uz4vFjgIGiiVeUxz6hz469sKi6RvoxaMFbqYA/TD511kXgvkKdlHWrDVyuhaGscJLHv59PJ2nTj+GzgDEtDp1llo+/R2jpYSUjdAbiPY4RXeAK4ebae6xgpkZ4jg4IKYqo877MbQ78oPckLmVFkkH1khxNy/qUEUog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5493.apcprd06.prod.outlook.com (2603:1096:400:264::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.14; Sun, 22 Jan
 2023 15:01:04 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6043.009; Sun, 22 Jan 2023
 15:01:03 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 22 Jan 2023 23:00:49 +0800
Message-Id: <20230122150049.66607-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230122150049.66607-1-frank.li@vivo.com>
References: <20230122150049.66607-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 354d89b5-63f9-492e-0ee9-08dafc897b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jHqjfsC/NM6RtQ5jgGh6+om65I8M874cr6tYDLztfSEHmWJ2bJYk0A1qghpVxYTRR/x/RM+wNo7hkNS13hTYyQlA7syYAzPfpqtkQNf2/b+wmY15DR6XH/sNkDlQxU8hqrkVVp2UcBCDaGL0MUGkKFO4eKEStPrZJ0tUbk0ig4MfYWn1+Pi1YTsHQdbihHlkr/uwr/2DAv+MRBoDKZYehhT5OKEsToQiQ75X8KER4fcp6G081W6vsCscMT2gpCEe71Dv8RguinRANEgESlJ5qSzViWo5QVBFCdF0C7dCDd9KwSQmPC7U74kE05kXSp+EhXCMdEY01hZ9bG4UUA5RtvG5g2CftzIuS5iD4CS2fG3UZou0tC/A/jlVQEXlBBqyW99ryFTdMPW7sYYSBER/nGh48YsUjbYtL7y1gNr+5BKsT/8jeyDG3/BpS/kBvGnvZU22yu1HgTLxy4NdhUKj1cW8pliVJ0CQtu5HwSDJXhkOWSMLk5MxlWBU5yoUY/2oS3lPaFBz9PyjDE76i4FNy9b6Cwl8LRUqsohGED90/wujZIKDJ5X3iy5CpZ8eHWAMWYPT8PDX2BeYOrK5YPwr6RWu3x98b/IHhL2hnhP0R8TfRBmlyYZC3yQX4O1OLhNGF4XxD+7BGqZPx16ffhMzyamWrtN6ObNmA/rJ6J0MjSghfXzgsHaoL6Wa58fKg6ho0/QcvetIybGzit6qfE4ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(451199015)(83380400001)(38350700002)(38100700002)(86362001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(6512007)(6506007)(186003)(26005)(6666004)(1076003)(107886003)(2616005)(316002)(66946007)(66556008)(66476007)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fe1YAcPXp9mM0OiAEIYdJ8FBT6nY0TZGdsXdE3KkyU8KFwRH8dJGAnX6W17a?=
 =?us-ascii?Q?bpCw6bo4pJZD9XQNlPrhLvrByXVlcY6c/oYIXV6wN/CA+TIOeFBZT3+RCbXj?=
 =?us-ascii?Q?3AXrWfzfyB3ewFj/yE74s+/e1WvLAXWowiD9JOQBjn3IPf/3mpykgo9csySl?=
 =?us-ascii?Q?WhJe6Lv9hQmAim1gthh7nzPkkCKIKyui1DNOEiI8EyhUiB0cluKCBMtOsvN0?=
 =?us-ascii?Q?p0cVdZxPTHKV0bOyLgaE5KgMkqHTf+fPzf0lQiSke8f/9HLrxnV8JtqFfaxr?=
 =?us-ascii?Q?K1NJLsHhgRdmjHrvm94opTOYGtKhBWg9yuafC6dsqcoHx6z9rBQ9m5ebhXQO?=
 =?us-ascii?Q?KIk4AFy6vZlfQPBRLb3aexkfVyvqfnnU0OtetygfG5gRjCNOsKeOznVR32OT?=
 =?us-ascii?Q?B1q6+BmRTNfO1cYBUkYCFC+RxcBK82ROD4hGUlzik+4bcGixMh9YQAAZEdDn?=
 =?us-ascii?Q?LhbOAencTFXU385FKYUx62fMfBd1ck26N9Cn8I+YI2QiNHqElQ/K3sjIv7MB?=
 =?us-ascii?Q?SX9y0oj7qJGIHBd8iCPuaq8TdRneuUlkvKUEHoLA9jbUDd9x0I8GgU3OlVX0?=
 =?us-ascii?Q?8no1ckYfsSc5XVPLGv1Ggeld2ccEhX2pV8Af3eadRzwYP2FRnMm/vas8ZhZY?=
 =?us-ascii?Q?9HB9oWWffHaT2CDA7H+JWYC32pWQG76i05MSfNxFMLhhaXXPkdGjrCI4Gqe3?=
 =?us-ascii?Q?/fg1Kx/z8m/3bnUEM5tW0LvQqAspb6mXi4rw6V3ET7kIkjXtoDUoLM5CEk6s?=
 =?us-ascii?Q?ajlH7imdUC7u4Kby7r2Ev14axC6kBy6Z7K05lWdzZ5xTttl8RhS6BqK5uiFd?=
 =?us-ascii?Q?96jQyQoSx0ALdNDX11jHEo3ANpFltm96Wq8PjBwAUxpGUe2gs7T3IgkcBUXH?=
 =?us-ascii?Q?H2CpaqxX5JaNvYCXCfdXwuiGE7+JI46DJk9fjzyq4W5kU4WL5VlD+LuxnK4z?=
 =?us-ascii?Q?ifsS68SvDJVWW61rq5k1CDEBpSl945tAWpyQJ+qlKj7I3ckQi+AL1UoTQSsK?=
 =?us-ascii?Q?Z3svfEmQrbUbn5aK7ZzW6dLA8SRJ5iXkUYTrPiwayTKkRg+4UcGpoCdsXEpv?=
 =?us-ascii?Q?EmzAjCJfP4IWrYIfIs4yQTb4RX90IbcB8ObYIayQtZ5VQ+9YXwq5fX8BM6ky?=
 =?us-ascii?Q?ApLtVwz4zTU1vLfP4Y77uG4kKfeYdvuvt8UnR1AXGKTqi/3kRJso4KR+pIs3?=
 =?us-ascii?Q?4sJr6LubZtxv1cAaHiIo65I0ctrZgsVIIjm6LFHekIj2Yj6Beu1BV7rMb8Cu?=
 =?us-ascii?Q?R7ObL/jFaHMGf7ZaAnAJ1tn80SfXKJOrcnJM4CHfGqqW1OQ+rCqNVy6tj5JK?=
 =?us-ascii?Q?8H7xarpAAAPkeuL0s1BUeF2q3devjcHRGue4UFEQ/kfn+Frc8M+y95KDnV64?=
 =?us-ascii?Q?N3Tbnq+15TpgEBnY/xR83g7fJWNo7KJEDGxKgPxTArObh6wrd0Uqfsj7WrGS?=
 =?us-ascii?Q?BzGvMyLOFLNLpsuecbQWGiy3qhSM7bZzrDSf2F4pHixHtEb3aZ5WFRS1OnSH?=
 =?us-ascii?Q?jL4yijS6Yi5HJ5YR/lVA+sybXumwWy4q9VL+pz4I/aPLVaNR8ZukVuDYRlQZ?=
 =?us-ascii?Q?wy8aCqXfoAG9TuhGDSyY121CmPzTpPHKWU9ul4xj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354d89b5-63f9-492e-0ee9-08dafc897b69
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 15:01:03.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dnVQxgIvHZK/DA29Rzgc+63Ep5RB3Qkpo7wNyKg4pSf72jpJieHHCwJ734BZFFr2JzSSgkHc0GrR3ewy7aCcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5493
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pJbqQ-0002FD-H6
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION_V2
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
v2:
-handle F2FS_IOC_GET_COMPRESS_OPTION_V2 in f2fs_compat_ioctl
 fs/f2fs/file.c            | 21 ++++++++++++++++-----
 include/uapi/linux/f2fs.h |  4 +++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78b97c1fa6af..b3bcb50490bd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3899,10 +3899,12 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg,
+						unsigned int cmd)
 {
 	struct inode *inode = file_inode(filp);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
+	int len;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3916,11 +3918,17 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 
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
@@ -4263,7 +4271,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
@@ -4902,6 +4912,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
+	case F2FS_IOC_GET_COMPRESS_OPTION_V2:
 	case F2FS_IOC_SET_COMPRESS_OPTION:
 	case F2FS_IOC_SET_COMPRESS_OPTION_V2:
 	case F2FS_IOC_DECOMPRESS_FILE:
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 640569444200..b82dc386e59e 100644
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
 #define COMPRESS_CHKSUM		0x0 /* enable chksum for compress file */
 #define COMPRESS_LEVEL_OFFSET		8
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
