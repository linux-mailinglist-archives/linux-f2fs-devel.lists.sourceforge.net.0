Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F54F73E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:32:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncItA-00074p-2F; Thu, 07 Apr 2022 03:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncIt9-00074f-4w; Thu, 07 Apr 2022 03:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtM6WQf1X5CFX+vgnRgQOYigjQ6xnz/J1uu/PU11Tp8=; b=NEwbWKsCW59m38v2RZ7XIrtYA1
 OBm7bFlOejLT42pMbNmEgCm1VgHPyb+u2M6m7GF361y1K9pIrhvwpwGgaEGtBcTr/2kCpWSu2f4d3
 SWMZCzDfUsVhZbmdDciHu2defMbHvIQW3+6k1c+EX2Y7nXHcPtJGFnZInQFZXekCXsJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rtM6WQf1X5CFX+vgnRgQOYigjQ6xnz/J1uu/PU11Tp8=; b=PHhEMtYiEyq7LV8tmQMq38aoRj
 GVwWvwWjpIbGbh0ci5MkHW+skqhnmZdOfXH+nwqnYbx86Czv+27bL9XqJHWlxEm7OPmih5edSSPlH
 TJaadJMNHqX6y8TPIJXJIbLwtdirwHXYn3ZBcNn5KWy1AX2RBB1LNQzvXH5RCcIcHOOI=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncIt6-0007Im-Tq; Thu, 07 Apr 2022 03:32:49 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236LpIIu004895; 
 Thu, 7 Apr 2022 03:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=rtM6WQf1X5CFX+vgnRgQOYigjQ6xnz/J1uu/PU11Tp8=;
 b=eHUph2bNrH8sJCZpXfwCiY5eudCWKAsSl43XDtCTsBQtI2OHAoWMdLFE/AB4RtpkLDOx
 54w0wxzP5iqXInt1LLMcTIZyUIRzDmq3kH3PPHOEpDi/nB0hBWtwGPTKA9ssEaWYXe35
 wSXAjvgDZLbUzrtsepfTSwWU9aC/LFEXXgeLPpWTK3JGCgj/VYojCHhdB1+/qlHzr0mG
 iCQVphtYo1YXLxBdcTSD1OIOXSqRNVlN1kE89zsLQ6Ou9zfAAehK5Xtp1i0AFX6zMvH8
 w/71ngjIhEZLLFAUWtUf3b3GqbJ8u7Ewgenmek4KqglQ+jox2tcGAMvY2GvSbom0VN/f Dg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d932n34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:32:34 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373GgZ3035307; Thu, 7 Apr 2022 03:32:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97y72sg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhX2n8/By0P+ArzIbZswHV5WvUVgWn2QzdVvtMwDQNDIB12rmsZaTTN7eerA3Fhk4aQq6ZurcODAQYoDXXIBzrpGMDKpSK4/XvQtwuSuNcrhbBCi0ORZuiso9izgP8JawxNK16F+FYo9w5e4ORmfkkmstD3T1ZUDxZUfXp/ZcaLqCBt1qAO9wSqLC0eM89sGeRzPzMqP9KAuMuxdL89aulqX3hrXuHCowg+hnGji9BW1s0iYvkIdcMIM7aN1xR3PC5tVW4ZHcyrFXR9WMzp9n5+c+lIoRuDl3J2qd0f61aPN8mVIwY/eXS35XOLAngkpOx4iWrU9OsKY95vAwT3bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtM6WQf1X5CFX+vgnRgQOYigjQ6xnz/J1uu/PU11Tp8=;
 b=c3QS2wfMRfX4nxp1Pic3mfrcpfk04IzqPishSAlZM07fdPWf+BThY6MDny+2tUIf8F70Nx4RXylJrQFs3Ekatjc+II2lCwdEj70gZEpZVHvQ6mQHtnknFb3O/NOPl3crowv9BdrTZ7ZP3CsCdT6w0flL4mK8r64wixuyN5OgzD77v2thLilXO/VYg4yGNyjZnfwWbkTV8W8v5s0DC+xsDfjS6/rsYTNBjD6zbObZ1+BO1vmacu1KFvyr2jXAvqSELnUOiv62f8DLkiN8fwTtotQ6mat9O6o8I3TXMwii9Ij1X3SOzp57Onl89pRHUnHFq4i+40UnSIWfaOz1QAusYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtM6WQf1X5CFX+vgnRgQOYigjQ6xnz/J1uu/PU11Tp8=;
 b=CFdOjRutwHI/pDkDa1Ew1ROIoVCl3Zoy5B5Hwl1I4sC03wTDKB1LDdpUfucfFi73Nkc0ypGuXVcvmYKOweC9DnSwqfiLtMKkgHTzvnumMctTA7dD0eePcu/C+QJyjnZRL2jlo+CHb4BeitpKSunjZ56jA6oJy2G8dbj909W2En4=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by BN6PR10MB1618.namprd10.prod.outlook.com (2603:10b6:405:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:32:30 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:32:30 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq135iph8lc.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-25-hch@lst.de>
Date: Wed, 06 Apr 2022 23:32:28 -0400
In-Reply-To: <20220406060516.409838-25-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:13 +0200")
X-ClientProxiedBy: DS7PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::11) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 073c7bad-f00d-4d5b-ec41-08da18473efc
X-MS-TrafficTypeDiagnostic: BN6PR10MB1618:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1618B131F14E3475ECEF0ECF8EE69@BN6PR10MB1618.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIfFN6ZUD2su2U1lfuo26oFy3DXVBykbx0dwaYEGzK7BsICvXIUb2YHrfD6R1SpHzZLdoy60EygwHWUppYBHwYNhRvVGdJY9eV9cs6HWqGwjPhgeaWa49V5vtBExI24PdhtYTHWQo/9nx4xmpOvQRF9m9IqidD5y7tPVV2S2IREDO6vdIxew3Kx7h2FzpTGbrM9j8xlfVqXTHLEmAO9/4oVXKOI01Ju73rheURL2cy4KRtPHROSrpT1umFK+wQdh7o38LblS10zVIfr0/UEX2GMXj7nO43B8KT4l7PNLgheG5vOb0afIiE/1+RpMQjOrr4K60SxozwkiPwoNgdurI4VV6sQ6oWdeHPetek4WARqYGGSsbIQPPULIlwvZgKjwzNUsg8MCHx2c4CvhpY3hOPZeiXEIW9lr6jj95b1A3U+w87ea3wWRBoXccuO6jjFgNXemwnaUCXbOTiyFDPtBjZjCy89Pf5IPzDLxGNQDDq6wCqfZ/2oiA4Ktw3NEwfZmOPd7mhKXul+uW+iV2L3/bXZIWmec/8Z4QjsaFFd9Fpz9JMRisb6rpNPWwFTZfeFdHBAjYJ1Cmc2E3rmVTanNSxZ/M3rct21P5mE5Fx5XgAUbW1ut9l5Z2/W3KreCvEKSOcDy0oWWrzK98HizxC7ceQREIX+GfP2CgCmzP8PUmgry4YLwuBuD1OGqLemfGT8zTdq/KgGP98cRO/ylDdg3Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(38350700002)(38100700002)(2906002)(6862004)(4326008)(8936002)(66946007)(66476007)(66556008)(52116002)(36916002)(5660300002)(54906003)(86362001)(6486002)(83380400001)(316002)(8676002)(26005)(186003)(508600001)(558084003)(6506007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8swuNszgtWladoaG2ebwZi/0ZzH6DeyV/bthpZusiDJQYxylmSbA5PRO7qqk?=
 =?us-ascii?Q?7VvYQHpjnVKcs4+A7satuAEMQnvnsFDCBEj3b9Xpgns3QrbvSvSb9sZ5U3NH?=
 =?us-ascii?Q?rLKuDQ+Zh4E1yctPsyKoTxG7Z8Wfd9A+O9dhc1Sf8LZJFWwB4wj1WwlJGVxD?=
 =?us-ascii?Q?lbSr6mSEEfD61JouYuRW6FIuYm5K2H5lync3tmP3xLxXx87mKS0HDKaDyBjo?=
 =?us-ascii?Q?wcuybuiUGt9Wx8qT26WAgBMFrqTcJdsc8PgWhdIu4Oe9xLgHg668qkHKTTRb?=
 =?us-ascii?Q?OcNN7Vp1iDl9y53W22ZMw1YmvjLlSda+Xi5WoupaTqeePxD4kJL8W8YrS9k1?=
 =?us-ascii?Q?5MXqgaFpz+k8zQdJ4k0XmIsJ2XFj9BEEY/W+f/w/QBJnlR+pQFhNsRZBV0gM?=
 =?us-ascii?Q?ArxFxFRQxVkbGi0aIEECqn+FcrzSuvkrDKu+uucg+uO96Z6zf4JOHeksq/98?=
 =?us-ascii?Q?nQl5ZPXqpG5hQlpbHtwNDhxigCd3tIjZkRvQnDxqshd5PwIrLj7xVNuet4mb?=
 =?us-ascii?Q?6pjlKHAOk71nkKVi//P6MvTQ7zIor0zVRqOxe2wIXnvRexAmssGDGM5dMX+U?=
 =?us-ascii?Q?bELptqKzy7PZJiXJ3GopBUHUSPrQnOqMQtiG98a7hxW0pPxHxGqgHf07BxGI?=
 =?us-ascii?Q?nCvZyyu95XACEbquobj7xaTgDa/GCCXswpbQCiN5WY56QrcktkedPaPc0/5p?=
 =?us-ascii?Q?huOfjf6smTgyU5IPoeHOE9zhn6b2jXJJO/CVw3ZrPW6TUWL68mQs+fhmNcUs?=
 =?us-ascii?Q?oPzRBn/D8gFKKFNnuyVbiMkS5FaZat3CKUzVNfWtlc0CzTq7SQbUJAYIKuak?=
 =?us-ascii?Q?Sa2On3EGoEZ/obAmO+/6SceIkNAA3YhQKuC6t/teDMxvwWrZfOEl0qSsnL4W?=
 =?us-ascii?Q?Xo7oA7d8Xx251pvSx4jLRe4uUFpXgpwT8aKmEsPl0YmQ0cXLEreV1OIkB028?=
 =?us-ascii?Q?ug4gAjeAdSw2lQHXB65EXyetLFaentH22o6QXieEgJ+9TtOfxjJsrgRMXT+E?=
 =?us-ascii?Q?0ZwTAuQRbojDATmBh77GnsRIpIbcbl8KL4sav6ScENnXR62MVs1ONADxT7QG?=
 =?us-ascii?Q?Zhtpe8/W5WF+hBlZ0m73lq+nZYQRHCZGi68sdgbC8bKOeY0IK/HQWbnuJRJl?=
 =?us-ascii?Q?JorA06/wHlXj1T/ESfgbaXGaW21mHefygocLmPQ/1tn+DSMiwAvrTjgfD/b5?=
 =?us-ascii?Q?Ttg3SEtVlfHizipMwVmb5G/9GfdS4r0jBJzNj3T6J+6f1KcnTS4lCTvFFXWu?=
 =?us-ascii?Q?Q2NzxQ6ABea2CN0LrYQzB6X1/n1/2195xk/ERh14WJAxy4cG5VeEB/BFLb14?=
 =?us-ascii?Q?V6qTl/T9g4k1KYp81ocVjLwT+kdI1Nkdk8/+DM7FQjXB2ZDnM6UVdWcWycc5?=
 =?us-ascii?Q?4uMburs8Vtf/K0E3huz8tFudnSkyK9MRPYRBLCc+M1a6Jz269Y9bGBdnSMNQ?=
 =?us-ascii?Q?xrDNjO9qEXwo7ptfJJFT/z4roRmVQ1pLKSzST1mqVbwXn0p5EEY+wtU1OgpK?=
 =?us-ascii?Q?FpCVF7PfWCM/JdiFeLIW4nAXOOix/uBy+PLdlzWzffh8XuheQXzJ4v2L6bDt?=
 =?us-ascii?Q?+oJpdFLVj/2VbaiG07pFBN4ZWNdaQV25c1I20QPtfCp1QPQQNvBgr25MqmD7?=
 =?us-ascii?Q?8tDSEMJnEykf7aewPfAJvdpYb1vU5CVTCV6IJGAWQX3Bd+kCvlBuVxZFqwfU?=
 =?us-ascii?Q?gXDlgusFFa6Oj78zk6O3u/uW64TR5IzzEu+lIQMOfrk1BUNGOraCJPRjgsxU?=
 =?us-ascii?Q?755pnrTMt+PRNTb6o2BFHe5QJY6jbZQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073c7bad-f00d-4d5b-ec41-08da18473efc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:32:30.6416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwGzzH7OhkF8PNNh3yM9ri4dh2R9VUt7jXac7Lm4rAo/rmhpAzJ3fZmkBEtZO72lGTEl96s8zj4YXk68qPq0GSp3vjt9qNgWQQclO0sGZLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1618
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=926 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070017
X-Proofpoint-ORIG-GUID: i5ueGU4Do136tb5GM3VcintEL9nTn7F7
X-Proofpoint-GUID: i5ueGU4Do136tb5GM3VcintEL9nTn7F7
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > Abstract away implementation details from file
 systems by providing a > block_device based helper to retreive the discard
 granularity. Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ncIt6-0007Im-Tq
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 24/27] block: add a
 bdev_discard_granularity helper
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

> Abstract away implementation details from file systems by providing a
> block_device based helper to retreive the discard granularity.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
