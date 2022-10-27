Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1D60F6CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 14:08:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo1gb-0004n3-5X;
	Thu, 27 Oct 2022 12:08:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oo1ga-0004mu-3M
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 12:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1OXBOAw2l2D4avQ5PTQbi02Y+avM5lguj95jUokE9Oo=; b=dBMPCYtdj0jLfdRqKT1xTp/Za0
 rOPFfOubrg/ZDAXj3F2bMu8u982vYlw7ZLAWZW13HKmu5TSTPCKumhGqP0WCWdSO8nySanwWcfw+a
 2tARAx6wvu7qN/a5OjQ0xeTNs6Bvx/zfpxsn2VT8dVtJdubf/4tLsl7/XG3xWDKi8neg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1OXBOAw2l2D4avQ5PTQbi02Y+avM5lguj95jUokE9Oo=; b=SKL6WovNwapgjjuc4WltlucYXp
 I7uG/WoYb97Hkdr68A4Y/OcW79h6Rcz+jgHMqkvvgpvnWTr7aiT/0wLQdkWdRylRA6Vc325k/3yy3
 6f0gAAIFiJGAhAj6P8HwkbnzfvoZT5mcCGa7iJhwFdZAfPbOF4IFaGbBxnyXixHkii2E=;
Received: from mail-sgaapc01on2122.outbound.protection.outlook.com
 ([40.107.215.122] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo1gW-00054b-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 12:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBo1kqs4XgNjF96OMqDBayvLG5CxOA7q0k38N6e4TM8B/wi3Hm2T4vPsj8etnu49PpYoXJ7PeIxhGAx33vwkIp4gu1ZLxxx7ZsSJv28Oh6srkj099FI9qcFoKjS9AQtntKmMjhPcZf1AmJAKAIGosI6jktoAVYtUYbQF+ftF6EQxwfaoMtTnflvsRc7+3gKulPQ19LMCEXS7YOtCLk4F9HU5HMtg1qaKFwv1mbz9MJesl0xklNDHawlTTUeSSAXpvpaQyoW5FZ6BdrGtSPpkcHDNpkUy0zAe+bIa+kPYQbZ5e3yVUNsQoNs4vLceRKIxjIIwunvJC2eQI0rXDlzmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OXBOAw2l2D4avQ5PTQbi02Y+avM5lguj95jUokE9Oo=;
 b=C6EaIg8+2zngQAl877hTOpU0w77cBeMOcoc0EnLUcVJSF/Q1mcfnP2ytArZ/wd7TXWOLSRxxG5dEDAepAeU+uCbC3U9XUOSXdhILq5AUw6rAs55Q1qqQ6gKFOZ0KHSOLkQaKs4vwgJUuiN1acTvV1+TwqlwOia7dlchvgvPNruM+m5VIHxz8VpIs8ctbbmhffmxrV7TqImLNm5urSAXYWLYjSpXa6oOVq8MocjQwuLRhshfFRFG3An4oLrg+n+Fbfwqp2R0YtvSMhleIgKW8t/5cpMXs2Z6jXBE+I8YiXwKVgHmFcjDmiFkSqkVJDbUoPAfZf48TR+OMitb90bDRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OXBOAw2l2D4avQ5PTQbi02Y+avM5lguj95jUokE9Oo=;
 b=n6OWoKnIP9Zi9sKuOa2fag2xaQFiJClNjTHipo0jglZ6NRbC2/jGAJJfiEF3zf2sI4ad992W4GK5ixY73BNV1kL16bJGYEFmLx4nz9Qd16Yyit+KHrD0DfUnuqVvVH9rZ9gAHP8YjamltPGKhcb00rXPqdR9RrhMFe4H02UrdV1v8alj8FiMfRGhibOGURayS/Kovm9RZhlnk93oH6tz/LPr1JFo5hi+iX5Lfeait1jE7p50rED2V7EKkeAzCRf4QJtrYfnO4KcVAqO+d0uVn2pHCbS9nQzNrJ1xmTTEdn6IUWellaJPAJcrFnl/Yl/cX9P6aZNJjsamiFqRv7/CYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4468.apcprd06.prod.outlook.com (2603:1096:820:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 12:08:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 12:08:19 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 27 Oct 2022 20:08:06 +0800
Message-Id: <20221027120807.6337-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221027120807.6337-1-frank.li@vivo.com>
References: <20221027120807.6337-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: e345eb4a-0602-46ab-5d02-08dab813f019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgUAfatVUNe1c/9QplJvK8icFzaZJHTPt4JZdwUOHX/Thd6PnSo+eWADMQxVWrzOydIRSk4A9Ra9TRorysGj/RZcshcUUx8iFCAIsj4oH/lHl0HCDuAGGp+voKfqQugdfyLcoS2qgm1JqtE6+yjI3FJllOOfwA5UBEzB85qZtLXVogamVrTNEMZHPPJ4AaqaMUUXtArQC3Y8KXXJlEeHnz58gi5YfUTmO+XrFxPz6UA97gkp2RiFuGnr8fqcgtPcI025RzqTYH2JIwA1YV+ISAl04ODmnScjMNrKAjk6g9o7kjaY9UlD1dJNxheTOaVzl+rcaPOGvRMlYPPFGGHX3PnEJyMku0XlfvxaIbtB7ByKSyQcElraEs55mp6XQs3Sfjp3Uw1mFDF6SmmeblGSdZmJOX30YuyLzseSZhMdDUvIafkg8cqFDxGgqhHshvvq1ejGQqAQBNncxUNZTzc74G3upQLc1s25+v/uQy026gQ1BwPcYojNp99PhK34zabpDME74yIMry9YWYz9rIXBQa1jVQ23UR8sk1xOMZcd6897836KlxLAcXU1PpZlmKOF0C87XzjvGPt80cGXF53mExycMC9nQ/IrG4V0TdiC8w2qpuzfh7AE69dbXy4+NgQ5a60QviEUhNIbsufBvZfnPbRBDTBz241YSkCGhmteWR8a9btz1JLZIt2usUmt0DLdRyeQKgYE7vX1um5Yt+KFqeGN0Z+z0fs5jowKHciCtqlhv8nbYCp57cpxthlRVLojIcVacRGmadxWXkTwAvTMYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(36756003)(186003)(1076003)(6486002)(52116002)(83380400001)(6506007)(6666004)(478600001)(107886003)(2616005)(5660300002)(8936002)(66556008)(4326008)(26005)(38350700002)(38100700002)(316002)(6512007)(41300700001)(2906002)(66476007)(8676002)(86362001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQzDViuw26IY350aSeJsc3F+1E+49O/FpESRMsMPKxU6QoXmiR4KwGADk5j5?=
 =?us-ascii?Q?Z6KJUVPBv7lXanDcbrvSw+/6CPgKPAMVb/8ve/mYOCAKbx9o1jt7A3YvEKbS?=
 =?us-ascii?Q?xpvFOSWywyHWp+hojszJf1mBTy/xuKNw9KbAhtBKH5z+3z3zXrnLY/0IKJ17?=
 =?us-ascii?Q?pSjh2nsG6fV9sGfnPG0Xlqi94V0h+3E7NDPrfM2OL9ig7G7t+wM3Y9090svE?=
 =?us-ascii?Q?aaqWsrRzg764hinD6H/y7HndPiu84CedNuux59HN48SrA5Dr+p+H8nHmMbGU?=
 =?us-ascii?Q?rzSgUWOtvvte0mw2+O76w+X6OCa/Mjj+TGSy5QpIToT2Z2hRLnuNM7nIxgaZ?=
 =?us-ascii?Q?TgZDFgIHPWBN1jc55Tafwex7+WRSPzdJ78fUhPZe3PEy8im6Xw/JiVGKq3Zq?=
 =?us-ascii?Q?p53RAr8NzHGUX9iyOUfH3IX7JHifI0G3/D7axulqj/tNm2rvOaNqsF8e3Sqy?=
 =?us-ascii?Q?ihoP72SrpQOZCsfOeznpdrgunvIBaO1MCDeOmZWd7PhIDtQIIcp3QLCmzq/D?=
 =?us-ascii?Q?6+UY4Rd2tPKaUL6MPX20ezzBghTwrIlqaS7UiHlJc0ZpRJPrIRyvR8bV7dA3?=
 =?us-ascii?Q?aP8nI2a2A0F4nFUHRtmXRswOqwTlbLDF3i/grcatXoWbbIzEjHuk34+PcFov?=
 =?us-ascii?Q?q5Bih79eNPdZnBvZWJdl4DI7hLStzVnCuHTZx8fm+UwvSqggyz3TPAt2244G?=
 =?us-ascii?Q?QiNVyv3QjKZCw8gcbWC8LHIoLLZHZmZgGk47gs+Y2cNZlD47zu2M7iD+YodK?=
 =?us-ascii?Q?HQWh0t4JoSIeqE+lZaFmseOmIvL4AXt5yNUnDEcTnO8GyLs+AoIa5dPEv8L3?=
 =?us-ascii?Q?Zl/FNn1ToUlID5jxwZzVPZC2jmYH6ZGkqrEHWAAXIs1EXRT/wY9GiyICsd8T?=
 =?us-ascii?Q?5kn2U3y4QdegcNFTCBHNBCkyCe9iVCP7FdDBiFYR9xxq4QGtbl44tuyVq/nO?=
 =?us-ascii?Q?sXPa5tON0fN5m7+VCuqEA9alISLeTJEMu4ALdnYsAK3YavBlZusz8nc2UIJU?=
 =?us-ascii?Q?LpBlSR6l2WJMUJQMr7UoChTpYkRNK5kfDYVN/bG6q4PFeEXgPn1T71oeG+70?=
 =?us-ascii?Q?EaEliupIRIzD/6t/r+mUbzxsIYDEO5Ux6NrcuDhBtCgQC0aE9qc191eY8UL4?=
 =?us-ascii?Q?TTroai7DkYO9U8Gjev6Ie+BHraPAWbl4Msg/zrYfe9X5nj92RrKwU9C+nP1v?=
 =?us-ascii?Q?MP9bYHa6OKff3GNutjGPFC++xkCrZ4ahxXl9/q6028LaRkUezUgMHGYprE7P?=
 =?us-ascii?Q?zPV/UPHlqhPExRU2ixAROCQMXtedDeo2aRazESt5jtTEZK2XzrXEQvWe5GhY?=
 =?us-ascii?Q?J3OAixmwRo1EUrwKaUwpSbndMoMkLHsMD3Jel+F5cGokEFPCDsqFqzJQz5xY?=
 =?us-ascii?Q?AyQtNMi6iiveodrTjodeY7HILGQcer8GmNaeTxQQPWmsVc4eyFRyLxQ542Rt?=
 =?us-ascii?Q?bedSfzcsU+tJGj8Zxp2PwC6BMhUSQFOoDBZHyFB1/as3Y48AkI8R2jY/Fa6O?=
 =?us-ascii?Q?xvO5PghoYzz1DPyXxX+CCChmPxdHFMeT9zzMcZOjVqOkKVvDy3tl/gg0suBD?=
 =?us-ascii?Q?p0A/1hSznTYqI1TSekRT4wvb2d3DkxAHvzS5uVtf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e345eb4a-0602-46ab-5d02-08dab813f019
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 12:08:19.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oAG1Zxrur83g/REySxiLvWRKK2j5BWRkCymbphsYAMqYz/tBfUnzy5kw37B7p/Hc6faKl3eeSs5jTbBZuWjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4468
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Need to stop the flush thread running externally, so export
 it. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/f2fs.h | 1
 + fs/f2fs/segment.c | 9 ++++++++- 2 files changed, 9 insertions(+),
 1 deletion(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.122 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oo1gW-00054b-Fh
Subject: [f2fs-dev] [PATCH 2/3] f2fs: export f2fs_stop_flush_thread() for
 external use
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

Need to stop the flush thread running externally,
so export it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/segment.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b467c0ca1118..0d072b029187 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3732,6 +3732,7 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
+void f2fs_stop_flush_thread(struct f2fs_sb_info *sbi);
 
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 282616e6852a..f0f52979397e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -671,7 +671,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
+void f2fs_stop_flush_thread(struct f2fs_sb_info *sbi)
 {
 	struct flush_cmd_control *fcc = SM_I(sbi)->fcc_info;
 
@@ -681,6 +681,13 @@ void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
 		fcc->f2fs_issue_flush = NULL;
 		kthread_stop(flush_thread);
 	}
+}
+
+void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
+{
+	struct flush_cmd_control *fcc = SM_I(sbi)->fcc_info;
+
+	f2fs_stop_flush_thread(sbi);
 	if (free) {
 		kfree(fcc);
 		SM_I(sbi)->fcc_info = NULL;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
