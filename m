Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EC652BCF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 04:30:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7poc-0003Xf-V3;
	Wed, 21 Dec 2022 03:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p7pob-0003XX-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 03:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHTIdrMUoSl/4B0vwPhKRBRdkJUuU+9634i9HkN32cI=; b=SIEM323qIVRT3C2QIkz+JnkLzZ
 v3TfM6Wy+islr5y5i93L6JU77pj3G13ANutg2gqjOmHePAWHIlfnzLt5OTdZqKrpTn6idlNrFWz4N
 Q6jHNrdE5IHUkGtx2jftHb1pTAkD9kl0fxfTywt+YzMWcFHydzO6A2sSg7A1s9cjqm3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fHTIdrMUoSl/4B0vwPhKRBRdkJUuU+9634i9HkN32cI=; b=O
 aEHHe3LO0LYfxagj/B4K1qjzhXnta8EL+YjgUS51abrrlTx3INt01lzLsG3NAYRghxvg1K/98iFse
 Xzo1Y9Ng5P6Z5QdhB84/mbhryKkX74FW5vN0/Sv3+dsJKY8AZO/XdlQKN1i1DOnt/22Wst21c8cxT
 4tdXmcMClJw4KCac=;
Received: from mail-tyzapc01on2121.outbound.protection.outlook.com
 ([40.107.117.121] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7poU-0002pl-Ov for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 03:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auNSYAiPhbaPbyglv4H67SqphGAQHpCtkrCZGdpEOv2vsXNwewiWqKVOSHZHtzdJ9ZS7dNjYydyZ08gnizf3wh7CP5yZ7kttnPKPp6s8+hR/vHf4MgRzlxhSkrjn92iboYDS65sRtULiuuZtOkU/dVYNTuy+56og67zJAAYWTknR3ZvuAFFUvAoujjdK0xrNc+k8BLILUq4eqYO+L7OjQ2mi2mGHbwqHrghgYpWj/pEPVIPupGgGk5in9Nbgb4hS7kgW/VA02xacKsOclVhxoWfagwSs7myvo+UZBCFAdIbmfMVC+uYn7GsDm05aHoXzYLdWuof+NEe0b4kyz8Y1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHTIdrMUoSl/4B0vwPhKRBRdkJUuU+9634i9HkN32cI=;
 b=TBCcyUd3z223Mjrb7R0S0FCkjqL9aZH6TyQhBzry66ucQh6CO+svUUJ5WjTAwKnVvVzC9Y0XCvTjmR0FlFse0C2NLw6uW5CrJvTbTmkETvbn9SBpNJM7CJwlCdgtLKUS3qMTVwSskLOvdnonNkWCpN/XYHoqeWL92oW+NEFQjhVsL3MgVFsfqaZb3R31lNkBtQ4RQuBWI6pQ7OyoQYnv8vx19IlqHSx/+wN8xQZlHld6XuSTRhlY6gJZw4Gq0kUOvETRv7owI6TDQwXfvvQ39Km9x+AT5vUpiPrWGuudjlMvgIwDXG1wSyHMQs5p/MAnzWTJKKfR8wDzie+dO6Ut/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHTIdrMUoSl/4B0vwPhKRBRdkJUuU+9634i9HkN32cI=;
 b=gCwO6Tk7Bqazcta08c68hC2ZZMX/nlxxpsOk3E2nta+1VTNuWM5pPfEh7RQfQOjsRK1sIkwWOlysGAIjg8QDMCTpLGtAiw3MZfxS3Do0AeBrfPCxaplXD2ALDCkgVAloX7GHWC7gWuAZ43qatQJOj4wIhZ70aALfkhGV7uABYLXXnk6IVaOKgs/GKClqfQ+GG50P4umu0qgXtDSwUjqWPNEYaonMagNDHxhHLhqNo+Q7g5gO+axUHlNQKAAjmRMH+EFUKqpCcJEFnACcK9XDNXze7uvvcUEA7Vye8kuvcKAU71lDT1/I2rlS4dlVM3O8Z7fZsOidwlJ/CQ5u6uB6gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4532.apcprd06.prod.outlook.com (2603:1096:820:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 03:30:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 03:30:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org,
	s.shtylyov@omp.ru
Date: Wed, 21 Dec 2022 11:30:21 +0800
Message-Id: <20221221033021.36615-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c8794e-3697-4eb1-9c68-08dae303b559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJvYkODY7+VcdAyLQ6gqo9zRLsKAb2rUg8kVJanVUMBHGWW8DEfdD3vFNgoYuuZAu3XRbjnKXWf0OExiRpKl8LIIFDRQfQmHHbYHof7vN+TMQdd364KjqNLNjQgGKGx8uLh/tfRS2VBbvj8EfJMxLH1+HZ5i8i+c3oH8qMxMc8Kp2Y/u8t3rH6qg+Eut+DGeUgUqzhOSXLkP02v2y5mV0nVu1ip7zRjooSj3NLT2Wv5oiuRyXHmnvFyFVbd+esKEc6UZfvDwi3jo4R7kpmf5VvylHuMFJhX4+Vin4kfMUe9DOnNWw5ZKbSHhaL9T1NvK+eDKKYvuuvaify3iLymPjTXpt9Bbjs6t47W5o5YvdHE8AX1IrI0vBQwgSxFH065hMUYezV6NbFJkzzXZty7BlSV9kJRQNjKa7i9gCdj/e59L6X6FWRUiRFSi4z5HopLVQejiSGPLlVuNiYR22b3G8ZfwOfSi3hzKLF75Ol/KZ9tL/TK7ONT/NUaFLflYq0zH6I3VMz6FG80S98Pu5gEzbhkVuQzojoQWVyrrKbaxqwHqqh2ga1zFLE4og3zZpSs0EMpG0BQuG9OArgr26MRZTTHDbGCN+KgkqG5qNWVLp6qFfyaBiBIcXeYAxa4ivpHLHD706vH3G2bwNnIRebR7s25MjcB1QVwqz3dNrT/Ye5MHB490w2yjTV/oDqtj6z34
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(6666004)(478600001)(6486002)(6506007)(86362001)(66476007)(186003)(66556008)(26005)(6512007)(66946007)(316002)(2616005)(36756003)(8676002)(1076003)(8936002)(4326008)(2906002)(5660300002)(52116002)(41300700001)(38100700002)(38350700002)(83380400001)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wg6+QCem7hQEIo04SP3ZgB8o1nM1HtqxYL1LWRVgiCmmn+lOKcKovOYAZvoH?=
 =?us-ascii?Q?Qfr46fIhorq1PcEuWuzQZqKMeLEl1IASoy+N0gFeEergciCeMfEU9qlF21QO?=
 =?us-ascii?Q?GP0od/u0ZyO9nbghYadhZbr7uq0su86WfDDOdMi4RSZzmQ6UMPDragSIfWWe?=
 =?us-ascii?Q?EQ54DeSc0Qajd3pU5w2YSZqFrcRCM7K+CDWxnWcii1X8l6B5NZjcqnuXo6dg?=
 =?us-ascii?Q?GWota5O9jnP0sIXnPXAXwYXH+UA5OSEbY0P5LdgUjm3LGnwkR0L1z5JKJdwb?=
 =?us-ascii?Q?0uUe9LXPcvPZ+PEjN4rXo3yVmRRywQueHE6ExNenlsTiwt15nZYbSHEfhKRY?=
 =?us-ascii?Q?r73J1i1IEkgs6LzwF3p+TJUOQ9t0htuKB+sOIfUIZc3r7Sbm4xJY2OszP0xD?=
 =?us-ascii?Q?jrNHuzHHJ2veZxvBEPx2sEk+pcCGVRKv0frX4qjvuX+RlYElpuz6S/oX9Dyg?=
 =?us-ascii?Q?AoeLoa4s08mv89VoM8CmekZJBkfomDmXYq+LVjc/aF2sCQrO0vZNmyRsB2PL?=
 =?us-ascii?Q?NF6ZSCQPI8L3C4PWdv7QL0Mhb3UY6slzSiTTvFZJsnBtcQqA2O5AoclCgaP+?=
 =?us-ascii?Q?/pAO1DmVh+5aAA1x3U62RmFhiae0O7KCjETXFe/E2b9l8PFFzo+xPEzr1u3t?=
 =?us-ascii?Q?KmwL8ppyx0kIUNXJVhQWXCXe2+RAAsApPMt1nEiIgJCSyIkouTxElZXOveXs?=
 =?us-ascii?Q?nR/gkHPT32OA65QGuYfAQHxB2egmLWdbeINzTD5YdQF/9iiMvzJ68coJRwAT?=
 =?us-ascii?Q?Gey7IWmgVo3bNVQw2hEEywz8UyS9rRCMiate/s+B5YxYnGGRWl72o+6OROHO?=
 =?us-ascii?Q?fT7dpSpM/e4N5pN99Irz5M3R0htcAXjh8HU/HC27Ijf8ughdfx5QqZjcF7J0?=
 =?us-ascii?Q?d8IAXi55S/NAcrc8Dq1GxEFmb6WI+lh6Pany/FQizifPKKvROXDr/BW4IS9W?=
 =?us-ascii?Q?PTZcbmpBJmuaTiN0SN/az4/2Do7puAsiGkEMNo6bWoE5qcBIapeL6Koydhrt?=
 =?us-ascii?Q?TdrvdkoRJM2j8ikct8wz8As37Sk2RzemTJwz30Jk2I7j0YdAxE8oq3O0FQVX?=
 =?us-ascii?Q?R+YLNJDDz1S/nuvmTN03DEKn/c5Xhv3e70luizDaoPj0rRcLL1+pxWj7sgSe?=
 =?us-ascii?Q?qP3itplu0YFhfr17lpaFX9jgD0pUXFvxyyZuAh6YB+LlDPNmJ64ucLl4VYOF?=
 =?us-ascii?Q?NCmOoAYEQFFoDYZNA3aqVL9iBH9wZDgAnTh4oRwIShTKFfoAq4vNtxQ6DZYc?=
 =?us-ascii?Q?Ms2sXgMLVWKuAtOyQ+bz/ZqRaqESxDkTkMhsVLeDdgHkQ5A/+3yufc7Sf7pj?=
 =?us-ascii?Q?xXnqNfLShh+2ZJYlG/O8NTmasT+55xtxzp6lrwKHy3x4F61FWPZvnC4mtVzQ?=
 =?us-ascii?Q?hkxzbjJkHNjbsT18KXgyrmLebLXqjeH2Pos9qrTYNPq0pO3fmxBkdxe2W6PW?=
 =?us-ascii?Q?iMD4tcitCop0i9NoOqsICAZmbUzke3Yzu6CErvacR1vNgJh/EmFTEHXrLSav?=
 =?us-ascii?Q?I9mmy98frsWFeEM5mMwk3niD01iog6oasS4Q+xjwk2cctK1lBrsRmKc1GrFH?=
 =?us-ascii?Q?OiFwvkpVIf9mZph4IZ8lj6g66Z3PDG76Wc/SD3Qi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c8794e-3697-4eb1-9c68-08dae303b559
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 03:30:29.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfEDyUTusiNgtGzueSBWs7Ve2PlF5NkY0GK1ZDSZrEBF4FInQXtC4LEhccx5UnY4XNu1XoJUa1QA6sTDr5NRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4532
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sergey, > In expand_inode_data(), the 'new_size' local
 variable is initialized to > the result of i_size_read(), however this value
 isn't ever used, so we > can drop this initializer... > > Found by Linux
 Ver [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p7poU-0002pl-Ov
Subject: Re: [f2fs-dev] [PATCH REPOST] f2fs: file: drop useless initializer
 in expand_inode_data()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sergey,

> In expand_inode_data(), the 'new_size' local variable is initialized to
> the result of i_size_read(), however this value isn't ever used,  so we
> can drop this initializer...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'dev' branch of Jaegeuk Kim's F2FS repo...
> Reposting with ISP RAS mailing lists CC'ed now...

Why do you repeatedly send a patch that cannot be applied, and this does not have
a CC on linux-kernel.vger.kernel.org.

Otherwise, code modification looks good to me.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
