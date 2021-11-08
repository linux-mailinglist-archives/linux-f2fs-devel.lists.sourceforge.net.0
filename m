Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F24478FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Nov 2021 04:55:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mjvks-0007fp-I8; Mon, 08 Nov 2021 03:55:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mjvkq-0007fe-Bn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 03:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QrOaNhqi7QgPJunncN77hg1ekY5ILdaW2z48GZRq1Oc=; b=NADv/QnepAIURGx16kfSHWnd3A
 glSgPsUfW5/GoHRd7OGIoDq9koMnfsAxpy45+3MCxsVqERSfqERJV9cmaj4ynHv3jTknCAPXfL40w
 dFLftdLpeL3CVXboHvaeUyNl4GLCKecDXW24N8oy6L/JJSft7g9dtI3h9MSuEBSLCwHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QrOaNhqi7QgPJunncN77hg1ekY5ILdaW2z48GZRq1Oc=; b=L
 n1W4/x7jYQrGYDkOt6vz+8sTu/OPQSvdK+VXwvRkPCO0pWzp4A2ECsBlzjwJODAGDZpE9AsbjQFBu
 7aVJ0q/CfRZaI1fPkxL5tHLdrdGufWbecpQeSmzGuwpeDh4EB9uWfJZxt0ga4CRI7eUol+jkQI0s9
 o4h4Hl1zPnd3BIms=;
Received: from mail-eopbgr1320134.outbound.protection.outlook.com
 ([40.107.132.134] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mjvkk-0007mN-8h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 03:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOLdre3+Bv1oRYiSRoJfjGZkKkQC64LaHE4yPyVLttNd2r93Bzl8emmA2n24HoxkGa8rGJB5LR0bvnLO6+FSe2VQKP6xpACP8QCQuaheu293Q21i5D6o7TyoYHB8RHksHouOAnpGE7c231DiQZbavBP3mKCAO0PwiYq8gLK0jHq9f475OHV3x+zlsKwb6yiuYLOue+ArCrnR7ruaOTQ1TLiSiLXudNpWM4uLGYrJenBe/zZ4zKK8bm2FfauLkCgCJumbIw5nYgPA6CiPVoNirEjdrqKwmtPYji4fS2IQNPkL+Gt93FaowMADZWoJdePL5K9DrNEBcP22l6YOchVgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrOaNhqi7QgPJunncN77hg1ekY5ILdaW2z48GZRq1Oc=;
 b=NFzhEGdhTY+JdtwWVwK3qd1xOZAORF9MEZ8Kzku9s08rRjYxBwd9EdZDPUkBe5tx6tnlVs+huvp0qxTWIIQT/BHzGc5yT62IHc59ysaHLqZokQE5/Ft15BJLm9QbxsT51Lk0wSOr9rSo32D2ysm1TdI4UW7zHyEBy3XuSEOi2Ny2ktYC6H0ROjNjLgwJbMT2j6LDtjJE7dARv8oInY63H19TC44Ss7nu+O5t8vJnxs0UkeBxUwZVpX6vMHsyR14S4qeTYeJL0pQx4KUxZLsrztJVYAuXRmlGPnr5hSqpVP+c4WPejdb07jCO63Z6x+Fs+4+1QCLefBm6L4b/HxokmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrOaNhqi7QgPJunncN77hg1ekY5ILdaW2z48GZRq1Oc=;
 b=lS6Tq+I7U97ymSuMT4kKlflS46bxocRVXZmG9FlB6EQ4gI9UJCKV7xLUWqRsvn6buLb/aciTHKo+3sDMe45dm3ma2iOvb7vrhR+824T4jHTr3FmXPDyg37oaCCZ7/Tthyp1auFTjrXYcwRTvegiDwzBXYXCWxobsedQsby0cWp0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4481.apcprd06.prod.outlook.com (2603:1096:820:72::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 03:55:06 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%6]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 03:55:06 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  8 Nov 2021 11:54:59 +0800
Message-Id: <20211108035459.40139-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24)
 To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 03:55:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b4fca12-da00-4eb6-5aa1-08d9a26b8d33
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4481:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB44816D6455C19FA5864DD9DEBB919@KL1PR0601MB4481.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZsD9d1kC0yb5rj3yOodg3d6guh89GFTseHY0PGGtMQ1yHET7kWBH31oXtPmLaiKN10FhrK3KkOEswtd1QNRPEKRzVFxm9XmW3a/MJ2Gs4ghbc8HW/bRtOkE3TfGua71RquRDJ6yY6/WAiF0/KscgX3E2I3JQ4nJ60Twblx3I38VNwPyARkem+2UKB95TmjORPM1X/tncGjkAOXRYnQUzM0pku76Xd3x3L2x390de31kjWzclL93GDfubXk8XeE/5CfAMSPzEI4I5WTGSWE8C9UqKEBoY30eF1hbtKRzU/hqpKt9BfyNQFiuaxkpzUonOoqgzSvWNkYuEkYoo+SLgngbxAjzJQR3AVv0dOy/46BTCNnfOnnLMPW3ZZf1R2QAMwnjX1yaqzWvSbjb6iepJcWUMODL1u3BVUcrEl1XWpVRFCsp/avT71IXe3XL5ghw1Th1jkCxH8nfZt4ymBnmbTR8NeTK+MgE6MGO7WoN2nzQatrBg2mFFLUPKJ9FenwIoahYmdHXHeB6k3pCK9GepQMaXANl/RegIPj6GDI51Y9iOK4O4TpsZ7edOpL7nu/s8FZazpUGlK+XO9jlFr2EKC8W4WZOUpMOt9b+jnnSO90UezBZEM7VTyYsKH9cPgE8DIKGPrup03QS3qDUnLpedh8sIN1NzPgPCdsVwrjjndN8kMB0h6cYUo9SE8HIAHuv91OA/EAMFY9nwyQ9/VMtrAlPYApOKviQjAUg3nOOMnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(186003)(508600001)(316002)(8936002)(5660300002)(8676002)(6666004)(86362001)(2616005)(52116002)(1076003)(6486002)(4326008)(6506007)(6512007)(4744005)(66556008)(83380400001)(36756003)(2906002)(66946007)(66476007)(38350700002)(38100700002)(26005)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fy8Aph4pAxbrvLb9JQHFn6vmrTSbi4FVPeQUXApIYGsCCBvGqSmnLIG4YukK?=
 =?us-ascii?Q?Lhuk7XC5zt4y0aYD0P1li9sDpj51q8nBFBOJUssOTGZvSwt0sI9i+vBsA1W5?=
 =?us-ascii?Q?+kgd1v5bpIHFEOtKms3HjAIQFjwZyCHyYjzZEhrEjtrD/4PqxIjqF2zwSWTG?=
 =?us-ascii?Q?4DbgYDjotraztX9bqbdpK73kn/Rd2oHE1gJxwDCVw3QG65FjErt5fDHi1Bfp?=
 =?us-ascii?Q?mFQLPcyR9fybXak6xo+DAwKZt4+yeFLJCLuo0DEdAgDt5SGe8SM6U6UT4dNu?=
 =?us-ascii?Q?n7P4D8MLBG+YNl32qmdAWp0VPnjazU4rMQSUTJ73G5mRQoPylWeCv3cfBMTK?=
 =?us-ascii?Q?1fBBs0X0UidSLn8u+PCP1hFyrWxvfbQ7FZ1dUPEbh6u1X8bwvvQv1JI/zITk?=
 =?us-ascii?Q?nCCQEOG3jDEl86FlLefE6kuFKCsR8vUq8mOaOJ39lB/gCOOSt9cgCj9Piro1?=
 =?us-ascii?Q?rcQ0ic63JkBgMUM7XZldCXaFGweliSCn0BkuaEH3pEmsfy0SxBRhYBWSv3nh?=
 =?us-ascii?Q?0RMyj836/gr0FULBvHe9oZlN2/68VxYLW3hw9hHbebN4emPN/cSf5aMVwKwY?=
 =?us-ascii?Q?03ocfaE0VlzFPp6reoW7XXjqki2sHzDvKWEY5M62Lv9ODmFfITKIxUzuP25n?=
 =?us-ascii?Q?n0SlnoXqfima0n9lFcOLdKMUYF3VkTefxgTZ7cVVlIv39iW2RbhiJi9CMS6x?=
 =?us-ascii?Q?KGwSI+42c54p99RP7X0uskXD6shYrPtnAjrYfoK1w4+xWMPJHMQ/immvo+oj?=
 =?us-ascii?Q?VKTZBpFHpWjQ3Qh1rvUimYqlsxyxsQS5tz9shLTEtGxot6DO6ZMp2p4U2isX?=
 =?us-ascii?Q?up5mEYqb3WlAr6CLiPi7cOk1m1+JVzY2QA9P2GPpD9pBdgn7ER5AY0qMPAYx?=
 =?us-ascii?Q?1pQ90paQ+koQ15pgKkYCd0g2XrUVYWxRXOBlYyemvbk4vzV+7fYcIJR7MCrg?=
 =?us-ascii?Q?SHgV3uT3daE5IjandPZoqQVsi3G55AYYXTXcp6HJXFdtPrV1Gt9en69VGRMh?=
 =?us-ascii?Q?olrJlF6dS4O6GRygnCCsdpAtgl0H3/3rfJbApjnAbUpfYXUEFjpWQRqUcM3b?=
 =?us-ascii?Q?7MoRofpXQ0aefv9dVE/iWbNg6ZCYE/JkyNHgx0vwt2an0Fzou/tjxaWq1ZQL?=
 =?us-ascii?Q?FMVb0w/pwgqDxNVLuMpttjw2BctXFYyV4GBwpqOWlJngeqq7bUB1NjpWcySe?=
 =?us-ascii?Q?MLt4TxVCtVYZ0Htxur1csw386j/aPl+WrbLFe0acTxOSnVKBpT9bQWqWdAYn?=
 =?us-ascii?Q?AjxRar4EqrayJ9CdHtyJv4zpHFjOWoKxv0AeEhyA3SgfSD51OGdfPjyMBE4i?=
 =?us-ascii?Q?5tC5RWKGe2/6pf6PSRxHctfL347fC7YQlXUiNJFjdW4OuAmfWDXQUzUObugc?=
 =?us-ascii?Q?74MSLh1kO4Oz61ecn25vLeAEu1PPXyU3gE123JJXg+1Kp6RjIlSQatKK2DTv?=
 =?us-ascii?Q?qnj6d9wBiRBIM9mbTJ68vK90pXgooidmMxuusX3hhWO0WoFNTueSlS4C5TMM?=
 =?us-ascii?Q?LNqmqmg7CZNXerVWhcbPqF7f0c7Y4LEmGeEf8k31BO/IP6nbFXR/nG7OvJU0?=
 =?us-ascii?Q?LIgSnGlUnedoRLtAQrF98WM65BsjrGslQsyGuYYKAlF9EzMAsLD/RgybPZne?=
 =?us-ascii?Q?CLE/6RnewQpd9fPrfoL2/c4=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4fca12-da00-4eb6-5aa1-08d9a26b8d33
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 03:55:06.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iN4/f3g+13vwUWmstdkePkwWKEyZPWuGU76nsARw8Jr9tXM/r1166U+kXwFviC3nzsZvIZUt6CXQ3FoaoxyXQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4481
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In my test, serial io for compress file will make multithread
 small write performance drop a lot. I'm try to fingure out why we need
 __should_serialize_io, IMO,
 we use __should_serialize_io to avoid deadlock or try to improve sequential
 performance, but I don't understand why we should do this for [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.134 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.134 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mjvkk-0007mN-8h
Subject: [f2fs-dev] Do we need serial io for compress file?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In my test, serial io for compress file will make multithread small write
performance drop a lot.

I'm try to fingure out why we need __should_serialize_io, IMO, we use __should_serialize_io to avoid deadlock or try to
improve sequential performance, but I don't understand why we should do this for
compressed file. In my test, if we just remove this, write same file in multithread will have problem, but parallel write different files in multithread
is ok. So I think maybe we should use another lock to allow write different files in multithread.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
