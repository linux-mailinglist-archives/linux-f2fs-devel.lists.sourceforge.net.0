Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2377B4FDBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Sep 2025 15:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBxhXtGTGSwZtk20WUSUxnmQqXgwFGgUT5TzKLZIlbQ=; b=T+nRJca+RMyl5Nuzwxdu431NzG
	qKO96Ihg5WYOoG4XvYoe6CjozF4AAPA9dXFgr6PI0AVR3lhd8NHn4KMXFdwQDG+zUvYGjVVew1yQl
	sPa3PEa4yGeMS66GVJJD99vGqHu7s+c2NaUsjC0UyquaxQxByYjdpDetZoW95+GISndg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uvyee-0001gh-Ja;
	Tue, 09 Sep 2025 13:45:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uvyec-0001fj-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e15+Cs0XeK9ZHF4DbscTdLbxo1CU7bfQaqAb0lwTg6s=; b=UgrFgFPVXKHJQps32KN8cKOhHL
 phF6TOsoIYTXIS7hMHhpF98sQchs+cn5gkYWNcZSXCBvxEyUwkeSFj6FCqIFQjgmEoCgVbqLe84iJ
 4r7UYcp8iOckpNWzaq6ccyGG0J83POuKQ4DqGx46kbN+aVHNWeCpcTaz3IJELesmxNaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e15+Cs0XeK9ZHF4DbscTdLbxo1CU7bfQaqAb0lwTg6s=; b=KKsOeI2ORWmugYTP9KOga2ib/y
 eA4F51FiHN7SC01QRH6HIGCgDQPikFME2KTVoBS+Uz/7q/O8Rxn/6k7ngPwOgQcAyF1DBuCCmySaM
 bxewZXQsF36K2h2v1abPWExa4CJQF791Wi3+mzu+wYAfQ6gR/HQBW851j4+M2hWUvze0=;
Received: from mail-japaneastazon11012061.outbound.protection.outlook.com
 ([52.101.126.61] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvyeN-0000wM-MF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOEFiqq0BJCYiMoZNzjYi/Tyz6W+qQDKmLFAigEpbrlLzALfyOEJEcIvR6LiZriPba3Jq9IbnRvo3Jb2OubtJT3MhEx6AuBPGO7eOduwBVM7pVUzWlK0TJhqewWbUqz+EkyRYfMkzWzYG9DCFdH/1o6f0o/pe3gULKpcDJCJOegcQAoJ04E9UmKnYA55PJSmuZr7XrbPz8rjaxucHJmxyaGgPXwfevo9KLQOI9qS4jh898EHxxT/F87mdfYIro8V+wWjeEYMnacop8meE2GCqVuHbAsVanrl6UHtMlZ35ewASdVzolnhgUjm/cZE2luxsdUGuBhjPqRpMFPZtRlEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e15+Cs0XeK9ZHF4DbscTdLbxo1CU7bfQaqAb0lwTg6s=;
 b=YZFxXcqM9cdvKBTQgTAT2u0P0qIwbIqb1bb2otmkeQnWNTLxSPphEWbdAtGL8sEhXYTVRaNi+jk+4r788im72xo6K0Rk47/XbVf7nCEl5cUqv0wACN80kTVIf3fUq4ZiklBI1L50sAmaHLQpFhkhG0xki9am4UV4evVN2e2DPx7B2O0DfYt4DerrVOFJ/IIfvZv+sqGvVpe3+7gBUELJyURiouMV3WDVKiv4ucnUigSUFQSwVoGPNGKMHal6BMNxaE+QqZ1mGBpSM87sBW42YdguhEAq1gzMvkvtnhsgmXB1CFAkTRQoK6E7DY9Ky+Gujnp7O8nsIEK+CP1dkNWLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e15+Cs0XeK9ZHF4DbscTdLbxo1CU7bfQaqAb0lwTg6s=;
 b=nh6vP8uq11UEVoVNkIw+F3YZdOi8T72+eQeDlPr4Q4LPj+1dZDB5Z80VJL+8QdpISzSu3FqHenjjU5C8seJ6SYKTri6MjcRfgRHlsqHteayVIQZHrNPV8wfIw1QWe2/1HR/AE1GgNVZ4DtCtFs/0lm1xCmD7cLzZhn5a9Yctgu/VepGb53711KZrbww2bQnvrUHCVq/qPk4WPxnMohiPWdNo8ljmrxDj8L6XkHQPFMMtImPdIEgYt8XjBqht2N+4fuEo72Y8xyU384sjWz21YDoblbPo6vve/9/tsBOloyDcDiWtaQQLSWGWgRpSUsczkoIocleoQBcQLZkjnAJVCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYUPR06MB6025.apcprd06.prod.outlook.com (2603:1096:400:359::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Tue, 9 Sep
 2025 13:44:32 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:44:32 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue,  9 Sep 2025 21:44:16 +0800
Message-Id: <20250909134418.502922-2-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909134418.502922-1-liaoyuanhong@vivo.com>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYUPR06MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: e226fe6c-183b-4f67-6080-08ddefa70152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qrWFqL/D2BTHPyJhx++S8XMO07cOEFHgVkH0b4ovU+Z6M2aRx3mlASaRjm3v?=
 =?us-ascii?Q?N54atOcRbujoxZdA0zh3XRaw93Fep9WkJ0crE5EsZgInkKXhH0D8clhh2sFo?=
 =?us-ascii?Q?qrL0cerJQzhtXXHRIMXX0Hq+bhcMSCMnWDRHECV9Dn4D6H4x9u7FJHL3iX+V?=
 =?us-ascii?Q?ZhSno5RjzZcCoB/pNdU7LQg0i7TIJKKHKrccB5o4gdVwQv26/l06XKz2Xxqg?=
 =?us-ascii?Q?kUWI2TJUCCaCK9lA33dq9ELLXcWN1814PRwCsK9PJ2l08hD6g8RBmDZEz+2I?=
 =?us-ascii?Q?sivI+ecJ7qq5Z/pNulEmXYlEdNIakDTD3oFmELLJoOK2KYTaNGuSOcG/DEOy?=
 =?us-ascii?Q?sBPLPXtkUa4SRWCeM5yHYUfk+fsiX9YW1bg6g8SIDgYp33IiQqaumwAoyic1?=
 =?us-ascii?Q?/65OqTMKttNADheBJUw+EVZOfDrpRJ/zp/4fCZtR5YNr5UC0zU3M9Q8hBXrW?=
 =?us-ascii?Q?YP3JoFoBC+07V/uE3sUKtrycJ4MLPqdCQOmsDEJP9ySnR32CbQBrkxqdE5HE?=
 =?us-ascii?Q?kgp3D7oQseztT6PIzsnR4aqkscasEZ/VmvNSxTqW52gCdfGo7XWmnhjSqQQ4?=
 =?us-ascii?Q?J3DwB30fkTVJ5g6ujbAcDisOWHfIhr4KijQVN6p/49AcIoUUBCwGHQ+9vV8E?=
 =?us-ascii?Q?dZKrZWw91DpVY2tgXePdcT9mjl3klbJp3l+oWo5V6M+Cqggeh3mKQ0fKjS32?=
 =?us-ascii?Q?AJnC5C1fNyidJsNDatcFE46DXdX3nXnGr5vGGw7QLqLHQ8u7cZ21bTtdoZkD?=
 =?us-ascii?Q?PXH9gl93D0JaZlWamtrsQXBiagBR57PqAq3MhXWWxzl3/lfaLxsbiqYhX5ms?=
 =?us-ascii?Q?yqA0mmkiF2FNWjSRbSPn34H31Q7xvn89LIvD438I3qXnAGIVImJP9P5oRK6k?=
 =?us-ascii?Q?RovoN9QcH0iSWjwgnSI0qMo6YWwpkVImLO9rsWDh2V/8/ojuKX7w6tik+GJv?=
 =?us-ascii?Q?y4hLLb7ZFaX6QSuQAv2uzX9iBZLblUxNvIO0Sa7ii27EEuJzUMt/B+1h/cC3?=
 =?us-ascii?Q?y6h3R6AAFwWWr8AKqJLAeVMvscFA1S25tOm3201R7giazkIXCndEmzneJj5U?=
 =?us-ascii?Q?wlxEKvmC+CILrNS2MJl/tTYXQMvtijP00FPZnQJ+8SyfsImsBUpFyNYhSGuL?=
 =?us-ascii?Q?0Aurp3Bl1mQOykqVl0dfvTjfvDC1Iw+r36pLfe7ztnWlmVtYXcH8NNN1i3LG?=
 =?us-ascii?Q?B0urqwrRUKANAU3TwHbpR+HJ6m3oChkYEOfO5jBQUmpP1B0eQLagUvgol0/O?=
 =?us-ascii?Q?FeUg6f1gfBIaPPOTUh0duWbgzdo7o42gOEg8dqy8QUuAFHW+EissBAwiJdQd?=
 =?us-ascii?Q?7eBq7/1hZVpM6AAbIpDyQk4S7VvosvRZfGa8EsDzjVdbSjdqReHDm8oi2VaH?=
 =?us-ascii?Q?+PXpjDvHsK8vh2VaEfUcZaVD5cBU58jjuTEZsKFRualTCkbywuB/mlFL0cM2?=
 =?us-ascii?Q?1b8Kl/BLnnVzaWTp9eY6CxZU73wtGA0kePXqN2lECRdQmwxvWvfTEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PcFCUDP+b+nOLVLtTMSO3ksqWCQFY17TXUbMZgXq2haVzs6BLJ72/yUOUvB7?=
 =?us-ascii?Q?C5Nb+RZia4sVLaLUdf6ARxMeF+g6LN1AutJ4ZDGAWlRfqapeX9uq4HslMw7D?=
 =?us-ascii?Q?xaiZaW5sSg+MsOmHWRLnwfsGX71Dnhmsb5qHbEGLRTc93F3af/EDgxiXU7wK?=
 =?us-ascii?Q?Fy2FfxOWN0fYbHKk6zXedkKCyzLvz5nYoVE+ZkF/nOjG1kZ8y1rKrwx+Ywf9?=
 =?us-ascii?Q?J2+f9847RH1CEqgnaFDn8K8l//l6l5OU09ZeHAalagGCkJBvd6a89s4+mdYI?=
 =?us-ascii?Q?Cj1NDBIXiBjoMNOhCLqa4MILnALwQFs63y85xhB49+G28na9TVIRQcfY3o01?=
 =?us-ascii?Q?MQjhFEcB5v68ea8b7eAYAjzGGYjm+uK6biRuLnW75oyoxm3fYjgvlsbRqlRZ?=
 =?us-ascii?Q?lYa94ggaReO46pnED0UT45sIA1kCT6LlvbkflaHsWa9l7bo08viJWLUsa4iN?=
 =?us-ascii?Q?SDNwOADuSSGPw1xIsZ/3aSpD82LNnD3P7iRnwHIJG7GLF1e4Z7184Oi3OYUf?=
 =?us-ascii?Q?y+DURIGTaKyYv0qOwlJbRbLl0eYMW1VKLtLNIUgo62WTNpKDd9Rf0nj2jF7j?=
 =?us-ascii?Q?gl2LJXYOPu8Y4pBkJfEJs2wJC1+DfaRVbXNOy6SUyTMWCfLbOHJn5olJsOew?=
 =?us-ascii?Q?8+8QxDip+yQuv35MlMMNl3XDReCvvC882R1JC2K1hUMcewxOS4VKFTHrFFz8?=
 =?us-ascii?Q?T0U4in/fXpZr9zi3h4OeMYWs3dtzNsfdsAWiNNbcdhC20mUsnC/XPz+8TgN7?=
 =?us-ascii?Q?teU7LTrWP4D0lWpC24XhRbYgHnmGniQ6hVFtYZhRLkgLgRHYZvlkYcuurylD?=
 =?us-ascii?Q?5Nqs2YYNAJFwLzmL+x7hPRZyoOPyTzEGJnDPxSF8QSnMAtSKZ/XxHfly5H3V?=
 =?us-ascii?Q?dm6ce8wkp3RRCOGFeJa7+UbysvcNAn8f/DyAlSEgLfeTZj0+KmZsNXcHobEl?=
 =?us-ascii?Q?of4uAyyEScDhCdKCVKAP/21sxGXXY7A4D8lREVNGTtqjhIFFs2vrHlCsg6Ah?=
 =?us-ascii?Q?UM7b+kK9+V/r8OYrwKQYaLa4sNcBeXp5wEFNVItGttr1YJXM9YnsEW/3MDtv?=
 =?us-ascii?Q?z4pU6MOGRFny9HAb2u6wOJ1YwpK/2MjS7BDzQA8mGEtswEkKtpWr1dUTYwSO?=
 =?us-ascii?Q?Hj9omBk2dRypxK+Of/vduAfp8JHjn48MAD+LB+gWyUyzzIJ5k9Dk/ca5YV7H?=
 =?us-ascii?Q?SJLPxCb2dShDX9M4ymbD0wi6motqDLhJHrc6we31PPySzAgfmrth66QiNgAs?=
 =?us-ascii?Q?H3xEAKLmnETmupcEBB12Qj7iKJkkfBJ3mEHz7u6vGFigZNrxjYkatcCsheEj?=
 =?us-ascii?Q?HoA2vGXkHRwUWmXJGL/HfmVhVYVUBI0aidVgAvU2RfupgU3p12mlsRUxRL5r?=
 =?us-ascii?Q?ivSic7WeWo6o1+IKZJ9Bijws+WO/Cc3M+93BQUo9PxgqavsPCgf+rPD7szC4?=
 =?us-ascii?Q?rlIxcqeqTUTH3KXJee+i5bbSMiL/BxoJGw+qMHAvGFkTdVKSRfNZigq/i68b?=
 =?us-ascii?Q?8vfCJmpa4Ndwu7ltWOvhAT5iXy0QKbdNo/1Z9+A57QbmUkitbE9r+E0lG7bu?=
 =?us-ascii?Q?dSSN+luZhz0/S1zxr7b0kxtFoW7UIDwEfP3Wwtse?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e226fe6c-183b-4f67-6080-08ddefa70152
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:44:31.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdD3Z3pf24yv7lWqyc7K7zhgVNIYxmTq2ctVMfxHGidFyS2bs5IKpHh766SI22iIxSLl65iHv3wpBCphtvhzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6025
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Incorporate a check using has_enough_dirty_blocks() to
 prevent
 redundant background GC in Zoned UFS. When there are insufficient dirty
 segments, 
 continuous execution of background GC should be avoided [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.61 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1uvyeN-0000wM-MF
Subject: [f2fs-dev] [PATCH 1/2] f2fs: Optimize excessive write operations
 caused by continuous background garbage collection in Zoned UFS
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Incorporate a check using has_enough_dirty_blocks() to prevent redundant
background GC in Zoned UFS. When there are insufficient dirty segments,
continuous execution of background GC should be avoided, as it results in
unnecessary write operations and impacts device lifespan. The initial
threshold is set to 3 * section size (since f2fs data uses three write
pointers).

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 fs/f2fs/gc.c |  8 ++++++--
 fs/f2fs/gc.h | 10 +++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ed3acbfc83ca..4a8c08f970e3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -120,7 +120,9 @@ static int gc_thread_func(void *data)
 
 		if (f2fs_sb_has_blkzoned(sbi)) {
 			if (has_enough_free_blocks(sbi,
-				gc_th->no_zoned_gc_percent)) {
+				gc_th->no_zoned_gc_percent) ||
+				!has_enough_dirty_blocks(sbi,
+				LIMIT_GC_DIRTY_SECTION_NUM)) {
 				wait_ms = gc_th->no_gc_sleep_time;
 				f2fs_up_write(&sbi->gc_lock);
 				goto next;
@@ -1750,7 +1752,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
-					sbi->gc_thread->boost_zoned_gc_percent))
+					sbi->gc_thread->boost_zoned_gc_percent) &&
+					has_enough_dirty_blocks(sbi,
+					LIMIT_GC_DIRTY_SECTION_NUM))
 				window_granularity *=
 					sbi->gc_thread->boost_gc_multiple;
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 24e8b1c27acc..1ef234c2702b 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -36,6 +36,7 @@
 #define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
 #define BOOST_GC_MULTIPLE	5
 #define ZONED_PIN_SEC_REQUIRED_COUNT	1
+#define LIMIT_GC_DIRTY_SECTION_NUM	3
 
 #define DEF_GC_FAILED_PINNED_FILES	2048
 #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
@@ -177,6 +178,12 @@ static inline bool has_enough_free_blocks(struct f2fs_sb_info *sbi,
 	return free_sections(sbi) > ((sbi->total_sections * limit_perc) / 100);
 }
 
+static inline bool has_enough_dirty_blocks(struct f2fs_sb_info *sbi,
+						unsigned int limit_num)
+{
+	return dirty_segments(sbi) > limit_num * SEGS_PER_SEC(sbi);
+}
+
 static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 {
 	block_t user_block_count = sbi->user_block_count;
@@ -197,6 +204,7 @@ static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
 		return !has_enough_free_blocks(sbi,
-				sbi->gc_thread->boost_zoned_gc_percent);
+				sbi->gc_thread->boost_zoned_gc_percent) &&
+				has_enough_dirty_blocks(sbi, LIMIT_GC_DIRTY_SECTION_NUM);
 	return has_enough_invalid_blocks(sbi);
 }
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
