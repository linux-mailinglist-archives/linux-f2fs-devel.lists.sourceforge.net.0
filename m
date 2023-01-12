Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874666767A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 15:32:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFycn-000445-1T;
	Thu, 12 Jan 2023 14:32:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pFycl-00043s-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 14:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=INLsxzsun77vNOJLo3z1BB4rt0b4lFF14YrvJ1qIRFU=; b=dK4qeCnGHGzgIfvH/ciEH964bM
 D6SIPC8KbE8VAh0zFg2OD1vAW2Jnddg5G2JUfc5vScyhjTEsKQEb2Al++FQdIe8dJwDxg02dpC+zY
 TeAm85n4JqoFx8mLaSZa1uCSBeUjRf8V/ANaTVHkbF5hrBfv4wRQzo3STrmdrIER+Wgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=INLsxzsun77vNOJLo3z1BB4rt0b4lFF14YrvJ1qIRFU=; b=W
 XxcimnPer+FbTUHuvfSWbHt4KcP+PsKN2AFaJlVqP5DPzEtJ0eO32T7X78PipornkocKTpQiXZ7gy
 yEvRv4dRFtma6NNvddBcTa358tPUYD8GjiGYabUY4gHWWxZVeUMnjioBIUqazvM2JdeK4PzKVKu/Z
 R60dqBYF2A9DLHIw=;
Received: from mail-psaapc01on2091.outbound.protection.outlook.com
 ([40.107.255.91] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFych-001890-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 14:32:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImdcQjMiB7rcIapSZ7DiG4XKE0+pvj8zupB4y3fwE67WG9fPa4nsAXVoEyKOVl9fNC4e8uvSlTJ7fhDm4hp4+p35spU3qL6bN3333JABqeOpsSX7hpNAQk/9FsoBP2pvsfKJjmQQCGh+G5ZYF6IaeNQ55cpiom96D2974HeZs8nNjhJ2uAxMNLe2/3J4+qixKIqWccjKcVr400btws9wL2lOGd8B6W54lXU7SovGQLGWdFSEhAfAzc855IYKsDYi/PEQzfcE4OcoP1ACitCPOh2e+1kekw6zQhQzoJfx+RXPjnSIVDPlrs3eB6QOw69nqs1sT1b24oDoQI4f0SIKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INLsxzsun77vNOJLo3z1BB4rt0b4lFF14YrvJ1qIRFU=;
 b=B4aBFXoYYK8ZYArUhi4pr5012ioUABbLYG+sqflPBKh0U5ATlYoBtFr2XNbwYQkPey7pV1xe+GNhRieVobb83sl9HCXAEn9GtwnJ5HGh8cS07mi++xvJMVjoQA7G4SLegFrvFCPqVQ3hg5QyQVJdZmCTa+YTgujc9U1K7tjTbr8Shi5o3hZCmF2tYQq5uC9qs83Wl+eQX1lRwprfXP+JoSiNiEUe06X1jFMXn/WyMg3WRhcI4znW8cV0JUbxP2/IEMRl9bQdVpkvLAuSlWtOZcsyC0MRGz7K/nj/WS87d2lo7sd63AYl73IOZu49arMvHTMyL0xy238/muFRWZ/VUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INLsxzsun77vNOJLo3z1BB4rt0b4lFF14YrvJ1qIRFU=;
 b=hT27lxBbMT+hjuRAoj3r39GJooH/NwNrMK0YQzIOJ2A5b0EGsS2dG72jOhCmuRHeAiGl0/Kf0TLuen8VA1fiWvURKUAf2spuHdXFr8tPccYWTISdq6taw6m133vi4Cws2mc1hF32bTUfL/sYTPPKBJI+zT3k1lSBatJoKcXhWaN01sl9H4cfMDhwyIeRLswdIN7U+DzKP4yqfZBdJ6mABw48pleSd379QkJHjU9Ff7BeXz5qUsZZNda6zATAFduoJQ6oZ3JWMCWSs3T4WH5GFyOq1rHUCdqFfaL4IGEOVpQsWzJ/bVc7DcjFppDcE639Vn2QHUNLmDF+SoqnykS+Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5324.apcprd06.prod.outlook.com (2603:1096:400:1f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 14:32:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 14:32:00 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 12 Jan 2023 22:31:51 +0800
Message-Id: <20230112143151.23921-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c95e13-d87f-4fb4-8fd7-08daf4a9c3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChG1Rsh4jeEvgHQh+Ua2+1F16mxFVxe59X0feqt4yJMheSx3ya2P7uD54Wg9V/9CnUmHTj1CCuDRsEsG9cSu8xoy5GcKzJkgdzp+vrT27muE3adBgATHHwGgIXRwhhpxHAWRQdy5CLJ064/4ImPUOhBBazR4oMaSis/DFRuGyFy+iiemA0pVuplMwv//V8GN0WakACEbA5rKcnUarM5oAiAZ2x0hNv4GFrm0p5QoJK49yqqd5QHYTZpFikOHDX8/E14u+YVgJ0V5q+OketoUTOgcRBvlEyJ5mXOLtOFKha96VbPqqT5/9FG7A1vVdrosz3nniOksBdEo/j5jlWKGjA1JUCkDmc1JrYbs9eRoo7lAWvEXNtMb+kXHbiwv+l9lBYdlJ9a/Xr7ozpfmnbRW1aMavrikhTnxhI24bO9KrVmXCghu5MNIhmCbOWhWrHPYECgBrkFKAEgkZ10b9wOTT4jbfQSGB9d3VgJzYI74PpgcZinp+UWQht8oqsevY2f9YSCttL9ec+4FvQ4M7AQfKwoXJWmAigWWRdk++YJmhkCvvs1gK8PjQLAzGkpeAaoTvrfpR6QpHtLffjeiKtUPgf6QT4fysRhfuSLr8qVWXuB7DjTuh5GuxyywGseDwaY3RbX4pAaSG5HvqaGG2jjmQbv3sGs83IoeD3ZsiyLBJ2SXQfkQc+JbWi4LB4+XHdHDppwGtHvKTWWfvKR06+/j1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(6486002)(8936002)(26005)(186003)(5660300002)(2616005)(38350700002)(38100700002)(8676002)(4326008)(316002)(1076003)(66556008)(66476007)(41300700001)(6512007)(36756003)(66946007)(478600001)(52116002)(86362001)(2906002)(83380400001)(107886003)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOhRegzZDOMQTOeCkZxCK4PUZro4ZNFqemZ6ceyTT4eomO2k4s6D2VdUZbpB?=
 =?us-ascii?Q?wgpK8zffXRNwCdh18SoEXrOjyVV/EFH2tHPu16S9AkCquR0EG/cm9SbwXYAi?=
 =?us-ascii?Q?tI2B7kFIwvkAyAoQS34hwQlXUJp56RkvAjg8a4HqtEbHor6jWtjZIZhUIoin?=
 =?us-ascii?Q?Uo3lD+pjn+hSBxfL+Cd14RR9cDR6hJOWh0G2S46eHLGv5RlYdVPaB2v1J5yv?=
 =?us-ascii?Q?QZU65j5fE79ZRc+1z6IzScCGdzVUr1G7fiV3xOjKP7erRrydBB3fH3IaOTDh?=
 =?us-ascii?Q?MeeamMUNUpXSxJZKnjd9DWG6X6okuW187rzLbmS2kk+ro1l43lULjdeWzzW4?=
 =?us-ascii?Q?F6jxg4qOTGZignEugCGtqW11sYnyZdYxkiBPZgaQ+D7SapakkK2qvl4In9O+?=
 =?us-ascii?Q?pxEPcC9s9ZjbYVrHyL1n9eGihXxcnfnPkxtaSPW4ZT33FJs9vCKQW9cR7Ozb?=
 =?us-ascii?Q?cU9EgxkK2Ddp4CbqW/tCFXM3LSzlMolM1AtZmD/+hYRD52X7/8vXOSA8RwWz?=
 =?us-ascii?Q?RlliMNJ6yd9tMuASjZtG7arONptrHa2wRveIUu4RdqiJ1E6lpiKv1CXkOIoN?=
 =?us-ascii?Q?8nJ0BFPQnQRID5CneJJa8D4jNV4PwXmdBCjGxy+QvbBzBZGz7LCzwuo47O2i?=
 =?us-ascii?Q?SGGmfPW2yJLNsOqddDVXPsCxup2zPpSQSH3o7ODIn9P/7TCufTF18sLPuVLo?=
 =?us-ascii?Q?FcAEpswPUh7rd+LfKAjynF5BE/wM/Oup+FoMxg6lw6lXDrgGzvTAPRkzYzJa?=
 =?us-ascii?Q?E+yREXeAI3lfUgwAcnyALj7MFZcDaY8GP2AiDrgGNvIfH0NSwfd64iYepY9Q?=
 =?us-ascii?Q?4ablHefi4W/BZoMrImNuxGn6XNbq/FdK911ZPif51oP/e0EYKhAgzNwNbI6N?=
 =?us-ascii?Q?1qsZ+w1v1XPPwgYG1BhW8R7H8kaS1buT8URaUAaPbCEHoazzk/J4ZmKxGbk4?=
 =?us-ascii?Q?2rwaIyrPkroVF6yjaZWUf8GMil7jy1kpzQvw4kjTOGoq5fs2ceqShdf1FB9k?=
 =?us-ascii?Q?YBI8mO1gm0T8AfGNCT3w6kmOM70EWAMSDncl/Pj66O+WZdBV2a42TZAYiduO?=
 =?us-ascii?Q?dyAX0jZypGX6izl2gZCQmO0CMlf/AmX1rydMFPwRcseZJjJhvDtdBrOKOQ0M?=
 =?us-ascii?Q?7PeCDekaIRBVABgNkc38UQFwNMc919rLUAN013SdSAGRHhz3whhxz8TfcA6V?=
 =?us-ascii?Q?aWntOSO20lcI9kVvV7l4xCthN+UsvWW35npGVeqwAj2ndJHlLHONyQSjvMmc?=
 =?us-ascii?Q?VppihGWp6tYfiYLTEPdmPWOyajkc0cK7LAM7nxw4fyAZa6Jacan9JqqdR50V?=
 =?us-ascii?Q?J4NxTToGwIoR0m2eLYJhw7+lGamVSeuXcnASVn9twya6BDCvGWoqUncs19MM?=
 =?us-ascii?Q?1vXh5WYCo5poBx9DUpoKzX+Zcvg0XGyAR0hBtPfTrHSBkPjcDKUXwiuDAtNB?=
 =?us-ascii?Q?JUCNnITQQSauxEqcWW5JS+H9qehBsAkWp7zVd/6mpXa16iLHq5Lv9JExx0N1?=
 =?us-ascii?Q?8A/rkRMFELhi47XMdhe4zB6HIxCIs8kPJmSnM/84tME8gEWiXFl9VGAWuo/n?=
 =?us-ascii?Q?Y6E3vrqV7vFDf7blmUT8yvAE/24bKwiS51/eQotZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c95e13-d87f-4fb4-8fd7-08daf4a9c3c6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 14:31:59.9129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD7xsJYg808oUF/yP93d3nmdd4A6qTbiOdagpwLjnlPGsExdnAxVV+28/hRk0H4XmG21pk4tuoIkA1YeUUE0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5324
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  is_extension_exist() only return two values, 0 or 1. So there
 is no need to use int type. Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- fs/f2fs/namei.c | 12 ++++++------ 1 file changed, 6 insertions(+), 6
 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.91 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.91 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pFych-001890-J1
Subject: [f2fs-dev] [PATCH] f2fs: convert is_extension_exist() to return
 bool type
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

is_extension_exist() only return two values, 0 or 1.
So there is no need to use int type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/namei.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 6032589099ce..516968cbc6d6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -22,7 +22,7 @@
 #include "acl.h"
 #include <trace/events/f2fs.h>
 
-static inline int is_extension_exist(const unsigned char *s, const char *sub,
+static inline bool is_extension_exist(const unsigned char *s, const char *sub,
 						bool tmp_ext)
 {
 	size_t slen = strlen(s);
@@ -30,19 +30,19 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
 	int i;
 
 	if (sublen == 1 && *sub == '*')
-		return 1;
+		return true;
 
 	/*
 	 * filename format of multimedia file should be defined as:
 	 * "filename + '.' + extension + (optional: '.' + temp extension)".
 	 */
 	if (slen < sublen + 2)
-		return 0;
+		return false;
 
 	if (!tmp_ext) {
 		/* file has no temp extension */
 		if (s[slen - sublen - 1] != '.')
-			return 0;
+			return false;
 		return !strncasecmp(s + slen - sublen, sub, sublen);
 	}
 
@@ -50,10 +50,10 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
 		if (s[i] != '.')
 			continue;
 		if (!strncasecmp(s + i + 1, sub, sublen))
-			return 1;
+			return true;
 	}
 
-	return 0;
+	return false;
 }
 
 int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
