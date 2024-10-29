Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B269B499C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJM-0004XR-PY;
	Tue, 29 Oct 2024 12:27:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJI-0004XH-Nu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+mzYvaSGdftukYj8lwUFiZIiAT74u2p/Sv18OTsH1tg=; b=j/VTP/6gsNMOx6qHLepdPsodUm
 BrVUMepdZQBgn9g1+Q0QQfCy33dhc11aJu5Sz8cD68PKjmrY+alMBiwTRZhaOvnUL0x2S5BlgvSEt
 XUznwW5tq9n1So0S2zeg55XU4H2X6+dPyFcy9obkQKaszoPAWAtwNUEID/OipsbFDWDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+mzYvaSGdftukYj8lwUFiZIiAT74u2p/Sv18OTsH1tg=; b=D7ZdOiQyW101ZE1i/2BG3RnU2L
 s7T0oyYYwHryYhvClAoBiBot4dYZKoU7/2olSoqwyxSB+5GjlUS+GZ18bZXXzM8eCvdazQdf+d7gY
 nBdc9/g3hnTEGZ0gzkJrD+W278eQIJpfvisfksNlesDkpU4cQrA4LmMw/C9qiKTidL8M=;
Received: from mail-eastasiaazon11010057.outbound.protection.outlook.com
 ([52.101.128.57] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJH-0000bs-V2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4sNLuu7WAlWyeMHPF1i4aYCBd49BszozDuxiv9cyNqQD4Lk1ACfoGZlM3HxuGOoIu6Ly1kGGX4cIW3wGTWauBx8bpFw0+FZFNcT3SM6n7dIr0AAHVgWXnbd50LEZgSJTuw8y8w1Qw5DZc/MIXjkR6NHTo5rDQT4C7y0q1ulwVoPyDFI6C+WRi49ODK4A5xBC00GFfiIQFLfPOMXB3hpeWS+8jDdYn27rvrNydM9ytC/GbvBE9G5DA4o9hgJ/nfMw2qfaVuU/5AsZ0BpAQkO4iNahr9E9DZYe0pFnAUblmWnzjlKyh6ogY1dC2XHrrWXORAwCNl6i+pVpjeukxEdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mzYvaSGdftukYj8lwUFiZIiAT74u2p/Sv18OTsH1tg=;
 b=ybIdMooJ8Tmjkq0zMR1g8s/sG4JCcHB0NwH0y9SX3KPjQ3T63htUR94SI8IE32SLObAA+2lpFArGch8JUa7q64LFhyIB9kUMvIVSIjAocqhWaiKiNysxBB3nQlFd781Xf4/X9xsYdf14yhkAGlJ1wuMwrGMO3N7NDZf/1PIkEk/AlBEFQKAjrF6G8NvVGfHYMSuqrNnGijLrKki89RkMx8Tzld7ybC0EeDoT0Im3izoQt4QtGB97rTZtt0Eb1Jth0zVfD+TSdFW7BubMQosg59afu9H/t2cJ8LaeXHXopZHQE92BCgtexXRD5zP/LK7w3Tzhl9rW4yoIAGQ75+aMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mzYvaSGdftukYj8lwUFiZIiAT74u2p/Sv18OTsH1tg=;
 b=eT5OO00bI7o63xZDtaRc1g+e2kWheeQoqC9C3Ph4GhmRS2UPZgdZeRAnqPdrI+8xJ2CR0dfG++L09+5FLuVuCA5Jx4F/G2MXMnuKCSQ1yIsZMB6JtmMjtMGIZfSnDQ81fG9YyDHsrbFIu15oTFp0Xl7T89quWpU1TSK+Kq/icgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:49 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:50 +0800
Message-Id: <20241029120956.4186731-19-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fc9b5f-a6dd-4814-2161-08dcf812dd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+DDG9rBG4fLQJdLyGTUigDl3drYj6ewS09Mk8JrM5bGBljl7AxvbcAK2lkIu?=
 =?us-ascii?Q?yeML5Ud7pk201ZCQzsyhH9Roz3BVkR5Vxov1FF7jerBCZhPQ0jQonWRXBrz1?=
 =?us-ascii?Q?r9dPPvKhndNOwDOw/vVnzUApTsDUYsCRMhn8zCPocIBCPUdiU0BELPzxPXAm?=
 =?us-ascii?Q?zPeqWAm2Kqqre3mO7qOTzEmddDmghBwJAwze893CKU7rPfevrh/Ewqby5JR9?=
 =?us-ascii?Q?shTsE74pmsO1UvpwKoSafHvu5d3C1kajMrVSfFNh/ShnC8SudxllreQ98sDq?=
 =?us-ascii?Q?SeuMmh5/tTNec71HO6CFvdmtjh+9xfzHUnlFmi+YLOY0jMaxUhIjbnatmOAf?=
 =?us-ascii?Q?digyFjRJtSqi2cGC+8/RjY3Cl6AZBxNBQQjohwuZCyqkOHkSsK6KAnI3VQFu?=
 =?us-ascii?Q?SLTqEO0tJoSoHyYwcGFNrXvBoLwWXzGquzAUeRXi1lxCuP9DD3kPVekI/YhK?=
 =?us-ascii?Q?VJ3e1CkNionsKfBM+AlpHsFpjV/rZ/7oc2NLaYTy8Qgf1iwHTHo3OzktD4/5?=
 =?us-ascii?Q?f7SHD8OK5J98f8ii3k6y9cjHQFZwWEsuMc0bmeUBjpPhv2NsDexa9wr+LywK?=
 =?us-ascii?Q?0sC9wvifDBYuxtSdiHButbTMBqA/JExFnQW96O9pZLYd3IkED5YTWt1YdmwG?=
 =?us-ascii?Q?kqonmWZicwbBBbnhPbOELf9RiNGBZb/KPsfW1e++aSE0xBCWTGaDg4aZMorY?=
 =?us-ascii?Q?kVQqBvlwo4Sr5wp2KMwmOTqsPVV9jETIYjO/lXpIUmK4H+3DOIRGB+0Ww3m6?=
 =?us-ascii?Q?/Pj5Fm5EzxQFwHsNVgYU5uFswElohYo3TgBVDN8hXwCszMSUKjn8Wc22XrHg?=
 =?us-ascii?Q?J6G8H3s5yS0HyvJvk0xaAxfVppC5DQIl8bErZ7rEyUvLwxJzPstucsPhEjIB?=
 =?us-ascii?Q?MGmROH6UD6ImQ0aWATalA6uIC6LJkSvWB+VUvMlezVSuWTDD9SIokl0u13I5?=
 =?us-ascii?Q?4OU2EJhaSDqDw7zJJc3xLoMtGNlge9r1XLsahBHckdul1gX6n19yH+90zgsg?=
 =?us-ascii?Q?KYNEcsquwW2pfsOYRH55lr3HuZaSAZ4K3EaPf+jfR4gDOpAOgavMNaDCiNaL?=
 =?us-ascii?Q?IhavTDxPLcnRKP6EekgrlBt4d54Unwi4or2p271z8Z8XcYIREvH3dQK+etLP?=
 =?us-ascii?Q?FEDjO5HKeIlNCPJJLRCJxcKdMDyVbG8liQRixuKBYxgrxSbYOWKRWDND6NbX?=
 =?us-ascii?Q?PwdOntNRTw4gF3UPf0/DK/Edzk512S/8o1uuxboGKCcsSZm7yN0QDAyk2NFo?=
 =?us-ascii?Q?iEaXRy1jypU1w0De89eIApGdeTIPD6ygHbejyELwwivRkNaVGpVjGLluRyYa?=
 =?us-ascii?Q?Zae6wLoze6CA/iQUr7xlR4VG33qlifxsxup1JAAgx6iAnAxNSqVtc4VI/1Qi?=
 =?us-ascii?Q?Av0Xa2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHhkOtzJN3G+FCxzpaoXe5iVe1PNQIE3GERYaBcYPBSbCN3rX/NPxcafnXVn?=
 =?us-ascii?Q?wgzrmXTTt6oP0lq3nmaSU1RhAWLKs8pF9ZOAIOVt92NRJU2ByaQSZJNbnZuV?=
 =?us-ascii?Q?NtAoR3CY5DfVersDQHIgoKx6UAq2waqcfY9Q5uXEWN7Xo+qvS71lYPRHDS2u?=
 =?us-ascii?Q?QYSmJ+BZJenKCUrU7jAskxqRFoUR7kUvubM2fFNh/kpafVlYm0c5l/qtbghf?=
 =?us-ascii?Q?hka/oqSlgD8rFBCNFZY/WXRBHtlru7QNl++RwNgxBoqINo/u3f4NeQgn1m3L?=
 =?us-ascii?Q?pboBpMdczjCFkN8dKgcvWzD/bkgcm23h7czVti3n1mD4BNuPlEN1Jv0ubWwg?=
 =?us-ascii?Q?cyMhtFm20+N2ppxzkXqWKPbzpahT69DzR1S2/N973M4m/4Ri8VUvB5o4egwe?=
 =?us-ascii?Q?suYe6SyxdiW3P3CAKViFPf7DSV3RTzN06ce6W99IYy1+s5lk516WlHbxDGK1?=
 =?us-ascii?Q?ACqOmDpeU0lu8a55JDELFaMKbdmU1CzMzHQBGosyJlAtZp86XcRqD6jCXHAt?=
 =?us-ascii?Q?d+DYmih4flMHU6wWOoieUAt5mCBDdCfdGrtW44ifi6+FO76arV/umSIQ9p91?=
 =?us-ascii?Q?pSWqx31R/VJM/Zhyy6Q0Npn6XceMSyQg8zejO7f1zktVMjwzbesIHNVfeA0B?=
 =?us-ascii?Q?4+oeojOINHlxjLdpBhQxz4FOMJe9RWCbO1HX2JwvJMWWvMC1yajLY5Rc+KF2?=
 =?us-ascii?Q?4svrOQv3IzAFXxjFOxoNRZMxgftdCrpIApmMRsKQk3sk6K+206B/2yq1/o9z?=
 =?us-ascii?Q?kbo/56BeHqDTyauXMwqsn55znHPLfp3TQG0HNLHgvoRNxRdi6KnMpMHRTROZ?=
 =?us-ascii?Q?5BlO2Yq/Ng9Otxkc/MOS4RMQq7iIeDbDe59Zfzu2LWFiGUuhMwkpeyzleq+N?=
 =?us-ascii?Q?HjQmID3zC51zjFK49GJhAXIBoYK0CXkZwZ3am54eh3HA474YBeaztlmX0tGY?=
 =?us-ascii?Q?uc8qV7iOrGBt9HvTpVGCz9zC8U2qLV6uHbcLw7IF88AOPj6YCQof+iDW7O+5?=
 =?us-ascii?Q?n9ujQ9Ray/zdmpO6u0U+cISWMZHT2AwEIwRf8w+PKl4KIpYwc5jdQiX3Gowi?=
 =?us-ascii?Q?pciCs6Bu/+qxoq1WGc8AGjB14T70V1Nh9d9n7Sn8css5dQ6fN/K7lx3Hc5bL?=
 =?us-ascii?Q?J6IjsCBlIc+7QD1TQxiS2DyWSLTpoXjcqB9+kLw8KsrmXADWLKxCG1HTRaLX?=
 =?us-ascii?Q?peQ+9XXSu4AHN23Fn0Qozdr6SgX1qr5ZbQmJK2sG/OIr0qz2SUN7ZFDYDkkG?=
 =?us-ascii?Q?ihakUK/7WC2XKPdbY4NoW+aC5oWhuTrt2u/W/PrUzY/XFWenyKvqN6jOvNxS?=
 =?us-ascii?Q?go+uey6Ubw7q58VtKy5Cl+zfnzFIE1Z5x0ClAk3a7zB/GaC/renED0DP4pBD?=
 =?us-ascii?Q?Qgx8pspx/f6AtEsWZ5hdwr0m80/NePCkcSNT8ZiVsYBw7wsw05aOMqk9x3eU?=
 =?us-ascii?Q?2uJn+LO5BTflePNEmGNW9a2oHHElFrV/r91MM8yLqQ34DU02YqJPcF4ofnn6?=
 =?us-ascii?Q?zuYWfVDe56xDz7tZ2+VltZu3qpAVyxJLTUPY8UZvy+aAwHtwbiXJwoUtT96d?=
 =?us-ascii?Q?M7XV4BJUiDX1jWBAYgD2CoMCY1XSkcNelW8e+ZBX?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc9b5f-a6dd-4814-2161-08dcf812dd90
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:49.1849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQnG3uRFnuZwrwmyMkD6E79kTlr2OZ27EWrOpnNRXpydVHs/70nqcXQPq9tUyQWsz8vVLqcPZF52GAHbr+CS6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_ssa_bad_type/README
 | 5 +++++ tests/f_ssa_bad_type/expect.in | 34 +++++++++++++++++++++++++++++
 tests/f_ssa_bad_type/script | 39 ++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.57 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.57 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJH-0000bs-V2
Subject: [f2fs-dev] [RFC PATCH 18/24] tests: add fsck testcase of fixing sum
 footer type
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
 tests/f_ssa_bad_type/README    |  5 +++++
 tests/f_ssa_bad_type/expect.in | 34 +++++++++++++++++++++++++++++
 tests/f_ssa_bad_type/script    | 39 ++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 tests/f_ssa_bad_type/README
 create mode 100644 tests/f_ssa_bad_type/expect.in
 create mode 100644 tests/f_ssa_bad_type/script

diff --git a/tests/f_ssa_bad_type/README b/tests/f_ssa_bad_type/README
new file mode 100644
index 000000000000..358c0c5ab284
--- /dev/null
+++ b/tests/f_ssa_bad_type/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject footer entry_type in the summary block of the blkaddr and change it to NODE
+5. fsck fixes the footer
diff --git a/tests/f_ssa_bad_type/expect.in b/tests/f_ssa_bad_type/expect.in
new file mode 100644
index 000000000000..d0616d8ad3e3
--- /dev/null
+++ b/tests/f_ssa_bad_type/expect.in
@@ -0,0 +1,34 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Summary footer indicates a data segment: _SEGNO_
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
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
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
diff --git a/tests/f_ssa_bad_type/script b/tests/f_ssa_bad_type/script
new file mode 100644
index 000000000000..3f71e1fdfb93
--- /dev/null
+++ b/tests/f_ssa_bad_type/script
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+DESC="ssa block footer with invalid type"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+$INJECT --ssa --blk $blkaddr --mb entry_type --val 1 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
