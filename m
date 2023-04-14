Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1D6E1EB8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 10:47:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnF61-00005I-7n;
	Fri, 14 Apr 2023 08:47:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pnF5z-000054-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 08:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmiIfDEtT74t8e2fmSV7V8WRr4jdFKauXpZDqr63Wqo=; b=c9aYguchsIfu0H7Z3WU+/WGF2z
 PAXqiM17Kcgo5bU1ZGx/KRxdrlwXBP7Lmjp1ZloqK0LSPcrzpSaF/mZlkCch2Nwehba1DD3HMLppY
 IUXsTNGDih9jIILP2rLwyb0Q+gdaC44oeZhJyGZIvOedmY9Ce3mTDJ/52wCf6YbFid7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MmiIfDEtT74t8e2fmSV7V8WRr4jdFKauXpZDqr63Wqo=; b=T
 AjbWQt+7R8NEJjGO1w9SnX70YM5f7d+6NZ+Yp8+PTmsyB3bzTXJtcRuwGd3uXuzn48QXdffpDn6+D
 BnxohWjIqq+BjQgt1yV/7PqBLAe1amHMRNq1CI2sE5ymOG/1/2LhHL8ufng6zMpa6GDdrTRe+xkY6
 yM1D+Mlv6dCxA5mU=;
Received: from mail-psaapc01on2139.outbound.protection.outlook.com
 ([40.107.255.139] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnF5v-007Q45-6h for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 08:47:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr6Xngp802uctWKsREIs0ie2sQbxGgwhSPOn9Vmgla+NYv5HxL7MWRIDNCjPDny8X/WEmQdXnpsVc4Itr8kwGRl7J/fyy+FEiN37FQxXM/6FE30bDG2YJ53+Akf0Uqychhwk9hzGGXf7Z3W/7TDEiWQNRLZDw+PzeezB7h+jJY0vGrS+PQdTnUO1PAzmOJvJSW2lnNwgtnowBoPwcmk9jj5qHr/RPsmAMHaQYSOoBnBM3GXW06fn1tdrry9c/+2oe3BjlSyKobZWLEuI9il8z+v8pyHPZQG+aMuw7NEf7tM2kQs8AULHxZwxMPrWR4F2UhyLbcdf+oGPCS6kivAgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmiIfDEtT74t8e2fmSV7V8WRr4jdFKauXpZDqr63Wqo=;
 b=YAcNjDosvscZ6WGFhUv2Mu91xltco4zMG1uDF8f4J1gZgNwDzGcHo102d7QbO2pDO1Uf/iXWYqc/xyJ6O00fvAOAI0qfIuZkY8XGbK2k6u2U0K8dFkQlK5WWC1+621fb9nWRadvsZ5gbbltM3mYLRl4rjgebpFyLFfW5FfjOkq+AiowEd53Ehp9LqaQ+P6NmynWNg4FHK5qRprrzpEL2T0e+hMYrC2nObh4kyo88P4RZNtAc2QhMM9TxJUh4VmQCuisOaPtC4XvdcSRuBXIcNmy05mDtcTkt1Unuo0wS8y5/CTPS9TtSGv66M/gjkL0pjvb3+sqsQlNOXvOXKOJ8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmiIfDEtT74t8e2fmSV7V8WRr4jdFKauXpZDqr63Wqo=;
 b=HRdCD+AwLm548yy9cmmlV8MujOO6ykkzjsqLmI9PyelPIV+mkRx7iWwUAVdLNs+XKT+q83QRwUoc3ddQQ5i8Wp0k+V1CwgJWGCE9IYSx2GwDeOM4uGLDPcIMGwDuSxrKGcZkt3A3dNt4etQBOo4E/TNBJljDEOaW3zzb0bxrq3iwWqX6n+rHfcGgFCdbB/m2/+9ZzWWnICT9C1xG2NvuBuhOPRsSfWZqj5wkScLQ049WofY7E+x4Gp0kQv+PeIYPKLgdu/O8c30OlLZuuMbRq8Jdr6YBqbkww7/Nh8OnwK0YskhJhEenO4DbSviLNorNYfMZSQEpcKbNlWxAy0Tw7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4470.apcprd06.prod.outlook.com (2603:1096:301:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:47:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 08:47:38 +0000
To: jaegeuk@kernel.org
Date: Fri, 14 Apr 2023 16:47:28 +0800
Message-Id: <20230414084728.30534-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 322d30fc-5e3a-444c-ca8f-08db3cc4e69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2t+To7PeTV3AANfuWAswFkEbzYfIOrXloDVBNd5vPD3z2pdJg9+bJN/VY0VP5c2fan9u3f7mKMTnwxy5hKBpbSGpI8vVDG5zb1yc+7MCszaAsw+m4oSCAWEZsn5fmS+EFNJLueGnPq6dUgqw2FDRRM9lMLKgIACfFyv8F+zCGPdwTXF7z7ILgFxiaz7a1abQqu/zu/uo/R8EBdp/jtrHeazFy2BLpjuJ8PZ+zv4cLcpL4EqKkB0+4cpEDxT6/qPER6h/W5bGztHOWSdDshRptzLielg2u/sq9aKoh9NJ3AbLTM2qpL/FCJJI9D1EIxspqmQ8nIgEuFJj9TumJDvE9EIMYNSiy26+wg3aP8zVyInGKNvleHSCzCsdalPDb6KICG/AA+ttuZ+S2RD5HGEm+1zMfT2XSA2X5EYCoIchtpgiJarQHaCmba8ARp6tAn3qK7DbJ6vigXQZhSn0ZkqZpOh78mQk0Zb3hTnBRZjc8Egy9jOGLt5x9/mpMLrzh7u0xNRfhwRnWNQN9WQYO2yvj1HxqtJnb1iwFRY6ip0NgCmPhhyLPmJetFlENhffxldAs7D4jrnSrkxtvpbg/ooVVxfNKpiNhz0AdjcKDkrqgyVdepQ1ov5HUU2I7xg9N+K6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(8936002)(38350700002)(36756003)(38100700002)(5660300002)(2906002)(66476007)(86362001)(316002)(8676002)(41300700001)(6916009)(66946007)(4326008)(66556008)(2616005)(83380400001)(107886003)(186003)(26005)(6486002)(478600001)(6512007)(1076003)(6506007)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVkCa12LnPfSdfebETk7Rps98HMz82YHGL9y791wuSiMMUp3sg5Q+EJNS1Db?=
 =?us-ascii?Q?QQ7fhXttsckp1hVlamikVlzyNwXvlHN1sRZQWm7Hp28xZFHqfWoN6ciZtknd?=
 =?us-ascii?Q?qvfErHpavJDZb2zW53lPHx3lf/i2RLEgXbog60SuUExxKY7JeUt9oYS1yTcG?=
 =?us-ascii?Q?/MExSq7HvvQB5RbastLC7eORfGpjJkNiNXv2m9TmAq/P8+oTh2EU04+JknU2?=
 =?us-ascii?Q?USc2ZLfJD/HwEtH+mdwsIrLY8vXlyNDFZpUBEsDwWaduW41so1Jq9Or8g47w?=
 =?us-ascii?Q?e9WB/3863OWOL30iRVt8agQHgY1JAwZBQNUapqlW9BzCF84Onc+7dg/vkIFk?=
 =?us-ascii?Q?QUgkbv4p98T/KgmTF1ckMo4M9n/3kQ25J4oDlZ4HBC7GjByhesdAyEBdBriD?=
 =?us-ascii?Q?rCsM+J9575CtXLjNn0WO373EK26zC/+qlX61v7mxVbZXZ3gGPQ/zUiA94VBX?=
 =?us-ascii?Q?p9spQ3jp74m1ZK0j6V3nJALqTELG5Y0sA6CHCK/CaxboWJ0MoimMbCnu+BUN?=
 =?us-ascii?Q?kZhSNlJkVRN1bUVMPz6sVvIoMs0YyOJrkpNY0diMEAJwSqFl1KVXM1AQTRr5?=
 =?us-ascii?Q?lMI/iR0KTav7DTLSNoip8ZAU/g8XxugvfUhhx7Ws5nDH3zHcOqGMC/8cFH7L?=
 =?us-ascii?Q?YljkoEHIC2p9S+4geJiaAGUZHhBhWwxJhWQKF737b/Ij9ka9iBHKvbWhVOZw?=
 =?us-ascii?Q?9TkG2C209GUfERyVehtCK+OThcxECmtpmwk32I5A+3sTuZO1cPdNtqZCh1U2?=
 =?us-ascii?Q?QJGzJP4LcyUDeA3zuVIBxUr0BUiLlR20UfQ03ooLz1YaTdTto2ji4mGaR6qb?=
 =?us-ascii?Q?5L6kk9OQOS4VZjoXWLeG4droEdLofy2gosBGpSmKpjheE1snXcNqs/uq+6GU?=
 =?us-ascii?Q?ihlWqmN94BcCViclo6aBmAjd1wUMTq+VOUFI03KLhM+1fHkt49DkooUFi/hu?=
 =?us-ascii?Q?aCe3nKIkiTdC3mKxjkGN2qEd0tBo1xJDnFQl5jvYnSw3gaCKqHpGNvch3Z5B?=
 =?us-ascii?Q?vLVYLqRSsycbsLzU9T+bTVstj+4l7ablR4MNgbS3lu3UXyCvIvBz8mTGnd/n?=
 =?us-ascii?Q?dw3GtNGBMX5WVmFWD8v/ozrtobDjhUAn9WotGgTpEYYJwaJo1FucGkNA8/5O?=
 =?us-ascii?Q?qixaJKrTkNDDXv5LeT9FjM/6f4BKs37HO5zqSYSAGtZFFLaj5KVzDAoxeGmf?=
 =?us-ascii?Q?w01wHobIAsYbJiJvp6pusxXTrC8uf4ag0Gvwn6Tu0JC9UHRg2lPQQcM21d20?=
 =?us-ascii?Q?OaVAGUolxWdCCIpxdlYhr3k8So6ftj13cUCPAsYyl34EO6LEo0hp68qTlRnU?=
 =?us-ascii?Q?dnTB9o8zihzgZz6q5NVQDJQK9Oexl9pTMU/giMxjxIDOZfMu/eo8O9MOcZgt?=
 =?us-ascii?Q?g4UTZGvnZsA3zZO5Gdb646rN+bzz+wRVF6+H3f083ib0ACxlzE+5CTi8SwM6?=
 =?us-ascii?Q?n7E24VD/HLazyq7cvV0B39Ojuac+QfPBv+v58CvkvfgzKmTn9gkE9vape4ZK?=
 =?us-ascii?Q?toWx0jvRbt4ztL2s/Q7GbGmtEjOjrWO+lsZjX41JcUiBsNioDBreBR3kW4go?=
 =?us-ascii?Q?pzZOaoWctGM0YhRt6go+sHLVPKDxSUUmBCLBoc5Y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322d30fc-5e3a-444c-ca8f-08db3cc4e69e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 08:47:38.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWn9axRNvYGBiqz1sU4y1XGpgsTIAdFt2NaAYeCTAfpEwsxJmHYi0FI7Egv1b5hNjiF0KDBiDzu2axdXOZL+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4470
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports a new sub-command 'precache_extents' in
 f2fs_io to trigger precache extents via F2FS_IOC_PRECACHE_EXTENTS ioctl.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -fix
 precache_extents_help
 man/f2fs_io.8 | 3 +++ tools/f2fs_io/f2fs_io.c | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.139 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pnF5v-007Q45-6h
Subject: [f2fs-dev] [PATCH v2] f2fs_io: support precache_extents command
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

This patch supports a new sub-command 'precache_extents' in f2fs_io
to trigger precache extents via F2FS_IOC_PRECACHE_EXTENTS ioctl.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-fix precache_extents_help
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 33789c2..ce8340c 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -135,6 +135,9 @@ Reserve free blocks to prepare decompressing blocks in the file.
 .TP
 \fBgc\fR \fI[sync_mode] [file]\fR
 Trigger filesystem GC
+.TP
+\fBprecache_extents\fR \fI[file]\fR
+Trigger precache extents
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5bc0baf..e604941 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1311,6 +1311,29 @@ static void do_gc(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define precache_extents_desc "trigger precache extents"
+#define precache_extents_help "f2fs_io precache_extents [file_path]\n\n"
+
+static void do_precache_extents(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_PRECACHE_EXTENTS);
+	if (ret < 0)
+		die_errno("F2FS_IOC_PRECACHE_EXTENTS failed");
+
+	printf("trigger precache extents ret=%d\n", ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1343,6 +1366,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_filename_encrypt_mode),
 	CMD(rename),
 	CMD(gc),
+	CMD(precache_extents),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
