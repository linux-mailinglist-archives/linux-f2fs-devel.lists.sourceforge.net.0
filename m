Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080B91B4A0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0TX-0001UB-U2;
	Fri, 28 Jun 2024 01:32:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0TW-0001Tz-Ld
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egenvhauFvDHXFmxGpkt7kfRtUYInG6smoWsHhRT/Z4=; b=ARHWs/z6tLZ6eFsOsVQPcepKPF
 Dd4QV4GxC6dS2iKRaD+AK+Q4J30AG09Bqh0lvcaerp+BZ7drwep+4L/WYQ3DPR4Pn7tXZfu9SwuZo
 wWk4EUVhZCUg1NLbcgM6/Mmg1fJb5UcroHqrMoJo/ZBkBbmJ98eNNxiu2Mz3YtYDHhyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=egenvhauFvDHXFmxGpkt7kfRtUYInG6smoWsHhRT/Z4=; b=g
 HoRlAa7XuYtbG4QszXDwn5XbtLwAc3fbikIPrvEfC8h3fGWoPPKHZGMg05LhNCUcFL6vbhB0+DS3X
 qdc6wAUzFcGyHVej+SzPLoB6whjeqndDZ0T4Cx+lOES4hyl11wGCUz+tih8AXs49ypMwYexOpHSrV
 zfSxc3Cn5pxPRl3I=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0TW-0006JV-Pz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evboBJGMOoXIQeg/ZweKA+DefIL4BSa0SThbGpFpE50DdlLzsyjMN5So7k/GyuXVYdJIk3jYJr9GDCFaMrCBZkWx7JkN8pkWI1OPNzqUOiwGqFs34iG69SAS1bU/ScpWA8+auZLLkTYH0aslIc575jsl4zKv1JL+1wXH4AeVN9vXLX0+hY3rygL8f4cCmMgRoyTut8CTpFQtvpyUbMyDLNYG6t8ntd7Oc8ed3WuD1Ya83bNDPvVB/HgLljiUErKH6gNZtV1sDMYlRpU6UpMnMymV2SgXEHOBmgDq60gJCqIFJ5jd3P2rbMoqLc8fPRk/b7ssF8iUJMe4r0WE/b2C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egenvhauFvDHXFmxGpkt7kfRtUYInG6smoWsHhRT/Z4=;
 b=KkzSEZhqMwIMomYSbycyjuQUt+JEsey2r6HMFD6Ia0jscC/eIwTaAo7iGiCJEUwm9mTuU8NPI0lc81oFOXb3wbtq4MKyoGsIeDtPQOV+GReBbAfXRj5dpjy4TV4MRmKa0x7aD3/7fpd64OBSbaym9zDBZ3CUjyYjFFGeFmUII9RKKn81ZDkeelQlXFkQVEF0wGkoR2CjwqhGuVYGAEGIisfwyYMhld79El3W1Ty40pbejG2jcTVWC8uJH//BSDrLYlB5JCRRpUNgka02eiovR5Yo3+tMoKLm+6GiDa1q/t4KB94yoToxodCwRjvvGQkl3F3AJurha6kpofNYfAFqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egenvhauFvDHXFmxGpkt7kfRtUYInG6smoWsHhRT/Z4=;
 b=b1SZTE56i4BQUwj4iNdAIuG/elk3oAgpWTCY+N5Ir2PJGhn2iFKtzs/JXIIcBqr3HpAv8d3zpaw62AU4/xGfFRM+M4tp5b9Q4l1rqblIEmOQK6dJtmHMCfLzwTsmsYTSDhWO3egdUBVaGiyX5v3Fc7LKIoics0lkuPozZ0VyAFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:16 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:16 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:30 +0800
Message-Id: <20240628013140.2444209-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc83749-6536-4f1c-1668-08dc971224a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2lM7a3Dr5jji7zDytl5zNH9m4KgJFcNxc6D4wuHVQoE8Wz2Q5tDTTGMHKw83?=
 =?us-ascii?Q?L/AsQnNqq7BuToaHBVypAy3TwrG9kyG5una06j2r0yq/3E3XMWgGvfntU4XN?=
 =?us-ascii?Q?wqjy23P6II/ogAZU+pbnUR7JNaWP/7uO3k6lA7lYaBKCutKJMP44nXTd6ywk?=
 =?us-ascii?Q?uvDtu/T4axVOpzTqGBFwRnbfFJMIPYlIzsSwIbtaqMWE7gnkT+6z3kQOLj/Q?=
 =?us-ascii?Q?Id5KMeimgGJjqMhz5K4QD8HHhoxAwz7MzkhCZ97JApqfME7Y70w+WlOqovnf?=
 =?us-ascii?Q?qlX5IO9qrkHYs/5bN3CAetUSLCF0ogIZt6n8FaZCAt2PfYouskxBuG99rV6z?=
 =?us-ascii?Q?AN30zPYHPlk7iLH1l10T8Fwr4TRxcmklMupjiJmnvKMT5njTfDJoUNdzp22E?=
 =?us-ascii?Q?jJJrZh+y5AD3+z71Dlr2NpsP+3Y09KFV9CcMTCLBspXXmfNHknlx7+RjU5nd?=
 =?us-ascii?Q?4rRE0FpHHk7QcPc7oa3O6DFoVm8r9V4fLWg0HfelixB91dfh08bTHgAoTIPw?=
 =?us-ascii?Q?n+vZA+cGreqGE/jgeU+fMAx9xdkA/RugbzgerlSJeevgaIsKmFhcWlYChVEZ?=
 =?us-ascii?Q?bymDerh2wfUiJP2k9k5GZ7X7xpFkblB4YogwQvVoesUtiWdORUH7NglvaMyB?=
 =?us-ascii?Q?H6+43Yj7HIeIL3+yO9GdIFkrJAIWzIj39cPHJCW0Pgjtw6bDa19y4Pd+on6f?=
 =?us-ascii?Q?rhcl532nnmnwLPDphDXeOn/vjV/7CHAEWQDCJhiSNXZg4WpwaqgqERk3Z9ZX?=
 =?us-ascii?Q?5sDcfgWLocn4bRfEAh4d2+53KiW+27qYkBcaKxQnqT1sSsZM3dEryW/AcwqI?=
 =?us-ascii?Q?/qqVHGgjHovNh9ZrXddljxRZ464ngUMKmh0c7ulFOsZattWgBNQuJeNkDjLI?=
 =?us-ascii?Q?G4R8x24eRQrIlNQ+cilrr/jL4WiMau9GQwkwtYbSIWR8CUI1dK0uA1OY1Nys?=
 =?us-ascii?Q?NxCT8Khg//RpWStIxguli02ko18LygsWoSwS9DAKs3kPevGOrXYiZ5IN75Tv?=
 =?us-ascii?Q?TNy6SaLqFq/2OXqoXWmYvwX3uw9fobHT0wVkaTf1BQV0Xtk8b/8OSAq5mq9V?=
 =?us-ascii?Q?6dT2dZcNeNTEL6fqDthfWSC+qOCGPNAAFBba4mZ3P38nK8WUfQlGIYNr/feE?=
 =?us-ascii?Q?nT5PnKS3cSVtQICxNGtLfk6fu00SjWtEqUMTSGnn7FrDQvhyOeaJMcGb02kQ?=
 =?us-ascii?Q?u71tXFwQq09H0IsvGBtyeNR2CmgAaWF7vQB/EO7jvzbRCJNxfmLgpuhPvmSL?=
 =?us-ascii?Q?VVfxRdRjhOLj5vydHnaGNVMUivXFAqisCxjqvVpAbzD4b9ez4Tlxny72WrUr?=
 =?us-ascii?Q?yr1HhRJnKP2BK3LVjYDlp1i7Eosi9WuhduFQTtN8DJJxMaWb9c09st8DlMJE?=
 =?us-ascii?Q?ojSLAUffBfEA+EDeKmX80wL1wjv1eKBSlR+nKlUvnu4q7czewQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JtQcdxetwx5J7XKwgg8NmhfoSRStIjXPRYJEVaQcqhwVIpWf8r6GBiQvjR40?=
 =?us-ascii?Q?8n+D2mzzoWiwKkC0Rzd/+qdwoGKKSMynO4zzDwoF/A0DHj6OsPpPGUYDrvlN?=
 =?us-ascii?Q?Z8tgn4eZCJ3d/FlSWW3aZu7q+6VvWA0g4H5mvtA5ngckmQ9yBKGP+7d4nDwP?=
 =?us-ascii?Q?ICbf3kUXb/5lwNmrvTFsMfNWjapM4eF8AOh9yU1g1VkXbfI4ObStaylkZ367?=
 =?us-ascii?Q?yX0KZj71HviZJiyoCO0xt8iXd8IyHLhQ6gvOMccxkXDNq3OxpB24sJX56ugQ?=
 =?us-ascii?Q?o0zbs2NVqo/LbeW96PdZpmMCdMhP8utGa7lCEEIc0kNZg+obLJ6CjmChZ3uk?=
 =?us-ascii?Q?VYMGSCoNWRmiXjrzv9/aiv/s4MkEVY868Y4aI1C5thbUF9zo8fz3bgLTfnhw?=
 =?us-ascii?Q?cviPMJfmVKgZB9mhs2JM4VNQUOgjCd6DZr/s8G0/EnMmxdpJx8VeiWpyRqn1?=
 =?us-ascii?Q?VC8P5uDcqfT/Gx+7TlCxKbifpVejhMOLf1G9Xz3cQMLRb9v91q78LIjzwkov?=
 =?us-ascii?Q?AT0LaZdQ303b5+I9adT9bJtp105/fmEGtDAMIfmSKLIphCxacyUNz0iaZ8oY?=
 =?us-ascii?Q?xT65oLQd/fI7sOp8NPxyWpRvKW2AiW+VRXIeofgcluuHAwl5wx8gorefZOl/?=
 =?us-ascii?Q?vzesggccPo+uJZsNrxO8S5zmLQXe77u2nS9WNs8f4aDquZDLQ8DIZrfgkzgc?=
 =?us-ascii?Q?p4ZZ0frt/LstKJSzk6/Esg70K2qIziLAUKbnKFd0z7YQlINoSnczcK50UY0l?=
 =?us-ascii?Q?s7TW1cpbejM4nkG0NG8XzAHkUUD8v4t9fDhOKNUa8bT+Bx8K+j9+Z0F+0uei?=
 =?us-ascii?Q?i7GCsq338D/W1eIRghNUa8xTbdN5Irgpnw5zXpZdcQ/K44rQF5zEtyg+TWMD?=
 =?us-ascii?Q?6W9iKfd1dzApJBAoaSGNSnEHj9VolHtCC3BBUfEHEGthQS33/9agREzKdAzr?=
 =?us-ascii?Q?qEhRx2mWA8djz1hV6qsrQyicsPyoV71V6NAMoaiTGF0qYHx0ouGvUcUH+fJs?=
 =?us-ascii?Q?ct4rKm4VvhSW42PXWNJzVfHGtdivPsNC06HDv8Nz80ue688cGERsIQv/zNTI?=
 =?us-ascii?Q?eMgu/UBjDjlYg/Y9Mf1xSXKxeztC2X+T+s317qwroIBeg6HX+1uGpCSkSy74?=
 =?us-ascii?Q?2bFrZWY7zhFdxcDhl0DlUdrouomDnJuCjR3K8kgz2b1nXNygoZuyXPNZgd9x?=
 =?us-ascii?Q?p4llsDvKFVXy3Ud61iDak/z5h7w/mTEhYnQjiAn89msltFYBC6qBPmkQrfhF?=
 =?us-ascii?Q?9lam5T2ioKNUY/Hyp6gC6NDfFP0Nip6E39Jd9UcDz6jmF8HcxfTPFIM+R9iT?=
 =?us-ascii?Q?WxmKkx4veBeZ0/hCLMETNCNnY8Og8PnDc8xl2UCz/hGrXjocYLETbzjGltjf?=
 =?us-ascii?Q?fHynw4vWW4/QuPN1Xax62FJdhghwuH4WCHdffApg9uSKb8kQ3zlL28zuRpEz?=
 =?us-ascii?Q?09AYuSglevCpIkj7kDU5gnUHgzT9bcUVU0wx0+lYsBs0fzaI2MBsRlJ0aYVu?=
 =?us-ascii?Q?xxBUbQK9Iq8k72x/c+j6PN+qCtnb8mL1CYPvxPTL8i5IN6CwpNb935Os2rgq?=
 =?us-ascii?Q?gx4ME6P/eLzNK/NhtuWSzQlKpYSmzuSB1M4srHwv?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc83749-6536-4f1c-1668-08dc971224a5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:16.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U/5hkymPZtPgjdFfowJioHMRnU+R3njIizPOigPT9NjoOYRINWiA+2+H75pW9ZnYu3RMSKBL8/L4dU955PouA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset introduces a new tool inject.f2fs to modify
 metadata or data (directory entry) of f2fs image offline flexibly. With
 inject.f2fs, 
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0TW-0006JV-Pz
Subject: [f2fs-dev] [RFC PATCH v2 00/10] f2fs-tools: introduce inject.f2fs
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

This patchset introduces a new tool inject.f2fs to modify metadata or
data (directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

inject.f2fs allows injecting some members in sb, cp, nat, sit, ssa, node
and dentry for now. The available members of each part can be listed by
executing command like:
  inject.f2fs --sb 0 --help

  [...]
  [mb]:
    magic: inject magic number
    s_stop_reason: inject s_stop_reason array selected by --idx <index>
    s_errors: inject s_errors array selected by --idx <index>
    devs.path: inject path in devs array selected by --idx <index> specified by --str <string>

More injection fields are still work-in-progress. The TODO list includes:
 * sb: features
 * cp: fsync dnodes
 * inode: extent, extra attrs, xattr
 * data: fsverify?
 * other fields which is needed to verify fsck

v2:
  * change print format of s_errors
  * add write_raw_cp_blocks to write the first & last cp blocks directly
    to avoid updating ckpt_flags by write_checkpoint
  * call update_block if i_inode_checksum is injected to avoid updating
    i_inode_checksum by update_inode
  * go through all dentry blocks to find the target dir entry

Examples:

Inject sb's magic
=================
inject.f2fs --sb 0 --mb magic --val 0x12345 $DEV

Info: inject sb auto
Info: inject member magic
Info: inject value 74565 : 0x12345
[...]
Info: inject magic of sb 1: 0xf2f52010 -> 0x12345
[update_superblock: 890] Info: Done to update superblock

Inject cp's cur_data_segno
==========================
inject.f2fs --cp 0 --mb cur_data_segno --idx 1 --val 0x12345 $DEV

Info: inject cp pack auto
Info: inject member cur_data_segno
Info: inject slot index 1
Info: inject value 74565 : 0x12345
[...]
Info: inject cur_data_segno[1] of cp 1: 0x4 -> 0x12345
Info: write_checkpoint() cur_cp:1

Inject nat's ino
================
inject.f2fs --nat 0 --mb ino --nid $INO --val 0x12345 $DEV

Info: inject nat pack auto
Info: inject nid 4 : 0x4
Info: inject member ino
Info: inject value 74565 : 0x12345
[...]
Info: inject nat entry ino of nid 4 in pack 1: 4 -> 74565

Inject ssa's nid
================
inject.f2fs --ssa --blk $BLK --mb nid --val 0x12345 $DEV

Info: inject ssa
Info: inject blkaddr 7511 : 0x1d57
Info: inject member nid
Info: inject value 74565 : 0x12345
[...]
Info: auto idx = 343
Info: inject summary entry nid of block 0x1d57: 0x4 -> 0x12345

Inject inode's i_addr
=====================
inject.f2fs --node --nid $INO --mb i_addr --idx 100 --val 0x12345 $DEV

Info: inject node
Info: inject nid 4 : 0x4
Info: inject member i_addr
Info: inject slot index 100
Info: inject value 74565 : 0x12345
[...]
Info: inject inode i_addr[100] of nid 4: 0x20864 -> 0x12345

Inject inode's dentry hash
==========================
inject.f2fs --dent --nid $INO --mb d_hash --val 0x12345 $DEV

Info: inject dentry
Info: inject nid 4 : 0x4
Info: inject member d_hash
Info: inject value 74565 : 0x12345
[..]
Info: inject dentry d_hash of nid 4: 0xc77b804e -> 0x12345

Sheng Yong (10):
  f2fs-tools: export is_digits
  inject.f2fs: introduce inject.f2fs
  inject.f2fs: add sb injection
  inject.f2fs: add cp injection
  inject.f2fs: add nat injection
  inject.f2fs: add sit injection
  inject.f2fs: add ssa injection
  inject.f2fs: add node injection
  inject.f2fs: add dentry injection
  man: add inject.f2fs man page

 fsck/Makefile.am  |    5 +-
 fsck/fsck.h       |    6 +
 fsck/inject.c     | 1085 +++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     |   41 ++
 fsck/main.c       |   38 +-
 fsck/mount.c      |   26 ++
 include/f2fs_fs.h |    2 +
 man/Makefile.am   |    2 +-
 man/inject.f2fs.8 |  225 ++++++++++
 9 files changed, 1426 insertions(+), 4 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h
 create mode 100644 man/inject.f2fs.8

-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
