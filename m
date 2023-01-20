Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA9675606
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 14:41:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIrdq-0003Fw-0E;
	Fri, 20 Jan 2023 13:41:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIrdo-0003Fd-4y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U5emMNXcn5nO4RQsCH/yOtGcWvmEc1t6pdeO4lYcqJU=; b=nFC2npC7geYyjmVt47suMDIxoS
 PjjEIBjTkvYa2V2PQ+rmT5cEchZeG59Hhr8qAe8AsyfGonYDQW0k5z4KphQEuWf+Vn/pluAxVgl2H
 RL7PkrRrKlpHhIHfLB1p97b6HHeUXZQ0jGIY5Zw/PPdrjuRMMMWihlMn5adWodm0d9Uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5emMNXcn5nO4RQsCH/yOtGcWvmEc1t6pdeO4lYcqJU=; b=IHYlDd34djJILxn2+BRCnPyCBB
 KLXE8OCVhrQixuiFA7wswj7M25UKvhI+QkHcd4K8S49YdU0sCex6XUF4EGETSfNQjXG5v7yTe+/am
 sboUgwzQnBJJ6p160rJ4e70n5MfCEtt5xBnr++awFVFUsrKHWIAmt8YBeL2lf8T12kIA=;
Received: from mail-psaapc01on2129.outbound.protection.outlook.com
 ([40.107.255.129] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIrdl-00AF7t-L1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTxvMjxd5b+5u790FetDa3dUnWNuSrf5l9xYK3q+KM7EgYjJWgEWmrBoIJHm6jDJALKiScDpYNvV5rDuwZYPhctu8MJfHASa/hSxg0uc2WweA7+XMWiu5rzqbyZJK/fH89/dPkJBukPg4by9idMsSYXr/ZOiuVg/fLYNRDste9pQcgMwinVGHHJVO4NwCmXDZTUmb6cVOvtvLd00zi0tipJl5QJR5TN8UPt4bVfySQ0EWratghuVo+cEzta5WJHugFLcHQKBKlzhPE3PbJgTegTB7+Vhf9Mmz/kn1HPD9uGTt9WZ0MKfluNzoMVLAE5AtL5WWcz7mibF85exYEUcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5emMNXcn5nO4RQsCH/yOtGcWvmEc1t6pdeO4lYcqJU=;
 b=j1kYe+X9ec9rDig3PUT11XGugEdHBYLDPCS0ZSgePaze7y7iBhr3Qn631QeuxCI8JSWlXwnONGo/k8ZjUHM5IySshXkkWQoRrpSkSXXwXGKf01GJGallfH6cErGD2IOuTvmkeQZJSjfw5YiImTpVL3MSoUvWSqR9OfC0JVOaWeNopVsnW4bj2StO+5LRv6w74if2r+L82lHgTHd5UJhN1ULC045g5gLM0aLYQsc0iJlMaz2sFYSVli7+2LPqD7OVPXSDRpklDW5Jn4CrGv2vacxkb5dB4Q3MxwTI2QNx3xsoE9JLSNLbhtPckZfWKahkcuCcJ8II5u9hMLgpBjynmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5emMNXcn5nO4RQsCH/yOtGcWvmEc1t6pdeO4lYcqJU=;
 b=bihMwYZzrX51oJjGWlC3xoL958U387HIYZUxj23vElANOwmqEPuMJlAzjKIRPD2Ep1NHwgxaFep7ssxC+eE1v6a9+FU4lECkGJ+0K0u9GDF6UBGdXbX0of0SW5id4v6itF45LTDog51bF0oZGjLAYkKFwK4u64Re6d6v00Oz9R0M4ZNES+1sT+z4w7GZhBgTjANmy1yZ+5ogYpL+WXuL1la80CRY0V/8FGw+eg/DH6aeiqYEoguffqiEOo7DAv0XLTKb6bJm/TT9RXGSPtvWHisU9SN59SV2J92im9yB64HOZApfjMKfOA1dVI+hRljUMywKvLiSlDMngpcariQpPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5127.apcprd06.prod.outlook.com (2603:1096:400:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 13:40:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 13:40:54 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 20 Jan 2023 21:40:28 +0800
Message-Id: <20230120134029.69200-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230120134029.69200-1-frank.li@vivo.com>
References: <20230120134029.69200-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cddac8-d20c-43df-47ca-08dafaebf3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MXvqp9MScye/SjJZRoqqU7y+AWyeMm4p7BaFHPSH0E5dweOXOXzADDc6jtSIZijr2Qk4Iw3jP4DaN5vM64vWj1dggPB49xVclPmGB/sZ4CFCDkXdRXdHEn3j/jk2PZ/Var18u2Q4xV1qPwNa8iSBw9x0F9wnnjJxoeCNKtbge8yUrib7FKvPPnRairn4m3KipCTUiKK84xB2K8olk0as9Jxibm2w/5uSOV5XeB2Wmxs0Hls2Bt1WZjZBKIqvZ8PdVF+6S/6qjbHVmVeqy+kgfcd0sXo1yn6tAfmEz4eyH4K1pgotjlZhPnskzAaHxBl/uINCiFEcciPHkC2qCj4qt+rJCBCYvLC18eCOO65zghGMfRgbZoJyh6OxhPjbF+dZEcf4pUjZEIH2VN0JJonf77MtCooaDlRjhaVRss8vwuIUAhCFv9rldcHio641/uD3DKQ5QFieRlxdeVWLOprnKpLEi5m54LpxSgDj7+EVTP+vF57y85+LT36wsQlHCUQJiLjukr5ey3WQvf9dSDfEjtp82MiprlYfOiu7I4MV4ba/6eRTZkITfUNV+bxLcXhpOf47/rZ2E0xzDD4IU8UGYY2JlLgTzLKe6iJlN91IkJfkxeQ8mj0gXO1SJUqueTv0UNmXSPKwNr27+f3QaqOsygR6nHgs2MVNVEB88gymbXgFd+FjqBIC6twrbOf7cVhux3huNogiyD+L2ouhkIsIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(19627235002)(316002)(38350700002)(6506007)(38100700002)(66556008)(66476007)(66946007)(6666004)(107886003)(2906002)(1076003)(2616005)(4326008)(26005)(52116002)(478600001)(8676002)(8936002)(186003)(6512007)(5660300002)(83380400001)(36756003)(41300700001)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wPjxsoFdVHRgNrUK6yA0oS9z0Y9VTXQn4ObcUtAM1f6iXb0kyAChyQTfSnFc?=
 =?us-ascii?Q?Iqj8xcZLHmblvuLLfrjmDYgB74KplaA3iFbNtuChAnfbN3Ig8Wg9yoDsw9A2?=
 =?us-ascii?Q?pAVrVp6uq7EuUiAfDig5zOIzmrZV7cddY42LxgyHTpzazRSpYUWWjqfvAvDg?=
 =?us-ascii?Q?+fafHnft+886lHg9aoyd5nCtRIqC8+Lf7o9DlvR6zh1+5nBp6RrU/LhN6iT2?=
 =?us-ascii?Q?+/G/0DpjQ4fBail9q7g+caxtjsTmVDs7H+v4Fh+8sJZc4JATS5OyNf7Yi9w+?=
 =?us-ascii?Q?YLwu416g9NFsNbaVNWFXZjeEKxCeWhWSlqEmiBGWy5hHipiiQIFxQ+Ay5Bm/?=
 =?us-ascii?Q?C45lePEZcYNVOQT/CgmrLU19i3hQAiPO/PNU2E0u5cicaDtGrd14Vzokxrgk?=
 =?us-ascii?Q?iLTsGy7AqNyXH2q2ffZV2eQTr+byvctF1jRmKflLB7TWbhs3WQPrRV7HMC6T?=
 =?us-ascii?Q?43dZTkOZSRI+BiON8Cnjy6cv9JmSNcJ8IbfSVkf5f5KbsTaFwUt9+xJ4DL22?=
 =?us-ascii?Q?chhRbwiLprWh33MEYdQGlX/895EJ16f/V17PxoETCtubjfBa7j2VpYfaijjI?=
 =?us-ascii?Q?WtEQGUz29jtFgvLbCs5bsumrpAbzYZpf1oJdrpPsZup2Lb8YHxb5ToVdIx7E?=
 =?us-ascii?Q?V8J7PM1sr7OMXo4mI7WgDu8yGDGplw4u7vK9cZ4SXn3uVUHk0NWv8qqZg6p+?=
 =?us-ascii?Q?fLc6D+jFtYERlN7z0cRqhDiDklENmdoBoX1mzbQphtx9rDMfHj6RuHpTLMmy?=
 =?us-ascii?Q?767iboBHLBtRtrH9CdgxXEMbJuDWUwiIfaHORBcQcibthCVUe9Yn9G1uBb8L?=
 =?us-ascii?Q?p3XylNQeTwEdsoQSf5hf4EOueUp77X2D9MGcRyn3hnemBgErf4tzvc8lY0rJ?=
 =?us-ascii?Q?blMWH4p9wcQ2qflobX4c4OoxcEhtudQKSWmfOZWCggba0UTCs/2KYtFqyNW0?=
 =?us-ascii?Q?5I6AF00RsFzN4eU+uYULRhZ555mt3fIopNqURkPi7RLaUhNnn+WwKxJdm74C?=
 =?us-ascii?Q?1hO/y5ZNVLLnoBrJMHA8b5bqVkUyKNzNOD5K27yXX+HFKIH4geSi5tTvyJYi?=
 =?us-ascii?Q?eaDeMuW3Yp5UeJwXiVglaTnqpgWtvfoVY+zxZFfzYy1L0i242LdaTKQ0+vBH?=
 =?us-ascii?Q?oSm3OAjTCK8hepafrUkYcLdd7M/utaJNGwaDwON+eG/T48OUgwKUPyTpQsW/?=
 =?us-ascii?Q?IUZtyTevzlItm1OrP5F1G3OA0wixzCVVzAjJQ7Ii+SPkLMbnOt+zlv7vvZVg?=
 =?us-ascii?Q?HCX7FgYxUUFBsR4VlpDRfe97ksQ1yjay+h2gxxMzRRKPczawtD+irkB9XMw3?=
 =?us-ascii?Q?OU2e8DxMBMR16GlpVGw6hLjiEvqaHYKYUxkhZxxDNRnqd2djuppmZp8llcPt?=
 =?us-ascii?Q?D+62m504L9QcexQllT38YRUbCTScutxJv8LMDVCPpcbsytVBKRkwHl5u+Uu+?=
 =?us-ascii?Q?7yO6iwNtks/ApGIUkzsZPL2JWRssFDCymrjaTke63AcpqNVlk9zhTSg0cziR?=
 =?us-ascii?Q?03yFdbNoDPEgnQQ8dzUB8E6tTb47c3utwEv/ROj18Sxbd6HjsA5ppQjWGtno?=
 =?us-ascii?Q?wSgmJUghS+nNsi/O/jEvhJ7BECHxNFzPEO7AfX2F?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cddac8-d20c-43df-47ca-08dafaebf3b6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:40:54.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qn4qQ5dbZu7dhmcjDaXwgKhV7cuENZEZ/MZu6++5kWSnKjdqvuyS96dXo6/g0XACjc5t3ZMc2cYhzN21kLVlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5127
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a ipu_mode sysfs node to show the current ipu policy as
 a string. Since we use ipu_policy as a bitmap, and the bitmap API parameter
 is unsigned long type data, let's change ipu_policy to unsigned [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.129 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.129 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIrdl-00AF7t-L1
Subject: [f2fs-dev] [PATCH 3/4] f2fs: introduce ipu_mode sysfs node
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

Add a ipu_mode sysfs node to show the current ipu policy as a string.
Since we use ipu_policy as a bitmap, and the bitmap API parameter is
unsigned long type data, let's change ipu_policy to unsigned long type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  4 ++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/sysfs.c                         | 26 +++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 0f17adc80488..64b15a28fe30 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -722,3 +722,9 @@ What:		/sys/fs/f2fs/<disk>/last_age_weight
 Date:		January 2023
 Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the weight of last data block age.
+
+What:		/sys/fs/f2fs/<disk>/ipu_mode
+Date:		January 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Show the current ipu policy as a string.
+		This is a read-only entry.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9edad9ccc2cd..b221a3bdb3fe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1071,7 +1071,7 @@ struct f2fs_sm_info {
 
 	struct list_head sit_entry_set;	/* sit entry set list */
 
-	unsigned int ipu_policy;	/* in-place-update policy */
+	unsigned long ipu_policy;	/* in-place-update policy */
 	unsigned int min_ipu_util;	/* in-place-update threshold */
 	unsigned int min_fsync_blocks;	/* threshold for fsync */
 	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
@@ -1323,7 +1323,7 @@ enum {
 	MAX_TIME,
 };
 
-/* Note that you need to keep synchronization with this gc_mode_names array */
+/* Modification on enum should be synchronized with gc_mode_names array */
 enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d73e988566a5..50c63155ad56 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define F2FS_IPU_DISABLE	0
 
+/* Modification on enum should be synchronized with ipu_mode_names array */
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 576e6416ffb9..aaf5d8650518 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -51,6 +51,17 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
 	"GC_URGENT_MID"
 };
 
+static const char *ipu_mode_names[F2FS_IPU_MAX] = {
+	"FORCE",
+	"SSR",
+	"UTIL",
+	"SSR_UTIL",
+	"FSYNC",
+	"ASYNC",
+	"NOCACHE",
+	"HONOR_OPU_WRITE",
+};
+
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
@@ -149,6 +160,19 @@ static ssize_t gc_mode_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
 }
 
+static ssize_t ipu_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	int len = 0, i = 0;
+
+	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
+		return sysfs_emit(buf, "DISABLE\n");
+
+	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n", ipu_mode_names[i]);
+	return len;
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -907,6 +931,7 @@ F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
+F2FS_GENERAL_RO_ATTR(ipu_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -997,6 +1022,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(gc_mode),
+	ATTR_LIST(ipu_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
