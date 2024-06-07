Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634489006D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFala-0001tr-DO;
	Fri, 07 Jun 2024 14:40:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFalY-0001tj-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDgjNMLV2JAAJGgydZEWnatLy2EIo/Wv9fvbYe4nn7M=; b=iDq2S8XwNECQdcjroA8Fv4reN6
 xldehSzX2p1nUE2bw5NfPTYLlq1Cc15nq2HODenvTb75O/Ra9xlPaw63+a9N07IszK2JRPQaxM8kr
 RjAO4iK020lRRNQGj1PUddQoTNt5xQ3PHuwIRvaq0DQl5IK8pr1NXB6KLNB293t0iZUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CDgjNMLV2JAAJGgydZEWnatLy2EIo/Wv9fvbYe4nn7M=; b=V
 dtIlaAAgwDO4Bzb8c0vF/uGk1tGJdeEEBaVb76HnSiPGmclyiZcyCT8d63E1b//yDL31b7fxOUGzY
 Bkmhz0Da2kMpTeTA/bDgeeZKkn2TL7LcrbyL5Nne7fombfJeEKrUrevlh/A96dW/AU865MEYL1iHw
 85OWDaCx7MGNUzZo=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFalY-0002xi-9k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CublM015431; Fri, 7 Jun 2024 14:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=corp-2023-11-20;
 bh=CDgjNMLV2JAAJGgydZEWnatLy2EIo/Wv9fvbYe4nn7M=;
 b=gRLsCFToZlZg44uG55LiY/tIgkl6GOimBOkcHMXhJq5iPx4JNKFR7WZAWA07GxRs/v3T
 vbiRdTjOT1H2tPiKcMBfZ46HzGEkG3OJo9LH5PpA4xS3iUhQXM3kpJ6q6SnHJa9Oj4ia
 ZXH+owkkjXEb3bllzyO0ATFwkHg9S2vncrJpE4/Oyjr1oW/C0t4dsnrisWAXZECdnzzL
 J302HLZ/8nXshUeGy5IhBzW+AcbM/05IbQFt6aSQzgcTZIAE7FCpSr9/UnFCTYfRhgCE
 IvfMYVbcrMxc9MGgKX/zLrAUTMJWx7OkvbOGjmcEU2V/ZWBhlN6MntJmDrO0TGjH1xff Hg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjvwd3ted-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DHEgB024059; Fri, 7 Jun 2024 14:40:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrr2abeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONmmBolru0dx9S8wDGMPj/Ky4p5HuALPweKMXhxKXfHMCmKwSgxSG+j7ipPB09jgtKkICEbp0tHvoJFCilpTC6yXIGWJp2QMCua6HS5wPN+1kmTIYjj8Aemvxddsy9UxnvigmoNf5I7Rv0kM1cXV9lXPpedI7tMch4LHfNwQGdjV8kJi6dwrBkmxWWKpnNakv7nR8Yfg+2EY9GAfTnrRFDNkBCUfDQzLk79Kj5SONVT7s81sWnaDWlXX6Sz7M4AofTXQtcuXfirgDd/yCv1hV5fCo3ggBqubwzaZVWFgTIEtgwS3at9NxAPVMTr+ATqzSAdzoWi3Prchrikl5G81Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDgjNMLV2JAAJGgydZEWnatLy2EIo/Wv9fvbYe4nn7M=;
 b=DpRLaWnJ3HWMQ0+qdvnEVRb0WKWOiJNd8LzzUfKx2HyQG3NHS+xeF4/vGoetE8pI/wxHO5raE3L5NX9VjKRKrIwEL1y5oDgJ0nKIfP7z5IrxXJ+UCd80Ehl9FhXNXiP+TCrSMfSMQVxOHWD4j+RXbm1Lk8v5r/LsOEQahI6jCXOOgMOZhRnWCpHvQVQ+BhBPkcGG7McqtJzcHp1k1QAB46JiS8aeixnzavxo8q8oOPdzkk+m0gig+EVUJ7MX6XVeC9SzPRv4CC3W5Bsbz9bIupKcJmi3ppM0BBU4N3dCsTXdXssssaiHrY51jPyd+SjbRMsrfvOUOyje4dywHm4LEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDgjNMLV2JAAJGgydZEWnatLy2EIo/Wv9fvbYe4nn7M=;
 b=zYUxkujxr7Tw0ZqtMWkn8zlWosR80LWrz7prpjaAskjey3Z07dYqVPvOSMAUWH6ElrgoBHb/SoNkR/i2XR26Lw8g2WmrNT8mHaxteWJtf/LUtxuoqjw08DELtc8DDfVQbK/P0/Yr7ynC15JO+/IpfBZ4gzqKZ64mWL93uRipKks=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 14:39:58 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:39:58 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:38:57 +0000
Message-Id: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: MN2PR08CA0029.namprd08.prod.outlook.com
 (2603:10b6:208:239::34) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d7ed52-f2e2-4681-ccb0-08dc86ffb46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YbjtOl9LtLb79198k2b7FIk1eeHGXbCeUV/6duOy4+9ipddhDCrnALNLAXvN?=
 =?us-ascii?Q?WLx1M5ObkTlUGLOmBIUG1d4x9CvUzurP6vt1dsUK4GSFbQVax1oM6pq77dYl?=
 =?us-ascii?Q?PHC44U307r1qhq3iPsUTgbYEmU3a6vCNn5EZbf7u9zAd4bvxaIufEHD+GtGc?=
 =?us-ascii?Q?cJsMac1z95tWNy4/APR631kvDk9VMN+gMbFNkyQ9RTmHvUcD6xHlu0mn5CCO?=
 =?us-ascii?Q?WcbVBgREv1k6ojbBtFcWhdFVh2hemI0RSCbe9y/1S+MXZQd7SysxCjHC0opj?=
 =?us-ascii?Q?amveh0zHstfDsa6t9oCp4midRzIzR/QgvNFzq4Z0yuoNHK56XN49FgEYT7ef?=
 =?us-ascii?Q?3iJpzu9ejVN5EVx7tfMaxWA09nukI8iUGLMy8gfgPB2G5OicZURXAysySsTJ?=
 =?us-ascii?Q?SBay6PRV+Efx15KBVrnNDLVMRbY4HWnik+dyhZ4bHt/7HmJOglUEUg0zymtI?=
 =?us-ascii?Q?1L/FxkSvgzhmoaMfyjqLf/eFfC6R8j7b7H+tRV1o9vqTZbQMlv9Kdlb4UnqN?=
 =?us-ascii?Q?8W2cm49nLOZENwykNZg+BnXdxPwyvL0xkUvvhc/eU8z+M8QxLd1QrHr2xsjb?=
 =?us-ascii?Q?BRzLIlh8iY0P6zG9mK42apgH81qFczE7aV/+kD8/bAHAqW9/FuBbn9PVYyjd?=
 =?us-ascii?Q?rHk2esJXzBD9q94T8vZSeTzqMnO79p4LGFeV1AqSnaMP72rotFj2HDJiKYyT?=
 =?us-ascii?Q?2Zo/uQZaTfzZPXo3TRD72KYcUafYbupviHLkslb/nynf+PI010spYiYfZInw?=
 =?us-ascii?Q?XN/364BWkDRn2/eHhHyP69uESJHdkKPqlG3FO9mzIewZp3pGND3zsmjJ+MK/?=
 =?us-ascii?Q?J7uxZ3s0Qngb3/Q1Fneo7MdgP9WvzYBgLuDxIfCl6BI0sIo4ivxnU6/fRPXU?=
 =?us-ascii?Q?rFbXiTH8oV50MIBxgEIdfhpZDKL9NMjfd6V+M9n5MHUngV4NICd/QSjNfyJw?=
 =?us-ascii?Q?ZtXd049qdmyccJ3jh5Y9kod5WKNp+g2qqDhwN9GP+oGlyxZpTDyapkykb+Q9?=
 =?us-ascii?Q?ls+e4fIyoB6qXEwDbEsi2bLvKmQ9i96VEqvi3kPBGzmAMLDf1hI/B3q3bZGv?=
 =?us-ascii?Q?vWcspWo6zVfmv97bdID/fjCdOYMKj7h4JyQ7jr/7IzuMPw51A7uIBI3mzdVC?=
 =?us-ascii?Q?OJnxhuAw+VcznE9aDn44Hs1zwBdbnXj1FQKXDNMmh2Qird8/XSrj15vmKa7u?=
 =?us-ascii?Q?O7VzzSm9hHpai+MsJJAopPOv+aFPpJ2kc8xBP+0IHVR5ual0nUoMrjV5zY1w?=
 =?us-ascii?Q?taMEYEuIj0O8pLSwXdrvdLKt4Tc6s7RXR6nc8APJkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E46hFAxm47w+Y/4KJiz6jKDWHGDICHO0v9A7Iqqk9mGKBtZphxjewMXknTOB?=
 =?us-ascii?Q?ugEmIVcGb5nV1F04SlOyYT1V3nFkkQpTXIhvQhg5R82Ixs0iQUtv6GhIR5Zr?=
 =?us-ascii?Q?XmzYLzwkMMJrES436ipR7ysL7lBszo5rq6on4/lziXeUjlFBPpNRG3m0T4Mu?=
 =?us-ascii?Q?w2bO/dHe5ZgMX+kAwBL/GILY7TvtXWskz5oM1d4EnkFbg6GEnl/baoHSMsqc?=
 =?us-ascii?Q?ZgD8iiEwGnEYz2IddFm4NTVdOrBx8XO0Xs2799FjEVS2coIJT6iyPKAvz3sP?=
 =?us-ascii?Q?j/CIOqDGwffOlxVtry9EkLL3zhX0VmtJTPcbeHKTzsRoWsfZ+dWzJ1DyMUM7?=
 =?us-ascii?Q?ck6fey22RZHuPC2pFHgsfvPPzFGAD0v+IFzjdulMgItSO+XwB2xsAPuE26FZ?=
 =?us-ascii?Q?YSRdP+N5w4o6CNR184IuQoIPj41vNUAFb54P+RgaQ/k1AViuty+X5FV/ty0y?=
 =?us-ascii?Q?178GhG6vgUqJgscwRpd/ZFl8sil6QSqHV7q8Ggak2fwZtoSSMMzeMHdRyV+o?=
 =?us-ascii?Q?XF0rOyN70qTWZ5WFkrUzliEOy6uuvWzSEHiFBb1npFkmHCt2O5nAJRfyTJ+C?=
 =?us-ascii?Q?1nOQY4ttB1Uqv1tw+Gx3IbzUzj98IMMZzfIEmUNu3LHbD+4tUJHm1yMBMERr?=
 =?us-ascii?Q?wTbRvpf92t6ySxdYYV4/baPraL6fd9ephuw98trYJRkIm6umnc4N2QOYLGAg?=
 =?us-ascii?Q?jtnDRzl1lgoct6gDI3rDyk8XTfUclBMQNrv7zS0ZiQB8H1ntGv6pVGsxm8VN?=
 =?us-ascii?Q?ZotEmYqmOrp7HFvZhmOi+wK/iNhnzjPPOmrW4kXdbVOyoqVJPX4GZDbkFzQg?=
 =?us-ascii?Q?9Sk88lTPO1k7JAkiehEQcKfeoXx0cas1uPdZHKX4khQyQLzFzWSbYU7Oo1fu?=
 =?us-ascii?Q?5ZMoZFpLO1QkIr+4f9isD5Iz3KiOujGsSsASR3QGJ8A1RzTirUS8BjMUbl5n?=
 =?us-ascii?Q?qFcaMux2rDbjeuceQ8SeyWpkqhQe6n3lIxuoOY9+/ocLenTx/mPa4MaLEuRV?=
 =?us-ascii?Q?IuuIcY4ThbSiZgP0/sZuXm37hvDy8KlPeJDpOcfAsSnWycCL91tDGeOPdZhj?=
 =?us-ascii?Q?0GrP8SkHq4JwZGc9B8aJXa1MLPupzIQQRMlOgcbqOPqMsGVVzM7uGkwqU1N9?=
 =?us-ascii?Q?67dZBPshDEz9yfgD9LObYrec7QWpxhe/6smGDqzIljvzJOjoNn3dUKG6R28F?=
 =?us-ascii?Q?eyPokbPuq/sJg+knNx95oV9zRaYj6WkqM6TwTh83iJL92vhfN38/MJ2p6+24?=
 =?us-ascii?Q?C0Xv3kocawhw9DtBl4TZL1d6j0yEAQeulfhwE/iLjjPOR/dzW/flZvLB5KU6?=
 =?us-ascii?Q?/lg/6PNzkLtFgoWs6e78QncHJB5gLrPWEWhshWLT2FwVSe+XSDWNHdcC2+EC?=
 =?us-ascii?Q?4dU4zCr87GGsKCGOX9xV/l6Jv7NU7WZcK/qWsDn8MxFC0bSKFsX1iBc0aqLN?=
 =?us-ascii?Q?y7jyACpzJCIzn636VQY+lKl4GmEqqhsJH5S+XNIWyENagA3gZ74+HjTQ37lR?=
 =?us-ascii?Q?VKRzHWvZ2Q4rICn1tWNWnkDNgLBWOyO7UJfPOfmTBnzcLB4IKdZPQ4jdA9TX?=
 =?us-ascii?Q?dDO8+SQ9Ip548dnIT785AXhwUjv1d+0W+wcP+UEEOvbosaz8X60P/wGgEq8f?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: boxWpLx+YbhJyuNJavY7X2hYG/MzyPIRZFTsml4xm1dL6E8cm0lLUKThj+BD9bca7O4NiWbmwUT/VuqKlsQBsxw5WGt8NakDPm6Aidjspq53gc8he2zFpTmXuw8+ooBWxn99nU1B4+7AbDugtpnjLg5vb9CTtgpw6yJqM/w0Hn79xafWqjTYAiP8EBBwT2vVluiC1MaU3PZ+xqC8wrhwh5NmDZiSiBGIoQFkdlh42BA+V+yhAruKSLQ5aZI7CGcEcEPxJ+ENX2vcC/DntRz5Gl3FjvdyLI1HeL4/9a0RjC8e4O+8uwz3XHJ9rM4FFWuInE83qpa849lAEQtqwtpdxIMmPrc4sld/o4GXd2VkFRyOEw7QN+8aq/0WsAJFc6uNX5tGnfbwSgNXga+fFe8Pwbu3CFO/FkfjmJAafoClAE5lXSmRlHTbJvax9/2ecPS0S9o4rnBT/+E7u3Sl3UKWa2ATglrNd/OX4c1FAl7th1jhmFhMZ7itAmh98Q3B7uldoRkQVfzskS4ILcjslW9XSGqzYXsK6Eo9qAjJcOJsiVcUgrfVUfPDK+FMmQj7BF4Rvo/mUzyvfudVqWJUg9pTbwU4QKa+wF/W0L4eF4/bh80=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d7ed52-f2e2-4681-ccb0-08dc86ffb46b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:39:58.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFSmQ2Ja+3a/9+S8Yziz7Emib2yq242zrz+HfmecH7ADc2dtzXP8/LYcYtUsUDspqYQQr5V8CLbt8NMB8QSOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: pWKg5bk5OVz7_rP0evL03ywWomXmMy5S
X-Proofpoint-GUID: pWKg5bk5OVz7_rP0evL03ywWomXmMy5S
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series expands atomic write support to filesystems,
 specifically
 XFS. Extent alignment is based on new feature forcealign. Flag
 FS_XFLAG_ATOMICWRITES
 is added as an enabling flag for atomic writes. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: urldefense.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFalY-0002xi-9k
Subject: [f2fs-dev] [PATCH v4 00/22] block atomic writes for xfs
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: gfs2@lists.linux.dev, catherine.hoang@oracle.com, agruenba@redhat.com,
 martin.petersen@oracle.com, ritesh.list@gmail.com, miklos@szeredi.hu,
 John Garry <john.g.garry@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 mcgrof@kernel.org, mikulas@artax.karlin.mff.cuni.cz,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series expands atomic write support to filesystems, specifically
XFS. Extent alignment is based on new feature forcealign.

Flag FS_XFLAG_ATOMICWRITES is added as an enabling flag for atomic writes.

XFS can be formatted for atomic writes as follows:
mkfs.xfs -i forcealign=1 -d extsize=16384 -d atomic-writes=1  /dev/sda

atomic-writes=1 just enables atomic writes in the SB, but does not auto-
enable atomic writes for each file.

Support can be enabled through xfs_io command:
$xfs_io -c "lsattr -v" filename
[extsize, force-align]
$xfs_io -c "extsize" filename
[16384] filename
$xfs_io -c "chattr +W" filename
$xfs_io -c "lsattr -v" filename
[extsize, force-align, atomic-writes] filename
$xfs_io -c statx filename
...
stat.stx_atomic_write_unit_min = 4096
stat.stx_atomic_write_unit_max = 16384
stat.stx_atomic_write_segments_max = 1
...

A known issue - as reported in
https://urldefense.com/v3/__https://lore.kernel.org/linux-xfs/20240429174746.2132161-1-john.g.garry@oracle.com/T/*m7093bc85a8e0cbe13c111284768476d294aa077a__;Iw!!ACWV5N9M2RV99hQ!NbuQfXN8ZuUf_an3A6jHUXg3L1oCzefzyTYl0QWgJP1WbQCO8J_NPT9GHdGothSf36d0vxzJAjVUvcIB6IoU9nq3XExF$ 
-
is that forcealign is broken for !power-of-2 sizes. That needs fixing.

New in this series is a re-work of the iomap extent granularity zeroing
code. In the earlier series, iomap would consider a larger block zeroing
size when a member is set in struct iomap. Now each fs is responsible for
setting this size, which is i_blocksize(inode) when we just want regular
sub-fs block zeroing. All relevant FSes which use iomap are fixing up for
this.

Baseline is following series (which is based on Jens' block-6.10 branch):
https://lore.kernel.org/linux-nvme/96cb2069-a8e2-4723-802c-3ad4ba3e3d42@oracle.com/T/#mb980c084be402472601831c47fb2b66d0bfa8f0e

Basic xfsprogs support at:
https://github.com/johnpgarry/xfsprogs-dev/tree/forcealign_and_atomicwrites_for_v4_xfs_block_atomic_writes

Patches for this series can be found at:
https://github.com/johnpgarry/linux/commits/atomic-writes-v6.10-v7-fs-v4/

Changes since v3:
https://lore.kernel.org/linux-xfs/20240429174746.2132161-1-john.g.garry@oracle.com/T/#m9424b3cd1ccfde795d04474fdb4456520b6b4242
- Only enforce forcealign extsize is power-of-2 for atomic writes
- Re-org some validation code
- Fix xfs_bmap_process_allocated_extent() for forcealign
- Support iomap->io_block_size and make each fs support it
- Add !power-of-2 iomap support for io_block_size
- Make iomap dio iter handle atomic write failure properly by zeroing the
  remaining io_block_size

Changes since v2:
https://lore.kernel.org/linux-xfs/20240304130428.13026-1-john.g.garry@oracle.com/
- Incorporate forcealign patches from
  https://lore.kernel.org/linux-xfs/20240402233006.1210262-1-david@fromorbit.com/
- Put bdev awu min and max in buftarg
- Extra forcealign patches to deal with truncate and fallocate punch,
  insert, collapse
- Add generic_atomic_write_valid_size()
- Change iomap.extent_shift -> .extent_size

Darrick J. Wong (2):
  xfs: Introduce FORCEALIGN inode flag
  xfs: Enable file data forcealign feature

Dave Chinner (6):
  xfs: only allow minlen allocations when near ENOSPC
  xfs: always tail align maxlen allocations
  xfs: simplify extent allocation alignment
  xfs: make EOF allocation simpler
  xfs: introduce forced allocation alignment
  xfs: align args->minlen for forced allocation alignment

John Garry (14):
  fs: Add generic_atomic_write_valid_size()
  iomap: Allow filesystems set IO block zeroing size
  xfs: Use extent size granularity for iomap->io_block_size
  xfs: Do not free EOF blocks for forcealign
  xfs: Update xfs_inode_alloc_unitsize_fsb() for forcealign
  xfs: Unmap blocks according to forcealign
  xfs: Only free full extents for forcealign
  xfs: Don't revert allocated offset for forcealign
  fs: Add FS_XFLAG_ATOMICWRITES flag
  iomap: Atomic write support
  xfs: Support FS_XFLAG_ATOMICWRITES for forcealign
  xfs: Support atomic write for statx
  xfs: Validate atomic writes
  xfs: Support setting FMODE_CAN_ATOMIC_WRITE

 block/fops.c                  |   1 +
 fs/btrfs/inode.c              |   1 +
 fs/erofs/data.c               |   1 +
 fs/erofs/zmap.c               |   1 +
 fs/ext2/inode.c               |   1 +
 fs/ext4/extents.c             |   1 +
 fs/ext4/inode.c               |   1 +
 fs/f2fs/data.c                |   1 +
 fs/fuse/dax.c                 |   1 +
 fs/gfs2/bmap.c                |   1 +
 fs/hpfs/file.c                |   1 +
 fs/iomap/direct-io.c          |  41 ++++-
 fs/xfs/libxfs/xfs_alloc.c     |  33 ++--
 fs/xfs/libxfs/xfs_alloc.h     |   3 +-
 fs/xfs/libxfs/xfs_bmap.c      | 308 ++++++++++++++++++----------------
 fs/xfs/libxfs/xfs_format.h    |  16 +-
 fs/xfs/libxfs/xfs_ialloc.c    |  12 +-
 fs/xfs/libxfs/xfs_inode_buf.c | 105 ++++++++++++
 fs/xfs/libxfs/xfs_inode_buf.h |   5 +
 fs/xfs/libxfs/xfs_sb.c        |   4 +
 fs/xfs/xfs_bmap_util.c        |  14 +-
 fs/xfs/xfs_buf.c              |  15 +-
 fs/xfs/xfs_buf.h              |   4 +-
 fs/xfs/xfs_buf_mem.c          |   2 +-
 fs/xfs/xfs_file.c             |  49 +++++-
 fs/xfs/xfs_inode.c            |  41 ++++-
 fs/xfs/xfs_inode.h            |  29 ++++
 fs/xfs/xfs_ioctl.c            |  83 ++++++++-
 fs/xfs/xfs_iomap.c            |   7 +
 fs/xfs/xfs_iops.c             |  28 ++++
 fs/xfs/xfs_mount.h            |   4 +
 fs/xfs/xfs_reflink.h          |  10 --
 fs/xfs/xfs_super.c            |   8 +
 fs/xfs/xfs_trace.h            |   8 +-
 fs/zonefs/file.c              |   2 +
 include/linux/fs.h            |  12 ++
 include/linux/iomap.h         |   2 +
 include/uapi/linux/fs.h       |   3 +
 38 files changed, 656 insertions(+), 203 deletions(-)

-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
