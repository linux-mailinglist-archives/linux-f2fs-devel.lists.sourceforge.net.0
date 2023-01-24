Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FA679D97
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jan 2023 16:34:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKLJU-0006dY-Pd;
	Tue, 24 Jan 2023 15:34:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pKLJT-0006dH-GO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzrS/YczNlxfMf68w7RKv4T5CF4rfwv+fxYfN0w/LE8=; b=jbeLyPdwcvOO3ivaGwVNWJB0i0
 5Nxd7L+cuLXerUDLAasQO2/Jy8uJD0qWEfeY7MYBrcOMNtNfmPdG4NIjpXRZSoKAr5KUdL6vzDS7F
 AoQ8NxngR2KCWxz34JY+MhFDNv8IOSP4zy5aO7e4Fk3u8KueRauuSIDccI1htpEQ6BZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzrS/YczNlxfMf68w7RKv4T5CF4rfwv+fxYfN0w/LE8=; b=A5zaEjD4abn1UAqm0DZoxW3CER
 VUxN3JAoG+11E7J+1EqgGH5Ro9qwCDzT6wb4Kb5OrtMO8w90D4lRvYE2gnHVBtfU5pL85J+0Tp7Ji
 Elgl4YiCs44bucBpKkvTHjDvRODbkbbDc9lIH6fQlcZSKJHdhL7OMxVPSfvc3oPKjFUs=;
Received: from mail-sgaapc01on2135.outbound.protection.outlook.com
 ([40.107.215.135] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKLJO-0004P9-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmtJgMuD39mGpHp9Lcwl0jh4j5IIOgc+5dmbVs/HpG+CiVh/8ts+i8yK/sFV/Au6YL4EtBAX6xf5Z5Dgt4XFQ5/VMt0QTSV1POsAh2taq0Qc3n6aUExB5lXsLlY7U+uX2KSmBs+rg3q7ScyAecWjU1vyl58xJNUuaxQT/X6WuK3U0v1mffsc4YLvxc2Vou2kKbazs2FxVHHbBamwwTbenEFdZZy0R5+KVPIAsBktTEsLR+M5OGL4E+Hg5Tf2qXRl1imb4C40moqoDfhyzHW+fZshFlUL879vwEg+Q8GqOE1UxqE2hmY2qWVD3R2/ho8e44h2NhhDfHKzNfGcD6negQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzrS/YczNlxfMf68w7RKv4T5CF4rfwv+fxYfN0w/LE8=;
 b=RmBWis4qB+Y5blzoDStdG+X90H10V0iFXoP51u65KbZr8NlNF7m0KXWJgFAlha1CbVvVvgDEl6va3ubeqyzRmd3GkBh8khf3cjTTZXUIM+wFLysFmhgtsI5sO53Yzsk6wogu+aaxp/WD0xeCDg1oEIOybKMpL3R/Tk182ctMll+Jik9AtSfc334nUjRhKjrN3WPpCNy2d2zp9OmeCHIFCh/KyuvVZKgzxkvawKoGpDQTKtNFhyo4mD8IUfew9bNlLtD3wj4w3l25PbawVYNPGIVwhbzWM0sy+JCpvAUk1VhonaTpdcmD1+F4zMdmBaoixnyNzgXatAONS+MF0kZipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzrS/YczNlxfMf68w7RKv4T5CF4rfwv+fxYfN0w/LE8=;
 b=W0k2j9sUqv3mbkOtn18CBlBE2flyXCRTXm3gRib0hZrnygteYWGWCwMgTHLc2BlBbHZXbNkJ/X0NpEZHcc/YAGozGblLTWblBui4cUzHI08wgswGKrezGqHeXC2l2ENxclCpWq1hwZJJJjTRHOXxDeIbSFvLggfHHe5e2Yksd3RDyZEdCAnMs27jtZXmicGn4c9JhAyWnZt+CNC7xySungXQcIRcN4t6W1ElnppMh4hzcnazkiBWzxVqjLY1LweBox2f0iiZxZNwEPpoQqyf1UZgmRxemlmllGnArr0TjML27jLtG7btmzyfW61ZGyy65eZRKEgx9tthr3rJSihHIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5019.apcprd06.prod.outlook.com (2603:1096:4:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Tue, 24 Jan
 2023 15:34:03 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6043.016; Tue, 24 Jan 2023
 15:34:03 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 24 Jan 2023 23:33:46 +0800
Message-Id: <20230124153346.74881-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230124153346.74881-1-frank.li@vivo.com>
References: <20230124153346.74881-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: d238ad98-16e5-4600-98fc-08dafe206be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dbr635F61kSQcG6zkrLF8XVB4zWsAwgCbSTQIJnSmmlpZxsmHh/6gqYN6fQR2ZelIfInHpTzawsHmGlFFJdjTbUAVxkRPOKAQGgInmq28KNOAf+mOwD/Y/QEhUXJsSFOmqzVfFEfKG+qhqp7syI4ufSeYjp4HDmVy0B4q/ADS5zVCue3Nzn7b0+eFigmkAO6ec+U5dIRo0yiBwSXvO+8Tfgn46Y6g/POqHSuG1yX/DLgA7uRm4jMiGnY4/My/s5SE1UJQQ9gypkcA/BQqpcYfZinr+ruHyn7NgH1GgAyj7dit9b+cJrw9o9fZmZzfWx5tuqAvB8uAMVp0B71OgG7lJwNAtFwE9t43kK+Le+7ypMyekDgojyg3OqWuhF6s+q3+VFO4oFHwIMIoh5PS5r5iVRXwKkMkUMSHCGi1/Ga/1CFfSH0I0XPkeoJkvTJWdey/DnSgo2yi5sfcihAcpXDzB9pNzTwsvnDVVhsxFw7lBwpyxJnL3w39o9MNIxzeWMMLbw4Cj4i0FCTLCtFp1rKOYqAL96IG+PU2qfX1rsTIc2liC6dfI1Vt5wqZgWN9taxXct3YwiVgcNps9CmZGgSpFfrycGsk7n37MLLC7eX0DF6Z6zWfY2qn/Fi9N/1Y1mWkApu2dZTl11jF80XxuqdgqzQYqTKuqeLTXuB1hjA1ep1DSrHd2npL1lmq8xusOogMBAB5ufnkR/bHMbcxeJJCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(2616005)(2906002)(6512007)(26005)(86362001)(186003)(38350700002)(38100700002)(36756003)(8936002)(52116002)(316002)(5660300002)(83380400001)(41300700001)(6666004)(107886003)(478600001)(6506007)(6486002)(4326008)(8676002)(66476007)(1076003)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?slyjkFnu6k1g0qCNFTy4TXybn3WAR8FsmvLpFGT5p7ONAb9rdar1CVkU0DxD?=
 =?us-ascii?Q?6ffq77nrFAD9t8gjUPHH8es5SheT2zvWGgE0n0j05pKFQXfrIV0fjWy1VeiM?=
 =?us-ascii?Q?y7t5U3T0vF2r/hl+7kBImTurcGpoSAd4RKNywk7JtOwP5D8jPx/0You2cEct?=
 =?us-ascii?Q?Fqcw3s6sZ/gpdpwe28SZcJI4BDHWYa4Fco6ZyfnICmP9S+BVv4v2axBXPthj?=
 =?us-ascii?Q?yjbUOOT2CqoFOvXRYUwewuYzUarbtoCvylbvivJTwpq/j/3obdiagvobj4/J?=
 =?us-ascii?Q?8N/yZ34VUN8tZXxSBo1cNwfgBAZ1JE62h38UpYoe5Vth5BFH/SZ0zRovLLAz?=
 =?us-ascii?Q?k7FjRyMLNZeNgxNdflmHST7Cm1e4kDtYaruHDXDHHYJ4NN3reG030YXujd5S?=
 =?us-ascii?Q?Y+j8QAmvOS2NtlfLDIjnEXLt653P2/xGiEDhmP/Zj8MP8GrNf3fs9A9k5oNU?=
 =?us-ascii?Q?sC6dmAPdDGV3bpUF5xvldtY1lEQtXkp9A4QP0cXh6XqKkRp7fgfw1Tg6bEWB?=
 =?us-ascii?Q?Wc0U5Dc2PmzFunvwBxPF08XGtBgFFVlYfdWNkM2uKJATOhSpVKcRjGICAX8x?=
 =?us-ascii?Q?L+9n5TPBSblbe/ILVx7NkKjPhGF9Fr45zftA1SbDomzStp6iZAi6Ctag+FuY?=
 =?us-ascii?Q?1JnxQuLYJAIhB7NcgHVsMbqqSH3Fk297pcRRPWiKEHIO9bqVxrjQVgQuVo0m?=
 =?us-ascii?Q?MfHmkvUAck3Io7S1ryJo+OrcK8MhJxHloEl2JI7Hm9t19G040IAa6bX0SkuE?=
 =?us-ascii?Q?QMuEYGt1vrmLKEHkNTEt/zWv0UgKQkzRZrUH6AzhkhE4C5vm21TyOUFEXeMw?=
 =?us-ascii?Q?78Gv1sjwvyTK6MxlXRSxAF+cWOF5fFd4uM1tYiaHSyBQ5DJ4+aCzX6Hoo9xy?=
 =?us-ascii?Q?599KOK6Nb9bkSkP2ilijcFvDjo3o6MniA04y4XnOWK5uXosTX6rCCGuvjIjI?=
 =?us-ascii?Q?7oJUQwJyOzl4hrZWFSOaUizi5zUkAgOQws/Cz3l0X7OZHr6IWkQvE1C6OJze?=
 =?us-ascii?Q?O/6KBYoCku7Gj1+d6E+77AJ/HLPqcI1RwNFDKY6lC/LL2z+BSIzmCllMZPtA?=
 =?us-ascii?Q?+LIWbaBxd9OYjpqewDHh6CgXx0OFvBTflLNUiFWO/ADlG789eeShVMamRbBp?=
 =?us-ascii?Q?fySIQyrYupw4fhWSN3HSVk5TH1sASmmuJUQCd0j9GOel9Xh+HvkUCYcdfsv1?=
 =?us-ascii?Q?7p9lOh5yM8unvitrHdSTgz2O+SPi+jVWnwWYY2JBSJq9d0JIZASQGTbvEEoJ?=
 =?us-ascii?Q?wuJ5vqc5Zgo3umDE2M1rCTGQyHjf2BWogXS7XTeTdM236Kh9DaBcFiybaBns?=
 =?us-ascii?Q?22ZgwLrh8eip52Fls9kmFTsvl7aa2p/DrrswjJ8WAJEBWaqV+cyadgLiZaCm?=
 =?us-ascii?Q?ho1+H6JukW6i3zBryCCJdonhxOYOk08/nvBSQzgG8Ev0T931zD8Ue8UyxHhH?=
 =?us-ascii?Q?PfrVqoydIrCOXSReWZ9pO/LGa2CzWwMzMPFegWBYpDDbmPOt3ZiEU+DTex9C?=
 =?us-ascii?Q?guALlnBQes1WJYCVunjv5zr625oCcnoK6nIO67RZUV1+gGgL29O84gTHd78g?=
 =?us-ascii?Q?2fDGQndJKNsxBiPODqN6ECvzhYdbZ5CHkYkZ0FUa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d238ad98-16e5-4600-98fc-08dafe206be5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:34:03.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xshbnf4v/T5RL6L317dPFSu1t60QxIhk9pF3T5rhoyHFACoc0qmxmU+025A3IFIRZTPEdEdKA4hE+oRRzocfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5019
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove unnecessary lz4hc_compress_pages(). Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/compress.c | 23 ++++ 1 file changed,
 4 insertions(+),
 19 deletions(-) diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
 index b196b881f3bb..112f0e208b4e 100644 --- a/fs/f2fs/compress.c +++
 b/fs/f2fs/compress.c
 @@ -264,36 +264,21 @@ static void lz4_destroy_compress_ct [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.135 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.135 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pKLJO-0004P9-Jd
Subject: [f2fs-dev] [PATCH 4/4] f2fs: merge lz4hc_compress_pages() to
 lz4_compress_pages()
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

Remove unnecessary lz4hc_compress_pages().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/compress.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b196b881f3bb..112f0e208b4e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -264,36 +264,21 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 	cc->private = NULL;
 }
 
-#ifdef CONFIG_F2FS_FS_LZ4HC
-static int lz4hc_compress_pages(struct compress_ctx *cc)
+static int lz4_compress_pages(struct compress_ctx *cc)
 {
+	int len;
+#ifdef CONFIG_F2FS_FS_LZ4HC
 	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
 						COMPRESS_LEVEL_OFFSET;
-	int len;
 
 	if (level)
 		len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 					cc->clen, level, cc->private);
 	else
+#endif
 		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 						cc->clen, cc->private);
-	if (!len)
-		return -EAGAIN;
-
-	cc->clen = len;
-	return 0;
-}
-#endif
-
-static int lz4_compress_pages(struct compress_ctx *cc)
-{
-	int len;
 
-#ifdef CONFIG_F2FS_FS_LZ4HC
-	return lz4hc_compress_pages(cc);
-#endif
-	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
-						cc->clen, cc->private);
 	if (!len)
 		return -EAGAIN;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
