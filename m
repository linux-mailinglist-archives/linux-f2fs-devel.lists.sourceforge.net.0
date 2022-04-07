Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C84F742C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:42:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncJ2K-0007MT-Rg; Thu, 07 Apr 2022 03:42:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncJ2J-0007MI-Lr; Thu, 07 Apr 2022 03:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0fSH05fVrj4EsKu7GruSr6V8eDQcmEnuW15iSPtYu3U=; b=GeWLk5bmGYKBmH+eV77sncanBb
 7IPgsJzaw5oNbU6Y9RD0mrT7ZbfiLTQWCwAOIS6rxsbabVZinj1GxT4yDu/2rSqKCJNAYwuy+jWVg
 TMpv8FqKYHh/xbFI8iqfvpj1HrvFzPEeOEcwtqTelH+at/IWJkRhIlAePi5hSpzGJqBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0fSH05fVrj4EsKu7GruSr6V8eDQcmEnuW15iSPtYu3U=; b=DoiZkcdY2ZwXnE7LL5O3Mkcm4g
 ePQzI5YBmeoAEUnbKtexux7j3E8egpcHuVhRI524mSoC8N64TMYKf2DDH8Mddv1VxA3mdDzkfwY4u
 pfnBOi49/DLGP5QxfbS0itJH7fCkNRpZK7KrPmuz2Q2ZJ7xQBFWyEOoGd975vNPsTyYE=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncJ2H-0008Ia-1v; Thu, 07 Apr 2022 03:42:17 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236Lmv86000758; 
 Thu, 7 Apr 2022 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0fSH05fVrj4EsKu7GruSr6V8eDQcmEnuW15iSPtYu3U=;
 b=iag3pmaogwT0fVNNtSBn/JoHcAOg5JTOiwAr7G+XUgGvcNjxegCBNThSYqe+F4T0NNMS
 B/59HaBNX03xPzKp11moq8ZsFxeak9RIA3RrLouwkC4YK+71tDVE0sdTjSK6BxxCftbo
 0EZ+onJIUBjU/ENdCS5sy3svT9bx0UEJmXm8G3Vy6SHK2y8Xy6l3WbHoInOxD2xK3+eI
 6prGeQ9aYuOEK5xF9lkj3vVuts9fdh0ePfPpNw+bzbLVZ7ePbcRp8+ED14FvB3NB4vug
 6MW3QIbWBa8G316LrQWtBIEFgUnKlZc368HFrB7khC0iArMf4byEey+uTWpLJY8E6DL7 IA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3stjs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:36:57 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373aWrY036365; Thu, 7 Apr 2022 03:36:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f9803hf4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:36:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBtux/rJhtrl5yFsMQjtRJdNwFQDZ9e04K1j7qVY0mAmG6dIu7xDxjOrjBgp+kFuKMueCgrSMqOXko+XEZyej82ypi5BX6JAzWkqNsGhUOaj9PoAInFp9H4bruc2aiGt0CpE3Oue7uzYHCHlFhY6fVqtxqRotkx5lbzGr+6d27jpkn9KVr+sww7X6KU3E78q4Zy5BVnQgPfDp+CNOWIqTN9BpVqzHDmMW5bonjigwV/kHLDJthWtpi54PVY2SZSFbWTXEgGbPtwV4PNWRmZ1i1EYm+cP89DdG7R2Kg5tQR1oYE8DTKOr8BIpQ4stnk3+Ku4OfQA0CTF1UpS9t3yQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fSH05fVrj4EsKu7GruSr6V8eDQcmEnuW15iSPtYu3U=;
 b=odYnQWdRRJ4FXJrzHv2+etqgNvxmSn2vvpwdNqfb5DEFoolf4R4cEZiboooNhkOdz02fjvfzGeFU7WGIKhYip/D1zaygAcFdVFpG1UGZbKuLWYf8zYKkFZgprk9Qnv0MrM3oSQ6x29lGO59/H2p0zdh2xcBWmLowqjeG53Vxoj6ei1BJCaF84DHi6/jNnw2LpC8Y1hWzXH6Cpuoyu4EQhhOJmke/h01RkdXQ5cKLYlvUIchQcC5wSWttmpGfg/NOaL99WAPP9WKqRwjUBcVfR6O/V1Et/yQknL/BQ8lm+kWpbBkbwma4xwMnQyw9dzYiYwoQIuGa+qHEbJtauHpjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fSH05fVrj4EsKu7GruSr6V8eDQcmEnuW15iSPtYu3U=;
 b=lD2AOIVmspgZK/pwyBQri5RZA765JIpiAnX41gCyPVtP+Y0SeaHhVXkNeMjdO0jW+v8zL255prslBhs6U+n+XeYmqaxrxa75WKicpSdy1fVEeZ7x8Qf8na7UC0cNAtS20puZeuMXz7/6AAnLUVOLh00DYpJUCv3AWFnY07aff5g=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CY4PR1001MB2200.namprd10.prod.outlook.com (2603:10b6:910:3f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 03:36:54 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:36:54 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1r169fttr.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-27-hch@lst.de>
Date: Wed, 06 Apr 2022 23:36:52 -0400
In-Reply-To: <20220406060516.409838-27-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:15 +0200")
X-ClientProxiedBy: CH2PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:610:58::35) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75691adb-1eb9-469a-d0c0-08da1847dc61
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2200:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB220040178D0947BB8E0291BA8EE69@CY4PR1001MB2200.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxwI0u0en9TbpPBjX+jKQqZmtEjdTU+hpQXjR0MzzgXrLrJ065c+0SD/3sGksMlfGH/BB2BD7TmYRbIwz1E2JgaPlpy/OS74QnhtwcOrRBvy8UBGECnQRnU8lCQ175MRgpma4j/Vop6oaQGlIk8AU2Q9DcipoSNEy5NbVfSKmQG6Be/CKtH8M8hPgFY8MD2skrgtTuu/qSpHcuM3x+NVIzIhwe+1wmhZuwqfVWY1Y89pvX6NSPNe6ailXnUeNs5dwWEGWjyKwY1aHy0mflMVqfGe/dZSSMUON9lk6WXh32PaXbATnzVymeODLke9XQ7v6aiMzOvTNIUiYzu9Fdq6xL1rUzwmnDzGDpI56rFwJBKxvwSYIWRTp/oOcqSCFtXIPVmEWHWsNj3Rm2t1cium8u/AubDLbk38TzvsTW5LdTC9aUjfLW8vA0bj1OU8jNICNqopoV1Qm99CJW8WMOFYAKzbw0U3TfNDU4wU8Gem6Huq7Ql3SR5sVvEWkyXQp+ysiyQKlEP0mmidBgWBgt02lxRtOpH9nBgBsQclSHetDc7nWBlwsiG6Zzj5ZDXRBw/W8ajrBDzFxCOIaRd6CfbhOO+fMLikDEHFGEmHS//VkhovtgJkPbJKtH/8df2Q7/OVLXPH8kNlpyhs++T1nL95ewdcC+tuWEQbgMOBzlbJ37TIjdyetJ/Cgv4PtXrAMopz/WRYSdvX/1UuU+jv2RpzGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(7416002)(26005)(52116002)(186003)(2906002)(8936002)(5660300002)(6862004)(4326008)(38350700002)(66476007)(6486002)(38100700002)(36916002)(66946007)(83380400001)(66556008)(6512007)(508600001)(316002)(54906003)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g82OZEWV3QyBoHz83z1vwz2sBBr7It7JAYL4pSpihGQXQVsMQI4Ppcfg6J4u?=
 =?us-ascii?Q?PU50KIresDLXg+OH6CjUolrM2T6sKjMXWLOBpEuO46hh6PVTbrhpVU1+JjlU?=
 =?us-ascii?Q?mMAENapGGv/v/7ycuAUX/W235hHMNzvQ28L931QOmUOYyDQilhcvklPMETU2?=
 =?us-ascii?Q?pgAaX6+ZIZe6zfuKqD0235OLnPBNMavw7xq8qVz1ER4C1K7YgEjgmbmpJx5k?=
 =?us-ascii?Q?3SYZGv56O0KMd3mrspayjqV2t+/s7EyFYryrF/fWsWOR+fYpuy4k42flI4qa?=
 =?us-ascii?Q?+Jj//A6FqJkVvhFBz1CokQe7NpOr8+P5svmNoAC9H1asUzJ//wzK3Cb2QThH?=
 =?us-ascii?Q?wGH96Vv9SpG8KzErtx0luYvL6aLZviM+Qv+rUvQYuzYg7EipDuWHC6T+KJfc?=
 =?us-ascii?Q?x6ell8xS3Kez/vWwpRHgFLoxidiEkZOzceKeBos1psf+8J1ybirGML0xB+RF?=
 =?us-ascii?Q?yJo9Gr23XWxqDZiwP72uIuiJDswH1Ka0fmQMibUXdHrDLCB/+wQhTYV7wfFF?=
 =?us-ascii?Q?RysQUrk3OWUKJC08cSiPZWVS/LoMxzh8Zv6lV3t1JBXJpIfa7nH7uz7jZHVf?=
 =?us-ascii?Q?BNMiaHkgUTR7mfVOAjWa4+01QacTB4FubvclHAPnyMm/MetdPuVJEQKX6W+p?=
 =?us-ascii?Q?lvTyo+/wbNniMJrJNISMItIq6Gv9VDW8kNKliftLs7Wb8gSdgAIGYSk0k9DR?=
 =?us-ascii?Q?O3MAe5iLlMlNW4wVRoKF4wgKQGIdgT4Td+vUWRlW292GBQo9RdtGTn+CMluu?=
 =?us-ascii?Q?XeyFRr0boZf3h5/63NI+aMBToiAMAhIyK9lGbrVCdh5tIZXW5tXQi24PiVNb?=
 =?us-ascii?Q?C1z2z+KEHPYZ5NfTImPYmsNF7sG794hTNnRo0z82+gkF81tNCp6eReUombyS?=
 =?us-ascii?Q?CKfvPa+L3z944Cx7CLsm+FkNEmlM/mokqmy+meiuNMIbOgEVOGEnb1O5ybOI?=
 =?us-ascii?Q?6rVxntAu+AA/gNacun3DPGUuwwbd9+pdBjoC8hr86lHaljzim+loGq+V6RCo?=
 =?us-ascii?Q?nlJvZpMk9naBhExYED7lBpJjT6CO7pUEz+fIxvaGKLiIe0T+AnNxta2JtD2f?=
 =?us-ascii?Q?ycutLjj+XVcdbDaWt5HLsMnCStH7jrv9wZxHfHjMxdHxU47CkmyydLC6wqn9?=
 =?us-ascii?Q?70Fj3sK43LNgjbB9qL7BFyqmMT7soDMzg/voargbfqRVIEErbM/isHtWTmyQ?=
 =?us-ascii?Q?IDCwvunTzHjXRqo3uDkVL2PNQjrMrfNfl4s36onpZ/M5UMAv9Wp+rU8/V/IJ?=
 =?us-ascii?Q?ZvEmN2wi2clCy+5ZhmPjG4DAZ5Ea2Xs2X1s9FKpLHUrIPOKELkyfsCXH7Xlw?=
 =?us-ascii?Q?2wTJ+y3s3gOXJw3nHkOH6x5WfKGk9BGnXKWAAOJzfowQPDK1nykLCqLMqAHZ?=
 =?us-ascii?Q?iVbJIXtTEx5czdjx6+VowJ3GiRfdzL++TM+xbIMsEwev3+FxNDza98tZa63t?=
 =?us-ascii?Q?fMsevOztJxpUydWpvzh7VVW3mAwJroktBg1Wnd+o7LnG/vmoNT2AMttO2Nuk?=
 =?us-ascii?Q?5USTcGTEonuwQFPubXBavRrNfqpa9MkYOR3kuU3gHbvqvfa4N5ToV+BqQb1Q?=
 =?us-ascii?Q?K7a90zxFWiWPAwTqZ8ODDAMj4BPZOS6iffa+ULDPfA9MGhBFhha0QkG/UYeJ?=
 =?us-ascii?Q?XSgAC08xWhGOlnpbglcYSiRxhPgyeyJOFwfiOlbdTkI/Iql0Q82Gf73x9dX/?=
 =?us-ascii?Q?699odWRzsDBBcTy9wW/nJ3yeNUyCCNXq1qZCig32aJOvyHJZcokuyqzOn9cZ?=
 =?us-ascii?Q?hoyJIeCr1vf7iUvpVbxUwHDen9QGcfo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75691adb-1eb9-469a-d0c0-08da1847dc61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:36:54.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxI5XHXU2sbc/fWC9ndbwbsQZvdnJajAa1/8lQ+60/0I67zBHPfFXIKkzPg1a7pl8jTUriXu7jFYTH2C+zxBhKKaELIPNtXE5AOXygQB+ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2200
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070018
X-Proofpoint-ORIG-GUID: PQKfP4CskAkKSo2NFyL3CJikBxo0t_l1
X-Proofpoint-GUID: PQKfP4CskAkKSo2NFyL3CJikBxo0t_l1
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > Secure erase is a very different operation from
 discard in that it is > a data integrity operation vs hint. Fully split the
 limits and helper > infrastructure to make the separation more clear. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncJ2H-0008Ia-1v
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 26/27] block: uncouple
	REQ_OP_SECURE_ERASE	from REQ_OP_DISCARD
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Christoph,

> Secure erase is a very different operation from discard in that it is
> a data integrity operation vs hint.  Fully split the limits and helper
> infrastructure to make the separation more clear.

Great!

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
