Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1229006D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFalY-0003EV-Q9;
	Fri, 07 Jun 2024 14:40:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFalX-0003EH-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wFv5CA8hwZ6yyogfoaBEcrpClZLQUBdq4YjBgutZRj4=; b=DSU9JkNPVQ7q7zXS2Yu3yk8vYG
 PyZl3/23QSeCJKQySdmldQxwKUytFPPc5LiT9KNMYQLpKa8gUurvc6G3khak8XXWLnP4nTjsUlQMG
 P65x5tz7/436g1Y22pdhAjEZZPEGVNodnu+fQP0H9DyOErEpwEr/Bu4oVEIwcSGhygX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wFv5CA8hwZ6yyogfoaBEcrpClZLQUBdq4YjBgutZRj4=; b=i9Kwc2Tf1oLDCZ/1Tcrm12kCYP
 z8ZggRrBFwcE4allGSSoJ7sWP/PJRHUksAah3qpxhEbapsgVpvfQ1qQ9g29fRIQZS3MM9keXKRD2i
 +O9B4ZDj652ZNXfLNyFsZV9zGbsOAt78TKCoMIkevv2l4dHGCkBrZbEAQaq0aoc2zNcA=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFalY-0002xj-1r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457Cuf7d021452; Fri, 7 Jun 2024 14:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=wFv5CA8hwZ6yyogfoaBEcrpClZLQUBdq4YjBgutZRj4=;
 b=XQD+bMqIE/jWRRFtUSJi5JaFJ6HvjTTY/JBxAzdaXZVY2QwBVaC3g3GL8FUwlJxg8v5Z
 EsfWnKaeeymQ8QoBzAWD6H52SG6xbSG9kpnFZoTCIj0ZgM4WbzyjeQbzqVqjI344iDnU
 NKqzZQGap3YkdMg8oul2EzaL6CxvZx/4myH44JvmB3mXLTJfcsoIt+qVEw4FCscAco+k
 YAbE8ZFkwUsuL2rYdYPvHyEfJTFDTtLImVpvu5NeqQwoE0uDcH4MWAohRJbCAaWkjzRh
 TGKIwt/F/RVqfF8lH0ENLgNVz6rld0r46m4mqyPZ7pE7Rio6MQSdOw6zTdzWiDwWLP/e +g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrhduf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:08 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DL9r6025127; Fri, 7 Jun 2024 14:40:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrtd2yuq-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2oKgQdzwSydDypmHQbW8zV17pkytlSrC039LHmHCL/jFyDkJ7JrrzSMMq+TTRcvWbqERK+MCahaIEZ724txtzSSF7oyL0vtLwmqgRUtk7+qQl5G1ReN1okqOG6DgeCutJfxGEDx0oP3OZNtywNNgX66iy2qXa7syNovKj8Ep/TiORIFhyA9s80tWzttBgg9bSw2txe1Me0xrZEKu7yCmYNrFbE7GjMydx/hy42N7l76Oj6WUS7K15fM+lKTovA0H3mOgWeg0fgb50b5Rwe1qGIGUKZRMONcJZOCAPnLYjeBdCPlbiQHfGiKPMzbekCKOjcbpKOHNMUNEBCZDh/4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFv5CA8hwZ6yyogfoaBEcrpClZLQUBdq4YjBgutZRj4=;
 b=ncSdTTzL9CzIZrS7pF5dMQc2NcvNMt/7WzFIdbsli+UE6vTQfrbUxmcHmQjF5PCX+3o/MVAYP8uf71Yljj1BbTW0oKcF3a4F6FBBcal+GQaMMDFD2Jhpzqv29vFkozGI3I/49yNGrRZk7zTh0j/6KHePH8YrvRSgKODKd5HbYGTzdRPumKPkwzu7NvnSSTz1eciU+aqzoMMTtgWS7IiDlYT+2HInwvhyOiMfXQ+qGy4XVjw/2RPivT79D0wshIE85rOlzWV/hLWIicmtnKRtgb9Pwsu4MXSfdZ8FIL9RdxhdDoiCvmgMXPprYBfQNIJJWvTufJAacpgAVd2pxi5GLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFv5CA8hwZ6yyogfoaBEcrpClZLQUBdq4YjBgutZRj4=;
 b=DgK9vlDMxn2a/xfKWtVcBpJTejlG/uMcF2vY4UpLN9IALVNhwTPwMFkV9OFzf00cfThZ8OIIwuAp+Ln2FwPH+TP44cCdcuIDemz5ijp7WBgSJPoX0d2bGMHAFOJVI7qW8PddECEVAAvr+4OdkTOLz+5ns8OtVxp2HeVderrDxak=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 14:40:04 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:04 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:01 +0000
Message-Id: <20240607143919.2622319-5-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: BL1PR13CA0450.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::35) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af84841-1472-466c-4e25-08dc86ffb7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5n6OLZh24WDMp4fw4I5chBy7BI45QI/VhFFcB/noO+JELNucbsq2YuI7Q/Yz?=
 =?us-ascii?Q?BvH/prX5zGiSe7sQzQ64IILQOXdEAkMRR1rYjXLtjL9VUcaFOnA3wyidmlIV?=
 =?us-ascii?Q?EYmTPaG9aVpaYWQJm8lLHUh/E8rKUzCFH4zSoB62wlydcAhetbgMH06JdL6r?=
 =?us-ascii?Q?Mu/pzCD+5WnZUSCSMK46U+TjgNqCMH/tXmRlPkD9BKNZC5dEn7YvjA5JB28I?=
 =?us-ascii?Q?41h7dVR3WA8w0JsEUY4aiNoe/uu3QgVZuKSLzZ1FZFUDLrb9soV77qMHi2kC?=
 =?us-ascii?Q?VU3C6RzxUH1kaC2yo+VDn0ArUphkH63E7H12Q76vfAhdYM9CwLbk/PhMNcSd?=
 =?us-ascii?Q?+zv6TSR6ETiOXbQtKEl/46oyVIyIYkQ6C+8bcdnVUsIikFg+tq2OpYVibySA?=
 =?us-ascii?Q?q7sOe6Q2KklESVh00hb8tko9qx00Pwg2LPXm9s+oPxA+aHwDSOrl7AI2jMP4?=
 =?us-ascii?Q?nyR/jcIn67LtC3Rrqr7BXD21ZKk79MAOmQ4Jw4cw2FJSYEqDZ24UKaqHqcxE?=
 =?us-ascii?Q?s2QtODJvQrxUKKRyDDoIJ72Hy8g1pYLRHxoC3o23gSiTZ3OHWVjxDzK5lvAk?=
 =?us-ascii?Q?5XhI09n3JrgUMD1qY67TqDL943ddyJS3Z3Ugm+wXIB3Wlc3KakdfT+Zbq8O8?=
 =?us-ascii?Q?zhtUWfBV8Awz8jwOqGzTIhUfGkSVDtj1B+Xio8cYHwXE0b2E/20iBhgg7+SB?=
 =?us-ascii?Q?pqJRWvY4dLyt4MRoxgwrzSxnMlsQuPiNyTwTZKIw389Krf5t6P4tAUyGrHFe?=
 =?us-ascii?Q?1OndBikrjTNElr3eqWjP02P60dWxgidXPOiurICy4Eo74IBYNQ1k0ELwhpfB?=
 =?us-ascii?Q?sABTnYGf2dljprHUKlY/ZBOoaEAGwlBFypJsjL8AStoO2GkT/eLojy01W2Lt?=
 =?us-ascii?Q?yxKX+EYq4LgBB4Nvs+Ak7McitK+u2r7bSW5GRT3MROI0ian/GjqcDVHdNONJ?=
 =?us-ascii?Q?LzeCxCn+xo+QlH47z2Svnh5QewycTm18KCdT7WyqhtQT9x75kb8HlPEscDMZ?=
 =?us-ascii?Q?+5SqIQXLDpG+us0lICUm6tTCg3sAnoBAXtuTeCdZCL+v8MW4SRJe/heJqkC4?=
 =?us-ascii?Q?CLT41HXWL78VIgDLHmzTS5Nw9iM1RDfmOtV9Dl3nV+60Tn7aE72y5tTVd9J4?=
 =?us-ascii?Q?aEgKtsRODsAt6iB0rXilv+wRbCnMelHmvpopxKH5MtdUEwMgDAJqRKCukXTv?=
 =?us-ascii?Q?EOfDxJHWEX0q5h+9E44MkXk9VIWMtIZIyz1IiFB0oTPX/WRMZ+e8GFUBIY0R?=
 =?us-ascii?Q?IApsgB8Rwqoavn/Pr4jdZHUaGEshpKu/KgAfGGym6fvcmcmiSb24aRihNBDt?=
 =?us-ascii?Q?d8Te9hf/CCe9Hg/bPM3ny6PJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1LWD1cF9TkwpNnvh3oICmP+DJOxTE3av6KKpE3iHCSI0/NeBOH/NkZOKjEVB?=
 =?us-ascii?Q?d0xOvcmJSjE6wtznE6CZHrpXzRAvj5x3H4IUS+p5GJT4QJbnEoCRy5ARMyh1?=
 =?us-ascii?Q?Kj70PCWI9BF4lb0W36Jhkr3mM9Ru//IXa7oYfWlwivUYSkNrvqic3LY2MaXe?=
 =?us-ascii?Q?fe/621gePrHqIIPITMwe+T81me/abmEdnj9pSn71cAu2sjdKBTKjqybjg2GV?=
 =?us-ascii?Q?8I+YKNa82Du+2sOTl19jwrfbys9vlXrWCdwwtO+2JWBDxPjJxDz34Qa6acBz?=
 =?us-ascii?Q?ON3U9irOkHQPhD4Wyp8FGhsMx2qrCK0Jk18QbAwicDNrX3zm2mWmPlCW5Mmx?=
 =?us-ascii?Q?DcrNOOQ1q/sm4NGkYrOUZaRGqsm9ZAi7ZYBD5uor/myvdQVbtHS0a3I6eOAH?=
 =?us-ascii?Q?OQ0bFWmj2Sh/0fqAnn6MaLC8eu6t+JCPgKNk39EgJvCCz6w2f6cm29RfLO90?=
 =?us-ascii?Q?ycfkC1sd4aS5Y3aNngHujYyv0LtcioJ1Hj710H0yrxijzBFOZveMbV0LLyRw?=
 =?us-ascii?Q?SVNXifFfN5Rg81f86eOf3NOaL2awHy/y6Z9ANP//Q5fMORfcxJROasxHtnmR?=
 =?us-ascii?Q?j5p/jV49qjE+1Pc1ok+oCpPy38U68E9N0lFg8OuUPWNBLv6BOqVx0cr8WMmL?=
 =?us-ascii?Q?zsx8bHbNvfknhLzmYS7hMnDOao677PtyDlBlM2rZpe7GGrqNehgDMc7P9CCK?=
 =?us-ascii?Q?M69+Estgi5XFk3Ki4ExX739CYd8RhTVQ+eAXCiPUgyUlLTOMVxNaM0RbWcfp?=
 =?us-ascii?Q?oC7TgK40IJq3r8/qgB6BmyLQSMWxmn08pM7wgaAoam6VFjzX6mcoomK8qXpa?=
 =?us-ascii?Q?J5F3/Jjz3EbJaXjTdMZME+ulOnu5GKSV+YqvdGSv9lHiHE2IF5M0w1o43zcG?=
 =?us-ascii?Q?KCEcodiezHdUSPK2cOG9TVBy9CYd3mSHj2ROWrqMrlNs3GUnUdlbUMTxCNdV?=
 =?us-ascii?Q?UAHXu/7SXiiv7pBfb6VkkyyMtkSUo7ydkZDc09OPU6zm+V4RNBh84b+rP8GT?=
 =?us-ascii?Q?lTugF5VwME1oYFqNlzaQjKNXKzuWMTQDmpV5yzJ3rTZEP0jICmSZOc8z3XcJ?=
 =?us-ascii?Q?XsPb5dYtFng4nFZa+af4qlD66XrmOS7AIAlirTuTZaJP6wFehNZo26H/4tB0?=
 =?us-ascii?Q?jAFgAuBmoA/0HadB+vpQk8KA7U6Hh2XBZ+UPIC3zPeL8+WMsn5qbdcsk77T9?=
 =?us-ascii?Q?VkOOmBLyiMtGSkxQ/g/DAmhTj+qXIMoUj2AiC3ZG8JQVPJoug8yWAqehqmvP?=
 =?us-ascii?Q?nLGwgkM9EkseW7ghbe4iRGgneuWw5xMoLX6eYZgCeZXAAJ0Z0H/dVvufLD9g?=
 =?us-ascii?Q?oxOj2GcpH4xD7SRamFhx2ea2dUsdTd9APoFaMlvVCTZ06f/N1zst8r6U6dVw?=
 =?us-ascii?Q?ZN+SirTwkZ8XgsjGmcA3DZha0in7lIZpgrGhTnmc81NZHF3ziPj0mKurb7c+?=
 =?us-ascii?Q?20ejPBt17zoDqyrD7IGbcMvRm9hXYOI516Lixh86ZiLjEGbKdRb5cXMIkuc3?=
 =?us-ascii?Q?H2OuhEJFlIAR5o+fdCraLXVO+2YizAssPpvxtd0H5Rgt29clFsC8vFvqhH9n?=
 =?us-ascii?Q?SnpgEYdUZD1wh4jK0zgW7VYUDdW/bKnmsMQxDlU5405cMxEFrTpu8TT/VZsT?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kGhmk2TVXwkcZjDZtVi5SW5XG+HncxiZeyNpTnQJq8OjD6lQ/dURRpWu18NB3Og8ViHk4ZkPoZHLK3nFCpP7Xt1jT+AVwD59zzYmRIIlLr+qug9B4MzZ8F9/u5ZkiNv0aq+sqWc6xauFCczvuIRJr35V8MdDEWzW9sKjs4ynuEEzxh+gA20aix/Wr8AHW5ZX7sgorxRByOgiiCTEpEqFYS7NoF/boNy4QkFYiGh1SI22CvwkXoNLYhR7qFqG+aYjJrrBzemjvBcE+v6HNbB7qP18+AyV7h/5KXz/aG1v+r+G/gN3W8OTmn1AsOJamr4IsrF0sYoaZluqcJBObkGZk5hynYcRvsQ+v3Mp+9n0HR7mjraYu02POSHSS1aSpPNbsI7D3JKQsjYZs64j2mIAFETnXesQJMZhLHtzQCEqe5nVPof+x26+0NVjON9AgGLMzTDyMTmw7On2EVeGAxRAFOnoeQ9U68i86DfZduf/9wXmSPPF0OZxHDR7XTNLvjjr+8ts/0jW8XzC0O9JLqY3BpA2HW9BrVQldw8YtNkHeZQWifqFzpqshP5FWHH/lh+kqPK3EUojUMwAFbAvz91ZvxBCyok7BW+tqBFT4JpyfgA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af84841-1472-466c-4e25-08dc86ffb7fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:04.2931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbh4F7WQE7xWmtEbo32NgGNczbBkCxtKQ9AYUxmsEA7jj1Hucr4GFMl89IGeZgxATUFWSraGNDFKH4aDRUCx2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-GUID: ED30YKw42EUjFlg52iIVMLRip9J_pA6M
X-Proofpoint-ORIG-GUID: ED30YKw42EUjFlg52iIVMLRip9J_pA6M
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Dave Chinner <dchinner@redhat.com> When we are near
 ENOSPC and don't have enough free space for an args->maxlen allocation,
 xfs_alloc_space_available()
 will trim args->maxlen to equal the available space. However, this function
 has onl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.165.32 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFalY-0002xj-1r
Subject: [f2fs-dev] [PATCH v4 04/22] xfs: only allow minlen allocations when
 near ENOSPC
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: gfs2@lists.linux.dev, catherine.hoang@oracle.com, agruenba@redhat.com,
 martin.petersen@oracle.com, ritesh.list@gmail.com, miklos@szeredi.hu,
 John Garry <john.g.garry@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 mcgrof@kernel.org, mikulas@artax.karlin.mff.cuni.cz,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Dave Chinner <dchinner@redhat.com>

When we are near ENOSPC and don't have enough free
space for an args->maxlen allocation, xfs_alloc_space_available()
will trim args->maxlen to equal the available space. However, this
function has only checked that there is enough contiguous free space
for an aligned args->minlen allocation to succeed. Hence there is no
guarantee that an args->maxlen allocation will succeed, nor that the
available space will allow for correct alignment of an args->maxlen
allocation.

Further, by trimming args->maxlen arbitrarily, it breaks an
assumption made in xfs_alloc_fix_len() that if the caller wants
aligned allocation, then args->maxlen will be set to an aligned
value. It then skips the tail alignment and so we end up with
extents that aren't aligned to extent size hint boundaries as we
approach ENOSPC.

To avoid this problem, don't reduce args->maxlen by some random,
arbitrary amount. If args->maxlen is too large for the available
space, reduce the allocation to a minlen allocation as we know we
have contiguous free space available for this to succeed and always
be correctly aligned.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/libxfs/xfs_alloc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
index 6c55a6e88eba..5855a21d4864 100644
--- a/fs/xfs/libxfs/xfs_alloc.c
+++ b/fs/xfs/libxfs/xfs_alloc.c
@@ -2409,14 +2409,23 @@ xfs_alloc_space_available(
 	if (available < (int)max(args->total, alloc_len))
 		return false;
 
+	if (flags & XFS_ALLOC_FLAG_CHECK)
+		return true;
+
 	/*
-	 * Clamp maxlen to the amount of free space available for the actual
-	 * extent allocation.
+	 * If we can't do a maxlen allocation, then we must reduce the size of
+	 * the allocation to match the available free space. We know how big
+	 * the largest contiguous free space we can allocate is, so that's our
+	 * upper bound. However, we don't exaclty know what alignment/size
+	 * constraints have been placed on the allocation, so we can't
+	 * arbitrarily select some new max size. Hence make this a minlen
+	 * allocation as we know that will definitely succeed and match the
+	 * callers alignment constraints.
 	 */
-	if (available < (int)args->maxlen && !(flags & XFS_ALLOC_FLAG_CHECK)) {
-		args->maxlen = available;
+	alloc_len = args->maxlen + (args->alignment - 1) + args->minalignslop;
+	if (longest < alloc_len) {
+		args->maxlen = args->minlen;
 		ASSERT(args->maxlen > 0);
-		ASSERT(args->maxlen >= args->minlen);
 	}
 
 	return true;
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
