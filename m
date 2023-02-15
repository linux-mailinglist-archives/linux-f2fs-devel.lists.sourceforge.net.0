Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60131697F2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 16:13:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSJTT-00074L-Dr;
	Wed, 15 Feb 2023 15:13:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSJTS-00074E-0k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 15:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1E4Gjg5ExgH7/0MEsP9yTxZgTKpEO5VgTfBTKSZ/TCg=; b=gLGgVHl8wgYmi9Bc+hfYjQLArv
 FR2nv0b2VvCEUP4AzE9/Fyo4jS4mOsvHXZtDxcNOuvj/6dKpQfmrh2PsFL5TsQzwZYTgahyRwRJ6G
 P0NTcJx22TH9poSoC0Fy9xFxnB9tg1z8sTFDuJuVX6FTc3qH/ZshXeXbgh16QtbxEGyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1E4Gjg5ExgH7/0MEsP9yTxZgTKpEO5VgTfBTKSZ/TCg=; b=DtSSvg9tH0+tz32e7+F1ceNWNN
 7okXEL/JAqA6lKwegNHRnBcBNMZv6+1itLBNHInK1cG9jPykrpxpbLtGseJKZ/pAJ4QuzRtUWvDx1
 LYzyGYiE0RNAJio1z/d7xAP/2KZNw+8fyOA6ENXcq3gK7jxcmGtwT4oKFlJT9nBnrNvE=;
Received: from mail-tyzapc01on2095.outbound.protection.outlook.com
 ([40.107.117.95] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSJTO-0007xB-Cc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 15:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTm9G6EnUeymiFCa1Cebx7jvO8ab+PvP/EOkwJNRJRGd+0iqFmkGaV25RRIoszwURzXOKu3mdavK1LJCZjlPZ4UxnbUqorY3rJ84TV+A3EBVA3nvDT+UEkfuEjzf+h1VptprXz3Nzpli99UcTvEpA2CCPPa3F86Bs6l3ApkNVw402+YvdIxF1AW1uouqm1BTeqYTQeSh+lY0lbvCfAbi9WJ70Pxv41ZBR3NAMewqqB87EHVZv7GkabRoAmq6yk6T5OLFzgtCff4wyI3h0A0FJYZs4a+fNAKlLN17Mxg6zSYjw9rdBiCS1EFkb21qbKqXORN95kMNvQKfHmZYHWgOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E4Gjg5ExgH7/0MEsP9yTxZgTKpEO5VgTfBTKSZ/TCg=;
 b=QhCA5MqB158UBKX4/5mMxbpIN7JMg8bX7PxqjrSYAZ03YX++28LMFJ+XCWCfXdi4/yxCpTKWC1sG5x0BWADTB9oThWgilxGnC6PNh8AkZN3Jn3Wp/k6EUbu9ofnqYv1GqDgEue3gQqGu+lasRQK65pKUjy+lF1DFuRlSKeS/KXGpL4hFlZHMkmrpCr6RY9Lujq/1FMFkllokweKf4PAm0T758dwn8RRrKNPSur9IfHIy2UdH+fiiPZHyuC3ICZbGOsx2cfu6H2Wt4ziS2eHSCh7kfQz3UcLlJ0NqAY4C3Z/qce14NGwajcNN85k3yD5dasMznpk/fZb7h0bhDA5r6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E4Gjg5ExgH7/0MEsP9yTxZgTKpEO5VgTfBTKSZ/TCg=;
 b=jcMC3b13CHt6jGGJiaQbhZAfd7GOYH8pxsE40X5EQzKSBJETwJNgARk2cyVXQ/suIkIevJbJ+4pK7dbtgYxAm/tgksQ2bip4PKH2t/0iBFyoHszc1R9O+gU+OR1PR7UiLWWoPnNoQQTm/liPTFbLUDs0GIg8DG9y+5FB1kNC/gH+VseO/wT8iy8x6z/gP0r2GwUDYyTHQQvjxKPA55idO2fk4Sszm7xMdGhXYsWNlFf+UL11u/oj4mnLrUfonBDlsmJ0oHGwZQPSArMtpF/AZ8pDrGIZ1m4P7r50A0FpjCOofrKDYN0OwJx1I3olL56MC4MNramSj3WCmfirqLHmEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SEYPR06MB5891.apcprd06.prod.outlook.com (2603:1096:101:d4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Wed, 15 Feb
 2023 15:13:20 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Wed, 15 Feb 2023
 15:13:19 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 15 Feb 2023 23:13:10 +0800
Message-Id: <20230215151310.14520-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230213142815.24095-1-frank.li@vivo.com>
References: <20230213142815.24095-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0111.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::15) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SEYPR06MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd2c65d-1b94-4b72-0b5d-08db0f672be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DSst36tkMyafTEJY9Rr7/o3zgmzpYM21UH95264QHIkx9qoVk+xiQycN9c/if2p9T+LVcAh41U7532kGeMmtAsI/7nNJlT2fG8cCUztyIGGe3tY7lp9WRMYfp7W4S9B+PK0Fxk3lMVjU3kBp/R20Dis4ZnmBF2IlA8ca54YcUXVjh2uJYZ1PhgbdGETWasFAhhbnfiRb/M8gGe3liaJI6VnpYZfHKnimGaKXoncuH/9glCvYel2VbksBQKIDwOYBomzHE21br+VN+xWmj2aOsL7gHbo2yVVuLVs1GqDITOCJViY0xnLySYhLodypmLJ7OJdjQjn0fnAYCAm7gYjpY6CCk/lIvfaLuP48ycBdAt9knWPJOsXB8AuE/txabYFnS5N3olKtyisdMDQSFMWGUA+/eyJT7abO3xBEHPdy0tnei7ok4OR2QDUs1r8hdE0ExcTeReAEk10VAQ8usrwivd1gihxEP2uVsNQAPsimTl0uk/DFOjJjkVfsOEt8uKARvJSUwS3DPU4+orQqNlDg7gfoU7vaGveOPyaNsHGhRjJS0NDWWTOn2WG+ol6hCAgAm8yMQLn+SXmTjZOedsVoNuiUpehws4rAS+bnjNxxRs1cP3fYFA7J86dkprV8VuhmURZRn7skuDWzzJZSgnjqSpe0cp1vijbG0QFc6ALjdyejbwLV81J+OHrJuNQcBX1screIzBmAt8IcDd/29fZdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199018)(36756003)(558084003)(86362001)(52116002)(2616005)(316002)(6506007)(1076003)(107886003)(6666004)(186003)(26005)(6512007)(6486002)(478600001)(8936002)(5660300002)(2906002)(8676002)(38350700002)(4326008)(66946007)(66556008)(66476007)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CWqY3NAH/9814DsFQMNuVUo+z9+3ZbykcAYRZGH9CK/rsTUle7jFkDjlhK7O?=
 =?us-ascii?Q?y5M/oRBP5ymI422OzspATS7R78mzqREbOeoRrfxy/BVZcgUdJe8K3Se5BlCw?=
 =?us-ascii?Q?VmOsjniE4a9oanxMVoX48yuLM30ME25o+DztVbfNUSmRtsuwj8b9ISZI41hq?=
 =?us-ascii?Q?0La9Xnm/cMknEb/HiiqNJ4KS8jg53uytzrokx5xpk8jL3B8L0xjAUepLmlX4?=
 =?us-ascii?Q?IYulda7ipeTkW3vt1egXb4VaFnbnd4eHzT2YKu8g4ZbP/O/6E1FeDJa32mGZ?=
 =?us-ascii?Q?51uj/cCOTloTRPeOI/9KFffBbvICVbNyLzszSutSCpVCkyHMGHEYD0o0DVlB?=
 =?us-ascii?Q?PbbRhgkhqTjmltG8AXBVMg7MP7V/DAmR/SVipWvp2ZBNYPIeLcWXWXCTZaqd?=
 =?us-ascii?Q?22wwQAXEs9ZOWsreG/xNyt25tKS6yH268gnP2PJAiAGRHcOfpiCWfvDqFAf9?=
 =?us-ascii?Q?jKq9iImdxPJURbXQ3TC5sqAJyWPwreZd+AV5EEdi0ZN7RtglrtlPYbVwYwQw?=
 =?us-ascii?Q?zvUA1PqhYsllQesjlYuJGEk3GJxCnd02rZ4bTJj2tqwPUPXx5scF/lGJtYUG?=
 =?us-ascii?Q?2wzZlsesap2/aH4emDS1v/X8Mio/HJkiq025DdnRSBY9pJ1rgfTn8ykHrM0L?=
 =?us-ascii?Q?chqTN6r5+y0nERLMCUscDi0AdNcZ4UVnftQTRet+Ua0rxhvXq7C5YLQLFLDF?=
 =?us-ascii?Q?pYQBkIDwYBBHOa6SOM8XMmj2BILubNM359dr4O20IqD27IdORn3frUUHpdfu?=
 =?us-ascii?Q?OIGr5VWzN0oQ1z6zoLTqAPPv42dLGUHL/zaP7DfCOOZ2OGuhWYvXKbvnCgRD?=
 =?us-ascii?Q?TETjaQA7pgK/Unktf9W+vyag7PVzdnTL9nHLo/GTXJErYTFUf/+IWm/o/2Po?=
 =?us-ascii?Q?GSbH8SPwogpuSERp9cN5DP5IFdeMZI+OEvmLrwSm5yXKeWfsgackA6LO6eLZ?=
 =?us-ascii?Q?73bGcZczCTrW0BfO5rONMAYB6Fg4WcL2k/qQz2upeBJNUdV7FWAgfgYtv1Aq?=
 =?us-ascii?Q?lw2rM2u2Z+Q07cPS83pqcJzaUFnSR3i0icJmj8Vqr+RdnnceOKvPvXphlpKA?=
 =?us-ascii?Q?bJ3gVMkk0i9WIpAuDodU8XH1Oprv96Bn7a3ezBUitHyoWMudgO7/EuBhCWc3?=
 =?us-ascii?Q?Bx3oapmqSK5Uyn2iAcn7zCuYR0lugzcEBpzGuVWSE6MwxvWIoEL7zhltu2El?=
 =?us-ascii?Q?6JzxFz/CX/d7y2wCRhFvx3wNkxFWXRhzbTdYrm4UxM40M9jo2VheOR54ghT6?=
 =?us-ascii?Q?ZkVF3cWPWNcntxUsg9gKwQbFJlqz13WyytemuDn6KiYi0VqVo+cw6e6ubR8Z?=
 =?us-ascii?Q?0CvYeHXH5/qpbf1MKLRDOGHb59jsBTuR07QS03CuYY20QejWN+j4odmB+Vbx?=
 =?us-ascii?Q?c8bBikD08wBLsb/CGdEEwkDYFycTIU5p/WfTM8YtX8IuHSOaWQ1B5xXd5syI?=
 =?us-ascii?Q?LQp3EWooYDBCmpjjoF79fwDq26h3Cgs6Kp7ZbTKYZK6oVl1QTyeuyjFgrSBI?=
 =?us-ascii?Q?/PJUfvNgYXdJAlONh/0vLgMpJyUojSB6Y7lf2Br1ehj2rLSG3+khzaXJrCWn?=
 =?us-ascii?Q?TlRqn05Q0mVhuyuqTmFHYDc8wJV0T8DI52dxHbse?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd2c65d-1b94-4b72-0b5d-08db0f672be1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:13:19.7629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRShcuvWwQBo1Oq1+ZHfdvuNc1obUd8efT05TMQeESrzD/N7h8KLwBIIIB0C3UbO0yWOQ/gCXuFCxAzjb0UN7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5891
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > Chao, any comment? ping...... 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.95 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.95 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSJTO-0007xB-Cc
Subject: Re: [f2fs-dev] f2fs: fix to release compress file for
 F2FS_IOC_RESERVE_COMPRESS_BLOCKS when has no space
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

> Chao, any comment?

ping......

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
