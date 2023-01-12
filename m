Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D85667881
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFz8e-0000Wz-Kh;
	Thu, 12 Jan 2023 15:05:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pFz8W-0000Vw-1A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=krazqck6N1xLUZjCzRlx0XvF1ayG8lWJ0PZnnS4J8po=; b=Ru+6Q3l6SKdGWtZ+YUzv0unk41
 KfH3X6dQ9YrLcrC/VD20biy9I9z7gbtopVe2kK0uy0aErF5PshJJIekbtVruxsC49W1TsmD6E6YYa
 JgETF1whH0+BQF/Ms4evL+o+rfIvfPl8uqhAa9iPigjDzX6SHjitj8Y0yFTNi22m4F5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=krazqck6N1xLUZjCzRlx0XvF1ayG8lWJ0PZnnS4J8po=; b=H
 0fXHeUs9KK9+UupCYvXwGnUrm46m8gpoLt4+r7D25UmLH71ytMiwE3m1FoeSgL0qZTYFXptfwSqWF
 C8BTYn4zkCP2pJ7VtlLboDSnH4TlT+Z80uiEAejn9fTa7MP54peFpZIciIBhznP00x9ihD2fhJVip
 wrUlB+GQwS7S98NQ=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFz8R-0019nb-Sw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:04:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STXagMssoSxnM8Y6fIBv9RfPUNmQrsVEtPgeqDeZub2f937hRcSlZx8OSndmiNx7s37fV02pwGJuGu8V7ZetpRtIFj8cB01mYzgfnd7XhhqsjQYGmDxHqP+r8QvuUuLi6shEg+kMOHhxHY8u9ZWDCIm6DN83AWaalgwzboZJePSI5RY0L/WYLIpFDuZDs2XVismsRnVu/wFhQAkyO0q+tiVmdSFdIxI/5wgUlBCsz1lC10lWhrfgcrPkt8vS07Dzkx8ei+ltr04EQ6IodAzaBUqXHNKByqFT91OB9iZVlIBf+HxkRk2eppXoDjMXNzknIKQeYAjNadIGegxdkb5p+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krazqck6N1xLUZjCzRlx0XvF1ayG8lWJ0PZnnS4J8po=;
 b=IShr4pm3inzIn5LLbeXcbo5VUpG7dXpAqWWtgkfNJn32oJMB+XWO9fZ8vwcz0h73Qwq4gN3dcu+a7G/jJZQs95m58lK5EBid6zXvE5iL2uy+2VX+uPtNIUJP2zC1Bx8KGeJdcHPCFixcreRV+vHjUeZTIzbOVI4fqvIvWGMOFD9J9cpLpAZ/7I33MaibwrGi2dH8Ed4eEWEIPS3NsbyKt5QwP77XZBgOodic41k1viQe2A3cCKj4neGaOy8O0yyVHghfaALHx7KVzQPBi9r0I54XpkI3u2JLPhLPz31uv/6c3TqXcEKPDM9aJZmIJXOiVBe6u+fHZHGdnD/XkPASRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krazqck6N1xLUZjCzRlx0XvF1ayG8lWJ0PZnnS4J8po=;
 b=bOlCXVQXnZl3mKdf56lWUEo3Uv8PNuPT51WhGj0QEpSiUMsv6Bl2FZbcevcFR9QR7L2JqEMfRVVwdqproZwhrf/BoqowB2JoEJamEq7gHdTOqpc2sNHnW/Q4tQGSHwrwOUvjf67Xag9dp2rnNjVk6IbsZMtHNKY05w6d9kkLytjOZWdeI5roVP/pRSQGxEibN8dhfeI0X6l/o2R9cjavCFAxCZBAv3OH0uCYQXxeeFGqPJ3WnBRTKDH86tTTYdmwzYltNdHYyBLXFCjBu4rRNHIPz2mf50pXCER9QDnacUzk/6PJ/ObCIF1gSIH14M6YKPFgqlazhNGFj61kFEfXNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5988.apcprd06.prod.outlook.com (2603:1096:101:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 15:04:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:04:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 12 Jan 2023 23:04:37 +0800
Message-Id: <20230112150437.28089-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1299b6-8371-45fb-93d0-08daf4ae580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuHJNuS27Uzwcll2iuK78YBbPSvhZhEZaDT5NTyOR/ITi2ihyienAFKLXXADZSzcpzskqTaxeSlyPfQX9asd+KhBq1aq197y/HHFGdie/qkDx9F31Bd4K6syz1SCugxtnTGWJlVj6aCCaJ5ZpBQrx3eGrIKYSOPd0QgaOXLIhhTZLu4icjIXTWM82DrMje1LBpNLqFHEZPPhq5t63H0p+qvRniz8edQNtX6KavJnVPb0lgj6J/2HRPmrSmoIOSH8d0iCOWLQyPGkGPf0y7VX9H7jG48DIRZqxBKR68hTaufATUpjxx1EwLlRf6BkU5miyKeydtP7LId6GKcnzuTU8EzXx1GJnl4e2hYzC9gK6oGP60zbZajkTcliugGtN8b8RtMvc3nk9UwkCUh+pNkwr4Brtxtg64x+d3DElm2yKP9gHf0VUkmQWsj7TJVFjWHk6NWUEkCDEpqkvCUuszCTqnYQMS9jmT8L8+KSlyM5tqio9+2nbp3+H5pSn7EU0meQVDRMUkuFYlT+iY7KSWow+Z9Sok8kTw8we9OWaG/VdCh6s/wNMoLDGpQLDx4Dwft+ku+eprnpUjrAbZZKF5Dmza1aIhdlEOnDxGVMPKFmevevZx58wN1GLsoSZdLGCE8tTe8FZ2m7/ptC7I54ur1EsP8hf+RuT9BZQYkm0Ftzw3si8deMZjdNMwz40elc97fj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(38350700002)(38100700002)(83380400001)(8676002)(86362001)(5660300002)(4326008)(2906002)(8936002)(66946007)(66556008)(66476007)(41300700001)(107886003)(6666004)(6512007)(26005)(6506007)(1076003)(186003)(2616005)(316002)(19627235002)(478600001)(6486002)(52116002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xuneOfKR0AEjcZnDR9FEaCsMJ/GBbyLft75j1tmCQDwR1xjvmRAiBR0z4InZ?=
 =?us-ascii?Q?viApkjg9T6+yxHRAUZhiJv9T0oeiZxvqSMoo7e2bfxeAn8rzB74FNOh6mazz?=
 =?us-ascii?Q?6NZMXAbsRGwyiydVpE+lzyjq/rjRa6K24rUxJaX3GnI6JDjt9R+xOfGe8mts?=
 =?us-ascii?Q?putbZps9g6oADOOhNuDEawZD6YQdRQbzM4FM8ABCgBIrswCOXxyS0Ohue7VO?=
 =?us-ascii?Q?a1MCGXBV4i7I2QMkLRqNfaEtOvpbckY6AJOXUeb6EvnEE1UH/AjcDRZLAWf1?=
 =?us-ascii?Q?4yRmmrn+Nrfd+CQclUfyAWWVcthzmKWuyXSrFXag6Ey58pn++v0IX9LdKOD7?=
 =?us-ascii?Q?cq8uyKtgzU/YMydba2ET87Scv65l/d9Hc2oo8PqLVI7+dYkS1tiWFVtz9lkG?=
 =?us-ascii?Q?bkEOsJmcLiMSS227tbgPeruI2AZofohUdQ/WJdfKQrs2NUVfpht8gsY313uA?=
 =?us-ascii?Q?ojX2uQ3od+80kRYMcOTBr6R7Im6SrORaUbNvVqDFwAmFp159BBg1kNakCCwX?=
 =?us-ascii?Q?deSgMSA4kJWKfJMHC0bRX84WAF7KAyzq8BR9dvdC4y0O7R7dHpy3U/zXb+jD?=
 =?us-ascii?Q?7+CIVnegWkTqPLJb0zfsxaGPebBwAZZXovecuwK7ic016jhEz7/vOaLr7Dpp?=
 =?us-ascii?Q?SvfTOL/Q/aCCFiKQRQTADgFjCix7I1QYgUbNK6CBAxDZrXODKNTtjuHHeEUT?=
 =?us-ascii?Q?PRVoXyMe9RvM+0RX9Mz8umklnQYFubxQgjbS3Qvq50EG8U367nTSgntzQSs1?=
 =?us-ascii?Q?HG5uSDbKZ30P6cMOLLRA5zPHruDvV/GfzQlX6d5Sc77K2kUjfkVz4P3Dx0RU?=
 =?us-ascii?Q?tyyu4MvFg1DLF6SzO612Qy+FEDBRp5qDYpcq4UJku80ZPd4fkme55KEdrrqF?=
 =?us-ascii?Q?0OTDsYSUoq9hVSEmYqSPL6MK31xUr8nPTtH0td2qG3XQM9dKiSXbA6swRqso?=
 =?us-ascii?Q?J/mIJaaSlX+ltegVGUDRvCu1mExXoukb8UQkr6gOxoDjvnDU9PH8FG+vDQ25?=
 =?us-ascii?Q?6yg/jlzrbMGDhLe8bN4S8H8Mqwfyebk7diaS4+NHu7vpEjwA+KGwOPXyrz0z?=
 =?us-ascii?Q?qCpz3T1xvahS/cgj/mjkXlkZJgNKu6sN+KlCoFihkLCL+2QB8jQiXaR6krfs?=
 =?us-ascii?Q?Br5LuX/qGM+di5lcoajfauwWz+ZTBjQTBTN2XbcLpx11Ua2S2YVuHsHplYDF?=
 =?us-ascii?Q?nXMRW0znza13DVkPd++1dez40AN/QImYnGl2ohneihpSoYLVVSgC7wbthZPs?=
 =?us-ascii?Q?5fPAWrBtfkmUZVOpWREVEP0cBkDXiOgrKvKh0CopJrMlA3lb+oD//qGcNzzs?=
 =?us-ascii?Q?vSnSDWbFeMywdd38wHhve8EFZ75Lkb3HhS5gSYK4C9p/4ywgQjSThM1XUJ5Z?=
 =?us-ascii?Q?2vu+SR+2BP3oNOjTakhjXVkjRJd5XkX2CAqAWznKowrr+qVLFus9fqtSazRz?=
 =?us-ascii?Q?0ddTlaxN+SqDsKuVGiFSunRxfJjfKl3Taf50C0IcOhEmlmniVa/P7hVZy57N?=
 =?us-ascii?Q?dKTvcb1zdHUaKZdSFP4bsmG5AhyXfIspMP/lnfNu75L8w095OaIYDsglMxaf?=
 =?us-ascii?Q?sPuh46ShZL13StsBw7v9Zc+C2u6rkWWYNXcRxhMK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1299b6-8371-45fb-93d0-08daf4ae580d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:04:46.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mL+m/mjckdo+E9CmS7OXL910APqmjNNYlpIKUNHcuoB/YzH49H0r7PbLLQ4Uf2YVL93HGoowMjeqP5AVplWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5988
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current discard_io_aware_gran is a fixed value, change
 it to be configurable through the sys node. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- v4:update description Documentation/ABI/testing/sysfs-fs-f2fs | 10
 ++++++++++
 fs/f2fs/f2fs.h | 1 + fs/f2fs/segment.c | 3 ++- fs/f2fs/sysfs.c | 13 ++++
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFz8R-0019nb-Sw
Subject: [f2fs-dev] [PATCH v4] f2fs: introduce discard_io_aware_gran sysfs
 node
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

The current discard_io_aware_gran is a fixed value, change it to be
configurable through the sys node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v4:update description
 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/segment.c                       |  3 ++-
 fs/f2fs/sysfs.c                         | 13 +++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index aaa379bb8a8f..06e6795db6f5 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -708,3 +708,13 @@ Description:	Support configuring fault injection type, should be
 		FAULT_LOCK_OP            0x000020000
 		FAULT_BLKADDR            0x000040000
 		===================      ===========
+
+What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
+Date:		January 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls background discard granularity of inner discard thread
+		when is not in idle. Inner thread will not issue discards with size that
+		is smaller than granularity. The unit size is one block(4KB), now only
+		support configuring in range of [0, 512].
+		By default, the value is 512, all discard IOs will be interrupted by other
+		inflight IO. It can be set to 0, then IO aware functionality will be disabled.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 331c330ea31d..f3c5f7740c1a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -409,6 +409,7 @@ struct discard_cmd_control {
 	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
+	unsigned int discard_io_aware_gran; /* minimum discard granularity not be aware of I/O */
 	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 976316218bd3..bd1cd98fa6eb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1059,7 +1059,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	dpolicy->granularity = granularity;
 
 	dpolicy->max_requests = dcc->max_discard_request;
-	dpolicy->io_aware_gran = MAX_PLIST_NUM;
+	dpolicy->io_aware_gran = dcc->discard_io_aware_gran;
 	dpolicy->timeout = false;
 
 	if (discard_type == DPOLICY_BG) {
@@ -2063,6 +2063,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	if (!dcc)
 		return -ENOMEM;
 
+	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 805b632a3af0..e396851a6dd1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -473,6 +473,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_io_aware_gran")) {
+		if (t > MAX_PLIST_NUM)
+			return -EINVAL;
+		if (!f2fs_block_unit_discard(sbi))
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "discard_granularity")) {
 		if (t == 0 || t > MAX_PLIST_NUM)
 			return -EINVAL;
@@ -825,6 +836,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
@@ -960,6 +972,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_discard_issue_time),
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
+	ATTR_LIST(discard_io_aware_gran),
 	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
