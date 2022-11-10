Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B155623D4F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 09:20:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot2nZ-0002SU-P4;
	Thu, 10 Nov 2022 08:20:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ot2nI-0002SB-SH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9UXl5emY0XUTDJld2DEKPJf+qZ2Aqkf/iGNGpKeJSeo=; b=Leayj3i7RHMBkUsAwbAPdBFNra
 RK+zYORy3FAPsmruYyV5rkiyHloBt7Qx2SLM7AcdjcB0YydXIiU5Px3mrZhQ3Hzg3BJYliXEixCBa
 CMJmnty44HPrqEHiyge68GE09xErkRM6f9JOGZf37ctDkmMo5dddzPh6Yh/fPEbDK4PE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9UXl5emY0XUTDJld2DEKPJf+qZ2Aqkf/iGNGpKeJSeo=; b=RJKlZEhs2rSqhMEuLT2URgSQTN
 ca7lvt6YNvlPSPGPYk+TfiYdTkxNXtsMPTNZlLBfmeUO7pOR3EckeyPXI7MaktbG4wokFphv7ROkO
 KxZeRK7xs7W1e3ws7AMVZUdnqskOwpz78zc2zsq7eGNqyy8NjUAzr6lCWnh2y2c1e5b0=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot2nE-0006EG-US for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:20:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLUAuoUfloi7vfPkfBHN45zS9WYAglsCluSVC0oPDL0Tv4cPYtUe7EytVi5Mit/IwXF9yaw/tldpItXijAFa1l/UMFsWrkVmC3B7pGMhwzecMCVrBc7fybKcc9lVGZ5XVu3oCMX0TFKDbycsM4BEhbtDrb/LWwn/e0TUODjve9U2ShVBRIdo0gmCQs8FvH+31WPG2AU+/nT+LEqiTcJgkb8holVmX3GbXFkHvu5XXSZOpDuq1gdh555LV2WNN32yDSwIlOt84hmobGAXLSM95us/EUVqxG/nt/2IXsVxLlitswLDP8CHIk/xgNXBuGpx72Gq7jVzBj2dGs/uLxCRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UXl5emY0XUTDJld2DEKPJf+qZ2Aqkf/iGNGpKeJSeo=;
 b=h8Rb142g6/G56fEuPmrpvejSk+7lPtPFPxaHoKe1nAFgQXMUKzjZtLlIvRdzfhJBuM72Xlm9W5aUMBC40hAacVLapxK2q7U5ikzYiiYU5/CYWq5+4VB/2yeKXYbaF2f88Ge+dahJCztt1rT/d2Y8VpP8/h2yf4viDI6agTiSh+4AnX/C2I+XrqXGNGO5uZW94l2+i2shxZ99Q/WLuVd/H6nvwkqZEv29q47CxM435mBbG0FqvUWBNPxUWMzhfuVXpniVTum1S/R8kxm52qPO05tBGwa+SqbqWqwQRQoht9oEmqSn2HohyUWUh+ScJn+gG1D47sN/hPPcV5Uu09m/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UXl5emY0XUTDJld2DEKPJf+qZ2Aqkf/iGNGpKeJSeo=;
 b=E1NZwKHtZxK2hqAINePVNqm+MTfP1R+tLIxcg4Q1H56bqsh8ObwshTr/tgAtQ4IGjkrjhrAM9BY7FPml8tGUb/a5Gv5dPULFrO3P2ormG6dZv/TwZvA1GpTE6xpUq21Qwxbllt4yWDaO5BHLpGh6MephMbw8sybZlG60hXzAV7XkleXfL+pW3KPIiSF/8Z9ZZBIQnqf4vPl/G0gUaIUb0sY1j9wZqPROo3ke3a1woAdlYrxjN6eJlEjG6VdE+jO0SBrZ+usKJqnWcq3B/Z9fu3YjHG5UHcd0apnzFw+5SGrE2irfMWRFgZRndbxyqDWciZq5DWWlnmrF8YCJzgyh1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5361.apcprd06.prod.outlook.com (2603:1096:4:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 08:19:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 08:19:57 +0000
To: jaegeuk@kernel.org
Date: Thu, 10 Nov 2022 16:19:48 +0800
Message-Id: <20221110081948.31673-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y1wQp4Z9sHEqfWV1@google.com>
References: <Y1wQp4Z9sHEqfWV1@google.com>
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: 669dfe0f-7b7b-4293-7740-08dac2f45a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKS42JtGNEsHbNDUOpYeiU3MfoqMq2qM9tB6lupnNUdVdGGueb9ezzitoNaZGh+SMyjVG0iobeQZG3yZMK+a52sgqa7aC//+2GGuCEIjrywe+3m0iwyS5mB/xIJrHIw+xKYwwKlSlXaJglmBXS5AMQToDCo4NmJuX5SkNfb9G+EoroZhr1VAyVnKcDpvVDiUA6npukd1xOuKVDLX6A+Vq+vjMO5T8OGoE1l1CNwZ4HgV/HvkPpV+nCeePQXAG4SO5EAwHFN2LIZCL3+7oWd1wIR/6JZk0Jj/JlWqwYBrJBALVVoSLbcPaiEnLkNyAKEu5Y6/9cReNoskQwLh7mk6wRyrSncGxWTHLV7OKWI1NauHxGZuksbesaw4RI2ZTBXhtG2w0iSwAQQeawO/atFqX1LqUJkh3I2aC3fn4nuJmoRdcIGnhJzgdiju37m41lVuMRf5038+chfGjvN8yr+0e3sNl5pBSrZRcb5jS3LVBVmys4bYVMgieGTnf7j48GEz81i2vlatLnKyI12RWIzXhZzSNr+yV72VDFfgh2CevgwpOTbSj29SEtVqQ54M0158jJsoZ1E+3zt/ZuTPVfy4fwcUujALfbRF9BbynZL4S7e91CtNICMWEwpMBBCXOq47KKo1A62n3jWfa8ix+IEUfhjOZoEstzNvXBbgwKAfbFrZpagn0tTSHlOBlPb4Szbm2U6W+p178XIEaNbSS5lMgpBDiKTwgd3kFoyUb24hQeooRd2b7DyWcACgI8LD/x4UHW8OuTOf3g7zDELGnZO9kajH4oTii6qA+kNR3fppDRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(6512007)(86362001)(66946007)(6666004)(36756003)(66476007)(66556008)(4744005)(26005)(41300700001)(2616005)(4326008)(8936002)(8676002)(316002)(6916009)(52116002)(6506007)(5660300002)(38350700002)(2906002)(38100700002)(478600001)(186003)(6486002)(966005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fhWWSn5n4gFqzNGmF6I2ruJIXSpa4BblmryV82puo5fvVlkFTjKLp9w8OzES?=
 =?us-ascii?Q?kl18CwThQjwAFAZnzefc0OgCh2cZvJXzmff60hT+VTue8/5qJTPOhkM3Q10u?=
 =?us-ascii?Q?tfOpoPva3IQ3w+4gMtIxh5FVyqfPdkmXfrwkaamXquDAJyOBdhCdxHs+54gD?=
 =?us-ascii?Q?AnrKanbmPHvDaLsKq5mTG13DN73YUnaewy1e9+RCGt8Dfz1nm9z6zcOlU5fg?=
 =?us-ascii?Q?SI/Zj2mkUZ5fkVmpbdBlgBbkJbS5h8/dDThwKYIRAZYCIbjy8CbUN5/ALdtJ?=
 =?us-ascii?Q?cxI1eGFVoRRnoqTtmee5S6wsZXj7WNRMCg3fsSTR/up77qC/B3nrMYQ2p6lQ?=
 =?us-ascii?Q?DeXhjQyqCG4oVwdNGl9B+EeKiMcx2c1LRkJjMaez/9ZGHlaF9En6vEDTpD6S?=
 =?us-ascii?Q?3t9TP7vgnqIdctQMN0xxL5fMydPjNtrZWSfGpWV7ozMD3Ex//MtW4KU1z3Ty?=
 =?us-ascii?Q?i29/1uTxUHDW+RseD4/tOpJUZuK2pW6HkVukPLVx0eIRJztUN3NaGH998Ers?=
 =?us-ascii?Q?Qvsre+5SJH6jJn4KenQJrRV64A/EXCgXPK64SONjHeBH6Ti8lgUpE1o0UJl/?=
 =?us-ascii?Q?UBAnreWvGqdnu6wVmn79TC/sJxSx9nmKK45rT7F77iUy6MWHGzZpvnVxG3RY?=
 =?us-ascii?Q?R1BLT1ZKshp/7jg5MpOgWmpxw7NeexX4g4yD3y/vnbaMdmysXI3GCoNxfFND?=
 =?us-ascii?Q?Crp+94qUWz6eG4OiTyvSnrWJ75TSShucMoWZ4MuJ2EltlGbyB1W6q55nrnLH?=
 =?us-ascii?Q?qoLOMB+rI93WwOSXqPxWoLCdJJSXlJ0PDjLESWZnSdZirgQ9NJarTN6u0Qvc?=
 =?us-ascii?Q?fiUeqyllWr0mrFvZtBxczFLTAsw3edf73ojC+HJStATMK56vIGt1/QDwbPKJ?=
 =?us-ascii?Q?BwFU/8x4yzeXD1Mw8nara3smtrPRbq1Yh9StR8S06jX6h8nnG2t7qtYtLEUb?=
 =?us-ascii?Q?T21RWu1ukSyGWW7BT1LSqTMqn4HbFtV7Ug26L8C0y4bYgfcsfI0Xb0XySf9C?=
 =?us-ascii?Q?tTRMhYo6u1jJOwASj//B7lPTRlbavr2W4vWrds+uskALrsOZAc/UnOxzjIl0?=
 =?us-ascii?Q?v9omsewIvM9Ls4+O6igfVfKBR9wJxmT4IG/A/QMGSas5QLXOpbFfTtqpdZAn?=
 =?us-ascii?Q?zg0Ye3lmvWgWSyz2Bi0vJxWJSqhQbsnUHrxafM1usGQ/06yMkC5OFrDQ+lQI?=
 =?us-ascii?Q?5AxNQUaWldruKY4721CVmzWO1eL7keFTMI17F8+waV93nAiI113wRyUGIpLc?=
 =?us-ascii?Q?rSoXSAmBzPtp0fm7Nr38+4wMp1qR1ZwdXhnkOchQri9WL++98pz8QR73w+Fe?=
 =?us-ascii?Q?MKQxt5zwIW8ZBceJh6suJYBH0wBcl6CHHB5QH15icYImSXc0NsJZpnoBOBpE?=
 =?us-ascii?Q?e21Q00cP96dtaITHN/Z8Z4NO9nznVa1wB2TodoVoa1i6r4EF0JUrKCMTUN6S?=
 =?us-ascii?Q?dN4lvNh/UBgsHPeCWoBhrOOf7qdIuOrUvX7uw3YC7rd5p3H/OpXZKKVQbhHt?=
 =?us-ascii?Q?ka007OnoTBHl8PwQhiSdtqsFttD70tp3fiAIuIllrp+H7QLYn4oeI8p+2k4B?=
 =?us-ascii?Q?Cba9p+iczrvufnghIVMzVOZ8Vbg1SO6EFcoW9Vsk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669dfe0f-7b7b-4293-7740-08dac2f45a26
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 08:19:56.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HUI3W+wC8n8p5ih9cpHPA6b+z4JgCpnYpHQVQWLXapPGOqN0Fmmo7ERy5aOvtmfAIik+Xm1NAB+uWJZGOmDaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5361
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, > Hi, > I modified and integrated some patches
 as below. Could you please take a look? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.125 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.125 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ot2nE-0006EG-US
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove gc_urgent_high_remaining node
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

> Hi,

> I modified and integrated some patches as below. Could you please take a look?

> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d34f1e7212c1965a409d4581a32a92a1c91495fc

I've looked at the relevant changes on the branch, looks good to me.

One small question, does the name need to be changed to gc_remaining_count?
There are already controls based on the number of gcs, maybe we can add a
gc_remaining_ms later? Control the gc mode based on the expected time. When
the count is reduced to 0 or the gc ends and the expected value is reached,
switch back to the normal mode.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
