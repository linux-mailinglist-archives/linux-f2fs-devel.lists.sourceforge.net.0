Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A9718528
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 16:40:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4N0G-0006ty-J8;
	Wed, 31 May 2023 14:40:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q4N09-0006tf-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 14:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjOCgHIG1448Buvp+x7QYy9EYRlMqziddbNIa/zVseo=; b=RiAdBDyYXkJDDPvsWw33lUxmN+
 r3TVChupKUUn+U4mnNwV4ZW25pAQNnVwunjgm5ZqNqhZKhqx7pNse3ZywUf/Qwqj9U1vnFdhswLUn
 bFGuZaXx2RqUEqwmPbe5sV1HdfpZZFOHUwf/WGdi37gXiCZWliCcHRdq2eoJBJhp/R1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mjOCgHIG1448Buvp+x7QYy9EYRlMqziddbNIa/zVseo=; b=f
 D/a+mrZFMzXC3oK8T609ECDhTyOGFG+qGiSguQjmXhxVE0mbKGzc5k5kixGsSMyS9QokLT2QHOplm
 w2kv9Yr2muteJhcvjqqghTpD3QBTi2yGwH3AFoRSH45PanO2bpZp+97VZ2Y5kTw99EN0Gx0IurZ1r
 ITNEQiRNwh/YGtWc=;
Received: from mail-sgaapc01on2114.outbound.protection.outlook.com
 ([40.107.215.114] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4N02-007X8g-0x for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 14:40:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPtvZ3x0wZL4N61HW3mpxeP+aZiO5p7usofAwh/jl+GGlsSBPSInzBsWHCFIQPM21OhqSPdC2Bt23c/n6Zutc35NjRW0Bdc3hYNIQKb569H7eystpNZfG4Dzy3S1DOlXb1FSBUsCZvCUeCNhsrFN0RMOJcgfgTpABkM3Bi6PlrKzgzYAVbfCeiLOWZOhwlSa4j24WdEXpfGaTYzJd3JzuAcqM6znjm2wCaRL8pB7+jEiQfJwSz36ib6OX0fYMNKoJ6Dtp5GGFwypWU+U03eBPThw7HI5+DVSmEwt0wvwDfYIqbkLxxQOpRP8iP2TCy/HIWk77s4/v+46LvibUQ3sGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjOCgHIG1448Buvp+x7QYy9EYRlMqziddbNIa/zVseo=;
 b=ccLDL5ni3SfP92+OOgPFLDRGfLVPSH9d4wIU4RDgQcc8iLDTV7bYnVY+fpdcx7yjVlBtyEF3NEsJHFW9qQzYUnhDsFBkufosWZUVWsR0wjBbHDA/4FWt4X0GhFU/bavXQeZHCYXHEGeMn7FaJx91S4mqBBwpuZIoVEz/1FpJDqmqMOOB0VCM4kebUPd3c4YglBnt2CHmFZ+tkvUyV24OU/cMh3RQKH9JiwXsr30nmEm4jcPPOmRB1sU0lFChkC5CZMGON3nGl9HjV7ewB5zv4b/qUAvMLCVCN92RFLDTwdF/HquCqHlYkYXiIpuJ6oRX+ooRfllr9umkuI33cUok0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjOCgHIG1448Buvp+x7QYy9EYRlMqziddbNIa/zVseo=;
 b=WwDzSIkr2nXE0vwIOer4eZ8EcEs11NzObI+/jzWzcuiLh5XqGrK3O4nHTkq5ak+6tfRYqDqslDgDYinQ4EUhYpJpuE5D09puhreCDuWhLE4ihdjQe5Z3hje+SYeWUtf2jYKmisvmzISf9BiL9ds1It13k7MtQ5ZSoCq8m0d5QWHUCfS3L7wXpIhjwHaB7NV/QjO524MbAR+04/B7I+jHHNcMlSmGMjHZc5DMJ/vxRWTeyVQNKZT9/9GVKcXjjxGdNapUE01dG3Aab3iNYocxmA76XFGI8qj1WOXis1u/10ygRp28ruIZihT/Nh4EC2kqIgW3a06ZpVl8ZQtxl1AXVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4380.apcprd06.prod.outlook.com (2603:1096:4:13a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 31 May
 2023 14:40:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 14:40:19 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 31 May 2023 22:40:06 +0800
Message-Id: <20230531144006.7307-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a01ab8-806f-486b-379f-08db61e4f4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bm1aAe2amkRR8TGOzDLbcbq/Rlm8Iqg9TcedMUU7Gs41JgGXT6CZLmLyxjrsDwF3+xVlEjE8pj/pYHou8xQio7DWXxyercYrZp+7gf//nHQX7sGThhl1wsxjJF/JVp6hbujGpKnR9NnutD6mX/Y5flC9oQdcc2ORQ60z+N6LADp+ZRAaE5mJn816o6kv81rJC5BYBfT6E/QJIesia3mgPQJE/j+qkusurURf7XBRCpdBB7JTnnvXrrgo5KNSCZPGQnIBOeu4p0561kQtZ5v8Evy55DUj5sHcfsd/BrEqogVul/6TH+qKVo/4fdynkgMCMLDdIJtITD3c2YucNphzyOWIoj1DHN4sSCElqZ0UxeqhQSRQGsmB/190PtHI9NREann/odrSWxy3ZfDPPnpJztzR9zFfHqOt22em60cqUovlaMC2OZvJhFgOFLy/eC5BdwxwEoJoED3Y/wB2mQQuIFHfhlFp5Mduda/SBKG4tmsbTGOmW5GtEsgtDI6YRng3liDL8lSWRLfiJITsOHgD+TyKH43ElF8YfLDeJgujgMbpod4kwUpJ5GLODJiUyh6kYmno8+vii7H9nQKw1PJUUl7R+WGmt882w5UbadS4nGn80LSbiXFdFNGY/1fX4aiI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(2906002)(54906003)(5660300002)(8676002)(8936002)(110136005)(316002)(26005)(41300700001)(6666004)(4326008)(66476007)(66946007)(478600001)(6486002)(36756003)(52116002)(66556008)(38350700002)(86362001)(6512007)(38100700002)(6506007)(186003)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qzh6XUA2B8T2if74+PDHqI4Z+oXcJsB07xOhxS+5I/6SVmcRVMy5rcRXIg1o?=
 =?us-ascii?Q?by/NWW+At0nAgSjyTADTPGRWsdGQQpfx0fhzqIT98B/ZZy8oY3ibNQExTrYt?=
 =?us-ascii?Q?nOlHIEE4Ih/OSaoiQemCSa78ziG5ldIqTLDUbKeKMftVStiHLDW/HF3OxMGL?=
 =?us-ascii?Q?cOhDuVVsjYeX05x9LvLAVFO0YPUmQglA3Pa8iy+dORReQh5lLOuBfvQ2qC8a?=
 =?us-ascii?Q?hyFBySBoEPQ+4cyNR7EvMpJZfnOZr5vC/Pu4CRszPknRMvVyOKjGAoit7e1x?=
 =?us-ascii?Q?p2lUX1O3n1bUmYXSek8byrw1IxvqIfQBJzx7+0L1dxDPwARUANkWLvFiiHwM?=
 =?us-ascii?Q?6YEeeyaVOHfzbjiPrJuBbbLQjcwo73nzVE+KflZyCLto9RgfX60BkPdYvZNA?=
 =?us-ascii?Q?P/n/3kZAiBrGCacNhEiOoCIRg/b1/3Jyo9bMgJ95MHqhcCo5+mTmrf3sB3vt?=
 =?us-ascii?Q?9MCQwo6bzgyYhtj/WP+B5KU1UIBMmgwQNeZ2jYu58uGlR/xkgnlKLH+vm10y?=
 =?us-ascii?Q?TIqeiQ7lHxLPcbrBodvLx/lVk9Stmmd3oEStOoOm7AFusv1rx+fapb5dpDuB?=
 =?us-ascii?Q?f9FuTiWbCFab22ZPlPsUYZvKuyxtFKIocCzE9CGgxV/NGF5sMkbFCexrb9pY?=
 =?us-ascii?Q?9//8Ty+lSJC1tyABJSgg+39QochUpx1OJYfuJgK/ns1Xg+RbUVJfffBU4rBG?=
 =?us-ascii?Q?gbKOnhJVi01fj0YKHLF/CeRWRgTXuo0zsk425Ht4lan2miUsQhKGmXARPV/8?=
 =?us-ascii?Q?UiUEDGlpN1P5jaz1fDvfzeR838H9J3MKGPE4Yvu9EMgFL429guh0qQwBMs8F?=
 =?us-ascii?Q?dsWul/FvRPjeawaKFlzjHElU/s0qf5orPSngsUnRjYxPVxsbjZXkKFt54tsU?=
 =?us-ascii?Q?FgDrafDF09l/IErLwOJxoSpJUILanJgYyaJiAKE1alN+g0yDQguW5q7aFQyf?=
 =?us-ascii?Q?JPZu5K88gEvMsmN2SJakvjVSFv7jV9xpYvdqIsHXz/Fn6KKifFmCv5B4AZei?=
 =?us-ascii?Q?P+90cLeyiRHInG4Usu7kg4CR40Yo3Y/PkNL3w7qBrVyOR7jZl9iMjqdP9Id0?=
 =?us-ascii?Q?e++RPjSDQf5fOBwn49MWfrECmuh6KNWP2X0DRLCAcS90fQjzRxIZGN0gAy9t?=
 =?us-ascii?Q?hv4HOFoANsVbpPcxEk1z2B5MtkahRUKmDyd9LmPPhwZ1YFB4SVQNRcQkDDSt?=
 =?us-ascii?Q?I6q8tIAkPdNQxDulSYBhM3iGvKCRodzcpG/E4nHd0W7g0U2vUBV9nFCUGLRm?=
 =?us-ascii?Q?AEVWRu/hFLZNq2tu8RTdSOfWuLV+9TJYLJ6p34NnDRcKHJD9WEWQXCs6llYk?=
 =?us-ascii?Q?dVeW9Se/GIUFdKfsy9NTwtuK0OOmICx1ChYWhSBIvzhXTmCZXuF83XYu+Dsx?=
 =?us-ascii?Q?OJcGOBcm96zx9h3xvjeSuiOcM1qgDoKzhv+Hxk59Q0srciovDkmaj7Cm93dB?=
 =?us-ascii?Q?ebfhzxzxNdoekNzRnxM2dGG1O8T/qltF9FyE0kEVhzx6cDXNUwonmAsx5Sjd?=
 =?us-ascii?Q?idJoXdkyI25Js3wwnSYUDbceVsSWqIcZ+2KMw0WpTlKAKPGCPNMkCsIYjHOP?=
 =?us-ascii?Q?iglxd6+O2HjVnUhu60dz406kVbrFrjm+G1UH4GeM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a01ab8-806f-486b-379f-08db61e4f4a1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 14:40:19.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjjXIXs4IsgMXEL+Ni2l7jE1pSQoak5KIv14gERHNGaL8S6OoMwS6GP1EGkC8xSMGV8zcZuAK5YvGI8K01H5nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4380
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.114 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.114 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4N02-007X8g-0x
Subject: [f2fs-dev] [PATCH] f2fs: enable nowait async buffered writes
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

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 23c68ee946e5..4faf2c04e325 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -546,7 +546,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
-	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
+	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC;
 
 	return dquot_file_open(inode, filp);
 }
@@ -4515,9 +4515,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
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
