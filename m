Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7762FBD2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Nov 2022 18:41:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ow5ML-0005mN-2d;
	Fri, 18 Nov 2022 17:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ow5MG-0005mB-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 17:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LDwuWC9zt+tQ2uYJl+6EFV0UgX8G1S2XNuiwSk8RQig=; b=OXcQw3YH22ih7WOq8oTsVXKy1V
 87HbKJCWHeED3hcse/m+vviPw0/xqb+FRyTQX4inr2onZ4C7plLO5/PEFk+uAJsjfTIc4JI3RIkLA
 QeSMYmrz56uK7zaItxpv71KYQHrT8Nac3aC30Gp/qcpFV/RuiQSSSFcRUBb3rAZoiGHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LDwuWC9zt+tQ2uYJl+6EFV0UgX8G1S2XNuiwSk8RQig=; b=M
 9sgnDDQ6O4yssyLFLYb47iLY3hpxX6wiP/stZnnicpaK71wzzFQI+JvMTI473HZEy7+peeJjggqpw
 Gp8E8C1/InSVYWWQhr9DNdRw7KARExHdMgygxTEmwvCfPSLlINUXHf59/nIUNImxXAjATEHrPHrac
 mfQzmvy1ZmgIZeeU=;
Received: from mail-psaapc01on2094.outbound.protection.outlook.com
 ([40.107.255.94] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ow5MF-00ClTi-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 17:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lageZJkc33pL7CXW4/ymN04sqSi7W8COah/UFdUglVlyYL11LMjjMER18ZrUWlRaRvZUow1lpK0b10bTyd3l9uMm5s81Cx/LuD2v7wyToWYsJFxOlzCAzokKi1yVYBOJNTN5lAv/HPeeBUSwFzUJISf9CVeEd1GgHgYBcwENtLDqEqt1L8W6xJvpLG8GwrJfcH4Az2WI2cUcQtZ/6N+29+2xGASSdV5b4SBeHjcQHZAnipCHqP9YQvAM0AHr0fUzGT/L20SfJNVN/i9s46o6MBHpU0SWy/Yjr/WEw9MBTTSymX9NryuMhwIEZF41B0f/u5iVa9DU6PzgNwtmnLZvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDwuWC9zt+tQ2uYJl+6EFV0UgX8G1S2XNuiwSk8RQig=;
 b=XJyu65sRrqTk5XQBRNCu6L5YsKoOyItg8qcylMuZNcLZDpdH3h9kjr8VUwevf6BVTw1H1VQ7lQpOFKjBnFP4W8fimQnucP5T7XZ3uQCCq5DOR8P89fMKJpvnrV7/371BYufCjTiiYDP/bsb16dq7fuwUH18Omn7oA/Yik3NH/UTCYDfodsWG11VV9RAxz/bxFSwYihkrpJeMrN2C3nJ/ct7Bgkw+6IH9lba9e+hICM3MJ+XfW4pEqrHHgteM0+yFyoUfKk8XBSkKRDX3xWQrsgohBNI56hXs7+EzVPzuUaVIT/nxbbUj6o5MdVx2jtXYKAOXncnidSVY3okgYw0K2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDwuWC9zt+tQ2uYJl+6EFV0UgX8G1S2XNuiwSk8RQig=;
 b=keB2yV2VZ/AOjVkEQM8taQ+3KS4KWmfBblsI7Cv8lhuCWsP+J0WlrWLSoWTg03NPHx/V9CP2U+ytIlNdS9mOjx6dQQp/f4PbuxCKCA17uBRWt4g2D4ndavBmnoAU5XBPl/kPxbgahLlq/3hC3jSTTUtSjYsCy5qExxqHXpvmy24+r6MN8n5NtGeODSzXZemRs+8VuhOXeapbyBpOgKlyGMP305qafvTrSnTKacJx8XCzZKrxbU0KnYnPQADMTGCHlt+k2OJUFqLgoREUpxwUoT/Rfyjd2sAhSfRpR+unD2UxrcS4K9xaXofoE4qw+qfpcv8sobsxH70079KRTjsh4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5749.apcprd06.prod.outlook.com (2603:1096:820:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 17:40:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 17:40:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 19 Nov 2022 01:40:28 +0800
Message-Id: <20221118174028.63702-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: e3875e51-09f0-4c1a-55ca-08dac98c0453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2aGwfiny7eg6KBVZJQQdscewfMb2MCKCrAMqBxksmazgkBLdz9uk21DQsNresJgk0CECL89Abmtb8L7eRO+gCTGqHP1JMSFiNFXR3eP9W5RIIYMdpCxXi34L4hcqPhpjFg5MtqNYyDqTRGLb/asThbpmnITTTn7tLy6/6bA5oYO4IQA6nEbBJNC2QnFhQnkYvxJZwEawRpk+/1CRoLKOLGezFyyCC2lGozLLSAscaqtaj9HcFlsZsBILhkljte5HKiLkmKRuDxBqKVh8Zxy1AXFON3Fa5A6MbWHhJVGCTXI8SDMdvhXWYO3R25OP8k0uGKnUC7wJwNwODmfKWWrlQ6vbk30AnXj++JraUN+I0ntJ1Xq1v50ndgpWG5umfLVUiN0r3SjcZCg9msZ7VdAka4viTbXNHEi0L5786JQHyJB4iMBDJ1bLpokDQI+wjjxzBPxjuYK9OOTiWj7xU5PVp+1I4yu4X+P4czegALfGdPiZD00jV+PyDezWHBKW+YgqpvIaFhDDInDhrKnr995wFdqPqRNZgi2lTSJ45z4QpnQFUTlfWLQHFvfOmG6VVY65GSrStlSP0ED9WZ5ptSXih+BzbyClsYt/IiOE27nURC9e8xxcoqVlfgpUgnN6nSobjKhAtT0BFKysuU1qxT6/Rx0HGb52BfjD6Dl4omjqiKtGiqtT/81CkvJEY09IVWt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199015)(1076003)(2616005)(186003)(83380400001)(38100700002)(38350700002)(4326008)(86362001)(41300700001)(19627235002)(26005)(6506007)(6512007)(6666004)(52116002)(2906002)(107886003)(5660300002)(66476007)(8676002)(4744005)(66946007)(66556008)(478600001)(316002)(6486002)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fa6T9jfkoaEvbiXwq4n6MBsb0E9IC85GEyt+vprtbGOSE/AFw1EyUSV8MPvj?=
 =?us-ascii?Q?ZoiyXAXPq3sSgsFluT+n8LGDbAW34EYOm+7xldq5BUbkZPBYGUXW8/cK2Sl4?=
 =?us-ascii?Q?J1odfbsca2XkHjYukVKiWGhj8dNFOHmJTo2dC2cP/EMPYXaINtoWC2umABse?=
 =?us-ascii?Q?Ec4MVvRRy9S8HuYaGL4JIiBClx0hzkEQTArPeFk+lh/u7qeJT33ilWyndZsP?=
 =?us-ascii?Q?9rb1Db1Huzxbik26AYn5trh0Y4nEjfZhc2vlU6MP5hSlFerIyNKKivvYiwAw?=
 =?us-ascii?Q?mbK5anvUe6H/r81SNVyA0ZDK028SuJl9CiPNhPKrR6mtou7geUNPwKDvWIZ6?=
 =?us-ascii?Q?V1xp5ZEoclh0/HZ40sKfjde6N1lRC9+p0yJIu9Nab16qG7IbQe1pPwp85wOv?=
 =?us-ascii?Q?gXEOH42MzU1yzCUAt750sd/7HvXc5WQppcBM71l72UIrMV9del/ZfTw4WYwn?=
 =?us-ascii?Q?UtRdsnQonIMYvungIGs9cQxl8H4evSVtsebVTniAqrQE52u1dK+Lu8NNZ+uP?=
 =?us-ascii?Q?yrhxmMWQbym9q7etDA7X6QCyFNJifh1oMHc7yjRju2spV6PRTxeXYbk1810c?=
 =?us-ascii?Q?Bk3e9yvZJIYcrR5miffdHnfqEpbmogh7cmeofyenkQDNzTHZq+cjI27CQzXg?=
 =?us-ascii?Q?6NqeAY+fnNdQlOwwUh2CVdc5qNyJf054UUSOCDttPIUI90Q4qFKWNEUo2308?=
 =?us-ascii?Q?Ff9eOWXOdIFWmfGfxV4hFflYLS9TtZamlZ6Tb3+2C4YNbZeePczjsrP0Wmxv?=
 =?us-ascii?Q?yTM43T7TqqApDzsKdeRuDQkVYHqKIhk87S5YITty+hnRAHOr7R/SysUxW6aj?=
 =?us-ascii?Q?sNcO+U8knf52z4v4mIR9HffgUWAucmXsniOrvZEodMvqQu2Ek3KKTz0hVCVr?=
 =?us-ascii?Q?J1Q3SmkimfyAUc/XKXz42oT9WG8ObXVAVSztJi4ucDIipO/UaADx0NwLS7aK?=
 =?us-ascii?Q?Px5m1rsFUz3hzq3Omb0awH6gV3OK+U/+Y0QEuWrNueU0U4etjf7Yl7D0Q3k6?=
 =?us-ascii?Q?I//LqeRuZJTZSXtxS+YFVXAdrG7vP3dirHIYXO9LC0l0YeFHSWCL1VgiPYcB?=
 =?us-ascii?Q?ymdbwTYWTPJH3SihoEqwKsHZxx0RKuKhCHToTdUT3D93h6evgtFcfqXs9hKX?=
 =?us-ascii?Q?9fdbE4K59b3YrPAz9jWCk5PJg+MJWkoyWgEWJZeU8i1y/3+bsVEqvbqFShVP?=
 =?us-ascii?Q?cr3lLSIz6/kVeQ14QwssUCyhDThUtHcEkoHYCCMS3/1UO3kIt4J34rol/Chs?=
 =?us-ascii?Q?+cL6Zc/Lm6XYEXrltcqiUMpSUnZAAJlx1Q2lveU9W8x+IgqaBcBxk6w15hxe?=
 =?us-ascii?Q?5Y+C8o7k3dHu7FLv+oGOo4eS1u/t8yCtqJpThhAhn9vWeZ3qgGTzVu8LacM2?=
 =?us-ascii?Q?fGxvMqwFNdF+EmDTY0DFMi3qs8HeC0BODdzEeNJ53MkihgdKhjRR2wlVxSHo?=
 =?us-ascii?Q?nkxznUQGl9EjnmKKKOIuzGQBtXck3cdC0yDfnQOvDLMgtZDjgzQxn7QcrJhi?=
 =?us-ascii?Q?9xeMBEnLCBWkw55rurb0MzBPGssMD3SVAXK4OFALS7TeFrQ5AOqoIEbSzZQz?=
 =?us-ascii?Q?HrWg5dFyS9t92Us/E8SjdZRE/ZXVQC2BaVs5/y4e?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3875e51-09f0-4c1a-55ca-08dac98c0453
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 17:40:43.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGJaJtKJ/pWo8COXMdYqVOhNhMV6e2XPXl/VMUE8oiTfdTAOo3f6qEHdWW9mmRMOQBQHTBT+dHFnvs1JuEZ2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5749
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's fix the inconsistency in the text description. Default
 discard granularity is 16. For small devices,
 default value is 1. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- Documentation/ABI/testing/sysfs-fs-f2fs
 | 3 ++- 1 file changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.94 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.94 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ow5MF-00ClTi-Ec
Subject: [f2fs-dev] [PATCH] f2fs: fix description about discard_granularity
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

Let's fix the inconsistency in the text description.
Default discard granularity is 16. For small devices,
default value is 1.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 24e7cb77f265..32404781e76f 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -138,7 +138,8 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	Controls discard granularity of inner discard thread. Inner thread
 		will not issue discards with size that is smaller than granularity.
 		The unit size is one block(4KB), now only support configuring
-		in range of [1, 512]. Default value is 4(=16KB).
+		in range of [1, 512]. Default value is 16.
+		For small devices, default value is 1.
 
 What:		/sys/fs/f2fs/<disk>/umount_discard_timeout
 Date:		January 2019
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
