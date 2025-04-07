Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12943A7D6B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 09:51:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1hFs-0006K9-4M;
	Mon, 07 Apr 2025 07:50:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=6192f57107=donghua.liu@windriver.com>)
 id 1u1hFr-0006K1-8G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 07:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G7WoYLxQ3hJokl/a2E3YmpSMfBhX8S1Zw00WS0wEtZQ=; b=mNhP5rWXF9HGctzT8PiB/nNHvW
 EDMHA7Yp0zxOfDyQq8dLfm1dy7vQrH52H0kVHUhhGB0ZLG0ylyOEvgMIiBefGmTe8ttVr+to/0Ixi
 Q7zH4PG2kN9A7XosvDNeyy0EVFGdspH6CYVC0LaHzvMcjuu8FGloIALE5BvJOup+2610=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G7WoYLxQ3hJokl/a2E3YmpSMfBhX8S1Zw00WS0wEtZQ=; b=b
 /UBZsMpCmYaNEFi+9Rs+D2FU7w3M/sQezPLrGWvyRQT5y6MAYSJMkFU6Gxla7tGMpYqV2H8DOFldC
 lqnAxcgTY4Y2FoXnm8sKIoIAcfY6PpbUv4wLSIq51fdH4fg4QigYXDN4gz2YaZIi64gthp/XaPzeZ
 HAbhgx0igLrystWI=;
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1hFb-0008WG-AO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 07:50:51 +0000
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376kS9q018612;
 Mon, 7 Apr 2025 07:26:31 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8hy51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Apr 2025 07:26:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdtRY8bQMmLsIwBDYs5AgiX9JCnxkLbsNXrbtmaTsQK38kBozwZg+Nu7+bAK+HFMTUWLzGdk+XAQfOPPtC4+Y3mk2keAhbpZAK2iFS7ZxymC/pJ9d9EM6TpFcnWuyK4txmeqIY9xdzZujoeGcBuN/3c2HuN6iGAy4Sfs26hGmCm7vzL14zTXlitnVW46TYopqrUJ8W41HrWcYvXGBZO3fX2yuigbeoYsVWz1fEDCa0viayM0gZu844gjTs6m+mZ6LpnG1q6B1xmUKlzLZiZ7lOP9ntqSk6+RmbHy/zxtRvp8v6gwqLN2tEaCz37XkWLpf5bmXIFHipyqUgIdvYEVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7WoYLxQ3hJokl/a2E3YmpSMfBhX8S1Zw00WS0wEtZQ=;
 b=Qp1UE8IiNyx1FMqGYCSpjrh4up2sF5LRRXnt1gDrWfxEQWpsQAkxT/T+LpVyx8Nd0MAP/eH0KEDqq2K9m/Q86X+RuaMev5VgvRUOL8ujIGAt5C9MeI9QkEXYuT/JpOQNL19YLwu/KO24KS/8ZtznGINVJ2nVddHmaHRtaT/dAd6VKLpleLKGF8qTPcmr0emvALWXtLRZMfoEV93WC1TStPD6jU2+jlgo5YeV2elZyxaA9R1R19oSK7aDpT4pt9yUPGoI7ocWaepaez+0f0eOTgQ7VYvsYVsTk7upqg9rFjpxagqXAbnyus6TCav13BH5M+kpspcLleqr2IuiXEkv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by PH0PR11MB7634.namprd11.prod.outlook.com (2603:10b6:510:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 07:26:27 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 07:26:26 +0000
To: stable@vger.kernel.org
Date: Mon,  7 Apr 2025 15:26:12 +0800
Message-Id: <20250407072612.2961421-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_|PH0PR11MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc2f2d0-8ef9-4353-c1cf-08dd75a581dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w8Aq44qsBUByOJRrlq9nMOId22QRaAp3K/OAHOiPNjS8DK8yfkbUNb4C+cy8?=
 =?us-ascii?Q?clbjaHrfXvEMqKncUVpRQBY+JlmvdtxqOdyWr9iXiHw7dTk4JqodW2YGeZ1r?=
 =?us-ascii?Q?q9Wo23yKdFZtUne5Nw02l1ieDOmS54cR3x8h/BohGCBXQ0iH+LI2z41iQToW?=
 =?us-ascii?Q?bwsXIkr9UaTQOGFlBKGFDnIArwXbT3s71++qICk9aVV6+FnrosMywQKivpn2?=
 =?us-ascii?Q?Qld4O9nwlgjY5EBHi3VmjKAURqwaCVTP+jU5zHRTP8WAXn54idRov9jhTdVT?=
 =?us-ascii?Q?nDL16PkeKYriqN+za41La/DT/BayCvxjVycUT6MRs7UPT3NAyGYdOL3yOsZO?=
 =?us-ascii?Q?R+4Zy8OEz1pdLqzqLpgQJdzYfStZ3o1MXGfffDM8cBG7zBz6DS+eFF9QCEEW?=
 =?us-ascii?Q?fz+bRL0RWz+NDdWENeulWdqUZNYkdUq2LKV6+52oO7EF8+xABT8iNe0Fya2Z?=
 =?us-ascii?Q?MPuf6eow9g0ZDlNeULmyDP/7bH8Z5dDBFvBictUIQuX0B1Of/hw+J4ZURk20?=
 =?us-ascii?Q?NyDZqgXwjqQ2RGLXrGPKucgwimKPiK1vjh9OLcHbVz3T+hoZTupNBmTT3YUH?=
 =?us-ascii?Q?aAVGWiWgmQWzaDAeTD3mXSsreyaIApt/OWVn/e0hgXBuWkcfd6muSBjMW+Mh?=
 =?us-ascii?Q?C5NNqpt7holMq9riEel4LojIBDwop68hZUN9zxVVRW1Hxq+ApgpV4XVhTdx3?=
 =?us-ascii?Q?R+yUcH/djzF0J8azePdm+LV722lO02Cp7PYRdJuO2dlq4YKjiTVD16YSKVoo?=
 =?us-ascii?Q?rbzinYhpchcrWyJA1PqHZORdy7F0ndw93fbNTtzR4rDMWFp3D2cPObaQMDrz?=
 =?us-ascii?Q?do5/gCgE2drvSklaCUJdRddBgCIDFy2Quef0+qRPy4W66N+kGTSOS7bg7kpW?=
 =?us-ascii?Q?EcK76ommzNTchSyQGxpbMglso2e1HiGUQuY9UAbIi3guSZFgE41k+VxSV5gg?=
 =?us-ascii?Q?9eKYTY18za/u36mR4eA/HuD4lPAlqfOiMUtZusrPauXC5DR5vdiAJ0lVS6NG?=
 =?us-ascii?Q?YyaeF4JpJpzhwvS4DlDJ1Z4AbDNGQNZW4wMw00xWlokESSSgQ645PopeleyU?=
 =?us-ascii?Q?hPwnWuzDh68vGMc0j4+vMG08/sCMJMx3raOscKY/FFhqEYgwV73lOoQfGsqB?=
 =?us-ascii?Q?QgfuyQ6mY6zRAv0/3Fqa7sAvNKrU57ccHIV5yvEnxXo1AaU9pvBq8hjt/cFY?=
 =?us-ascii?Q?/UMr2B0ANWpUPDCWUTxUIOLkb2D+dBXAuTZRKdt4bWHqO66URleC9I2JyQIi?=
 =?us-ascii?Q?s4qmd36eKnCLlSzQfLDfUC+S4qnMZLsmX8PRb6Zm3CCy9auoztiXCsyDYtJX?=
 =?us-ascii?Q?4GKKhIHLHBfZnUbKVaFRfL5X8o4g2s9on20n7Q5XEDXoVKGrlKPy8ktqoWyD?=
 =?us-ascii?Q?ykaYEItnCHq8yswqcTEqoxnlPlEKqGqPDt3VfAH8KQVE0+AtBM9SQ1LyX59g?=
 =?us-ascii?Q?lnQCnCm3RJwlFpq/kRnQ5fSVD4UtDaED?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7012.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SBPj1C2XeMNNNb1POwvI/PVB4sZpQnoDdK4OuBryXNuZ9XwvF/9CLXnic3Q6?=
 =?us-ascii?Q?IKBBg+oGnngMzjdKJK4z/9nOhUNRyg1CiHARRmq7VyXn2oXhIt9vi7Yy4UGj?=
 =?us-ascii?Q?WExaaEauGFqoqkR1Tsg+2KCoPIHpufh0OiSNE5YE7m/2JtNJ8cOHJeTcsRXI?=
 =?us-ascii?Q?gPAxEC3g8qKiV6LGCx2hHxKI8voXOOnjCIU8bGm/bcqu4mu6+rvMsFJN6p09?=
 =?us-ascii?Q?AWlvDvKvdVmUcvGiU8m2ry4AU63BXglYf2vyXzxuG8ir26kEt3sB4V1J4vy2?=
 =?us-ascii?Q?cvq/avWZ75SiBiRjZs5rZtVzjo0cQRxTOj28lCcvp9oHa6Ri1OsliqUrdy2e?=
 =?us-ascii?Q?IXfFE3IdElf+8jzWuY8KLuQUeDuJAlWoxTy9zfSD1jAa0qsGr8cKscMYH8nm?=
 =?us-ascii?Q?Vn2N0UdaSp0zvMcNIAvDPgSw0KM4E+KC8xRPm8vNqSNr+d3APTjrLuQzASd3?=
 =?us-ascii?Q?JlQBwZGkaQe79acZFPTq9zn3nqDtoG5Btd+70P6qifc8ukuzW0bXDFlWtFOd?=
 =?us-ascii?Q?8iU7Q5koIrN1MR9BJ1vu24PS37IIG31dW6ASNErM4KIZdWrizWXmcWa51v+3?=
 =?us-ascii?Q?6f1qwjZ1+V0cGnYpX1nwi01LbX0O56/wv/2ojhkVQjuOID1L4lzYHO4l+UvI?=
 =?us-ascii?Q?2UNCzAYZ2RxQUkVKAcy32++V6WB1RfeBHTz1+OLjBXryWB1u7OCsb2WyG22e?=
 =?us-ascii?Q?KqVn8PYqjLGx3gAm1a1Y4F4VqMZ9BVfxE/GlZ6gXoHqfIFu1E7iuSqTfNhoJ?=
 =?us-ascii?Q?ORrArp1MSazffQWAmsgOEV+VPqhiF95RwR1334wxZ+BPlTGT7Q6/sFWbOaJT?=
 =?us-ascii?Q?Ej5R4uJTYOdK4Z029F9O5km0d7FzrcKPkDB3/gTxBOANvVwvLCjsDQ24nuC7?=
 =?us-ascii?Q?BRMvCoITuLoOKSdh6rB1RnYTZ4CxgdOA/hWI0ZnivT6PiklQ46Rok/0XKK/w?=
 =?us-ascii?Q?ODjcGxtn0SLi1vIRhpLjql6Mt7auxDrCZSVfTabbl9PNqjQinjmRJUlS/3SU?=
 =?us-ascii?Q?CUFmQIKfGdHpusXNLXWHbLkoPDrWNx9BlhdBC5HK7a465hkyi2arKvctNGzl?=
 =?us-ascii?Q?6RNwd/bv1a2fDWQjG8C1mo9WbqVeMv5Eg6zoSCg046OSs46VdxUTs/388nO7?=
 =?us-ascii?Q?n6TarrbRgrasjwK2b3IvUqEDq4URFCuwcdi+fKq4QuITjNI2Y+CEJuK2puQT?=
 =?us-ascii?Q?hj5k9o5XMdQq+3hHmTM3Yme/B/mc2/yJiGJEVQ0pBxfqUTHhYXbWf1eFdRiI?=
 =?us-ascii?Q?yD1r9rhQBWFfOcQ2Q6u0ifwp2iVDeMcdyjLL/Sm+1/iuwiAcO13L1ncAlDoI?=
 =?us-ascii?Q?3DOjFSFFO8Z29pw8XzV/eH9UweplARc2hVQILWuajAZEb2z+bAkYx3SgVNy4?=
 =?us-ascii?Q?O/gFNVZBF7gfK8TbI79PikO/Q/RhJxu8iI5LWSRiJ+gBfnp8VI2ivKpJzfBH?=
 =?us-ascii?Q?PUrEkbaS7NOO5FNSH+2D3nD+4IqC/0916Ym1licjAsj7E8t6JC9OGPGbgSrs?=
 =?us-ascii?Q?N2f+5EMluMME0AC++Cw1w98j70LjHHgmJjvGE2sUuTDYbRKUNE63hZfaZvIb?=
 =?us-ascii?Q?R3oxQCxW9oMx/ZOM6CG4xvb/t6L2P3YVcjmXvZ/ghPRNhcyAQJN0l9Gr1Wct?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc2f2d0-8ef9-4353-c1cf-08dd75a581dc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 07:26:26.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1458Lj+cU0CMDFoeJo+YFyrDx63bdsDtccAUDnVspjWbzJWIXD/Ljut7WFsiq7OJ8sHYVkONK4FvIJ0wqofaTij89xhX9mT3E/d+5wRYts8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
X-Proofpoint-GUID: TEf5uMv-BhURHUKcEIJzCjVTPJkdJ-km
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f37e26 cx=c_pps
 a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=PsyGYZmSnXO8BiRk3wkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TEf5uMv-BhURHUKcEIJzCjVTPJkdJ-km
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070052
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 4ed886b187f47447ad559619c48c086f432d2b77
 ] - It missed to check validation of fault attrs in parse_options(), let's
 fix to add check condition in f2fs_build_fault_attr(). - Use
 f2fs_build_fault_attr() in __sbi_store() to clean up code. 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.178.238 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.178.238 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.178.238 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u1hFb-0008WG-AO
Subject: [f2fs-dev] [PATCH 5.15.y] f2fs: check validation of fault attrs in
 f2fs_build_fault_attr()
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
From: Cliff Liu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Cliff Liu <donghua.liu@windriver.com>
Cc: donghua.liu@windriver.com, Zhe.He@windriver.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 4ed886b187f47447ad559619c48c086f432d2b77 ]

- It missed to check validation of fault attrs in parse_options(),
let's fix to add check condition in f2fs_build_fault_attr().
- Use f2fs_build_fault_attr() in __sbi_store() to clean up code.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Cliff Liu <donghua.liu@windriver.com>
Signed-off-by: He Zhe <Zhe.He@windriver.com>
---
Verified the build test after enabled CONFIG_F2FS_FAULT_INJECTION.
---
 fs/f2fs/f2fs.h  | 12 ++++++++----
 fs/f2fs/super.c | 27 ++++++++++++++++++++-------
 fs/f2fs/sysfs.c | 14 ++++++++++----
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 135927974e28..e67be3783740 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -64,7 +64,7 @@ enum {
 
 struct f2fs_fault_info {
 	atomic_t inject_ops;
-	unsigned int inject_rate;
+	int inject_rate;
 	unsigned int inject_type;
 };
 
@@ -4373,10 +4373,14 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 }
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-extern void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-							unsigned int type);
+extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type);
 #else
-#define f2fs_build_fault_attr(sbi, rate, type)		do { } while (0)
+static int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type)
+{
+	return 0;
+}
 #endif
 
 static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f8aaff9b1784..0cf564ded140 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -61,21 +61,31 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 };
 
-void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-							unsigned int type)
+int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
+							unsigned long type)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
 
 	if (rate) {
+		if (rate > INT_MAX)
+			return -EINVAL;
 		atomic_set(&ffi->inject_ops, 0);
-		ffi->inject_rate = rate;
+		ffi->inject_rate = (int)rate;
 	}
 
-	if (type)
-		ffi->inject_type = type;
+	if (type) {
+		if (type >= BIT(FAULT_MAX))
+			return -EINVAL;
+		ffi->inject_type = (unsigned int)type;
+	}
 
 	if (!rate && !type)
 		memset(ffi, 0, sizeof(struct f2fs_fault_info));
+	else
+		f2fs_info(sbi,
+			"build fault injection attr: rate: %lu, type: 0x%lx",
+								rate, type);
+	return 0;
 }
 #endif
 
@@ -901,14 +911,17 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_fault_injection:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			f2fs_build_fault_attr(sbi, arg, F2FS_ALL_FAULT_TYPE);
+			if (f2fs_build_fault_attr(sbi, arg,
+					F2FS_ALL_FAULT_TYPE))
+				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
 
 		case Opt_fault_type:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			f2fs_build_fault_attr(sbi, 0, arg);
+			if (f2fs_build_fault_attr(sbi, 0, arg))
+				return -EINVAL;
 			set_opt(sbi, FAULT_INJECTION);
 			break;
 #else
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 63af1573ebca..30ff2c087726 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -407,10 +407,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (ret < 0)
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
-		return -EINVAL;
-	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
-		return -EINVAL;
+	if (a->struct_type == FAULT_INFO_TYPE) {
+		if (f2fs_build_fault_attr(sbi, 0, t))
+			return -EINVAL;
+		return count;
+	}
+	if (a->struct_type == FAULT_INFO_RATE) {
+		if (f2fs_build_fault_attr(sbi, t, 0))
+			return -EINVAL;
+		return count;
+	}
 #endif
 	if (a->struct_type == RESERVED_BLOCKS) {
 		spin_lock(&sbi->stat_lock);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
