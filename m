Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68584926DB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg6-00071b-Td;
	Thu, 04 Jul 2024 02:58:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCg2-000715-UN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2c1EobU3iBL3ITOx1tLgmqk2H2KecIqK18n40b2rZOk=; b=f28as2CUfTSKqvub98DfYFPOQA
 LXQKBjAy1M5jCkkZ9Y5BUjUkvSy3O5DIFC8ZJK29S/qYVGwLC2u6Gyi1ybPMooLH1zu1N1zGnRycT
 06yJFLLzvn0CE9yUYtyYAowpDQeDYyCAkVQHbLpMAKq4weCYVQdwgv/Lhv09AzVbe2eU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2c1EobU3iBL3ITOx1tLgmqk2H2KecIqK18n40b2rZOk=; b=LormLVlzWbWRbql83Iu7vKS26B
 uYh7B/B3eJ7a0LOxEgDPnV+J8MzSZMQX/kRuEol4lNOMZf32CGkhCa6JfMkv00/0/ffh5cFCgy6Cn
 kzahbaXz5jIQL+618GA8xIY07F2YwVOE3OHPLOysytZ2H3wpJCtKgfj+WDcUszHs6HEQ=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCg3-00010i-6z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4nRGNGRU4NEpDyeDWzj7pmPz6jiZMZLNXykKbWVaYg7dFF1tBeiyBuJHqqaCgWFDXvzEBMlBg+amDO2pY8EIQ/ZdgYEczOAFfbLtIsxs3ox8AnNDm/O/TJexC1WHHmD2IqH3SvdJAYTru48BWYKjQ9WyTurwQUeJ+UVlEHJiDGugocB1xACto+Xb0A1qwg9BmjeCh7w1Y/GoXcUYQOuSlzoC0PDOqmTd8pWLpLA+OrzGVLLnFC5kmEBlrWMcIoYWQxNzNqFUfSccPA0CURL9BiR73ADiNjx4zeIoCLncbF3Cgq26oo1jDJxhDvnuj/hqjts+xBXPBCOjVZX53fVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c1EobU3iBL3ITOx1tLgmqk2H2KecIqK18n40b2rZOk=;
 b=eF3dLlwPvlqJBMdEU98OSLyXMHD3BLirH9ek3YWHKLr4TMMYD3wqcFHmPVgZdkeotv9G7aFr3vEVkBJz/Zsu4dX6F0AHerWMp+H55miiwsAXcrSYVLyNY5UpC3aib4NihuQSrEBiooiJsfmxbf/Ri18zq2gPdgxeaOJNI1u35QQJ96CbcPoYrdW9tDILmg1HOS/7OoZ/fGCpjTFQQBXfSpnsLHKv/oAOmAICrFdbRY/qeG5FbTqNe44coIUnlhk/CmT9lJIfAvh3pRE4GP4euzcVkkBmyg3A30pie0wV9w1p4qBVa/ga8kTxQBL0xonceaWPclaDgQrkW2aqrw+Bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2c1EobU3iBL3ITOx1tLgmqk2H2KecIqK18n40b2rZOk=;
 b=QrofsM9iYgwilhLIRaIi3voWpYVOlLsAsA4q19KBEfE9rvIEwHM5rHE7lrQLZ+wcVL/sBCefXD5oaVMcuauUvHKL2ffNmNpR0OFdf7xGjPRRahDQIHFy/1vLVQA3LaAP6+TYWK8jln7mHuJoU4WP6v8mtOVkN0xrcBJqEiFtCk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:18 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:18 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:40 +0800
Message-Id: <20240704025740.527171-11-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb77452-f573-4105-c7ae-08dc9bd52827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rMaK3HA/m7AY5MZXgvSYypvlNtufNlij4weOEnylxnytyUcbI8XJRlJ4jM/v?=
 =?us-ascii?Q?eHcnQ92rlk4Vx64hPr94npwpzTjRLhMZBm4mM9plEz3sdjScpgXru57+qPDG?=
 =?us-ascii?Q?teiyxL+/zE3Ca63EgXVR6rN8S7WeqSkHu846Hz+HwTbBQcB4gAvgSoftYz6x?=
 =?us-ascii?Q?w5EmaZIQpeNsKC9t5zaOYhcJu7iv+cf9nDeytEGM/o2UonML9mP/+JuZsDus?=
 =?us-ascii?Q?KiXVTCT+dQ8GsglefI1A/W0h22iduc9BCznFEq6YeIt+NaaWHE+sf8G+4S2+?=
 =?us-ascii?Q?HBCLZlxDNo2nkybzDTh5F98SxBWJxrNdeWOBtttc6cyfrYa4ZUbeTbfS94O5?=
 =?us-ascii?Q?CRxSHMeedHnzHuKIGBChEy18OxtJT13qlY1pGWhFlg5sPm8JhsPWzOOrKXLn?=
 =?us-ascii?Q?uFG8G7Nf1T+pPDqQMC78vgPLEuAesH3ZmrPb4QWPBgisg09DFS6x9I4eVije?=
 =?us-ascii?Q?mse+V6EvfmnaldGjDja0sPzWA5b00v/WaBbFIBDWJZZ7m73tNiE9tGp5Ukbb?=
 =?us-ascii?Q?IpTPcIiXea6WDnK04C0sc+MZohpzDxywiweTvM7Xpjv2Ydk91AUvb7kjd+Y4?=
 =?us-ascii?Q?LpJbk3tzuaWY71524WFslj//pqMExjFaVEa5wjDNrHQcsJ8X43T217rDnBqg?=
 =?us-ascii?Q?T/xX0naM0EU/kmtgngjhz4po77x7mhH1wkxqsRj0v+85EPv94T2BzOCDmPdS?=
 =?us-ascii?Q?Pnhec7oyeptEU0JEdNkiiwRYDEucGEg9Z3MwhI8UJYDx8pbobeZpLa+DOSEA?=
 =?us-ascii?Q?18Qb5upXFTHETHukRCGkZSbL85yI01arXoWrwcMXeYK02yjzTE05sMfyzU1o?=
 =?us-ascii?Q?Kx1sjNGASFK0377BOAdT5yHk7tjnk51VFJ2VM56+Tk+p8shjdmhUur2GPu/J?=
 =?us-ascii?Q?e7kjM948qv0Ph3EMD80U2y26NATAR6zZQTxXUKe3JDmx/4JdhwngqjhFCvaR?=
 =?us-ascii?Q?aWNchkF7wK8x3nhKo8AVkevnQ99C/YwjzLU/F/6Fx1rSbl6JSc4gfq9uePD/?=
 =?us-ascii?Q?lWod8DMlfG3qWWEeHHgcQHof3cN2yp2GRaMWXQ1FEuMlOVvH2scTf/+PDWDE?=
 =?us-ascii?Q?q9QtsMXOQ+RBZr6bHSPCrv76Tbth1RslW0Y8ruifc+UwaEJVN79sPYmV5K9h?=
 =?us-ascii?Q?9EgItSm0qltrgWU3OKKP9p/ZmaRgJE+jlG5o5GG3ckiQ2/AKTXt6m6PYxXdo?=
 =?us-ascii?Q?BGQIu9e9KBhkmYquYzvaDWtb+2SZSrbxZJ+Z8fSTXHzq1E8xopRewK4CyQe6?=
 =?us-ascii?Q?rR3sUa1h/oQRwHAipj0VvylwskqDkStJTJa/S31F8uFiJuMjZHOPHNui61zl?=
 =?us-ascii?Q?3LGaH5ZqJbB8H7MQXNKMdQiy4ztgkc2HsKLZFjN6uTjc1/bjl4cVvSjV/TnH?=
 =?us-ascii?Q?oDNzk8aASo4As61MZ1hfuql4clhDjJoZ0DidRf5Jpcn2ujJjHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jm9wVcBFu6+rO2C9KFWL1ytibIXAkH4Zmn1Nch6dDV9t3t8EqjGlHEHC6nSW?=
 =?us-ascii?Q?YvQjeKnO9MesY0ZmHfsKJ3MsuQcs1esmvPz54+vIcU0FBK5k3FIqxQIwANvm?=
 =?us-ascii?Q?ML++AuACwT70iUpQ3pvoR+If1UiF0XFpkME1FgS12NxptjL3HDXsIpJXnqZ7?=
 =?us-ascii?Q?B+h3NvlOQyiqtZxqf0cWgNFIGg1JqUWClsobc+p7gYjsq3IMlazljv1cJeyf?=
 =?us-ascii?Q?E8OrWhlHwJd/WUtYYJjGqhBlAPb5XqmJg91JCKstKbiB2mSZ9tDaIeNXjzvm?=
 =?us-ascii?Q?6nqtgliXSBljPZF9x3rmwc+IRbQUv5O5aazDcoOWXHKFzEUd4md+pvQO5hJA?=
 =?us-ascii?Q?gLeJtqOfmmae6IAaNq7HdfYPXTfb25oj4EZ3NLHMBeR3rDY0prDH7XEjRrDq?=
 =?us-ascii?Q?uQgFIC1m80Rp50KudR3c8oqNZKn1+u6xpqLkTJMTrXZYpRCqqMX4DaM0B14z?=
 =?us-ascii?Q?zvEzTMEqzbBl+WXakSLCTcG/LyPLo0WhIBRwMRlXW1YJnWAfzCdyuJ2pbeNw?=
 =?us-ascii?Q?VBZPWqxovWTG/WVopDoRj0pm04HkGNmItpM0M9qv5tdNysj8x+rjnKSgsr4g?=
 =?us-ascii?Q?LLiST1TO/S3wXr+l+6KC4CtMotKOFjB11IyTncoNg7cYL3yKuygNp15YEYa4?=
 =?us-ascii?Q?zkVMi8dGsT3iqND9EJjO6e/bfjAkmUUcc0biIju+B0LQ3j7AS8Soj+NW5um8?=
 =?us-ascii?Q?8gxokZ25GGOGA05IeNMbQ547dEOFPygWQdG/Sl94nrZA+HDgXyuNt794jVUO?=
 =?us-ascii?Q?adBAL0XT00c7fH59CchfH9gvQnK7uWlJgLxMyJ/q1kiDGuKYpbSkj5+R9ZRV?=
 =?us-ascii?Q?IQPDaS1Josy7my10pkTJZmbLZq8J197frxMgPqg9aOb1NXglPsbnAlzO57BL?=
 =?us-ascii?Q?MkmXI0mBS4oGFL9Z05xL1x+8R8WrBMjGkQDJRnBv7tVjsblBVsbgG3dUOyfr?=
 =?us-ascii?Q?nPHeKDsO4xrVSoR5h7bq63Oi/B2o2AUsNbOvgN2HXmYvAHgD0s2bq+DIHy0I?=
 =?us-ascii?Q?dcJyNrhLHlPwd+Ka6+oHaKwIeWSpQyMD4Y9Fabfgir48bq6f+dyVEf+95BG5?=
 =?us-ascii?Q?GL/hpn+p3LH2nLAGa543r6nSpq3bAGPcLIcw9tGHe8CidRlKFQvQhfIok5f+?=
 =?us-ascii?Q?PyvIIxkaLbkanHD+VxzkNgRzjXo9fl6Jm6EypbIqnGf1Ymx87AQe0RfQa+3q?=
 =?us-ascii?Q?gds6zKsiJuVMYM3vNM3KanJBgdfcWUlUVZK9XS+NBIX5LrKXaqByfscgODBw?=
 =?us-ascii?Q?CTdU+qD877EiXJDTPjOifiFN8fhlOylrt4sUc5l+WJJhOtzq/0di6jSJSZhO?=
 =?us-ascii?Q?6bWBP6s7oopKwURlz51mAtUKup9YVB30FFeAcxxG8QUjCJw4GQwmQg/CP5bI?=
 =?us-ascii?Q?++Wa/JO5pDJOkotczkxv77hCPR4KUpptA4EVHwByT/GME1rLDolzWNmX2uQs?=
 =?us-ascii?Q?7DeBgF1zZ4dAXC/t0Z7uhbPa2n4KjQ8FLO364jjC99RjYRHHrr/uKwblN2Ql?=
 =?us-ascii?Q?dw83/mn35P6X4CDTZLYl0s99bNtwWTdSqWBhv+BkFVrtDbfsuUjD+RAt4vSI?=
 =?us-ascii?Q?kB47TPkg65CyRdZIBkL/wYf0No3B1heK2BHTwlPc?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb77452-f573-4105-c7ae-08dc9bd52827
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:18.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SybQkeK5hjmYw746bY3UwEAS2tFJ3MRs+Qj+P5GjZem6mWBDAeMsWScyQtYy9JQ9feD7iWnjhgpIZYl56DRIeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Reviewed-by: Chao Yu <chao@kernel.org> Signed-off-by: Sheng
 Yong <shengyong@oppo.com> --- man/Makefile.am | 2 +- man/inject.f2fs.8 |
 225 ++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCg3-00010i-6z
Subject: [f2fs-dev] [RCF PATCH v3 10/10] man: add inject.f2fs man page
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

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 man/Makefile.am   |   2 +-
 man/inject.f2fs.8 | 225 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 man/inject.f2fs.8

diff --git a/man/Makefile.am b/man/Makefile.am
index 9363b82..b78344a 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,3 +1,3 @@
 ## Makefile.am
 
-dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8
+dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8 inject.f2fs.8
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
new file mode 100644
index 0000000..01d58ef
--- /dev/null
+++ b/man/inject.f2fs.8
@@ -0,0 +1,225 @@
+.\" Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+.\"
+.TH INJECT.F2FS 8
+.SH NAME
+inject.f2fs \- inject a Linux F2FS file system
+.SH SYNOPSIS
+.B inject.f2fs
+[
+.I options
+]
+.I device
+.SH DESCRIPTION
+.B inject.f2fs
+is used to modify metadata or data (directory entry) of f2fs file system
+image offline flexibly.
+.SH OPTIONS
+.TP
+.BI \-d " debug level [default:0]"
+Specify the level of debugging options.
+.TP
+.BI \-V
+Print the version number and exit.
+.TP
+.BI \-\-mb " member name"
+Specify the member name in a struct that is injected.
+.TP
+.BI \-\-val " new value"
+New value to set if \fImb\fP is a number.
+.TP
+.BI \-\-str " new string"
+New string to set if \fImb\fP is a string.
+.TP
+.BI \-\-idx " slot index"
+Specify which slot is injected if \fImb\fP is an array.
+.TP
+.BI \-\-nid " nid"
+Specify which nid is injected.
+.TP
+.BI \-\-blk " blkaddr"
+Specify which blkaddr is injected.
+.TP
+.BI \-\-sb " 0 or 1 or 2"
+Inject super block, its argument means which sb pack is injected, where 0 choses the current valid sb automatically.
+The available \fImb\fP of \fIsb\fP are:
+.RS 1.2i
+.TP
+.BI magic
+magic numbe.
+.TP
+.BI s_stop_reason
+s_stop_reason array.
+.TP
+.BI s_errors
+s_errors array.
+.TP
+.BI devs.path
+path in devs array.
+.RE
+.TP
+.BI \-\-cp " 0 or 1 or 2"
+Inject checkpoint, its argument means which cp pack is injected, where 0 choses the current valid cp automatically.
+The available \fImb\fP of \fIcp\fP are:
+.RS 1.2i
+.TP
+.BI checkpoint_ver
+checkpoint version.
+.TP
+.BI ckpt_flags
+checkpoint flags.
+.TP
+.BI cur_node_segno
+cur_node_segno array.
+.TP
+.BI cur_node_blkoff
+cur_node_blkoff array.
+.TP
+.BI cur_data_segno
+cur_data_segno array.
+.TP
+.BI cur_data_blkoff
+cur_data_blkoff array.
+.RE
+.TP
+.BI \-\-nat " 0 or 1 or 2"
+Inject nat entry specified by \fInid\fP, its argument means which nat pack is injected, where 0 choses the current valid nat automatically.
+The available \fImb\fP of \fInat\fP are:
+.RS 1.2i
+.TP
+.BI version
+nat entry version.
+.TP
+.BI ino
+nat entry ino.
+.TP
+.BI block_addr
+nat entry block_addr.
+.RE
+.TP
+.BI \-\-sit " 0 or 1 or 2"
+Inject sit entry specified by \fIblk\fP, its argument means which sit pack is injected, where 0 choses the current valid sit automatically.
+The available \fImb\fP of \fIsit\fP are:
+.RS 1.2i
+.TP
+.BI vblocks
+sit entry vblocks.
+.TP
+.BI valid_map
+sit entry valid_map.
+.TP
+.BI mtime
+sit entry mtime.
+.RE
+.TP
+.BI \-\-ssa
+Inject summary block or summary entry specified by \fIblk\fP.
+The available \fImb\fP of \fIssa\fP are:
+.RS 1.2i
+.TP
+.BI entry_type
+summary block footer entry_type.
+.TP
+.BI check_sum
+summary block footer check_sum.
+.TP
+.BI nid
+summary entry nid.
+.TP
+.BI version
+summary entry version.
+.TP
+.BI ofs_in_node
+summary entry ofs_in_node.
+.RE
+.TP
+.BI \-\-node
+Inject node block specified by \fInid\P.
+The available \fImb\fP of \fInode\fP are:
+.RS 1.2i
+.TP
+.BI nid
+node footer nid.
+.TP
+.BI ino
+node footer ino.
+.TP
+.BI flag
+node footer flag.
+.TP
+.BI cp_ver
+node footer cp_ver.
+.TP
+.BI next_blkaddr
+node footer next_blkaddr.
+.TP
+.BI i_mode
+inode i_mode.
+.TP
+.BI i_advise
+inode i_advise.
+.TP
+.BI i_inline
+inode i_inline.
+.TP
+.BI i_links
+inode i_links.
+.TP
+.BI i_size
+inode i_size.
+.TP
+.BI i_blocks
+inode i_blocks.
+.TP
+.BI i_extra_isize
+inode i_extra_isize.
+.TP
+.BI i_inode_checksum
+inode i_inode_checksum.
+.TP
+.BI i_addr
+inode i_addr array specified by \fIidx\fP.
+.TP
+.BI i_nid
+inode i_nid array specified by \fIidx\fP.
+.TP
+.BI addr
+{in}direct node nid/addr array specified by \fIidx\fP.
+.RE
+.TP
+.BI \-\-dent
+Inject dentry block or dir entry specified \fInid\fP.
+The available \fImb\fP of \fIdent\fP are:
+.RS 1.2i
+.TP
+.BI d_bitmap
+dentry block d_bitmap.
+.TP
+.BI d_hash
+dentry hash.
+.TP
+.BI d_ino
+dentry ino.
+.TP
+.BI d_ftype
+dentry ftype.
+.RE
+.TP
+.BI \-\-dry\-run
+Do not really inject.
+
+.PP
+.SH AUTHOR
+This version of
+.B inject.f2fs
+has been written by Sheng Yong <shengyong@oppo.com>.
+.SH AVAILABILITY
+.B inject.f2fs
+is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
+.SH "SEE ALSO"
+.BR mkfs.f2fs(8),
+.BR fsck.f2fs(8),
+.BR dump.f2fs(8),
+.BR defrag.f2fs(8),
+.BR resize.f2fs(8),
+.BR sload.f2fs(8),
+.BR defrag.f2fs(8).
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
