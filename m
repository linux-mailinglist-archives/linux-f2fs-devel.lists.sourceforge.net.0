Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38411A075B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 13:25:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVrbe-0007uy-FV;
	Thu, 09 Jan 2025 12:25:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tVrbd-0007ul-78
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 12:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYFMTGTzX5kZZOqhdxtacwAvw3YZs9KcfkBVYuiJfi4=; b=OJ+Xh1Fl1R+FjWSSZwUjpxE+l1
 fD83XacTEnUTVKsykZzHez5Me/wUPkh4jFeLCh8kF9tQaTDOGUyqPGrKmnU68nKvigBa8yg7pcgcB
 qj8SmrlOt/pHzoYzfTz/f/Qa/+/SnSe7ia5DZMPtbAziwxXFZhYOOERbvb5CPQ8WF2jg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UYFMTGTzX5kZZOqhdxtacwAvw3YZs9KcfkBVYuiJfi4=; b=V
 GqUFXmK+iRhVkEL4oT7ggW6Bmhp+HFFIYXJfpbpA98T/MOSdw7Je9JVD7a8sg9P6wWgn2ZXzKdvEQ
 HLfdAMCM7g8BwtLTY0rNziOhYSjjWYY/bY/2BbgtuIKIEvk9vqYIWEiO/iKvnEESWJ/sXZwzcUgut
 AUlMpmC+kOl3HRss=;
Received: from mail-tyzapc01on2076.outbound.protection.outlook.com
 ([40.107.117.76] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVrbc-0000oA-Cm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 12:25:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eM+sQYX2xPXhLtNy8rNUieBiWUs8W0dtKqgfMCjFW/MqbGJvF+YeTMFpMa8eMYQIlRNwOfq1V1tHKlPfZF64QwKpPmM9YwjhwinQPfehuksyopxYRudg1gNPF1IpCjAdnKxxAM7zyVU667a5kLVnrMjAABCvW1c5lYskkX/tYJ8a//HTHDN1FfueSomz+aHjE6nIr0kIiPD9J89nfFI2OENftsprMVDUcXj7WYChJ9SwTW6Pfdb4ZCo8aVAajR21xDo7El/yTczCHG3K+5hycHPn/usAEaGx23nlc2gI4Y/tJS0tYZ/wj+xLgNtNHv4bREsY6qb4u+NI3XzhELLIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYFMTGTzX5kZZOqhdxtacwAvw3YZs9KcfkBVYuiJfi4=;
 b=kMkar2bWL/G7ux5x8Uu0lT9EBj6V4O0yJmarWIkKw1jHWn2TdgBbglJ8rnUtW2pSg7M/clpcizBnOP5kBpnnvUkJYeeYHh67toJ9MireQZ0OhgmZXktdAXLRJRl6TAqGYLTz3hAYqDRJBNssYU7mi/Ijm4sz1yjHiSL77Gy0KMhxy3FOH0O840eFctp/+RiNEXVrv8fYkXyhUQQ8l+pV5grSD3+xuL8+7R3tuqBVZJlc/Ahb+sSNTrlmqW8EYwyGTbhpzOMzxDtGlY6GyT7uVJSEERoLlSIoUsDP84Ph0GNzfSzVAJ3HAaN/Exaq/dXxs8IdMSkbuJ+3QNbCjRq+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYFMTGTzX5kZZOqhdxtacwAvw3YZs9KcfkBVYuiJfi4=;
 b=b7y6170kaV0b4kdhTnLuevgsy77NbNLShAU3t0VkH85r+TiwTI1ByaDcXAAAFfW/JmsYAI+mL0dvlf4JVcdXguqTDF2hUmv10ntsLsZdg7IbfsHX7ptX0qNzd6GubSC+UYaym6JpnNb2l3IDYzB0rLpMGHvwUw9IpwjVm157eLBLlJAN+XND3VhsnACYyUz+sDy9dCElvATMHDv06vyxg49gChnknAtjlh6zqwZ872hA7U401kJxjreECSv08oXKfIvv+GuhEkWvSnnRB6u6A1UQROdq/XIlH/4e+CtrDpNqewLQ5jpo1Pjs37nm0+CiKLKdcubE7PMY0+7ae7NUyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI6PR06MB7103.apcprd06.prod.outlook.com (2603:1096:4:24e::14)
 by KL1PR06MB6556.apcprd06.prod.outlook.com (2603:1096:820:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 12:10:33 +0000
Received: from SI6PR06MB7103.apcprd06.prod.outlook.com
 ([fe80::b34a:c5ea:54cb:7bf9]) by SI6PR06MB7103.apcprd06.prod.outlook.com
 ([fe80::b34a:c5ea:54cb:7bf9%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 12:10:33 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  9 Jan 2025 05:27:55 -0700
Message-Id: <20250109122755.177926-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To SI6PR06MB7103.apcprd06.prod.outlook.com
 (2603:1096:4:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR06MB7103:EE_|KL1PR06MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: b2892cd0-ed35-4564-744f-08dd30a69e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rg2qul0iCD02pFPpmd0rLfDT+g9NR9JFsY++1PmJg781pEyATkMUc3WnVHjz?=
 =?us-ascii?Q?hHBUNHGSDG212M41mI46oEQ0Dr2sFU/ywJNv2W0THZzm+ZU5egb8VfDCszoP?=
 =?us-ascii?Q?0EiYNJZaCfvZMXtzfeLjA9k9DmOZCnZ+65xlyN5RfIdQiWwawyhslQKH2Vbd?=
 =?us-ascii?Q?4AUqNF8UOAbcXZKyMADNHutxTdQYAypII5iLGQSK7LbtAs1qSx3P/GUmVSVo?=
 =?us-ascii?Q?2xhTlin4XcULbKtyQKXDd1FQElRps/fKAvji/zkv3p4JpLLF4J5ymlsy2PAJ?=
 =?us-ascii?Q?I5Oq2uxaI2yTlKuO+n84O/WswbICcgCT8xMG4BytPakzQPoFGODkcPCOwRIW?=
 =?us-ascii?Q?ecjMSA/fKzJw0rfmn5VhTb57bIDGdDaeMPCHGDQysU5Vfy+HNjlDf7n3yxAx?=
 =?us-ascii?Q?+bpVJyewm9gvZoyCbnroMbLm0cot1TPQQBbSAd+//MZBqIrTzMePFO1qFl4Q?=
 =?us-ascii?Q?Ac2vMZxWkrrdZzX3Q9FJt+igcQzURvxV1JJt8mTRkfTxVoamcmj+/UFIjNG/?=
 =?us-ascii?Q?AkRiyKqYZaH1i3+YnpiOGjmqClDnpYi7JaXuXrgiferVUhU/rHzn/0veisAw?=
 =?us-ascii?Q?Y7uJ0JsQW5gr3lbhq/nPkYN7vcrnxWiQkFnEjIqI+evyq7jGgBCM2hNZyryw?=
 =?us-ascii?Q?v5LWKFwlQJN2AXPOrXFoB/AnUexC8wyiJtLd55r1Gp3yaiCb8mjDjQw7uVMi?=
 =?us-ascii?Q?GwKf06Cy7aRkzrZ9lM99Kievjg10qnuLL5tHRcfaTAcQsuu5/jwMnPQRRZFB?=
 =?us-ascii?Q?d48bj6NOULMlAX0Xv8xJLrpLhJXDbDHCc6wpkIHqoYQVNRIYmpP4DyJa5an1?=
 =?us-ascii?Q?4d9aBPZy+EWZpRUx5B1D0/8K6Mk7pmK3PY5xFhAQRoAaMa9VjyY4P28pIw2m?=
 =?us-ascii?Q?iuS6aUpIPG7pzlWWrnHd1jEWnRCYG/IpyWMPdDmhQSJttVSYfOnuSItCuHYO?=
 =?us-ascii?Q?34EgrwkVRlq0oK0QmpFSzLeIYC9hHqplPl6+qPT/RwBWpzbmzWj2FvdWPobU?=
 =?us-ascii?Q?dKRb6OnZgfzlaUk2/cbeAOeqAg5AO9KyJKvuZOX0rTEgXyvc6MFJDXSne4Xv?=
 =?us-ascii?Q?g+aZSRT2w643yhZYPCH/b9ki+ueBYLNVYov1aUUWu3pJTvYGqKxIhWNaznyK?=
 =?us-ascii?Q?4I5bLWVo17FDazQgXuL41woCWeuiUj6sA3mx7jfSkthtXrR59U1IjCEonNZU?=
 =?us-ascii?Q?JEja8j/kUHqmiHUF0LjxUyAPXEtm3iZJLG1XxtNaZDibgaCz74syMsUOJsjr?=
 =?us-ascii?Q?F3sPAa8ruhtWC9Eb6+nu84fA7R+TxVcI98i3/0sKMLD5O2yiNM+7sSQDGZkM?=
 =?us-ascii?Q?B1G0XrjH495uHLqtPlTpIbdtVy6jtQBsY1nnQG9EBxKRBrfmeg9OE/A7gK7N?=
 =?us-ascii?Q?n1VXx627lYnZcKOOPcwyilDIYFamtqtauBJwinFejGvLD1JfytH4dnQHRq3W?=
 =?us-ascii?Q?8r8HaZgLFdPS/MR8fUMbNzd2dPzC6jgA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI6PR06MB7103.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xt19dl686S74oPAhHrATe4HYiGHPoRCNbkIWgZnlRfE8B7uy8zRlHkizhkHV?=
 =?us-ascii?Q?RKltqwp6I2zbQRjfIT09MnOWGJsbuRvpvhkdISN5kmL6DQQ8tZ4tR2r6wnBO?=
 =?us-ascii?Q?CLQaKr4lUgpbBpUv7MMSMf3iMaOP9ypvSf85RBSLddjNqYnxlnC4hmEcpRQR?=
 =?us-ascii?Q?/Qb8EaKVRPiwdeDb4wx3bI8Q51QuQ/Gmg2J7xCqwxZ/+CgANRhkW8kOCocW0?=
 =?us-ascii?Q?ume7ezhAgEXqHBmkpLSHV46lItz5KmqbRN61APd7s9tzgiM9c6lx9EY4+oBr?=
 =?us-ascii?Q?NRsI3/s6rNo3awDXQuLVx1VnEMMfMRLAjM7xi/43y4nhJ0GJRsrMCtRDc3Gl?=
 =?us-ascii?Q?4KajQ2XFWnc4gzj+mii5nlgqkbPXN7anas73O0GmL9NZs5zLCa74ZKECJAaA?=
 =?us-ascii?Q?lncZg8d8XAMJqH7La8jjcV9sUgBu5nmlNi4b3fyv3HNqoRyyqjGwzXk3eEa5?=
 =?us-ascii?Q?52jdO9ZHQiA3IwcKaiSJGxiCVIzmEISIi8JxIH5rfm9KxequmA6Fw7SLiKf1?=
 =?us-ascii?Q?AWyRxtLoj1nAMfT4Pj6+iKRIEgGmbnemHfTRHVutsSB06FyxRxTypnZyjOy0?=
 =?us-ascii?Q?8BAVoH2TZm6H1JONPey2yWAeJRJ/AGCgP8nUzaFk6wCJ2mzQm8WcWnqwDWvk?=
 =?us-ascii?Q?DzNMw+y3uC7ywQApKqgOsE59C1/4jcDH7O6odSVmyRqX42OfJedJDrN/7ZZP?=
 =?us-ascii?Q?wg6K3l797asWtNjsQbX8VRynidvljble3w8pAFYZZvoK9pmYz99VlOTZoJHW?=
 =?us-ascii?Q?sEw2c3Itmz64uKltwhJ35w5kuHwx8f2Jwuq3N5IYHHr+pyGozOg0U9ROKHCu?=
 =?us-ascii?Q?sZojjs026ukM6Rc7DnhqF0N6jraErWzLJ+fYgoKyTf+R72CKv0YTZxbetCmL?=
 =?us-ascii?Q?z0hNyrfjjbtHRUsz1hygnzmh2CqPpU5cfElKEzPX3zv/2jchbDKugwRDf/Y7?=
 =?us-ascii?Q?edlh6gf64fSj6AMSYY2Mmby1lh3yAAExfr+JrQcA4K8emh5GB34edoCmhhvi?=
 =?us-ascii?Q?9mEtbR973R1qZ3P7JL8GKTrJqEUVPBJbwjqrOhuJcJsMbQJjtCSub+0VgGcy?=
 =?us-ascii?Q?WNyBzTN5Gw8HuP29Htl7tb2mn4sp4MVz8Ji9jX3YOl4/f8yqH8+ocuBEdtqJ?=
 =?us-ascii?Q?kdZOnC9buhVzaOZSlnz5Fx6hw9kSROXIo6OOFeGn1kZaNq8Xcc/k2/7Ehjyb?=
 =?us-ascii?Q?GM/6xuLzP5+w0Njwfo7Q2n9KOSYC4ppvENwpFTwJ33CpRPD1iHipOyDCunJ1?=
 =?us-ascii?Q?HPzI/MkakBN3b6Un7cZ7EyfaiNA+iWiQUlrAsDzsq+0AF3z5ePo0FpGUbKES?=
 =?us-ascii?Q?W1wL3JKCayWPAnkwkfLa8RAVsNnVKBo4OQ3AxTVCb1m9QavlMIjv3+hErsW4?=
 =?us-ascii?Q?GnSQaomKnSuaUfNqhSVrXuYCrqSSsJ06x2k0mJziJp9tPOtIIJsL3iH7lAoX?=
 =?us-ascii?Q?Ct9NtxyAY9H8TJZybAjI3joH0wY27KCG/QBgpK/Czf9gnS4A6PER6PEZFzv0?=
 =?us-ascii?Q?zEw9GtJpdSHZQEMUpHlVQ7DlIKO3aOK7pV4NulR+VPtN3Gj/MY4IaOcptJS5?=
 =?us-ascii?Q?QRCzIMQC1gbMpZH9XPQHeMFklcqY9flQC9My8QAK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2892cd0-ed35-4564-744f-08dd30a69e3e
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7103.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:10:33.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05lb+pMR2Fi697ONev4Ef/Iun+bKQo8GT3ugdliUIuAxOvgjECNivIHlkK7/5OlvM8PfR+MZbaaYrjt0o3kOZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6556
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During a checkpoint, the current active segment X may not
 be handled properly. This occurs when segment X has 0 valid blocks and a
 non-zero
 number of discard blocks, for the following reasons: locate_dirty_segment()
 does not mark any active segment as a prefree segment. As a result, segment
 X is not included in dirty_segmap[PRE], and f2fs_clear_prefree_segments()
 skips it when handling pref [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.76 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.76 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.76 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tVrbc-0000oA-Cm
Subject: [f2fs-dev] [PATCH v2] f2fs: fix missing discard for active segments
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

During a checkpoint, the current active segment X may not be handled
properly. This occurs when segment X has 0 valid blocks and a non-zero
number of discard blocks, for the following reasons:

locate_dirty_segment() does not mark any active segment as a prefree
segment. As a result, segment X is not included in dirty_segmap[PRE], and
f2fs_clear_prefree_segments() skips it when handling prefree segments.

add_discard_addrs() skips any segment with 0 valid blocks, so segment X is
also skipped.

Consequently, no `struct discard_cmd` is actually created for segment X.
However, the ckpt_valid_map and cur_valid_map of segment X are synced by
seg_info_to_raw_sit() during the current checkpoint process. As a result,
it cannot find the missing discard bits even in subsequent checkpoints.
Consequently, the value of sbi->discard_blks remains non-zero. Thus, when
f2fs is umounted, CP_TRIMMED_FLAG will not be set due to the non-zero
sbi->discard_blks.

Relevant code process:

f2fs_write_checkpoint()
    f2fs_flush_sit_entries()
         list_for_each_entry_safe(ses, tmp, head, set_list) {
             for_each_set_bit_from(segno, bitmap, end) {
                 ...
                 add_discard_addrs(sbi, cpc, false); // skip segment X due to its 0 valid blocks
                 ...
                 seg_info_to_raw_sit(); // sync ckpt_valid_map with cur_valid_map for segment X
                 ...
             }
         }
    f2fs_clear_prefree_segments(); // segment X is not included in dirty_segmap[PRE] and is skipped

Since add_discard_addrs() can handle active segments with non-zero valid
blocks, it is reasonable to fix this issue by allowing it to also handle
active segments with 0 valid blocks. 

Fixes: b29555505d81 ("f2fs: add key functions for small discards")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v1: https://lore.kernel.org/linux-f2fs-devel/20241203065108.2763436-1-guochunhai@vivo.com/
v1->v2:
 - Modify the commit message to make it easier to understand.
 - Add fixes to the commit.
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 86e547f008f9..13ee73a3c481 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2090,7 +2090,9 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 		return false;
 
 	if (!force) {
-		if (!f2fs_realtime_discard_enable(sbi) || !se->valid_blocks ||
+		if (!f2fs_realtime_discard_enable(sbi) ||
+			(!se->valid_blocks &&
+				!IS_CURSEG(sbi, cpc->trim_start)) ||
 			SM_I(sbi)->dcc_info->nr_discards >=
 				SM_I(sbi)->dcc_info->max_discards)
 			return false;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
