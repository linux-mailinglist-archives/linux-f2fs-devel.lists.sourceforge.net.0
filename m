Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F336E1DAE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 09:58:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnEKH-0000Ll-RD;
	Fri, 14 Apr 2023 07:58:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pnEKE-0000Ld-Sr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/ybrwAz6Tz/13jT02IvwGhtpXn1K99bshXLfE46fDc=; b=Rk7wUxxJpJSrlb1y5/cuUiHz4Y
 iUm1tZVoees3Vka3yceLrSozYeSZSgDLnz8oin8rT6QUpCJXNcmUwpaQfmbClpn/5Kp8ySBKaDKfH
 JRVHlCATC7subILKbZ9j0m7bWMzVphjyE9/8JB1yOL1bmsnODfy4s+F8S5O3VZpAUa8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7/ybrwAz6Tz/13jT02IvwGhtpXn1K99bshXLfE46fDc=; b=i
 5p2vJIspSmO7Bg3rzKotptcUmrmrnYpNZAp7ziORanrD1ZTpHSkYO/4i+WKmvHDVLOaTCnhBYHSCj
 y9EA/0x3XehhA1azH28Ep2Y9aHiIbGzp4PbIExo/upzgMR7XPjwk3DfCAxP11G6iXWqMumMF38SVQ
 18bZtjoLmAMN+7Eg=;
Received: from mail-tyzapc01on2112.outbound.protection.outlook.com
 ([40.107.117.112] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnEKC-0007d0-1u for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 07:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltxjp6luat1gMN5ymRycs0AK8aIMVeg/ENdIiva6zuXNLcOCMX4ko23wlshXAuQ9FQoT6rl7+PgxzzMXY1Z4zlci88aWsuvm70wnSZcpkPA1xij1W3p4lNsOI9zOboEnwQoc0vf8vOUA4gBCDEDTBV624pF4t/jFM1nCNSvwYmUyH7eD7lhL3h17hhSSKNHhGSFVAqcFqosHXSe4lpSfs4dhMJimzMHWwrJYEshCnQz23S4nYRKfhzsSNNZi5jDCtOPX/3BrY0Dz0Lg5eBBFvhT412x/j6Kve46/ExsgLW+qDuHCBeEBfL4rQp5+bE5jqzSersnHuC2DwaeK8Ujyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/ybrwAz6Tz/13jT02IvwGhtpXn1K99bshXLfE46fDc=;
 b=Ej8QgtRPC6uLz6T6CLfV8dGCkq68Vo8iIVtd865LPz19exVsMULOnBH6F5xqsOIg3iIFSi6tUfn+hdOhU+HKdI+Uep68N0RpOFW5Z7B0LYoor0M5dgLC/PY8JqWz1scnzjkKF4Q+ZqlFFpUGSZLVKyBnt3jpOQZBBZs3DD6hNZkEYpzO+ilPncyvJzILTBw3gOOal4POC4jvw2zHpsQ48ssXzB0Q9SgOmmoMkm24sLYYe/iqQ6T1RKTg40FQCjZ3yd+yppRFTG9dcIPzT92GXnOxRJWhaAhH21iNwoJbBAWrxT2x12Oky9kRT4yxWwSGM76leiRHS7Bnm5GTlLBShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ybrwAz6Tz/13jT02IvwGhtpXn1K99bshXLfE46fDc=;
 b=UqVADyoCFXgCS/Gj1gtKoGbH9mIbw2tRnUshMCphY2MtGNgOjKfgW12P/7b6sVC3yGTeFUnoYMt9HfMnZly0BBOyPfV2KE+1ss3ewA6Wpzc4Fcz4VME6KYmttIzgJjiXHV0NE78+oFN91DwkQy2xfxFU5i9NppH71z6pMCiwpSRjMLZemhlw6iEqTC8T01YBz0kSebGbgSTqimI6+iKFwuOrlH4s0RjLtjtgiuNvSAAezEJ45mBVG7l38PTPhm+a//+DFtls++pgBmgSNAJh/HVqc6Tj4msfMNX47/q8GSz25xmZ25/hZ1DqiIjrkBzYtI95pho+McZl58Zr9YEMpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6053.apcprd06.prod.outlook.com (2603:1096:301:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 07:58:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 07:58:19 +0000
To: jaegeuk@kernel.org
Date: Fri, 14 Apr 2023 15:58:06 +0800
Message-Id: <20230414075806.80266-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3d0edd-49f3-4787-5a8d-08db3cbe0299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPKycp5j+9rQvcPDWXf13r82TIsZJ+b+DDQCrGP2Yh2LlfyZa3SaFDI8PSRIvEzEi/qx3OVeE1/mtN7YdyIS2rCq3JPFYmrTem4MfFzvhW7HfljC0U4BIGNp1GmS+Xy/BbSYJnBORMpx4hx77aFjN4f68DoDfnDAl2ZECmQ46WyzUb68TV/fiukUIVn7G0DCvPrmV6dCYr12RETDRCc7Nnq1ZiL3KCnxbU0/h3rdTQK8EEw7Tm7Bq00PKhv9VZwddwCw2IYElHtk7unP5Aa1aNOt0hQacKi4oOS3pxEhTPxJrluYo9V2TYy64E/sGyvJDZs6nI1nnjNy37vN8vqvaifT8jpxieD8Hoc6dK9i3QAskpjyoUz9H412xEsa8Meu2mUSv5BbdywaLmvET+9tfE9rM3IrJ3xQTwRzMYNp/I5td/QGCFwZSWuHFtF4HZdE0K8wrcQUv0gyeJ6pssBCiqUkVh4JT7ag0Eq3kWrnKsGYSgrPdsuEigVi4cUhQAP/YU4jjUO9OAgO95HNPGmYqDKqVWEIHc12cWu2rb3wsPwXbgB4675HaCavynl1ScV5t0tXytuO/PM/U/31wsOlwYnN/Hpx0ubxoYDZexveopeBpfWdn143p01A+IZ3dDi+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(26005)(6512007)(6506007)(1076003)(186003)(83380400001)(2616005)(107886003)(52116002)(6486002)(6666004)(5660300002)(41300700001)(38350700002)(316002)(8676002)(8936002)(86362001)(38100700002)(478600001)(4326008)(66946007)(36756003)(66476007)(66556008)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhpagyoeWxmPjEDfNZQ/Py/9aEzjXwPA11EkxSVy2k7ZQFN0wiq7D7iSgbMp?=
 =?us-ascii?Q?9TfuPlbaYLHzRT+zfwDmFOLHeeNytOkAYT1uSJPzBLzSAogZGaFbQJWXo28y?=
 =?us-ascii?Q?WoFLFNC88IO6Dm/O0BL+355mZGTjg5bkMrLTHT9eEKIuHzrgNRYENRTz73Iy?=
 =?us-ascii?Q?FpEn99HSBV4vuJsoKPM0/nyZ08C9VvBNNCOphm5UtbQMkEZPZK2hIFtpLR+1?=
 =?us-ascii?Q?iGi7VDba0DoiDS+oeyKmkWsgYxZkJln8O2NG9rBAQ7DpwPuUXoZL+jc6Q6Ze?=
 =?us-ascii?Q?y0dbyIoBw3sUCTJ8180yw/JjE092mLSvAg5zV9r+CaAgpiIP2uDIHTLoBEgf?=
 =?us-ascii?Q?oRr4q3JRdXCH7InSNWvVfUF86LVelFVCE1GPuv/Y7WJMh5fmTLj0I/6PzxZK?=
 =?us-ascii?Q?651Fy1xkkY50j8kKk4amKCYHlJeUGu+45/3/BLU2FL7QYS8vvBJfsyCXzcWb?=
 =?us-ascii?Q?QXu1KNMUVMSsIjHsYLCv/OpSbZIKyoCA6hXJkwk7RUokMh720Oa4kVIT+lqp?=
 =?us-ascii?Q?ZNFuqQtQ2asSVQ/OVmpFM2ehVOiYuocHWHg7tuZFWhVVq2eu1TQ6TMr2EE8V?=
 =?us-ascii?Q?xwdTtHMU1lC5CGjgl5rY9j2r9WKj/E+DkzcyHaqPj/O4XVaxJPy9ROtPoflu?=
 =?us-ascii?Q?Wll+uGbCJ9qL416VaQT3O7bR8pnKjXfIPsg1BEpbTDRrPpwX1/N1J6F6lA+Z?=
 =?us-ascii?Q?R9XTj3PIasZmq3KdERfg+yFB4vBTFmATwmf8NH/giPDo1AKiwEFPqOJuxTHH?=
 =?us-ascii?Q?vLXyx/DBH1oyyqX03cQ/BuUtyQ3hgnBQ1VKygEHsxxWkoT5RU4K0Ouf3r21u?=
 =?us-ascii?Q?y5w7gEcJtU6mWx+7TlvUItYGEIzNfW9IvhYUivPlcUH4VaUxPhBq+jOpZe73?=
 =?us-ascii?Q?s7cihVvpad3H4adniiMvI7YJ2zpUGooG7kDVO5QSFp/yUWqG08JKcRFyQpKj?=
 =?us-ascii?Q?WqxU0/PJy1Av8UaEjgEZtlygPWopQbdRvcHAwdWRfMfeZaBwFUEv4icAPwow?=
 =?us-ascii?Q?kyX5bqUqcF5YlmEegb++RaNvCq7tN0/uunus5J6vZXNmJpE+4f3pk6vTltln?=
 =?us-ascii?Q?798jDAWiE0KxU9gPA05wRWhBE0ahRHt4isiMeFC5LFjCxg1e+bjrnyYLbrJx?=
 =?us-ascii?Q?wCGmWCHqoLkCv3RsbwAB3NTNaCg+EIYgsQAWNpbqh1tKiB7dqd/4oTj+/+lS?=
 =?us-ascii?Q?Dwy1mWJp2Z0oDu4qB5qnrbBy3oPiFu62fN4lazDSM7b8kn2BD9lkOs532BWR?=
 =?us-ascii?Q?FeDlKCtwDbSIrugzsUML2HV0+B8ZXcq5Z3P6mVbrEVI+LZ4zVqrBFOG4uZqR?=
 =?us-ascii?Q?+pDd4vrgbEcjAA2EHD4TvdVp8DS+hCqOSDcOYJrn66jDEGjcQxSxkKGiFjy6?=
 =?us-ascii?Q?YTusU7bKd0t0sr+JPvlXJeTD0mIQk1BERW8J3fl6dHmf9/9Kp4hRowlLbdc6?=
 =?us-ascii?Q?uLESQ8J0Dd/tuIfN/as9O4D8vEVq++InTArwKuxMtAmfFPGBMI70YEXsl7iW?=
 =?us-ascii?Q?riUw1ifK4tPqMzcFnl3392bqMzrGBksD7Z3987f5VksnJA6wQPnya0P6Qm+j?=
 =?us-ascii?Q?84H8uR6FqJjXK7D67ksG4243cr7g+3zbsqT+pbGY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3d0edd-49f3-4787-5a8d-08db3cbe0299
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 07:58:18.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aglgR3t5nmk4lJ6HpyDAyzvbSYM5lVYyrPhGGnhDMjKnCJCYrFfL/FnQ9ldumWU7SD+KTtSf4t2LkEsGTvbjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6053
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports a new sub-command 'precache_extents' in
 f2fs_io to trigger precache extents via F2FS_IOC_PRECACHE_EXTENTS ioctl.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- man/f2fs_io.8 | 3 +++
 tools/f2fs_io/f2fs_io.c
 | 24 ++++++++++++++++++++++++ 2 files changed, 27 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.112 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.112 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pnEKC-0007d0-1u
Subject: [f2fs-dev] [PATCH] f2fs_io: support precache_extents command
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
index 5bc0baf..4ea3835 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1311,6 +1311,29 @@ static void do_gc(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define precache_extents_desc "trigger precache extents"
+#define precache_extents_help "f2fs_io checkpoint [file_path]\n\n"
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
