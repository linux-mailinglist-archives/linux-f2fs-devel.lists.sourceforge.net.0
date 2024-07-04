Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D3926DB1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg0-00060r-5V;
	Thu, 04 Jul 2024 02:58:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfy-00060h-3Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SNO9DdCJGKOaTEJOYyV+Qtq41nC822cbPSTvh+LHbqI=; b=ja66HASIhyOkDKQx3dpzQ11t0y
 +aQ5q7lO2vX4LzcvUT81RwQdL3jum9SM6OMtcJ4C9jQ3DnmTDJsMxstQL1JkGtv4zDjL6L1dA8pJ8
 bARNTCO7WKgnT4fr4UIqN/HoQdH3CjiLhCo9ZBTh7lwihQ7KAC2SqX5nNghCtrvaZFI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SNO9DdCJGKOaTEJOYyV+Qtq41nC822cbPSTvh+LHbqI=; b=h2MM28Vpcm2R6locLzse00Kiz/
 i6L+GfD614KVrUSbyfbtlKjJdNIi0CZPi0aDKU4EjYSJJKYdNVWG0yNnm5SYAoVnAQ47MB59eP+ZX
 QEauJrIlPiZ7vBN5NBMpIF50HFmNdCVSmQGNY0/o7X49eQzdW+LsP2J44RLARDZ8BaHY=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCfy-00010i-Ah for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4WV1ikaTdQkXnlY68jP8mIpEtqHaRsTyMHZJY6wHfehg78CQlEnChtqQVikU/n9HuLW/i2rraRNeRCiFz62JwzJYRvzeJY8fC9MMCtfHuicok+6+YdDdJel7onfS88tSgZB7kg0G9vkfJ6npnUiBZ/vLDehnEH4De7SJ6Wxgj1oB8yyR+WWfwieOe0QK5laQFh20WncDp0Y2XKFgUma+vDh7/dbQCjJ/DlUIeOBXTBfnxmDCOUn6pJ8uGLBwevX3pk/0HgIyac5bTrTmtXzYvYzRFFcv8KnkTqesItlhHwwFsR6WevYw+KsBNXDTWrswR++Yb+DqmvzG0vmUPcQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNO9DdCJGKOaTEJOYyV+Qtq41nC822cbPSTvh+LHbqI=;
 b=LIfSne3ZYt4hbF97L3pfWY81U7J9W6Ujpo18smmUQ6c0FzhnDACAYYyQidZ2RjufMBC2tS+VReWlv8006qinhyhVdHkCp+7jdUsQpFTV+rWfiDGJmqQtwxje7y+3xydl26oySn/4WjNIT2sM0ycLF8b5hmu7qWd8UABrMRA8heOwbm5jm2lTUgs/VvXHgYOkeuBS8IPhNmDO0tFp6TKDXu2CjjGkY6p5Y39LznBK1iNBgS7iyLN2JQ0qodaEEWWa1Cyy3ARQursocfpMLZ72U++Kz2+TrxQ3W/65iTaFacoKRE+qlFQCOmGibd5UbTmPGLE1oTkyk01TAvxtvc944A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNO9DdCJGKOaTEJOYyV+Qtq41nC822cbPSTvh+LHbqI=;
 b=hSADm81rzjEt3mr67XiuiQKwIbcracUTlDLv/n2G4E6LmvSuJxJSF14MRQWc5RRVwya3JGoiKLdUnkNpnA703DZVrUb7zkYZw1PjSuG28CSzexzbWLKTkGrhwQUrul4BJ+uKHxnod1fQ0nU3ngBx/7dZluhGRjkDpcjrcykrj0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:12 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:12 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:35 +0800
Message-Id: <20240704025740.527171-6-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: ccba819f-276a-4b57-94e8-08dc9bd52484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u1bjkTx5ACm7amWIPHaXNPnEbvTrhf7XYKarBfyUSkOZNuVbsCbAWsxy++aI?=
 =?us-ascii?Q?vutc3JEI+qVUtmQCKq8qsqhyEjpFXR125Ha1ieQZ2nkDn4EkK36wK7e7zcsn?=
 =?us-ascii?Q?tYtFUuQvBgaH+lT8AAii/VExRihFoe7cGFAM8cykChOmuwmfke7Xl+01tdxs?=
 =?us-ascii?Q?67XkgAneZqxCJUgcabY+/RhoTpuzAQchXkOV0+w3pRNGOQhNp4g+zQzPaB8d?=
 =?us-ascii?Q?tlJhajkYouSCHN/yj6+Qs40HFZWwT6WhlNKRXLnXrWt3ta/6P0dAO5OOWqEd?=
 =?us-ascii?Q?Uuqmr34jRLmHGHB81ag7lNvh1ZdlfMcQMzUagysKRPf4ARQp/1tELK2GxyLN?=
 =?us-ascii?Q?LcEP1vAcmEcjj6C8tc9duH9sBbOkD1rxdp1I28FlePiUkok0clwGDoK6uOOz?=
 =?us-ascii?Q?5nDEiB7vZ2eavk+wOK8YBqF662ZCFrhssUTpOBIr/RDOnctZtQPs7BFV+1Ws?=
 =?us-ascii?Q?72BYYrT7NVzmulZ/uTHiTmem6qxK77pgZvm0vY/7bS60CfxuEM/Py2JXC5t8?=
 =?us-ascii?Q?gZpkDsor7p+j6+t5IR1F4bO8sOozr2ZRzDiEXyGIuYHxxtEpNBfGQMIKVh23?=
 =?us-ascii?Q?P5XRTzY45YWS3iNrfAQsmEFKX6luUD4kVVgsSV1W/QtyImh+PUNI7k/k6Pwx?=
 =?us-ascii?Q?/0/QiEk6vTIKB22wdGsbVbY3tU16yREOL8sXSkjRUwtLGT2df8pNv/407gG4?=
 =?us-ascii?Q?VcdfQuw+nMzwz+TnZQBvrz2fXWDNMloiNfcKvmWv6SKHmthO8wc/QY7Eu++6?=
 =?us-ascii?Q?2vb3iE61zZbeM+mxn5tWj+U3JIjlhkKjxaN2iT30PckDQcYnmqpN5iHUI53M?=
 =?us-ascii?Q?om50wSjjgCIhqxS4r9FRdgiAs9Styc5moX6FhVSBLMh0oF1T3ONZA2POxoQD?=
 =?us-ascii?Q?eydOgAjCu+22DzyDnr5WaGBxcXEc+aiSK5Ow6IaH/MxWh77pt3faFDtFkeUg?=
 =?us-ascii?Q?7BrNADZQINmPYYKZtA0RpJxG524ZxVy/TuMwkKysGrapNWLkLkVyILtZ6CGV?=
 =?us-ascii?Q?aGWrzYqMHvMmxzwqtJ+x5ZEwz8jCb4xanWZtar/xjxqcQRZB/Bi0GRaY6hPx?=
 =?us-ascii?Q?cczRZbX0UcDjExR2MH6uoRhXcJTiu3IHpqw6xPrr6STuEOxqo5L/U/kaSyvf?=
 =?us-ascii?Q?EgWY1YtHgIKfv4C2+iEOWIQx0SbMZ6cLrmwcfFmtKDjPMFweD5SuCgdmrrNf?=
 =?us-ascii?Q?vGzr+6mnE0GCauQFDyoR8Pg6MBlncOZtT+7B9dah9QwsSgumEChGhJ1c+hfn?=
 =?us-ascii?Q?cxCqNly9XOfnW3Mghj91FXoQzqTKM2kfOw+GTWoeeVu9bUmHUJaQCj0K7krN?=
 =?us-ascii?Q?FPjlwQ0sqqdSTyNTshucL8jr2+okvya5AOD2/kGg1z0La2G9OvyxE81pM9Q6?=
 =?us-ascii?Q?6fhvog/wX0mX6hOYbM3SDmLoVuL0bWnTbJ0gNqClViWZFcTjMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Maik1gW9ngFz2pm1KhiEeq8cWw1lFnN6gmkDW40gmFbIZ4Rr908u2OMjS8g0?=
 =?us-ascii?Q?tbMeucm58S6BAQlxIv6B05wGEw+KTun1Xuj48h9kfnM/EuhVhCu1AwyDWFW9?=
 =?us-ascii?Q?8F9vfR/ZPkMkaU5wJeKEUP4NwzRclYq+dwGxWGErnVqpRTL9UHSt4gDCEy2c?=
 =?us-ascii?Q?VFzIsoT8JOy+IJAWpnQw6NJEYBsKYgzlGbSFPdGgy/guv3r2mPrCm1/eGA3Z?=
 =?us-ascii?Q?V2eErWxG0FQur9V6bbLVHeaSP3dNBFfjTKrcsVJ3CM7nxcPj7gr0mnoyJK4S?=
 =?us-ascii?Q?TsnecoiZF7/oC/hwTlM9Km6QuPRRGuA1oYXRKhnbz1qh3foKhCiOKZguuIhP?=
 =?us-ascii?Q?igZ3ukiNtohuo2KWarY2zEPF+LG9qW8c9OEkDDKpNwmIADakzN0R6SnKfKl2?=
 =?us-ascii?Q?UvzIdHHnqWFOWcwye/pw2cQaduFQma6C4h2EqkdbJnkKz+oYMJru4asWUY0u?=
 =?us-ascii?Q?NcKqEBIgzI05L75rw6I8Q+xPmxDAL2fC04/QTuimISFX6H45pr8i+cSw/db+?=
 =?us-ascii?Q?ga6hCIeHPybArvrfXS3hGX48j6q2A6KflgI9vyX+7gsRMC19rCMEeCxiP91T?=
 =?us-ascii?Q?5TxjbzjDJ1QvekXxzTf0AXfEc1QG8PTfY5xkbAVT06SVA+OPSFlWtDC6dYf4?=
 =?us-ascii?Q?R5cY3OVdpPIjruTOEReID1AdmateB7FCAlvaaCw/QNa8eC90TKlkDcO6P7Jo?=
 =?us-ascii?Q?bfSfsq63yUBnkbczBEerkrkFvmwVM6vNs+5RFX0SgXw9r6m6wbauonZjeChG?=
 =?us-ascii?Q?NAK7aJ6o1+o14ZDyk22VAIm7sKD+LRYxmkV8IBZ+Sy62CFgax/jz4VU1HA8q?=
 =?us-ascii?Q?QydULj4mNo7T/9+VIUlnJwMgT27itbul8v23ujde65HqZrNP+uF3Oifl7TgW?=
 =?us-ascii?Q?LLqpFq4YTw9L272JyYY0qJqEyA7r686KBw7Jf71pWDLOUu8eNF96t6BCgQqi?=
 =?us-ascii?Q?uvSesjBuT0N3iBgsDbvHZokOEZ6cpzVw+W1UeT4JvE6+i8akX2rt37qpy9pW?=
 =?us-ascii?Q?DpXUZg5wgByuMvat+eEuAr4HqNgDL2hgyT9L5rmkdXL0SvJNMIP3fCnL6poS?=
 =?us-ascii?Q?9pNrTEVyMAZTtS9Cb7UYV/RvtgBvKawbCVBCfUcMIZeXRO0v0Jy5aOAX5RI5?=
 =?us-ascii?Q?xZzy2cREOG5/GcDlddfksGyQ7ZI5PzPYamG6ZZv3v9PKWWD3AgwwaeIgP25f?=
 =?us-ascii?Q?eCxsqaLXOS7MbmmJEU/8sOLyndytfb1/31i+jtSGjLD18BVWZrBsF1N5LlBN?=
 =?us-ascii?Q?OEN9P6wngRuzELcF2tkYC7OFMHBPV5w/K1n/buI0obfLBa0YWcOPdGbn+7jE?=
 =?us-ascii?Q?HCVufJx5SrpUCLxFU4RE+uiKiwCHAToCIjC7a0OTAdO1wFqMhhyYRTRwr4OP?=
 =?us-ascii?Q?Xstgo/OiJOw9uKiNutpROGWtoswkvzXYTIn9VziiESHLPxQxAn4cNhxHoQ0F?=
 =?us-ascii?Q?BYFNLXSGiqKfYf0DQCQK0M4Arqw727Ul2X6ZLJJ1zdXqvMbuvYeH/CGt2097?=
 =?us-ascii?Q?3WnwafbYjkLuXic39kAvcPzPVOv6LvoLzZUIyHSiS3du+OOIvUx6TP2Vh+hY?=
 =?us-ascii?Q?6NbFdq4y1fWZY78zjNEDwEZwZotXbw0Ts0zT/dZ/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccba819f-276a-4b57-94e8-08dc9bd52484
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:12.4477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlRcdbazQjWPUZCeqs574QbEm+AEo90ozxKhGRQBQcPuvXiQU9I80evvR81CF0VxvHxUqnr9HMFXMBsHH0sHVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting nat entry.
 print_raw_nat_entry_info()
 is added to show values of the nat entry. The meanings of options are: *
 nat: means nat entry is injected, its argument chooses which nat pack to be
 injected, where 0 means the current valid nat is choosen automatically. *
 nid: is the nid of [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCfy-00010i-Ah
Subject: [f2fs-dev] [RCF PATCH v3 05/10] inject.f2fs: add nat injection
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

This patch enables injecting nat entry. print_raw_nat_entry_info() is
added to show values of the nat entry.

The meanings of options are:
 * nat: means nat entry is injected, its argument chooses which nat pack
        to be injected, where 0 means the current valid nat is choosen
	automatically.
 * nid: is the nid of the nat entry

The members could be injected in cp contains:
 * version: nat entry version
 * ino: nat entry ino
 * block_addr: nat entry block_addr

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   2 +
 3 files changed, 126 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index da4356d..b6f5c59 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -12,6 +12,16 @@
 #include <getopt.h>
 #include "inject.h"
 
+static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(ne, version);
+	DISP_u32(ne, ino);
+	DISP_u32(ne, block_addr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -22,8 +32,10 @@ void inject_usage(void)
 	MSG(0, "  --val <new value> new value to set\n");
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --nid <nid> which nid is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -59,6 +71,19 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
 }
 
+static void inject_nat_usage(void)
+{
+	MSG(0, "inject.f2fs --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "[nat]:\n");
+	MSG(0, "  0: auto select the current nat pack\n");
+	MSG(0, "  1: select the first nat pack\n");
+	MSG(0, "  2: select the second nat pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  version: inject nat entry version\n");
+	MSG(0, "  ino: inject nat entry ino\n");
+	MSG(0, "  block_addr: inject nat entry block_addr\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -73,6 +98,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
 		{"cp", required_argument, 0, 7},
+		{"nat", required_argument, 0, 8},
+		{"nid", required_argument, 0, 9},
 		{0, 0, 0, 0}
 	};
 
@@ -123,6 +150,21 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
 			break;
+		case 8:
+			if (!is_digits(optarg))
+				return EWRONG_OPT;
+			opt->nat = atoi(optarg);
+			if (opt->nat < 0 || opt->nat > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject nat pack %s\n", pack[opt->nat]);
+			break;
+		case 9:
+			opt->nid = strtol(optarg, &endptr, 0);
+			if (opt->nid == LONG_MAX || opt->nid == LONG_MIN ||
+			    *endptr != '\0')
+				return -ERANGE;
+			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -140,6 +182,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->cp >= 0) {
 				inject_cp_usage();
 				exit(0);
+			} else if (opt->nat >= 0) {
+				inject_nat_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -315,6 +360,81 @@ out:
 	return ret;
 }
 
+static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	struct f2fs_nat_block *nat_blk;
+	struct f2fs_nat_entry *ne;
+	block_t blk_addr;
+	unsigned int offs;
+	bool is_set;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	nat_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(nat_blk);
+
+	/* change NAT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
+	if (opt->nat == 0) {
+		opt->nat = is_set ? 2 : 1;
+	} else {
+		if (opt->nat == 1)
+			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+		else
+			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	}
+
+	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
+
+	ret = dev_read_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+
+	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
+	ne = &nat_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "version")) {
+		MSG(0, "Info: inject nat entry version of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    ne->version, (u8)opt->val);
+		ne->version = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject nat entry ino of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->ino), (nid_t)opt->val);
+		ne->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "block_addr")) {
+		MSG(0, "Info: inject nat entry block_addr of nid %u "
+		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
+		ne->block_addr = cpu_to_le32((block_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(nat_blk);
+		return -EINVAL;
+	}
+	print_raw_nat_entry_info(ne);
+
+	ret = dev_write_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+	/* restore NAT version bitmap */
+	if (is_set)
+		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	else
+		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+
+	free(nat_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -324,6 +444,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
 		ret = inject_cp(sbi, opt);
+	else if (opt->nat >= 0)
+		ret = inject_nat(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 907309f..db45fb9 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -24,8 +24,10 @@ struct inject_option {
 	unsigned int idx;	/* slot index */
 	long long val;		/* new value */
 	char *str;		/* new string */
+	nid_t nid;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
+	int nat;		/* which nat pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index da58f0c..8527199 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -825,7 +825,9 @@ void f2fs_parse_options(int argc, char *argv[])
 		static struct inject_option inject_opt = {
 			.sb = -1,
 			.cp = -1,
+			.nat = -1,
 			.idx = -1,
+			.nid = -1,
 		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
