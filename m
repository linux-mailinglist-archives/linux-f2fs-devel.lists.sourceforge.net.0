Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829F60C4BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:08:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onE3I-0000XE-7B;
	Tue, 25 Oct 2022 07:08:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onE3G-0000X7-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1igJR1WLpq4ZIV1qTJkdVLHCPvGLXkn2bLvrhcFyNj4=; b=mzCwBoZQWr+TFc25ddiomtmAEk
 pjtbuHVWOzwQ0ej8Q2YCOFX2AVLNMz3W/a1qF6fzWKT8ktgVZZVk+dctT8mZr66S/jJqOK0rW+kTS
 PFnXYictImT7vzmqQya2yoIoIrToe8GFcpatpnv1G0xT2EnOxsIGwzmOS9snjJTAuXG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1igJR1WLpq4ZIV1qTJkdVLHCPvGLXkn2bLvrhcFyNj4=; b=koLwg8CVUseez0348Z0iT4Bm3S
 JWVKPETvEucOxJaByex84CvLG0jZWHVGOiBvu+ewryv0SOLgCHP9RrtzyrWWIe7JKxVw9G8koW8ZG
 NrMAdKM+pu0/rAyztOeI1NSrLWELSRwiAkgpBMJ3a9dDAtCNc9MQyzLusLv5yx74QwuM=;
Received: from mail-sgaapc01on2098.outbound.protection.outlook.com
 ([40.107.215.98] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onE3C-00026j-4o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUEj4E8MVeuGSfoOru0dSjvlbIP2ML1orpYjVIBZZyJMvi/cR5bCqpBDisswvWO1+nz4tdjCBCnpJDgYl/VYdBZmdrDvqeiC7w8lRlUIdtQWfKvHGC/M6OsGraIJfM26THaT4irrt0B+SbBCLczxn5JYz5o4bVS9BBrI8KyFsTsaLgKtN9olr2r3hqpkaVf4FlwdDN8gn/SoDku7pVqMrp+LDxmD3zqEe47RcBGgVjGprSdeRY16OhpLstYzP+sw4KkyMsP5E2qkemvrr+To82WRNflvMjd42kA/4nz+1wFc7HiJE5d2yrFbYSC43ERzrbMz9JqVu/K9t+k5uYcgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1igJR1WLpq4ZIV1qTJkdVLHCPvGLXkn2bLvrhcFyNj4=;
 b=jBE516rJANBPg7qEOJpyxpj+DoiYxPJkdOywZMppD4wkXMZfiKJWvyjfThklUAJ9Ufeb4SrGv3f4j9/W94mGheu+conQuiCAp5sT5VKb8Dih8pQ2aftWTO3A0dQHaLAXQ32keqzHrloUHRhv+kr/BDx/43EBHHpJZ4GZ39icLg3FKE8w3/fhsOZMXHj9VPXWjzECrKDHZVlLmmNWnaAn4ArM/jOy95s+nsTGEiwVDYBfMQmIKHvQwn7J2ij03f8Y6pFT7SN+rfY64lCpwXsXKQAFDKze/gvOenTEfboq6G6ThKn28ZSiuRa2Rn0oKjqVOQcqTmP5+rpqL8VH/92FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1igJR1WLpq4ZIV1qTJkdVLHCPvGLXkn2bLvrhcFyNj4=;
 b=QcbIMGNTZR5LeinteKp+1tvg6lSpJCj7lD0LXXSvVWU7D7eWPDm7DDYwsVTVfFTCcnbxgU+sHWqcynF8nVc6LjWoh6eWriU5vTQjvNJWAQLmEyuLXfmyTRiqKd09UC9xzXy0daWqWzESjG5gjjaaTn7PBSE33LkhVIJDSdtxfq0jBu+9+X8wdK74Eg+CSzizridc/9/8VKguJCR85hODwmriuwPHJ/xmiAHw1XBHBYxvoLAtGCcdjpy2UMpQHqJ0FjVkXlkFiIR3mvnEy/8igtDTukazvgDNBt0swhaGqyRjwq6mt2fn5rFB2FB8aGG6wHhBzk9U5TgYc2OzqJ0Plw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4338.apcprd06.prod.outlook.com (2603:1096:820:75::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 07:08:26 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 07:08:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 15:08:17 +0800
Message-Id: <20221025070817.37391-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <bfae3198-7557-f984-200c-2c677881f462@kernel.org>
References: <bfae3198-7557-f984-200c-2c677881f462@kernel.org>
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: 14381d93-d951-4a40-2359-08dab657b604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMnLWCTIotxqtUM9h4msY5wyRMHyKCY/j4RJBEc+BsOvqlmojAIAz3upq7YFGNUq/qSlMXrsBWfjBlYyLXzlEtOD5/yyh2XftwOE1yHOoz5PRky3IEDIsaMNrjZG0mzCLBn4rhPI4tgBz9uKbOOYlr8Q4ap5A239NTwKLvtsYRfSP6tYfoTwW5I99exi6UthfNgCP0/u6TyCSVUSKWRCEGf+E9iuzkVTVULC8SzlQTfuyYqLkQunHclaZJ5JSAQDt8K05GBUfFJWKbjpJWELnLJ3Vd3xaJLzeYUCigEoHbSgmbVa/IhtLpYqCPbYuTkPFfH2Ufp01HVDwSfZVN46TnJjQKAWmKuJVZbX3+qqGVmv4+lvHdp7rIDHBmMN5UmzMDRILsqSjG9eeHV//jmSxNGBJFNWWNIVqik0rng5TtSuPGIFhyBDIdj6xnaNEC7f/LvHOcNfUyfLb+59N9s0VbjEPhHVKswaFU6XzuyOfe29+UH5ewthiqB7pYrwwM1kZzUqHYWPy81SHV0MDwOB/54t4qtncjoKuXyE9uPRWkKTuCgXnV3z80DtqnB0XrHzhHhmC6fYNVIbBNpkLcf6pgovupt8IxvSfoJpDP3t/gyxj2MpiqMszqbamdZoJ6ZMOa+A/QNnfgu2l9nh1pWfAXSRc0dVuLUEGcp6VrqrW4dpLeLtuVpzNOVgW9RDJdGm3NbTZZfuFGGZDjmizr9yKqcTFbdYbcXH8phfHMNzr+S2vO9/gTtyr5NzHX6eyNYRwP1gOJThKwU1O/l7QjtSrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(478600001)(36756003)(6666004)(6486002)(52116002)(66556008)(66476007)(66946007)(6512007)(38350700002)(316002)(38100700002)(186003)(6506007)(558084003)(26005)(1076003)(86362001)(2906002)(2616005)(4326008)(8676002)(41300700001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bokWasrEIzsGr2lBvx69urRYX4VTAtD5QJD8rpUyPSyznb82WIB4iLnTh88l?=
 =?us-ascii?Q?InsfV34LjQttOTYZk/fPbu2qGUE28UP8lVK6AfB5JQ0uFqV9cPKCupqOwjgE?=
 =?us-ascii?Q?QOBjoJBVh/kfRKaBMYBQH8wr2+HVJhM4PyoIfWFlmreBIscETMfwOHM7M5ii?=
 =?us-ascii?Q?nLbw9cR0YGn3XJNR4UFt1+y+xMfoZpSUCCq3EOgPA+qexpeaY2B33sgc934W?=
 =?us-ascii?Q?2qtQiRI5dNh+ckt8QV+nIlpQHcaLmaSKtnQSDNsn+1J4aBjsZuKH4PAfS6WZ?=
 =?us-ascii?Q?pQ26qmCZf8s9PqWYPui2aQ+xS3uKllEFkORYC3wgyNRZP6biHdJjmUU3kCSE?=
 =?us-ascii?Q?JzTRRuAfLiRLf1t1TEJTTFO+ucsC3XVZBAPqelUyd74a5szQlIQzynclezhL?=
 =?us-ascii?Q?RGRil9JxqFwrzBauSJEFPESnlo8l6Yqc5U6xEuHzwd2n+f5RgbaKrAZmKKbE?=
 =?us-ascii?Q?bBSvgylVkTKHre7Zc999jKIWbHtdBOQN/ArNU0l+ebM/UfsWvd+7Nh3tUCiX?=
 =?us-ascii?Q?1VBYqlL+t5U2qFRyTCvg4YzeLW30gcPQ+EqZmGwtnn8CTtoxpCF6RLMq9lRA?=
 =?us-ascii?Q?6EoD6g2PaXDeI42XErqky3D1fOH17zkL4JV4lZcziUcCdXc9k82nKyy2VftJ?=
 =?us-ascii?Q?om75A3piorTrnL9nwRjKDvRiGhXIYp4EHms0aSVbERPIOjiD8ifJsNY4Xv3u?=
 =?us-ascii?Q?K8yiQfs53AG8QtxxoThfZUoDyrQnS9iFhacEOYBxXOhYN6TR0Z4WDRJs1jNt?=
 =?us-ascii?Q?9BFpAg4yYLtieDj7ZOZMjkXOwn/asRXzkBacUKwWPp5RFUdn8vzCHHOHjhrj?=
 =?us-ascii?Q?dfm0/yAsecQJy2d752RJlz+TEfcWPmbOmvQHyDUeLKKo/2IZQKt2ddA8saOU?=
 =?us-ascii?Q?FKlCerTVjiIPLTIu4zqp5bwwNao0obqV2slnLsPkIvpUd8NZt7wBuL2N1PyW?=
 =?us-ascii?Q?0TYGhp2z2hNn6gvZVGFtNEOR27+IRDijnvS0n+ZqyafSrWaJw1WnLuuqYY/7?=
 =?us-ascii?Q?j8PvmkMo1tc4/1s+0KYftIE0+vBtTOlI5SyHxZbJFm9J606WBu3ZoUqdfbfh?=
 =?us-ascii?Q?rpng7ZoHaIOQnme+oFWcuVWMw6ZNZ8DU8+kW6v59/GPgp20l964wlWy2yhIh?=
 =?us-ascii?Q?6s2kJGpyuFh9uIO9NIRY9KIJokv23NvHM8n2Nzoc/GuSYU5EsJ7LO3RXiERV?=
 =?us-ascii?Q?pdy13tOanNnGyrBBfEcCVw84ohsfOCcrXXyQncu/DnDbbVbWcqvYi2qieGep?=
 =?us-ascii?Q?gNaFmiMR9L7obukfcD90IOUIjTkyB2xTtprTqOkvVrgm2C+0THhe0O8cjg85?=
 =?us-ascii?Q?Piif5puW7AtEOeYwzxj3o0cll22fkdJ2n3Y+7fRt1CCN62MoTkGs2t37xNz7?=
 =?us-ascii?Q?hKhE8Dt0cc5akK6GPxM18A0F9gNuUWPP0JAqYR3U1x2myhRFbzNIp7vReS0/?=
 =?us-ascii?Q?n0VzvTJFKtwSIh8yj+OOZ2bi7T2uADx6wKrP1kcriT2XVIKlm+ZcLNQpT1w/?=
 =?us-ascii?Q?yBHDQ7kV0mn+DiT1YS/wTwlG47LvWzSU1WnTMuU/GxaQsUrG1MWM+uc3Q8kG?=
 =?us-ascii?Q?FVYloC/OVv/TLVveUw3mFcRkrajqXqiQuCmatAR4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14381d93-d951-4a40-2359-08dab657b604
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:08:26.0668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8n2FK/sRGMZj4RYwZJtasb86b+TAxhElQeFMHHdF7NcbCFl2O99638OdJxg47VpPtksPU2r0FkKbqXlHMngDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4338
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, In my point of view, it should not return 0. Because
 calling kthread_run() to create a kernel thread may fails, and err is assigned
 a value. Thanks, 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.98 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.98 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onE3C-00026j-4o
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant return in
 f2fs_create_flush_cmd_control()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

In my point of view, it should not return 0. Because calling kthread_run()
to create a kernel thread may fails, and err is assigned a value.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
