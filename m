Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF449D1054
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 13:06:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD0W7-0004MJ-Nv;
	Mon, 18 Nov 2024 12:06:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tD0Vy-0004Lz-I6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 12:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tf5GjUFMmPyjkKLGlWRRxK/4JKTp73nBVTX1n5BWHvo=; b=ggLbObHpkX2mgXnmt+ba3ICvhM
 QlsdEsDQST6P+cl5zACtfx4Cmc74RNQ/CEwJlCE/6ZlpDzLINlIno02XcSEnIvWQNDn+7P2XDEwi9
 4Yt8DtrT/ewqrZVLqRv0lskqwqoBUTiR/mRbpwOQQqIXyqmjI7egWECh3X7BfyPKV1GA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tf5GjUFMmPyjkKLGlWRRxK/4JKTp73nBVTX1n5BWHvo=; b=lIj/yeeeD6acmAEq5H6li88Zv7
 Qf9eXNFyH3Cymh4HX23dG50VphrAbkHSKDiufkzxYBKT4f/GbZ7ag8oSuSGFHj3ZIVnKgctypzO5M
 MUswQOted4ghMDsEjPJqWo/4kDzSrejmdr9Ikfe58OyNROKemXUwG5VVP6GK2Raj7zCU=;
Received: from mail-eastasiaazon11010016.outbound.protection.outlook.com
 ([52.101.128.16] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD0Vx-0000I8-5q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 12:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8Y5WtbAy4006JJVTZ2y4salJvL40P6uqexElQ2Gi/YPqHunOfkR3rqogHqx7D3sAzI/hqjHozRyRLXbSeRfuSS8qKWQwnzxMPEhGH9z3g+sDnNWeNEzvSvAA8OmtzawTuTZNn0sRQlquvGOvebAmbb8E5WzIjmm2UolvZcGdue//WTA+DZQnlYYubStOcQ4hX1pLUT5dPOQ+RVbvi20QEZEZa/B3g9asJemPYX81wpqB3y26R2wEPRldlkfr2qApAwpAZBtsEUQ+9S33jBQ/vQhFd9rz5L/MHp9hV+QhPW2JYT6IxuzbcFVAkqJmB+WrAtwqNrm5ARHuYgkgGcsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf5GjUFMmPyjkKLGlWRRxK/4JKTp73nBVTX1n5BWHvo=;
 b=JkRpLyYOJOFCSfsDzGDF9/6xvvjXBzbfYPZaP9brvx5QZJaDauA922nm/Jb3+gjp6XrafrdxR0BX7fRxiJP1fM55MJpItJtuPn7HjBVH4lus4xj4Y5ELukwPIOyaLmyshRfAyeRRWkik5RqqvtIqoDa0BGGEu9KiLfE2NaAt2Bi0/Ia1UFhiqkHc4PqIaChBevipOgXu9Ba1N8I3c52z2QBRLM7UHg17KafMoT326VRiZ4Xjt9WYZB6cs/pSjzCcaWcn7/qPaHDEZr903mg9+oEa6Etk9KNi5OefVaYh887x7mKtbWW8zG4rv6OCVDZGUoUKLyu3edwTepasy73zVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf5GjUFMmPyjkKLGlWRRxK/4JKTp73nBVTX1n5BWHvo=;
 b=dWULMd+l+DZjUy0NKU5gQwJxltoFzhBS8QdB8liPBS9G3bvxvJ6zzzivAJM/bKO6Bc7qXYpEWkQFvwWKFpOph2gsrSd2Yx3mDbP8DRBvWDa/6t/K0uylcO6oWlQELetbdMewWC4cvTuo7ub+jbfrHpC6ePK/ezASguM61wkznzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB5834.apcprd02.prod.outlook.com (2603:1096:400:1d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 12:05:42 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 12:05:42 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 18 Nov 2024 20:05:17 +0800
Message-Id: <20241118120517.3533055-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241118120517.3533055-1-shengyong@oppo.com>
References: <20241118120517.3533055-1-shengyong@oppo.com>
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 103c997a-9a52-4291-35be-08dd07c95303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9LxghMrOHbaDJF3bUkVOitmotx4ctXTwD2Ue15sPse9ahJEo8NCWE8gKLtgk?=
 =?us-ascii?Q?1ImNEg2qt1G4CBpkcxn7DpSIpEL+rUZYPMKQOhb7wSXpgPX5WI0mc4ZXlKtq?=
 =?us-ascii?Q?7J7IwBCZIlck9BXKH1L5o2866CbnJxEnlyoNHQR1cvW2F0ZIYT1FHBz3dAKN?=
 =?us-ascii?Q?l6eOZ6Hu0US0oBSuGH2a0OGzXIeThl0/xuG2sAJTLkIebasAUk8kYd9XN8Mt?=
 =?us-ascii?Q?7xtm2ygZtjnMWMew3Okssxo4id1bd+N0chTkjTEOY1ATXHiw0iIqzHnE1qnn?=
 =?us-ascii?Q?aWv5h5XxrVVngPCuk0U9yiyJhKFWCWwgXTggyGGCMqGW968LoMO0ItEUiVmQ?=
 =?us-ascii?Q?9IcnO8qXvfzcIRY8KFf9WdK4M4wVpkrtD9nT37PT5vABKCsMtepVF6Yjo8BQ?=
 =?us-ascii?Q?n99AqLDhxqqMkjy4UDSfnK94O4laWWoex2+j/JkZVowH+KRS3St4C7nIeim4?=
 =?us-ascii?Q?JksVfYm692n5aduIvY+7QDjvAcPuIsiMhRpFupmRRLpiaqXn7dHPTtLkA8f6?=
 =?us-ascii?Q?IdiyDQpz8Ioz1xsvfvdj2K7BEXe60ja1qUrDXp0vBr9NTrSNJGljsB7KTlJ9?=
 =?us-ascii?Q?M6Y63GsScXp9vrkS9urYzFqv8mCwWzH2l14mfI27q4JQC82qqArBAjVTKtk0?=
 =?us-ascii?Q?M4VKMtH85wDdjilyLe0JmLsreOqAIUKjfwh7dU1C5otd2JCjfBklCux4HOVq?=
 =?us-ascii?Q?JJ1ln2G8LTXD6CFOEDQfpOzQ8DC+Qd0NX1iCkdfoqGgkZjRbZ8uCV6vifet4?=
 =?us-ascii?Q?22gm3H6UQwikOYp4ytsYDK6IJ9QvEEFJ9Dc5uWBJl79Uw1G1MX/kmBeq1aUa?=
 =?us-ascii?Q?q7R+Er/KXSd06KUelABPGOfXAe7JNYe96ApBofAIeHp3nYYBZJqYofoUwOe4?=
 =?us-ascii?Q?hBQLU6silaAuYxQ+Bw2E/7orbXQFIpEZPEWIMeB0UYlzOM8uEsVNPOQIqpX2?=
 =?us-ascii?Q?cd4vIfWwDZJTySwiK6NwUApjG38hWPUbgSHoTpNV9KoNQIa6ttbbJ28cXvL+?=
 =?us-ascii?Q?DjMjTWjpkWlvaUBPg5jVNqigJVSN3cabwT509vSO80RwAbiexa8Lp6iM8gYJ?=
 =?us-ascii?Q?08yJ1p2NbWA9J3xbc6bJikyghEGW2LxbbVxxdK6Tl1gkMUtVRn2Ff065lgKL?=
 =?us-ascii?Q?uGpDZlQgLZVNyGVtDzm3O+g0vg1W033TYmF4NhdKgBwpCgA2Y4xSws3DNqxZ?=
 =?us-ascii?Q?gNd3NtcvHeOTfz28lvtJ+2Ue8NFVIf6nqoQ8UgVLHntUAc0ghK6w97Lukaju?=
 =?us-ascii?Q?Y19SYlmrZXLMiGzOdp+TSOnZ69PDa9+KArZmL0MKfHnVFfj4uT77gypqxbHY?=
 =?us-ascii?Q?8yFgAwEcPGQiCF8bRpNusQQNHsVZCoTu4Qz8oWZJFca12vv5lBd1hxcAVtRs?=
 =?us-ascii?Q?SeTlRvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNZMnOFWc0b37vViLDsS/Es8joxsleoDXMusMY/E5le6pMm8rfe9NaDdWAcf?=
 =?us-ascii?Q?U9jwr54g+qakK2IYAzWABzyrnR4N3ZXl2XCIyhVj70xx4vZxq3pcO5BtN6I2?=
 =?us-ascii?Q?7h5jJ11IQju1hOqn2Of4Al2OtO0oRUSb9aRT0J3n5j1DUi0BiSC0C2hQ/5Mh?=
 =?us-ascii?Q?o4OK6eeDdEo342iGK8dEV+1E76mLrWUq9HSfneKCMlMm23DPV6JV1bqZKzIz?=
 =?us-ascii?Q?z3qW2bRsnLnDSrPz+4x/oZTsqzagDItoCi9nGVWGlb64+LtiTp0WXGrI7PUB?=
 =?us-ascii?Q?ds/73VdH4IHF/Rqq8qCHA0EjeaK5D2O+HBbQOooAHprsx2rChi47YoayoCLV?=
 =?us-ascii?Q?qPe3ZvDerBI1kGJ03JhShrpc/qe58AuddpuNkh7hy54q5JIelQC5fdcdJ1id?=
 =?us-ascii?Q?SSJTuK+5qhod1C87o2b3l5EJPdJrugktEduzwWClqbpIH7iBeAsWw1GUfbCu?=
 =?us-ascii?Q?5YHq+r6nEd226nBCXBm55vtvL/72qDqzhrmIca8zcHEQhmWgyQMlkUE6pGyu?=
 =?us-ascii?Q?iq69Vwu2IRZrbTyMMg+giyIf5+6UzRUDJHFdL52groVL/zbRwwabh5Wc2RZp?=
 =?us-ascii?Q?SjwaHL5ZHXdT6WCXP6v/1Hkb0yhG97gs66Y4cES3SqqsTyluQyvMPChNVY3l?=
 =?us-ascii?Q?/vzrOwT6ecopPOamRxha+U//Of0mzKUG3wComOzZl0Pq5Iu6jD2EiAqZY4eJ?=
 =?us-ascii?Q?EmWiqkONz31Nf2Kg9KddPV1OF16jjVNCf8trKnYNov6AKRk0/naqOhP/qoxV?=
 =?us-ascii?Q?CaDh+PaPXz46Kzufh0xUccNjInPa7IPSdll9cUxDu+GBFvytcvIfCeUs6/Tl?=
 =?us-ascii?Q?nnx61lZLfq4qSBzQVoT59yvyLzQ5szTe8yupHHTbu1/36Wy9U5XcyhqfDrxB?=
 =?us-ascii?Q?tiv/mVT2cLlRLAm9j0Ogqx4qshnt/aAuFTTvo3A5Kjr6QlA9kg0rhT5SuuKn?=
 =?us-ascii?Q?RI6/uAchr5mOXxElu75AEIoScRCtgKn8vxdK/r2rIvVBQ1YdY2FSVkWDfhqu?=
 =?us-ascii?Q?7wy/1sqiaTU219lPss+TPlsOyJW0PF63Vo73o5WbLJWRI+/37qab44sAL4T6?=
 =?us-ascii?Q?TE3ubvEiujTVL7L4nEAspYxqajdwPEhwad/pMWVPdr3Wb4lNTJeIu1lGwNk1?=
 =?us-ascii?Q?8cItx6V96XpsY8L7cmDv/QcEnTp404vozVCC4ps57RHZiajMZ+9RsRJidmC9?=
 =?us-ascii?Q?SfknPmmIEORWGPwN4MkqbDjDujjZx2VEtnubJtPS8nuWa6Yytd6rT1PDTu8d?=
 =?us-ascii?Q?0BlrWks8VT/3bGEHb5G2NGz+cg4SnMtJO1DML2ISKVQA3EKJVZXHHXqvMAQ6?=
 =?us-ascii?Q?1Cb4fP5yhkCaFQUflcorVzCpW7Ty6f0CRr8g8thL+by9B56aMMo8YFt8D14V?=
 =?us-ascii?Q?vlx95WdNaPmMdRLjAo06AiKd5oJ6o5we8Kti0GVF7RgSSQaTPvfiLKnEuXe4?=
 =?us-ascii?Q?lUfSfRZGTWSRq+NlrocXAB7mo3vTXCuNsjy0nP8/p/6RVcolJ+wTa2KUytue?=
 =?us-ascii?Q?UMyacKI9Pv69vNeT+QhDePAn1ut2P0AfHdYLbt7djSiEBelyiy7tVbJHxkNG?=
 =?us-ascii?Q?JbInqE0mUxhUHdNrwUXsZ73SWrbzzTs4EQ4zxcjW?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103c997a-9a52-4291-35be-08dd07c95303
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 12:05:42.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmiSCpLt2aqbXMWut1LRn1yCLIsz/IM8CievXv1rLqvco/BBoYjGK2bqb4uYNiE28ayLkUTtTR5fAi9+cJQP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5834
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  SBI_POR_DOING can be cleared after recovery is completed,
 so that changes made before recovery can be persistent, and subsequent errors
 can be recorded into cp/sb. Signed-off-by: Song Feng <songfeng@oppo.com>
 Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com> Signed-off-by: Sheng
 Yong <shengyong@oppo.com> Reviewed-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/sup [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.16 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.16 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.16 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.16 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tD0Vx-0000I8-5q
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: clear SBI_POR_DOING before initing
 inmem curseg
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SBI_POR_DOING can be cleared after recovery is completed, so that
changes made before recovery can be persistent, and subsequent
errors can be recorded into cp/sb.

Signed-off-by: Song Feng <songfeng@oppo.com>
Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 072462896716..1d22e5ee7331 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4748,13 +4748,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_meta;
 
+	/* f2fs_recover_fsync_data() cleared this already */
+	clear_sbi_flag(sbi, SBI_POR_DOING);
+
 	err = f2fs_init_inmem_curseg(sbi);
 	if (err)
 		goto sync_free_meta;
 
-	/* f2fs_recover_fsync_data() cleared this already */
-	clear_sbi_flag(sbi, SBI_POR_DOING);
-
 	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = f2fs_disable_checkpoint(sbi);
 		if (err)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
