Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8879A6C0956
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 04:35:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pe6Id-00061U-IZ;
	Mon, 20 Mar 2023 03:35:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pe6Ib-00061M-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 03:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcSocjSGVTF5aPxsLKaFBjySrnM82IY/w/dRKgIVLtQ=; b=HAF300dmcad7l+aWtQ255fpEBl
 EWpTB6UQG9SMzuGtF7Lk6vsowE9YM3W+wM2VudNpajklL5oGyIzViCDGkgPfAKUDfSG7CgawAuzOw
 Y6OefdBLnNBTgW6PsgRiUWXgNvEQS/UiDcUnuNtJuhMJb1sj0ojnbeuOa5u+ej5TBYyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZcSocjSGVTF5aPxsLKaFBjySrnM82IY/w/dRKgIVLtQ=; b=l
 9zvIHkHiNhXrlQtTuL/FVKeVTcsX5SCIf5NGiyQO2+BVGQusWWVchSDgBCYSqxv3BgAVtSQKsBFsd
 2urRi/qgpHLJl0opjD2A7KCgc4Fbk9EJAhZnRqXLusz4LRbpwtvnFXSXIdYcxtcLJ12SgHA/7cbyH
 eMpAJZFQmUoGeKkw=;
Received: from mail-psaapc01on2136.outbound.protection.outlook.com
 ([40.107.255.136] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pe6IW-0008Ps-Sa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 03:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEhCxh8D02rcHC6dO7kSOfQ+AGgqO7UxxE69tDyIm4Tqs3aweJ2dCq3UPkCLzV1UZ4dCLggR86K54XogG9H75P/5oJbWN3Ba6Wj3cGM6kQ42z+B4bFqJ7+nT4QasBoWWWNjZVEgCadrqhLpDCGGlApiRTNukDbmIEwtYHlHziyn3tLOFMVSeP4xPlntuwMq1LzzQfOpwWSp56AJ/ohgpVKYqPnOHJZjrgFkkxoNC7gV68ucQZxKEnI+wUcVzya47akjjoTVLURODESNAW7SDu5/xOkqEZJi8jBA7od1DMqCyN/EIGgQKBjL4MJQ97gRM9taOqDh8vMOb4eA3AmXF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcSocjSGVTF5aPxsLKaFBjySrnM82IY/w/dRKgIVLtQ=;
 b=gry7E8prSKnGmd/mnLmfUklTMk8F8AMmcWZqTtxEv2Grerwl0LY4m7aQ6ZY5ZkwGG4gRAE87lSYHjrqeNyYtyMMWY8RnHLmkE75DsqpKupAdGopskoG76nqzkrtz1G38ewu490FMsWiNviE+Mk4nNrf7EcETDNPLPwiNMaRJrXZWNSPW5QzWZBB2BJ8FpGyc8eJB9nXNOu6b0+JijkLVRSEDCQx8wbW95+aqN0L19GMhgUvlAVBizJbsGCG0og+du33uwgxtamFzQrDsjzPYZfXOjIXMO5IZpGDVHxDa2tNSRVrmGfcOCG1ZSFlZ/UNoNdq4D/Uj1QqgWxdM/XkWCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcSocjSGVTF5aPxsLKaFBjySrnM82IY/w/dRKgIVLtQ=;
 b=AJe7Jj4ygTrfHsWmTT4gnppAGvUAtxhf60mNZ9snE2grxP1YAVIKUBTbJ/FhJ5/07pv8NeiaL6A0EZa+g5rqelTm3a0QrRsAiby1xgmZIMDm2bFMzFic3A4Ap5WaN/3eXitQCTaKrI5A+3QSsXTbt2M68c4+uZktefL9Z3fLqeW6/lu+5gysxjGPeHLC9oRgqOFrQBpJs4tJfyf6Rq2xGn1cu82nJjuy1FyxVvwVKYWDfDDhttvFoqM+VaHI1Wg1Z76w3xT8mXwPlMgZYh/Mo3P96N+cvuT2fYhTrbVfImLo75Husxpwqnv7+ngdcX8cHu+TQp/EiAT08AePZWmV1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5332.apcprd06.prod.outlook.com (2603:1096:400:215::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 03:34:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 03:34:48 +0000
To: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, xiang@kernel.org,
 chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com,
 jaegeuk@kernel.org, trond.myklebust@hammerspace.com, anna@kernel.org,
 konishi.ryusuke@gmail.com, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, richard@nod.at, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
Date: Mon, 20 Mar 2023 11:34:36 +0800
Message-Id: <20230320033436.71982-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5332:EE_
X-MS-Office365-Filtering-Correlation-Id: f751e256-4fc1-47fb-8f9e-08db28f40e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wKv53Xg11R61xkWPk5mnClQ8de5hrpPWB8AtDbwQpOKWpR4TXtFRutbBhVfXYH4DJ/Fn7Uc+kee0v3FfsmfoCGKYw5Dqn7O6Cl7WWRXXfYDhl7o5kGtWqGOIfdSt+2RJPg1iUeifueBc3OlZb0UF7GUrerp95f10B5uwqhHFdR/BMn+HsajL11VjH0aY7jZ6ApJOC7NDOChCoO53Fkf1afmcztY5g+7L0qfc2lffod92lIaWCBcd6xqLok7w6Otx21yGeuY8ujiXBKEV5IqEisg7MqgpkDacRtRk0i6ZRWpZoZDGaeSU0S/Im1JXWfsifOgwoVfjS+olFjwJyhx6V/RZw8TJZJxJFhgRZemJjDpYSqGe0j1QtO971xFWo7GA34jPFEzG2M63xnpXCtnucsOGdijZDAU8CdD/1C7tbB8Al+Z7JJHoR+3wAp9DITt6TVM0hSrddjGTz702PBOIzx0pik7kONo8x+qeadcN6AGfbQ9aRyv1h1gG+xIyoB3EuP8LsinkxT3gLiJ3qoju+Ss23clyia7rf78Q03tj6wErySRJGfo/P8QikEvF1C8YbVqC4FfTu/1OJtXCSXj8ZDaKM7IhDERccfaehkWxuep3cqtzu0MgkpZy9UvFsNbEylkeKRo+UgjCle131FWoQ1yQWA/HQIWtJQvUIF2NK3Jj265bMqBRoDaFBefcMI/Hdcy3NsEuFV8xo719E0d9Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199018)(316002)(86362001)(83380400001)(36756003)(186003)(6512007)(41300700001)(26005)(1076003)(6506007)(2906002)(8936002)(66556008)(4326008)(8676002)(66946007)(66476007)(2616005)(6666004)(4744005)(38350700002)(38100700002)(966005)(6486002)(52116002)(5660300002)(921005)(7416002)(7406005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOVviU4OLZJXsyvg+Cb0Zd596sZD6jRFwETNbK1ENMei6KQLqPYkZn/LWAod?=
 =?us-ascii?Q?LFlYVQLzwo8ZkahzIgB9vkOYF9xWmlRxFJ6XRH2kCXHb5W0cm69FKoIB+IpQ?=
 =?us-ascii?Q?GHjuHbM7LAdvFXK26er7Ca4bPDbl/fCXddz5xckZu+/WFjvozf45clS3WlSQ?=
 =?us-ascii?Q?ZpTnah+B0wvHpxem+IYteQU0SwUGQfpEMRtOYbLyL6qAgF6uLWLyzt3756EQ?=
 =?us-ascii?Q?FMIZQ1qa4D2vFqz9IVIxtbu2KR+MUeiWandNIubSwD90yNIXSSPL3CRR7Kt2?=
 =?us-ascii?Q?UusFHeFqL2ZqdQGEkGmZPlhRFz0l4LaZKOgmzaiz2TvXy48bsydY5EoVC1Bx?=
 =?us-ascii?Q?c/9c8/gnepgZqLafuQ25SMlRkyINhLjju/CkTzLmJSFyWvVNr2CF4s+aj2v9?=
 =?us-ascii?Q?PTk/sv1C5pG0j+pHmx3vYdG+18eu/36mz1+MLUjt7KzrRTi58NncC2+0JTEZ?=
 =?us-ascii?Q?PLSdCL4Cp5NM77atOMH9fsIM3/VVz0sKqV2ICmanDVZI6ytbpObbBGU+bLhL?=
 =?us-ascii?Q?7SQy5atPh09G6KyykYMqyvIBWdB3T59fR+d97iAgPvGwCNBrSCehASBAcpmD?=
 =?us-ascii?Q?IqeJ59M2DWghrEpHRvyxap0VLXHY8N3f2BfUqq2NAXx3FjCAAUwasD2OWQNR?=
 =?us-ascii?Q?oP/b+x/deMyJcfGccGjtfBicWhArQgNBFT+kaRIfqNEiDIHFDUvMgb0ocERb?=
 =?us-ascii?Q?vdVbavspQUeeN9J/Og0talyjCFHNaJ75gQfz0MBvb7FXZjgPDRkHQGV3NoWG?=
 =?us-ascii?Q?R6zd4sJkyhgSHp5DghjArtkDyVPb3W1TOhcMMpQN0DrG/q7laXgKYHBB8Gs+?=
 =?us-ascii?Q?1xjv12UqQQBnOaXb8rmN4ltbQuDzHAiwlWVkvOCnN7XF9Q6ATwIHwPaIIHgJ?=
 =?us-ascii?Q?9c8obY9R+9cJAlZNFLWbXZgMr3ubMCyUooH16xG8yMoUPguLfy27PgiEsX2E?=
 =?us-ascii?Q?4CABBhAlb47zI9UEmWX3c6qoV9H1Z9c6ImmtB4G/qVGAXiYTv75Oni4VLOw0?=
 =?us-ascii?Q?Rn1MVMpc0uemHzcJ8QsYiKJOw1u1jI98d3H4l7qKiK2tqedbEBoe0z3nLiZC?=
 =?us-ascii?Q?RIOuLg9i55zHr3Z5ADGDOuigyjPSsWkEKqtjIOmUHU82tp9MUVDyowDA4AsN?=
 =?us-ascii?Q?TkTFLvQlKbg9lLVCQ0YkuSJT1fL78Zrjs1VmyVN+OLFbpZucVKY7vSOugBvJ?=
 =?us-ascii?Q?DUQ80xXsUOiY2Prv9xt1L/p3L5A1Dkdegk+hytx9NAp86EavEZjmahLYZdHX?=
 =?us-ascii?Q?VDyaqIWm2Wj7xIO05JdwEiKk8aNnXlaAPklbsh0b86kGhRJ2Or3S8d1SfEKz?=
 =?us-ascii?Q?4Llmo3ydrxoXnM92o+riWRsOUoQxo4kyFK/cUTbYeUl2KluYmYBo3hwoyG2N?=
 =?us-ascii?Q?MNy+uxpZ5Mr7yp2cP9iA+irRpXiQSu9n1LY9SI6PENKCAO8/XgjsK2/K+Oqs?=
 =?us-ascii?Q?d61g+cMbVL5QdiYE1PxJz8xlMBFO1y3LYZymTzbyfVvuzpwOug/UAd9y+85I?=
 =?us-ascii?Q?4Oo9UrWozu5FOUmkgGxE3a9SDmgtwR1haH2DcGDVSqtZbM8YJTcSv3otjWoe?=
 =?us-ascii?Q?plFj9G8asOeg74gqs1ExMB/ErjQMGIVhsm0uOCwr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f751e256-4fc1-47fb-8f9e-08db28f40e26
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 03:34:48.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERXWBy66ojC7BGjyoEPIS3BCt+Up0pT8AUuN8PWEg2BC2RV9hvUWam5vNjfOSBOyJhCm7utXsOgYJTYwzm48HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5332
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, Out of consideration for minimizing disruption, I
 did not send the patchset to everyone. However, it seems that my consideration
 was unnecessary, so I CC'd everyone on the first patch. If you would li [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.136 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.136 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pe6IW-0008Ps-Sa
Subject: Re: [f2fs-dev] [PATCH v2,
 RESEND 01/10] kobject: introduce kobject_del_and_put()
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

Out of consideration for minimizing disruption, I did not send the
patchset to everyone. However, it seems that my consideration was
unnecessary, so I CC'd everyone on the first patch. If you would
like to see the entire patchset, you can access it at this address.

https://lore.kernel.org/lkml/20230319092641.41917-1-frank.li@vivo.com/

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
