Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC684106A0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Sep 2021 15:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PIaj9JgcWLa3W8M+A8EG1j1ZmHPQUSFkTGuwqQZSUk0=; b=HosMXqKnTCeyAVPUfy0GNhxRZE
	xNHXCngJ4oTOgt/NmFGUU2O2WcDvzSP9GC9pk1sAbby5x/VsXPg10xFCL5KNYjoOjnFTBOLhb9BRe
	83J9bbPP89x+6s298Q8w+vZqREw7mOSOToE0BKAKNhqmfxlys5XusTOqzA14iXytaPPU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRa09-00047C-89; Sat, 18 Sep 2021 13:03:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1mRa05-000471-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 13:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d/pQ75Ibqicuv2+yEcpDrwenIImXMQuZJcLkbz/TKyM=; b=egODcD8XAjrzX8mRKPVLpQ8WeL
 kWacvCSNXN7oAmpWsbIHC4HmLTq4L6Pu11D4UDX+977oMQjoD+AP3EeqWpQILwna8jx7WMKt214Oq
 j8nPW/WilB86dgVQq6SxGx7lrKn3HTbGEmjWm6u7C3i2K13CLhVMMoY+aLp64HEnTTbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d/pQ75Ibqicuv2+yEcpDrwenIImXMQuZJcLkbz/TKyM=; b=C
 whV6cBwp5QurnlFuGYAPeg6jUMoUflZXn8JgYv4bpflYVXUTW18MeDvWlqBM3V+rr92yyYC+jkEQW
 YpLugIoydDZac6wCbGDgG5VQQwSybKjgSfSJ7cLQHn1bgpJKFGXJchTVT+nOnfztT1DOqBUHnJa30
 EDbxadzFpvW42A+4=;
Received: from mail-eopbgr1320054.outbound.protection.outlook.com
 ([40.107.132.54] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRa01-00Es0x-BQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 13:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvDRguHIK8lsGw+/EuW6fOEwGXgQq+qa1R26fV7yVnCNboOO/xUUCIYM11VNftIdQtIF/vwFt4xNV3qDhGFu4U9NGRbw/SDsFUnnCNtaMOQIW4Z+TZtOLexVWktxUupwgu4r7EtAMNfEqjKyYb0oorb1AO4rrAMVBVMnHefMEmsv0je4+HiwULA8kcAMhIJFUcKXFPEZLFmPOZybDu6fCLJLJrECfam4qPBG44O87MedxGD8wNl8DFbbQDOV9cnzc5eXO7e1H4K+YNj2f66/lANlWfaM5KnL4GX4LrcZa3zuwH4P5MX3T+3K6t6uLc8uFEy/iCyMrc9Qb0U1H1GTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=d/pQ75Ibqicuv2+yEcpDrwenIImXMQuZJcLkbz/TKyM=;
 b=d+ONBH8wCHhaaIVq3Z3hr7vYm17otTtYelnhZcLgbXzA5m4ETd53Eoz31ov42MYRY+hoRMP76xoJDuZZ54cmKtDS2DjBoRJMz43vHB0FylQRtzgEskycMXAoF608jWA+XUH35vVOnDaKff2j/AxnYzWfXqkCLsTB20WH7SYkmx1OWhPAYgRFMNrAGeZCg4WYfwjFh9tkV9cSd4bmFvxo1Y3dT1394+yEqIcWHc1YV5K/MXzhXSc+yuvR1vUuIKvMwF1Qcn6RA63yf8yYllY5duf4w/OpdCYSOuEhskD+2eWLSnv9K318uhgeVM+3IQOMzY/1ceRSAJmxylnn/LyJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/pQ75Ibqicuv2+yEcpDrwenIImXMQuZJcLkbz/TKyM=;
 b=swi7Ca9XEHDYaJvER6BW7mo2uVTlaAaVrgTaWNzGWuGhL1mBZ1PiCr7KLHTfal2JcE8L9f+aqC2aA7tG2X+uveevedO+Y/eD3f6qsuC3LWdDhkF+gQZFhPHl1fWKs0kC3Dtf6imqkZBRIqvi7mM2ZxAgShoMYfOKBepmhHdAy8E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HKAPR02MB4276.apcprd02.prod.outlook.com (2603:1096:203:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Sat, 18 Sep
 2021 12:47:07 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::38c9:4615:daf8:452d]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::38c9:4615:daf8:452d%6]) with mapi id 15.20.4523.017; Sat, 18 Sep 2021
 12:47:07 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 18 Sep 2021 20:46:36 +0800
Message-Id: <1631969196-341-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: HKAPR03CA0029.apcprd03.prod.outlook.com
 (2603:1096:203:c9::16) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from N80263842.adc.com (58.255.79.106) by
 HKAPR03CA0029.apcprd03.prod.outlook.com (2603:1096:203:c9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4544.7 via Frontend Transport; Sat, 18 Sep 2021 12:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 117798cc-4650-402e-8fee-08d97aa26c61
X-MS-TrafficTypeDiagnostic: HKAPR02MB4276:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HKAPR02MB42762E07D77B3933DBDAD461B6DE9@HKAPR02MB4276.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZqwJnA8nuqrtZag0yyXjgvObPkfyolXFx0/Q7F+TeExrM9jZne45W/+/b2aC7+o0xtCRSkXqCJfyG0RlpjypPLsXXUEmoEy+Hr3FfbSP+cwenO2qrF4Geb9fKSiB6hX2U5jhO6NEx3jqTr13ybBZgO3JZ6NQPaYmLFitkpTAQG4qjmEVDXY1Kv4iaxhkTR+sQdKlzxenSz9id4zbX6rqb/TpQk0g0AfT9snrK/3IYwJMpj8159nI/lSVBNwN/+4xoNkKUJxZ9WHtZZu6wOXUNhaq1WezVa4TzwKQ+6og9savJKiKo1L0/44L4yrDiRlfqwbuXsYV1if9f+QVcvjOZlCPJCo9LDrMDtQ5m9fqjyazxMMbFvhWeqLozkbMymBFdGRiF5LETKhcJhDkc1++rANzWgkLnyca/F7KB9j7QUrLKru10aUt2urteEGvznarFkC2q9rCgF2a3kvZblIPiUYUSgJ3NSXlv/Gz+EPPNUNpcRzonFfCpVfSVUEm8WOBDLSRSNr7nyE8/bF4OwHvr8C4Yy8jXte845w065BK4i5WgAjpBZdiyNGcf6qFI9kb6VyGJnK0pShAAHlkU+PHwZM6oAOqaPgJ+X+NoDEVpjKRGjbKc8jTnNlHt+r5QGJZdPR3aYEJVGbD3tKnN1biaVHydvSblLE+U/vrWt2xW2aY31sUxu8sK98CxH4icdh0oS+EOgi6KszVXCQfFhNpnJVhd+3AddLzWxVSnE1jXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6666004)(107886003)(38100700002)(38350700002)(86362001)(2616005)(6512007)(508600001)(66476007)(83380400001)(2906002)(26005)(66946007)(66556008)(5660300002)(956004)(186003)(8676002)(6506007)(4744005)(52116002)(316002)(8936002)(4326008)(36756003)(11606007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7GyhEh+mwVZnRkC1kSa6FmcyaPZJMVSgKiX5ZAkAf8RXbXdG/8zedxVYu7/L?=
 =?us-ascii?Q?tTwKfj3l0k+aQ27Vs7VxdD89oE87wfOPS4s18rMgxjWH2aKIXMdH5vs+7S5C?=
 =?us-ascii?Q?FiT9gacbvRvXprM4w3cOBi9w0DH4ylP7tjerhgOIyGfb6mqiqsiRTq3Ah6Fe?=
 =?us-ascii?Q?UQPNTBEAXJ4RULCeLl1SsM+vyiW/rMSvA3GNX53UkS0JSLL759zZ80scLipq?=
 =?us-ascii?Q?tk4oxMbA4SXxSJPJ6HYZpK4gJoY8hEfg/Qba0d098iS5MBnGnxtnvNduylzo?=
 =?us-ascii?Q?4/47QCkFmsfuW0iPyMApojNCBqAcwF4xmC+nAxu+zT7Wq87LORHMlVn83yId?=
 =?us-ascii?Q?8TH7w2mz+yYidrUOElQ+RN9e4RlpNmUyW5SDC12FF4eQOj85oj95xpm1JfuF?=
 =?us-ascii?Q?Za2dpC5sBWrTbfieYhjf7nR7+X1NTpcc8M2VtTbOQoKgl5HnULtr+MGFxOWR?=
 =?us-ascii?Q?N6KaqWFcny8PvrP87RE7lgWCd1KmpKAUHYdadW5muNBprYRkCAvt8wLajfux?=
 =?us-ascii?Q?zeyop/gRe0MygtSgvwuRetDY3shU8F7Qs39w3/MKOmJqdfwb2zqv9/vSc5og?=
 =?us-ascii?Q?C6Mp32dUp3/lFBdo8QLLLInorGNYTsK71WwYCSNz1npeL/5/gNVqPihlRKmk?=
 =?us-ascii?Q?LrVQekX7H/oSI/gDmhLLwqlPlzE2t9hEewE/pH8qadwNgKG8Z289OpzUqFiD?=
 =?us-ascii?Q?rPYVQDQ5PhchbptOOiuR9b4hqrhvROp9OhuGRemZIPjt3Xu3RzO+cgz1jJcL?=
 =?us-ascii?Q?IpaY1+vGPTp8ej4Wvi7ELO5y6j/860gioa76zrT6hbsv7Z2MIiTh3pj8uCCy?=
 =?us-ascii?Q?AkixdMMP58OAF6472V70MdnWXPeTqQqSZ/DmvVBm5HE+uoh8gwOUK0BoNZND?=
 =?us-ascii?Q?W9vw8pE3s2VN2I3fX/Qayqzx47r/JabbgF4/j4TvR8AsZnhH8290j/Wf+Obn?=
 =?us-ascii?Q?6GZlUmC/O87FFqA/92pubo5z6pN8CleKMJSGcq0fWeipzt6ccneCRutUHbnQ?=
 =?us-ascii?Q?wcMv5S4mfwpVUTgMd/vVKy6yq+r0+WxQwxU45d8kOKXpSHetcIGZmW5NFZOQ?=
 =?us-ascii?Q?n4d5KvMp9PqQ0mIEc7HIydJRQM5n6RAGB1NyLZaVtG3Tk2TGScr/STmfStyG?=
 =?us-ascii?Q?HX+PHv41fnjfUa1HxOg5f1eE6iKk7cl33sowY1NQBvQyjlzn4kmbOAVPWB8f?=
 =?us-ascii?Q?4DG6G4X0rVUsO2Z8EAYx1CE40iOM37F/hNPXC1DV3L4RECV0zVeseSUyn9bo?=
 =?us-ascii?Q?rCmI8AfAJyUTT0HQBGbrOpdINnoElomj3F8/Bz3Oi7z4kaSiqvyThgBucLpa?=
 =?us-ascii?Q?UGBfUSPPasf+KIIJaNABmgQC?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117798cc-4650-402e-8fee-08d97aa26c61
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2021 12:47:07.3528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ASycJdeb5/sHN+K7zAKmIpeWna14FqSdTtsVyzOocKr4pGvhvOWyXErsEVqxyxequ/0jKl/S8P2I5oUWTnZww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR02MB4276
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Inconsistent node block will cause a file fail to open or
 read,
 which could make the user process crashes or stucks. Let's mark SBI_NEED_FSCK
 flag to trigger a fix at next fsck time. After unlinking t [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [40.107.132.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mRa01-00Es0x-BQ
Subject: [f2fs-dev] [PATCH] f2fs: set SBI_NEED_FSCK flag when inconsistent
 node block found
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: omega@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Inconsistent node block will cause a file fail to open or read,
which could make the user process crashes or stucks. Let's mark
SBI_NEED_FSCK flag to trigger a fix at next fsck time. After
unlinking the corrupted file, the user process could regenerate
a new one and work correctly.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
---
 fs/f2fs/node.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e863136..556fcd8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1443,6 +1443,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 			  nid, nid_of_node(page), ino_of_node(page),
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(page));
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		err = -EINVAL;
 out_err:
 		ClearPageUptodate(page);
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
