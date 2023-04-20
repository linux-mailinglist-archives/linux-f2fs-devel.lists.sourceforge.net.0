Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153806E88C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Apr 2023 05:31:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppL0l-0002i5-BV;
	Thu, 20 Apr 2023 03:31:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ppL0j-0002hy-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Apr 2023 03:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ge4u8fViut+57+bPtIgPk2Hv4Bx456A3lFV5JQ/cGPM=; b=ALbijCCzzmRr5WyesUeDdHoYvY
 pyn4t2OzZXRdBImIQgGFirVkcXLN283+CloFezZXZo8F3/YKrBDeG67V17PobLWYPJXmnG2LnfSRB
 EpkPEjDPQJCqx1lcutmxgJTCmRmI+XbPoUKVpk35t6+yho0oGXeptJi+AMskz0MYtAEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ge4u8fViut+57+bPtIgPk2Hv4Bx456A3lFV5JQ/cGPM=; b=h+1uwUsaIcLbb9oxcheB93eEpN
 eJb8oi4H2ZMKgrlea8L9YgpqHo5xcrLFU6ntKA52vmIkL4ais1F9ayMxhAuKzkX8vLpztP/AVZ9iT
 b5nyXqtXE3XKqYRQCeLpfPBFsjeq56rgro+qD4bVA0U+nIZ6EP1P2GHxOyMU0g4SsuPc=;
Received: from mail-psaapc01on2096.outbound.protection.outlook.com
 ([40.107.255.96] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppL0e-00010n-Fu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Apr 2023 03:31:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxtxF8NhqURvH+Gv5gheFrmACihD7F65LLF4cQOBKJ2iqLD4wswp86b01dvK7vMJKzLANY9MTiV+lDIIsYWuPrvkaOTnGI/HLCiqn3gTK+prpX6dKXOfnTOe+eIrvvKov/oPvwrPm8oBnG2wrd0P6HzanLghLlJV3nQRHZTRgR99EMatDuIHCnfr/4fJFneK0lr2eD1ErkE9SjFMGBcY2KgpNAShBuzQk221w21eylLq2BJ6usDUoG13YrbeqyELTbCOVraE3IZS7f3f7OYdFonrTygMqzBPKtoa5sFkl2qEjXqHyfHwKLQI4TImJ63hZKyHK4fuwnnWJwH6SFvtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge4u8fViut+57+bPtIgPk2Hv4Bx456A3lFV5JQ/cGPM=;
 b=XbWuNYLJVQU2atkvuKVJfjUrP/6c912YsaKQOuJk+fg6lrDTc/YdHvFH1jCt00TRUFoeSq4QIaLOT1Voq4HZVYauw/3gOaZR7HykkVz/aqyJYTHBSLPZ6aKU2L0xndRr6+UEoOiezMOfX+8ivu9YNjQnONsycU1C0VKAup8YcNALj2Fhwvz3mAw5yr0C2bXxaQ6J5jSluRStZeCbV0cP1g/HEEaquDlq9aT2zY1Jc7fZqhm/SfjEXSc9/t6xY8P5YM2ZvckBQEYlGV+GnNpfm2xY41llVckSaIHxIk3RkfCuGbNo3ogO1IirMjDRzgWcULaWbeE7OPpfhDXuVO+B7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge4u8fViut+57+bPtIgPk2Hv4Bx456A3lFV5JQ/cGPM=;
 b=nouAvdeEdHC0y1UOsKNigogNxrmOPzc1Ejb685c0ugh5ogcAeLdc90yrNi62eIpXuzGHZZcdiWHtc6wp94p6CHlxabelOraiKGI6miaxeDMkD+pbZHmqHPKDJDg03wRowUqzW4kPq4vZ30S3Sw+Mtu+pH+M9aU3DglYZGuh2P4KCOV3Aze15sm4nxAaODOmKZOOOUcT4cFk686ZwY3dUlDSaD90IfjAImz5zYXQASnSqEGtkzMJnX7I91sbGIn4bSm4lsC06r3JL4vne9TgjK/Z9PIFWfU+QYVme4GTDgrj5e5TfQWLX30vY6JK1rVNOQN4cdgncjNgSHY7NPNwlJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4139.apcprd06.prod.outlook.com (2603:1096:4:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 03:30:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 03:30:49 +0000
To: jaegeuk@kernel.org
Date: Thu, 20 Apr 2023 11:30:39 +0800
Message-Id: <20230420033039.72746-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <ZEBPwz4fJATKs22g@google.com>
References: <ZEBPwz4fJATKs22g@google.com>
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: a06ceded-6131-4005-e21e-08db414fa24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uc8w/6wAfxpwYT9y7yuO7qOon/aSZJMBVi2hqKMHlVLI2pQBXB1khTB12Mfpq/BfCc5AxiUbl0HCUS/zqPqmuzhgjgYeZuZdyAtD0gYsRSInkgdapnhBwKILCUtN69ZyOJpTnw4l2UIM/YUQPe/4JxkaDKMV8A1g9cDFp6EJLtCKc7s6uFBx6GX7EWgDMwQ6efMCmXOfNSy/2fPglqPxuN5gyBcQ40vyci7pZjhZGjiQJENI69fa3Abr5ZWgXVB05lZStNzTKd3cNDuk3j8+eanjg3S4Rl5wftxzHOsMjzSVnFHsVmNjO+EpLU4g4qYk4N0TcsKjJM2JWTHst3/kWmQZUt9fMueTXDWxXN3O4/XXcla3+4lNz46moe1GzGnidzttoHBb+wAePoqw2PI9MlDI5Br5Mx7+EkZSPINJME0xo5LqtxZLS0+YBdnRcWQpK2hB3VQ6l91oGWgpPfE+QIHB2/9su1SkB6LhVR2Wjps5L7v7UbQqiHqnlfa6a3RCxtpQJg1+viWIQ/cS/UxrZ3KoqxgG3xKfWkvbNrZhC1hcjWSZcmqeZTUcolyhppAeO7pKnCxtfQMYPpbHcoq6BpRVKOOGwvGWfRKxY4jmnelkX6aAk0EyinuPIPsmrcD5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(4744005)(86362001)(36756003)(2906002)(6486002)(52116002)(6666004)(186003)(2616005)(1076003)(26005)(6506007)(6512007)(478600001)(66476007)(6916009)(4326008)(66556008)(66946007)(41300700001)(38100700002)(38350700002)(316002)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gUkyuIDFl2niyfCQUzx25bHPxB1EqfB8JeDSGuGgIGCxUO6NWyrnk9d4lgrz?=
 =?us-ascii?Q?l3975q6xEYJCkKEVIXHrApz9g2ErXLmIMyhjimaLs8wOzkHlai7ENifTdSNE?=
 =?us-ascii?Q?QgKcb9nP7rFRRu8bewMgBMlL1OWD0SDnfJeIoVRHtqRMVpMmnEJBu2jWVaA1?=
 =?us-ascii?Q?+Jw4yYDhfRG99/sYKQ7it5SDhSv9ro6W4tyBqc3w4XsqjMPvU6Uenb8btz98?=
 =?us-ascii?Q?FmsfMY8X2jWwGdp6Hs2onnhU0GAPAnZRZLFrOI7MX/3l8uoIq66mPyziDsOW?=
 =?us-ascii?Q?vDgSx3QzlIsKixllmyuxJiStvptrNcPFZFxgoPeh1sRrR09TdyDwcDNP+Um/?=
 =?us-ascii?Q?VVRasDY/soaZroGbGUx3qCde3A9SzgDMncHbWFkEK8w7IUYDuJ6qvRDOGtuy?=
 =?us-ascii?Q?3RT73Ur/pivmSCmuB+ZcZiNFIt9wkdACDTiEuJwizaLEa26SB5f8kZGpe3if?=
 =?us-ascii?Q?VQbzWTblP8BRMsXMpzvuTok1emLERLY+xYOjrW43xgMwRXz7cK7NcnA5hNMS?=
 =?us-ascii?Q?B6TmesEfU/OpaoDgN3z982EKZS7XyvvVofLg1e0USu3OVZQf+R3DvY4jSxDd?=
 =?us-ascii?Q?XZSl95hwcw+PRYFIsePdcafZ1xRqUe+5C25YdYoUnChP8vkaB5tKMmHmwPIj?=
 =?us-ascii?Q?KEFxpIfpLzE/2E+RgHCtmbK10QxWDtChT679cS1tzUu2G0QW5olZACzt+0ui?=
 =?us-ascii?Q?5wsE2glBldeSxscv2KB1JJQ0IRaT4FcyXMY+8oOdLlNJ/45Z3W9cyWksgekA?=
 =?us-ascii?Q?Go6NVdr0lfd4SFf5efz71My1YSmgwrY0Ry1VX/ojQtu+M9o0mtX7yb+c2deY?=
 =?us-ascii?Q?QCN697e+ms8xDWm3D8MNy674YPLm7ICA8V4TTEsOhB0loivgHxKOE3jxWTkO?=
 =?us-ascii?Q?Gg655jo6wzTT3vLPblgUUyZ6xJCzhvPe3Rw/RaUGtI+1DJzcUUdnCX/4L5iw?=
 =?us-ascii?Q?VxXfIzbDsrn+0enWDWA54OCwU38f8K201RRIyx3LYHiH0GopG30Wh2PwHR2d?=
 =?us-ascii?Q?VUUOIoPCzNOvXYxVVAQ390+SPVzywOorwr0Ba8gTl6UaH+xTAl0Mf7siqRQH?=
 =?us-ascii?Q?F5qXMQ7aPrUckUs//H04NLOT4nnH9946Nw2/HbXqOObU5V4YKYlKWhSySpdO?=
 =?us-ascii?Q?TUUU6F8UkqLf7NrNvIxy7l/kPkE+0XECmd2ANegSQBPAu77zXCyo4Pvbdeo2?=
 =?us-ascii?Q?Ns/9MG3GeKBNLJmFGKkRvU02I1KkVuTHefKIODpwdh4w4lXHwzSAV4O7WF/J?=
 =?us-ascii?Q?bz7fCVeMw1um31Q8uGxFrsESQMzPOlPBr8jnp3A/VU/B7522XjOIJzFsB74w?=
 =?us-ascii?Q?TVmStyYgYf1jt0sKZdNaqXXSgPCjnjEAMePsFO15hWA3RmUA+FxH8CJ9r/Qi?=
 =?us-ascii?Q?aFUX4ehDxaBEIL94rK5aYi2c4mquyXSBJH6mczKB5HFVMG2k+Mz+vE0xMSA1?=
 =?us-ascii?Q?O4hbGNblCX4c4Gikz+7VQKJ99tDvBwogvMiy/b2MOoo+vyhSFTcdL7x5iZfp?=
 =?us-ascii?Q?XC2Xb4kYuWBCKXZ5dfu8+tBnDU4PpIOZkdqBdLNu1PwODu8MvFkZ29K6eUzm?=
 =?us-ascii?Q?UQ3j9n676yGn9PzjxMPFE+CtwCMBHEpPPk3G2MGc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06ceded-6131-4005-e21e-08db414fa24c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 03:30:48.6700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYyjqd2JmhRfD/tpBl+NERMhpz/f6oWTOmS2hHZco6fRXfu5yj0u3Zj2GlA5seztZtrmPG4kwSc8zLZXR3d3Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4139
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > + ctx = iostat_get_bio_private(bio); > > This ctx is not
 used for iostat. Considering that the next patch needs to store the
 discard_cmd
 pointer in bio_iostat_ctx, there is no need to add a new variable. We just
 need to rename post_read_ctx to data. Change bio_iostat_ctx->p [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.96 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.96 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ppL0e-00010n-Fu
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: refactor struct iostat_lat_info
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
Cc: frank.li@vivo.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 linux-f2fs-devel@lists.sourceforge.net, mhiramat@kernel.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > +		ctx = iostat_get_bio_private(bio);
>
> This ctx is not used for iostat.

Considering that the next patch needs to store the discard_cmd pointer
in bio_iostat_ctx, there is no need to add a new variable.
We just need to rename post_read_ctx to data.
Change bio_iostat_ctx->post_read_ctx to bio_iostat_ctx->data?

Following the above logic, should get_post_read_ctx be changed to iostat_get_bio_data?
Since the function is located in the iostat file, we added the iostat prefix.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
