Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282991B4A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Ta-0005Tw-U4;
	Fri, 28 Jun 2024 01:32:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0TZ-0005To-7s
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqJX3NrNKFWpw1fBmrcsQ5XW4msSjsLo8XILqVQ2G94=; b=PJLwIZb7vUf6xgqFCCo+p44k2d
 PIyfDC+DWIZMYe3i4OFYNntYT4cTIfBhNzhY1+NYIczF/pqX9RuTGg2aNawSW7yoXqYgfur3XO56v
 uF5Oe2FBtwEFHfnfGIez68HLXIQuhjn+zKklAfwUqoOsMu2OiSV0JbFCLUKwQRw3qAkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oqJX3NrNKFWpw1fBmrcsQ5XW4msSjsLo8XILqVQ2G94=; b=D4TUFoYi5pCTigTjfCuH+dG5g3
 Bcj+x6AUokp7Ph9N2SUXsRTPoeDoHMr4HM+PnCv12e6PU5AtsC1qdmzW5/UwPWocfmrjlzR6UM44+
 I6OPH9L2DD9ylISz9zeVqTcKwToJrih9dHIigcb1zXhpf04yDoXrjtNwBLinN0nTYB/o=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Ta-0006JV-81 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfbUI2AJQjJBG8KXFxhyeVpYIWA4LZ9v64CgzmNLidXgbkHCIi3KEyjlXqNMF1tnVojlkq/QNPmejNRlDTOaeh60yNG9BzMuG9+s9HQdrujwuYLaFiC9dK0s6CkAFhC7qKGoU498XndpWInFPd2mxuEMEL9A4Dsh8l4UhGdwYlZNuklSrWoog358/ny1uctxEpC9p8X4oNQiC4+Ff31CzpTaEm9CZMDTrla6N7YI5J41NJGPMjmEZTD4ze/AIYDB0Fs4Xx0aDrDGKA8tKAMVUOMeK4/SsEwoIONygDkJQVGQXZwK8y/VZKjxby8dgL8ZRV2TD4ZMUOl4JG5lkMrORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqJX3NrNKFWpw1fBmrcsQ5XW4msSjsLo8XILqVQ2G94=;
 b=KGi3XSYUrq1zhHjvv8FXDMr+QF5PcIYRKnP8Kmwv0g9jKKiwO+N4KxLdhCg9cpl74eUKthN3+otF1qg+VrxsfHPdg5qBqRQ6ObmrVh1DuNg9z/cZzuxbmCMBCg0MKmWF1YLJKoZWmElAvwTl4EFwI/q469Gkh2NylFdAzGxWLGcBI5pjvVXzLmOurY1Z+pKmzJLIfQ2BeDyRRZ522dO4G0f3l5f+bcG9y7c3vBqDFc9KOPCGuwGP41O+ic7EcQ4XUjxZnyhHBNnRR71g3+Wg28TLaxjFtMzc3Q05SzC2WsnDqxDYG5evqqmSGiAqDsPNzYAYZLmv36/wJNRJmxH7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqJX3NrNKFWpw1fBmrcsQ5XW4msSjsLo8XILqVQ2G94=;
 b=PjXJUbgWTItKJP6HIFfW0t2Uu9oAAmquMRFQzI5m56MIZhKLq/xliCQHyvnele0gknVuDQDE2AFH3qO5csRP5QdzzqnDRDq1ex30PKge8pKBsF9rd/4NjtVx2ONEyzBwfHe5x6IQTw1gDBqkrH/xleHXUKI9Jh38h8jj9MwAo84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:21 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:21 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:34 +0800
Message-Id: <20240628013140.2444209-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 1651d81c-773f-4a83-2d7e-08dc971227fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?udGs/gQwCheLuuMwqvnB5XYH9BddgGdzdzIAH5Z+hTZW5RRVBJOHgv6Tr84u?=
 =?us-ascii?Q?vQw3etaYS+3Jwvj36XrQd0QA+FUFjvEO0kWy9nEcXuFIGXQfbTf/VikeAdb0?=
 =?us-ascii?Q?3ab32l4k6TpHCpmrEfd6HafBIAFaes4uj1coYAtZOO9C7YbLSlujeZQooEeR?=
 =?us-ascii?Q?10rrF1lAoOamukikvDEZ2shn+ODILs0GOTP3vbdeFbaqyxU5MSs7jN015NpH?=
 =?us-ascii?Q?Fzo3G+8m+v21ol81NrsKBEx6gFFGSHgE7YPGvvnjmVy2P3yBcTc6Qnc67y+m?=
 =?us-ascii?Q?xQcG1U6tILFSYud2nb9IjfJq4exp5kEotJMu3EuOWKMiEmi2ZuJk97tRv9b/?=
 =?us-ascii?Q?MeshHlh+Isbo9LT2gye3aRNpLmKfPtJKsoWBD3cGBK73hV4rh1XpTOrHp0nL?=
 =?us-ascii?Q?j94bi5Bl5WrvmgMrxnXHHOiDelJS6DJ72rxMhjbleYSrO/V3IM7brXHd1Gc4?=
 =?us-ascii?Q?5prItf8lLKTpGojGntFTzyadGcoO0nNUsMN4HyKBcU21TbVQqG9/FovioZef?=
 =?us-ascii?Q?E97qPckgV2AI4iagJN/v3sXAuhGn1gzT8eKPCz/c0yCUs8RZDqaPClgFwQ/Z?=
 =?us-ascii?Q?lY4uGGjy1EmfH7YEEyeXkFfrRcs/753mMx+4F7oZ36QeVY8enMxBOyBVsTsG?=
 =?us-ascii?Q?7mi35+56csZoiYz/BN36C/5XhEbJP3fUt44+hapQNwQ3o/wyD3oCG9m0UhMA?=
 =?us-ascii?Q?xwI795xSOKoEgC5cWTMlc0HBE8NBjiafl8pSBXxqd6/YL8q0oa3GRwz7Z4Tg?=
 =?us-ascii?Q?rWA+Nn/dS7FprgRZlq/t6kBrN8Jrdu3a632VmgixMIsrqudNiwh71WKx34oQ?=
 =?us-ascii?Q?x2e/B9Hx4QrcmvMRRb6i0Kd8ImECP+D+p7xRnMT7UIOTMrtkXA3eb7U/lvfp?=
 =?us-ascii?Q?z67803d08F5HhU535J8zBlb6z/DIyYTSFrrAK0Hi7iuVKmUn0pms2SM2Lb6H?=
 =?us-ascii?Q?pgoHDdCelYya0NOSLc2FqfVmipNv07B2aez4EOWlYYyMLHU6vDlKaeB53LhH?=
 =?us-ascii?Q?X2KjAtWGQbSeLG9oUYKzLDdteCkTstgf+TwU8ES4O0oidDxJbvKRy/pxvFa5?=
 =?us-ascii?Q?m6KklfTJk5xuvODiy335iZ6RkEuojSUFVzO5yw8qQ9XCLM5LoKHkYFCgtVOX?=
 =?us-ascii?Q?ENS9+1kiGwJnkBuXnGWUslmdQW8HQCHDif8PgrA0SYgHRoa3CaeEqE0MoMzs?=
 =?us-ascii?Q?bv/hr55dHZwfM+HFUS+z9El5y52TFimSN1CFwC0C3IXjR66Nh7A37jkt4337?=
 =?us-ascii?Q?3PEt8B0q0EXv8aQCb1ClO7tDXke6eqcyWHJY/XlJpfO2v+YngJ2FsoDH/Oq9?=
 =?us-ascii?Q?CJIwhzay85qmVt5cSajRiZrpxmHAYtIjP/CZGSOL+1/KH+z8AsGSI9Uz0+W2?=
 =?us-ascii?Q?YIfTDugEIOGAlJnVdIcMVTcALGczfekGGjtTEHch2A6ro7zM+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnL6iAoFTy4C6T0KfIoRbGRsp7eiFjBDRV7gMSLdW3vDTLJvgNQb/dJKSJXZ?=
 =?us-ascii?Q?t5JmHzQfKgwKIM4Ro9TOiiyjU3IWpbJs3ux1Y4asIktIiKO6KKFIFeQKIDMU?=
 =?us-ascii?Q?l5kdC4rPi2p+p2a+rRqK4Pp8/F84Sn1g2QN8Gjr6b9/IXSFoa78nYZ7ae2cJ?=
 =?us-ascii?Q?ZXTdMGKpNwhPbTkQ/IiHAEVla1N/41ukvsnJdCQXNf2Ux6WpFtl8ZbIxvNFQ?=
 =?us-ascii?Q?8htjeQ11kW0wJQHwL3Q7E7Qt3qk9tLOoZz1D+Xjux7qbIMFQ+/ibE4BmUqLs?=
 =?us-ascii?Q?/nMgA8aLUCAt29i/ZwLauMW3SF/m2VdV6YbrQAX/4TGxB6Sc6F6m7wrsPpVA?=
 =?us-ascii?Q?nnyRalle96K7H5DOTNnQsqVk8FV/0iqR2lUvdYd8l+ELJ0vcIupTSU6TqkqM?=
 =?us-ascii?Q?u1VHptsYNFQaJODIqNQMY/PFJKoCVLIgyeEhghxKPwkX3aJ0MkSyWpJx+jg1?=
 =?us-ascii?Q?UHMyzmodYNXTpnDOsDdvNcTKxgdiMo3Iat4TByB1k/Tf/BtzZUOIq1n95Rhg?=
 =?us-ascii?Q?0oJ5MjEnyj79AO4H2euZ2VBjun6eGaHbQQ0jsiZRxPSeXfWgGNiLr5ZYapMb?=
 =?us-ascii?Q?kQt9lSkBC9UBf38pVr1/pNPs3hchchxg3DMVl9w1W1zs4YUSdgU7kd9eA1IZ?=
 =?us-ascii?Q?LfViGnDENEj4rbTwkj+x9q9BxJCgc5Y1xvEZTPg8MH9goA6u5j44GCcZelcM?=
 =?us-ascii?Q?Gr6VrgU/Mzm+NwPUNuZmPZKsy/6BNwVqWYG5GQX5EyP6r0B96MnGMYwbyWzi?=
 =?us-ascii?Q?O/LYvVVOfllfV7a6Kr5Gc3y58JgODfm4lsMVc2ZJY4r0W+Bae6+EmBBNk8Wx?=
 =?us-ascii?Q?fjuqLBHhLpAaOKZ4GosU7Ze1jx1ucgy8hfvd1Tj/nHa+k8jgnu7qTsr0eKI2?=
 =?us-ascii?Q?ElSV/0UV4uXjMHuqmoxvVgVFNtzWrfcciFs9pZGIHEUv6TtrvKp2cj2FX0zh?=
 =?us-ascii?Q?H/wcXeQNTsgm1s+aXhpl0f3Bp2x6t0YBp5Y2YtuzWWHhz4gUcyYgU08qLRpC?=
 =?us-ascii?Q?K5BfaecIA5HzjkrsUXtrmcYPgm6HnWsku4xmDAsVgLqauqlgGaF73VVSxnNN?=
 =?us-ascii?Q?eBAneY9gS4YfTGVw0cUrEpLqt5ygPXY/M4hD8/ZIazdjuw7ts7/wQ5WaznOU?=
 =?us-ascii?Q?Gv3ZxVqW3Kthz9EAZj2Bb7uN/YccebBvPpFAfpRWoRZJp+Y3JT9GpKOFFTeh?=
 =?us-ascii?Q?8pm4jak373Zx+5E/S9F6/Q8ZmAMGRU+hBVZhi8q6gJrwhB8RZoHsSd9P084V?=
 =?us-ascii?Q?wYVsakaeJ9nH45nprLpEH+uZcfzsyrlIUbe30cwy5MHY+eBLY6FFnstGskZU?=
 =?us-ascii?Q?fZUGslXYOoLWEz7SYCpa/vZzFE3G2aQWO4yh67XaYZdwW7POU77Un5T8hmKQ?=
 =?us-ascii?Q?xOkGTFpqG4HPfsYKzeJcTE16VwUtppl1ovmJ4YFCVEQdQiXPDHZ/r3eXpl0q?=
 =?us-ascii?Q?Rg6Q/u+mtluh1k4I+7m4RtM+fR9siP0f5djUumoHNV9aRqKBx+it6J4XEPMW?=
 =?us-ascii?Q?MLzxWR7BBHD0l1ujOLICZRU9ic7+SBybiguus4XZEMCGQ6tP0NqJAzYxnieJ?=
 =?us-ascii?Q?GUzE8es04MA0TMyxk6L54wiwmeGKJpawwpzbj2iS?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1651d81c-773f-4a83-2d7e-08dc971227fa
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:21.8478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIXh4Q78cl1bOibyfiVH1/ja5+qFSggEGeJ+++0ZF1dbq90pVORb5FubFyN/KxY9f++BF31hKw4Dr8x8rtLIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting checkpoint. To archive this,
 a helper write_raw_cp_blocks() is added to write the first and last blocks
 of a specific cp. And print_ckpt_info() is exported to show new che [...]
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
 [40.107.117.44 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Ta-0006JV-81
Subject: [f2fs-dev] [RFC PATCH v2 04/10] inject.f2fs: add cp injection
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

This patch enables injecting checkpoint. To archive this, a helper
write_raw_cp_blocks() is added to write the first and last blocks
of a specific cp. And print_ckpt_info() is exported to show new
checkpoint info.

The meanings of options are:
 * cp: means cp is injected, its argument chooses which cp pack to be
       injected, where 0 means the current valid cp is choosen
       automatically.

The members could be injected in cp contains:
 * checkpoint_ver: checkpoint version
 * ckpt_flags: checkpoint flags
 * cur_node_segno: cur_node_segno array
 * cur_node_blkoff: cur_node_blkoff array
 * cur_data_segno: cur_data_segno array
 * cur_data_blkoff: cur_data_blkoff array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h   |   3 ++
 fsck/inject.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 fsck/main.c   |   1 +
 fsck/mount.c  |  26 +++++++++++
 5 files changed, 156 insertions(+)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 4ca75b3..02986ef 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -236,12 +236,15 @@ extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
+extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
+			struct f2fs_checkpoint *cp, int which);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
 			struct f2fs_node *);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
+extern void print_ckpt_info(struct f2fs_sb_info *);
 extern bool is_checkpoint_stop(struct f2fs_super_block *, bool);
 extern bool is_inconsistent_error(struct f2fs_super_block *);
 extern pgoff_t current_nat_addr(struct f2fs_sb_info *, nid_t, int *);
diff --git a/fsck/inject.c b/fsck/inject.c
index 21dae42..6899dbe 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -23,6 +23,7 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
+	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -42,6 +43,22 @@ static void inject_sb_usage(void)
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
+static void inject_cp_usage(void)
+{
+	MSG(0, "inject.f2fs --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "[cp]:\n");
+	MSG(0, "  0: auto select the current cp pack\n");
+	MSG(0, "  1: select the first cp pack\n");
+	MSG(0, "  2: select the second cp pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  checkpoint_ver: inject checkpoint_ver\n");
+	MSG(0, "  ckpt_flags: inject ckpt_flags\n");
+	MSG(0, "  cur_node_segno: inject cur_node_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
+	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -54,6 +71,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"val", required_argument, 0, 4},
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
+		{"cp", required_argument, 0, 7},
 		{0, 0, 0, 0}
 	};
 
@@ -91,6 +109,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
 			break;
+		case 7:
+			opt->cp = atoi(optarg);
+			if (opt->cp < 0 || opt->cp > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -105,6 +129,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			if (opt->sb >= 0) {
 				inject_sb_usage();
 				exit(0);
+			} else if (opt->cp >= 0) {
+				inject_cp_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -184,6 +211,102 @@ out:
 	return ret;
 }
 
+static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	char *buf = NULL;
+	int ret = 0;
+
+	if (opt->cp == 0)
+		opt->cp = sbi->cur_cp;
+
+	if (opt->cp != sbi->cur_cp) {
+		struct f2fs_super_block *sb = sbi->raw_super;
+		block_t cp_addr;
+
+		buf = calloc(1, F2FS_BLKSIZE);
+		ASSERT(buf != NULL);
+
+		cp_addr = get_sb(cp_blkaddr);
+		if (opt->cp == 2)
+			cp_addr += 1 << get_sb(log_blocks_per_seg);
+		ret = dev_read_block(buf, cp_addr);
+		ASSERT(ret >= 0);
+
+		cp = (struct f2fs_checkpoint *)buf;
+		sbi->ckpt = cp;
+		sbi->cur_cp = opt->cp;
+	} else {
+		cp = cur_cp;
+	}
+
+	if (!strcmp(opt->mb, "checkpoint_ver")) {
+		MSG(0, "Info: inject checkpoint_ver of cp %d: 0x%llx -> 0x%lx\n",
+		    opt->cp, get_cp(checkpoint_ver), (u64)opt->val);
+		set_cp(checkpoint_ver, (u64)opt->val);
+	} else if (!strcmp(opt->mb, "ckpt_flags")) {
+		MSG(0, "Info: inject ckpt_flags of cp %d: 0x%x -> 0x%x\n",
+		    opt->cp, get_cp(ckpt_flags), (u32)opt->val);
+		set_cp(ckpt_flags, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_segno")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_node_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_node_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_node_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_blkoff[opt->idx]),
+		    (u16)opt->val);
+		set_cp(cur_node_blkoff[opt->idx], (u16)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_segno")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_data_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_data_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_data_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
+		    (u16)opt->val);
+		set_cp(cur_data_blkoff[opt->idx], (u16)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_ckpt_info(sbi);
+	write_raw_cp_blocks(sbi, cp, opt->cp);
+
+out:
+	free(buf);
+	sbi->ckpt = cur_cp;
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -191,6 +314,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
+	else if (opt->cp >= 0)
+		ret = inject_cp(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c7d0e33..907309f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,6 +25,7 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	int sb;			/* which sb */
+	int cp;			/* which cp */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index d6a7a47..0318873 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -819,6 +819,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #ifdef WITH_INJECT
 		static struct inject_option inject_opt = {
 			.sb = -1,
+			.cp = -1,
 			.idx = -1,
 		};
 
diff --git a/fsck/mount.c b/fsck/mount.c
index 8524335..ae2a330 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3426,6 +3426,32 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 	write_checkpoint(sbi);
 }
 
+void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
+			 struct f2fs_checkpoint *cp, int which)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	uint32_t crc;
+	block_t cp_blkaddr;
+	int ret;
+
+	crc = f2fs_checkpoint_chksum(cp);
+	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
+							cpu_to_le32(crc);
+
+	cp_blkaddr = get_sb(cp_blkaddr);
+	if (which == 2)
+		cp_blkaddr += 1 << get_sb(log_blocks_per_seg);
+
+	/* write the first cp block in this CP pack */
+	ret = dev_write_block(cp, cp_blkaddr);
+	ASSERT(ret >= 0);
+
+	/* write the second cp block in this CP pack */
+	cp_blkaddr += get_cp(cp_pack_total_block_count) - 1;
+	ret = dev_write_block(cp, cp_blkaddr);
+	ASSERT(ret >= 0);
+}
+
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
