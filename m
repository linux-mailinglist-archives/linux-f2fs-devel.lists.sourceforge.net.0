Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8672DADB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 09:29:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8yTE-0007qa-BB;
	Tue, 13 Jun 2023 07:29:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yTA-0007qR-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wgfGUgMLPbn3yETy3LvqPKYO0xZz4w00oyVUCiwb0XM=; b=QACQubYPtoEDowlWF1Uk0H3qam
 XMvDV/h71QloYi4ur32qgWOrhPtIX/q6LEBL5UetJk/GZ2fKbxPYGQtTkQfLu+Jh+ofDAEY8FEisA
 S1zjLdfqSH1A8RwAZaZO2l+ViZKrKXRmckQrcTgMUwGsUgTswA5oH1FbSG6NfqyeNAZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wgfGUgMLPbn3yETy3LvqPKYO0xZz4w00oyVUCiwb0XM=; b=k
 INe8iEEbhrQboPNWWsvz2P2ETMOwVLSs67wJwAU+CXdTlMPZp1XO/+if5+iDYBeiYwccZ0Y11nuk3
 sK1ENFW5VIqp8/Izfv3PXfHWD1nq4BKmrbXX7KX6Crxpa5A30QXtS3byOaS72GpiA7IAkSpM5dF8p
 FNL1RyffEO2DNNDc=;
Received: from mail-tyzapc01on2134.outbound.protection.outlook.com
 ([40.107.117.134] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yT8-0005kU-WE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Csw9+B+DuFsYnKeOwK7eeef8pST37svNrqoIWbjpbQ/Wu2+5ogdD+VyRUpltrY7NBTJSATS2K7sJZn0E5Z2+ZejPtbY6tGj4F/nQpFhS8sairGKh324REXTL85xCFkxYIjTHrmF7y3wXBZTWjRbqJdhXXRpOA5TBddt45hRo+AEAcI9tSx1Wfefgc5ft3rtjzE3ntPBDAQEA4yl/HSSQVBbboZ5rpZSXm+mMMz56e5kknt+SvGbhZ2k6peIZN5HQ0NweYNeEr6SjD1A+YYEKT40fnZpX+wwGRwUMnf3WWCYi1Y+KVKDWtZPpHKGaSS/8lg1t8t4dtDPM1ZkVf3rylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgfGUgMLPbn3yETy3LvqPKYO0xZz4w00oyVUCiwb0XM=;
 b=O808E58J5de5rByGdyuzw1ELDyKlYgo7TFsBS5D3crnrhoFRk/Q59hShSkGnoeHqJRq8gmar1YQ3YIwpJbnSb/x069eHWSALT5ZRnTe3jfrHUJKT4mW/fuUpsrNe+83s7THyCdT2zotkgC6MerHc+5Q9fHX9/yf4pcq6rMbhBFo6pfMT20lKDBwOJCwv8gRJZwA2mc1+RtnA4Jyx72arG0ydzmcy/CkYmWuynl1BCcrOqRnpkp9yMJbapegGUUzJv4qAQ+LJ9XqD9jHwY7Qf3UweOdTM+368ARnSeWbzujI8Hvwoq9lqXqPpiiqzRgZUHH0yjk4TmyP37oMGryfw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgfGUgMLPbn3yETy3LvqPKYO0xZz4w00oyVUCiwb0XM=;
 b=WYVM3QGGiiITKmQxfBJkheC38pEUBtV6R17HVOl9M2iZ+O2ULBzRhupslVtFTB27tChzljqGl/2ArRJWQivnKzT95DcFhmUfZ6J5qfs0REzETZCbeUquqlBwWh460M+d4gYZrzgItgfpukhf/kHZW+CfOhusFkINXfIbgyabuVec0R/v3wkoqzL2KXPObBORLpzS1iMVXufkcUdLL/qAAQuCE/2YmbfWmra9JZ37YKavX4Oi+lyejtff7bnf61G6ojO8+y7soLfuWfS2LNdkggrzl2OhkBkGLQkAiHrUdAu43y5EEHec841SbJg3TOK5F1LQdI8priNJxv63mrwngQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3985.apcprd06.prod.outlook.com (2603:1096:820:27::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 07:29:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:29:25 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 13 Jun 2023 15:29:11 +0800
Message-Id: <20230613072912.52249-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3985:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffdcffd-8dd5-45e7-7c1e-08db6bdfea08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAj2/DN59uG/rgBkNAf19INQ1qzZtOEOnhii9/+VeHmFAay4Db9TnCq6ff4LFUlLg179Ue64HAdzXtZ+dJyz8iV4iCepjEjxVyC/BRvxM+B9hS0FKp4zC0kwADQ5xEeDxDAMvJOyEZz56QB7Yv+sVHar//9mui1J44R87bCHdGXdaQfH+NPhv2hyNWCpEP33HajSd83NDIJbjFv/UdzxhMjGzkeB8RnsHgCldRND6eHWRm20ipzXmJf/W6H5zSMflpaJURhsdm7UTObxqgciod8MuciRlPgRE/pyIX9Ql6uRMpJYx+KMG0Xrq07P92W5V23oKBqbnJ5zGS5c1CA9QOs0/q115xANMX4XeVdWKs6fkJW0yb+pZiii5Wjezo+sO5O7uXBj21OVis9Mg1CuCwCax0BfWaj93kvEk94X9HOcln4gDj8fSFBf2+RMQUTPYmfhFmzu9qoATTyDlNdu5NznbSugj4bJLQkOXyjG1K4Nk4V72DsqoiQ8/ksw0SduC9J4yVkqMtFsLLEMRCJuDWZjN7KdUCxOh05RapdBo3ZN3m0mnzus1sxOIODdlUCR0KeFjpOyfqFuNPwsOqEArYok6jXA/WkVDjJoEGKjUnwa4oZ+rTtdIfge/XcpqU1C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(5660300002)(8936002)(8676002)(2906002)(4326008)(66556008)(66946007)(66476007)(52116002)(110136005)(54906003)(6666004)(6486002)(1076003)(26005)(6512007)(6506007)(41300700001)(316002)(186003)(83380400001)(2616005)(478600001)(38100700002)(36756003)(86362001)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6DNsgTEJFgJnwgkGrVgga9FuiRZ6fdtEtW/uuQs5pYWtWNXkLJAbb2LwPLK?=
 =?us-ascii?Q?aXjxsgau2c4I18b4XgpzRYj/FFBvIJi52jsn4QuFwcImIJbFu6mnwSniQ2HA?=
 =?us-ascii?Q?rPn0Iten/NEBroVrdlTLGsCjDEg3mBqq5yRrn7Mcq5o7Hv3X+AVH1+FKhbCi?=
 =?us-ascii?Q?3nM84D+wiWU+IdK74YbFWZSB4GBATN/Md3KntWfqS3kq/in6WSHfV+NBLWnx?=
 =?us-ascii?Q?LO5z7L8g5M32HknrJgK1Ura9HTOVYvwy8l0AIeLHH5938/hJFKIdeMXCYVvh?=
 =?us-ascii?Q?bcqH4GiEQET3zRvVWAJMRJSos8f70950cZAL/AoQE7ndeRvUcuSife1i5fki?=
 =?us-ascii?Q?I3GHakTPAvDPsH5+hmNhtmjY0+XrIQQkV/cAAikvI4MYu5Klan0STcmM/hnZ?=
 =?us-ascii?Q?nKS3oWnC9tcHXQRe1Y5+XAbnKi1cQgiiioPIRZEcolgum9xB1mDOwSHkyFuH?=
 =?us-ascii?Q?WGrRiV3M9lwqiU0oOMwZPF1qQ0zEfDHxsoPWcxoF2B/wq4ZXhLe8wfWJgYR8?=
 =?us-ascii?Q?df0ocpsBXOrpQJ/gqtMmNNm7ypiWU8V5oFbuwEVsBo/gq2mFjJBUBIAidi3w?=
 =?us-ascii?Q?jyj2jRsO5GGdsCpzFTZLGD8dBx6zPXKHo4ErCnrmjpCuSZMYEl385ZcF+zMo?=
 =?us-ascii?Q?yXjoEh0VXAgpqFHis881lBCrOe41aMwlBPBiZSmQN0HuNqOuyNP1NQyR887Q?=
 =?us-ascii?Q?cLVBWPtZ9jWECuJjNog1mbgLVcWK8t61yxvKXvNLv1Qzy/5rsXJygxa1YxDV?=
 =?us-ascii?Q?FQ53C2NwXuEnDIm+0TxALWCMIDSM5U15U2fKIJTpGx26b+JTjEr7yVjHkp4G?=
 =?us-ascii?Q?0HJMdNbVZaV1G+uSeva9AqjJSTpi7F+CxnSzs3iAn8xsaEfwWCSLx5SOOTHv?=
 =?us-ascii?Q?3CLz391an6omPYPLI6PmhYFHQwRkeF+k59A+T2fE5frx/WGzjWPPXwZnsLzy?=
 =?us-ascii?Q?TQLjl1Rx0Ycls1ezMBSn3an6vR0GPJa/WEvpyzpVv5IrvBI6wmSWrMRcgPMF?=
 =?us-ascii?Q?jcS0ZEMTFJRYTq5A7P5vZOmILuy+40IXCHZdmrV5ohqlYeGpF7uWV9rcNiOs?=
 =?us-ascii?Q?oOE+LQwUnN6muVt7g4hQZR+oTSEdDViz4W9mCG8m8XGxUWeks39YLcT/oGi+?=
 =?us-ascii?Q?iGX0tFtgCiYIcMWm26QHi8Evveo5bDbEVjrVM41iRXhrJtrLLnAJoFN2/h7X?=
 =?us-ascii?Q?6lRjqDLiWKQccZuFrD45JiO6rfB9DYW2Kc8UomKNFou/7F7R71wguVbrUWRf?=
 =?us-ascii?Q?Z+Kvk622Qgzl6X+trJkTrv+cY8+GUoG9d0V3/iaPlqRun0bYPEricMgwBRiE?=
 =?us-ascii?Q?2dSBWVvOEbcPBVz+vHnRxM8u3GEcUTSLwD+l+gwe/iBeyKfFiil9o3w6HRRH?=
 =?us-ascii?Q?6fDAXX7YcyuaxY/kdGv3KasR7Bf/LIhp6B5CzzZAdpK5aQmkcV4Ha8NHG8wO?=
 =?us-ascii?Q?dNNZtXtlh/Qsqm56oDZt270y0ilY5rdsXNkd2Pdm7DoJbJDaK/lxIQOcn141?=
 =?us-ascii?Q?wB/URxCaVVcpZLRCPZR9AbDLRAowCeBBeKY8SA6RgIiJPC5BEe47GlGTyu8X?=
 =?us-ascii?Q?fvXki/IqALzGPDMwSXLxEDxk6cqF+8WQCs2KErzS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffdcffd-8dd5-45e7-7c1e-08db6bdfea08
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:29:25.3222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnBa1cRz4k7hfwNxxuCldEN8pyLjr9ego5PBV1Q0cTfEDRuV0ufex2QXG0XDrG4yPT9IB0AC5NWtuoDQri9tQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3985
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds the async buffered write support to f2fs,
 the following
 is the relevant test data. iodepth | 1 | 2 | 4 | 8 | 16 | before(M/s) | 1012
 | 1133 | 894 | 981 | 866 | after(M/s) | 1488 | 1896 | 2081 | 2188 | 2207
 | Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.134 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.134 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8yT8-0005kU-WE
Subject: [f2fs-dev] [PATCH v2] f2fs: enable nowait async buffered writes
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds the async buffered write support to f2fs,
the following is the relevant test data.

iodepth      | 1    | 2    | 4    | 8    | 16   |
before(M/s)  | 1012 | 1133 | 894  | 981  | 866  |
after(M/s)   | 1488 | 1896 | 2081 | 2188 | 2207 |

The following is the fio configuration:

[global]
ioengine=io_uring
sqthread_poll=1
threads=1
iodepth=32
hipri=0
direct=0
fixedbufs=0
uncached=0
nowait=0
force_async=0
randrepeat=0
time_based=0
size=256M
filename=/data/test/local/io_uring_test
group_reporting
[read256B-rand]
bs=4096
rw=randwrite
numjobs=1

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4dd4e2bd000a..74ecc9e20619 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -554,7 +554,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
-	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
+	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC;
 
 	return dquot_file_open(inode, filp);
 }
@@ -4523,9 +4523,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	struct inode *inode = file_inode(file);
 	ssize_t ret;
 
-	if (iocb->ki_flags & IOCB_NOWAIT)
-		return -EOPNOTSUPP;
-
 	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
 	current->backing_dev_info = NULL;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
