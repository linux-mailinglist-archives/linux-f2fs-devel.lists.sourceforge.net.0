Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AB4F7388
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:26:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncIn0-0006c4-Ah; Thu, 07 Apr 2022 03:26:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncImy-0006bt-Og; Thu, 07 Apr 2022 03:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+fTrz9scjvUlmcuDEtUdP2MIqdifGmBnbiweLe7F2I=; b=PFwNWohQP9TPWXfVbIdF5HCM+6
 XrlufMCKUXEhpM8Q/GI3oLxufC61ygUeesiDxmwnCrB1Vk42LK8xX0bBMOy2Uc78p0K4yJN8jJOuk
 JaQtS/Nkx3XbehBVJoqaZ22NJd0bimjdvsBBff2SVoTd0OtzRLkFFqd6nxKMnIU+QFTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U+fTrz9scjvUlmcuDEtUdP2MIqdifGmBnbiweLe7F2I=; b=Rpe4EsKb/tAx2ENHbDXVdCNitg
 GhAa3Hlx9JzlbH2HXg/nNGl9gjVaCD6sReCgibKQzPXkCcwAx+Z7HGusGNOp+i1mE7nCD2wSBrGMu
 gOqDRItV79F1FOEr66dOGQbpQfSGjRIwAWPGlghHrZVtzEybuktzjiPStSW9ZT0wwDDs=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncImw-0006K9-0w; Thu, 07 Apr 2022 03:26:27 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2371bB8b014737; 
 Thu, 7 Apr 2022 03:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=U+fTrz9scjvUlmcuDEtUdP2MIqdifGmBnbiweLe7F2I=;
 b=YUMdnGZuzek/W+HawPDaaLfxI+Yo6VABZTXVZ6R8VbQc924wt04u0sirTy2Iwmbk9FVl
 /OpgKryhR1e3Y84u35EcxlrfG+CRudZayKtWXhZ58oLzkQVqUhknU/gQ/BTvDtmjSP/l
 Ke+S1e7qTo6WD0F3OCHx47/sHT7F9R8sfpJ9Uy2hQ3h1SeOp7P1QTjGq79xi+8LNUyVf
 PTMBYdQrUC/zUulYntbR8hQfeiAXG7mrqrQYIpxuy9v6IPl+ojNDqwos11kNCNNxNXPb
 iccZ7AYkq/524guLzOsAePFN112wVNxb5djErynah9vV1tKNLr9L9K2gHlamHeLCIRcw sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6ec9td09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:21:10 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373FMdG015367; Thu, 7 Apr 2022 03:21:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97uwanbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZIQz/j1Fb5IU4komH8ez3bVmtttyn9V7ShNIx/1Q/J/bWD261us7A9/TPX06DwS2mkn7BChyKnN4Hg2CYGlufMZR7dxhhnE40r5IWuVYjzKyAewkdNn2ymyYJSvH5qFhi1TvBgqd7Xr4eHz081/YeiMawV6m0xnTyFsFVoFgV6QhBl7v9+je1ZBYDNIun6lqR2RLtuscIshJopGo3k+vcNOtOd7vpw39EvoPBg1QsvjUSZWkGyrtaQvM+jKMGUzIAYhSYmMFy05tGzQLJjKHK0SrRUk4C6a26R+qXROt1HjAXjv0aajnA5ls6+3pFkmcCEwc/ccDjfShNLP0SXdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+fTrz9scjvUlmcuDEtUdP2MIqdifGmBnbiweLe7F2I=;
 b=DVrCnGwvP++Elo4tefRs8S0K9xet8SIuwYTGYszrLFS0kB0QDUiJtdUnZ++NXS6N0ymlUK4gCwNLJ+8cbdCNSp4SGsnWtzmldtLJlxfrin8RMYUq1MhjOOFrKD3DRSNxcdqqUdnWPM1UcqkwJoWb3P1tXX5ioDjMep+d6DR+OlGThrFwBwlGQz8OJ2nDPmwQunsTtIIDfTudH5zBt8wb0YBdUTUS2ryrlndrPouH2Rx9dDq20Hi5kE9hg0zXYUz3Ag+GGSDh8vgE9gGkRTiSF7iYJEOa4UK9tFG8LxYZvzc85S0/4BYJTxNK0nyxebwUYXr7CWIgGdVXdhp0bOYfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+fTrz9scjvUlmcuDEtUdP2MIqdifGmBnbiweLe7F2I=;
 b=n6+ILMx/lQ/iZCxB/hOJR8YGSZRIaZea8Df09jCCjgZ8OlXeLUbalIT+V4dXlarVBJdC4RZsLkoypik2s6KdONmO38tGRXYkPsTC1TzEiO0A4DzLQxgc0lMVLjNjMI2zzGUAUcp5oSRB1jswVpBmemVd+7n8AVKTahlyd6OSe4w=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:21:05 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:21:05 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq15ynlinou.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-19-hch@lst.de>
Date: Wed, 06 Apr 2022 23:21:03 -0400
In-Reply-To: <20220406060516.409838-19-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:07 +0200")
X-ClientProxiedBy: DM6PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:5:40::39) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a4e7c4e-e224-43c0-eb44-08da1845a688
X-MS-TrafficTypeDiagnostic: SA2PR10MB4748:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4748213FE9D4050DE86175748EE69@SA2PR10MB4748.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjOT9NXGZpB3sgRJJcgUJ/BSS9uBxOPNforpn8fJk807ksHl/anICaf3eJNywVGAdFiXwLjSdw1DYG5Kz6W8IVurfBB826TDEBIuwKWEQO1yXm3j/X0bihSfBBWL3FAXy1rgQbCrj/j8BRUBc2IAiQRVDVgEgp5uIXfqlsnl8OnwVyFuX6Ce+3tIsYhMLuFGwCPMixdP5EXrMrMpBVxcgkpnoz6HWNy7sRAD76bXi+6Cfuc/1EL4HCod2AKGSwg6rorZ7Julw1sfS0RP0v+PkcruyX0eIPRv5ZX6yFxLwQFyJcFKjTGgufq7B8CRu6gtRuIW61oRS7e1w2XNGBDy6bay6KjJ0CAEy0jWVtNxNzj5YGwhcPz/NLSqO1i9AvmvPWYSOyzCCpJ4OxYoFV9sNlC0f8jbWNTFOtFiPBPNCCfDp4S5X+5LdKOAw9+OK402XXtGcyrbEdrOk1vVEP029PkhHS3dBEwk8sGA9lHUfqumq3fUhKyR8dsnA6rA6c0V5MEPTfIpR9mwxMXaUCZQuGbicHzLEQ3Bj3WLSdrBbG5in42MzL99flygFqM5ItkI0iRjcZ/B/Ydd48RM8/xO0SFYNvmQCgFku5XfQUJG658fY6LUwwh3QTvkLM9GvBnSrfn8VzdXPWQDzR/Hm1Gh0fQoJ5czdXWlVZS9wGgQnzFxmYxHtAn6xAowBwd+dXqxbzO52pCHdIYpQPgVcuqRxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(38100700002)(38350700002)(508600001)(7416002)(8936002)(5660300002)(2906002)(6862004)(66556008)(4326008)(316002)(86362001)(54906003)(36916002)(52116002)(26005)(6512007)(558084003)(66946007)(66476007)(186003)(8676002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ed8KfOdD8BWFvOLjceSlZe9U6fC/CRjmtYJvhqHgLWj1Qzi2JWDev8VVm9Dk?=
 =?us-ascii?Q?fX4TT0IjkA47nbTC07tXTBoxj92TWjmke60BtNzznvjMqlzj4H0pRESnGFcL?=
 =?us-ascii?Q?ReP/cud4XoGiGhylfNKhKoRB4LQtYFul/e6gUJWBysLbO6zg+csEizV3X7j2?=
 =?us-ascii?Q?oN0D7agXA8mJTmZAMmxOvXkSKlH28yrdPaabPn/A9jCli/xoJPTc5M83J5yL?=
 =?us-ascii?Q?mhuB3V3ss++8NtvwHmQRgz8iXR3WLcsKi/fwhrXCx7R+iJZVz1VFwlBYzLno?=
 =?us-ascii?Q?PInan0qNsvg36QXhREZUayPq3icDLQu64IsHfizxMnTw225ULdhnc6Q97J2B?=
 =?us-ascii?Q?EYwbByEAg0d1Qi79SEj3197IQ2tKdU0lUpFlcba/HBog9knHqqB07/cC97kG?=
 =?us-ascii?Q?dHhfNW6Ms6oyqxkWr7TfJQenmjw+Odu363ITfRXkoWiRYprtPuZg8wYAzT3q?=
 =?us-ascii?Q?HTGFQ58gjjJ1ivuGAy9jTqLkXBUzpcQAbmElQubR0D6w2b7kZ0ipHshvaVP1?=
 =?us-ascii?Q?ctT7airiTwDLFFvUy62g0ZL1n7hYzrpkuYDy6OfwIgB0HGXaKSgYuINLofY5?=
 =?us-ascii?Q?7S2CGX2SpLCKBgyRk9WgwX3r2Yek+oSjJW4wOzebtRbMV1I+pn3UmMxqH+qr?=
 =?us-ascii?Q?iyLQMiGUdTqQ+Rd5rUVB/8hgj4c6XViDbVrQVEgZbWEevHTQDtP1Qeoiy//F?=
 =?us-ascii?Q?F/UWf3TxqwkBReCMiGZAbwHpFUbUTGaqsOAc4OZX0bQ9wIifakpeVVhTT7LF?=
 =?us-ascii?Q?ZvkuPlVlYf/NCgqtlRLkufmvvSMkGWGm12JIg53lxJAOFdbnJ/8uhw4zbkac?=
 =?us-ascii?Q?IbfOAZhlWgiOgetIcC0Jz8uFX5eR0s5PpFze/u7+HIpw+PMI3JrdYz1NJXLJ?=
 =?us-ascii?Q?GG1Ydpf8waNPelCyu0bMpPn4KZIMuSfsapXcqs7iqu6pSAewuX41dFhHwmas?=
 =?us-ascii?Q?1qQ+2PYBc8N1tzw4lIxpIyANFL7TaSOgeYdEF7PrYGXHtMm0CawpZx1XZ1iy?=
 =?us-ascii?Q?/bBX4QgtT9+95VDqUTVF6tmjSyOH/CoELITwNKqCsqnIQZvVnGqm4/SjXfCN?=
 =?us-ascii?Q?PEEGMSnK8zFC9gdobEWDNhr7xKuVgxNSQ5HIJu+76gIuWJmZCM+T7jshrjJr?=
 =?us-ascii?Q?ZTsUsUrxNWnbWIKsmAelPeT9s6IKhO1dl4gEyJ5fGARnTT/qXpUlDFdMfv8E?=
 =?us-ascii?Q?fyQ+d5VfTTO3hlTM0fmibyZ/L6JWK3ggzJWI+xyHDlwE2TGt31vwKH0DLvtw?=
 =?us-ascii?Q?9/tqablQh1kZcndJni4723IEzlLjlPi7o8l/onyEwVxfAxzqjXj0+jr6WpbH?=
 =?us-ascii?Q?UHIth0EHdnXF6ueUg/1hQPkZq3Ldrla7fNQN05q1o/LkSoWpAc9N6o5xcASa?=
 =?us-ascii?Q?hTad7oYreU4T/WCuQIliJMeVcdESB3ai0n0SmUaAxGJPNok3MyqpqJGMDnTh?=
 =?us-ascii?Q?zKozK9ZeWq11HstdRq3OXexs+utwnwRBMb0V6U6DWaZR6mwek1QbrOR1you3?=
 =?us-ascii?Q?oRzKFW7hCCPHAO9KoWPU99SnlC0QRwmXDFZn2LfwO1W+IyQp2yf7jJHy4cC+?=
 =?us-ascii?Q?bnKE6ST8ltzVlbhHG6qjzMyRwCtLyrBqBYwskMFBos44TunRCxGJC1xaEVzy?=
 =?us-ascii?Q?reUZI3VZbBZD6WSgZT8nLvh6FCg0lJGvMLC7SHuHGvTez2xLxtaOtjfl4mlm?=
 =?us-ascii?Q?kmB7kkZSAQlIm6N+Oes/xh1eXWWDzhTUhcg0KiT38d53sryoHA8zvWpgSxco?=
 =?us-ascii?Q?Azb9HyFJxo9vqWlUYpWy4CXVjw40yxE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4e7c4e-e224-43c0-eb44-08da1845a688
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:21:05.3709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/WlI7i40n4VOjlex5MfakSjplwXRvhr2/q9rsNGMZXOqMWjhXVBrAKp8zt1ZMqkDxKK+4gPVb28EAbtiZ++8LZxftn48EIY41evxMiUqNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070017
X-Proofpoint-GUID: 5fk5of0wXRiyNRb822P8bYa2EqANeN03
X-Proofpoint-ORIG-GUID: 5fk5of0wXRiyNRb822P8bYa2EqANeN03
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > No need to inline these fairly larger helpers.
 Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com> 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncImw-0006K9-0w
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 18/27] block: move
 bdev_alignment_offset and queue_limit_alignment_offset out of line
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

> No need to inline these fairly larger helpers.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
