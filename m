Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7AC523411
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 15:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nomGf-0000Hy-Ao; Wed, 11 May 2022 13:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dan.carpenter@oracle.com>) id 1nomGe-0000Hr-Cs
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 13:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GarFKwB0E0HpTodcDMqs8cGyVD++nBBK8e/AtzwGA/g=; b=enQkzqz8jjGpsT+FxQHyle/92r
 7sBkiAX9v+HtmmH2t25wvmVPW+60aF1X5082TqdLmG+SPj1pJJX2Ou3jBqE4NggL7K0Gl92jUjshP
 YXhRKNEUcgMnfj7drjeCiFG50MIaP5G8chbN/s9dBxlhP3mvC6H7LpOfJUK6OURp3ns0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GarFKwB0E0HpTodcDMqs8cGyVD++nBBK8e/AtzwGA/g=; b=d
 chtbAg5OCTbxgav8iv8wivb5H5xBHTNE+3KP+lc7EDxdZUcIUEUcyh5Gmlz6BwMrhsLWivB7ZDIir
 3gYUFIxkc6bV/q4PBDA0+Ma3JXeQ6N/JtrVZZE3qoSho9q6guv7+dHRdKGIkeiryhVO6kPommdrk4
 zBU8wlrm5gBVmYY0=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nomGX-008psc-86
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 13:20:38 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BB5iQE024475;
 Wed, 11 May 2022 13:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=GarFKwB0E0HpTodcDMqs8cGyVD++nBBK8e/AtzwGA/g=;
 b=p1oaaG/+X45BMszz3HRgeLBZBBeO4KEVcavPCyVSHXvfOcrnjnjceVw07Va8KBZZvVg/
 9El3RtqCn/ycHM2368ySclsnwf1uBqn2ieEHFQv4Gkzdyt93zcJWVYTWdHYq9SBnopE5
 pWYsqkoKpCs3hLLhcXn/C14pe5rSQd8As3rJr7tP4NFqwNNLTButH0M6SeGSpHlpaw0t
 VROw1gcHmIo3apw+BbcbiJ8YC52oRAB0kiOnIPDmq9/t9IdlTLFl1X0vqcHLwNXlT+dd
 PRGP4KCYryacIp+DxZfmHNMvSygG/pbijT3S00ETBqhrcJwRkHSY6FrbJVKlLzQ93xkd Bw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0sqc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 13:20:22 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24BDFi1N004541; Wed, 11 May 2022 13:20:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf7akctn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 13:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz/Abx+CDbg/Fobuzf1EhsShZs3C9cjeRUoFJh1r7bc/fRlL83LQJ6g7aDqx1TbWyWS8KQMG9LAeE9FvQhACkln9rkRlKPiVtAoL1uuB1mKZJU4d1rD1eqDPNKiFITk8ZscMrYsDqucx9yuGtC/Ufd+RzAvhh8irtd+m0dtz96LT8zjZgf/yzLeTcOq1HsO8SeTXlXPxslZUbfXC9rirDxemlhb8vNZ1dnpHGbBapHNb9aN6ybk4kB3pYuDlLb5gm7ufJEFasWnPC9ylGj1oLkuzgyPc7rAmggq81tFUpZbJMYsTZ5CIi6jg3f129p+VKFYqRhIvjWOOSaw9luQkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GarFKwB0E0HpTodcDMqs8cGyVD++nBBK8e/AtzwGA/g=;
 b=L76gnd1yDFLn+/e5rFWaz9Kb92gihIAjUfAoyF4DXhc00zOs1uFKaJAcqNtwvjx4uqTiqlx/2NeOKSIEOwtT1b7ff/hMu61NwubdllnniCCCwGVlui9qxZxWs9VrZ0W0s1g5LZNjzAa74LL2+LxfaBfSPJcMmbpsLexgRIGmVQPYr3ABrSvvHX9PlxO+7AKHQahDn2q0PjEXUCKxcv5xjEHSkCiNWBj7JVh/BPgH5vGKoeDAAhaqrcvIhA8ntyFXKJ2JcifHrTJ8xNOHLrSsCkTLwcmWIbi95ajxoTWNAdUig50vfC+4dzOpoe1HOjcYc7kuBxpbnXb0uk0Y4BqNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GarFKwB0E0HpTodcDMqs8cGyVD++nBBK8e/AtzwGA/g=;
 b=BNtmvjDvYSVFQucvoVYuExxH5QhrPK+5k77BgABWWUrNn5YdXp7nW34JeYFgjyTQsTeXi7lRVgG6EVDXESjBcUJPZB2FMzvmTIfDS3uzEkJkWV301fD73nxzNXnALVEtOKNyKkiWkzhrMZLMNa24qpH0o45ASl2YzwEEe/BR4pA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB4880.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 13:20:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 13:20:18 +0000
Date: Wed, 11 May 2022 16:20:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Message-ID: <Ynu4CGiqiU4l2vdf@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0040.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675f9e3c-39ec-4012-5937-08da3350fe6a
X-MS-TrafficTypeDiagnostic: DS7PR10MB4880:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB488053FFCF27186FBB67C4F08EC89@DS7PR10MB4880.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeBWD8BdlutmqbbVx3CEz7+Zra+L4k/RmlLVtBVTeVLNjyWhK/Yvb5e9hx1CRiW7DpLzs5AmfFGbkG6kP2WUM56Z4ywgEZZ2R+Z2pC5hfygwYob7PbGSc8WEYvUtqYqJ4b6zKf3QDo/wsflcHx5UORzQy2iKxmiJ7tM73A+vn1tmPgEvrwQMO7K6P22RZZ3ZqRMlTdDCKMM7RylkDFd+fcou26RdTqs4hps1eRIg6lL4Pvn8HaAP7a+ih1i+iMoQrnWKOTYcfUekpm4z3OdsycTM5vCcpQnWsHXuPRhnntVLTjpmWpJUBetHI/GFQCbm+jCiDPj9znzchc1cR7bxxgkm56uPXRNQ0ZLzEofRF04jbasJiVSz5zC+1HnUJA67vbMI2VV7Qn2hmhQB+k8uo+c5U1Z0FkY2Gf/DOUHIHq/ojY+unZQttCud6D0xd8PuD5HPd+dOlUmIGWy6Rb2J4sZ0J1HAjfCdO44oPxEicwbn/SzX/Y8WfN4gUZlYSoQhp8FBBcaC+o/OOn0n/ZxwxmE1hyWurNoufVlBvNbITXcLmDnFiv/qvlwT/yWTZ7v03kEBB+fs1rl+9PhW6W3M72PyMPLCv0JBLVXi99Hk4I/RujqJPPGe8OXS6R80PCf0p0aTnTng4XMFgaR1Zuzdms9xnO03q+9k94dSuf8a/k6l4bRJVwbqRqSYyGFlu9PFM3g/ABeGD2dgg9pn8bZ6Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(52116002)(38350700002)(8676002)(6666004)(4326008)(38100700002)(26005)(6512007)(9686003)(6506007)(5660300002)(508600001)(4744005)(44832011)(8936002)(66556008)(86362001)(6486002)(110136005)(33716001)(66476007)(316002)(186003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?naxvCsIrapwsfQbPCOfUvw4+6J7RYD9URKSijp7UOAIU2ZxS1H9h8CyDyeln?=
 =?us-ascii?Q?faUhKhdclYB0qsnKd/HWCfYwJ3rodrnYkKxq+uVk3XreMbyZF2rq47GqhUk/?=
 =?us-ascii?Q?JN/npIrcjJkf6CAREmv6Tqt86YzcoV4b2Lqytv5lw2plImET0b45t1Ov29Pz?=
 =?us-ascii?Q?76xtn3IZA36maxea8u8D5d+x2QrlfCAep84mJYQvYQ6B23VZpchw/Dgnh5Z1?=
 =?us-ascii?Q?RC6ZpRyEaacLyzIA5JfPYAyR4hviDLAHr2fF5dap8Nhbv86qEyBAJb57nJeR?=
 =?us-ascii?Q?UmjYwxOGEvdX+NRP2mpGZEGFI7Cp6lhqU2rvDvzUIMX0pRBNB5eIZkE3X5te?=
 =?us-ascii?Q?mkeLhNHkW6j7DFQQpOu3C+mBu3jAkT1FfL8ozfEFUXQ5V49oien9rOjg3IX5?=
 =?us-ascii?Q?lgrx9VMjpyapve+UhjRwgVJ8ws2N4UpFNg2n5Q55y6mOpO7YWCO2XxgUuesa?=
 =?us-ascii?Q?QcFX0T+imBzB2eYTl+KCaU73jpltiGD+L36QZvL6PPiEDQesWwR/iY5sLUHK?=
 =?us-ascii?Q?BdLBf76zYF7uuvM0tkxJLPJ65O2TyvugzZhUPoWZ0VmouTpfS6ePYTkfaUmG?=
 =?us-ascii?Q?A2XW7S/fNK5l7JF6GI/29uzpKcCz8AokuMJ4xgTfPVUc30wOG7lA1C79WtDN?=
 =?us-ascii?Q?1qM7xgsGkTP2I2ZEhFiOAg4FfPlhPaKA9jaD+7icrSQUk+vhbkm6rO4ldRhc?=
 =?us-ascii?Q?3ucn8Nl8NNGJMRDtCPRm+9FPb7vMlItwBe5Yn+MbqFW3uip8SzqAC11025Gd?=
 =?us-ascii?Q?66ak9dmF0iz+ZshQuoYVw34s9gOtnNTTNbQgmfPC24hNau7V5IT545oQBMEY?=
 =?us-ascii?Q?u7Mz4n9a0xL167RzuTK/U9E3Q6JsEpIjiR00Wn6suKHx3oPBLHvS158gX/ul?=
 =?us-ascii?Q?hzZj0+lpOXFNFTafE/EBSGs9j1KOPS4Lonp7GQoueCiogr2e3/qFlce51wJN?=
 =?us-ascii?Q?j0A/Jvvz9QIVk+cZQKmS1JkrDjRKdTqkLfh+UmW6utYA/JCvnPLnXyfqkP9A?=
 =?us-ascii?Q?6QvtYIvfmjIQb/7dAkudQyrr22tZKloox4noWllr9TA+E8jnGs8zolinXhoO?=
 =?us-ascii?Q?CcLgkCSp+N82oa+loWqqPrJd5Yh09XsI+y2HniaVyzRm4aa7ErkHOUxkydU9?=
 =?us-ascii?Q?7pnmS0KckKTSRjcfb2uKyIGwXnhdGtpaQSidRKJ3LlDsPmC1Bvbu3O5D3LPw?=
 =?us-ascii?Q?iuXm8Nbv4qy4e5Mef2IVU5pIXf5WBRG2tm5cLOp1sK+cSfdGaJJf7qgOaMMj?=
 =?us-ascii?Q?b7oRbgVkJxkopUE9ke+Zkwzeq/CZ/nwB+90aEjUn6/QnE/ks1SFEUqSWs3X/?=
 =?us-ascii?Q?AELy/ofSrRGh2Ggk+0jsmJSuvNp8owSOWK7cwCLeEM7nJmKqwbydNFY85i6O?=
 =?us-ascii?Q?utRxQGQw/kiBEXLvCY1DheeyBn9m5L03BB6vYyaB061bWY9IG3KkfCihI+0A?=
 =?us-ascii?Q?iErO4EdTtF1rVtGqXT0imYzN98ETFefAsebHyEW+q9JOSiA1dCK0obrEHM/2?=
 =?us-ascii?Q?C7AF58KYNFzWprRuWxj2Ub7khxiC1ypY6Jw4IL0YzSIXIO7E+CRWjorLdIZZ?=
 =?us-ascii?Q?/+0VqAp2eTVhtim3b3nKxlXMsugtxvXXSlAQwU+G6nFsZV7xE4CYK/DTwweh?=
 =?us-ascii?Q?WlxTQFl6pCwWbrUSS8XNQwxQyGw+3lntRyvsla0B94jKWPCaYyc9/+byJU4u?=
 =?us-ascii?Q?V4bIjDtnDWG1JGkbibu6FURXMzRfjr6tVKcKItaGYPq2yAg+R+VAw5tztcAQ?=
 =?us-ascii?Q?+cwAobom3YK0PB6M4mePvfIAu35oce8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675f9e3c-39ec-4012-5937-08da3350fe6a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:20:18.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhGsKrz+M3WYZ/JoKUYmWif8WrZtx7+Sttbpula7YaQdVgfOzpl4rL7zVHW1FrA7YVyJ0E+T1jDNQr4vO8dqlExIueADXbnzCA4J68/IvUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4880
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-11_03:2022-05-11,
 2022-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110063
X-Proofpoint-ORIG-GUID: rkLUe_7tdvJ5GIboOizGGZjH5snXxRvi
X-Proofpoint-GUID: rkLUe_7tdvJ5GIboOizGGZjH5snXxRvi
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Return an error code if f2fs_iget() fails. Currently it
 returns
 success. Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
 Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com> --- fs/f2fs/file.c
 | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nomGX-008psc-86
Subject: [f2fs-dev] [PATCH] f2fs: fix error code in
 f2fs_ioc_start_atomic_write()
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
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Return an error code if f2fs_iget() fails.  Currently it returns
success.

Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 79d1a20fbda9..cd768fadfd67 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
 	if (IS_ERR(pinode)) {
 		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		ret = PTR_ERR(pinode);
 		goto out;
 	}
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
