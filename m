Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CD9748D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGn-0005jr-DL;
	Wed, 11 Sep 2024 03:43:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGk-0005jZ-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=; b=kmzv8cvaJrycn+Y14+gfEu78/I
 sJdPXV4X2XOWprN0My3oz1hgPmPYTRt6KiAgHAU1zz0bchZc4DAhvZjk1c0L02DLCe/ycYYEsKeKc
 iO9KmhWH0sQt0J4WyOjkqM11K3AzPjelQ1FvY3G8/XtsaTi0IvgcnZdrgIxLpNYiZ5fM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=; b=UHsbrzB++/qEJznaCp7Ca8B8AH
 gcLicQVPrEUi/F7aIdmuA5LyvaPUTBG/9Kbce07Q0A9iH9mPCbaShfsIg1ife1TLc9lOa1sC5qrKp
 8HrbYcluyDsjjrC0Lcm2r4FrwuzVZ9hJAK4GVxQD9Tk65rJ2PDUfwp4zTE+2npdUu7O4=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGj-0000Nz-OS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2cgjNKJ1x+MOyywpPy9gJUh3zdWxe3hxkiCW+VrSv4Q8t/k0FpGnFwQSa+v2rtAf8G+9Cm3HFH82xx5JGQhYsVC7D7a6o4a/9kr0otn7dm3NmTGco3nYUpngOl2kmjb8hvNf97gtG48KzInoX/6Rm/+Wgyc9nQf1UJOBkq1TTQR3eGGgnz1VSfYyiLU5zWYTLapVmhJ1BmrHWfP5HStTIfoaKhsew32pZoacq+AHWL8f7UtwR4n/50k33xbL/17yQb0P7xQnag3uLD8L9wYPAVZM4Ydh7dtJgkC/0adkrYyvlTG5SEVTzsYq5KS0Lmgv4mVuL6Gj5DQFnuflRsHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=;
 b=rGi2rHuDW3oFdTkdxY0gnvqENpHvg49/Lqn5ie39/S895SFVzWy2d5Ym8+jjgldQN5JLU6EICygxz0FxBz5zbgl47e2wuvpk1VYRomDLz+9zk3MptAKnIXlTs1hwreX3kyYhwfzYQUcS8NZm4d4Mpk5RxjgYuo5uolLtgQzCqdddfMxeP6xaUtKtxvcMu5/vK7PFnlMePio1SlOn4clHih9KF5Hp07mQuzNXnpcrWftPLg4Wg5APZbfNiqxbAaP0ESb+TpyObvWG6DiSbXLuORvac9gwMjPlckor/VbTYyeevf5HZowAbC29sdJx3aLzoZ8rVhkZp/U3EveAtBzwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=;
 b=Ry8/SoGbXR2EQXNXGV2xNxXCePE9XSMg0oekEZPu+xiZmu2qq+4hh9IfBBz2u/cmkDhjbDyO7QnQL47/SUVTkYc/J0E5usyvSf2PkZRxwUfJe7voz00YmS+R1BDK9DYEYemFpoZlNOW3Ue81OfutVwmzURYdfa9SigqcVydyfOxH4dcduvR9ydI0hh/qwp7jpuVHvp0Ww4gdwhIttmG6wbKzjgFv7lQXH4CmttWed1T791uwM0pyqENomQ51T+jGJZOv3G5E3bJptE/swM5ZtfdXgnW8qwyEPh9ziHFqQcqB5IIr3EWHuw/h3Wh4VTYwQ7kuZK50/uppkH1mQJ0AJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:43 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:42 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:22 -0600
Message-Id: <067f905e4f3b71727cfada291b090896463ef796.1726024117.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: cdff4dde-1059-498a-b65f-08dcd213ee84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ss9DWppozGV6sIjKkUxjmPSUUa8Qhyx2qQMslagm5T5+g0uvjh2B1ZCLu2ZI?=
 =?us-ascii?Q?bsIf6f6hYidIn/Qeaq73JztgoZZ4R5ToPUZqkQgGxRRbqM4lO0QRGi2jerxh?=
 =?us-ascii?Q?e+cg4tGY0mVsRycuqPYj4ymXFcEluaT5vryO+qU3377d48jpoo3Yl4WXxNZw?=
 =?us-ascii?Q?bFnHcOoLdDEi/I+9+WWLZCPA1W69anAvcxuLDmAxS0Z0EopUi2yTuITGLPKE?=
 =?us-ascii?Q?Nl6jEtqfol/GN1j3x1QMp7f1IzJKSViTF/VZ44fK85v/YfvfwmITvix48u2Q?=
 =?us-ascii?Q?+L2y+l13reixdAYgB6Y6dXQ5kLrjwk2Y6U8e+rNEHXge+hnfAxTrYiqi1u12?=
 =?us-ascii?Q?qgeqqUtHx/uD3ALyrB0a064iueh53puw7nKmtam3tQbukVpCwmZHALdobfS4?=
 =?us-ascii?Q?iKTwFz8Byv61enx0aC91dBnmtP50PmvU+oXhd/aY+AeS0VdDsTJHwxqjy871?=
 =?us-ascii?Q?QFfI6lqe4o8vc8DvqRoapASkPPX2z2NbGEQsrpLJd3SnZLv3SIA/s3fH8q0W?=
 =?us-ascii?Q?N8Cxj1d7/1q+d0P6QK3nXqDse8Ts4rUhDx5rmfg+FIFFERNJEv/DV8+ZPTPM?=
 =?us-ascii?Q?5Li3GhpjhT96t8wFdjF0X5ak3tA3G1bDIczSqeeSW3X+9xNFmBZnqYBvbmCm?=
 =?us-ascii?Q?IoiNz+9F6y55XD7UbBGlg6P1imxltgfWAGXTUBiUdK0IE/ubMPrmz2xBbIna?=
 =?us-ascii?Q?1LCaOqtzrghNneBLBcvOeqFUyaYNq7NYL51y+HuwM6pFV49xE9nNX+vwiVqf?=
 =?us-ascii?Q?e13uY9cfCNlDooTbaPIq3lxFtqiQH11o9+PqGUPu/PGcrPwb+mIyQej+IArV?=
 =?us-ascii?Q?Ps/ghgpr2M0Ey54lvr4wWt5HhhKbEZeE4ZrgTEAuFG2Fbv/uGO5LRLLIzPOI?=
 =?us-ascii?Q?G1SKN2KjXC6xIhFW+2S7LogvYS9YmLFQK5t7aOclFaFOr8zMPzTtRpGQCrx5?=
 =?us-ascii?Q?IKQyPNZENyb+Vs6DngEFnmumWSmAdOcv1jNJHmw6tJQu7goZUg/AfmCmyPl9?=
 =?us-ascii?Q?utDlx11CPs4zaEbWZYb/iQCdPbIunqiLe9MFb+a1aHeMVp7cvD6+PImp0Ww4?=
 =?us-ascii?Q?6CzNI3JGOEO1zjIJQ7XnIO2+8z1b80JQO/t6N2S3RaILIiGALzSPyXmUt52u?=
 =?us-ascii?Q?3TKV40IWhceLNRBSujYK/aMRphDISL5z/2AjXBuFTVNvg07G759E4tyqXxKQ?=
 =?us-ascii?Q?kArktLXdzhEBd7ef429wO8E4TnW1S89k3noXBzFxDBAj3vz/ezUnPSsHCGoH?=
 =?us-ascii?Q?SQs6SVMoG169rurMWh8JxRDRc/Sub7vkx8jFd8veSu6zy/2+/+LYBBC6B5tg?=
 =?us-ascii?Q?VgO0+3kDIIi0rpAShHvGbmIHtF2wUmq8nemL6622xkfmBxz1tNrENneD+UXv?=
 =?us-ascii?Q?TY4/TAQ2j065vyi2L1bZUrCM+YcLNA96HSJfmPujaBzMYc+DrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CX2/ugSHKNEahTe3/R7kYmfjW5vF3F3S187WNL4nwLXJRPGhZnqgZhRIZK9s?=
 =?us-ascii?Q?g2F+gRkrGd9okNwTpfYhMn5X1bRKcXPMAaUZclh7cPUHj0CkmbT68Rxk0LQ1?=
 =?us-ascii?Q?Aea2KFBFVW50YyANq21y+1SKfHPXRmR2zJ0L5ph1GrPnJK3rB+x12Axi3x1b?=
 =?us-ascii?Q?A9bUT+GLujOOnQRZbtXOw9z+9Wn48VGJRfD08J/gV0Ygd6EsiD2ZKPnOwfFp?=
 =?us-ascii?Q?FbBTy2R/5Wx+Lmw5PUIBcTT90ABvRDfkhl2LlJiAkJNCjKKXTTvHNDGsjoEf?=
 =?us-ascii?Q?zUSLrdf1Izxbabt8UTX4Bl9l2p/cZu1QyAaKmDbdBHWisdD2NJz3sz/bXWE8?=
 =?us-ascii?Q?eiUSgNrlWDJo8Af27kD/hxbyjpgGCV6BJ9iqNJm7CY4/Q3gbM9QQDKWSlIb6?=
 =?us-ascii?Q?n43JxekM9F5ByQUPeRDL0VK00TM9mG9Eb602lHzSE7W1Zpw7PWmZ3/d1b8n1?=
 =?us-ascii?Q?uWr7Lb+/NcxrheucwJcsaYz+ihdsQTwlUitzLo60jnJBmqw9+KC+Jlrv/Mja?=
 =?us-ascii?Q?YCMRWjBBtWwG1vHIXy8TmEbrLJ6IYnGFALk+TREDUPCqcGjE3n1GxLL3q7ze?=
 =?us-ascii?Q?cJNxib+2mRSA6Am4bWxVFJpCTwyq24wl2Of2VeimuEIBA0fD0jpp5N0x9iXW?=
 =?us-ascii?Q?7cBP3y3t4nffrZhNCoSO1y8R4kG/VoCqLrP9e9SPV4UysWeLL6jnusr9Q51m?=
 =?us-ascii?Q?ypvpo42ydpladmvX9hTfoFUE502DaaMQc4riBO4ocVA5iCGDyCU74ADYh41v?=
 =?us-ascii?Q?hWU0uHsUryx3yjuj+0w3LjRuGD8JAv3OWXzOJrxFhcM8TcGFlloOBP1vbt1f?=
 =?us-ascii?Q?vdDOL+yTfCJLrpkC0RlO4m/eRocE2mJMuna3+Grz59ivScs3mPPjbhpZA3Dh?=
 =?us-ascii?Q?J9Vvu6wphE2qz+hI4Lzh7+GYUVbmKMkngVCLP8iWhjUFKt5CGYW2wdeemscS?=
 =?us-ascii?Q?RsDbmXsNYIMV1lwme77TzDbCmyekFRzUT4a+spl5bDsbmasz3ux5JEiHiKvw?=
 =?us-ascii?Q?p4sRIfKTet74O9/7v/7kgks7Xdpy8gnaDOfbzP6HrVXMgfKu3+vDqhaX7sph?=
 =?us-ascii?Q?Cy0CRE7yKqoAtrSU8EjZR3ZM1r3eOn4Y+NLHRb2xrYc+tWqkmD99usI0iQb+?=
 =?us-ascii?Q?QRLd4W0+UyPZFdzf5KRit5LEAPtG7cBjkoV/60MGlhfYadar4dTAVEZGnh0A?=
 =?us-ascii?Q?7gYqwaa0Jy+KY/pYeivLI/i3a37b00LcZirOoUpKQ5VFrOjfFOHg08De1biq?=
 =?us-ascii?Q?/U1INhc4IzeDa3HyV58d2aNFgqIgxXEVZ8pGY6bh0U5g/FNXx4tRBiKqLa+f?=
 =?us-ascii?Q?uhm5TPPDj3JHXBXoju/g4TAdNZCvirizEeG5mHmjF3a5IyMkK2EbZkapv/dl?=
 =?us-ascii?Q?gJe9LhAf8gtTmED+Ytce/+nY6zmn05yN5nuhDVq3z2zUl85J+LQVWX/7/JpV?=
 =?us-ascii?Q?ankq9mqS2qtJD0Rj51PIg9hB1axZs8izG1k0+RFe2ovH7UqfumOTjP0AzMZk?=
 =?us-ascii?Q?DKofOA34jn2ys9L39VDGL7222AbYWcpXwqT3BVFXMdViLoXb1BBkQpjjneSl?=
 =?us-ascii?Q?6d0R+YouigcB5yht7VRO8ypMzM0SDeaP4uEJrcR9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdff4dde-1059-498a-b65f-08dcd213ee84
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:42.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkZLaHWG9XqFNpWDDyJg7zzkocszHKug5nnqmLyN6igtnqlD88jZzyBbhh7F1rBtmbCV8/vVWTWftlIOkCGH5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is detected by xfstest generic/114. The inline data
 needs
 to be read out before writing to avoid losing the already inline data.
 Signed-off-by:
 Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 3 ++- fs/f2fs/file.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1soEGj-0000Nz-OS
Subject: [f2fs-dev] [PATCH v2 09/13] f2fs: fix data loss during inline tail
 writing
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is detected by xfstest generic/114. The inline data needs to be
read out before writing to avoid losing the already inline data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 3 ++-
 fs/f2fs/file.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 476325a26d4e..275c5739993e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3477,7 +3477,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
 			goto out;
-		}
+		} else if (f2fs_exist_data(inode))
+			f2fs_do_read_inline_data(page_folio(page), ipage);
 	}
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2551403a5b83..64ea0bfc2e1e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4729,7 +4729,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (f2fs_has_inline_tail(inode) &&
 			(pos + count > MAX_INLINE_TAIL(inode))) {
-		ret = f2fs_clear_inline_tail(inode, true);
+		ret = f2fs_convert_inline_tail(inode);
 		if (ret)
 			return ret;
 	}
@@ -4842,6 +4842,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		/* f2fs_convert_inline_inode() and block allocation can block */
 		if (f2fs_has_inline_data(inode) ||
+		    f2fs_has_inline_tail(inode) ||
 		    !f2fs_overwrite_io(inode, pos, count)) {
 			ret = -EAGAIN;
 			goto out;
@@ -4861,6 +4862,10 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 		if (ret)
 			goto out;
 
+		ret = f2fs_convert_inline_tail(inode);
+		if (ret)
+			goto out;
+
 		f2fs_down_read(&fi->i_gc_rwsem[WRITE]);
 		if (do_opu)
 			f2fs_down_read(&fi->i_gc_rwsem[READ]);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
