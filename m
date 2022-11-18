Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8662FDDF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Nov 2022 20:19:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ow6tZ-0007ud-Cv;
	Fri, 18 Nov 2022 19:19:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ow6tJ-0007uP-AW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 19:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0K8Xu1V2IeXhlsCbxgPW5KlxxVys672hvPBIEjbj9c=; b=Kw3c6KgAKCvO1VqfHmDrr1L7Q8
 lmB0xXnSjhPWWDaZMqEJk0BDNLCBY5Thp6DzeqEQOW6QLdT5yLTDZ6LBjDW3XxLa26vF2WiiGleJs
 SSSWWDhWkNmcrH0GmnJ/mhdwOtN2qsHYmLM9erJ9/Yrvnp5FMHjeO/b0yst0+rzRuVmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b0K8Xu1V2IeXhlsCbxgPW5KlxxVys672hvPBIEjbj9c=; b=I
 DjNZZmqTWsDt9bkTKd2K6lu14QQWyJoNNoZN8gj0c4X1bIsGLiuj/CgVc7gyofCjRarzTCvuE1okF
 69upihq+rGOS2t+C9cLjcTydMxqi79OD2IxP92VsZHvPpKIHDUBZGkUOuO2tCgpNVyO++As8ZpmJT
 3P73ptvTh4r836rc=;
Received: from mail-tyzapc01on2103.outbound.protection.outlook.com
 ([40.107.117.103] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ow6tC-00Cooc-99 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 19:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOoTqHyDH+fE0nrTpNr5wAenX6JD8VgnDdHEdCP2JUpC0mwy+wc/iRXr3Dncd17FK/jwxWWzk4TI6veVVz3erjOoaYhIe6P27A/kpHn3lQplhisPTJmLNc2SFExvC9w4kVLY8THFnRZ2kij6eqUFTYS5vE0gvyGI/bVaveUjpgEQ5XjPhMgfmrT1/ewvGFIVUuusrm0DZgEw4TtQoZFbSf0pw1BAGO/+Hs/Yernyit3RagcX3A/IhqfBjEzYsISH1tX5CPPjcYrUIOzjn7YzAxnAX6+ROA9XZOo8gB3yUk0cBXESrIWdAioBAvKJSm7lVkBbWtC2KKcbr1fHXWKkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0K8Xu1V2IeXhlsCbxgPW5KlxxVys672hvPBIEjbj9c=;
 b=kkEuGISJ9z7UIZgn85LnI8/tlV5NlCOPgDlXiGIbii/PDsfkx7cDtdtf4efRluAJx9DkaDiYITXibUg01RFzBTkmPxPiX5y2/5eS/QjUM/R1rP3n32UnYLL0Bd8gxvSazErLL5TX6nTR9HY4allMs+njT8PswszJKBVyO22oyGMx94f50LBwav2WjqAElxBK6WkDmLaF7+S4RaY2EEtLbKpyzwRarvKzJKLEQHpAIHavllQz+tn2SyIYB8RgmlMMJIk4/drvLA1QehtwbnZWh+xEk5pv8/C7MLGusz0fFhnUmO7kaIcRgfbdlujuQhiDpmBXAqswLpTGV99HqaHIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0K8Xu1V2IeXhlsCbxgPW5KlxxVys672hvPBIEjbj9c=;
 b=m+bLslvoAf285cWgCfiOlTNrRb3c1F4es8a006S7wG1B8PgH88RWge5mrf9qpB0wsO9PoOWaOsq9T9AX3PC0dKrYfai6+TaY7+4yG96CMk92GaEFiXyrrfOeDX0zEINwzVwmKm20OLzsTfJ4Xc7h/AnOruX9C7yOmAVcmNqVpX4/fpbYbnduAXX2Y4WSg2xqtE55MOEnRTp69JICerjqrg2jbsODykf2uJoKVsVpjWOFC8qJDFuY8+b0d50iqSvSybYkNe4uA+tas3cQPhLhGmjc/nPspcfN7pdp2O1gX3hry61lI6+Yk/QMlzncAA24h2VwU1hNWcu7x1GA2xB9eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5432.apcprd06.prod.outlook.com (2603:1096:4:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 19:18:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 19:18:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 19 Nov 2022 03:18:39 +0800
Message-Id: <20221118191839.76006-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG3P274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::36)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d313f9-6181-44c4-0e67-08dac999b8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBDOPmHO5dnfFDNxhvZli1cKJrnVeTjdBa+/sdtfxD2TzG949iV6grw9ddWgWdMcxZgVqKUCijg+HRwYyyzNVRyN3e4rbZYlUUit/+8aylRqWEnj0fo5ozcZxp8UB1iJPJZu38J/lPmJWTFLAyPfZ25MLK3panVQ0sgFVV52LqkX8pc20v2eHoqNv/ZNwruCWxZa+sHJsJfAhvz9KXbC3/Dpn3pVClEo+fM94DQrd7zYFIKQ/vgIVO3FRWz7K+j1WsTbksjEc3ICUeonZ9kOIQZDrwSGNv1ev26aMG/oNh6Ca8vRI9h4d4ulKVEWwYk5W1uE0On8nUsONjNmN3If+pKZPGKr+2LvAJpveZD3oa8I7q4G04c/6lFvYFnZC4i96lqMmvcsfEbs6MMBuJllAVmoRe9fCWJDJwxZfzrq/gLoVq4Vegu0dlrr5s1RnTUS9EGSzjV2+J+UhzZwfObGUH7coJuEILx86FRPXnJ+ipsvF1LT6SCt9HOWUlpj7J2UgFQHha5bf7x1e8sSO6RQaxkxJaTx0hSuzSY/5lsNsYj/nbnMDKjddtmwqLrVgtYnSLBhk8uvXwmQ+6lyDzqgBtiqBjDfS4pDGd5pBJ8La45vq8adqw8UkAS3US9TrqV/PW+G8scCCzd2NZnn2yFroBw65GX258FWL7xskBza+/UK9bzbfhU4dccZIbclTU4IX9nIox2jk1a/pzq4kR0Glti2pkf+bLks+yBgzkl2YVHWC+VMeB4NBvZpieunCL9W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(107886003)(52116002)(8676002)(6506007)(6666004)(26005)(6486002)(6512007)(66476007)(4326008)(66946007)(2616005)(41300700001)(478600001)(2906002)(66556008)(1076003)(8936002)(5660300002)(186003)(83380400001)(36756003)(86362001)(316002)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWnuX1mZxrVNMk2cRpkOZ2kQO4XSk312m6Xj2MtSXrKW4gnWjd/TBQ4XK4a0?=
 =?us-ascii?Q?MXSvKecoOK99LULk/TbAvwvx0RSUV+3b0gmDnNyICeFfq3NO+2U3tL6zzj+A?=
 =?us-ascii?Q?j9AQv5UJYtaZLjD55fFhmiFqhbWuoelrLJPuQA7Wgo6cfmLo+wyQqOqhv9zE?=
 =?us-ascii?Q?MfnWyl9ZN2HYc+MANYortbEFAT3/VT497Pg/DgUibgOf30lrLRfoxdETvkbd?=
 =?us-ascii?Q?n88PUKijsOF2zacet/iNA596SMwEcArc0e7Snz3PJy+ICWadTnKtckWry9LC?=
 =?us-ascii?Q?Lqin8EflOMZEt7qbI58K53gM8EXSN329fWWZwelVAmEGLkOH1V8E2Pde1/B5?=
 =?us-ascii?Q?8x4JxGeokj/aZNCtqc10HW2mmlEsJTLb4DCJY6af7zpkKNR+nN0QmJx78w+5?=
 =?us-ascii?Q?95VL5btEImjdUiL5kiWfPXCRYqIldVVlznC2tw//RYeyCOl/xIbW/exbDFrf?=
 =?us-ascii?Q?bQ2QEblOZ1pGWHQwWk8rZ51JRtZp4Ov4rmnpGyTPlkuGRu9ArvE6XqIC3Rvs?=
 =?us-ascii?Q?yX/p3D7EuQilhblhQEIj65qZMvCWtFWPq85tuAn+HlS2qyKiHwMTyq1+9o8B?=
 =?us-ascii?Q?Yc+Fg3zP9zidi4k60uT4dvqQhKJPBcP4DYGuW4V0XL4hYQtAs52SonDNrtjM?=
 =?us-ascii?Q?PLMaIRiNZ+aDPMxPhLUlmS5jrrxa5l6ZCDy8Wla/wJpopHeaiXt18qMX0v20?=
 =?us-ascii?Q?kCyN4N5jcVDNkkOdTzUSGbECmRgoLuT7NWfoefLyYZg22ac2vSkpVl7AxMFl?=
 =?us-ascii?Q?Ny7ChEdQcVOgYQomeGH5ZVbCAiWLAZLOYJY6qQYSmmsQB82Jm3IqhTRzgJYK?=
 =?us-ascii?Q?aypg3ufFStx9JP4+WAGKTqhR7LC7WUApdtRsXiW2b+1b6IODALP+to7VZspf?=
 =?us-ascii?Q?rMrf8XPC31JNHMkFTTOqHvAwaezar8Bq0RoxWyWUYKMAAw4V0Hx92CbKPAsz?=
 =?us-ascii?Q?ujNsCXOxNmrpqMlINYrQMv1bur0CndHF/O4ymgDgKunhhywIKexSz2D3QcZN?=
 =?us-ascii?Q?CaZxLDxz1+feUr/t4BT3oGzEcGbALYl7uNwSG56Z6GeT/AwrH4ZznqpFSOHY?=
 =?us-ascii?Q?Tgi2OOZjm3AyPh1uHu8hQdF2aA02gWV63EJSyZgQWCuNIsuV5eBVCjvG34aL?=
 =?us-ascii?Q?TBzvTzB6Bkwo8IS8aLS5PumJP904DfP3l46Hn0bvN6MzWTr6MEtMjd5RZudV?=
 =?us-ascii?Q?QxAzL7xDTrfE33K9YAHPtVCEHNGIBvexqgIiGBLNwNF/XxziZWv+ouvE7ClB?=
 =?us-ascii?Q?R5ehWUoQioFRjWdtnLc7sdCECjCnKQjEDu4BUh4QQqc2wKGjFUDpXGWBAYbG?=
 =?us-ascii?Q?OhEtVBua0NvBzKgORRqHgPuYOPd5Hkynsfa14cEhMBVAsaduioHmca4UTdgX?=
 =?us-ascii?Q?mDU0CpzeR6WtYrNPCwu8srdIx1oKJVWp4W7zgHKzFWo4rodPF9gfU+gWkf/M?=
 =?us-ascii?Q?LrKoTf8WjuLOBlVEP+tv2/QsUnH/cCQ9qU+72Z1sL1Yf6izkm9Gy90q0fa9H?=
 =?us-ascii?Q?9RXMh2Zm1pEgfEyZhfjNbFp0WRTwkXXCh7teuBVn0H+D7nvBSoFLmBxhRo3M?=
 =?us-ascii?Q?364Oj72ugMaDYLdsvRAli6Tvn6OzlC7hESi4vR+i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d313f9-6181-44c4-0e67-08dac999b8e7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 19:18:49.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPSDlNIJxa1dt93W/oZZ8Rz0dt5G8lT3B2/rJK107ueK1Y4pgv2AHAwKxczawly2W8NTGhkmNpEicsYQ4EZ+3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5432
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: IS_F2FS_IPU_* macro can be used to identify whether f2fs ipu
 related policies are enabled. BTW, convert to use BIT() instead of open code.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/data.c | 22 ++++++++
 fs/f2fs/segment.c | 4 ++-- fs/f2fs/segment.h | 15 +++++++++++++++
 fs/f2fs/super.c | 3 +-- 4 files changed, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.103 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.103 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ow6tC-00Cooc-99
Subject: [f2fs-dev] [PATCH] f2fs: introduce IS_F2FS_IPU_* macro
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

IS_F2FS_IPU_* macro can be used to identify whether
f2fs ipu related policies are enabled.

BTW, convert to use BIT() instead of open code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/data.c    | 22 ++++++++--------------
 fs/f2fs/segment.c |  4 ++--
 fs/f2fs/segment.h | 15 +++++++++++++++
 fs/f2fs/super.c   |  3 +--
 4 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 560fa80590e9..e54be34cb39d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2520,34 +2520,28 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 				struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	unsigned int policy = SM_I(sbi)->ipu_policy;
 
-	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
-			is_inode_flag_set(inode, FI_OPU_WRITE))
+	if (IS_F2FS_IPU_HONOR_OPU_WRITE(sbi) && is_inode_flag_set(inode, FI_OPU_WRITE))
 		return false;
-	if (policy & (0x1 << F2FS_IPU_FORCE))
+	if (IS_F2FS_IPU_FORCE(sbi))
 		return true;
-	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
+	if (IS_F2FS_IPU_SSR(sbi) && f2fs_need_SSR(sbi))
 		return true;
-	if (policy & (0x1 << F2FS_IPU_UTIL) &&
-			utilization(sbi) > SM_I(sbi)->min_ipu_util)
+	if (IS_F2FS_IPU_UTIL(sbi) && utilization(sbi) > SM_I(sbi)->min_ipu_util)
 		return true;
-	if (policy & (0x1 << F2FS_IPU_SSR_UTIL) && f2fs_need_SSR(sbi) &&
+	if (IS_F2FS_IPU_SSR_UTIL(sbi) && f2fs_need_SSR(sbi) &&
 			utilization(sbi) > SM_I(sbi)->min_ipu_util)
 		return true;
 
 	/*
 	 * IPU for rewrite async pages
 	 */
-	if (policy & (0x1 << F2FS_IPU_ASYNC) &&
-			fio && fio->op == REQ_OP_WRITE &&
-			!(fio->op_flags & REQ_SYNC) &&
-			!IS_ENCRYPTED(inode))
+	if (IS_F2FS_IPU_ASYNC(sbi) && fio && fio->op == REQ_OP_WRITE &&
+			!(fio->op_flags & REQ_SYNC) && !IS_ENCRYPTED(inode))
 		return true;
 
 	/* this is only set during fdatasync */
-	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
-			is_inode_flag_set(inode, FI_NEED_IPU))
+	if (IS_F2FS_IPU_FSYNC(sbi) && is_inode_flag_set(inode, FI_NEED_IPU))
 		return true;
 
 	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..8f2b989926df 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3465,7 +3465,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	stat_inc_inplace_blocks(fio->sbi);
 
-	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
+	if (fio->bio && !IS_F2FS_IPU_NOCACHE(sbi))
 		err = f2fs_merge_page_bio(fio);
 	else
 		err = f2fs_submit_page_bio(fio);
@@ -5107,7 +5107,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->rec_prefree_segments = DEF_MAX_RECLAIM_PREFREE_SEGMENTS;
 
 	if (!f2fs_lfs_mode(sbi))
-		sm_info->ipu_policy = 1 << F2FS_IPU_FSYNC;
+		sm_info->ipu_policy = BIT(F2FS_IPU_FSYNC);
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
 	sm_info->min_seq_blocks = sbi->blocks_per_seg;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index be8f2d7d007b..a6028898a655 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -687,6 +687,21 @@ enum {
 	F2FS_IPU_HONOR_OPU_WRITE,
 };
 
+#define F2FS_IPU_POLICY(name) \
+static inline int IS_##name(struct f2fs_sb_info *sbi) \
+{ \
+	return SM_I(sbi)->ipu_policy & BIT(name); \
+}
+
+F2FS_IPU_POLICY(F2FS_IPU_FORCE);
+F2FS_IPU_POLICY(F2FS_IPU_SSR);
+F2FS_IPU_POLICY(F2FS_IPU_UTIL);
+F2FS_IPU_POLICY(F2FS_IPU_SSR_UTIL);
+F2FS_IPU_POLICY(F2FS_IPU_FSYNC);
+F2FS_IPU_POLICY(F2FS_IPU_ASYNC);
+F2FS_IPU_POLICY(F2FS_IPU_NOCACHE);
+F2FS_IPU_POLICY(F2FS_IPU_HONOR_OPU_WRITE);
+
 static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
 		int type)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 31435c8645c8..22aa236d68c8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4081,8 +4081,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		if (f2fs_block_unit_discard(sbi))
 			SM_I(sbi)->dcc_info->discard_granularity = 1;
-		SM_I(sbi)->ipu_policy = 1 << F2FS_IPU_FORCE |
-					1 << F2FS_IPU_HONOR_OPU_WRITE;
+		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
 	}
 
 	sbi->readdir_ra = true;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
