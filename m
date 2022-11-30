Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88B63D5F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Nov 2022 13:48:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0MVp-00025F-Co;
	Wed, 30 Nov 2022 12:48:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p0MVl-00024y-7F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Nov 2022 12:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=; b=XzdO/cpNDOHJzy02hVMDpOz+j3
 Qy8BL+1+jBSryhG1zAa9FubI+OcHr48zRvTnRDr+4R22neFL6eocVEpqOkyihSuZHBw08jkFqHMPC
 ozBhqaq9wspgD1AZFJaeI9VoW/pBFAmxtpl9h0F+EPs5E1Vicv47nkCciM6eNohk5tMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=; b=ORWWgqQ0jVS010yGzJq6rcoOg2
 0ttSP1kaC/wR/STdfcbEmfOcGe1q7K2nLDmGj8nM5VRbB0SpeAIdkeW+OlOw47Hk3qUNRo3m5fjzd
 6FyScoeWLUP6AL9R8CYdym2MBuE/PIMEIXudCeYuyIQh9AEYlS+ihlkdezw4UeW19YvM=;
Received: from mail-psaapc01on2102.outbound.protection.outlook.com
 ([40.107.255.102] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0MVh-0007HS-G1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Nov 2022 12:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIUy4upHfxHwySKMhXu/uggaDwB505SZB3Exj/tUeSIBCs7NXqJIDJu+6uUSlfWtsdlc2AW2FK/k62TjMZOWN8HbRJKL5+0hWu7BucaThcglBrj5aSiN+27Mmm8U72KShfmr34SaSjIqI2HmTuoTgZF5YQrhb10c+cl5eJMEDXilWT7bM6WmvUuryUGMn85GWp6UIvm3HXLCBu+sEPNbgKRNTKOOOkwde0lgUh6kLHGwpjZhgI/sRc7KIDJvLf5D1ZIXU9aqZSi7rEJSuCLi4EJLUxMq1+ZkM0fjfxOLKPiLGT81b78RrNrt8I8MJRYERc3Yc3qK6eCpzhyiMAJqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=;
 b=I4VfxZ9dJk91VMtFqD7jRAJV1cwpeaeMKm6y3hpF38axq+W848VUqn5shj4ZCzQrHZ+Zow3KeGU/6zDHJ3gERuXW8EsWbknRXvnlmom6mx+Lhv4oI1y5Po3c96gP0lcRkray4WsGGe0nKmBqEPXdGihyJVZAX/UypVqs5ltqCCinTHwFii3g5lNOMEXl6qj75wQrXwY76EHoYVj6v6WzyXKiyfRSgqYXgr9dnYJ2je0Zo9eaVjt+V+brIvVGGwLn9V9+HoWw/s/4yzwNOLzQNEkQxyF67fCZu6fYhINneRJDruJcoq6LQh8Hq7EWJS+UbRC1+deRSCMpxyGIrYoPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=;
 b=GKd7w1x1xhVOBAjQ54Yh7G1wr8mJN8uM31vHdLIn+YekFChyDKePcNDgV5YtcJNVsO2wM9hOzA1TvPB+1zehDi+1rJFkFG5+4+cOCija2/nTPxyXSP4IrEqeD9rVGITIwTy34A67ya4LgbFgKwaKplbfPDFyXcbvGnr3P6KPyWCHRCQpSDmGUfUnyS4/dAx6m6DKGVzMbomhkqZzJdV4T5x2DnDHwT3Dzcs7gVFOvc/jNSs7sXDG5yN9ZdlmRUD9q2fpE3MphlF1xojt2r4DPB7yvVL3YgsomUh9tFQ4+M9MI3941hyz5TstfzHZvbmjOPGOAT2ROPWdxmGoMkb2vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5848.apcprd06.prod.outlook.com (2603:1096:400:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 12:48:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 12:48:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org,
	willy@infradead.org
Date: Wed, 30 Nov 2022 20:48:04 +0800
Message-Id: <20221130124804.79845-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y4ZaBd1r45waieQs@casper.infradead.org>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 74826231-e950-40c3-3f62-08dad2d124d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiRBBfq3Ledkkxvk1O2Ok3gpSwz1RcRM2whOPtF2gHVx0fnlynSmDrqMun0mxn6FBGMpo7CIxxquPMiYCO7O9VbBDJE85hB1KPHFBiNmn9mLrlVTU+c6a7GftnHnRaQtJAjfGuDDL4VQn48B4TN0mfTq4aTSFGS5wrsPMtIfBWZ+0A1KaEfViupT+Yzr1h68qRBzvuTqOw/O5UPUSI2oA8YuRssfzkByPAs6vCVSp81Qu1/hshz8NG2b/c0ELGqTBWNGFNHI4+cOQTrylN4clVzODvupcLNOs2VYipUEFIRwxd82i4mfZw7Oq4h8jDqD6xBelqls50uJQ6KUSK4uXkdy4NjUL1F/1xKDteKdKozZbDqdFkyeUqGrJ8nszQTMIfRkpwNelkqIQqXP/okW95NwW4bds38N5yNgN2S3l1vjQPntOZHc3EqDueCnAIzd8arCMIXQY2I1Y6LVv1qARXYtvZHZVgyUJkMp8CvZZPJW1jKjFzfJYJQBGvNAHwiGNdiyqDivA9vQ1sW9wg7qb05j7zONxDldq7xBrwdVGFrnw/fNC7MMwn8HE/IBd8nvvrocJoep/isza0Fl9g1m+5V47188OB587YPHQ2qo3Wl8mMDcrk6aBW8RqrURaNXMZ+h7PPPzmtqWkkYEeSR2M7eHzeIuuJBjSfzLWsEQrD4FclZ+XLqGm3IKnv4q3GB0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(1076003)(2906002)(66946007)(38100700002)(86362001)(38350700002)(4744005)(41300700001)(8936002)(5660300002)(26005)(52116002)(6506007)(6512007)(6666004)(186003)(4326008)(316002)(8676002)(66476007)(66556008)(6486002)(2616005)(478600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ENDJ7HFu1OW5rSWl4WzKOAWwN3YdUfmRXj3lR7B+BRvBZdhV3fKjgHizUVcp?=
 =?us-ascii?Q?zpeuW2+I0VbzYtLovJKLkCHWqYz6XLgM1FFIbHZBII9TTfabmjoDG48bmI+F?=
 =?us-ascii?Q?c+JMDIobxewE+0fPSvEB/vpOrtylnFd/mV2tiXNJF06lR17WKvizlrfXoJkQ?=
 =?us-ascii?Q?BMOBwA5cNVhDaELp1R/xea+71eJMyuCZquWpOgRij5bcjQVL6J9J41cjjVKz?=
 =?us-ascii?Q?X/3mJbHzATcNxX5adQBzjqzpmdCMamWR1LprWZckNLT5bK1mrZGlLurIqT/d?=
 =?us-ascii?Q?Joi7pLaGQ7hTfMZUY+xl2CsHEDErLF6RppRJZpiyVigXAQKorRtUVOaGv/sG?=
 =?us-ascii?Q?qJKUB5B96dHBob/DhDG4nrxRPhZsoGoJi2lv8cwUP+GYCjWeAsF/MfkzwxQZ?=
 =?us-ascii?Q?78TAX2jK53cJiZrh4VabHa5hXgpQzivpJfYcXdPhf7G3v7WryGH2fuHA7CgR?=
 =?us-ascii?Q?+caNXphVtFnAtPyZdgCM/+3E+TWI0H2nvyOFjR2Tr91G3lTGVBUEQ/yWSOel?=
 =?us-ascii?Q?oa52cuBGLtmb0ci6gKdHNjayhYQaZ/GkqVPXWbfNPP351+UQ9W9lRpOTc4AO?=
 =?us-ascii?Q?0lYViKdLp9+2nqUv0e33/bvKxVxbR331UMdvQ++TDV/nu6cDS6oj3GRTvE1U?=
 =?us-ascii?Q?BGmnxI7tYhKELrSG8rhKIliWpATI9NmGdbCeiccCvZFxvYjaqgdR3N5Dgdvh?=
 =?us-ascii?Q?cmRc518l9X+yHaPZDywN95gK3sj/RuFLrlfYXcdTSKSQTSbakmyfCeYspiwf?=
 =?us-ascii?Q?IOjlxRTKxmZE7nXegfYPOeO+lmjY5fGJQHwj/C6W2keGXR4LLoxcisN1rG8s?=
 =?us-ascii?Q?ktV86orpVmZF1eRGAax9Y6arzAtgY7oua5RvvWRvkHel3SjMIdcAPSq3pBiv?=
 =?us-ascii?Q?DBQSTy8TyxMGvj/J3jZlLlLR9pC9Yb6szXa45x7juTr4U4Ugu+XOpmKSbk5w?=
 =?us-ascii?Q?gJbZERAmy7v4L3jMt89F+wbXqIhmdyb+YgBdRDZe5fSrhS0pe6AvIjUoFJiI?=
 =?us-ascii?Q?SJ9PXxmJeYuzBrge+zML+y/9JdPB0JFzVDYQowTtwGCB7LBKh206JyUZzGOt?=
 =?us-ascii?Q?zRTvpsQGfaMylQbdKPpBTJ7ksd2wGsjwy4/3eIJmADa5eS/bKLKnWrxBdbmZ?=
 =?us-ascii?Q?bgpAjyPBOtuHKht/f6FIKPz6FE7GYEnpwVyCZOFCB//iKuvu/YNXEHO2k3qQ?=
 =?us-ascii?Q?8eP3eJQ3cBSi8U325vLtsB7oFRXjuBysvRgzVvxvSSrbwO/eJMvm3OxzipOq?=
 =?us-ascii?Q?pWXvc09crRcDCCNZETJ68n2r8B4qzXmNRyMD0HRX10dpiHdZaKRGpHDeUhEK?=
 =?us-ascii?Q?+nI8cLN62IyWrEKAZhfncn+GmkT5tjx6RUixwGoHpnS36P28jeWRhkVBWq70?=
 =?us-ascii?Q?3O21cys2QWEisdPhc3T2XcsCUOGVB8NbiC5Qq20H4cTNbwVfqWguJS9kUka1?=
 =?us-ascii?Q?Sn3Tr1uURIyGr9zas44RzpuHj71I+FCgTBUYCnQc8GT8qypJ7Mtm4ZySJuvl?=
 =?us-ascii?Q?T6PTUw3tjjoHPLpIuWVg4I/GWR5/Bb8eR2Hrd7+JwtBFlOx7NBKUhNiLBFd8?=
 =?us-ascii?Q?qByX4ddqdeKGvE9gx5XH9OVHGNb3zYROWAkYoUtw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74826231-e950-40c3-3f62-08dad2d124d6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 12:48:13.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmG6I/DG3N7S86f9d1dYa5MHhK8mXWyIGgu6EiAI8LnX0cR1tFX/nLRgCU+PfKwJT2tOhCh+YXUY8sT5fG7NIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5848
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, > Thanks for reviewing this. I think the real solution
 to this is > that f2fs should be using large folios. That way, the page cache
 > will keep track of dirtiness on a per-folio basis, and if your fo [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.102 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.102 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p0MVh-0007HS-G1
Subject: Re: [f2fs-dev] [PATCH] f2fs: Support enhanced hot/cold data
 separation for f2fs
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
 vishal.moola@gmail.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

> Thanks for reviewing this.  I think the real solution to this is
> that f2fs should be using large folios.  That way, the page cache
> will keep track of dirtiness on a per-folio basis, and if your folios
> are at least as large as your cluster size, you won't need to do the
> f2fs_prepare_compress_overwrite() dance.  And you'll get at least fifteen
> dirty folios per call instead of fifteen dirty pages, so your costs will
> be much lower.
>
> Is anyone interested in doing the work to convert f2fs to support
> large folios?  I can help, or you can look at the work done for XFS,
> AFS and a few other filesystems.

Seems like an interesting job. Not sure if I can be of any help.
What needs to be done currently to support large folio?

Are there any roadmaps and reference documents.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
