Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 417CD631B64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 09:28:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ox2Ad-0007XB-Cq;
	Mon, 21 Nov 2022 08:28:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ox2AO-0007Ww-Lk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 08:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlU4dUKddj8QxH0PxMegnX3So+QtXEqwfW6MRmxiMwc=; b=Z7XJOJMegNU3iv1Om7lnbOLias
 Xg1uC6YG9x5DJeSnCyTgma14vOdsErUFdW4aenLjxHMyiS/D0PJ95FPeXqyuv2F5XObaeRYiqWlOF
 AKLjbXjCOVr2Ve/PBt38Zadkapy5GtFivHnBJA2f2ySM7LwDfNd5CyK+pLv1yzPkdgks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IlU4dUKddj8QxH0PxMegnX3So+QtXEqwfW6MRmxiMwc=; b=F
 lg2fdFWUkaT0AnMYnDDM1AnqAk5PJTS3HezmcmrEp+G/AbiO/XrG3pK2qeMPSOczGhxcbU/at0qB/
 fYYoSlUaxJL0jYKmKfX4I5Jxv2XQiLkxo3aoBF519n9rhnaM995aDoChfk34V/IwaKRWuFybazM7C
 nPn89MCwO6vrGsCY=;
Received: from mail-sgaapc01on2136.outbound.protection.outlook.com
 ([40.107.215.136] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ox2AG-005K5U-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 08:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+o2naJHGUnRRZYaJK74UMrlyKkvvGjexQVUJRB6qqY8B7CvSDVVegECoifwdQigJOPHcDEpUWWCIWVQVWd+DQj1OPq7xqJ2N/x7Jc++/3by4gN/s/gfsPA+2bzTXWHGDgvfns/UKZbqgCrWDXPIJ3RWeAp0FlTWrx+M015wmh9/A7cezxVitgcpWuBTbyF2nmrmIP8G4kVuY142ihfSJUfyT9vKIvqo1SXhzrUS1rpiYp/HaQegk4d+KJ8s22PNiJxOO+qa8r/PGR8zC1C6MWir2AjCgn6n4uGCNqUB10LMcqLS6AGdPsrFgulotNy2JtwSt5Vq0tZ+OStpGgxNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlU4dUKddj8QxH0PxMegnX3So+QtXEqwfW6MRmxiMwc=;
 b=kObnySPn/PbU0vPi8Ya+JEeiphNcYJIPov5L1p2XZf2ArKRlDadY6Ho2wumPOx4GTIaWVDDuD3xEeybzpA2NEy2NV8HBm0ZVrOqUzKpMp4d1XDPufkkp5iABu6h7ZZuSKUuHH9Roe4IugbcAAbEaXGhpLP+omgNmWyCnURcA7TLJMV7nyyuwA8G45mfs8NVc65CSzsmoYFfhvjpWDeUBto3W5JB86naMRKcK2UK3eOAe80WPv/rWUcuC5458xyOUKVD7ujl969L6zm6xn/qQ+NJemUViVGDw44ZY50l5sd2I43mrDx89PEfPrC/tOCRGTdWPAZ4glPAZQSVLe4GHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlU4dUKddj8QxH0PxMegnX3So+QtXEqwfW6MRmxiMwc=;
 b=d6N4yE0LAKFzq0zsOFwjCAP0R3t9KVH+9QZ5yoaC0tgRleFGgGHl7Ju5Foj2fwSAdFhWBi16MC4Vb0rjpLMuELOhRf6yJWfXGqC3pd7H790Dhu9O0H7+F52LjTbFbHhTF7Vy1Ee5Q4ccjnsQAguR2hy6utzZ3eGdmYojW9Sp1cuJrv3W2oqSVMSzPSxrL3IFYQMFVkDrui6GTb3B2FcXbLSOaNkyJYrLXkJDczg1ntfMQhbzcRC1ygIBJ4Grs5J4TTEOGi3ouEnUcB4eM/s/40/zPDmrwP9413C4c6JHBGl3ZvoH/ykgUx6bZTV1oe9aBumDhhTJsSrAOpn1Gt55dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5001.apcprd06.prod.outlook.com (2603:1096:400:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 08:28:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 08:28:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 21 Nov 2022 16:28:03 +0800
Message-Id: <20221121082803.58694-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca5f25c-261a-47e3-984d-08dacb9a54c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FvCgUqeekKxMTXzO+cn7V5oSa0XuX8dnn3sVojL8Kws7lMBFnVj5wkT0bEErAu7sj8xPEdHxvRtc04NU4hzGusYKNGflCNTLHJuiwQsWq2jslWdau2IbP/Yy8V9+hJdjdc/YnSzUPk9btudHRLwOA52yO8BSR+JfgjKrUoPv2U2Iv14HuDkP/dogSpTdewKCcI4UELwKSWEz3cWCw2Sx7XQK7nOqwdJefGmKRWDGiJd3acPEl2sIOX8r0GSm0BB+gcvl2vKQ7oFv18QPKyEh35MJDlzErrSO1hJxguWtbB4oSZtqTTyNl+YfEvBSLhZouT30wUYVVMxsnNh4b9lVu3kV9qDAQYbdyEIsbLeb6jSqj+qWX3YNbwJLiew9jXhaWjc6IvN137HOqIqwZ3LCg8uL9bOTu5lWwVIq95Ssyas78pTzDGh53ZLZHYFop5f9lRJQEcb4J97Wf6H3o1xtPEnk0vaKw8dzruDtKIyyAh/iDr+Jt6dcAQsthA0ZrF+dVhX9kPvjcKVXEW909dNPMYApnjvVQnWPVBZ45k2d3jlBbbN8ntdSvg2FLEpQPoRxDfgU5FnbmUqzOGXOcpmFzKouShsLSzKEPcPmy4j46KxMiWaw66PefkotPK6uBeXJTh4suEWppSdkxn42XUCHxZN9Zefos09A6YEDAuUcv0hnOgYZNpLJlW7mHY3A4vUtVvUU9XiEcYEIwRVPVxNUoVpI5mIHT/h00o4Hlb9AB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(451199015)(6486002)(478600001)(6506007)(52116002)(6666004)(107886003)(86362001)(6512007)(38350700002)(316002)(26005)(38100700002)(19627235002)(83380400001)(2906002)(66946007)(4326008)(66476007)(66556008)(8676002)(41300700001)(8936002)(186003)(2616005)(36756003)(1076003)(5660300002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I2AgKfoR2COIp5YrbYjmxp5ayEDbZMfVPOlRu8s6+r5kzYpNDqx+7AMtoZRi?=
 =?us-ascii?Q?zZB7oDqOfNx+TfIYUx73mXFpN2xdmu1A7E2GEDVfGfyHk8fmX7ZsNrbbcFgR?=
 =?us-ascii?Q?WStty1Xl+hXpE1bWprangvW2O0GTt9wK70BRdNj0dKvRLxWNkpUVROMnrIFp?=
 =?us-ascii?Q?OKhfeFcwUtCUJ5eSygwLYqHxMfqBVE8ouJ10Nxi1J9auVec22nDhvKMVgotk?=
 =?us-ascii?Q?mDYRmBxJKJUEyWi3cZYOMprXwSHqPk6wfb3RUkkNgBz1QXgQd2ieXelJiMiw?=
 =?us-ascii?Q?fuwZgJRgKNSM4qjv11dR3b80yM2zwang2UQk3Axahz0Ov9uTzqvC+8FQoHP3?=
 =?us-ascii?Q?lZV5YMiF1yauS1YtrK9iLI0wHjPvVJiV1bAQkOrtEV0dv2zG1fJuTHC3iF63?=
 =?us-ascii?Q?+bLxKYRcKWrIQj9qp8vEb4tCW5FhCVYzyxIf/axwOQYFlOn7xWx/fllLrdlh?=
 =?us-ascii?Q?o2SGegsVx1yebSgNTASMcuDQ76J9TGuTeHqCZWM8aPxn6IlZosgPFMAzaD7l?=
 =?us-ascii?Q?QKIJIrD0w7UMMjud72dkZ6Hco9nrt/3YjtVozWC82eOJepRKXEO0B0s+KCdv?=
 =?us-ascii?Q?YXBpwFM5mYMJUmr+cJsP8kTP4elLLIvhwFUtZ3vWO+c8FTHHz9XZJT/Dh5SL?=
 =?us-ascii?Q?vNzGt3Qba1SvdIG9kcKK35oQprCBT0iQQ1JHVBLLMFsynTYkCcQ5dpyLG35V?=
 =?us-ascii?Q?1gpt0yoPdlXzpYOJLeN52smbEW8FpEF0G+WYGYPk4SaS2lM0zURo8SqURxI1?=
 =?us-ascii?Q?Q1JRwMjvliz6QxIf+P1s+YF9qC/gDCjseuMz7Y7zLV6jYHkHDlsyNfOkxZOy?=
 =?us-ascii?Q?/arlsJekg1+AgNYN4XR2v8eB5W22XQiy28kVPbHK1RfIlJmFsGue/e9f/nM5?=
 =?us-ascii?Q?Uw8W4lXAOOmdVnBcdmKFwtI0luOK33JcnrKbSOY7Kv554ZjBGgGqbgoqSn4M?=
 =?us-ascii?Q?9bOaC95XPTvbH9ndfttn7W89bSqQ3R7ieKTbqtEnw4tSnv4Z6lvsigE63pec?=
 =?us-ascii?Q?1nPfmEydqVnfwdMv6XA8Q38UUifjJ+G2a4mJ7vb8JFzWF73xzvUX4IIBLebG?=
 =?us-ascii?Q?krioY4lSzSyszyXqyT5Hqx0qi5yGPlkLqxEnL0PgVrrxuIWC5ISpfJ3hQFfk?=
 =?us-ascii?Q?MYmnPCNyQ/RK4IyxYEYqwktxWVDgt+M4K2zVvL4qeZpruRLPMN+4xBjA+cH1?=
 =?us-ascii?Q?Ws2RWreUZn4P8+flKmnBPMP/1x7uMj8mC10YKpaIx5mecmd73qvs+WjA/Grw?=
 =?us-ascii?Q?zi43QmaXTclxI2wKdn/S5dIZ5G609NTCjI57wYkQ76IaVwRWfx5RGd6lLwie?=
 =?us-ascii?Q?nrSqVMd+q5gPQeWf7beLUSjfjbIYpJVDVt6KiDJJb1HJEYeJjQhklHeeEt2e?=
 =?us-ascii?Q?7JJxI6rYeJdrmO/GK93zvoKZ1ujRUBtcmVAot67A2NJs/+fkzNBSocfiCuHY?=
 =?us-ascii?Q?ku9WHKKzqPJyTx/65+vpW9EsAmEa+fhUfvIRFI9SDBgO5uKb+6n6FuTCK197?=
 =?us-ascii?Q?K6JSyv9nciLe0ZPfMC9mGyrCN80RQg9GZM/tKKk3N+qOrXiPs4BDyhtDEXTV?=
 =?us-ascii?Q?kv7/yCGcPBVGnBAuoJ+bTAn2K5qVUxBHgY9ECfye?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca5f25c-261a-47e3-984d-08dacb9a54c6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:28:13.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMV9TKMAq6e9Bcai402pFZ1rwZJ2Wj7o4am8rbdN/z+XgWjvnZjVa/RbwjZCtkiSpoEu46tfEPD7vA4N8J/6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5001
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 'discard_submit' sysfs node controls whether discard threads
 are allowed to submit discard commands. And writing a non-zero value to this
 node will force the discard thread to wake up immediately. Some scenarios
 where this node can be used: 1. A large number of unsubmitted discards have
 accumulated, and the thread still runs at the max_discard_issue_time interval, 
 and the thread needs to be wok [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.136 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.136 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ox2AG-005K5U-S4
Subject: [f2fs-dev] [PATCH] f2fs: introduce discard_submit sysfs node
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

'discard_submit' sysfs node controls whether discard
threads are allowed to submit discard commands. And
writing a non-zero value to this node will force the
discard thread to wake up immediately.

Some scenarios where this node can be used:
  1. A large number of unsubmitted discards have accumulated,
	 and the thread still runs at the max_discard_issue_time
	 interval, and the thread needs to be woken up.
  2. A large number of discards have been accumulated, which
	 will affect the submission of other commands of the device
	 when submitting.
  3. In some specific scenarios, it is necessary to observe the
	 regularity and distribution of the discard command to
	 optimize the discard merging algorithm or other.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/segment.c                       |  8 ++++++++
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 30 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 24e7cb77f265..2f42ce42ab9e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -646,3 +646,13 @@ Date:		October 2022
 Contact:	"Yangtao Li" <frank.li@vivo.com>
 Description:	Show the current gc_mode as a string.
 		This is a read-only entry.
+
+What:		/sys/fs/f2fs/<disk>/discard_submit
+Date:		November 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls whether discard threads are allowed to submit discard commands.
+		When set to 0, the discard thread running time will be changed to max_discard_issue_time,
+		and the discard command will not be sent to the device. Otherwise, writing other
+		values to this node will force the discard thread to wake up immediately, and
+		the discard command will be allowed to be sent to the device.
+		Default: 1
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f0833638f59e..81e5816e4b34 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -420,6 +420,7 @@ struct discard_cmd_control {
 	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
 	struct rb_root_cached root;		/* root of discard rb-tree */
 	bool rbtree_check;			/* config for consistence check */
+	bool discard_submit;		/* allow submit discard cmd or not */
 };
 
 /* for the list of fsync inodes, used only during recovery */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..5b0a67ccdac3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1115,6 +1115,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		return 0;
 
+	if (!dcc->discard_submit)
+		return 0;
+
 	trace_f2fs_issue_discard(bdev, dc->start, dc->len);
 
 	lstart = dc->lstart;
@@ -1717,6 +1720,10 @@ static int issue_discard_thread(void *data)
 			wait_ms = dpolicy.max_interval;
 			continue;
 		}
+		if (!dcc->discard_submit) {
+			wait_ms = dpolicy.max_interval;
+			continue;
+		}
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			continue;
 
@@ -2085,6 +2092,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
 	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
 	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
+	dcc->discard_submit = true;
 	dcc->undiscard_blks = 0;
 	dcc->next_pos = 0;
 	dcc->root = RB_ROOT_CACHED;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 33ec467b3772..b6f017b4d565 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -661,6 +661,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_submit")) {
+		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+		dcc->discard_submit = !!t;
+		if (dcc->discard_submit)
+			wake_up_discard_thread(sbi, true);
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -800,6 +809,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_submit, discard_submit);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
@@ -930,6 +940,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_discard_issue_time),
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
+	ATTR_LIST(discard_submit),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
