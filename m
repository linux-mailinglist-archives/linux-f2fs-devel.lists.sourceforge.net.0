Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923C9006F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:41:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFamN-0003QR-4P;
	Fri, 07 Jun 2024 14:41:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFamL-0003Q2-DH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pbuJieUHeIJKuEeuAPi1iy/X8kPk0uhgoHjgil0VAIE=; b=hD1f6GOfTfNJcqG4odpfAuhBGz
 iLYiAE3ZeMH6h9Odg7CRBsMtasDiUgM1ER7o/xR0b5i4Tf6ab6w7Sv2+UzaFWeeI0RU4lHhzmAK34
 WZc4jhd5olhqdLAIu7nyg+9jgJPQRTK69YMO/aP/G0/ip2JnFQnt0epLybRDO1Wv+5Mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pbuJieUHeIJKuEeuAPi1iy/X8kPk0uhgoHjgil0VAIE=; b=LEjevT+TwRf1+taEYl7c9xKxgp
 MJTy0Q69Dm3Hng2zZFxn66rUnQV8p1gLgrV2GOwif9XhwxbDFswCeB84O32QLMGwSjzSyksuqtN3r
 38VEQxubdbkV03Lm3nlxgMQxUXMiLC8Oo8Qxs3pqEf6n9Ar6WqVpaN/Xo0Jhm4FPaaPo=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFamL-000347-Pk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:17 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CucN9029337; Fri, 7 Jun 2024 14:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=pbuJieUHeIJKuEeuAPi1iy/X8kPk0uhgoHjgil0VAIE=;
 b=acw4LpAm2NhUSKQ+HDCaYwWPYtgperjmgMLCpBBt5YkSxnJgxr1rhNIaRsxyom+kJp6o
 D+UpEbbcyKw1HuW0p+E0a3G5Koia0yk8+9OcfpMN0+7kcxknKXLW+NWfz1UQHsinW3TP
 BAvxpkClywMiKFFyf2KbMu05ZeUgyTk66rWnSrNtM+9v2ARCDOUeNrh3myi8VO6DmfjR
 jNv/kndkTaKy6SPy6UFffsSj7nDHbw74FaHzELoOYqoCjc1PxoL3HkGIcTj6sFYwRPPp
 zUa/xkxB0OzenH8NR42zaX/lZTolUyAwXYeDtimNi+9EhF5b3Fkp9J9M+cy4o8uS7nSb OA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbuswskt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:57 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DxuKf016121; Fri, 7 Jun 2024 14:40:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrsejfap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFLonHX8qmCiItTjFSRUBxpm7r4+e21eyn9WD5hj/0PivZX/yQnKutKv/GRme0Y6X/bT1+PQiwZWMScIPX+PRhyaDq8LpU3ej44uvIpKkw0KxUmuXX07mn/35Q1bz2mTxT3G8+plBwOGntEwOmVk7VyT6UeUOjZ3b9uWWRJqHWA4N0PKFG+W6ELWAqasMQwKdC6nF26OmBG1ug9vcnceev4535J2UUueHAWDuP8BrIgSgg1zcSKMcmr52DwS6wcYooyglK9/vN7GDphxVhjgNBimpwbC/ytVLhjavamPloQMHCjx8vA5jt0QuSYcikZK0H1fhPs2TNASPZBiw51oYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbuJieUHeIJKuEeuAPi1iy/X8kPk0uhgoHjgil0VAIE=;
 b=HC4JGq/3QCjc4HRFRgKgfeR7H8HFrz0eMJ2qOiz+lImtlGslM6DdgEQOp61onKO3tjpxMOs0U9qkWK1yyi0Suy6WsYHHGaYJV3r+yDf18ytMRRxuv9I8w/BrwM93/liUdMXqgjGnTINFWSLlxh9utN1KcWRiorpPl78vxHLdok8z2y7Tu00TB+ukHP7vKZnd4y+S1NxD3sGb8C+HbGtYK2kxpF5jq8YCxDprMJUW/2AfPZ9aao/TPgKI62In/neWig2z3Bm8mxeOVRu9NEjfITtixi8AuxJMixhniCXP99N0xmY+vvWYPgUq4DwqqShJ0DkSULI1Koug06W89zG69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbuJieUHeIJKuEeuAPi1iy/X8kPk0uhgoHjgil0VAIE=;
 b=VebdbKfpGBnplAF85Gly61BLJeFFyU1mEg3giojkdbLAybuEpq6u+DU2wExhgAf+VkZob9CVcQqGI2U3drGXKWU+Pl4VgU+0Zlwjmhu0cJ4Gs3nH3Vu+1NXJVmd0G6p81Z1PWvAMpQJyLPS9I9XL+0HLrv/KohhbkfsVCuWxYpU=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:40:54 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:54 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:17 +0000
Message-Id: <20240607143919.2622319-21-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3da1ca-b84e-4559-19fe-08dc86ffd5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jU0woAAfiN/eilkxVxR5v1k73JZ3EuuxzKbFiFWdJxFbYyB1+AxrVkhnjJtN?=
 =?us-ascii?Q?hIGQ797ks6qnldkepGoN2ryv8jmIJRQ87LJRnqleFcl19TOWd1VQVVATeLlI?=
 =?us-ascii?Q?qPNl6E+cdIy+k6T2WHnC/BLQlXDIm2v3gY8x1e+OWpCmSJ1Cfuk0Wm8x84H6?=
 =?us-ascii?Q?o1Eja0Xugps1ZafmrJgNVO/yiyVzXNjdxvHyahUpDmsSmzqT775UM0i8bRhz?=
 =?us-ascii?Q?F0g4lxvabbnuFOtsKF2jeJ8k/CkUXWsU5aX4SaIH54wvUgoF5NjgmsTrJ51X?=
 =?us-ascii?Q?U7My2rLSQ114aY/YvnxhR91+rgVSEV9PPoqvfueVFc98cpqVs/q7+zizAQhh?=
 =?us-ascii?Q?8Eajkf+0kj5Hod1yBx7vXwX1P1T/yXOp+BKqpwU+xDScUy9Tvi6Y93W7oxF3?=
 =?us-ascii?Q?JYvQZC5OC1IGDsNxV3tquFEBZ/7UqOE9ccWKM88Pa3xgHDcoIkqvA0WeJjni?=
 =?us-ascii?Q?AJyNvDdz7KzLB/0wz5Ibyz8OmWjiNb0UmilRq0OfzFQ7r8UHcTmqfHFVfRpz?=
 =?us-ascii?Q?vheV5c3SqlP8ABPxU5rc5oWfGtkte+iATqYb0zScjZy58p3zc4xQggqxxEV1?=
 =?us-ascii?Q?7e0zVTZHMT5Vi4A2lxVp6qjVuO6Q+nbvWk4FHSjmAzQZp0Ll/bHk3Jfms4g+?=
 =?us-ascii?Q?SRrYaRBBxMNPqWR6TsiHzyx58uEKEcsTqx4Px14PKj0UTQBIGue44Uq2iguK?=
 =?us-ascii?Q?PQq4mw+Udowh0ktpMaqBni6tZViTW+/9cNRd7kO5gJghkp1Tn7YoPkwFvsHs?=
 =?us-ascii?Q?XBkjJUXK/3RR03uqWey18F+8tWwt+po17RXhKWr0RojoazIScW96H3o/h8Su?=
 =?us-ascii?Q?MwqgUrxZRgST08hwrkfoBt+MFfw2EqreZBsKzMNvLXEvZhJ3wAFpLUhZ77tu?=
 =?us-ascii?Q?42G63BBJujo7Gaz3aqO4Zqv0T6LF3t5N32696Blkg4qAvDuhP6WRcFUpfIQF?=
 =?us-ascii?Q?a9QJznehYZw7id9oG4NARDBfNYegmzJXeRHAagxpv9wlpyTBwEjYB7ZFnin+?=
 =?us-ascii?Q?0p12ePb9z+8Kxibsolw7Zf/4G44oWuLTjUYf71ROc1TUO+s40uzzwGybtA73?=
 =?us-ascii?Q?d2kDdh2+MvZHB4RCcoW9MWR+ZbbHXZR/YxEnAh0fuUImHx1Xu5Wvf1yHZak+?=
 =?us-ascii?Q?S8GSMcOJkekab3P6ZB9pv9SHUlbDSsV9Y8eYAyMVHozlIr0p9NBoP6XhuLF/?=
 =?us-ascii?Q?Q3aquOWPYaUJFb6qpduKmMXphfymwQxxCgspHPKS3ZGIi6uFOSKsBc8TbtQM?=
 =?us-ascii?Q?uZtBvT3yj/ImDv5NsKUB8gwZsl8bCYoIP5EJixH+1qDWmcUciEc6osSGriC3?=
 =?us-ascii?Q?THfYQOSbMMVx3FPFl6mTVf/f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h0GEm1qX8YUTvJHrIIRGj4cdhVJbEuJC4XQbiWcY4Yh++Oi9lD65OY9ECx4b?=
 =?us-ascii?Q?zQO2IwbUWpZ1BK7NVKhtxSQ6bJ9Z/1ttynOdT1u3p8tb0qsPp8l2RdSDMFEn?=
 =?us-ascii?Q?vtX/eN/gZmawFx52QysqhFrxGHFdx2s8F8/1QIwhQ4sfJ/sQlXg/uqyhWtTq?=
 =?us-ascii?Q?Yn4+uH/R/ogG9lOChr1SalxGH9+cd+/C5PnPyoNRHlw080wrL+2IhrhRpMGi?=
 =?us-ascii?Q?mdTwI2KSx/bNj3JZ1y7WLJrBWRhACMjIKxGfTEeB631keP5ckcXU2bbDYzUp?=
 =?us-ascii?Q?kk8iz4kHhx2rWjaVlH4WbwoOFtrzHzOfDXqMFZ9EwHpXB6DVUispY1yjV4TL?=
 =?us-ascii?Q?hKew3Hv3oWQdNw8lalM92Ed1/gJNF8fLtJwxj4uuwh0+F9nNSE0HFOZ+2xvD?=
 =?us-ascii?Q?LxriJUHhqhoL8wYN4IyECDbEEPmlUeaBS7RdbkDJsyje00/g6vavK4jJVQLb?=
 =?us-ascii?Q?gStA1F2MtrkozUVoEGH+s/NqWLHwD9AVXaQPLBMQCIQNi85zKwp8nhXT7P15?=
 =?us-ascii?Q?vTYRyBCw45rWdqG3yTVlVZElQXge7t/wTKSWl9JAyXnZuOmAjBZADXRRpiEl?=
 =?us-ascii?Q?LMgQlH2DknLzxZnO/5FZOiP1ok2z1aCU+ldls45/LZ1EJUcrrPeEDNn24AvW?=
 =?us-ascii?Q?PfHFCuDy1fSp97hHNMu9Z193RlqCztoQzBjTLTNNfmhcY/Cd9Tu2oTUSSsZk?=
 =?us-ascii?Q?7sPDuUeUi5f++SiYXTFpHzAyW2zIZNV31AlD1bCeBVGEgtF49Fl/AlXhcG++?=
 =?us-ascii?Q?DSVH9CgpxMhZNAjuqPZUjccD9V8Ji5Y1xOMc2vvjzDPvcPTWYCQAV6Q7c1gH?=
 =?us-ascii?Q?etrm9B0e0stqj7NseUrvP+6PZmHp8/+DGQ+5BT0zqUJ4KPnU3VJiALliF3se?=
 =?us-ascii?Q?lmt11dAbURcxGsNqkhJNdzVD8Yt22EhrpSQI5iFXmIDAEeLMz/Lx7zLPDokN?=
 =?us-ascii?Q?gNn9m9yxkHQM9utssPfdS9aEKKAUUDLjJlSThtGJmc70P7aFh5i/KP9B3WE+?=
 =?us-ascii?Q?uI01FuJPQA3Pjxw2FVaUI8g2/4oFeEzDVU3wAAryHOXttG987QEtxO0DO0EO?=
 =?us-ascii?Q?SYYT1CQrI5ZOZCTMtQloSATqlo7McvLmnzpwYnAE568VecybT62YLLoVSOWj?=
 =?us-ascii?Q?eDsD6Q0fu9hrNJ809LRCxzZU5RhhFhQrDIt0XMwOoh27gU+I87G8BCR5Yp+b?=
 =?us-ascii?Q?0AsbtFQwfwRuB8Xsxs8+oH4a5Rgz6SrhI2pWDlykC34H9JR9MGO4RpR+cZnV?=
 =?us-ascii?Q?rPJEwRpfLF7O9cGydgNl5n1qHgE7EIzxDiQkBfpQTPi78KbWN1VM0jjbPrgn?=
 =?us-ascii?Q?0Ye9HankYOVmC8Yj+Zf6rhZKMhMnwUSrqKI9jD44mDzVnqzoQ065HIG1UEz8?=
 =?us-ascii?Q?Ql8fomC/wLyvG4ORnzcyVCko18gY3yZamhmVbBKqNjP8HtVyE9dc26ihoezu?=
 =?us-ascii?Q?JYSWJub+P7cCz7gUQETZlrSSV0DnOQgEBTUaimdD8Lvx9A/frUwPXdaUo8VD?=
 =?us-ascii?Q?TY4QiOqDiHMLiwMrFw4l0bg6D5Ja2iJ+3E/PUUMCnQukgVsLGTfhgjvUn6Nw?=
 =?us-ascii?Q?n2CQA00s0WrtWJ2lMxvqrVNLNczs7fzVxoVrzrGHZfrxlOaay7+QgEymvsHd?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GD4AE/Dp0mn1VpXbM+ocqQFZCfO2KXePGjAdx/hHAglOjaxDcxNYT3B+f/dDRCgRWQBh4bwjXid6HKGwYSo4lWHj1AYXkbsjkVSADYAbLK2BD0so6z3jqPLv3rdxQVdjrhfyEHNy9fZk/GnS3bd5iAy7d5yJj8mW0G4pFPOTqaE2jow9GfFtsKO3+sRF+Orl8+lE45AGNdtzBMiIQr7ilYyMFncnymH6pjB11cJByqFsBg7JEFnFIRfhtaRewgaBZVYMt+1JmXLWn33A0CK/yO+0/i4WCG9dBEyUkc+TDRBXEhgQH4Bl7AwC7+8yjWwHyajeOfvzm/s4LDhrN7MZtZ5oxfJITkdUrBrcC/sVDCk8Z41Ynrfu4RoZmzuyrk55fP2v8YwXivoyKoleCbcKZ7Jg9M+XD5sL7YvsUE6R5+nYUHTo6z7/VCFgdIc+uQJw9w6orsmHwUdFakmmGwvEodkf0kxlTd32yPEpby19rV+TIOyY5Fb8iBt+ydVdJgtB762ZfIkvLITy8sQHE21XKanaLS0PBszproNL0pNT5D64Zw6+BJpnWwi6MWkcqXjmW924mnNfFlQOzOXX9LUwbVCKUPflXWzQ1n03j084OjU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3da1ca-b84e-4559-19fe-08dc86ffd5cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:54.3412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qWRHCG6zgBrsLOhnT5A42zRLlcS6FFNHwMMQ1Tvo3edKJuQNViGpjKWkl1c6IygDiT/6d4O05zECYsERT6X/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: 5_Uv58yUnDuYbH8vwW50e3ZOwXv-GluO
X-Proofpoint-GUID: 5_Uv58yUnDuYbH8vwW50e3ZOwXv-GluO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Support providing info on atomic write unit min and max for
 an inode. For simplicity, currently we limit the min at the FS block size,
 but a lower limit could be supported in future. This is required by iomap
 DIO. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFamL-000347-Pk
Subject: [f2fs-dev] [PATCH v4 20/22] xfs: Support atomic write for statx
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

Support providing info on atomic write unit min and max for an inode.

For simplicity, currently we limit the min at the FS block size, but a
lower limit could be supported in future. This is required by iomap
DIO.

The atomic write unit min and max is limited by the guaranteed extent
alignment for the inode.

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/xfs_iops.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index ff222827e550..d4c957793e07 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -563,6 +563,27 @@ xfs_stat_blksize(
 	return PAGE_SIZE;
 }
 
+static void
+xfs_get_atomic_write_attr(
+	struct xfs_inode	*ip,
+	unsigned int		*unit_min,
+	unsigned int		*unit_max)
+{
+	struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
+	struct xfs_mount	*mp = ip->i_mount;
+	struct xfs_sb		*sbp = &mp->m_sb;
+	unsigned int		extsz_bytes = XFS_FSB_TO_B(mp, ip->i_extsize);
+
+	if (!xfs_inode_has_atomicwrites(ip)) {
+		*unit_min = 0;
+		*unit_max = 0;
+		return;
+	}
+
+	*unit_min = sbp->sb_blocksize;
+	*unit_max = min(target->bt_bdev_awu_max, extsz_bytes);
+}
+
 STATIC int
 xfs_vn_getattr(
 	struct mnt_idmap	*idmap,
@@ -636,6 +657,13 @@ xfs_vn_getattr(
 			stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
 			stat->dio_offset_align = bdev_logical_block_size(bdev);
 		}
+		if (request_mask & STATX_WRITE_ATOMIC) {
+			unsigned int unit_min, unit_max;
+
+			xfs_get_atomic_write_attr(ip, &unit_min, &unit_max);
+			generic_fill_statx_atomic_writes(stat,
+				unit_min, unit_max);
+		}
 		fallthrough;
 	default:
 		stat->blksize = xfs_stat_blksize(ip);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
