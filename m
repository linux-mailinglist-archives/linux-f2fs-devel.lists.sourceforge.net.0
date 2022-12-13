Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671264B48A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 12:55:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p53sX-00049X-Nw;
	Tue, 13 Dec 2022 11:55:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p53sW-00049Q-1b
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 11:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSKwJQ6H6KsOFi4xd1MxCLvXFm9rT+aTjtd2MR5zixo=; b=SkAzUhLpS48EdOL2jja7Lt2OWB
 KbJelvohJPXWZO3aYvRtNI0b19bjooTp59NO1nAOC4FKhxrdTIz+MXbom0yr8sqK0c06C8kg0l777
 tka+HZ63ppC8+elS0ZcXJX9Xru71ZwQuuK0M2GrlFbO+OVYOblQ+8vnrD//zH30J6mhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wSKwJQ6H6KsOFi4xd1MxCLvXFm9rT+aTjtd2MR5zixo=; b=QlkZiKSo5jK4JFItzTCuuzNZMD
 lCZcGJANe7C1aBQZRJC7AWSUIs8UCycf4CZcPAxPvwr4XlltIET5NBKsun+EAu4eunDnnXjS1XY3H
 +c7OZCZZaqRWv92s5k/nsE9hcXsSCQwDB2iZqWLZxFfHFoHd7iolfSV3Hz0UNOao+6Ak=;
Received: from mail-psaapc01on2116.outbound.protection.outlook.com
 ([40.107.255.116] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p53sP-00FjuV-Ih for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 11:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGEggyrurHo7TD8Y1mXdenV+g1jwSgeS1sYCLd71npCZizBI5r9/2WMrblgEkpNtdRf4BdbRi3uwn/nbpAvdqhfw/x2XiaW2svGawnEwg+IAiWpTFtzE3dMKh90zbkiHDMTi8WXkdZjiV9RXZwiLh12KyKLer0rgxWDB2i3KwBjA9qa+LAYryW5hStbYsj1d9NFuoCWIl/Ibw7Zl9gMH0dJZTcdcDDzNNW31KkoEScNnahY5a0BZwE490K+q01Xtga/leX37ztLqEv8dSh4N3S8DzNKejRZ+FO9TWWk/vsMdkuxIjqvGzewsJK98y0h1zsGP1XQN6C9VSMHv5vAsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSKwJQ6H6KsOFi4xd1MxCLvXFm9rT+aTjtd2MR5zixo=;
 b=E1pRS64L4WtyRGQQMzI/Llj9XMYmPd0pLb/wk37iFf5Y2mT82A5WQaNsFbvsY3wTur0yFk2VyG1GnPKC/T5yhSioYruLLdENoRYI7Q7RcYVXZyXnK/xCRU7I/0EkzJ7isjTHRmi8MUU9Vh0fW4jhccejQTBb9Zf7amUMZUNrRXAWC3gvR7zBOOblvQzdEJxvXCuQtKzHs/NpbI9svaEU/XswoACtFeuRBvTyQzJjo1XU4yc+k4CHJWgegchDsOLTvRk+mWv6N0p4mIreY0e2tsxKUk+aytYlQ1bWW8KENLIgeBxpP04iPWtayroTWlu7lNQKbE/ch8wpg1QWwUhYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSKwJQ6H6KsOFi4xd1MxCLvXFm9rT+aTjtd2MR5zixo=;
 b=QqKnATV0R8VFa5QgOzsfqEq4W3F6q4T6afG7M1J5VaePgIXtRm2gpcu6XdorVnjCURia+bf6DVgzbOusG6FYreW0ADZETDkxd8p3Q8QX4ELXat7gNKk5gN7GH+sp8n7spU4+M4Utg1bxH0X9cgUlJRbuxAvNuL74rJ4dZCa6mVsZ69Vx1eLLo+XjCD9gWTuha3uSKOqHDBGp+doEPJ8BtAOToJwpgj77adE8Upw4J4+n/nsFI9KGoVLX3J0Pre2L1GzaMBnyMCIh7/lBVi7hVHKvKZPzPV/zLvJ9z8BhGDPedIL6T80d4iuaiUTkEVvlSwJLzr+gBceGRarq3ACraw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:55:03 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:55:03 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Dec 2022 19:54:54 +0800
Message-Id: <20221213115454.14885-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <ddf243c9-f557-7f11-1964-8d2324f84092@kernel.org>
References: <ddf243c9-f557-7f11-1964-8d2324f84092@kernel.org>
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: a882c587-bdd8-4f14-54c7-08dadd00dea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SL55qWGRl6McQ9CMaAsrG0B4szOGZCU8+UxSUJ2pQXe4m1NGZxwVsvvCmHdtik47+xrCzqT95CpdydtHqFKlOgbXGS4C9FOxntF5EDUdEChfHEVMpmTmRjcnoCjwl4jzDypFCN8YCeKbQ60PRUmG/EYrm5Tf6tUMcyYAGLKzzzWP1MK6zjAi4kXvfLwRS+DdBskTznx5QtjccUe1ZcW+OZI5i7lOxZVHg69E5aXPwb1j7efcRI9ylQtfNcGjxGyyTwQvpoNiPHX0lj2FxGMNaXY1k+ua4vU4CHIb1BsQ0tsLm1kP7sMApD9tqsTNO2i7Ul2by9LpKo2bDAEhsZVaiz+AMKsPKpov31RH0YsC7yo0LuAFULO5BTHGnk8IvZ+tVVcWEaWWC7jfrJj/+LNRXGLqpFuN1fdJd9obRewyJET//YVePY1Z2FIpt2B07bk6DWbg2P/lAJjhZXaIufeee6zk+kPocsgHe6fHLzpqjAQRc/pL2N53q4iOQAFOxHLyIJ2gxSvlfWnQ3GZ+7ecNbInMARi5yu7ds4wGspTfE3GrZqVaisticcUWdEiFaUydnjMwEZKI+CJSAvx6at/Zo5OWCzInKpKMhOEg2DabIoxwtwWlU/Zf7Tr5Pd4jk0PALTfCWOqzcIKTC3YA/EhcNuwb1TkPLdFBKK3iREmWQ144Q5obfuxFTy8gXsVopXcHnBL0uGLF3hI0gNrdsfjJ1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(38100700002)(36756003)(38350700002)(26005)(86362001)(6512007)(316002)(478600001)(6486002)(8936002)(6666004)(6506007)(5660300002)(4744005)(83380400001)(2906002)(52116002)(186003)(41300700001)(2616005)(1076003)(66476007)(66556008)(8676002)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVODZVP7F9E4W6ouYuKqeUCxks3We7eV9q6np9dZEV52IVhPxq85o8nqP+Sc?=
 =?us-ascii?Q?f+AdeV1IPu5Pu2S3EpyRqk4UJXZdxJeG28z9KYjZrSSm4Mx3zqXyIPngkQh4?=
 =?us-ascii?Q?5rkqFvrfdeGvISZjk9ODFkhzefAPTt+HK2p6wMN+XSTykAeHbG84+8Jw3YGt?=
 =?us-ascii?Q?tuzr3dQeVBtzWlZbIV59TysV1WwSoJFhsKmbx5HaPtNCCRmY+ylNL07xqnUH?=
 =?us-ascii?Q?vKHF4xxSyuLAOazq8fpOpbQx8K1jGoJlnJYLEUFseSbmEpxac7qSsmA3xYHF?=
 =?us-ascii?Q?0MOev+Fgmc/9g43iF5SG9cFXIyfvBKYUgEiXBxc/1vDMyPq2RP/4SPNwKLCO?=
 =?us-ascii?Q?hMq0q5KSkRmJaiuS+EWiodBF8sChyu5DLCSqzS9w0lbFvzXXoFpzGE8c6wM4?=
 =?us-ascii?Q?hENSDKAMreiQ4GL7cKgm8lZwnMH2hE4lfARHpOl1CrCZQhttGJIohRdvDZeL?=
 =?us-ascii?Q?NgoGqu20u8RaeYtTaWh3eq7+h3GE+TO4QdbJkhOj98AGeuT357z7C0be3ieS?=
 =?us-ascii?Q?wDaUenqxrmkwTP2D6yGahl1L+duuOs/QXQlpUc2AUB8wPkgE/3rlTuGli8RY?=
 =?us-ascii?Q?j2F/ZLTDwOIHTly+0oaOIDJGSqQSvAMBQA4etHprExfzMdeyKC7xYEY3FQ8G?=
 =?us-ascii?Q?2P3EkdV+WgywHdfy6x1u24gB5z6y8RDY8Uw59kSL/rFolunz8CxE2BdZGB3n?=
 =?us-ascii?Q?pvAIdYaPek5ARTAxpOn2jXvYks2IEb4Uw82gV1bqEVrMCZjlL4ta5kaGZzjU?=
 =?us-ascii?Q?pTr6Eg3oxpsago0j0EOdC5byY7C6kGrkAJ0GWhxiYMYy4OtxEm7A8E+Q+WuJ?=
 =?us-ascii?Q?g5lO2PZO9iwpIka/UoRZVsQr12bCyHscSYanPbGk0n58IZwM4Vz7ozQ+Gh1r?=
 =?us-ascii?Q?WV8iI50Z+zNif3fSQjK5aqSDHBTEPfgtX+pOMDqIaBEOx7aiJS7uxr+TYUbM?=
 =?us-ascii?Q?9Kpp3LHsFZrF9rieuZe1asb/h740OT6Dh/AAWvL1Thh/RcbRNzslRtbq5ALa?=
 =?us-ascii?Q?B2rWuXY4mEWKVbYGZ7lnYg86qWdLXNJ8N22gTviefdUcyqcYZ8fcrv2AchXs?=
 =?us-ascii?Q?FnBWQAGK8lTELvrk4FvwqGXTFTYYixE7DCzER5QvpW20FUsPLV6Zvi5FOFpZ?=
 =?us-ascii?Q?TbzLLYHlFj8FyTn5cOs/gLAvMhim6XIB2flzqr2mbx8EFYjNY4HSqiYLwv4Y?=
 =?us-ascii?Q?Q82YV9fbi6MM2mglVtqkYX+QllT6APsD9ldIRkry3CmmOiTjclpQgCU6izqG?=
 =?us-ascii?Q?CUVyILF1qXJMrm67uD7SnD9pa4VKLYCwRQI4PAjSE1zW7YbFTc4icT39z25N?=
 =?us-ascii?Q?3XUUyHaRcM7bHF9PPtInkkLcq0vVYaUQvEq1EzzMyP8a3Mfh2BmpdKGW+hel?=
 =?us-ascii?Q?Vq4fdxP6kR6qpe5qccggjH5nDKWlZ3N1mAyklCYLHM4ayVgZG27hTfzMdpTc?=
 =?us-ascii?Q?bYPniYl4tO0mSY+6tgphA3hyEiUROWl+0KufygzoCRoDdFutOwYRbcxd6GWR?=
 =?us-ascii?Q?Q1areAVp+9XYt73tuI8WIvJWWvdDFuX++PNHwbkgTn5skuFvyO3793SrGw5q?=
 =?us-ascii?Q?6BRZHpth/KGsVhEOuXvKdEIgnstrcBLRc9U5BAmk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a882c587-bdd8-4f14-54c7-08dadd00dea3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:55:03.3830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvvQs0KhPe+3CxM9LbK7T2nKWD105vpi+hAxjzrXSf6xulijbhpmWEJdg+b7js4In3UhkMqIWE8Uo8gOMug6vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > What do you think of extending this function to support
 io_counts? > > void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode
 *inode, > enum iostat_type type, unsigned long long io_bytes, > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.116 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.116 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p53sP-00FjuV-Ih
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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

> What do you think of extending this function to support io_counts?
> 
> void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> 			enum iostat_type type, unsigned long long io_bytes,
> 			unsigned long long io_counts)

Support to have extra io_count.

But I don't think there is any need to add additional parameters to f2fs_update_iostat.
IIUC, each call to f2fs_update_iostat means that the corresponding count increases by 1,
so only the internal processing of the function is required.

BTW, let's type out the iocount of the additional record in the following way?

time:           1670930162
[WRITE]
app buffered data:      4096(1)

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
