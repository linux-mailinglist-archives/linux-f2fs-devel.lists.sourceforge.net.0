Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YBXJNkSjImpMbQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 12:21:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57C647461
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 12:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=g1Pk3QFl;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=NovcdZKG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="R d6/K/8";
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=RZChL2T0;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFPmOx8zDCBsUpPq2zLQ1JbzmGIpy2VSQpvD2mCI47M=; b=g1Pk3QFled2VjjZVdIN7P3l7Nv
	RdBeZC3nS3C5fGYFRzQUiGmXUzAoMcIxdb6PoSKOkO1NFnyMa8gOUuL7EPGXVVOpWvuxjVardBfkD
	jK/Xt3+G5JAuoduplJzm5lY0aPZ3ULyDdl+wZOGEetkoYTqpo58rpevtHkQ0zVqHPyvg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVRgP-0005dd-4i;
	Fri, 05 Jun 2026 10:21:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1wVRg8-0005dO-J9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 10:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDX9lLpZs7p/gdDOFYbOW+w6Thu2tlMWhrJ4Uxo+BFQ=; b=NovcdZKGb5/I0gEaso3wkI0DrX
 7C7toAdXGBgrYmmYZ8xzIH0pE1TRQ1Hj2ii47Mqrc/garF/RCeY7j/JcJmNmToC9i+kZ9DT9GL04M
 ws8aphD4n7PZGetqMRex+skeE26ONfu67Fkt3SBwzPVb17Gcfd5zi9h+6ID0y/kJBdUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hDX9lLpZs7p/gdDOFYbOW+w6Thu2tlMWhrJ4Uxo+BFQ=; b=R
 d6/K/88QdQYFwyosVKTB6Fyw55/300OtQ3kH1PYtX04fbKi7rKNA4h+tCriqsjbGKVjSfMVpd+Eet
 QPtbGhygNhb6uDk4Hw6v9kXJH2q0aWNKwZkyP9mlphPA2B8rX801HLaSk2asx8Msu4k+g6XEgJ1WX
 JzLrr9JFAxrqTrH4=;
Received: from mail-japanwestazon11012026.outbound.protection.outlook.com
 ([40.107.75.26] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVRg7-000642-Av for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 10:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNQ4+74ejXjzl9V754QD0nGVBBmvDg2UGkGroXQ0xXcwR2NOWBTahQjw37bHCqbrXzRMUe2cBD7Cn/ITNHeaSzmd1+nSJzPaHPcFIOeatWj4OFkUjZZiogVmHbxBs4uOj92hnGiUiq2Eo0QOtxoWB6Z1V5AB/b94CGg8FZOlc8QpGtIXcLM/5JCrWGzdyY1EWTXg18VOQjgFCxhTmsirGqgGmkkmViQjEvbTKGwyoPJfWOjnhg1kPZPpZQGzM+7Wpr9TCUG9A+8tzFMnFfaf1BvpGbX6iTg0GHoJWXUHFTiYFoRg+G4I8YSz8OWunmO8O3GEt37GhoxXXMz3pkspPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDX9lLpZs7p/gdDOFYbOW+w6Thu2tlMWhrJ4Uxo+BFQ=;
 b=gQmge1MkzQHSQtWShii17tQ9afGpM0ByN32Wv31Enhqwktgc/Bd/NlDBvZ4wvE7Dz+Yo3VtlV+7FGa8b0gZpNBL0ybqx6SKpeuK5nAmsKcFBcdZcYuujKUOKMLQwtJpJ6K2dA6u5LDk55PmdrjjmnVTYZb8yd1GhhZV0zZI3QTaue/auHj86JccI6gtyf2UYdVRj8+jTgago2QTjD7MnnPMnMdNFew/FeXXuD58ViOvUeRbQZe7uCqazB2Ws2DH4Y561uYzHzxlQBoYjsyRNyGO/yHyMcCqXeTuHoXzLTGKk1q70COEuz4RqqwU7cAD2kf547Qyuad5NWcvqxNoX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDX9lLpZs7p/gdDOFYbOW+w6Thu2tlMWhrJ4Uxo+BFQ=;
 b=RZChL2T0rOoa6JyGq8LHENsfahvuQol4DF8oU2xlSmeo6W2G8kfW94lE/Xc2vcsPlB57ggsPNtE5p+YSjYvDutICoL0O+H2sL43QyXB3ChXafHKqwf7D3dCTmMNxrEGrDbfOh5R+RxvgJtIM54tzpCUTcAyl17aKd/X+ArNtBYlh4KhjiLxgoI50MtuA49u3ZLQv89ZsnVu2UAHbFbmpHzucatJ3pVh5vp3brza2A4iUBpSAP8n9pTIg9rA1cT3TazCmpvbW+2P6f0e9tozx+NEvvVvJ2NdBYSq8KD5hxHipnX5icWn54gVD69DF6wbJb3RuP4kjjXeqIQplVCnv5g==
Received: from SE3PR06MB8257.apcprd06.prod.outlook.com (2603:1096:101:2ee::17)
 by OSNPR06MB9147.apcprd06.prod.outlook.com (2603:1096:604:483::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 10:06:12 +0000
Received: from SE3PR06MB8257.apcprd06.prod.outlook.com
 ([fe80::881c:180e:661d:eb93]) by SE3PR06MB8257.apcprd06.prod.outlook.com
 ([fe80::881c:180e:661d:eb93%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 10:06:12 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri,  5 Jun 2026 18:05:59 +0800
Message-Id: <20260605100559.94843-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To SE3PR06MB8257.apcprd06.prod.outlook.com
 (2603:1096:101:2ee::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR06MB8257:EE_|OSNPR06MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bd7165-5017-45af-f5e1-08dec2ea1241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|18002099003|38350700014|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: yEVN2lje3JIlPT7YV4sCs7IkxdsICeUBKZ0K+GSt40eGoCqsWYtwcehQtq6NsxYMhm9xITg89PQFUBC8j6UjGH+a7wb2OYWGOiBpes9U8dOzZIIMZp+7lhQBw8w68kOcMXWnMAvZN5BrjglH5tecnPLu4bhZgiCZulkBgZerYDetcCaaEZbR1nsQOPGI6IZboX7X1eAb9x4/S24NEIPvD3W8uCI8vtBZ1dO1S1oUL2g4izMUy88C9GMnB/YPm+A16j8j3Vi2MmMjW5PTIhZa7/FA58JlcQV3dXOlG7hEvBdIZTcwih0YDgCkdJ6tgnutgNmyonTnvqdztlm9VYGsF4jBx6FUJ8YoLUUbGjjAF20DLEiuzhDvZzuyHoKpVhq0J5K+D8aMkCnHpjwkZaZxYy7pzhYg3TOyaY72sMpxcpb1ck+KmBZ7y7Z78NUR0qIUz5xgujbzXTVo1rDmELuNgYQtsk8ra9c9wB0kiR9XG6XAMVbNLr7lCoehN6mTVh31GvMGXSQhJIgqotxr96CuWUZyqMD+OUklQsn5D7ryCDE1l3XxDPaGe4FEkIm5O13B1lr2TcYVdC2wiI0Vzh7YBPTxW5b0AWVRHtGySEMW6nskKeSsRwaqEFQzdlpOeyqEvV4lB0G/w4NnUTRumdcWrqBgTJoR0GTw6PN7yCmP78gf5rTQIr/MA5gzqcS3oULytuSnyk6rHuoZLzvbrH6+EMx4h43WwZwsXLoaft/dlZS+z7MaK+bLE2V/tEdX1ViO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SE3PR06MB8257.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(38350700014)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGgxo56tYRhW65g3trbXST7Lzag48B6jlARIyvJegpJ8ezzE8vUGihne31zR?=
 =?us-ascii?Q?eG1q5FMlKo2RFR0ED00Wt7SRtuL+sgCQOvx/vEZ/oYmvNFolVFqWkEVya2L1?=
 =?us-ascii?Q?mIvfLnfPlagjOTkOfMfwfEjdr0fGtgYATogsXzuBpHnA8VEmXRkPdWA51njx?=
 =?us-ascii?Q?5afmYnWpsEMnNKuadp19DqLHvmqW6sRMLQCaR2javBcbJQW2wAnLFNEa6Lte?=
 =?us-ascii?Q?azbFNgeGBEf5+2fBmnRkFmbV/RsfD2kNFo+d0zYXQemLbSpmmw0uXvBgSKcj?=
 =?us-ascii?Q?w9+hhsfhav85ocqZT4Vr7yCowSixX5dGE+pnBJ8irwV5j4U0f8AnYMCKqWZg?=
 =?us-ascii?Q?hbth1EHhqTCWEo2+PrFP/n7e/ggQ9g6bVvjB4ljoj5xB/86+7n+2vv58dwQe?=
 =?us-ascii?Q?nLaEC6//uED1WUuO9NHQLGVxnGFXLQcV6DQrAGcNx71PRAOfAZsoMWPaLN5M?=
 =?us-ascii?Q?WZN9UUkd4JDfMHkfOcuUi/E/5zbLuKgwcpfML1UGNAxGEKrZdkmX2y0X/nUD?=
 =?us-ascii?Q?yJxWL8qxqckipY6JArYINA5AkQ1dxESF8k1+f9+jryLkYLtoleQD6Ejn60eR?=
 =?us-ascii?Q?Gnc2WVcKrXA5tYNxwGAWVb2ZYe7jec0F2ytNfsZVWtLKRKNLebTSSUMmJUd4?=
 =?us-ascii?Q?jsQsfD3OWjZZGTlNTJ4OoYalVEflZ62sE7DCllPUJe/2nNY1fjyVE0PfWF9K?=
 =?us-ascii?Q?1ci58Fq4yO88FmGOOOKIA5pAprAhxWJId2qaEgk0jRhRy305yfJZxsjMGFGH?=
 =?us-ascii?Q?E3iWaAhPWtN6KQGEe0fPiqJ2flHmPKvFUaDvTU7k/CTaQbNg55q8IeBXMLST?=
 =?us-ascii?Q?VU52YVKRxtvSk/nfeO+m0JebfOljtPtW3SZW8CArCAaF5fIP+idLgXMhaRlS?=
 =?us-ascii?Q?+h+5QGCfyKLY+OqMaV0OE4Jy/dE59kRgLT/nEmi2mibC8RTtXXZyxV9caDuw?=
 =?us-ascii?Q?pzjsTlbAf6gkPFqbsCX61M81/6bi0sZ3Fd72h/5Eijs3I1umNUij0RxxKVEf?=
 =?us-ascii?Q?IJ+xEiMH0yR1029vonYrkA8hQtEy/jSd0dQkdDk0svKgQ4gQAg3ait+XxwoL?=
 =?us-ascii?Q?f136MrBCCYSFL9R8d3229gbX4jxe9BXC6KKnNr4+XjJ2b2a0/3MAIHd1p4xc?=
 =?us-ascii?Q?ksJZrU3q+2K0Ckqrg1dCy34nIzfpnZvg2FDInKt94tUofc6p4LaB9ufHklJN?=
 =?us-ascii?Q?wcjknJ2ZzBOdC4v2YyyyRiFtyKEmMDB2QZ7zcD1bBG1P2WmWuKDdzJZ4mciJ?=
 =?us-ascii?Q?T9QoSbtkDs0EKNaVIhn7NbabxkNtjnVmbAo0TkB8hPjmxLpXnpaBWEht7lwK?=
 =?us-ascii?Q?h3qZGs8gVuLBpIajvNvETXujUiOFOSyn/WAX8hGBkPq+z3JdX/E5lqbF8+Fn?=
 =?us-ascii?Q?JYCfWoIIM768jvyyIKsvu130gAgsG8WzUzOOBL3SYUtl2lXsCl6Hor2yclFM?=
 =?us-ascii?Q?b/ZdtM5qc7vyYhFWJAb2Wb96dxa4XMoTgzG6hFcp1Bn7IS29SXzOSl3q+SRE?=
 =?us-ascii?Q?HyjvF2reax6TWISJTvvi8w880OUdyrbgpuDFvTtznA7h+mZwMtkiYKg/v6ru?=
 =?us-ascii?Q?EMwOdpou3/7B34fxXsFEvWFEkWxyBmHPMDqm5DF21AcpOWOYEhkLDv3+zbh4?=
 =?us-ascii?Q?vCugFGYvu53S4lCakD0u9FKe2BsyJ+z1AYpfwSCqGodeVLhpTcKLkYdFlRR3?=
 =?us-ascii?Q?1ATZnVbrZvOMPaRWqaOTv/y2LTWUXGNAPrKsETk4V7eCOVOEtG5jt2SuV9/E?=
 =?us-ascii?Q?Sa8THeH2Qg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bd7165-5017-45af-f5e1-08dec2ea1241
X-MS-Exchange-CrossTenant-AuthSource: SE3PR06MB8257.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 10:06:11.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qwf4DWk3tA4PAXsEHcGq4a3uNO++EXdFbOKsLuU3MgskpWqwLnOO5HAXICvZy2HevCAD9IOviZRMz83DWwemug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9147
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since commit 29c1e18a0bc5 ("fsck.f2fs: tune linear_lookup
 in f2fs_do_mount()"), fsck_update_sb_flags() writes the superblock directly
 and nothing sets c.invalid_sb with SB_ENCODE_FLAG anymore. Drop th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.26 listed in wl.mailspike.net]
X-Headers-End: 1wVRg7-000642-Av
Subject: [f2fs-dev] [PATCH] fsck.f2fs: drop unused SB_ENCODE_FLAG
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:guochunhai@vivo.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:mid,vivo.com:email,vivo.com:replyto];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[guochunhai@vivo.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F57C647461

Since commit 29c1e18a0bc5 ("fsck.f2fs: tune linear_lookup in
f2fs_do_mount()"), fsck_update_sb_flags() writes the superblock directly
and nothing sets c.invalid_sb with SB_ENCODE_FLAG anymore. Drop the dead
flag and simplify the SB_NEED_FIX check.

BTW, SB_ENCODE_FLAG should originally have been 0x10, not 0x16, since
invalid_sb is a bitmask.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fsck/fsck.c       | 2 +-
 include/f2fs_fs.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4fca4dd7eb1b..85766118d04a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -4001,7 +4001,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		if (c.invalid_sb & SB_FS_ERRORS)
 			memset(sb->s_errors, 0, MAX_F2FS_ERRORS);
 
-		if (c.invalid_sb & (SB_NEED_FIX | SB_ENCODE_FLAG))
+		if (c.invalid_sb & SB_NEED_FIX)
 			update_superblock(sb, SB_MASK_ALL);
 
 		/* to return FSCK_ERROR_CORRECTED */
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 21310fa6a1af..07772da6e67d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1477,9 +1477,8 @@ enum {
 #define SB_ABNORMAL_STOP	0x2	/* s_stop_reason is set except shutdown */
 #define SB_FS_ERRORS		0x4	/* s_erros is set */
 #define SB_INVALID		0x8	/* sb is invalid */
-#define SB_ENCODE_FLAG		0x16	/* encode_flag */
 #define SB_NEED_FIX		(SB_ABNORMAL_STOP | SB_FS_ERRORS |	\
-				SB_INVALID | SB_ENCODE_FLAG)
+				SB_INVALID)
 
 #define MAX_CACHE_SUMS			8
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
