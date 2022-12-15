Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D364DCC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 15:14:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5p0Q-0008Aj-Ne;
	Thu, 15 Dec 2022 14:14:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p5p0O-0008AM-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 14:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RN5hrTRd6Hu27ZAqqbYgSNmcH6Wdij9omXcBdnh80qE=; b=Af/UvNOG9F4Kzwxa7xnHCqGRVs
 OQkZ65qIsJThVCM9rmjxqW133uchLaMJ8bzy+ls8Gu+W0j1MrrgUDncd5Ctc4o88Gg7ESN/7Tix5P
 BiPs1KgxUtxzJNe/OdKdW8lziq8vZiYwsMrjU/1CI+xkFT8v0w/W+LN/PcDna4xXHoa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RN5hrTRd6Hu27ZAqqbYgSNmcH6Wdij9omXcBdnh80qE=; b=gevlYzlhEzsZLNxe6yp3lFQhKL
 44BdgluthwQzyI0AAAJu/yai2o3RAZuhft9Gt+DTj5Vj2FMSD4DqKRRdYtrW+3y5HJ+tZTwVIueMW
 o3wPY2v2+mDEoDGjxZLVczgituFfecvmLc+MO0KuEgIR+muguOgpiA0+J8cKG3OySOSs=;
Received: from mail-sgaapc01on2121.outbound.protection.outlook.com
 ([40.107.215.121] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5p0J-00057x-8d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 14:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeQDutYHNFNSgwWead8JeEgHDZsa3x5/xDLL/+R6z84JpS+c3p6zbDJXxNd+0CmM6RuXXmkbqcbPwkE8qiN6B1PgTCkz2EOpfVohh2c2/YZqwEWWim/yJ2MkmxJYfaBpr0GegALYc6zi08TDbZhJNSRUbqLyKiCw61/EEQPJLTBECbkW9rNmnDB18FxisnZoTIJRL/d5ylXn7EN0uoBcJQ/VXyrf3Qpq7gOfpzvyI3SgxPPsxCNz75z5XvOkCb6+HGUnLIlI4zMQTOiUKt6lU498oC7OZ6toKtVp25qK3uQBwcQgDzfIpCBTkFZ65/H2tL9xi3ofcm62d1ctVs3ROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN5hrTRd6Hu27ZAqqbYgSNmcH6Wdij9omXcBdnh80qE=;
 b=EDr82MgkZRmsG9JaCiehpFHQkQObMLAAdezDvzIk9D8uYP9HRVXOon2JXWZ/NhjeG+mD77Z0V7wPbVnCOJqmEaOj9irUvs35FwY0VZhulVLeWbJxqzGbm83iWTYF0h+5UsBzr1wBuhtqntgbztr6Js2XgMgZ+3KqfITI9AiXoVnVQ6CN3lI4nBCbPzxG/KkI2s4/QLgaHoI9FQDSsu8x3ZY5bg2SqdeMoHuiMs7GQKVRRZk9kqm1rOAoP5eD+6vkDRjLCEO6XPeRXXR+Lmr3Xw7Kz0FZWrRdP9mXjwa+TwD6M2vd16K82iJW8ZttW8m1bdkT3SSdsNbNeAPCViTf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN5hrTRd6Hu27ZAqqbYgSNmcH6Wdij9omXcBdnh80qE=;
 b=UQO+ciXlJGi1BxcoLBKHrBvwZJNyK78JXbSZi5/kkl3wnDNX0lMi9mZ92DXIwWLEme2nzpTBhQXvKghr6PzzyMQP/m2TGGOo5DfpQvJ/y19b+YcVbhji4LTXFqw85PVf766b+CtsJjI8yuHwsoUJGDuSmN72uJ0/5TShc0t9exzVjbhW16igd66jxg0y5b6JijKsuL+t8SNVRtKXanspt/M70IQDSQmAFsS2+1zMOFpDOiKthQyVi5ssPikWUGH3QVrpos9TVKjdK60w45IXB91IAb0FUtYwaw/+1sP4KItLMws5nTVrSuJRV94/u04gOm6bl5rDPwHgIcO271BvGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4556.apcprd06.prod.outlook.com (2603:1096:4:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 14:14:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 14:14:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 15 Dec 2022 22:14:12 +0800
Message-Id: <20221215141412.66752-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221215134844.12951-1-chao@kernel.org>
References: <20221215134844.12951-1-chao@kernel.org>
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dc2a6b-08b9-4ce7-4913-08dadea6a8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9T5fJUWiyMgI5wbS07Cae5UX52FcSGMbti1ivQwSlAMiJy4SiCoxnZ3UyynTDsT3hAB3IjH7nBTW+T6lstcGRcA+n5S7Nd3iy2ltKpQJ8jZHDL8MspBIrw52/zA2FkuuPwRk8/SvfEWIp2oMnfNY+5LHSCNv7T5cU+p8mKZFstg3MRZeinEFmbDU1I9e+oVkS2/ybq3wWcA9PWz5ECgIWBgHl2gFOqoo9wx8NhMatNLVTVVMM6nB7ahwvTVlTsWxs74VkEnC1sGU/d6iNlUF/3NZEPSs6cxr/2fqTV0RSzT35K3+ue1TE+HdyyMlxz3C2tT8j/7mH3TeebV/+9KDxXr3uA9/P+S576jG47a4o+ADzUdcEYi9sZOyE9kSGuSzb11pwfhN+JWHwZM+g1/96BHZfIF753CDubXoMFiRAZ1Iy2hREcYGohFbvfCDxZPWSFVRfZZccXKthO6q6wCfvTsRbB1i9s2cXUK80ygtZBmG2Y6EY3OPblfYP+PCMY/bq0g5duHHxfKLQUHmA16IMOCq9SgmLmlTVPoj3BybqODsUK+ip11yyTz393As18+E5JAZZegRPiPkdunz1A9DJorlFBZLiKOtEMYs2eVMcOkoNyU68tyeHVPyAcJpaZxwjjjdvT5f1LmWTMDHOa7pd5lYZ6BwifW2YexB1aYnOt9YNrQZehrsgFTdWj3d0Gj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199015)(5660300002)(8676002)(4326008)(8936002)(66946007)(66476007)(66556008)(41300700001)(6486002)(52116002)(478600001)(316002)(2906002)(36756003)(86362001)(6666004)(186003)(26005)(6512007)(6506007)(2616005)(1076003)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6fGAmbj190ziV/ICNXlCfDDpswKxLngecFd8j7MHoHodK6sUDyZVLweD2so?=
 =?us-ascii?Q?XQx55kZvgmJqM7wenBl0e0DOB9It4UsIusiIsUOWYxTbRpvD25GYD8PFeFuH?=
 =?us-ascii?Q?L3Vc8zJ2BHqhghCh7JtibfNQZfnmHA1h+JYhi7KG8xvdWAStQG0PDEHp7r9j?=
 =?us-ascii?Q?HjUDXFg/nqs1twMRVh6ux3OQoj/KdbS4DTFo9sKJdcD3JI3/bfsOSnMKNAsS?=
 =?us-ascii?Q?G+Z6x0vIombA/QSEJ+v7w10dAY1H5TOzNZ6LtO4O08fRck9upJiEOfZy4mmo?=
 =?us-ascii?Q?ShKq33SQLqqQy3y5yg1e1SXijjYjSswLaW9w/pnB8tRIrcT6cCBA+/z+SLyo?=
 =?us-ascii?Q?Qh4N4F4xoWB0SfFQRaSU2kGp0Z1maHia3d44TZoyo35RA8EpkpJFrOozzGg5?=
 =?us-ascii?Q?o5xhO+G/dIsqT9WGvPD+sR1U4C4FKKoielLBuIOzDFvBWd+8VTWS7x7ie8DB?=
 =?us-ascii?Q?E29ubASNx5taRtwBkv35NlWguBrhl7BpL7509UjDw8tqrAYuLoh1HgW2sa5u?=
 =?us-ascii?Q?JhM5L3FF28EFPNZeH+VlQcuNWj1RsS5g8qYCqB9s3pIJ3qEvkdCEm055ZSF7?=
 =?us-ascii?Q?gAiAEtjSPyFrAznx//xEX2Nb4xvMk+LhnV9lDVXtVPB8e2KEzuR87kG7NEvw?=
 =?us-ascii?Q?CvRApQM5zFkIPv8yn4MI+93RQ+IvKtY9ZIf93XSZUBuXRRsirK/HRD+4ti/d?=
 =?us-ascii?Q?7Qx2lVySXD440vXk0FpVLZU/GIzg8YLoqS9pUutYoO9uq0uYJZmBSB2rcNyl?=
 =?us-ascii?Q?IZVWIcVTz49npzU+amid1N8SRB8tfCmvAwKTWhV7LOf49fiCOrBYhw5Zl/AG?=
 =?us-ascii?Q?9kU4LcxIsu+GE7Rrbt0Y7qNE+aonOlp7mlrkfhyuDBVbXUaVbWIlpMc77XjI?=
 =?us-ascii?Q?uv76L+Nn2p1PGKwt2YwuBgIXfw4KJr9HzBnD/BuubVVTfUHj1kGIDjw+ypru?=
 =?us-ascii?Q?jwo2hvYpZkpvSoZCkx7EBJatb6t323WbJ6V7JBigQgdoXzSi2mrbbDa9SJ26?=
 =?us-ascii?Q?+0CYeS24eMDOCgBWDPAsTTebTeMSEBcOAh53qISJ8ADj839MZJr/FZculGfa?=
 =?us-ascii?Q?oEG2i+1QpmkHxaPEDYmHEgWfqtkaaVXAf3wWVFsTeVkngqxpW9Lz5nRZw1B1?=
 =?us-ascii?Q?pYVrOZfBpombFIVpyKqB9gWIQ7oIKCtF0z18jTNGt/hlo10yCeOOEe6xRygA?=
 =?us-ascii?Q?bDzWOLwiIHV/MzbRacWmOOdO2cgR862HZPSZABe33lwTCEHiD4hpG8xRrRrL?=
 =?us-ascii?Q?uJyWm6Y9MJNcUBq+qOWTl3WhPryoWRXYRZOFzLgkh9Tk6X+OGryC9o2CbZab?=
 =?us-ascii?Q?a76E+B8YiB9ayBBhJAEIRauMvYACPdwnhEmzkzo7ibUyxDFpwmd5/gOD/lDQ?=
 =?us-ascii?Q?gK8a0DLy4XILwHPUBgmMvNp5jD88KknXwspBQ9J+3P8z94xaEKu+GkUHBf4Q?=
 =?us-ascii?Q?3br46jX+rst86JfnUoA+hOEYrFFd+gUHJLTTQnOWy33xtuTx7P6xBClMiXkm?=
 =?us-ascii?Q?y1Y1joEldI25hMJ8GVz7ncIoR/F1AwjBrk4sIsq5nmDlvFGYUb0goBnCCE3s?=
 =?us-ascii?Q?WKxyNOnUyj0Qm/yb02VML7Dwh2f2397mjT0auE29?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dc2a6b-08b9-4ce7-4913-08dadea6a8b9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 14:14:20.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IENxjMSYPSBFNGkI3pYX9Ttivu3xNvwm5antpWPFHp/+MrQj7ZffSw52DVcD+PWDqyIRCCJMZNKF3JEta0F8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4556
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao,
 > -What: /sys/fs/f2fs/<disk>/gc_mode > -Date: October
 2022 > -Contact: "Yangtao Li" <frank.li@vivo.com> > -Description: Show the
 current gc_mode as a string. > - This is a read-only entry. > -What:
 /sys/fs/f2fs/<disk>/discard_urgent_util
 > -Date: November 2022 > -Contact: "Yangtao Li" <frank.li@vivo.com> >
 -Description:
 When space utilization exceeds this, do background DISCARD aggressi [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.121 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p5p0J-00057x-8d
Subject: Re: [f2fs-dev] [PATCH] f2fs: add missing doc for fault injection
 sysfs
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

> -What:		/sys/fs/f2fs/<disk>/gc_mode
> -Date:		October 2022
> -Contact:	"Yangtao Li" <frank.li@vivo.com>
> -Description:	Show the current gc_mode as a string.
> -		This is a read-only entry.
 
> -What:		/sys/fs/f2fs/<disk>/discard_urgent_util
> -Date:		November 2022
> -Contact:	"Yangtao Li" <frank.li@vivo.com>
> -Description:	When space utilization exceeds this, do background DISCARD aggressively.
> -		Does DISCARD forcibly in a period of given min_discard_issue_time when the number
> -		of discards is not 0 and set discard granularity to 1.
> -		Default: 80
> -
> -What:		/sys/fs/f2fs/<disk>/hot_data_age_threshold
> -Date:		November 2022
> -Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
> -Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
> -		the data blocks as hot. By default it was initialized as 262144 blocks
> -		(equals to 1GB).
> -
> -What:		/sys/fs/f2fs/<disk>/warm_data_age_threshold
> -Date:		November 2022
> -Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
> -Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
> -		the data blocks as warm. By default it was initialized as 2621440 blocks
> -		(equals to 10GB).

Why delete other node descriptions, mistake?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
