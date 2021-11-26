Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A645EB33
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 11:19:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqYKa-0007qm-4n; Fri, 26 Nov 2021 10:19:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mqYKU-0007p3-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 10:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=62bUvyvEHYny46QlIjJO6K7NlCa6jH/9X35Jv9XZYbo=; b=ckIt6hyVPqRxdsaEibYl59HQz8
 I2Gk3O0tyxDSukrUvPhX06g8Fx2bhYIeIZsiq4MWIUWUE65tEJfVWrIocrYtl49kE3AFnkJo9U09N
 gxMVIe6PCF1+2xW9oUc8RWwnkjfijYvmusdApMMaSzQlOcQTrsOMAO+uz5pMsf7hHFWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=62bUvyvEHYny46QlIjJO6K7NlCa6jH/9X35Jv9XZYbo=; b=gIQXVLgD6XSJefLHAWE8ib+02V
 PRaCpIhce+Q6E4/KXKUAJkuU8u96cUQ/EwI8tqFDEaW2To/y7awqIae1wKuN1tujT2jq9T+1iuR7d
 R9jQ76BeL2jDmBc9uq2IZXhRq9jTcvmdWmfyGFoCkv5RzgIWrTZgW7KL4JqVUSZ9K50c=;
Received: from mail-eopbgr1300093.outbound.protection.outlook.com
 ([40.107.130.93] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqYKV-0007IQ-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 10:19:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/rIMqKeZR1VIOzNozHjR6U7A6umIMhcUAWvw7N5MnJsc6zT/hsWS6y/WK6RYalocqLx8yVViKSvpJ0x14uAJGpZglXz0YUeq+7c6jG+seixW/tgp//h/uwMO/o5TfVq2+ymx/4ePMS3GAKfisYRzYCxCQS+XKYr6g6bcL2NKcH4ZhEC93nHwtqHk+IrvM/j0UeuY142pJrWYeOacy0dUFrUD3RI2yd2RMqVBesZaCTKryYh+jZorD+gKFSW5VJGfvbKhOVrMSVCkfSz3ZkTog8SX2/BTdYAqp+asHZmtmVg6jEZEDveVuzTORx1JpJeUM5Fq0d80I6t6zKGIeg/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62bUvyvEHYny46QlIjJO6K7NlCa6jH/9X35Jv9XZYbo=;
 b=ZbxXP64BalMc2RFZmpO5w8u/wy9cCg5qJkjvROvwjTirJhBKeljZCu84eJyGgp7MsULf4nu/BvgTcrSzcPDhRssNV+h35cAiVciApVSbdjJJmAaddvyO7sKoaPsFgFHeObshZGCLbbiyRayokxr/nutK/LyfKcjaS/Kn1VA0FlgaDnYMQTsZFRvRH1P0rmKDlWAFPILwo5WZDnDvhdEtATp/XhC3qpPl7cUmlJp9n5UvDkhTJaF7HoSS8E/qZi1PmllA3Ei9qY99RXfbs1o6nI9F91NT8qjUvnMxZ7Kkg7yphyEI72LJ6SRA0XoRYj3SLh8pjWViO3yJX/tPeW3cVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62bUvyvEHYny46QlIjJO6K7NlCa6jH/9X35Jv9XZYbo=;
 b=RgIX8lJeJjH/TmPVneL7tMSMZurb7jgkvFIyyARGfPCdXokfjIGOkff+y3p2GFS1Y+tGRR9Pn1sZN67KzyGdCXVB2Vu9qGQDjfYfTK77S3D/E5hHxaWyUfmI0TDMUDW/gbFOEVj/sZPd66UluB9VGJiXQACXazKqkh2wiaT4SFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3861.apcprd06.prod.outlook.com (2603:1096:820:1a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 10:19:29 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 10:19:29 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 26 Nov 2021 18:19:20 +0800
Message-Id: <20211126101921.305013-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126101921.305013-1-changfengnan@vivo.com>
References: <20211126101921.305013-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK0PR03CA0119.apcprd03.prod.outlook.com (2603:1096:203:b0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 10:19:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e97613f0-caf2-4ea9-1277-08d9b0c63b34
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3861:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB386147741536C84C468DE4BABB639@KL1PR0601MB3861.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8W+5QvQ7fvprhPlzMIo1Hra+cgylkqvXTINnTm38KS1/dS1XWLIetyw97PCUXA50Q+2Xuff0+rYTgZqBMHAulHmaW6O6XIaXXxRqWleFL1Cctj4B1J3YRPSOt3eRPed0nbjSRANyOpxwXWL8/OvdoxQ3Ic/FaTG3+YHTWDMU37s4ja8RhoJN+kDmgXCAjFuAfknqy5XpuZAG+NFuiXvV0JpVAha4at5lzQ92MP8304T2JMeA802k3EJmwScbyATyWct0WbigUlVy6bBrtyXvUiDgwDRkB02HdwtD2BIcg5Z5nT3/v55LQro9WWce9NZ25Wkk3AuTq0PWaIQC3C0z81JIkEzKuh8QENjmDN9BjHAUKtbj4WZxQpwDqNRu3x/ZIbqf6tVYyC+ptSGkDrE30NFwmRaWcyRgZd+2IPU/q9wl7jQN1C69aH9oVZCg1yjpW/FiN9CWo1GbS2EPO4UAWrQJWHW5dUbrj7Hg2zFeEQXxS5+ImTwZtZ2V2pfTsd8slup1JQ4SEEEh/PiaF+FgvtJISKAnMCsiBJLF5HtPCt/YNlfDFwNKPudDsuCosHTJp7IXggnQT5Te5ZMY1DP5vqLOA7hDIaB9ap2FX8pXHHeQRThF+nlbUhsJo2O2eSbUVQOctcz4PeDJehyGhaIf8UMDdQX11BS13eMuP5UVEVqQx923S/+t4gZpegwjYelseiRyneWR81Sl1rq0ADg2iu3mYqvjkIDvd2tMurjxV9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(26005)(956004)(86362001)(36756003)(107886003)(52116002)(316002)(6512007)(66476007)(38100700002)(2616005)(6486002)(38350700002)(5660300002)(8936002)(186003)(8676002)(1076003)(83380400001)(6666004)(4326008)(2906002)(6506007)(66556008)(66946007)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66j7clG61JeWhALOBAHzctRv05AO/OgM0wUBVFZVwOqnkrlE5qKwK0PkfphI?=
 =?us-ascii?Q?C+RRb88osEffNr+vG+B4FB1GPwgKIfFJ6BCKospuspkGOhmPpR0goQXYxETu?=
 =?us-ascii?Q?p9gc/C0INc7Wd0M01Xu3yfeHCllS2J4xWnzWczjSmT3daKnoGJ2na3lkl/9o?=
 =?us-ascii?Q?62KRNl8Ik5RRuLO38F3FnanJTTyz7myqC64w9oc2TUVWKnifgvEDH9Ag6S4V?=
 =?us-ascii?Q?jFJmnIKQGT5CwIMg+JP/5UxICoU0LM/HcXDd2VtJIdfqvtpT2T+2gEPiPmNj?=
 =?us-ascii?Q?LrYSy3tYSu7UQbnTFHzus+tW0ghEuOcsslX1OFT43D7fMW9GU7wN3ra0M2gS?=
 =?us-ascii?Q?eKwCMTQHl1vmdhjOTTD5pyx1XADPFNF/OjZYXJOWEwvUNlbuTTNcNHjrMTtA?=
 =?us-ascii?Q?lqfqtuhotculm/gJht1EvKf/UnmjFKyzNny2OgLVlVGkxTSIMOX88uRrchiq?=
 =?us-ascii?Q?TtEhTKIfjBlp5v4gj9n8awDul55IYFwcyHI1wTjT9qZbfRmW24R5Ts5WJgNs?=
 =?us-ascii?Q?MxzgYh7m4nDNV1FfZCUsgKqPqT/1w2Qkd+eoNQ/Y44ZdFGVKxS0LPi3LOrPs?=
 =?us-ascii?Q?+mhsN8d+zcf3V9R4MHT2oJFrWl0F3yN7hamrM6HL+p3kmWJl5cF85aBDWZhB?=
 =?us-ascii?Q?JnVQidQvqe1rY6VifxJe3ePYTWBLWOaWt+K9nFDq7TIHBGo6Ide0uUQkOGIU?=
 =?us-ascii?Q?s8MocH5oRX23DzciBwrvPpa1KLbZ/cIQOjmALDULt1RMVahMRGxSLCHH/pz8?=
 =?us-ascii?Q?CFkXsp7MWq6DUCbX/vBqS+4WvfHGMuoA/mpEqQ3oA6CAjwRddyi5VzAymOvL?=
 =?us-ascii?Q?I/+ttLmDFsUj491LUnU2wZn72VEcw7lwcfu8nRWuj6pc+MWpD+yo8o7nMZ15?=
 =?us-ascii?Q?SKBUjAVwZYdjMKLIpGRxBGbzUG1l/gf7TIqgn4y1TckKC7Gih5eosiN7ODrq?=
 =?us-ascii?Q?eIACfvbVwi5EM554FU740yp2jaHl8XG4Sxhl9uJvM6IZFr7VXC0nAPFxddbB?=
 =?us-ascii?Q?e8+PCONOQqoH9BqLCvyaoJjkqOiPf/kWuddw+hneBwnNvQyWdieKiZxonEhz?=
 =?us-ascii?Q?WEk4V3ELXyqDTUdvAthxjyv3w+0MMWWMV+u2RnbzTHfIKdrDd28Zmx9Vnnel?=
 =?us-ascii?Q?GyI2x2X72iEwqK8DBnmPPckfUAmfzkAYpZbBJFbZ825D5VlD2vXYtwc6OUIv?=
 =?us-ascii?Q?QwNncdNuZ1jNwiA7yi4YRsrTEs6vvyGnPSVAMCjs0Fv4cVGiXbNs6AU1+5AQ?=
 =?us-ascii?Q?daJ33rR1GO52VtGPSRhuH6Tsrhz3xekIkKcX4D57qmjQ260gXVytvpzV2GuX?=
 =?us-ascii?Q?DMXObgFDCVBBoTqWfHUkl4svw4ElIm7OE644w/phvPeo6g9rvQ0ohCVbIUpV?=
 =?us-ascii?Q?1/Llucdf4hgYPpEGvKGVZaQfKaJp51zNE50j8Y7o7Bv6Tz11ar3TZN28l1HZ?=
 =?us-ascii?Q?JLdHxY7SxVzlzDt/QzW1/VC5QCgd2zlL8u0MLlNTYf8ILtYm41QHNCpkw5sW?=
 =?us-ascii?Q?1gcpnM30t4zaf008h7luIJX/yu8fPphv5S0PoCeYlt70JPSjt6/+sQfq4fHU?=
 =?us-ascii?Q?2gaWfACkG9fLfzYECMMe/GKthXWdOvPKX2hgUrLhJBnQzhcaNtWRgMtLs+Iy?=
 =?us-ascii?Q?QxBPUvp8sQai/rS4J2MfZyA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97613f0-caf2-4ea9-1277-08d9b0c63b34
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 10:19:29.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUmgs5TDnBFbCaJZCGyRFu3WR6lwo9XR+eKiQPnsberjMvPzQf5lf2AcyPQ+5tfH7LxaQfanu8jSut31g3zRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3861
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, compressed page cache drop when clean page cache,
 but POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
 don't have private data, and won't call f2fs_invalidate_compres [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.93 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mqYKV-0007IQ-Aw
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, compressed page cache drop when clean page cache, but
POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
don't have private data, and won't call f2fs_invalidate_compress_pages.
This commit call f2fs_invalidate_compress_pages() directly in
f2fs_file_fadvise() for POSIX_FADV_DONTNEED case.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 32c0bd545c5c..dafdaad9a9e4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4677,12 +4677,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 		int advice)
 {
-	struct inode *inode;
 	struct address_space *mapping;
 	struct backing_dev_info *bdi;
+	struct inode *inode = file_inode(filp);
 
 	if (advice == POSIX_FADV_SEQUENTIAL) {
-		inode = file_inode(filp);
 		if (S_ISFIFO(inode->i_mode))
 			return -ESPIPE;
 
@@ -4697,6 +4696,10 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 		filp->f_mode &= ~FMODE_RANDOM;
 		spin_unlock(&filp->f_lock);
 		return 0;
+	} else if (advice == POSIX_FADV_DONTNEED) {
+		if (test_opt(F2FS_I_SB(inode), COMPRESS_CACHE) &&
+			f2fs_compressed_file(inode))
+			f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
 	}
 
 	return generic_fadvise(filp, offset, len, advice);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
