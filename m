Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9B931461
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jul 2024 14:35:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTKvT-0008CL-Dz;
	Mon, 15 Jul 2024 12:35:31 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1sTKvQ-0008CA-FU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 12:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1dUPwm49oymC+fsD+cUj/5nFqMGb/RVnbzhMsp4jhGs=; b=Lq5hw/UlZchAokk0BSz++M/nY2
 P5iH+TpJAv5f7/kp8EUZpFgdZy/Q3Vbbl9iOAyz0MdW1ez5g7ohUFx4TCcW+VYg/X+9ZOOVB2tQsO
 U6kWPhzP7NTKKvQwFSF3oUI4Wj99V1WJdCEuclbFM4gXCDOrGEoUiyYSDnEa4hpPNsLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1dUPwm49oymC+fsD+cUj/5nFqMGb/RVnbzhMsp4jhGs=; b=PVbqpIZ9GvvoHo/HSteihrx8ZF
 s6Ndsv54IK1vaPQLaIQ8OFfNlKCJyupm6f+wI10RGUr66LzyeiFgFJyvD11Bd+2U5Bqsyw8bt+lge
 ZDUbdDkSFObFUbAZWXBbRu0tkT1a99WlGXyAtDE/ReyUXoy0XS3GlCJUKBgB3rvwcRkM=;
Received: from mail-psaapc01on2087.outbound.protection.outlook.com
 ([40.107.255.87] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTKvP-0001ec-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 12:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evc2vV32GFVUzOWvYDCqrNw7wEbQBV/2dmO0SdQ39Z7hcrs2SiZmEKTCU3+duM21qw3xZuOhMfldLGeBcerEqY8yhG3Vd6jCa7JbDXqu9MnmVOWakJZOonK+0D5AkDkhl43Tr4UdzfgD900VDyFU+PnkXceIo087QHv9BgBmDCicY13WFyIK21GFHjvv2ZGA+i3s2aYDKqz/UefldUb/kv0Kj825Sbngp1gFiRVPqsV8UKSF3y+RcFkuJ1uaCONYWFxCyPdywS7XECz0CeDYaQE6cFWkpAADaUsTVYljrH68x0LervqUKz8ychfWpWb71ZF9ue6BMARit/0k/Rq2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dUPwm49oymC+fsD+cUj/5nFqMGb/RVnbzhMsp4jhGs=;
 b=O45YyUOXoTgOHgJWakyYY9VmPIOY9bsaRutfbqGYphhtYwAZQl3ZIU4CRPNHuGHOtKI2o8OIa+HkAlAKvXvAvm6mHSJi2O6S3Cu3HPLTQdt8PYcZ0OPrnDpz9GbJta8XIq6GslXlxPSr0qGXhWxZef80lW3pKHe2EoviVA73CZ1m3s08yeibAVEMxBoMFBN7RcalEjWHqN+bpEUroLrjdlJksRe2h/jT6zf7lT0KFCTOtyA/wlmW3DTEe5qJb1LUQJ1XYgKJGWBLchGDxX4Q0t20TvccTyHCNyknpEwx1gAm8WaBnvlEnC3D/KpDVx0OmLo9lzldmhh+muq3qXvjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dUPwm49oymC+fsD+cUj/5nFqMGb/RVnbzhMsp4jhGs=;
 b=JE7nFDzMK2E1G1wNSOR/dpLPZx+PiDrIMsrkn9R+0LkkO7ODlhDitb4oQf528JlnLsUsFNbOMxhb2eggD27ObvqwBt2gMdr6UsfKaar5X784YwU7NM1j512/Gbb0/DqLMfi5XhHzSZLuxgP444Y6gezYp+ZQ2YGrsxtweCWvK/crdzYkJs2SjNqUqH4WJN1Re1+VVrfLCBHfvHpEmLESBzsd7C1r26p4KBsApLcQx0X4saz3pJBk1zf3UQgJ4qJpFi3OVi/sMYFtNHRq8Kn0L4LP030m3U9zIuAOFUjh+OabO4SVE/hzIdZgxVRVSjM5vKzVa1JFkzdYmuW7G/InRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5282.apcprd06.prod.outlook.com (2603:1096:400:207::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 12:35:12 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%3]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 12:35:12 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 15 Jul 2024 20:34:51 +0800
Message-Id: <20240715123451.7918-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702062952.28859-1-liaoyuanhong@vivo.com>
References: <20240702062952.28859-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 758e93a3-c882-4130-2101-08dca4ca91e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PzppIBKFiFakJpUOfOPVSuqaPdcD2CDhfWYIlQzOSBeKfW9sVKtPKNaCTeZO?=
 =?us-ascii?Q?sUv/Yn4yLoT8qOtJ4qoECuSj24ou5r8Z6nRy1FJ2grBRYxggcwZW189EmHmy?=
 =?us-ascii?Q?25PtdyrQywWhCv6OZKhCqk5eH3f1qHDh4QZlq3G6Lb5kV14Ce7kYWACDl1uL?=
 =?us-ascii?Q?M0tlLV5S0VpHd/2jbvjFnVuCZE0Xd+g3PohhT1BSzY22WnQAZ+Pf51KWfLZ+?=
 =?us-ascii?Q?CsP0RydMY7bVZ2deTZA8qiAMeb1qLzJp2dsN9Gq53QvQFAVNNMvMgDK32Fzg?=
 =?us-ascii?Q?zpIsa11Ai7CyOQvxhLBLWPJsSyH47sk+6FgQaSvSU+hNW/h5C0erNV8p46wL?=
 =?us-ascii?Q?8xAzQjrhZgq8iLmrEvA1FPM+KAZXTHNMRmE9QyxqPpD/j2JVAxC3Xc4N4DeO?=
 =?us-ascii?Q?n5cEShlo9DpB//6yA76tzG0c0lSW2OpS4RJZHuW55q55+/0cTZNiHj4OKf/8?=
 =?us-ascii?Q?whI4x6gm+D7rJ5Nku+7ILI5nhnDbDeVXVFzYlGh8G+14Ndh8qcmDbKlKrtV5?=
 =?us-ascii?Q?/17xxm2ltpSIjef6nSmtaI6iWzSToLm9MQ+o+jhdibsrO44SPADBJH/v8HCE?=
 =?us-ascii?Q?SJD9QnmsSBsspDeQGatU2CqKwk1PNmZP7Y56vXeBEkCfbYqznq7bvbSFWOQL?=
 =?us-ascii?Q?9uzo49Snj7GSCE0GjqIdzobwBywcIJF6BpznrHhQPK7HFbLZJXtr4q3X2vmD?=
 =?us-ascii?Q?7VbIzCZ6NGHLx3n7Mi+B8Mvkn9++2yFm0d05EsL01Qm6k3k5+oMEg3PZzpNP?=
 =?us-ascii?Q?kskCWb62QLgM6wD+/i50kUpjYI6UjuZD2Vg0824l9SIc+k9i4urtpjP2PCb0?=
 =?us-ascii?Q?cCp2hpFqIqP997oSZYabQXg7ouUsSBht+JRP/PZCvxm5As1qm8ecqQE5/OrS?=
 =?us-ascii?Q?XyDFh9vrDY+tEIOVX8zELeiHg9ENTgBe7cto4zcuo7tK6t5Hv1LiGfB5D6cI?=
 =?us-ascii?Q?urZOkYh0SBkqNBT7ej6w+0LhEqDJ3lfZq343KLDDBwvrI6RzXp3Gif8bTgbp?=
 =?us-ascii?Q?bNlU0z+sqGl5a8EqgB7GI/zFwfCiKhRp2p14AucHtDXfCEmdwOl1ccAQ3yKF?=
 =?us-ascii?Q?X8wift5TlhRHC+exc46OqNNDaR6Hu6eSGpVjAmUv14Uw2e06S4Vz0TnMB4qG?=
 =?us-ascii?Q?FkP3vY5n2fM1KXKipBrEqAomuWmD7WZsDP5QLUW4wboLr9O1wjr1+/xD8kT6?=
 =?us-ascii?Q?U2x9BH+DbwTUsO63N6xc7iisMM29SNwS8fHZzR/k2HdcZJBXSnVKKz4nEZRl?=
 =?us-ascii?Q?DAT5iKhyJiRSqhXFyeYmmnLshD+I/6mY4NzprwP51cDPM8rtjlZliuJ1/281?=
 =?us-ascii?Q?Wpyo6otC1UC7wu2l5xXo7t+TrlXDfJauu3+Oy6juKNLNaLyjmtRPbWUSADVo?=
 =?us-ascii?Q?ijv5maQTZUrlGv77gipT8Jac8T28DvPxV2qDRgldiS7vIaqf4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5ZcnuQj1qrktih+dT6fuwXVHblfL73FO7aAw5CYjk9t/UkfgTFPPfQrP9wQ?=
 =?us-ascii?Q?2AHNqHUDqTbxPHKZINPpHMvXxQ4pQasczoxTefmy21s6A0h/jJFLk8fR8dvb?=
 =?us-ascii?Q?yNZQ0ycda2VMI/kTq2xSJe+KeYgm+YTdi+54xTalxekpn8u8CW9RCyOioF1Y?=
 =?us-ascii?Q?2thIu+oHAyyCxy2MRb2zP034k9oWkKUbNOlQ7hR/BJ7oVqlE0Zw5gT8WBPgO?=
 =?us-ascii?Q?3Sg3QzUebnwXmYvGZ+jNQe7xvdXBeGLIJlID+2A+fEnSdwNZr+dqLuAgQWKi?=
 =?us-ascii?Q?aanIudwqF1O1JHjFUqsiDqYE/H1yMX6gUI3RnB7ySDK96y0vTEOtdhEz0N9a?=
 =?us-ascii?Q?LNpVjPtpDYkf21PlHa8A5EsEQGf08uit597RObH/kpZ9qTvDu1NLGqyc5HGw?=
 =?us-ascii?Q?1/LfAWQU/oeGClOUpNRidcrWR/Y+OkpJOrRRMP1w/dOk4e695z0OD9RbOL5E?=
 =?us-ascii?Q?51X3wgj/Hr5LF38jm+3tNogBRX4WX6euTJ8460YDrIQ06poeMOg1jVspbo0T?=
 =?us-ascii?Q?HmMRGicVohCOlD/w/7WCIRUXvLj3pHcT33V3ZDI0dSXyZsezcitSorF7dpMx?=
 =?us-ascii?Q?/DpYQpB7UNf62GO0CyVaKoD+p3SnTkIweesQW3KWys/MDixDgIm6y8fOoRZ6?=
 =?us-ascii?Q?9OBqPL8i1txQzkLql9Q8P/8vtk3IAY5NrutFQDQTk/E2vCvD33CB0E6rVnax?=
 =?us-ascii?Q?Vh15NsPPz1q8L8YvdRbBm5vLJUx1Dz7WmPfCOVU7N0/o9l0aTiFpaxQbZK6C?=
 =?us-ascii?Q?2wYjXNQZpXERMHKp2l6DBeFbYEufKkydpQOZNsOCyuoteA5RFEnbcAsoQmKQ?=
 =?us-ascii?Q?bHxm9/FongI2zFNhjys66Uoj8lQQTlgOd2rgAPLfbMdiw4ncI5/I62mQrnxz?=
 =?us-ascii?Q?T8MXgGwdguD3PSrDxVZXipLQMDGKYh01LyFuM23k/avs88hUh6BHWoo4/PS4?=
 =?us-ascii?Q?vanlHlyZMtlU4EhfNuU67I+vtS+wKbGcSMtOuOYEUmnsOfQIALEeSGuCi4a+?=
 =?us-ascii?Q?5uOxAzwQQTG9RwKpifgW7lkRDDCCAtXKOlyj1VcHezgMc+Pt2cMHdeTDrO8E?=
 =?us-ascii?Q?yyj/xVmaMjE9o8KAOnmvR+ivmM3xqkLMD5MNj55SPFhFz+VkxGRtDInFlhjE?=
 =?us-ascii?Q?WkcdEBU5fCee25mhzu0zFvop0FYlSIV1QYwig0Js9lbxBjIctkgjkbmXYKkW?=
 =?us-ascii?Q?m40yMbcsPcN9+nVQ/EJpXwfixXGSdfp0HuAow+DbfBzxpaq5CHg2opemKpu7?=
 =?us-ascii?Q?xhOyOUH57Rc30rMnZvLoVOF0NxuUPjBTNFzYmvf7Jl4YepOM2+8patpljtQf?=
 =?us-ascii?Q?VyIfEOT36S5JPyhYt4FaZXG+ytmP1e0KOAmAIn+J2P6v68fpdbqF54zRHJE5?=
 =?us-ascii?Q?6jZTCOESo5rXgp/+63MUcuAEl9l49Jrq820TtsD2tUEzzE+cZz5UlQHEjWuI?=
 =?us-ascii?Q?ZCypydR6KpZCReFvViGA+R+vS4npvxgbzR/7gTMJacbY045PNrBt/qoDVul8?=
 =?us-ascii?Q?qdpC1GcSv1z/7fXyg0Wc2e88mFsIWXtw4hffFPIMGsnty7EwttB/SpPSdetj?=
 =?us-ascii?Q?XnfiL60nw4+J/esvWeKZch+PsMoOHEDRbCaEKl/1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758e93a3-c882-4130-2101-08dca4ca91e2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 12:35:11.9716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQTV/P5HpptHiDd7Fd9RHaGCMoCL5HYeeWnUCNWL95zGQXJ6QimamtWau97mh6OjHenOeiHOeNl3KMhNWxSCWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5282
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, we are using a mix of traditional UFS and zone
 UFS to support some functionalities that cannot be achieved on zone UFS alone.
 However, there are some issues with this approach. There exists [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.255.87 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.87 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.87 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.87 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sTKvP-0001ec-W4
Subject: [f2fs-dev] [PATCH v5] f2fs:Add write priority option based on zone
 UFS
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we are using a mix of traditional UFS and zone UFS to support 
some functionalities that cannot be achieved on zone UFS alone. However, 
there are some issues with this approach. There exists a significant 
performance difference between traditional UFS and zone UFS. Under normal 
usage, we prioritize writes to zone UFS. However, in critical conditions 
(such as when the entire UFS is almost full), we cannot determine whether 
data will be written to traditional UFS or zone UFS. This can lead to 
significant performance fluctuations, which is not conducive to 
development and testing. To address this, we have added an option 
zlu_io_enable under sys with the following three modes:
1) zlu_io_enable == 0:Normal mode, prioritize writing to zone UFS;
2) zlu_io_enable == 1:Zone UFS only mode, only allow writing to zone UFS;
3) zlu_io_enable == 2:Traditional UFS priority mode, prioritize writing to 
traditional UFS.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
v5:
	-Change enum delimiter.
---
v4:
	-Change some constant's name.
---
v3:
	-Delete excess comments,
	-Use enum instead of define,
	-Modify some judgment criteria to make them more reasonable.
---
v2:
	-Change name to blkzone_alloc_policy,
	-Update manual of f2fs sysfs entry,
	-Use macro instead of magic number,
	-Initialize it w/ default policy in f2fs_scan_devices,
	-Add validation check,
	-Merged the ifdef PROFIG-BLK-DEV_ZONED area.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/f2fs.h                          |  8 ++++++++
 fs/f2fs/segment.c                       | 25 ++++++++++++++++++++++++-
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index cad6c3dc1f9c..3500920ab7ce 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -763,3 +763,17 @@ Date:		November 2023
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls to enable/disable IO aware feature for background discard.
 		By default, the value is 1 which indicates IO aware is on.
+
+What:		/sys/fs/f2fs/<disk>/blkzone_alloc_policy
+Date:		July 2024
+Contact:	"Yuanhong Liao" <liaoyuanhong@vivo.com>
+Description:	The zone UFS we are currently using consists of two parts:
+		conventional zones and sequential zones. It can be used to control which part
+		to prioritize for writes, with a default value of 0.
+
+		========================  =========================================
+		value					  description
+		blkzone_alloc_policy = 0  Prioritize writing to sequential zones
+		blkzone_alloc_policy = 1  Only allow writing to sequential zones
+		blkzone_alloc_policy = 2  Prioritize writing to conventional zones
+		========================  =========================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7ee6c5e371e..adefd19810ff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -134,6 +134,12 @@ typedef u32 nid_t;
 
 #define COMPRESS_EXT_NUM		16
 
+enum blkzone_allocation_policy {
+	BLKZONE_ALLOC_PRIOR_SEQ,	/* Prioritize writing to sequential zones */
+	BLKZONE_ALLOC_ONLY_SEQ,		/* Only allow writing to sequential zones */
+	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1555,6 +1561,8 @@ struct f2fs_sb_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
+	/* For adjust the priority writing position of data in zone UFS */
+	unsigned int blkzone_alloc_policy;
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..026b61602113 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2686,17 +2686,40 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 			goto got_it;
 	}
 
+#ifdef CONFIG_BLK_DEV_ZONED
 	/*
 	 * If we format f2fs on zoned storage, let's try to get pinned sections
 	 * from beginning of the storage, which should be a conventional one.
 	 */
 	if (f2fs_sb_has_blkzoned(sbi)) {
-		segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
+		/* Prioritize writing to conventional zones */
+		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_PRIOR_CONV || pinning)
+			segno = 0;
+		else
+			segno = max(first_zoned_segno(sbi), *newseg);
 		hint = GET_SEC_FROM_SEG(sbi, segno);
 	}
+#endif
 
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
+		/* Write only to sequential zones */
+		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ) {
+			hint = GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi));
+			secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+		} else
+			secno = find_first_zero_bit(free_i->free_secmap,
+								MAIN_SECS(sbi));
+		if (secno >= MAIN_SECS(sbi)) {
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+	}
+#endif
+
 	if (secno >= MAIN_SECS(sbi)) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4a1bc8f40f9a..95ae6de77939 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4229,6 +4229,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	sbi->aligned_blksize = true;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
+	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fee7ee45ceaa..63ff2d1647eb 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -627,6 +627,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 #endif
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (!strcmp(a->attr.name, "blkzone_alloc_policy")) {
+		if (t < BLKZONE_ALLOC_PRIOR_SEQ || t > BLKZONE_ALLOC_PRIOR_CONV)
+			return -EINVAL;
+		sbi->blkzone_alloc_policy = t;
+		return count;
+	}
+#endif
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (!strcmp(a->attr.name, "compr_written_block") ||
 		!strcmp(a->attr.name, "compr_saved_block")) {
@@ -1033,6 +1042,7 @@ F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
 F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 
 /* STAT_INFO ATTR */
@@ -1187,6 +1197,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
+	ATTR_LIST(blkzone_alloc_policy),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compr_written_block),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
