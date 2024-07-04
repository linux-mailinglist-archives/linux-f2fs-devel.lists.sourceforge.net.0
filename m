Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D266926DB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg6-0001CO-Kc;
	Thu, 04 Jul 2024 02:58:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCg1-0001Bi-ND
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1hs1+hdANdVN1BUwneBSp0vasIxkCokM8rAz7mqWiM=; b=TStO4d8TpUosGGwxwKOi6v4om5
 191qM0Eskpcp+Rr0xT7R0fgIW9m2t2/oRU5Nw8kWAX6zEtiaj7mXdMl6uVPkNIvpLJwzkGrZEmk14
 Q4VlV0DQCeL+x8M5sCrSDCacWt0wweOlzoHsL2BxgG4srPLLHGEsfTTRTV1LkaaPIBnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q1hs1+hdANdVN1BUwneBSp0vasIxkCokM8rAz7mqWiM=; b=jdLRvIgefgmzZRPbOaEymFnQru
 fYa77y8ZeAm8/ors5k7hdBpX1GcPgy5L2SVDjgMiK/I+JVOisdk24H8cGX5d1DloQLATqylbM1ffG
 hSTE+I6WQ0U52MB7NA2WZdcp90rd10m5Sk27xpy8sgMmAdwjfofl4sl2j51ve25kspec=;
Received: from mail-sgaapc01on2054.outbound.protection.outlook.com
 ([40.107.215.54] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCg2-00011d-Iy for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lH9/N7l2Bn9b1uFmPGGxxef42+cJ5h0Ex2bJvJYHpNjL/LepExsxu5skskKq3eLJ9U0t3Q26IYYURAd2U7sjajkoplI/zP8P88UOSqztvk6U1Zy1bfQG9T5TBXR5i1jfyCFnou5Bztrlz6ocWUTl4uG+/glZs9xjKi0MdJF8x//P2hb7neUebydzlDu3YhHTB5LuNEpBRzvUW63yPOKXDLx/C0cuIMGUhiJmSmHe/y0NyANm5FSsWdTvSugbzRjdZgRuzPoM2w/JlPflOOdFVbOPW31D+Ua8ODueWxiZbWuNfFu/mQXhxeru9tPaFGb/Sfy0+HrhGRB/rCHUXg8Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1hs1+hdANdVN1BUwneBSp0vasIxkCokM8rAz7mqWiM=;
 b=CMkCwfg+1nS8wpfWDMfYuBn9Ir3n7GCoK0qW9w5oKSJI/nus6kQ7sDBEt8SVlGF9RaQ8pzyDE+hZmke8KA3Y2xU/9YlRq8Iw/IER3wdu7aJJ67d7gwH9uclWw/X0XJP+Lr2lKOeSS1VuV9Sk/1z9xbXlEoD0PcxbAyQ0bkxF02c5C1qRrelSAIKYCBRooTjxJR0RvvnAFwiqMGlup3JWqmc42/k9m8oi03VPeHo9GNUGvwOYH0NTJzqenpn566xEwAbblMKlfErSR8GtOFU1Zs9sznXoIF2bUmov3dco0JgB6Mn56M8MYVpWlVlRoTk3BwOTRRtFDujpTTP2qq4e9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1hs1+hdANdVN1BUwneBSp0vasIxkCokM8rAz7mqWiM=;
 b=hE2gvqg1PqWVnoH6POLnsu2CDAvEzrQU/t5vWa6PlsEYPmxJm/0MvflQPLAiwatyYSbZq+Hjn82rpKJxR0+qUANOWg01/8aZMw8YbyDm2b7YKeC01ufEkP7hAFrzwKocU83eCUHkgTiUulP+MmzTp9DWUFCJWp9tn1YbDsF6gYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:17 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:17 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:39 +0800
Message-Id: <20240704025740.527171-10-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d015f7-d8a7-4412-2c53-08dc9bd5277e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JkE/QnuoxwZrmvYXL6QUvCFoQhrTVakpL1yRAZMBQXi316BhbApOKB7tVJew?=
 =?us-ascii?Q?pBGfuYiy8MFKwhl6UaPVdlUUiYBuKJePUL4SF/z1BkUyemRctampgqlNTe+y?=
 =?us-ascii?Q?X0oPwdMUnyKZy7ptQbGn9yllZBDLUSLltEFRipuCYLZbQJg47oFTwYMu+Wj1?=
 =?us-ascii?Q?/mINv1lEtSe5HS/PaFHjTjZgX4qL594C/fB+LyaDnvcj9D2bo1k1RZjE9nPg?=
 =?us-ascii?Q?UftlRvFfIMHBhPHEbdMuie5Y74ajsrKhAu+5AYtNGhIJob3Ps9xLcBGsFk82?=
 =?us-ascii?Q?5dqj8/mzxDKpIGmtre2UCPvtYHkYvyQutBKyG+Gvwo7odJFB0/MHB97zOJ2K?=
 =?us-ascii?Q?q6h7c/bvEOUFrysklJ/5VNLsc0Ls6r0KIpEKFDm4XfPQjmH2VBwltP2r5xFp?=
 =?us-ascii?Q?IcqJKeXvAz/5bGYCmSHrp8Vdifxd+ZTOZIsFn3QhCbEBEdS6nRUtYwLOXHmK?=
 =?us-ascii?Q?7TzBwQJpsjco/LdETnerrPtONckv1WxusSVumjX3epu9n+8DUiCykmmMohkO?=
 =?us-ascii?Q?lyQCPt+Dq6gE//ea6roilLMgJwjcGaZVeNTaSiUby6cIZYtz8FC+CmsrAITT?=
 =?us-ascii?Q?XqIdNgye4Jc8mKDMHRFQ6ocPwpho/TtVkybzM6ilFBmdSTT0lGbki1ergkqR?=
 =?us-ascii?Q?EseYmixoMAknYwUZX2/LBk4iSbXo4b/6dDv9bJinpkVr67tiE6F5NpNtDWxE?=
 =?us-ascii?Q?2DJSrZVKnUYsB3MwnyYcSLpX8E0cLGw5TWgInk1cvAv1hSJd/TPNx3SLxoSu?=
 =?us-ascii?Q?yjteOddCsBdFx5C1MSLc+GCdziLO/0uk9G/PfeuB7PdCYTdoM5xYOsPG4kTD?=
 =?us-ascii?Q?TB/VjVxaelnXlXqFVvbQX6kyFZQSYEak4zEVuaHvLVMZ5cvftrZ/UCgWXjX/?=
 =?us-ascii?Q?j12p+gRHMD5pwJliV6er+vnSm9GVNJebbK5Kw2/JuY3Q31MagwpBT5acyzOK?=
 =?us-ascii?Q?VF5KaOmHbrAbzqs8Sb0pgDntm7DGJ2k07QRRENLlqhMPSGwhajva6dhcOvPS?=
 =?us-ascii?Q?3v1igNA1DGCc4yZD8/3+uEV7udQ+aq4/5jk6A/NXVeFVbVLqjos+C+2G4Nwk?=
 =?us-ascii?Q?nUCFK8VQK4ijTaB+3vCAkBzCDj1Ef1JbyNH+uKCzEzetguraoSpdemYb4hzk?=
 =?us-ascii?Q?y3+xvsnZMDA2Iq2kGsALHW9YKgKn90xcRV/mx4GxSejty7RY/+W36lpD/Aey?=
 =?us-ascii?Q?izgZM6nzvWGzmKBW8UjTVjo91fvyI4qfdbw3Zly9BHNGR6blzB6fCL25t+ek?=
 =?us-ascii?Q?V0Yx+g1wj01B64Jsw3sc2IRy8Vd8zPxvzNldpnrHSuKU/3ZDwo2d5W0zqRJM?=
 =?us-ascii?Q?Db7qQBz93t5JHUVLw+eEkayOOHkrtC37cnbAaAJlbfOgjR2oBnf81Zi2oTBo?=
 =?us-ascii?Q?G8IVtIwHw/uOgRMXNbcqkBbYhIxzS0yCoLYsulhtpeO1MP/S6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4vJ4JCYWGCWofzY8nDj4QzMq+zmpQI0aOJ3NQoJPLbBrQ3Tb6u332t1rPmmV?=
 =?us-ascii?Q?62WKFlhXiOA48qeHlIisKUFDlwXUqbO63Ma509he/hBEiidynWfugMhjXMMB?=
 =?us-ascii?Q?VO8a4327Vin28WM3uuLbICtk7dvhBM7W6WA5z4Iq9pq5J7NXBldi+NPC1U6h?=
 =?us-ascii?Q?xcBIi2qogCem2EU+HLZ0GbpF9ySHlHH95QHKYMpqxhZibFidcLiX0+DINpEN?=
 =?us-ascii?Q?kMltoiCSGEqAqhThBGRMfpuJMTGBi0oHHTlgI3RVrkOlzXPVjO55oyqR9+oW?=
 =?us-ascii?Q?vhkZmGhFUiRxxysbtOAy+mxD7v0Bj1oI1HbhQqpCvOJw18q5QQeYaKkQ6fgp?=
 =?us-ascii?Q?ejEcdYqDhG+kiwxli4Ud2OTSwsR1RFl3BPsamojDqoaNAUcbBAMJMgkHZjOJ?=
 =?us-ascii?Q?mKnoO79aIC9dz9tMlc3rYC+btFRst7fWYgKyq+1GSpsq9GojDcEQDJdds77Y?=
 =?us-ascii?Q?vweI03hzs0xKj/X4uFvO3i5nGdE11hDRJ+RlmACryol+9AWWrT40Dn91WeQ5?=
 =?us-ascii?Q?E3tkPiJdjF7kwI7G02FP5C/tiyHu0ep9Eg+tCHns5Pz6OzghbPZ9+iUHR2X3?=
 =?us-ascii?Q?dTvxxE8NXGmf95WnpK5TAzQJ75K3kUDLrTWvGuANe34bfeoAykek10TWfCpm?=
 =?us-ascii?Q?JgoFWejDC34HjOtoasTj5EeZkUnEPZCHG14XFuo4S/ceUWhspbN0qD5tQdHr?=
 =?us-ascii?Q?W+i08I4A/5xubtOY5E+a2ieNdZQ8gxkNmdv8NurZ4ZdT9/mCB2Nrreh4Xbpa?=
 =?us-ascii?Q?nFS9nVx0rVP65FEQiJh6vXg0t3kjNlLYlu5wdH1AemmvLNol/qy89Q4JU4XW?=
 =?us-ascii?Q?XnlG4HSq8cSdjKj4dn7IpLk4cTqupBKeOsCb/VR3H1pRhHc9DkqyFXX+cPmx?=
 =?us-ascii?Q?s3JXj1lkD7XKYTe7YPSmY/xs8rIum8eAmw3JTTP92fgoUdxCdOfp0qblvZd6?=
 =?us-ascii?Q?8r8BSCUm0pK2S0yFudGw+TlQyE4/+OzVYKNJ0hQ7JyInLpwHZPtb40MIcm3L?=
 =?us-ascii?Q?HLuT86+rpgZoTQdSioKToMTbWh3uRUdGkZTZ1DX+7ZoMlS/NYQXkst3TQsj/?=
 =?us-ascii?Q?6w/IaC5jGwxvyY0VmsnEsIelB4sf7f42h5BGQH7tnjx9Ksg3mD3sjrOdvxJa?=
 =?us-ascii?Q?GuJIFYUo6sMJGytOw2Dy2y8MTgpLyyH6/HU/1SIA1LBnrGVqOwmsCDgrNeF/?=
 =?us-ascii?Q?IrtUDJFruGujWal9YmIxU7AKFSkfUc2cIv2+WpDo7vM2kdOUscYa+M+cR8i7?=
 =?us-ascii?Q?Mcjzvhsohl+Y90mnWNvCeQc34vAYdcapqW1MIiITFQ8SoVfydXOAeymgbmve?=
 =?us-ascii?Q?3+3dJcftCMjxQagr1A+rDYUNX/h1vK3pglDwzSr0M9aj1BQZFjudjKN4/Zcz?=
 =?us-ascii?Q?RhwR8MbVL5VroZ76PaftNaMunQ4czqYpVPbGkxNCmHo5WEOjpY9oS/YC0MWG?=
 =?us-ascii?Q?D6VcgxNTDft/rA+iPWrS40w3Mf1whKnG+b2olCsG7JWs9NNuLpUq9DtiLqNQ?=
 =?us-ascii?Q?+AqVtM2Kjoa1O1QHnwIixgIw74BlH5fNPLKAT60armUNpBh/oiomyxB2KVFD?=
 =?us-ascii?Q?03ihjg7uPc9Q0kp/+EAGRSUNL1+bQaY3q/zuUGCA?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d015f7-d8a7-4412-2c53-08dc9bd5277e
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:17.5010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnf+B7mu3xhF7wp27TELnYUSUMI1WXOjQgds6yy2weA2EWN5AVlCQ7Un/4BR9RLhWXBRP+faTcu4jWXcHA9v8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting dentry block or dir entry.
 print_raw_dentry_info()
 is added to show values of node footer. The meanings of options are: * dent:
 means dentry is injected. The members could be injected in cp contains: *
 d_bitmap: dentry block d_bitmap of nid * d_hash: dentry hash * d_ino: dentry
 ino * d_ftype: dentry ftype 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.215.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sPCg2-00011d-Iy
Subject: [f2fs-dev] [RCF PATCH v3 09/10] inject.f2fs: add dentry injection
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

This patch enables injecting dentry block or dir entry.
print_raw_dentry_info() is added to show values of node footer.

The meanings of options are:
 * dent: means dentry is injected.

The members could be injected in cp contains:
 * d_bitmap: dentry block d_bitmap of nid
 * d_hash: dentry hash
 * d_ino: dentry ino
 * d_ftype: dentry ftype

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 184 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 185 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 2a21dae..a7d2a2c 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -10,6 +10,7 @@
  */
 
 #include <getopt.h>
+#include "node.h"
 #include "inject.h"
 
 static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
@@ -74,6 +75,17 @@ static void print_node_footer_info(struct node_footer *footer)
 	DISP_u32(footer, next_blkaddr);
 }
 
+static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(dentry, hash_code);
+	DISP_u32(dentry, ino);
+	DISP_u16(dentry, name_len);
+	DISP_u8(dentry, file_type);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -92,6 +104,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -186,6 +199,16 @@ static void inject_node_usage(void)
 	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
 }
 
+static void inject_dent_usage(void)
+{
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
+	MSG(0, "  d_hash: inject dentry hash\n");
+	MSG(0, "  d_ino: inject dentry ino\n");
+	MSG(0, "  d_ftype: inject dentry ftype\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -206,6 +229,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
+		{"dent", no_argument, 0, 14},
 		{0, 0, 0, 0}
 	};
 
@@ -294,6 +318,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->node = true;
 			MSG(0, "Info: inject node\n");
 			break;
+		case 14:
+			opt->dent = true;
+			MSG(0, "Info: inject dentry\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -323,6 +351,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->node) {
 				inject_node_usage();
 				exit(0);
+			} else if (opt->dent) {
+				inject_dent_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -898,6 +929,157 @@ out:
 	return ret;
 }
 
+static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
+{
+	struct f2fs_dir_entry *de;
+	int slot = 0;
+
+	while (slot < d->max) {
+		if (!test_bit_le(slot, d->bitmap)) {
+			slot++;
+			continue;
+		}
+
+		de = &d->dentry[slot];
+		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
+			return slot;
+		if (de->name_len == 0) {
+			slot++;
+			continue;
+		}
+		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
+	}
+
+	return -ENOENT;
+}
+
+static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct node_info ni;
+	struct f2fs_node *node_blk = NULL;
+	struct f2fs_inode *inode;
+	struct f2fs_dentry_ptr d;
+	void *inline_dentry;
+	struct f2fs_dentry_block *dent_blk = NULL;
+	block_t addr = 0;
+	void *buf = NULL;
+	struct f2fs_dir_entry *dent = NULL;
+	struct dnode_of_data dn;
+	nid_t pino;
+	int slot = -ENOENT, ret;
+
+	node_blk = malloc(F2FS_BLKSIZE);
+	ASSERT(node_blk != NULL);
+
+	/* get child inode */
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	pino = le32_to_cpu(node_blk->i.i_pino);
+
+	/* get parent inode */
+	get_node_info(sbi, pino, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	inode = &node_blk->i;
+
+	/* find child dentry */
+	if (inode->i_inline & F2FS_INLINE_DENTRY) {
+		inline_dentry = inline_data_addr(node_blk);
+		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
+		addr = ni.blk_addr;
+		buf = node_blk;
+
+		slot = find_dir_entry(&d, opt->nid);
+		if (slot >= 0)
+			dent = &d.dentry[slot];
+	} else {
+		unsigned int level, dirlevel, nbucket;
+		unsigned long i, end;
+
+		level = le32_to_cpu(inode->i_current_depth);
+		dirlevel = le32_to_cpu(inode->i_dir_level);
+		nbucket = dir_buckets(level, dirlevel);
+		end = dir_block_index(level, dirlevel, nbucket) +
+						bucket_blocks(level);
+
+		dent_blk = malloc(F2FS_BLKSIZE);
+		ASSERT(dent_blk != NULL);
+
+		for (i = 0; i < end; i++) {
+			memset(&dn, 0, sizeof(dn));
+			set_new_dnode(&dn, node_blk, NULL, pino);
+			ret = get_dnode_of_data(sbi, &dn, i, LOOKUP_NODE);
+			if (ret < 0)
+				break;
+			addr = dn.data_blkaddr;
+			if (dn.inode_blk != dn.node_blk)
+				free(dn.node_blk);
+			if (addr == NULL_ADDR || addr == NEW_ADDR)
+				continue;
+			if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC)) {
+				MSG(0, "invalid blkaddr 0x%x at offset %lu\n",
+				    addr, i);
+				continue;
+			}
+			ret = dev_read_block(dent_blk, addr);
+			ASSERT(ret >= 0);
+
+			make_dentry_ptr(&d, node_blk, dent_blk, 1);
+			slot = find_dir_entry(&d, opt->nid);
+			if (slot >= 0) {
+				dent = &d.dentry[slot];
+				buf = dent_blk;
+				break;
+			}
+		}
+	}
+
+	if (slot < 0) {
+		ERR_MSG("dentry of ino %u not found\n", opt->nid);
+		ret = -ENOENT;
+		goto out;
+	}
+
+	if (!strcmp(opt->mb, "d_bitmap")) {
+		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
+		    opt->nid);
+		test_and_clear_bit_le(slot, d.bitmap);
+	} else if (!strcmp(opt->mb, "d_hash")) {
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    (u32)opt->val);
+		dent->hash_code = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "d_ino")) {
+		MSG(0, "Info: inject dentry d_ino of nid %u: "
+		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
+		    (nid_t)opt->val);
+		dent->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "d_ftype")) {
+		MSG(0, "Info: inject dentry d_type of nid %u: "
+		    "%d -> %d\n", opt->nid, dent->file_type,
+		    (u8)opt->val);
+		dent->file_type = (u8)opt->val;
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_raw_dentry_info(dent);
+
+	if (inode->i_inline & F2FS_INLINE_DENTRY)
+		ret = update_inode(sbi, buf, &addr);
+	else
+		ret = update_block(sbi, buf, &addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	free(dent_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -915,6 +1097,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_ssa(sbi, opt);
 	else if (opt->node)
 		ret = inject_node(sbi, opt);
+	else if (opt->dent)
+		ret = inject_dentry(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 9b14c31..43c21b5 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -32,6 +32,7 @@ struct inject_option {
 	int sit;		/* which sit pack */
 	bool ssa;
 	bool node;
+	bool dent;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
