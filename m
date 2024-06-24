Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B752914F4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 15:56:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkB9-00028E-SM;
	Mon, 24 Jun 2024 13:56:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkB8-000283-RP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wkuJD25xSiCNTgTv3BS6OHvzgd1UyabDSlTEuLqjYP8=; b=QViom5a9nyeLo4mp8hkkFgIymE
 BZW5sYSnNNenUiodUcBIK9+zJJYEalQ7OHSbesVLPYUYr8sQL4yUpE90LNfCko8SWXoz4rlgAQc/9
 piiTqWawLxGoz53RMC/pNAWHAAyvMteaZhRnsz6bBFg6Vv26hzMB/woHnUeIEtlVGGoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wkuJD25xSiCNTgTv3BS6OHvzgd1UyabDSlTEuLqjYP8=; b=gwnqfhvWtOMCbFWtL5iNs2XVFD
 qQ/jb3ts5ItTo7X/v3sY7y9xXZ4y5aLPA07j6SZdmY7LeqMJ5mUYZaMG3ka9aEqEUP4O1f11eNswi
 3NE015jOI1wDGoOc6DAmAprZAbW3NCpa8f3kq2IVvFIsCygYDrqkfP9AporkgT11inS4=;
Received: from mail-sgaapc01on2056.outbound.protection.outlook.com
 ([40.107.215.56] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkB8-0001AS-BB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaCjxMhBXv7IwLN+qvHDAOd7TB32dWZOnTw4NeGY8ObrrenwjnBdzTlCre0pNabGKw6weHnSaqmukBEBsVWF7yhPUhJCb72j5J5jBp8Ulwno93moqIX3Q1ysv614EBabczpKJvOlJKxCcrJPhLQk/mzg4DP15SMZCcvO94+iyVtRB4/KBCz5XEFOaR7Q+AHgZFQ2fdEVOJRlId9V/As59FUI6r//x1N/apOsv27+EU+t6p0hc3KCpZi7XfPkzCWzg06LpoIuQd4VfqC3wYYKthqb+IQsme3DyflTMwds6fFumEI43ux+/BuaJAGKomlOcXXfDoEB0S7qdAZAarTWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkuJD25xSiCNTgTv3BS6OHvzgd1UyabDSlTEuLqjYP8=;
 b=hjz38vUgyEaJ4SilBHMaPkRePR/lVEjRRYTiQlle4G1AbTSZlMFe5V1lnw466jMdm03raH3sRi7zs17+vFq5wXhLFfVBLWN9dDUro9XQsLVSjNy1jbrcdxHpoOJHfbk4vcGRuh8LQm6pxhyZ6dpDrvaZV5FNtdftLXPdOXXjuFDQvwOOIVvrTi8sCKK4Ta18slA0+V+nahR9yXOXhaJHfELfTnXIUEW4WE54EjfTojNIPiu+nxPkmkECenPTQGGAwVZwx9OO9Q0vPcmgF+wvOT2P/nqQnhTbNv24Qr6aFD0GYZ8qO9nBlm90FztR7tYhmtrqCM6uGxYOxzdMOMvqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkuJD25xSiCNTgTv3BS6OHvzgd1UyabDSlTEuLqjYP8=;
 b=c5uURhg8bVe6MFQlzyXz0qlBtHJXbRLAdOo+Nc8V9VRPZSqrdMGwiw7wSNVCQgUsQEjMCdePhLOGX0eXB+ED/+BOk5WZn+nvyLZ7mDpOeFJs9aRzJYs+UALd4o+mnOJLgEhVtIs4pevbq0vnbBL/U+o4IV32V7ycm4A9JyI44vQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SI2PR02MB6004.apcprd02.prod.outlook.com (2603:1096:4:1eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34; Mon, 24 Jun
 2024 13:56:03 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:56:03 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:31 +0800
Message-Id: <20240624135532.3330136-9-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SI2PR02MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b61b9ee-2528-4753-393d-08dc9455631d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|52116011|1800799021|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0HL1l1STOzzQgf9qbtpNDEM+qWia39hRtI3bz/r2SX44UZMXonnVk3wjaFZN?=
 =?us-ascii?Q?Q3iZlhv/s1OrHX/axwp6mZcZDI3VTd+iUUKtAlhct0adHVXmknnhx+D350Gh?=
 =?us-ascii?Q?W2SvgNcYgzm+Is5KzmviQn3bQfXy3FAG/e5cH+4CVVe8IQGHTlhJF2+P6Utb?=
 =?us-ascii?Q?OlROuZIyH40ELx5/5kxEHJDN/98a6FDGNKSD1lruoheAmLluOaaoVLBiYzLP?=
 =?us-ascii?Q?ZAxq0sfIc+Zlmu9skwPYO0fpJkXaioac3MbUptNjOZIEgFf2YKX7oCjOvRQN?=
 =?us-ascii?Q?0FeFUWOrr0EDaFpWJ8g5ktVt6wdD/KQH+o0ucmpW/edu5UMmm4ASGZFjI4yb?=
 =?us-ascii?Q?E+epCxxIpdNaYH9IkBOPGF/ny2PgqADfYA9GkKD9fvxN8TG6sjmMK3cEVhk7?=
 =?us-ascii?Q?WsCw2fQB3DlNXvW+ZGKNT/67vsdIaO1zcatlugIdoQPPYFUgrir+mflyeToH?=
 =?us-ascii?Q?WufJm2D9Q9TOhWt7kuX4dnnc+wRUYE4bSEe4RrWbr2EhyWx2WAu+xWNVMeH4?=
 =?us-ascii?Q?YyaXUCyePanKeJrC+cmg5a6QXhNSUF0k43+5AWdW9z/qfOQH+1QSz4P6yDzv?=
 =?us-ascii?Q?GyXo9hVOn4qMWf/ts+ls0EY1GJXtSJbgLoZSfHgzKMZXN14HsTgMekLpo5Ak?=
 =?us-ascii?Q?zYb8Zg6v1G48V9NNNfRCQP8Ix8lxc7U89cvpirV8GLo1TMRLINsxUBJLzXn2?=
 =?us-ascii?Q?uQaFcrYjt507IC/Y1w/lZ/F3y1v5qdQwRbZoy7S2NBMhsbpw/SDXw7gufjXy?=
 =?us-ascii?Q?UWy/BKr/sKE1tKDQ3diRSz+Hff29cdmMK1wo1Xrd1koVrTnXXFZoL1pui4Wn?=
 =?us-ascii?Q?Mk6uMcPjBdewJWO/vP5EiLD8Zj0+B1KYHYw2fnrxmekoe78C51Lt5rP3vGKO?=
 =?us-ascii?Q?2wFZUJzNyV8gZIg8xlx/xHT7wNZsEpKlCco4liY7Oep5R/JEvu/8ABZefENs?=
 =?us-ascii?Q?UbmexqFdFnlWKMHwxIj5vAcFzP5bgIv4nplDk94WNqxcK1n4Rc722Ze3CBtG?=
 =?us-ascii?Q?4AO4twIPNlwBC0XSV789rnETm4AZk2LDQwq4E+jTFwnJ/JPlJfT+CAgnqtEN?=
 =?us-ascii?Q?WnCFL/kZasyiv4JJOFDej6U/ZtbdCuwWRSZ/jeG7jTGnYggffAX50zXFBGg4?=
 =?us-ascii?Q?t8Zf5JoIPTwEWCNoIEfenozVQpnjKuhQASMnycSfJ4X6HI7LDWQy7i9IPSxQ?=
 =?us-ascii?Q?fW/8CXoRnkCGw/wTV1e9U2psxZXZPo19OtVGb0xx8pfPtf4rbSbXLa2gkQsL?=
 =?us-ascii?Q?bC99Kc/Z8K10d0vXHI08czv5KPdPbP3a5SpiHlg9cVK3dPPRK3Qs8HuMsD3Y?=
 =?us-ascii?Q?+yjbo5yLOLXXJAFpJQTdisjSHRLW30N1k7iiiX9orHyl7I0I7Plwav44WO6d?=
 =?us-ascii?Q?PNkaul4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(52116011)(1800799021)(366013)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WcwQWBNsk5Atg0jMvsS0VmNPNSw1iJb2NTNGeSHDkPiPj2qI5CYxhkhtNxmH?=
 =?us-ascii?Q?ALnvwra42N6MvUewOM5cVDZyW6kqUiP6GQKVNffXDX+Hp3W5S56U5R8Kip7n?=
 =?us-ascii?Q?tVMnj6XaAtqf/5CUgltQwbgPTCupR3OoI60+xzvkKBX+BQbsUT0RiCrC5TEk?=
 =?us-ascii?Q?J7ZJ7putnte9h+TSxtIqeKRJc4KlNDMt68N9C1InDke/8hIU7Z1DC6pWqScQ?=
 =?us-ascii?Q?hmayjcLN+VTIRXiAncXbzEOhzN0xfFhxacf2XXm+jY1XzBtFdzuoWW4kmcDp?=
 =?us-ascii?Q?I8Vmcwp8orkJqpL5Ccnp64n06vK8S26X13IDMJEovVR3Tw1Z3l/sV/woRD0c?=
 =?us-ascii?Q?8/Aehi9zXiR1AT0ZJ9XcC77fqL8c7b0wLRsC9pljyymG2wFqSRtAwvmXKMVw?=
 =?us-ascii?Q?sFgFlT1w5gD7IqhueDQxMRrv4f7TT/kv7aFnf2+YF4dpK7/r0gewLmxgLVtr?=
 =?us-ascii?Q?gnsDs4nNuJRpIMgk6vtyGxbpVqfD2vJZicENqTHBNbG9MpRgRi2XxLhA1kZv?=
 =?us-ascii?Q?B3dlfzwRImvkstywKoaQ1X5WN25MYUgVL8DQ+wSibDq0GFzApwtW5C7q34pV?=
 =?us-ascii?Q?GjVOoQ79ECYq/Y0Vr+JpquoiFclp8X373gbIWEXhmIvNorBBuS5X6iByUvjD?=
 =?us-ascii?Q?X3My1VTMB5K/9VNpq30Zj+Yb/JDxp46PaJfAc4mI1ulTnCb8k0WLb+JzVvAF?=
 =?us-ascii?Q?KGQdcMavMidIN3YO2w4MAyI6riNrP0DKlqsIRUg9N2zCa1dchyutUUsRQCpz?=
 =?us-ascii?Q?XZ/wl9Jqv+ruxnKeaBEyFrM6g8psICE75REITpSZ3kTFbBgj1MW1xP0AfbYO?=
 =?us-ascii?Q?GsAGEogitowK67wc7HgCoErILxfBMcwh/OZLfDBqqoLBXighN+wzcSuLS4e/?=
 =?us-ascii?Q?liG/4U/0UMLALDyQxlPPRXbNAR05D+LZ4Qi3Y/O+arl3OsaAMZNMaapj3wmi?=
 =?us-ascii?Q?ic28VvWoSBsABVGCma8qu4j0lU0BW216Ecrr1ycdl7sqXOMGOtH8VaHlAg6V?=
 =?us-ascii?Q?JL/LyRv/ifxTOWqAAy9PL/rDaQKlv0MBuuAt3AuF5/ItmIFuh2Bg5avYV2xB?=
 =?us-ascii?Q?jIh5vM2Qb9znaZqG0Eu/CiO/1MjKfk2XsddFo6jtzFCbgCG8bDhrjaxuX8fn?=
 =?us-ascii?Q?yl9qw1Sh8477mezHcNNqmiaaskEbEiqZ1rf4hdT584bhlbol5iwmvb+LrWwV?=
 =?us-ascii?Q?9Pj6Pf4/VV24FLFQkjc5nfL7uQMDYoIoR/WCjRzW2YJ4NA/X1TATotXNgusx?=
 =?us-ascii?Q?nBz1yDlunD02L/O3+Te4LbN68y8S1tst5GRYkHgm0W8Eotz92wmnmjNIo9GP?=
 =?us-ascii?Q?GaNqUmx8B2uG90heGBoJN01YnRZhJORY/Xbkyvhidx/Jxxbj+Jox/HfnOBw4?=
 =?us-ascii?Q?Ro5qVcji0W1d3Kt+K5+UVd8YXds/COgguwJVqfbWCqbt8zZgQQ8A4yjl/ehb?=
 =?us-ascii?Q?skyRIHI+AsdNIfo6AIAVUeomKYrSswQA/SyO2Gy4j2qhKvVw0bROiyFkelwT?=
 =?us-ascii?Q?62EddiF/69NyzJHPLaemZEjI4eiRrxTS2IuswhgfleiSUd0DFtTIBZyCuHf0?=
 =?us-ascii?Q?xuvCEpFER3xRp31faLzC1e+wYzaezg5uTz40eQ0a?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b61b9ee-2528-4753-393d-08dc9455631d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:56:03.6663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D/WsTWZocFhzTHY9RtOpOPPt7wsMHLLvaFHzuaH8dkYl9/yVXHJtUJTPNJw1H+ImRnRgcdgQ8ljmdjrP5611A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB6004
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting node block.
 print_node_footer_info()
 is added to show values of node footer. The meanings of options are: * node:
 means node is injected. The members could be injected in cp contains: * nid:
 node footer nid * ino: node footer ino * flag: node footer flag * cp_ver:
 node footer cp_ver * next_blkaddr: node footer next_blkaddr * i_mode: ino
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.215.56 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.56 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.56 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.56 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkB8-0001AS-BB
Subject: [f2fs-dev] [RFC PATCH 08/10] inject.f2fs: add node injection
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

This patch enables injecting node block. print_node_footer_info() is
added to show values of node footer.

The meanings of options are:
 * node: means node is injected.

The members could be injected in cp contains:
 * nid: node footer nid
 * ino: node footer ino
 * flag: node footer flag
 * cp_ver: node footer cp_ver
 * next_blkaddr: node footer next_blkaddr
 * i_mode: inode i_mode
 * i_advise: inode i_advise
 * i_inline: inode i_inline
 * i_links: inode i_links
 * i_size: inode i_size
 * i_blocks: inode i_blocks
 * i_extra_isize: inode i_extra_isize
 * i_inode_checksum: inode i_inode_checksum
 * i_addr: inode i_addr array
 * i_nid: inode i_nid array
 * addr: {in}direct node nid/addr array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 209 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 210 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 0f67f80..20ae87c 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -62,6 +62,18 @@ static void print_sum_footer_info(struct summary_footer *footer)
 	DISP_u32(footer, check_sum);
 }
 
+static void print_node_footer_info(struct node_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(footer, nid);
+	DISP_u32(footer, ino);
+	DISP_u32(footer, flag);
+	DISP_u64(footer, cp_ver);
+	DISP_u32(footer, next_blkaddr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -79,6 +91,7 @@ void inject_usage(void)
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -151,6 +164,28 @@ static void inject_ssa_usage(void)
 	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
 }
 
+static void inject_node_usage(void)
+{
+	MSG(0, "inject.f2fs --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  nid: inject node footer nid\n");
+	MSG(0, "  ino: inject node footer ino\n");
+	MSG(0, "  flag: inject node footer flag\n");
+	MSG(0, "  cp_ver: inject node footer cp_ver\n");
+	MSG(0, "  next_blkaddr: inject node footer next_blkaddr\n");
+	MSG(0, "  i_mode: inject inode i_mode\n");
+	MSG(0, "  i_advise: inject inode i_advise\n");
+	MSG(0, "  i_inline: inject inode i_inline\n");
+	MSG(0, "  i_links: inject inode i_links\n");
+	MSG(0, "  i_size: inject inode i_size\n");
+	MSG(0, "  i_blocks: inject inode i_blocks\n");
+	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
+	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
+	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
+	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
+	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -169,6 +204,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
+		{"node", no_argument, 0, 13},
 		{0, 0, 0, 0}
 	};
 
@@ -240,6 +276,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->ssa = true;
 			MSG(0, "Info: inject ssa\n");
 			break;
+		case 13:
+			opt->node = true;
+			MSG(0, "Info: inject node\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -266,6 +306,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->ssa) {
 				inject_ssa_usage();
 				exit(0);
+			} else if (opt->node) {
+				inject_node_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -672,6 +715,170 @@ out:
 	return ret;
 }
 
+static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			struct inject_option *opt)
+{
+	struct f2fs_inode *inode = &node->i;
+
+	if (!strcmp(opt->mb, "i_mode")) {
+		MSG(0, "Info: inject inode i_mode of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, le16_to_cpu(inode->i_mode), (u16)opt->val);
+		inode->i_mode = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_advise")) {
+		MSG(0, "Info: inject inode i_advise of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_advise, (u8)opt->val);
+		inode->i_advise = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_inline")) {
+		MSG(0, "Info: inject inode i_inline of nid %u: 0x%x -> 0x%x\n",
+		    opt->nid, inode->i_inline, (u8)opt->val);
+		inode->i_inline = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "i_links")) {
+		MSG(0, "Info: inject inode i_links of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_links), (u32)opt->val);
+		inode->i_links = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_size")) {
+		MSG(0, "Info: inject inode i_size of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_size), (u64)opt->val);
+		inode->i_size = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_blocks")) {
+		MSG(0, "Info: inject inode i_blocks of nid %u: %lu -> %lu\n",
+		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
+		inode->i_blocks = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_extra_isize")) {
+		/* do not care if F2FS_EXTRA_ATTR is enabled */
+		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
+		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
+		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
+		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
+		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_addr")) {
+		/* do not care if it is inline data */
+		if (opt->idx >= DEF_ADDRS_PER_INODE) {
+			ERR_MSG("invalid index %u of i_addr[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_addr[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(inode->i_addr[opt->idx]), (u32)opt->val);
+		inode->i_addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+	} else if (!strcmp(opt->mb, "i_nid")) {
+		if (opt->idx >= 5) {
+			ERR_MSG("invalid index %u of i_nid[]\n", opt->idx);
+			return -EINVAL;
+		}
+		MSG(0, "Info: inject inode i_nid[%d] of nid %u: "
+		    "0x%x -> 0x%x\n", opt->idx, opt->nid,
+		    le32_to_cpu(F2FS_INODE_I_NID(inode, opt->idx)),
+		    (u32)opt->val);
+		F2FS_INODE_I_NID(inode, opt->idx) = cpu_to_le32((nid_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_index_node(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+			     struct inject_option *opt)
+{
+	struct direct_node *dn = &node->dn;
+
+	if (strcmp(opt->mb, "addr")) {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+	}
+
+	if (opt->idx >= DEF_ADDRS_PER_BLOCK) {
+		ERR_MSG("invalid index %u of nid/addr[]\n", opt->idx);
+		return -EINVAL;
+	}
+
+	MSG(0, "Info: inject node nid/addr[%d] of nid %u: 0x%x -> 0x%x\n",
+	    opt->idx, opt->nid, le32_to_cpu(dn->addr[opt->idx]),
+	    (block_t)opt->val);
+	dn->addr[opt->idx] = cpu_to_le32((block_t)opt->val);
+
+	if (c.dbg_lv > 0)
+		print_node_info(sbi, node, 1);
+
+	return 0;
+}
+
+static int inject_node(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb = sbi->raw_super;
+	struct node_info ni;
+	struct f2fs_node *node_blk;
+	struct node_footer *footer;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk);
+
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	footer = F2FS_NODE_FOOTER(node_blk);
+
+	if (!strcmp(opt->mb, "nid")) {
+		MSG(0, "Info: inject node footer nid of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->nid), (u32)opt->val);
+		footer->nid = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject node footer ino of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(footer->ino), (u32)opt->val);
+		footer->ino = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "flag")) {
+		MSG(0, "Info: inject node footer flag of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(footer->flag),
+		    (u32)opt->val);
+		footer->flag = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "cp_ver")) {
+		MSG(0, "Info: inject node footer cp_ver of nid %u: "
+		    "0x%lx -> 0x%lx\n", opt->nid, le64_to_cpu(footer->cp_ver),
+		    (u64)opt->val);
+		footer->cp_ver = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "next_blkaddr")) {
+		MSG(0, "Info: inject node footer next_blkaddr of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(footer->next_blkaddr), (u32)opt->val);
+		footer->next_blkaddr = cpu_to_le32((u32)opt->val);
+	} else if (ni.nid == ni.ino) {
+		ret = inject_inode(sbi, node_blk, opt);
+	} else {
+		ret = inject_index_node(sbi, node_blk, opt);
+	}
+	if (ret)
+		goto out;
+
+	print_node_footer_info(footer);
+
+	if (ni.nid == ni.ino)
+		ret = update_inode(sbi, node_blk, &ni.blk_addr);
+	else
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -687,6 +894,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sit(sbi, opt);
 	else if (opt->ssa)
 		ret = inject_ssa(sbi, opt);
+	else if (opt->node)
+		ret = inject_node(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c828f3f..9b14c31 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -31,6 +31,7 @@ struct inject_option {
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
 	bool ssa;
+	bool node;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
