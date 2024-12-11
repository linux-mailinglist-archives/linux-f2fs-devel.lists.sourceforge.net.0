Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE69EC518
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 07:56:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLGdw-0007lZ-CD;
	Wed, 11 Dec 2024 06:56:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tLGdv-0007lT-7W
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 06:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTzc+BhgztoIRxIGzEGWscEb3wgJRVSlxKB342b/E1A=; b=If2eCHcZE1UlOGOYp4SiQ7RoFh
 mO7GlOAg84UGQ54i/V4uRp8GWLdkjxoj2cnHAL/AZrg5O/gnrYD40MzsqXo01hnHHagifH97Uf5Vk
 EU80EYtVTASPE1EbDgK1d1mEkDpd5VgSScon2gGztpQBnY9Hfb+ATKcxH2g95bAP4YOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eTzc+BhgztoIRxIGzEGWscEb3wgJRVSlxKB342b/E1A=; b=U
 hUvh+wrv+In0942ikGiT358hP9xamakn64n4++kG3BrmBTVVB75MA32T3Uhlwk3XARS+/jb8dU7IO
 Xrp0sWY6XxH6wID1w102I5KQy0uiUfikajX8Xozwyu05Usk22koegNZhqihc4U2HZn4KKADpgVAVT
 gfAoGvitZwaPj8AQ=;
Received: from mail-koreacentralazon11013043.outbound.protection.outlook.com
 ([40.107.44.43] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLGdu-0005fl-95 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 06:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4zTr55VhTX6ATpvcx+L2PH1DVAvJAjkqNnfVP09jhY9dOmz0VXc7za1irfwEtHSSoLHhmo5xuz4U2qQLkieD2DanZUacSWjO9NUhSVPsElSwNcn7NTmqe4ZH7SIdkXiGN/oo+EqUOysfZgJlPMA2+IYUdjXxoOOFNCwtNw6sGvfPAwgHIiunxIucmtUqpeqC1X4Za8pWzO3hP0FAmLyryixMpRZub9XOnppoL9of/pl4SmrJjq0lO7l0GjyUUtoBrTe+axZ0e67lTWv44DlyRqB5IPJtLKz0+blXI3WTWbdPOWovvohdzazxSEhcNeR1OvDOZ5jLTTwZlgc+cab3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTzc+BhgztoIRxIGzEGWscEb3wgJRVSlxKB342b/E1A=;
 b=s0f1PfhlsCsvvN/eL7ItLgG8Ost2/ud0Qxc5uv8jgNzupKWmIt3mL5Osa33L5hPPsrYbWfzyeBcoOOACU7V5+aEjcf0HOSPKRqCeZGbF5Q7MMajFzltF8O2wuG9THXmPYgmzci+ZiyneXET6OzWG7ktNdn4gebFbsB/jGUniTQ9blbtluJGp33DtKNQCJfcb3YUPC9LK9KBxwJddP3iSV6/VO2jo9gABP/+UpOjoTMDAzKTBsgAsgGj6QVJXJArc/+bXsJAhXspLan9/1MBK8Vbjyh8sYL4/yNns4+W6v1G91M5vm0n4nSSXuL1rmXoohsFhEmo0uSzZQKaVQ/SX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTzc+BhgztoIRxIGzEGWscEb3wgJRVSlxKB342b/E1A=;
 b=frEArJy7nvvLhKLzaKEluGH9L68bH+dmc/MDN/3zOqjnKmdRdFR6TQUkV5okYV7iEIVIWWJqK6qa0RCvlRd/0AWLPv65uKdJ8pekJT4MLa9GLZLDByZOGyuz4EJeyW+SrwvmSER/b26be/oNrtNPtjSkZs3KaDIAEKPp15DEyBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by JH0PR02MB6903.apcprd02.prod.outlook.com (2603:1096:990:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 06:56:03 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 06:56:03 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 11 Dec 2024 14:55:45 +0800
Message-Id: <20241211065545.4128914-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|JH0PR02MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f483e2-8ecd-4264-ec6e-08dd19b0e098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ASWY+m15Qdrve8o3in9fAA4J77GiPTQkKO80t9xn0kLaqtVz+ic0Cpfc2Lw?=
 =?us-ascii?Q?hT1YiYu+dgCZrNnaxEMGhSTutIlqQlRLmteNMV7ne+EL899z/HlSkpTq3oEm?=
 =?us-ascii?Q?Zfrvb2u8SozZUix8O3HWb7ob6GAQx9Vq35EuGznQKIRWA5cYyT2ZFXByLtcL?=
 =?us-ascii?Q?EqyRy6Fvybp3gAjCrxWZtEvlbmcQsacoRtjP9oHvfupzngK3jTsdtenispwl?=
 =?us-ascii?Q?5MkvUJHW71yu/VzLIqB/hA8ZnAIYytqfnDobNIDXmgcfKXLlSqyYgGL98gMq?=
 =?us-ascii?Q?xXNvkNvMdmDODfEQw6C0MGvr1ziTKlFdlgxYzbR8Vj+8zwAEkceMvkcs2OH7?=
 =?us-ascii?Q?ePSbihAIRm+jB5t7ZqlpKlWnTdQMjh9pBf6vTF9+pijER0Lktmpb4BMfZ2Tv?=
 =?us-ascii?Q?jfRMXzw7h2YT+DqxkX1uD586vXiM313mxgvaT2niNxQoJ5nUwZuCbJNGzbPN?=
 =?us-ascii?Q?sABqKuUZiTlmIZPvBS2BvpkS14+WZUYQ+LXgolYY7adimUda2rdFXxs/9OYv?=
 =?us-ascii?Q?aZv1Rt8vGXuuY0QFXbtL+a29JRYy6vuavlPWdrqol4fV/rp9XmP3641nraSN?=
 =?us-ascii?Q?LGmuPBk7lqNa7bJsP7PjXvmx8miiti8opFQj4Gt68NWtOwP8bJt9vvv4AEG4?=
 =?us-ascii?Q?h7PjuZx2zgHw2rKtAFYyVD7mBLT6rXjXJV72DY/wenK9hHeKh5LSUbUP0WH6?=
 =?us-ascii?Q?vz8Xf8uzsQZq02wl2NBszyGG89G0Tgaq9nBuUqLaMc3bxWV2QpW026ilfLi+?=
 =?us-ascii?Q?QmpKf51Eqr+/4Z/wyLVQuqlhjB63xxvRa1VYW0+KXr3dTJs5rCJDIKRJLhvv?=
 =?us-ascii?Q?+DbGXqvyK9saSHkBnP/u8B6zk9SaCBFv3D0GOBPIIap+SPyWs5TTKINsDu0t?=
 =?us-ascii?Q?lnmwJYh3Qn+V8d6usM+L0bnHW0lFRss5BPvGCJwEqshUAQDX5rI1xPrSrpD9?=
 =?us-ascii?Q?VyMzI1DMC2C/TzQcOGgfUMu1efxej2FdMX+/EOUsaiUPII+v+oGlKzG7W0Wh?=
 =?us-ascii?Q?4tJRd1kjZfZLWj1b6ajYAXCpgqO/OCVN295HqmCjQz5FKCv6Z6BCgcSSLYzM?=
 =?us-ascii?Q?vEL+du5jaIf7Fr5idxlJK/cf+jiY0UHFh9PUu07YMjg/7ZRO8KY0JkWz/Mg6?=
 =?us-ascii?Q?8jGZ86RwkgOtvCCNi4luU9WVFMdRpezSB/Da1t3cZ1L7kAIo8/KqxJffN8oE?=
 =?us-ascii?Q?g1iK8O4aN5RgC8uL97NpeocXE88fBl18sXVRO5/lOL6jkYTQYt62HI76RoGV?=
 =?us-ascii?Q?GHYcezmJGJ9i5qax6MaAUrHEQOT51/+2EiLtDVhN09qEa/MSfb698phryCcI?=
 =?us-ascii?Q?8UZ+6cXMOu8+gUKUU1OPcJeU9qEiqqevlqHZIIcxSSPN4uS4gxOTY9FIGtVa?=
 =?us-ascii?Q?6602zUH+1IAHytcQbACD0+Ox5LuCJncWkOQ35NUSrUKlZCSzkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JD6slEBWjJuAx1AjbA1a9CtiavioSLr7cyoThavUo0sEoiH6eNUKIn2EHikw?=
 =?us-ascii?Q?WBvYWvNrt3kyp5CX9NfcfJ+fANH1a+EzqhKFFt8pxNqEo016h/z2wC2vHPqr?=
 =?us-ascii?Q?zVRucKYIzgWjVyXGCqFhzTNCxrjt0UNgJSA3oI0QnXBEa1ShRdADshAzaP/N?=
 =?us-ascii?Q?KrGj82M9oHhKNFfsbVOB8Ps87Z5fMMz0+BlAGDGkIELVYqPMO2dVkn5lR6LT?=
 =?us-ascii?Q?OaDjZYY//pRW43qkQSj309w81wnNVfet7JB6t4BKAN8LkVkF0Hjl6yDV0Buz?=
 =?us-ascii?Q?adThPT44RrEiacEUGTnC30FLSPpm7PxBhZ1zGxp+aEm6yLwlidWua4SqBbjy?=
 =?us-ascii?Q?+lvMfEdcLCYN/eLBudDXgQMzsd7mx4erwqyDEPPQrwBWHRVtZJrAQ/ZoLHFz?=
 =?us-ascii?Q?IWr7oteiSuc4SnuiYBfn08OrhxHE1SqWOxFheoyWFJnvjoBEUvu2G5CZAp7v?=
 =?us-ascii?Q?OUB7Kx9dWFRFWWsrZyPJr9UnY1piWW6/IC8mrm8YRyIKHm4EOwe1Y9Puovbm?=
 =?us-ascii?Q?0EBITK8/TrUjJRFJDhpdfPje/hSBgVCpveVLecueXrQjy3QQKih7KJAEsX7u?=
 =?us-ascii?Q?aTDmg8dr8EfLhaN2mDmLfQiq0uVKSp0UkbmTIBhV0f+rvkifVQ2o3wMpldZs?=
 =?us-ascii?Q?X07NOvcgwzlTc0VFNmg9O16PwiDC+0MYeuN2az8rdzpjF9aIRFO7gORwRly/?=
 =?us-ascii?Q?5oOwl0TmSbqth07gFlZcjbOj2OXXRBsDWfC7A8lwv+S2nd+lf2nFeqGvy5tM?=
 =?us-ascii?Q?uN0a/Yl0xMyH4afXU/J+RJrN7bXoPh3WXmwoBg8vnkM2PAEiBvNN9NYtugyo?=
 =?us-ascii?Q?d8KoZTqcCbB4KVLIvSJeJVp3sQ1rFqorL88+DIKmk/y9mNMiFnDxm5+6dMSx?=
 =?us-ascii?Q?cWeo/tt4lzowGYYxBllcrrU6pCKJ6CmkngI52KCYy9azVOmiKKfjdxytkaZG?=
 =?us-ascii?Q?mDt3WD2pnktgwpUnDDq7NYsrspLW9b+JpXNPEZMLgZKgIdjYxJFufhG5m6ZD?=
 =?us-ascii?Q?RHUS0oeOdZ978Br0TGZXHP+f46GM8TSP5L9vV9a+9w9qQYaFB3PrUB9G189e?=
 =?us-ascii?Q?dScPv5MsI9ZS1kK8BZhbQwMW4qsciMvZ0lZ8EzIBwLymEr5FQr74fMyfKxoV?=
 =?us-ascii?Q?g0uVOfwDewsPvorVoUp+L4D4MSJds8GsYmNysAZ+P4Lr20wFNCppIqslW98z?=
 =?us-ascii?Q?ojpS5ErZDoGwZANk1q6js8JniNEBuH74YtVK2nFIdHSKaW0dGAoYrl/1ht1N?=
 =?us-ascii?Q?a2fK0E3J//RBHmMH2dIpPZystoQnfCob9NQD9hAHtXhtAa6KRBXUkSVXR7EX?=
 =?us-ascii?Q?f6x9KZpzEDU7pkJkSSTzEpu3XvEdMFB3m8OdzphYDAjRK7tKCfByL7nki/FE?=
 =?us-ascii?Q?AwgCYN5t8EBXDetBGCrrnsjE00SLFSdiGbZQB0KyvPjigEWZybsABD+v3/TP?=
 =?us-ascii?Q?Ua6qY+ubJf3A9TPItUuFo+b67wO5VbGfMUb78+lqk9/qiYQd8mCF2dsQaHfC?=
 =?us-ascii?Q?Uy0i1WBn1OhL+NFWE49DEZUfLU21ltklJ4uYP1fWov/tIstfzbfiz1SWfMWd?=
 =?us-ascii?Q?YJVZZTgRQIqASmMlL++1iz7MkUybq03FuMlHhwObG8hmWrPt6UPChFimhkHV?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f483e2-8ecd-4264-ec6e-08dd19b0e098
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 06:56:03.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrFDtwGt+05G+9IoncuIPHGthUNQpJhrfIYQgdJ3i++Ca05t4rfsrM4DBYlp4YZGJzw8sQpfI0McW18C/BDT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6903
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. Use the same buffer in the same call cycle of
 f2fs_defragment; 
 2. Pass se and offset as arguments to the migrate_block;
 Signed-off-by: LongPing
 Wei <weilongping@oppo.com> --- fsck/defrag.c | 18 +++++++ 1 file changed,
 7 insertions(+), 11 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.44.43 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.44.43 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tLGdu-0005fl-95
Subject: [f2fs-dev] [PATCH] f2fs-tools: avoid meaningless repetition in
 migrate_block
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. Use the same buffer in the same call cycle of f2fs_defragment;
2. Pass se and offset as arguments to the migrate_block;

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 fsck/defrag.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index 9889b70..7336f8f 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -9,28 +9,21 @@
  */
 #include "fsck.h"
 
-static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
+static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to,
+			 void *raw, struct seg_entry *se, u64 offset)
 {
-	void *raw = calloc(F2FS_BLKSIZE, 1);
-	struct seg_entry *se;
 	struct f2fs_summary sum;
-	u64 offset;
 	int ret, type;
 
-	ASSERT(raw != NULL);
-
 	/* read from */
 	ret = dev_read_block(raw, from);
 	ASSERT(ret >= 0);
 
-	/* get segment type */
-	se = get_seg_entry(sbi, GET_SEGNO(sbi, from));
 	/* write to */
 	ret = dev_write_block(raw, to, f2fs_io_type_to_rw_hint(se->type));
 	ASSERT(ret >= 0);
 
 	/* update sit bitmap & valid_blocks && se->type */
-	offset = OFFSET_IN_SEG(sbi, from);
 	type = se->type;
 	se->valid_blocks--;
 	f2fs_clear_bit(offset, (char *)se->cur_valid_map);
@@ -57,7 +50,6 @@ static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
 	DBG(1, "Migrate %s block %"PRIx64" -> %"PRIx64"\n",
 					IS_DATASEG(type) ? "data" : "node",
 					from, to);
-	free(raw);
 	return 0;
 }
 
@@ -65,6 +57,9 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 {
 	struct seg_entry *se;
 	u64 idx, offset;
+	void *raw = calloc(F2FS_BLKSIZE, 1);
+
+	ASSERT(raw != NULL);
 
 	/* flush NAT/SIT journal entries */
 	flush_journal_entries(sbi);
@@ -83,7 +78,7 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 			return -1;
 		}
 
-		if (migrate_block(sbi, idx, target)) {
+		if (migrate_block(sbi, idx, target, raw, se, offset)) {
 			ASSERT_MSG("Found inconsistency: please run FSCK");
 			return -1;
 		}
@@ -99,5 +94,6 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 
 	write_checkpoint(sbi);
 
+	free(raw);
 	return 0;
 }
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
