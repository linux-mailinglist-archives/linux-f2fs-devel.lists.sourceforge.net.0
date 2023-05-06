Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 511006F91AC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 13:46:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvGMV-0006hZ-Qz;
	Sat, 06 May 2023 11:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvGMU-0006hR-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5YHgwLn/5wrJWVy0Z1QVprkWIGXGOoE4Ie/z1HD6PH8=; b=CRGx1/fjEyYy6FvnhKzHE3wtJo
 lM5JRbIQPY41muZTROgIS3D8IfzryEQh6IzNTlncuNdybPnx+ewQtqAsIX0IV0xrkfcuJFc4RMajP
 hXlsA3/PZdipFUqvzf4FPx0gBzl0h9+dMuhP7VmE4JX54Z8MdATQhy7BgOWVpYvr4oJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5YHgwLn/5wrJWVy0Z1QVprkWIGXGOoE4Ie/z1HD6PH8=; b=R
 FlJycFTpSrmoE0wMFv0wNwNKpD9yzq02nrFxRopbuGH5P8ZxljVaDYr/jCul8/j/SooYMlW+htBf0
 zetyZPZEvA5EakXR7kFw7ebReZV4nSDozafKWPpt+S/kM2aIc+aP3qrTm5ZUI+rbihLS5gfVitxUD
 FeswzEgreSo1gTh0=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvGMT-0005hS-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7czuY1W5O9R1PyuwDEQURc4Sm1dS+GZ/8W8BUE37s6Gl5zkQH9GUbUeEtKOgW5D0ZwVbgqm9ccXTu5K3WeYPNNQ+c+y554RzU2zNpcSztsO6m3o3y8LiS2o+QkxnGTEQyMQOL120kqx99tWE1EOBDP0pNV9K/eVxVb5xF05Vq6C+HxB5j/PxkcWcP/XJWw6EjFF1WdWv+rsXtwnPtnIE0giKuPnqDp0dHvC2IMzQMr0JHE0oYsbQP8u+sYP+z75iHYDWkkNAWL090qd8PJWbGcbOYNqBHIIp59Ho3CoJ0DKiVrVgdckHxoHcaKgQ8GJsotw5BQARD5xAXL4rxTA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YHgwLn/5wrJWVy0Z1QVprkWIGXGOoE4Ie/z1HD6PH8=;
 b=jHfHv8kyE86L3fhchDxsKej/+YtMTf/Zljowp/2NtR5Yh3dm5oDIgWGs9ElVNzxb3W+O22jyp5K6dgoaJgqBpMzvW3+C14mw0/lJx+XSjv5d8CCaD1GKkeEtfkS1UF+cHEyJYdeWCy+nvv1YarIfpxVWvaueqzu62ijM6WsFYNjO/ZG7Edvl8RBzt5vDsT3dmtGm7pON/NZBlcUa6M9N2gZg1A8oj7pdfnmaurj+pNdK1jLi1nEqjlYKHnKPTW5tuefyWy0zJHjQsGTchIqLi5LpBBTJPyWp4F4hUH6Dl1IEBVijHvu/YcYe6XTw9Qf19D+gPb67OIP68t3iUQeIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YHgwLn/5wrJWVy0Z1QVprkWIGXGOoE4Ie/z1HD6PH8=;
 b=RMDx9kVTkcogOExd38W5N31WiYOlQIZeUK+rvdN0ktbt/+7T2VdlXSXtT37dEDFT5g9uxuSrCoEWscellNQenxnOmToXS/qxZDmEB+40t2gIKKQUbCpQqPhCpAy39RQMgfWI6Y2bzOecaOV47r/QBtRaXlM/wBXuvb9sQpvrOzHtfK+5afzDn9/dvodt1NnpHCd2rAMt3H2YLmyO/E1qaCut5q6AiDCivSy46n8HIb3//4uR68S5+s/UrNoiZ9mljWSyBKMhgA7hlaTG/QS38/Bls1yYUNZ/pnHGHkDKkgDP/mlZegAh6oPOytw6QOhx5EAYcIIgWy0XAjYgnzMpaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6010.apcprd06.prod.outlook.com (2603:1096:101:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.28; Sat, 6 May
 2023 11:45:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 11:45:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  6 May 2023 19:45:36 +0800
Message-Id: <20230506114537.49470-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 632dbcd1-602b-411f-1d1e-08db4e276dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8yCRapwBdogWRf9Hqv5ixNIX05K5xAr9uCRloJHMyqjYBfdDC6O4MVJz88XY3x2jyYNE+pK5jT7jjQYIHWIPF0wg//v+vNFLWFI/+qwcbT2i6pS8HwQ/5zPsTBfVhLYOFk3969bNpa0KZxNF9obpr+3KRTODabBDjegFB5025EWb36/Xy3FP1vvPNpv4vnXgK9ob5Qje5SaGtoXx86ZvI4k5kdl13Lml9zgue55dzBOcDawNugyjNbUZWH/J3c/uncDtpF8zbDAQu3cGID/pwY8Fz/hrvpVM0dbPZsmkK9RA3TUvbLiHcJEcwlZh642JTPL99SvZoGeXDUMhiAX7gOsYSl6qcQY6mvq9hQgg+p76yvGM4PZkMfIUMXQ4i3zYZHDBxxcMlyzL0Lh+2Tuf1QeMmXPbkRsiY7vQkKraUXM4ey7rxxqA7sEbbSXodEbrKjso0buypOxb8z9ciELRVI2NCDF+Ix1jQPpqFAmVaa0AKOBRIudOf6OM/7jxGUwrE517BO2sIF3CrWv518bIel+I/a/cLymKCKbLK/BFbvyvuS04KAXZDLTIPmnfz+4pp/tQGk0mhpQRJ6ZQyJKn5Cb3xMo03gYhiOJfknHEdm5nGgvIiU3npLDuzSqfVPc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(36756003)(38350700002)(38100700002)(2906002)(8676002)(8936002)(5660300002)(316002)(86362001)(66556008)(66476007)(66946007)(4326008)(41300700001)(83380400001)(186003)(6512007)(6506007)(1076003)(26005)(52116002)(6486002)(6666004)(478600001)(107886003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cR2HOkCUsZ7ZmCxY+iMMGAwGwxr5z7OzMww4fQEYRzro2PFRdim2URLs5OTg?=
 =?us-ascii?Q?7/j6naQJyHjxEJC+e2p9feSAKpa96LMBZUvUoUL4Q/xG7kbUecQ/KTxqlAS2?=
 =?us-ascii?Q?gN2uizi3qp+wQS0QYtoF0vS3JTcr/kW77IQCI07Cfp0NAdyVOpAnqDBb+5Ov?=
 =?us-ascii?Q?FiHSu6cnTPXuoLCZ/CSVIXSD3uSjv+McUPtruX+noVGNaDVJJPV8cjBBc9m5?=
 =?us-ascii?Q?5lkk3GRqXWese3RhFPYq8GfMQehYueD5fJdnJVNvuJA0r1kXbBbzSYORXjuG?=
 =?us-ascii?Q?svqxkdoeFhmN8lxi72bmPANRB8PNzJD8WhR/9WUQjdTe6gjWwXNkDjiN+1Au?=
 =?us-ascii?Q?njC89/Ckf3MSREaT8OSBREi6oBGVzisFfSGnGd+3JZhmvD/er0424yXxuJKJ?=
 =?us-ascii?Q?SxpQdncgRnfpH3sGxa31FEpq1y56uI/pywuaTJyI2AckP+6y9G43GSssqLHh?=
 =?us-ascii?Q?tM+0f8tj5f7j5PAxe/9vALqmcsl4njLofh0qqrAL1D03V4mBn0wIvy/03aGv?=
 =?us-ascii?Q?QGGtK6ecadQTi+1n9NyjtgrwQ8PljFoRgkrR60Py492DsxJZ34HLRTF9jjVi?=
 =?us-ascii?Q?aJmkA4pqi5sTL+Xb5VFaN13r7pKV6n9ACRkbe1qIBiJ+exdwo/eJ0Bg0xljg?=
 =?us-ascii?Q?NSDVjJnWa97LybNIcwqP+NQxbeNxf6/Fu/ot2jdky/cp9i5ZTOKsGIs/K069?=
 =?us-ascii?Q?39iLZ911W7NHyMe4+Iy+JMTlgz+ZcC6kEzaovewMYsckjGoEKT9ocL6J/w1f?=
 =?us-ascii?Q?dHpvI8jXghycyTWoOqKufixjDJCe6ZF/iFQCkUqi1JsnAarm2RBd2iP/Jn1T?=
 =?us-ascii?Q?zuUTaJZ61p+W8oSZrPW7OuHGPaUM4FTdoh+4r5hgvOwzvQF38oeBe8G/odB+?=
 =?us-ascii?Q?fan1CW46fH3Qq3Mu9W7SCthVT2hhsC8MAGLEn6SQl+GsFcQ/DaXZ5mrpC+gE?=
 =?us-ascii?Q?1WIVm5p8uArbT4swf3icr2L+W+kVVeAmHqQzLAdtBBzcKQiCpb6RJ7Rao7jh?=
 =?us-ascii?Q?3gMlhQN+3cc3VrFvyrM1AQ9RXF0gobRTYP0++2bsfH7XFhcSBVxVOxFk+veI?=
 =?us-ascii?Q?EwaQRB0WyVgPEGpLuAffyVFnMOKWMlsK7i2QFPnKtmNkz3IlcBH15hpt9nNJ?=
 =?us-ascii?Q?CecGipYb1m8RJ5nEcC8zeQoiGXD75f+O6TLjAp+MLnE8jR2yKQeM5G6I5PWn?=
 =?us-ascii?Q?r082wE5H5gQF+HfEfyKfFCa6ji+GRqLSDmZxqchYmpH1Nm29e5axUWSbblmj?=
 =?us-ascii?Q?3B3qim98J5LysfqpszM3pKSxKIML/jiYcplRfewePUpjYsBMaUL13DPrE9x+?=
 =?us-ascii?Q?lDt48sANw9gJ4/3+Y5YNNAo7Lz6QFkuxSCr256tFf4YSciALS6dMI6BWs0sS?=
 =?us-ascii?Q?TTBPTwaP+SmxUfl+Yqf/T8ataeje+HgYyb4cvg5ov8u10E7S/XQrKA/PGWWU?=
 =?us-ascii?Q?z9+nlyHmRQZaRNJlil6io6emxgVYqEOSSZ4xpPrGeB3HTZZD5vOpPY9nnNtr?=
 =?us-ascii?Q?9ieVHkcC5dcWy43ivmdYDud95o2ho81c6MBlmG8V5dKo47P6SETurzfmeACZ?=
 =?us-ascii?Q?ziRB5w5TJ0X3DVOIL30XvReYJ/rp8kdl2TJLhtP+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632dbcd1-602b-411f-1d1e-08db4e276dec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 11:45:45.9686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b8oHMJJsyHFJo7u0rBIXPfMf9p9S7/P7BQu7IIBxhxVGX6LHuG7mmIIMUeXFqRLFs+yhG36MQcgYJuane0cFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6010
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports a new sub-command 'move_range' in f2fs_io
 to move a range of data blocks from source file to destination file via
 F2FS_IOC_MOVE_RANGE
 ioctl. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- man/f2fs_io.8 |
 4 ++++ tools/f2fs_io/f2fs_io.c | 36 ++++++++++++++++++++++++++++++++++++ 2
 files changed, 40 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pvGMT-0005hS-NZ
Subject: [f2fs-dev] [PATCH v2] f2fs_io: support move_range command
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports a new sub-command 'move_range' in f2fs_io
to move a range of data blocks from source file to destination
file via F2FS_IOC_MOVE_RANGE ioctl.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 man/f2fs_io.8           |  4 ++++
 tools/f2fs_io/f2fs_io.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 13d4bf3..b25f807 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -138,8 +138,12 @@ Trigger filesystem GC
 .TP
 \fBcheckpoint\fR \fI[file]\fR
 Trigger filesystem checkpoint
+.TP
 \fBprecache_extents\fR \fI[file]\fR
 Trigger precache extents
+.TP
+\fBmove_range\fR \fI[src_path] [dst_path] [src_start] [dst_start] [length]\fR
+Move a range of data blocks from source file to destination file
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index ac7b588..126e1f9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1357,6 +1357,41 @@ static void do_precache_extents(int argc, char **argv, const struct cmd_desc *cm
 	exit(0);
 }
 
+#define move_range_desc "moving a range of data blocks from source file to destination file"
+#define move_range_help						\
+"f2fs_io move_range [src_path] [dst_path] [src_start] [dst_start] "	\
+"[length]\n\n"								\
+"  src_path  : path to source file\n"					\
+"  dst_path  : path to destination file\n"				\
+"  src_start : start offset of src file move region, unit: bytes\n"	\
+"  dst_start : start offset of dst file move region, unit: bytes\n"	\
+"  length    : size to move\n"						\
+
+static void do_move_range(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_move_range range;
+	int ret, fd;
+
+	if (argc != 6) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDWR, 0);
+	range.dst_fd = xopen(argv[2], O_RDWR | O_CREAT, 0644);
+	range.pos_in = atoi(argv[3]);
+	range.pos_out = atoi(argv[4]);
+	range.len = atoi(argv[5]);
+
+	ret = ioctl(fd, F2FS_IOC_MOVE_RANGE, &range);
+	if (ret < 0)
+		die_errno("F2FS_IOC_MOVE_RANGE failed");
+
+	printf("move range ret=%d\n", ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1391,6 +1426,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(gc),
 	CMD(checkpoint),
 	CMD(precache_extents),
+	CMD(move_range),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
