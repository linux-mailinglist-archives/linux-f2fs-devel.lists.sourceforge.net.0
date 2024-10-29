Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7B9B494C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:12:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4z-00081L-U6;
	Tue, 29 Oct 2024 12:12:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4y-00081A-0e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kJmZgvV+zVzsmgBzTrnuxJLsoaJkE96OxtlCg1qrrs=; b=FeIIHr04mOGl+zot3pb4kPebGM
 XzuHjIVYHCFsx0kfh5rOGG7J4MAkmbr+fyrViEt9F8cQXFh2VEX/2YuPF+hHCF++idp9fh+N4mpxd
 99JdZ+RVS3qV+0t4cCrQ+fW4kmFvgBMH9mFYa7XdWfjs9nhzst/8QebgkIQNwQESrhBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kJmZgvV+zVzsmgBzTrnuxJLsoaJkE96OxtlCg1qrrs=; b=TPhZP1ZISR1lwERWKkSWXoLanZ
 PRx7NbbMnUVuIClvy1DSfN9f3j6VMHkzok5BrPeVN8Ve7HfkYQc+FN1NUoBRA23Skdy1yJKsgBaaI
 C658nC3pOM22A+CZWlExoJ+f9ilxfHm6YDObQ/2/Wde9NvxSx2M8aMD//NKMgRIzgHL8=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4w-0007Sn-HX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chOqqDamKaYCOZCPfqblfeA1MHjLmcPi5NpSpQZiLCfEJHAkP3aSFnT+Lmf/FQ2e2+FbkSkzxzxq3yUZRUzl0p+esgazBcO3vFDyHS6QFMnRDHdhlzQvd3sjY284OcrY4zS+75/GfWZ3SWufimCqyyfVOaJ1r+znGEWq/umi/7PkY1ksdEC42la+Qq95V7L28ZKzjO3hBkqd9pVtgD/zAW4MgAMUi7xTo+RXqqNqe84fGoOzZk/UyrMJLLbhIxttUvgfY92/0IuRH70Ggdxq0VrIZFjj586KnYCZOnDuCFAHhaott7jHN6lNNV9FFXp9O6/xnkwa7fjzWX4YCDHhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kJmZgvV+zVzsmgBzTrnuxJLsoaJkE96OxtlCg1qrrs=;
 b=dsCLUlhPvNHpYENuVn6aXzTu38ijGrXzIFQOIawnxyq8MY8c7YGleloQ8ZLyyD/ctJB4/KR/E/Uce80rjDi2F3G+n30+lBjZxtvaQsYFg1cK7VzVofF1DH829FkgOwjm/Y53uAb638x1XBB7qoO66qI87lV4MUxqvxzMjb0vb2OCpMInIWLy3cUQuOHEMOA8jFiZHjU8oS2myENAag9yzccUq1Hjc+3wae/xkA8zToK9Mot3KDIXLpzYTqL5fP4NfTM5zyNtkq0keC73OdUw4YYaz7MfYbRpnnjMUtZTGVW7uC9rBG+oea9UNDYs3Src8X9SAMMt4xTfK4k96ObYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kJmZgvV+zVzsmgBzTrnuxJLsoaJkE96OxtlCg1qrrs=;
 b=LpV7YNi4mBXzq4qdViBgzavQ/0Kq7PjOtg9LyIPTRxDyus+RCl8AlIJh6XNl90eMBAEfFp7801eHWcfIeXWL1FqxQr4rBJbHekKTiTj8u9iPeH/ykeMHp1wC7rartsC9hO5PmzoM4/iXPF+Toc8+LakrMfPtIZCQaDOAlfaNnCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:52 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:52 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:53 +0800
Message-Id: <20241029120956.4186731-22-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: b278bb87-f3f5-4a33-6232-08dcf812dfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wM/q4JfcoUACR3ALsbIrEy2XKeg32jJjyVRr+oG6mgFpkOMnEH0m+B6SpY9g?=
 =?us-ascii?Q?/rccoAir5C4s2hZ9CmfnnnLbfs+aTE7hxXaRWxfxIrmmY6ep26UfHpcC9U4u?=
 =?us-ascii?Q?hQL3UUApZHQvRMEMRsBzhYhgSNO5XWAjOlqjvphFdb7kRUB+lKQdSV3XfTaK?=
 =?us-ascii?Q?iakx/tE9SucazheSYACanf4lqew9lQ0aIyJuebSbLQRwBb0tthtk/WTEIqey?=
 =?us-ascii?Q?fJiFPG/cufOYx82TSqwCYfoQhTd8dFSt5KaOq6E5eR9ma6Y8Lsj0Dbe7IefS?=
 =?us-ascii?Q?mC8HuzIXWNwvXZ8jhlvLA8kf2AW8aQrxakcw1y7/ynYB211J5AH7Wav6RaAY?=
 =?us-ascii?Q?fB4EZveN9Q28/qQ8paHq11fN6KPntT2y7w19ehT9IXotMcCAsylHOF5tf7UW?=
 =?us-ascii?Q?WfslHzSvmyDqE6/KEs3tBb3JWfIR/8mJ+oF3NEU/Og7Ax+29sRNpZIbBsF8L?=
 =?us-ascii?Q?5huUMtrG15q/ngmge0WtjjsMw337ElrCh66oJL5qn7/cKbUcZaUh/yY+trRU?=
 =?us-ascii?Q?WiXtO6s6nLTS+0g+4uLx5uFatDyXxMKGm5jtnweUZkf01G3mPjnLguf7pR4h?=
 =?us-ascii?Q?9zn+VPfOmx0S+Kx12vIlcwB5UgzXquDfiuAOfJhakapTPSeK9JLaPNoOnI+z?=
 =?us-ascii?Q?01mo3JLjXVAQwhzAI8fvbonQwTzeW2TGjqzKPEJc5+s8plPpt5TLM5/TV2xB?=
 =?us-ascii?Q?o7k/mvjFv+47NNy/k54NOpAf9F+pEttjp3x7ahk7XbAVmY6PNlNy2HVroL78?=
 =?us-ascii?Q?DZ5l0iQDLep1QXlc0Zs8PKAGEaw8vSKrFU3iByrwXS8k53e1/Hcl6OQzgQXe?=
 =?us-ascii?Q?Cc6wtY9zgzR/wvLx0okq8odusja7iza30Mpto1DLeBp6Ixh8Hu7GSS33RWuj?=
 =?us-ascii?Q?llvJ/AfQFbTya1iaZ2Q4F3RWjgdUOkZeIMdU5g4PZ0/AqakG+7WAMuhOhFDi?=
 =?us-ascii?Q?eLB+05DMhejQ1mEesvqY2FUh7KiJyg+B+LIx2sXGP5yPv2DMBZpTTtgjHtgm?=
 =?us-ascii?Q?317blWQMqdWrGO0YcGGkthbyP1ZhX5LL/WbMmVlGFCm9Vm54m7V2TBV/j2D+?=
 =?us-ascii?Q?pqsJzHeAL3j8X+6SATsme4sfI7/9pOJoNan1trt8MjSWt8HHs781mVmdDwRH?=
 =?us-ascii?Q?/z7NlZ6B9h3xw6TSQ1LprD6ZVHUy/I1vEgqA3yDGKzuBR1YNxXX0Og8clDcJ?=
 =?us-ascii?Q?Vlwcw/edSKI2B+zaQs8On5H8B/bUUwsMTiYsRW2tuTmTrE0QFQt9PzUy57uI?=
 =?us-ascii?Q?SRkNiepq3nnpM451SXeGKh14gNUqtigIDZ7tzK2yAvSgL9xPNcU0hGKar7da?=
 =?us-ascii?Q?5fG0Mv2h2KKjkfcJvGBAytmmpZUtpNN97AJ6Ptx4ykcVsM4clhUqUeKWEDIi?=
 =?us-ascii?Q?LHbG4kA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zdlbTvFbPzWUb0YGUhIAX9+Pe50dzdv+F1AXFHUmHwcn+XYRuZ5rn8sU3Xbi?=
 =?us-ascii?Q?tcT6UouvgzDlfXSggZbwwSEBRZ2WYqoHmW8pumBcYqUwEdvZX50Lr8ptLMJB?=
 =?us-ascii?Q?QUc5ePLvcNALx7Tk7YSojQR47rrXEXyZQiOYwVlYvuqeVIJcnRJlSfgIVJqP?=
 =?us-ascii?Q?ODSicVKZkXO1+6ohBVN6b21gtkhIJb8MkIx2+dFm+SD/shifwhAPIz10Jxbf?=
 =?us-ascii?Q?Ssa7dnllFYe864C1NA48kWIuqQF3twA3tD/XF89rVFNKQDw1xvgNi2iMZKtC?=
 =?us-ascii?Q?pHpY/zKgyvbyB7aOPc5YuHpSPaRBWQhRauTUjJ0S4hzUqrt7IBc3YLdM3L4N?=
 =?us-ascii?Q?E2zpC2EPNEqx+y218Ps4+90WpbycgK26gVyVmBwOnKFRxAxBbTsm2LgwW0Uk?=
 =?us-ascii?Q?QbrDvy+7DYU8UhtQN/nxJCZKTpJAu8Kr9tmCHb6EXWl8xsN7WcQS3ttqKfUL?=
 =?us-ascii?Q?UFpn8UZ1sCNu1S4CFNUZFBdSMygh0kJlIr8ew3UAdPNlXaeFHX9KYMCSU+Rb?=
 =?us-ascii?Q?gE2zYtLZrmr7t6jgu3r+8hZqJ8k8XNsEhpXN777XSqJ/Yu/TnQLCJBOo2URp?=
 =?us-ascii?Q?CaSEsrlokDd56hOIE9XjfnEOi4PIJJTtVh++9JLR+Z0DnPlB4DurbH3gejei?=
 =?us-ascii?Q?R4Jge3eBb3t66kvlUlShduztwE3RqdTdQ9brJEJdruiZ0p8Wvvdx0vqYaVJc?=
 =?us-ascii?Q?AtF4uPOmRSerCYoR492INUeoHXdMAU9+1fOBq07ofioXa+QA2FkuSRDjVKMU?=
 =?us-ascii?Q?hVkBZNJ3kftGIOC17D/D110UaLAVimqa51fAj5A5w22ibZKoXO4XvjQWgdOb?=
 =?us-ascii?Q?mMV6JY7JAHzyC3+KvxzdefiDAu4K6iVpAXh6bmbKtSzXBz5qhwV9lZnElJut?=
 =?us-ascii?Q?geuAtHubU+lhB/esbaXrr5xjATBbzzIyyLb6gIBFWoXWFPDmGlal86NyNW4B?=
 =?us-ascii?Q?G6XaD337K+2QXUdSgUPoL+qtvJZP3AKmawWL5GZNMS0y4fpQaZx/HBTLlAIS?=
 =?us-ascii?Q?VpTmGEpYNBo9+t8n+HTIyxYbheL2zQwT2nUcpj8jJJNQUtFysknPWx/LXi7P?=
 =?us-ascii?Q?+ZkIrP2mZ/W5uXwWu8DB1P6SsIPpBMyl2Bkjek78q6L2d+DE6rA2SDOQ/DP0?=
 =?us-ascii?Q?EJeT6Y7oldjN82idyxn/lu1OfuU22xgK7LIjuC+65Xjo9mUCc49PJj75kXLo?=
 =?us-ascii?Q?2lzEzMHpzkSe1+poMi9AQKXkJmYm5hyL/PHPtVBq8jl+IV6ohusMzy+9xETP?=
 =?us-ascii?Q?d4GnychW9F3u7MYxrkuj57j2uAQsWtXmyzs7GLk/Sz0HiTuqd/EYJasnaTFz?=
 =?us-ascii?Q?0CqEFxHKVRtfKxql4EvtbpG4aXMto0fyC/hYMMjZ6cervE6pWXj2nXDpz0fc?=
 =?us-ascii?Q?Bi0KsrkkvVyCQffO7xMSZ22qdZFWWITNK4v8WBkM6rmtlkflYupwQ5GBgnYz?=
 =?us-ascii?Q?3C/Rh5ZHVWDPyYldxhbUsFdIw67IFTBm56bhVSnGil+J+Cltwuxdu4VOYxTn?=
 =?us-ascii?Q?l1yo9+PRI60bmLyuAHSaX0sUqoFL708nMyrjJMf0DMHttA9pE1WLYpvJ17GY?=
 =?us-ascii?Q?NYUibTTjwNuuizMYE4/DyccvCnyFsSenljLmQnhz?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b278bb87-f3f5-4a33-6232-08dcf812dfbb
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:52.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfTwG7L6ssVNSyfYml9s+5LF5M6UJGk+g3aXxnnRiIW/apbt5eSlTv5OOw27iK1D40rkKmTTz62TH6n5rBYH5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_dentry_bad_hash/README
 | 8 ++++ tests/f_dentry_bad_hash/expect.in | 62 +++++++++++++++++++++++++++
 tests/f_dentry_bad_hash/script | 71 ++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4w-0007Sn-HX
Subject: [f2fs-dev] [RFC PATCH 21/24] tests: add fsck testcase of fixing
 dentry hash code
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_dentry_bad_hash/README    |  8 ++++
 tests/f_dentry_bad_hash/expect.in | 62 +++++++++++++++++++++++++++
 tests/f_dentry_bad_hash/script    | 71 +++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 tests/f_dentry_bad_hash/README
 create mode 100644 tests/f_dentry_bad_hash/expect.in
 create mode 100644 tests/f_dentry_bad_hash/script

diff --git a/tests/f_dentry_bad_hash/README b/tests/f_dentry_bad_hash/README
new file mode 100644
index 000000000000..f36c44f7c7bd
--- /dev/null
+++ b/tests/f_dentry_bad_hash/README
@@ -0,0 +1,8 @@
+1. create f2fs image
+2. mount f2fs
+3. create an inline dentry directory, and create a file in it
+4. inject dentry's hash_code of the file
+5. fsck fixes the dentry's hash_code
+6. create a non-inline dentry directory (by converting), and create a file in it
+7. inject dentry's hash_code of the file
+8. fsck fixes the dentry's hash_code
diff --git a/tests/f_dentry_bad_hash/expect.in b/tests/f_dentry_bad_hash/expect.in
new file mode 100644
index 000000000000..f453c411f7b2
--- /dev/null
+++ b/tests/f_dentry_bad_hash/expect.in
@@ -0,0 +1,62 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[FIX] (f2fs_check_hash_code:x)  --> Mismatch hash_code for "testfile1" [12345:_HASH1_]
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[FIX] (f2fs_check_hash_code:x)  --> Mismatch hash_code for "testfile2" [12345:_HASH2_]
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_dentry_bad_hash/script b/tests/f_dentry_bad_hash/script
new file mode 100644
index 000000000000..011e6c6dc214
--- /dev/null
+++ b/tests/f_dentry_bad_hash/script
@@ -0,0 +1,71 @@
+#!/bin/sh
+
+DESC="dentry with invalid hash_code"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+# inject inline dentry
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+mkdir $TESTDIR/mntdir/testdir1
+touch $TESTDIR/mntdir/testdir1/testfile1
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir1/testfile1`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+
+hash_code=`$INJECT --dry-run --dent --nid $ino --mb d_hash $META | grep "Info: inject dentry d_hash of nid" | awk '{print $(NF-2)}'`
+echo "ino:$ino hash_code=$hash_code" >> $LOG
+
+$INJECT --dent --nid $ino --mb d_hash --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+skip_lines=`wc -l $OUT`
+
+HASH_CODE=`printf "%x" $hash_code`
+sed "s/_HASH1_/$HASH_CODE/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+# inject non-inline dentry
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+mkdir $TESTDIR/mntdir/testdir2
+i=0
+while [ $i -lt 30 ]; do
+	touch $TESTDIR/mntdir/testdir2/loooooooooooooooooooooooooognametestfile$i
+	i=$(($i + 1))
+done
+touch $TESTDIR/mntdir/testdir2/testfile2
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir2/testfile2`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+hash_code=`$INJECT --dry-run --dent --nid $ino --mb d_hash $META | grep "Info: inject dentry d_hash of nid" | awk '{print $(NF-2)}'`
+echo "ino:$ino hash_code=$hash_code" >> $LOG
+
+$INJECT --dent --nid $ino --mb d_hash --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT | tail -n +$skip_lines >> $LOG
+
+HASH_CODE=`printf "%x" $hash_code`
+sed -i "s/_HASH2_/$HASH_CODE/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
