Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4DB14BB3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 11:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DzlFS8SXgTQKYRjeml52Hii03maMpjVRjrqT6gxwIMQ=; b=RzrxbDAVSTnLR13eBjEg8v9rMy
	ibNjbr8Uuo4PaYSds37J57SEx3xDL/M7/ij9f9VHEyfQzMeV+UA3WgO2ukLzNcR0uU0h7CDu6jYO7
	mLvDX+jhQGBs+qYY7j6GxIQcxsUmnx/twXJ+dOgd0fjuvkdk8E2yzcNgtSiqfrIXP37o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugh1T-00057d-37;
	Tue, 29 Jul 2025 09:53:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1ugh1Q-00057V-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 09:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1g4/8c3bkbXCaxKakvoQfrWpeMMIot2cUxGxTuXCI0=; b=TLrPTbvi2YTf+oQq74okqB4xHT
 kHz7UwuxRt6m7NJ4USZfrKvRPd3dbgHmCCeK1RU3j8VuZdIzYz0U1WEyqBoFYxT3FjLcrF5NWvwNt
 pnvofVIxLnp+lG+x6kIa2OIXBN6BoDs5TLkY0vpsX51Sm1JWVSh2S3pAWTJC193mo0TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z1g4/8c3bkbXCaxKakvoQfrWpeMMIot2cUxGxTuXCI0=; b=M
 O9WtvK76Syxy0SGSiauN32xzoQZ6mYFAfPvG3V5H07ETaKykOzHN/4fwc08EfgSOX22RulTM/bncC
 k4kK3GQIbNQm/7oz/LveUR8RufHxgasrbul+Cl4qfT4RIWAO4hInvat3amt7DFpyifwruQc8rVY33
 7ySQmULSik3lPRQw=;
Received: from mail-japaneastazon11012030.outbound.protection.outlook.com
 ([52.101.126.30] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugh1P-0007v7-5r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 09:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7paTYpvAXRlDIOYOMq6pIzfPr/aMEmOSgR85LpYIK+vuepL97232e8r9a8CWNdXZixUo2djboAKHs4OJveZHZKTFKg6zB6DfjzbjdcALNl6G2wD3ObKjljTSoH3NBqn7GZM/Mwhwmt6BAHRRZhBhSB7BdVffMGQ8ij0smGJrJYt0B+EgPDnu4eoGcPQG5LmbKh8x8cpQELLx5iT4ahfvNVJBJnRq76cXOMZRKDhniY0FLTYbeWz+vxRHzA5DINzG1XdnOCfCGXgr/EI4Sb7t7yzHYl5OmEzN8G8Tgii+sh9lKuNl0oCJIljYKN9vQUQ4fBhFqqB0T5Z/iIu+6H4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1g4/8c3bkbXCaxKakvoQfrWpeMMIot2cUxGxTuXCI0=;
 b=A9pa8aFh9f0Y5wYxyvn4BJriBc85AXCCBnAEIPLs1BAQnF0vQEIIVAWO36rb80BezvyPnp6BZpzbswG5pQyVoUV6EHsh5WpKKymYQw651uK0Bh5GO9SY0d4kZGZ9DN0Gh0VyVC2QGO5gtKX0MZipbfPIgWVuRSDt1Zkf2wPbt1TJg+VELt7kdd1VaQy07r7kDazJHnGbn9P8K+fItJTLD9wxitrt2AOeZGdTteP61GZxYOJOmsvLZVMPASAmWk41/CbUPK7GkrbR1xFth0PILcYYIgQA74ZHsPWJs12KppkWPNZWe/R/mvZVXRKY++wXMhHs7gh506I0N/xBDQF4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1g4/8c3bkbXCaxKakvoQfrWpeMMIot2cUxGxTuXCI0=;
 b=WMsLcgXZ6iZ3pvi8oZBOh3K+GxXLdBIOYL47YE5VhAFMmMg4gUXV3LzyM/nIkRfn3u/OX3ZHwtZpBiSNOnVcwMg+eyDfq30GPXn2ttcFnAadl/9KC4E26+nZGVNHwMWAL5MVOHfjXoJBiHFZdy8NaMtHAYpvZLWoh7/m05nZoLnoYcH7Eb/FmOAGME+3ObZMkzrGK1aa37/DTmtYpa3GQffDOUIJV0YbKcRpuZSRKQpJQEv9i3z7v6uajFC63dYQsOj/n9X91PbxeJh8QXr8bDZSGK+2B/xhdgwrN1gieAY3LDAu06zMb6ooZw2yShm+tj47/+McEnPIRchkp4QPhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com (2603:1096:408::90e)
 by SEZPR06MB7089.apcprd06.prod.outlook.com (2603:1096:101:237::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 09:53:09 +0000
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::6beb:51d8:f9a4:d4ed]) by TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::6beb:51d8:f9a4:d4ed%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 09:53:09 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Tue, 29 Jul 2025 17:52:38 +0800
Message-Id: <20250729095238.607433-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 (2603:1096:408::90e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPF33E28B4E6:EE_|SEZPR06MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4e0428-a1ee-4213-3ab0-08ddce85b990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V+qrXq3Zro16Qnrb/gLNQmCLnb1QsLj+AWtQvX6jyx5B8HvhmB8hIoOfCrES?=
 =?us-ascii?Q?dQ5fzUKZ7WrEYz9dhTZxrKLzfModin3wX2EuZ2QnWnNpO6/uw1HNfdfTzV6y?=
 =?us-ascii?Q?NF11A46QGXVrHGL4kXz4+98yIDJEJFZ6T/hYZVd2iOfyioQXuynxfD4vSzIl?=
 =?us-ascii?Q?eLydRlNwpKCS9/we0uHnVc+9didNfd0n5j6ubRvpM8Du14ItbkKAq1BmvzAk?=
 =?us-ascii?Q?zZ1IkDlmbfTknANsmsqqPGqqTasIIaj2wdSBrgWE9cr3AjgYC2vcZKdxudEZ?=
 =?us-ascii?Q?nslYzSzNp6Uba8soCLyxF5UX7xYDqjL+3fF58LR06C79FjXsQ4gq1n45femN?=
 =?us-ascii?Q?XoWUrhBM6oi1fxWKC+7P3XeMbcOimBXiTY7LgUsZaxxa/AqDG/52op6SF2ZS?=
 =?us-ascii?Q?DBYEp+4tVBy3xHRiQHdFbSgFEF5i4s2O1/549Kx4/2v94GkBesEPsO10zriJ?=
 =?us-ascii?Q?6KqnjyrY++anB0fVKavG2wHGzS64xB8/XkLd8LmMoPuj8EdmjdRv3cAeyx5h?=
 =?us-ascii?Q?Gpd/RZZzHs3GOdDCNSHI7oxHFl0iW/7DVQUCiIcKZzxjjMoM5DEXojEpr4SH?=
 =?us-ascii?Q?yn5OuiKwLV733/83NigR0O5b3Y/CFSa1OcvwY+9rh3TEz1m3j3yuUC50sfak?=
 =?us-ascii?Q?CaRTlSr4h9o9bnZQr+oK9FINrgDdcq9zIcoV6h4dPRa9iHRV4SqPPMDDS9eK?=
 =?us-ascii?Q?+AZjjgeT5Ma6csphqfZW5yqajqjYoBBahZnhOSheTcAVbeXq/OQm6o2qUoho?=
 =?us-ascii?Q?Pbn/ypefBL+18XamQNu6cY1cepSmK8wPX2IXAMuaUtwKaeAnqGljWy4Qli4u?=
 =?us-ascii?Q?PTtt19PQmXn3alWK9v43jYdr1LjfSEy5GfC7xUyWINXs43LDcdiuKWV72628?=
 =?us-ascii?Q?3PGN7husIDzB8h+G2zsOL/jcGE9IgzchDUhhFx6eSMKYGsy8rJ6L3G0WlZBq?=
 =?us-ascii?Q?39cVHutEufbGx05e7Lbi1297mRY128FP4MBtjcwIbfmNsjCmb8F5n8e0/6YC?=
 =?us-ascii?Q?djL643UcA2y+qDmtZNtGHAajAO811yjPzEfb7xbS2m16OLQLQ5uEfeikANkc?=
 =?us-ascii?Q?BmVnOQ4TfzOaMeQvaCFYhtyiRVH64M3+VET3VLpwC/eXhDPuSuLHYSN3dxbR?=
 =?us-ascii?Q?LRkgCG+/i7OqqSVZhl0b70Jh38hV1DiTPN6US+mXn98DfemBSA4Mvv0H/312?=
 =?us-ascii?Q?FYjVr9BNsc3xBK7URwWq2XOhFloThwq6z+av8/XJ84x+dWTFqDof8INsYWzJ?=
 =?us-ascii?Q?UR+XWKO2k1u+5wCAc+e9OlURT/6oRS1IqJPN2k5EsZj0m9Rv2CCvBZjYjjx6?=
 =?us-ascii?Q?X6Ql7Gn4eU1uobliaTFwBVnd3gy/xIYCk2uiQ9kjKcRYXkIy2pkoP8S8NxeR?=
 =?us-ascii?Q?EUw00ZhD53rjuFf6l7urItqoGmenmPoNtb0KtuHtFm0/NOCO52gxqxRkJ825?=
 =?us-ascii?Q?S88UjP+eRkJxnPrEeZkUCahRtIKa60E7F8fupaIBYgVThoC7e/KOAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY1PPF33E28B4E6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?md+PDCjKhcnLWuI0+atLSf03p/tB3nLUBWAAVhuZf7M1wRohWgRPntrZGzVO?=
 =?us-ascii?Q?99L9XxuQNjCRUBacpMACYZ7IJEsao2XE4ySl0QEeQ7X1Ks9Yzd51dcpTHNAG?=
 =?us-ascii?Q?eUTug3T0lofpMA9J2R4Nn0VdPz6z2J2PNOTdm3MYOrbVoHPrggdkqSEsAwH5?=
 =?us-ascii?Q?7pQ35iwRFIgIlfUb0eshwv3vsC/zp3FXSXGvgM6sfQkcuihhcmbKH17JU255?=
 =?us-ascii?Q?g+sbxO23rD8mC2gDLLrpVNPeEFUOb18UI0Y+ekuBWD4qzcF7mTiK15FubnYs?=
 =?us-ascii?Q?2uagYvP3aG17YJmgLTxBvSenN7ubglB9FoXqZ8729thVLEWNmNJqA4hq4ZRZ?=
 =?us-ascii?Q?by47w1qQ6QGHiezWM2m+r/amIWkkZBgKuQzB/GDd+mGkPT/GNr+G2RudCiia?=
 =?us-ascii?Q?2v7EQpm2KTvbNHwz2VowLFBNcLwDF4YuEg+nsg7dPydQkp+VGpu6vNf9A+9+?=
 =?us-ascii?Q?I4qjYF7Fudewq/yWtWWER+XYlN2snHXT4Q0ufahzozg2tdE0ZAQauliotsE+?=
 =?us-ascii?Q?dkA3NeYcpgy+zSFVKajMbrfmmd1U/mUUEGnKSJe1sGXPT0CjI74LVuGG7EPA?=
 =?us-ascii?Q?4S7LmtfSK9+Lc2Xi3yoHRHP2jMWCvFWETbpLRb0Wb5Hv5le7Nnkup6gYJnbA?=
 =?us-ascii?Q?8EwFqu3YYBtIklbdFHp124F7RUrTxT60/GXj6lNIt97B5PMnJyjOdCnKDU1J?=
 =?us-ascii?Q?A5JD0XBdZhKpu/y0zwZv65NlJo2iQlSa0n/4f4dcBH6Eo9L2xGIR9WaFLYEQ?=
 =?us-ascii?Q?zlAslq6npyutUWMOH+HFge2SM7Gys4f9QFGsIv4vFL4JNpa4Jl3aiQe+/I/e?=
 =?us-ascii?Q?irxPOI24JIYWFV6LE1Q18lMAAFuqpeSIWlcsAfAEbPxrrS2OHROMVi2TTobC?=
 =?us-ascii?Q?z0vslLhBy3wrqq9sTAM3hW+Nvei1Hv3GHDOy0z7trCRcQjNFLTKwOIYdkkPk?=
 =?us-ascii?Q?F9JWjenFi6K7V6YZtBQo33vWkdGGNwIO4DUSizQpNqgw1iLtHlhp6k5HWV9C?=
 =?us-ascii?Q?QuZOLSHFY5lwOLhg3LvAyLCB5UYSD9RFSWhZVx/IqaBqXsBFUJTM/pJxl9WG?=
 =?us-ascii?Q?WwMM01Mr7IFtebhUvsjBfwjQanYa+tB4bkSJ0KyChwi74YxupoqAl2fXqp4g?=
 =?us-ascii?Q?QioyY3BvPtDxAa1maNYK+Rb5Ap3q3w4uohDF7rqA8TkaMHYS4SQ34In9XxyV?=
 =?us-ascii?Q?PPZ5F4qYdzOxeuPPi7FOCWcCZFe1aV5AQpzv4dqIYKbQ5tlipLp3C6K9wOLi?=
 =?us-ascii?Q?g4s31vLnsn24tnLyJ23zKc47uWwcgiUNtbpp318lS9NZIQlszrj0l/gA2ymb?=
 =?us-ascii?Q?U8Ec9ujnJ+vuo3CbyQicPSAxd1XbtNIlpRiHpTjsLCoqCmaGZWDFK6UjO5Zl?=
 =?us-ascii?Q?LbC1d/c/WeyiOr5cRBVa5ZOE9Ml9bi47dPlcsX5+xBqq1kw6JY3xVQARg1dg?=
 =?us-ascii?Q?aDmgyG46dijUCS2Ohfnz6Y6ptOJ5MdRhegyzZsDMFDB+TrziiaC4yKpEhJUB?=
 =?us-ascii?Q?yRzQKNFBgensDdPIi742rA8OENyhPWGzeQYntgy4tL81QI5q1ZPXmV2JrrAj?=
 =?us-ascii?Q?W/epjjcSbZz1eKsxaTiQcVaE8peeZOeT4zxPLvgt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4e0428-a1ee-4213-3ab0-08ddce85b990
X-MS-Exchange-CrossTenant-AuthSource: TY1PPF33E28B4E6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 09:53:09.8255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scUEpaNlBeFDrb4/aOYrXZYBR0i+doyVX/SsFil707XL+cUQZbiLsQzepK4LA8DHDnrz2biHFNCXFH0iwJXMHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7089
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch allows privileged users to reserve nodes via the
 'reserve_node' mount option, which is similar to the existing 'reserve_root'
 option. "-o reserve_node=<N>" means <N> nodes are reserved for privileged
 users only. 
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
X-Headers-End: 1ugh1P-0007v7-5r
Subject: [f2fs-dev] [PATCH] f2fs: add reserved nodes for privileged users
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

This patch allows privileged users to reserve nodes via the
'reserve_node' mount option, which is similar to the existing
'reserve_root' option.

"-o reserve_node=<N>" means <N> nodes are reserved for privileged
users only.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 Documentation/filesystems/f2fs.rst |  9 ++++++---
 fs/f2fs/f2fs.h                     | 15 +++++++++------
 fs/f2fs/super.c                    | 30 +++++++++++++++++++++++++++++-
 3 files changed, 44 insertions(+), 10 deletions(-)
 mode change 100644 => 100755 Documentation/filesystems/f2fs.rst

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
old mode 100644
new mode 100755
index 03b1efa6d3b2..95dbcd7ac9a8
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -173,9 +173,12 @@ data_flush		 Enable data flushing before checkpoint in order to
 			 persist data of regular and symlink.
 reserve_root=%d		 Support configuring reserved space which is used for
 			 allocation from a privileged user with specified uid or
-			 gid, unit: 4KB, the default limit is 0.2% of user blocks.
-resuid=%d		 The user ID which may use the reserved blocks.
-resgid=%d		 The group ID which may use the reserved blocks.
+			 gid, unit: 4KB, the default limit is 12.5% of user blocks.
+reserve_node=%d		 Support configuring reserved nodes which are used for
+			 allocation from a privileged user with specified uid or
+			 gid, the default limit is 12.5% of all nodes.
+resuid=%d		 The user ID which may use the reserved blocks and nodes.
+resgid=%d		 The group ID which may use the reserved blocks and nodes.
 fault_injection=%d	 Enable fault injection in all supported types with
 			 specified injection rate.
 fault_type=%d		 Support configuring fault injection type, should be
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 97c1a2a3fbd7..f4c4ea115465 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -131,6 +131,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
  * string rather than using the MS_LAZYTIME flag, so this must remain.
  */
 #define F2FS_MOUNT_LAZYTIME		0x40000000
+#define F2FS_MOUNT_RESERVE_NODE		0x80000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -171,6 +172,7 @@ struct f2fs_rwsem {
 
 struct f2fs_mount_info {
 	unsigned int opt;
+	unsigned int root_reserved_nodes; /* root reserved nodes */
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
@@ -2355,13 +2357,11 @@ static inline bool f2fs_has_xattr_block(unsigned int ofs)
 	return ofs == XATTR_NODE_OFFSET;
 }
 
-static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
+static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool cap)
 {
 	if (!inode)
 		return true;
-	if (!test_opt(sbi, RESERVE_ROOT))
-		return false;
 	if (IS_NOQUOTA(inode))
 		return true;
 	if (uid_eq(F2FS_OPTION(sbi).s_resuid, current_fsuid()))
@@ -2382,7 +2382,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks;
 
-	if (!__allow_reserved_blocks(sbi, inode, cap))
+	if (!__allow_reserved_root(sbi, inode, cap))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -2740,7 +2740,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count;
+	unsigned int valid_node_count, avail_user_node_count;
 	unsigned int avail_user_block_count;
 	int err;
 
@@ -2769,8 +2769,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 		goto enospc;
 	}
 
+	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
+	if (!__allow_reserved_root(sbi, inode, false))
+		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
 	valid_node_count = sbi->total_valid_node_count + 1;
-	if (unlikely(valid_node_count > sbi->total_node_count)) {
+	if (unlikely(valid_node_count > avail_user_node_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30c038413040..c58992be52a1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -143,6 +143,7 @@ enum {
 	Opt_extent_cache,
 	Opt_data_flush,
 	Opt_reserve_root,
+	Opt_reserve_node,
 	Opt_resgid,
 	Opt_resuid,
 	Opt_mode,
@@ -265,6 +266,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag_no("extent_cache", Opt_extent_cache),
 	fsparam_flag("data_flush", Opt_data_flush),
 	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_u32("reserve_node", Opt_reserve_node),
 	fsparam_gid("resgid", Opt_resgid),
 	fsparam_uid("resuid", Opt_resuid),
 	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
@@ -336,6 +338,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 #define F2FS_SPEC_discard_unit			(1 << 21)
 #define F2FS_SPEC_memory_mode			(1 << 22)
 #define F2FS_SPEC_errors			(1 << 23)
+#define F2FS_SPEC_reserve_node			(1 << 24)
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
@@ -439,6 +442,7 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
 	block_t limit = min((sbi->user_block_count >> 3),
 			sbi->user_block_count - sbi->reserved_blocks);
+	unsigned int node_limit = sbi->total_node_count >> 3;
 
 	/* limit is 12.5% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
@@ -447,6 +451,12 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 		f2fs_info(sbi, "Reduce reserved blocks for root = %u",
 			  F2FS_OPTION(sbi).root_reserved_blocks);
 	}
+	if (test_opt(sbi, RESERVE_NODE) &&
+			F2FS_OPTION(sbi).root_reserved_nodes > node_limit) {
+		F2FS_OPTION(sbi).root_reserved_nodes = node_limit;
+		f2fs_info(sbi, "Reduce reserved nodes for root = %u",
+			  F2FS_OPTION(sbi).root_reserved_nodes);
+	}
 	if (!test_opt(sbi, RESERVE_ROOT) &&
 		(!uid_eq(F2FS_OPTION(sbi).s_resuid,
 				make_kuid(&init_user_ns, F2FS_DEF_RESUID)) ||
@@ -841,6 +851,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_reserve_root;
 		break;
+	case Opt_reserve_node:
+		ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
+		ctx->spec_mask |= F2FS_SPEC_reserve_node;
+		break;
 	case Opt_resuid:
 		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
 		ctx->spec_mask |= F2FS_SPEC_resuid;
@@ -1424,6 +1439,14 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
 		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_ROOT;
 	}
+	if (test_opt(sbi, RESERVE_NODE) &&
+			(ctx->opt_mask & F2FS_MOUNT_RESERVE_NODE) &&
+			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
+		f2fs_info(sbi, "Preserve previous reserve_node=%u",
+			F2FS_OPTION(sbi).root_reserved_nodes);
+		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_NODE;
+	}
 
 	err = f2fs_check_test_dummy_encryption(fc, sb);
 	if (err)
@@ -1623,6 +1646,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 	if (ctx->spec_mask & F2FS_SPEC_reserve_root)
 		F2FS_OPTION(sbi).root_reserved_blocks =
 					F2FS_CTX_INFO(ctx).root_reserved_blocks;
+	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
+		F2FS_OPTION(sbi).root_reserved_nodes =
+					F2FS_CTX_INFO(ctx).root_reserved_nodes;
 	if (ctx->spec_mask & F2FS_SPEC_resgid)
 		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
 	if (ctx->spec_mask & F2FS_SPEC_resuid)
@@ -2343,8 +2369,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, "fragment:block");
 	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
 	if (test_opt(sbi, RESERVE_ROOT))
-		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
+		seq_printf(seq, ",reserve_root=%u,reserve_node=%u,resuid=%u,"
+				"resgid=%u",
 				F2FS_OPTION(sbi).root_reserved_blocks,
+				F2FS_OPTION(sbi).root_reserved_nodes,
 				from_kuid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
