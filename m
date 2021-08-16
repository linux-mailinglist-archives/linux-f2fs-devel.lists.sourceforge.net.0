Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BBD3ECF77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 09:36:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFXAb-0008FX-Iu; Mon, 16 Aug 2021 07:36:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1mFXAa-0008FR-9O
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=; b=GGrvekRNmV2iIt8c9ZBdnO6/RB
 HV9tg0uc2XtsBRln7de0tGM/133GOMNzsI8PztDDcwmZjdyOGfmy9qWkXBjF9u/pD+72GRxVKF+G9
 kBBFN5UcgVGgj9JmXVw5JDMofkWhtuCCM+x9zVDqTNp7ZTvdsHA5G/DdGY/vddPbj4lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=; b=D
 dIFORmBYVY+N1jN/rT+929kSXICckW2my8NBWsqS5hI3c51cDJzVLGzC5qMEdPPdiEZ99BiJGBaew
 cSY0bZBeVAV1DeLz6aHYaoN/UpCvH5LMDyUBNLHbcwwDQVFVJ8CwM/+It8Y2rWWS5IdX/RciePZuu
 /C393bvdTlrIZ2DI=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFXAT-0002px-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:36:28 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G7W5C2003537; Mon, 16 Aug 2021 07:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=;
 b=D5UKgk4L2qDURM+9jIBFS4ZjaPy+Soxah+LNeFdkPVZSWw5++HKXlmc2z845ut+RmbS8
 F63yLpxg98IlTDciHa2Pj3Ch6SywKetZgsRt7yLQzpNoKHd8Vuyk4LsKRe+Y5fDR9oWI
 s+6u1xOofzGdYiWJG0TNZ3ugk7PY8yPqvNq5EQ2lLstyFK1v4alTjDlqYurjZEWNwTZS
 H/UkqIgJc1M594adRJf+EW4mJL+LiJv2jxnhg3yP6rWPEeAKJB3uzLtB35JgdFpWnLPz
 pksMLT0Wn+rKJ3yGjzXwz+Zonu/xgaWwSntar8FcmYya7UO2fF5SsUGqlL3VUxXBvMbX Pw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=;
 b=UaxeQVYrTJ21pEDKszHn8uOQPu5Av6XZ1JIH/f9wB8C7J50kcQ5hjPoAz/D1tjWrCV+T
 0Pc2tQ0SpiqeLpeantvIqxNRFzE+73+HpxtG1lJZQDaNvRSe9q5gxDkZ7o1EETgepVfC
 P3yXYzAq7FRhyG7vzthO3gHbUamulDm9QxJJc5V4ZqSbqLFeTFZJJWV5uWy+O5keJbUy
 xV3Nd4iAnOPJ9kmR/Q4w88yn3YG5nyVk0DwVQtBsCqgGmSTfySh1KK/dKyGlkqcSZ5Hc
 hGqx7mdMnlVxhd3dU0r1fzklyUBRJHHknS/nRbxSwcjHMawAogFrccwi8QC4tA9Dkjqg dA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af1q99f8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 07:36:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17G7UqNU093606;
 Mon, 16 Aug 2021 07:36:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by aserp3030.oracle.com with ESMTP id 3ae3vdbyw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 07:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8eryr2djlObXMp/iI44zmxe64H4FXDZpLAVvW7egaQHHoUYMxUUnN22Y6wcpsLQozU7aGAgYAIq2850fIrP7OHZPMO5yP32to4oTBDdggkK9dD+J0lTI+hAupya238viQPEOFbKMZi2I0WQzRnaTDC6lH+397X0MHqSqCk7hwLsrBHuo05oV0Thyh2PESBJ12Q69Ixkg47of0QIPpdkSp52G6IHQZ9n2qruCkSZopCy9sbyZAJ8xGyUyyx2XUIFAtJhuK7yxV0p3ElmTz3YlfUG2QIqY82R3DxahCckhLlOqVPhukL1wz+rpLIVeW//gkc7t7kZGYff3MfRjO81Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=;
 b=VTuGpyvFcksM7mGu/q/UkTUJfx2ILR5Z6O4ppnOiqV+tSQ4qSXSQLz8cf8FYv9tSVlPkJeuaVGlAO0RjHE//Yd4ZRInLGJUddm+19YaIq7T3cdhYlt+Wdmak9QzMBJsciFLlDsdLo17j/BE10m+vAT/a4CXiyxctUwfsJ1heL3ceW8vKs0LMsARrey7eiqBbolXoNYZpNPkdp0DQrvXaAcptmM01+cf3EoWmNZolnrRBpUTghw8JbZmhbV1XDqKDFyZkzHxEZ6OYG+PP58+kMf/5XiaJ4YYAjtcZyq+IF1F62+2I8P9emb5gj3Mdpj39Zqb8ehChesSNhOQR2CVvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfdzr39U32RhhOrS4QJci6umvfHbhigv1X+NqLQBcqI=;
 b=ePc44BgWefUEu8kqtG7tAGoPxeIqgwWSp8VPVQ6jATOQ73vV+yzRTVfXhON0iHqGueRHt4xoz1iMXSkXmt8c/C0csvHT1gjQZhPi+SKyvAku3drQXbuTYgVmUDan1OaS3/RiJdWpjUHEdK4Qpwd+Y2ZkMcFHQeTHZz+4pvpg+n8=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1726.namprd10.prod.outlook.com
 (2603:10b6:301:a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 07:36:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:36:09 +0000
Date: Mon, 16 Aug 2021 10:35:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: daehojeong@google.com
Message-ID: <20210816073559.GA12039@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Mon, 16 Aug 2021 07:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b6b25b-7bc5-4d93-eec2-08d9608883e5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1726C97F054B39955AF68BF78EFD9@MWHPR10MB1726.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6CRr2NcCGJHI2YEhZFl/0XsvHSeeHl1qNyUitSCpC1ht92CieFdPd5qhGHQhIrVNFexPP/nWeUkGc25dexIgA3ZvGK4Xomn43KIA5AKbIr1Uis7vfMnEneG1OOgRTvtQmUz1b/atebfgo2b2MVX7saiFOZJLyl/5HngJy+jkd9w8XuLB//0jSl4EeRU9VHshOTDlVY8IQ88T+lNSrS6MieNPnOCCnPehjYM9/EqiOtiZDY6gvNtysdnPbr37G91GJR4PWq7aM28w7tgf8mZA9BmzC7vztxnEpqK5HjmYZFFxZRwm1IE5HtkGO7jwp3bKywG2RGbY8pDG0GwBo6fppDRb8LPtbKxoIFXs/UsrHCYGE78Y6s94XwOf77eNMZiWO1pYSKvqtu3Vu2iS6TqI3JBvz6qU4q74SaTIelSovCJpmu2Ss7619Hq8SHUxzgX5AjHXtQPqGMA9CpqOZDcviSltZlOY5Qfgb8WBvZB7GI5Hn2g1QLAu0lL4QvGZtTrExLfDfVR2mCdTrpZSSR6u7VM1+X/M0HlJd/AuRdJaS3nwvn0JWUch8W+ClGgwgX44pn3hkG5p1lAQ7+DHdXFuCr98sfT5Yj6+AP82fdVzkCLP86kXpl24ucdSZCdAzJPHRWVZDTXGqQ1/l9+gs6oDR4JnUNRQPeX7fdqeN31PcKqGzSXcncxLI2TUz8Uj6UUdTJWy+ClErg6VPvqewEP4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(5660300002)(44832011)(1076003)(316002)(2906002)(33656002)(9576002)(66946007)(55016002)(52116002)(956004)(4326008)(9686003)(38100700002)(38350700002)(6496006)(6916009)(186003)(478600001)(8936002)(8676002)(6666004)(33716001)(66556008)(66476007)(83380400001)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RfZuUGLLymplegVBHojWMKwaNIg2SwsfzlL7rv2KE657Ed7fFQCppl/Wclsk?=
 =?us-ascii?Q?TARLeorHeoUE2YkKP0k+YWj/ys9d/fNkNFQ0QcdP6ebXu3xI2T1nSE+3muSJ?=
 =?us-ascii?Q?EpWHmwGLNUidKRemY4Ud1HXlBPwm0rG4IiJI796h/IOb0acydf9CM12Ciss2?=
 =?us-ascii?Q?Nb+1QT2QXEKHSLCVNhwFc9hjpnSiczE3sFdedHW82cZFnG3z/O1HHEHJJj+B?=
 =?us-ascii?Q?szVJmyXNLj4Pe4c5qfmYeajKFxN3iQzTXrVz3rbGMdJkhvySxQWswBHzRdYi?=
 =?us-ascii?Q?noiJuzax/n8oqeZd0VetneLnTT7kg0N2JMjtPfq7JT9g7Mag06ln1H9p4o5G?=
 =?us-ascii?Q?sVsXEPGAgjWfU/5B0no8g+pj467WxQHnjxtM9+NL6bow2Dx+HmyidxKbWTF3?=
 =?us-ascii?Q?1XgC3pzpWhwgLPvJ8pYftEqvYNfgNKAkK6lwTfzeqJFLbiz8X1y7a1geNTRG?=
 =?us-ascii?Q?iazSNpNRpsHz5EDfDkHFzEtfMQcdNaNWRn2O3jHXDMrJuke19JgRzhHZRt8u?=
 =?us-ascii?Q?FDrXkQ3U327R3daSE1TqXVo2s3NMJB9h2Q7/32RS0gusFQ8Fu2VU09//y7mr?=
 =?us-ascii?Q?pKxj6yWmrC73opwgUC0FfkXoalPY3g/nUVmtvInKURDif+aFYAOmjTvxwNQ/?=
 =?us-ascii?Q?Ne7d7+D045aPGW+PtmHEenh/zZoSFfqLFwvKQZIHEaf1z9XvdJJ7pvPJ1I4O?=
 =?us-ascii?Q?sLW4fsodvekiFr0gnEmaOKDmtjguQuGtmaPPdCpLt3Debz6L3+jGpyDrzHVv?=
 =?us-ascii?Q?9nQvvOhNfuujLrJ/5dRAdzgL2YbVFtZPyr06qMuu0qOtUwy7xztoGcEztmhj?=
 =?us-ascii?Q?FubFM35cK8iXO0iGR6nuj3G287EYysWJGbkH9UOmmSEHT4mFeXw4D+N1p/Xn?=
 =?us-ascii?Q?XR1EbJPP5tpgNXVJ+JslhgqiYowhSogAnEmmkGauc17nqgi96SzAP3G0VcwZ?=
 =?us-ascii?Q?/t7+/pX9nQKPU/+nFEpHgL0xFuGlsxw0oUjjkwE3s8JmM08aLu+KjRfdn/IU?=
 =?us-ascii?Q?ONRezE2GDLPTK9/jU6txTuDiIA7ZwQSfLp0SYc2qlMeblcj9E2fBemjvMrOY?=
 =?us-ascii?Q?/xsuauGMcARbz6Mk6LvJgBDU9bz4uBaUsR8atqB5dWFk9S7WDvIDWC2a3/Qs?=
 =?us-ascii?Q?6gZpRia+RflMT2Cqv1qJAOVz4yiiVCSycjbGtM4qrjafgIbCv0XDnE7w1N7a?=
 =?us-ascii?Q?IpEAoyh8yu8nWlWayycw5DIorvDJCgtKH9inMM3zReyAvmR7HQ6Q5MvSldMo?=
 =?us-ascii?Q?PmUaU0aj0f5SprsFgU3WUrXAp3MKhvPAO0ZURmrjBusPsq4xILoOSEpqLeLh?=
 =?us-ascii?Q?ABb779cZMU0meTiE9U7BBmeH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b6b25b-7bc5-4d93-eec2-08d9608883e5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:36:09.7846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/rqQw2VWr47xyFVeTJeBddbC44+NCLbnCb9lHoSsuA1fehRJpSRHdtWquVyfSMpSCmawhxXg2lyDZE3U6FmvMRy3xX5u/SGbx9TMLYXl7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1726
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10077
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=407 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160047
X-Proofpoint-GUID: 1js4Q-QeDN8b7-jn8A2F0R2zSPBff-xj
X-Proofpoint-ORIG-GUID: 1js4Q-QeDN8b7-jn8A2F0R2zSPBff-xj
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_L3      RBL: Low reputation (-3)
 [205.220.177.32 listed in bl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mFXAT-0002px-Pz
Subject: [f2fs-dev] [bug report] f2fs: introduce periodic iostat io latency
 traces
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

Hello Daeho Jeong,

The patch f4b05791dda9: "f2fs: introduce periodic iostat io latency
traces" from Aug 3, 2021, leads to the following
Smatch static checker warnings:

fs/f2fs/f2fs.h:3365 __update_iostat_latency() error: buffer overflow 'sbi->rd_sum_lat' 3 <= 3
fs/f2fs/f2fs.h:3366 __update_iostat_latency() error: buffer overflow 'sbi->rd_bio_cnt' 3 <= 3
fs/f2fs/f2fs.h:3367 __update_iostat_latency() error: buffer overflow 'sbi->rd_peak_lat' 3 <= 3
fs/f2fs/f2fs.h:3368 __update_iostat_latency() error: buffer overflow 'sbi->rd_peak_lat' 3 <= 3
fs/f2fs/f2fs.h:3370 __update_iostat_latency() error: buffer overflow 'sbi->wr_sum_lat[sync]' 3 <= 3
fs/f2fs/f2fs.h:3371 __update_iostat_latency() error: buffer overflow 'sbi->wr_bio_cnt[sync]' 3 <= 3
fs/f2fs/f2fs.h:3372 __update_iostat_latency() error: buffer overflow 'sbi->wr_peak_lat[sync]' 3 <= 3
fs/f2fs/f2fs.h:3373 __update_iostat_latency() error: buffer overflow 'sbi->wr_peak_lat[sync]' 3 <= 3

fs/f2fs/f2fs.h
    3348 static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
    3349 				int rw, int sync)
    3350 {
    3351 	unsigned long ts_diff;
    3352 	unsigned int iotype = iostat_ctx->type;
    3353 	unsigned long flags;
    3354 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
    3355 
    3356 	if (!sbi->iostat_enable)
    3357 		return;
    3358 
    3359 	ts_diff = jiffies - iostat_ctx->submit_ts;
    3360 	if (iotype >= META_FLUSH)
                    ^^^^^^^^^^^^^^^^^^^^
This means the highest value of "iotype" is NR_PAGE_TYPE.

    3361 		iotype = META;
    3362 
    3363 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
    3364 	if (rw == 0) {
--> 3365 		sbi->rd_sum_lat[iotype] += ts_diff;
                        ^^^^^^^^^^^^^^^^^^^^^^^
    3366 		sbi->rd_bio_cnt[iotype]++;
                        ^^^^^^^^^^^^^^^^^^^^^^
These arrays have NR_PAGE_TYPE elements so it's off by one.

    3367 		if (ts_diff > sbi->rd_peak_lat[iotype])
    3368 			sbi->rd_peak_lat[iotype] = ts_diff;
    3369 	} else {
    3370 		sbi->wr_sum_lat[sync][iotype] += ts_diff;
    3371 		sbi->wr_bio_cnt[sync][iotype]++;
    3372 		if (ts_diff > sbi->wr_peak_lat[sync][iotype])
    3373 			sbi->wr_peak_lat[sync][iotype] = ts_diff;
    3374 	}
    3375 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
    3376 }

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
