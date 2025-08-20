Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5DB2D53B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 09:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XiGL7+4Hxu0IfYUG9/BnCY20Qa5c6ao8Nwt0iTJZaEs=; b=kXg/E6Yt1d69aDJkHQc8L5OAqe
	6lyTbfwUaKvLKgXNt33wHfNq7Mzp5K2lWHi0LlhizH67e4KV63bQ8E6MTEqHb0OUn+9MUBqiBaHUk
	fWIBinBYUidTaDTfagfPyCJNGRLWwQd/xSwIR9Sw2qze5sUiqpP1lrHVm18kXZhSMtYY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uodf4-0002Jk-LG;
	Wed, 20 Aug 2025 07:55:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1uodf0-0002JZ-EV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 07:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQmSL6H2PbwDuncL/3vw/Ta0HW3JCpzMNkeY2oXCC1s=; b=mYaAq1vCrd0XH1xyZ5PhDdOF0I
 Hff4DGbcu/p6Aj2IBlop4BGFCDPqvMAQwNeseg4RpkaJtsitzz/PfzHPbHXCvjT1bo4ji+pTr/NlN
 m4XFVRqfWw+LxjS10V0qbxxnymcIvCLqNXknyaDdWMLwmDh3C22QZm3eB8bUzWBZUgYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CQmSL6H2PbwDuncL/3vw/Ta0HW3JCpzMNkeY2oXCC1s=; b=X
 sRaTvwV9SAO3B+yGDWTmRLFN8GyW+jGye4/tLK1jbrLTVdwROa1P0XRN6/8o+knGRyi/GaMBpjvUQ
 8wfaqK1DnH1bib9OurjGtAX8LCIYjcrLe7Y5oyQvw3ziTN9gLz948SARGU3EnIwCSU4xFAEbD1kJ3
 CQjezGvTFym/ZC9Q=;
Received: from mail-japaneastazon11012064.outbound.protection.outlook.com
 ([52.101.126.64] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uodez-0007tJ-1u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 07:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUidHyT6vu9LmD2Pb7gy1wFCOFT5ojz+Jc5g+OxdCti4L45rODpkwUVUN3rSpMnJeNHaRaQS1RcNCTfdD5K+ruiWv0IkZvF4pnsXyzXqESIowlnXTRkAf5OxTMBgZ/+06OMFyd00B4q9hHZ0bEwOoYPxAdLj10HvuS+sRj23Fv8ZqY5sdsMUW7M7dFVeoERYywOf9Y7fnV+xPD7mk3429XNMVNesZ17ZofztKa2HYvA6AhJmo7zp3bIaOMMXttqhdo4vX0jO+WCE7AM6iAweAyXKsoNj672/PL1bsijB5dCMn4U/lUMDI08f9HqJ/rdpAxijMZU8D+TeM0K9PLg8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQmSL6H2PbwDuncL/3vw/Ta0HW3JCpzMNkeY2oXCC1s=;
 b=pfmNJKGEg9lcaRWpxmTRFjQfqoTYmCYyerYXWCDwq+qsnEt9anuQmwVF1udobtPzpP9uyfj26QMaSftJAw6rjestOovcY2PUCGvAtKLOn5Y2Ja4paKM37FxsQRboGYN3EXwKjnjhP0E53QYVPZM4wK6i2+F/Tjk0YEv1yGh2uuhdZ/ZIbNlwcVVNAGxhixSfSaO1gl7ZGFKko0zRBiXzHXUONsvQ3Ba7NIsziMvhI7FhIXFvQjEBSkRxro2fZuoFs8bYz/ffgRRSRI0gg+/sKow4dNnmURdrgtw6rOqyLjon6SpZoFV7NVfWHwalYz0qsdV24FfSyBD3iplkrgHHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQmSL6H2PbwDuncL/3vw/Ta0HW3JCpzMNkeY2oXCC1s=;
 b=h0h4Or6EKsD7MasazS49vjdmQjem6e8kioPXt6I400JBWFWW8r7Ib7G8EnPVFeL6o4McjEIIJmyYrdbGaRn6ziz1C7U2uvb7aiAXfpwhD2LO19TZmxJwSgqeyXrwgA6Xi6g0Tm3w9e2UNCIBsMoHXAiAQv7Rpno5gz/JFxDAkGzrCHbRRAsZNIo5IdStdDi0PQTXDX15fDd23YLVIjqUG0SShnU8YcLVh7cSi6KZBk5YvWhvJpIRdS2t76uzL6yREooSCcRggbfjsTgkixPttcCWQ+mIyaE0MIrysiLZBiKEUh/49tvVQDk8x1OuFwM5/W74/tV22dnS64K7dskqqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by KUZPR06MB7985.apcprd06.prod.outlook.com (2603:1096:d10:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 07:54:56 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 07:54:56 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 15:54:44 +0800
Message-Id: <20250820075444.378907-1-wangxiaojun@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To KL1PR06MB6845.apcprd06.prod.outlook.com
 (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|KUZPR06MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: b7de6cd7-ee28-47da-d97d-08dddfbedabe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dnnsj3Wumq7HTKiP7nukvk90Gq1SM97Dp6wQW3Ju9SQjXJ2syLzmIEMkOh69?=
 =?us-ascii?Q?cv71Hwzu8Vm8zW1aPusmaFNOYIlLq0NJHHiH2EK0nYB8anzbWWt5he+BhoXE?=
 =?us-ascii?Q?/VV4lbF4XigYlf1iXJB6RpwH7IzIP8HvqsyspX2BY3jUTSMw2UDpcXKxFOP5?=
 =?us-ascii?Q?TMSszuvFjoXBJNDGepeTwih6HDyDNmGtDWfGvVJbsSkoglW1FIx6p+3jvGJX?=
 =?us-ascii?Q?N1ickiOxjcYqhP6RAOskg35hiROGk2Lt5uHR55mrB1N2nS+GrZwi5QWx1We7?=
 =?us-ascii?Q?6EvnkYjBOHJwz0cAaStWOxz+zr3wWWiRgjiPM9d1M/QQfj6eB0KrYXJbjIkv?=
 =?us-ascii?Q?PbGh2hiRsdx0Rv+VNLiJbv6SZ6UkiqPu0U5USRcFAeLSWz4uxIzQxlmjeu9Z?=
 =?us-ascii?Q?LoA/FicMUmYNzQeHj1w01tSBe6WmTJRkGS1nSkvihopQLcgl4Wlhx/6+AJ4H?=
 =?us-ascii?Q?Ilis/KqNx6AhJlF0oIpko3IPFZ5k1N8+X2BHVbPST3cDmV7FCYBWh/x1GGWI?=
 =?us-ascii?Q?ahPDm/qItqgkVLvy3lfRVQMLNG029RTqMJWJd437c0Bu0oVxPdJT78EWtHi4?=
 =?us-ascii?Q?URmkzwxlEBUbHKaaoI9IYMZOp6SD/lT7a3Xb26W8eCDBPRlaibNnnzrU2/pR?=
 =?us-ascii?Q?JMUVDpNYOmytohr4FpBIEjp0e5kl9FzW43sP5px66lQm5E5Y/R2/QAWCLQ+b?=
 =?us-ascii?Q?IpZJv5rdXSYmeC62b3iijsDr5Nka9AgZGgUxHC6hqNuDj5kHRux1IgCVt6f9?=
 =?us-ascii?Q?dL1ZCGJTbBe6jVAlu9/uBpLyA4V+PreWGgVcpwr1PrjF/i0B6d9FOFPJh4IP?=
 =?us-ascii?Q?GlR9+dtm4VXrWOYadAesKoL12W1mea6WaLIB/0y7kPpsBORCTgnEC2EN6i2Y?=
 =?us-ascii?Q?btXm7x2n6B/D3XRwjki0VJTFJlteMfdlHFl9ymh+dwnN7DKqHSMmj1x6GOsJ?=
 =?us-ascii?Q?QGhNBrjtma8diQBHJBvGrvmjWMiX5DO84zeTV7W0vXcWnB98A2+J6rOhjzY6?=
 =?us-ascii?Q?/BvEj+aQY9K03ivWVHZQLy40nfVX3QnfQZGsnqkRnvIW12HONTAWQNtbP0JY?=
 =?us-ascii?Q?ZKzweD4JTrQ68z953ql2lggDaB1/wWXNpMm1SkCQCImXGNF6Ka3IpCHN/Dcv?=
 =?us-ascii?Q?4JBOSyK/ubg7kPi1lmywUAjOi9OZHqxyI7NpW4zIoSKThtMYizqcVfdwN7rg?=
 =?us-ascii?Q?x8EMFZF9C8/2DDk/oiHn90UC1/OLAztTMcWonLkjbalp6NT1r8hTUNoU8cTR?=
 =?us-ascii?Q?HmWO2aff0taocqoC+DRHs2KKJowgmKy9KwVAcAipRkham6Y+R1Eg2PBtQjYi?=
 =?us-ascii?Q?KlvEKdeujnBpv8HTW+HOkM0oX3MIPhpE0DOa1g++7yKhf2fjZGbXHsoiQ8az?=
 =?us-ascii?Q?fSapKCgHrbX8IRF6s5qTWtuJQx0creb9TOziA5ddQ2MAeqapyWhcacKOPLsn?=
 =?us-ascii?Q?N87eapkS71ke+Ce9gIWUKeOHOkvCz3SG56ybFhkUrlsrW4bwshzIybIa2vyl?=
 =?us-ascii?Q?PomvG4L4y+imi4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bn2LJjbEtG6WbQHKxXRRBnm9DtiyrXokAZleZJRG4xdoYfsGIEGk72DdzvtP?=
 =?us-ascii?Q?Bfce/dB295o+X9XYnen5HjD13eIzxP3wfH+c247Rv68wp0S9NN83+LWa9JSo?=
 =?us-ascii?Q?JkWZazbUombHNgj+qm3pTqyI1tLy42KylnUyJcH+ZXVFVbFQAVqEvcVNOPfT?=
 =?us-ascii?Q?Qy0tFzgt/J3Hy3o1FtyPgJlxjA9ggzPfZdY01Z/75e6WKkxakoaXTahx+AD2?=
 =?us-ascii?Q?1BiZmgPGNFHYxid2tO8N86aLRDt9bOgSeqg93LUswbd88A6VfeI9Nb60cIgb?=
 =?us-ascii?Q?EPUOcRST96zNRHYW3Vpv5jAd+EHr7VIGeNbXO92RjWi1I5RVgeHu6ngT+X88?=
 =?us-ascii?Q?xf+r7s27SWIgOW2R6YvA0u/YJ3GcFLLB50cDR0PynzSSi86ObxWMl8/xpNH3?=
 =?us-ascii?Q?q80BFW0tRPT1b7x4RF5ssewF7H7qOz9ZyyF8zNsJq9eeSG9G29pl9bEC8nxp?=
 =?us-ascii?Q?3miahHmL2mf4gWjqx4TdRYwrNMjvL3OJC1vCUpP4+LbZ25xMfjU8QQvAqcsY?=
 =?us-ascii?Q?7+uf8i3ErApktCBrfJ/9zTUZz/wWreIu2GBp8V6z0iAb8NmCLlW9R1hJpY93?=
 =?us-ascii?Q?rr4ASPm/LQZ/f+yPwXXNEasetUMw/xl2uC0Ne8hA9ynSmaMGv++vLAvZlgkF?=
 =?us-ascii?Q?0aTRDFbuMkAd2voXAqbeIsu7MkjfhZntCR26FyPf0W9hBQg3E8Q2D+WWYgAv?=
 =?us-ascii?Q?93tMp5g0YHTHQGHl+OlXJVK6HMmdq1Pt6LDJlmqJmOurlx7NXFqYvkgq7PJD?=
 =?us-ascii?Q?+yudyiRM0phQ3puDF53BmcrbTNzMctuMnzUJX8i/zE2gZKSXQJGKV0ioxWhs?=
 =?us-ascii?Q?Lo2huQAtAubfnUTNsboyCq2yo/nQ+XqMz4KPWl/FtLKsNOyuirX79fhtsPLN?=
 =?us-ascii?Q?xFrWbxzJ/KQ9xx8BRBz+LjT88n8vLV2c+Kgpew+Ht3C5dPBQoMzKLpAZc8E0?=
 =?us-ascii?Q?85lA7zLl0ws+OIB/RV9F4wzicIObLLa2OBn1a/Ie555fmw7mmf8B6xLLYL6k?=
 =?us-ascii?Q?Cph+HNG8fNxCrG8zLmP23hELwbI3juIGquj7E0MbksKeFlanA/4pE9qTrrnh?=
 =?us-ascii?Q?tKw/3irY7mCj3WNKRBYo67/IYajnpWk2deJvpQe3A+MMbG3BSzOAZA5m4+n3?=
 =?us-ascii?Q?JuhegzS1AG92YU1kfPLk238tEiUuOZLAoRt4gISFG1WeoLli0FjItz2uFgzm?=
 =?us-ascii?Q?oyRhB65Rgo5Pumh6rC0ME5zM2Bhs8/k0y7pfEn4nB0piEHgN0BaGtivjAa98?=
 =?us-ascii?Q?/EgMEIQiJe69uoFJ7aUd9Cv3yE7KFUzmYKFPxoJ0Oge6TACTEFzJ00m05kIZ?=
 =?us-ascii?Q?xF+6tuydus4WAhWwZyuYdVCHOdpqOgLb3ifjqCB2I03PfmRpFneex8+nBqcl?=
 =?us-ascii?Q?fKi47Q8h7HpLHAXzT7OQUlXpDMA5XS7wc/QyRLombDg5v1TkH5MVDyRQHxHd?=
 =?us-ascii?Q?aYOil8TpwY0Gh9xi2C9HBA2gMUvUAn5MA7tOIwNDSzlY8Zfc4OJKPeijT8+c?=
 =?us-ascii?Q?Rb++kC0+FNntgQ12diudhFmZy8vFEiI9vksVH1JCscM3NfbpEkZD0nCtwAcY?=
 =?us-ascii?Q?vHy10Lv0zlGJ/TKilFiyoCXhjKB43kRhY2H/PA9s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7de6cd7-ee28-47da-d97d-08dddfbedabe
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 07:54:56.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6a/ZgD+NUuidaOdAG0cbPyfCd8WDQ7NMeN22m+ClFwCstBmn1NsbYLFENixKsa+heXgY9cdNKSd7gFZe/LbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7985
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes missing space reclamation during the
 recovery
 process. In the following scenarios, F2FS cannot reclaim truncated space.
 case 1: write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.64 listed in wl.mailspike.net]
X-Headers-End: 1uodez-0007tJ-1u
Subject: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during the
 recovery process
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
From: Wang Xiaojun via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Xiaojun <wangxiaojun@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes missing space reclamation during the recovery process.

In the following scenarios, F2FS cannot reclaim truncated space.
case 1:
write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO

case 2:
CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO

During the recovery process, F2FS will recover file A,
but the 1M-1G space cannot be reclaimed.

But the combination of truncate and falloc complicates the recovery
process.
For example, in the following scenario:
write fileA 2M | fsync | truncate 256K | falloc -k 256K 1M | fsync A | SPO
The falloc (256K, 1M) need to be recovered as pre-allocated space.

However in the following scenarios, the situation is the opposite.
write fileA 2M | fsync | falloc -k 2M 10M | fsync A | truncate 256K |
fsync A | SPO
In this scenario, the space allocated by falloc needs to be truncated.

During the recovery process, it is difficult to distinguish
between the above two types of falloc.

So in this case of falloc -k we need to trigger a checkpoint for fsync.

Fixes: d624c96fb3249 ("f2fs: add recovery routines for roll-forward")

Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
---
v4: Trigger checkpoint for fsync after falloc -k
v3: Add a Fixes line.
v2: Apply Chao's suggestion from v1. No logical changes.
v1: Fix missing space reclamation during the recovery process.
---
 fs/f2fs/checkpoint.c |  3 +++
 fs/f2fs/f2fs.h       |  3 +++
 fs/f2fs/file.c       |  8 ++++++--
 fs/f2fs/recovery.c   | 18 +++++++++++++++++-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index db3831f7f2f5..775e3333097e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1151,6 +1151,9 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 		if (inode) {
 			sync_inode_metadata(inode, 0);
 
+			if (is_inode_flag_set(inode, FI_FALLOC_KEEP_SIZE))
+				clear_inode_flag(inode, FI_FALLOC_KEEP_SIZE);
+
 			/* it's on eviction */
 			if (is_inode_flag_set(inode, FI_DIRTY_INODE))
 				f2fs_update_inode_page(inode);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..f5a54bc848d5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -459,6 +459,7 @@ struct fsync_inode_entry {
 	struct inode *inode;	/* vfs inode pointer */
 	block_t blkaddr;	/* block address locating the last fsync */
 	block_t last_dentry;	/* block address locating the last dentry */
+	loff_t max_i_size;	/* previous max file size for truncate */
 };
 
 #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
@@ -835,6 +836,7 @@ enum {
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
 	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
+	FI_FALLOC_KEEP_SIZE,	/* file allocate reserved space and keep size */
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -1193,6 +1195,7 @@ enum cp_reason_type {
 	CP_SPEC_LOG_NUM,
 	CP_RECOVER_DIR,
 	CP_XATTR_DIR,
+	CP_FALLOC_FILE,
 };
 
 enum iostat_type {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 42faaed6a02d..f0820f817824 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -236,6 +236,8 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
 	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
 							XATTR_DIR_INO))
 		cp_reason = CP_XATTR_DIR;
+	else if (is_inode_flag_set(inode, FI_FALLOC_KEEP_SIZE))
+		cp_reason = CP_FALLOC_FILE;
 
 	return cp_reason;
 }
@@ -1953,10 +1955,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	}
 
 	if (new_size > i_size_read(inode)) {
-		if (mode & FALLOC_FL_KEEP_SIZE)
+		if (mode & FALLOC_FL_KEEP_SIZE) {
+			set_inode_flag(inode, FI_FALLOC_KEEP_SIZE);
 			file_set_keep_isize(inode);
-		else
+		} else {
 			f2fs_i_size_write(inode, new_size);
+		}
 	}
 
 	return err;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4cb3a91801b4..68b62c8a74d3 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
 	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
 					GFP_F2FS_ZERO, true, NULL);
 	entry->inode = inode;
+	entry->max_i_size = i_size_read(inode);
 	list_add_tail(&entry->list, head);
 
 	return entry;
@@ -796,6 +797,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	while (1) {
 		struct fsync_inode_entry *entry;
 		struct folio *folio;
+		loff_t i_size;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
@@ -828,6 +830,9 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				break;
 			}
 			recovered_inode++;
+			i_size = i_size_read(entry->inode);
+			if (entry->max_i_size < i_size)
+				entry->max_i_size = i_size;
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, folio, dir_list);
@@ -844,8 +849,19 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		}
 		recovered_dnode++;
 
-		if (entry->blkaddr == blkaddr)
+		if (entry->blkaddr == blkaddr) {
+			i_size = i_size_read(entry->inode);
+			if (entry->max_i_size > i_size) {
+				err = f2fs_truncate_blocks(entry->inode,
+							i_size, false);
+				if (err) {
+					f2fs_folio_put(folio, true);
+					break;
+				}
+				f2fs_mark_inode_dirty_sync(entry->inode, true);
+			}
 			list_move_tail(&entry->list, tmp_inode_list);
+		}
 next:
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
 					next_blkaddr_of_node(folio));
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
