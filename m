Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 721504F7286
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:07:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncIUf-0005fa-WC; Thu, 07 Apr 2022 03:07:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncIUd-0005fL-Jl; Thu, 07 Apr 2022 03:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3x6P1kenH1Hm7uyRz1muMBaUZJEydwA1QWe1BNT6dc=; b=kCaLzs8+FoA/JXakuxpD5MePEU
 wXtD+UwBza+Dnr4M/iPBVxoTSW84bRCqwGVrTk0nYaEp+I/r9WD8orXxZBa8GCdZDlJDpLLVlOqhm
 ZJSsRHgR5TzF4RtEWg1J38E7eM+FWufckTNdmoezgNUjdBBK3fUR3Eu1JDV58lFHo7Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3x6P1kenH1Hm7uyRz1muMBaUZJEydwA1QWe1BNT6dc=; b=LeyClNXPBNNRqU53KwOc8cDzcU
 zWxFoQXXD8rXpOssfkMfx+F34M1g7VJB4GFJXFNtpa3SRUinwCXS2UsjIzWNOJJK8EUreNgXo5Vzy
 67XsK65gi0bcI+Y+48AO5I7CbhysjU5NxYeYJ0r1Tc8LBPKYIDvvL17D37DdaPVSpQZo=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncIUa-0004kO-N3; Thu, 07 Apr 2022 03:07:29 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2372POUT012451; 
 Thu, 7 Apr 2022 03:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=F3x6P1kenH1Hm7uyRz1muMBaUZJEydwA1QWe1BNT6dc=;
 b=cfJmdlT0b28dv1IZ57X77wNW/0fqQIlICfwO+w21wI/1c0lHpUBi2zuV+EXoHxuLCx9+
 gzqua7rNKLsJh19hOfS/0zBGvCfkCYy2lrweCkMd8JtuJNhLctuWbAoww6EZ2zply3JC
 ZIqbDi1nv88R8J2m5pMK46KWih6U/y6utEmvmiAxqETsgHdTNSMNSF/VAFFXPW5xmymY
 5RqSgSb60kNgdK+p1lDvCcexMmB0yW/JWqgG+vd6dul2009SoBlCouO+lunuW/I1DRXe
 dOiSjL78iwHW23gE+ZvYCuXRRyi57NDTPg+ynkS2WqJlrCVV/u5tO5CQddADUltB1K3M dg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6cwcja1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:07:13 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23736Qew029514; Thu, 7 Apr 2022 03:07:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wqsegs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrCvlE1NBFTDUpegOdY5bGDTCwM0CCJGtKQtelIaqMpJ7L/nT0Hkc6aFsUcNugG9Vivl7PUD7CAlXVzVK4GL5Q7XkugvuRjZnJuICNnwHdS/0VrxpW1OA+Xv7SIk0GztXBIT8/fPge4xLXBV228hOo71QhAQnwqUC3U5/0pbFLs1bUVrmt5WIJUL5D/HLF3b7LLXy/iVp0rDOPEf6fw3BdmcoG+0GG/PJ2pu/8NEEHps2MJl3fOhwT2dBsEQ6CBh7fw7po9yq1WAz9Of96lC+hrn8jkLM5mojNH0C51Iy000yFb7EiSNlzf94ez3zRxtTsNllu5Sg1ZrPshQXIUNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3x6P1kenH1Hm7uyRz1muMBaUZJEydwA1QWe1BNT6dc=;
 b=iLS/RB2jzMUtJGoaERI3S9n4osy+zSxkMPBizCQNtbcjjVn3+vM/eHQKiSM4kY/o2l8l7ZMSUCfU+EsQvwtZeu7OFFt0twT1+qhhKMHp5oxA4BOkgfHl2wUa1wX+SSltp6NjC2kGn/eUGdKzEmCIe9U+DvUpBCt7FaXjpWuWwoPucI8HHji0BikNynM3y4ZsjgFLFqRgm80zYOxu/HXnG14EkjIM9uS6w2SYYkopRZiSX0yt7xBPg6x0HFdioSTK9NrBxYJyu+zvBCXCzy2HQ5QFx/IB9H1ZeXeGwN9Af/AhWvzxmTgH5UARs5ts8WdgypyEMjbG+6wC407c0+r7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3x6P1kenH1Hm7uyRz1muMBaUZJEydwA1QWe1BNT6dc=;
 b=N2cSI0L09BukAAC2ZOhx8qz0NNNe89edzYFU8Lh//FiCv7KyzXtkTUF06NH7q3cG/ftto95agMLQfKat2F8KX1qQeVJcG6DjvXQsplX2Xi3h+93pjoauE8hqRXxIIDcnc980ndgEcHjUtm/2hTkzz81u8UYXtss6nYLKbcgIdLw=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CY4PR10MB1590.namprd10.prod.outlook.com (2603:10b6:903:2c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 03:07:10 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:07:10 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1lewhk2wm.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-3-hch@lst.de>
Date: Wed, 06 Apr 2022 23:07:07 -0400
In-Reply-To: <20220406060516.409838-3-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 6 Apr 2022 08:04:51 +0200")
X-ClientProxiedBy: SN4PR0501CA0036.namprd05.prod.outlook.com
 (2603:10b6:803:40::49) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0159823a-59ea-43a5-79e8-08da1843b492
X-MS-TrafficTypeDiagnostic: CY4PR10MB1590:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB15908E13CAB5A6BA15CA19858EE69@CY4PR10MB1590.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PA2Z3zvnaginXNr0BRdbzRmx4+M6QabC9KKOk44bWlwv1FaywbY9U4dnphNSSK+v/7CcGP9sv89lLuxFchBSBrN6REJmV/ST7yYZCg2v0w3RdYrZCj7jqemUbzytCBhN6mRJZMTJA63mVdBaWPg3lmS5wtA18HWw5+kQMTN0C1rB3N+WbNN7WYjHIkuhxeGwkEhee2LAXUBtG40t3Tw0f9X1R1JebCAVWXvms0sQCJ3aK76BAW72/uw4c9Aveuj6fIDIJVa7b2BWAS+HjPxufBSdGP9hORIvYgJcOJ5161LkSyDMnvsfn5oEjoYLM8IVR+oRUU8v16Tw4rpgAhbczXdHXNfeIMvBC0hrEWtKNbHzrnnvRSGwlxsjinoXy9uAp1h+jeqtkYm1CQsWrwmDwmF7VK5IvwdjWHI1vTOeYAu2OZ0XPqivDhux2S57H5xKVHS/yYWohiQEINSbOuMWfYOCwKYt4omyU9tMD2sIOyEXuw1lIseDTeloFGqw66QuqvZmzzdWZtwjZGL5s46SEY+UWZm6fwfoYsp8DAw89XS+fMKOjC/jHZZMZgiqujuRzczDpLT9EZQjlI1eMvAiMa2psQsodwI8iZ5qSF9kXjjcBvmjrrNrVBqPgaF6cY2Jv8kRhp+rH7g9xKrYX1151xgocKc3xQjpfBM4a1Hr3jXqVThJpZR8CuCeDk4u9e+HKtBgpY1eW9JFbgJKLrGPzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(66476007)(7416002)(5660300002)(4326008)(66946007)(66556008)(8676002)(8936002)(6486002)(38350700002)(26005)(38100700002)(508600001)(186003)(316002)(6666004)(86362001)(2906002)(36916002)(558084003)(6506007)(52116002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jOSGYtXx9bA9WZieGCt/o3XE6/UbuWTzsPziP7YgPFtz5rxZj/YbslYIg3d?=
 =?us-ascii?Q?IfID32//vXGCsYbZ93N7wfpG2KUECicS+tuke8qmAFSJRZodMYV3tWLwqFUY?=
 =?us-ascii?Q?wWlanGPpN2/59tfDHEEIGuyAAyNMFWXbVir/PJ4+YRSpfa8rV/V1OZDhtyOB?=
 =?us-ascii?Q?+LddzHBmYUm8LOcJcBJD3WFSD0ZjU2BtERIjTFpoZusVNzeGa5OGgs54YbUC?=
 =?us-ascii?Q?aqJaWpI2w16X6FDC0X98k+0I/lNyxwNYtk2dcixdxFO7/3S403PFtlDgZkMh?=
 =?us-ascii?Q?AV9P5vJjQXRZTLHyygghsV/gmc3V3sxf9BPtS+9q4GBAyFHLE1liJ7hgve1R?=
 =?us-ascii?Q?yHYQD5ftoCrW5zhGK08+N0iBCStRpijKetnXcZ0dZ0e5vmVNl2HO0TY8UWO0?=
 =?us-ascii?Q?yxBK43BmxuVLOEeQxvEdEXf2ocA5NLUH9Sx1ndRD9DwBN7gGM4aP37pRuu5I?=
 =?us-ascii?Q?JtBBLLZVzRS7DsC1Iq6i2xAN/eIBCunuplqn4crvq7Q6OtrvHzAmknjKxL/L?=
 =?us-ascii?Q?mynJcV+cHBqiV/ItBSDHCYfG8dtK1mONjx85/pncIUyxDa0yAJ6t8KJgavUL?=
 =?us-ascii?Q?jsk9wqjJoj2Fu925tNkEpWP673qdG1V7oEA+WxeOnp/TeQBRWbYBHXM6bTw6?=
 =?us-ascii?Q?PoJ8EDlcOZ0Fn4gFcRnsp3P/R/2Tr1qNa8pC/2QDYuCjJaCXn08w2ERmni14?=
 =?us-ascii?Q?IDqFkst+HaZMKtCc5ZKzvHV80pshcOIywm5y2ad9Nfbew48PgZSi8Uo5ZdZ0?=
 =?us-ascii?Q?jee5l2757c201u4lUc1/7xU0z/jG8MEMRpzqG6ugyOmaJ7TJj7HGIqaExbe5?=
 =?us-ascii?Q?2YMmQ2oEeBtspequlBRjY3HTiljM4vKgzgu84M+vFedSMQ+jq4ShumsFnPIM?=
 =?us-ascii?Q?GdYdS9GWwRhCce7HPlrg3ZSHNfvbO9/1bnOQD0FYxXD7QkgBayEiKxWYrej/?=
 =?us-ascii?Q?TwDGp9anU/x4IEY8XrtyUGOXTkxBRTpXwYOCLBu7jOgmVBi+k6suYMxP64hz?=
 =?us-ascii?Q?hXRPRbAEmg87imQn4FDEokjeIX58Qz1feQt06RPF9Sn84dnKEfPAYJV8IRys?=
 =?us-ascii?Q?znf/M26t5kZMDaBZ3x7VHmSmli0jsmtJJnPL7mvF8Mf3WkVScrkWW5i5ptrO?=
 =?us-ascii?Q?2Cl9cc1gPh7lPUwXnoc+NEphMM7+oprjdOgQcI24ZOUbuHwbX1HCPbSyoy6C?=
 =?us-ascii?Q?3IyUrtdTqIchGflbVd0Xww0f6+rzBc0rF9GpbFlnLwq/BX2X7WsGrxDd5XYq?=
 =?us-ascii?Q?ygQgR5ruLhmz+wpsasTpt64MQ0Ic4UgIzkIxyszl9TxR9FfxGoFSXrQUVHLL?=
 =?us-ascii?Q?RKJntEzbhVP/6h/R8pROoYJUkn+bmNbgh9K137PFH2mWYuqI8pZq5KzX/5+O?=
 =?us-ascii?Q?hYv4LhXz6EpYWMiifAreccy8vZvNK5wRiT63dnJhzMmnPBwAMjGwmlwOSr1Y?=
 =?us-ascii?Q?avctRXJWD23qeM5F//b36pFJZH6tMYKrDHT3AdfU0nPnL5xhjhPaukeGfoVT?=
 =?us-ascii?Q?x1vc/7/NVk2g658sDHE94Iwy5h6aa0mLPMaTL66FG+AoorGpG7MuthEbhK6t?=
 =?us-ascii?Q?nj9WCOSCYfuVTHwjwWolZsS9zxyBzzdPzsz7G9Pr0HzjO6d0DHxt57zsYTOy?=
 =?us-ascii?Q?sZqifPtp8ZsTptLFHA2ho5qUK8qmJR098HdKqXKdNkRdK4kFeRwg2fmUpO1H?=
 =?us-ascii?Q?WX/OL3eo90YkrbLdD/iCVKGkjgeZ8c14I2N7/ckBwzeFCgrrHxuG0DZkkl22?=
 =?us-ascii?Q?PhN/NP/Qw+ifIeAZLtiYz5N+Dygw+k0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0159823a-59ea-43a5-79e8-08da1843b492
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:07:09.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kG9UjttGiRw3JVf+jwyI08QGAOc5aSrKx67j79jMLLO3Ff/ZV9VhprSYJVdNJOr8vqf7ZUAqbYsGc8mjgfl0GBN0niA5yaYJtcy5AtXhsag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1590
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=849 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070016
X-Proofpoint-ORIG-GUID: YVpZ40QVgdXlllEflIKiZiI8VDmJlUra
X-Proofpoint-GUID: YVpZ40QVgdXlllEflIKiZiI8VDmJlUra
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > The target code is a consumer of the block layer
 and should generally > work on struct block_device. Reviewed-by: Martin K.
 Petersen <martin.petersen@oracle.com> 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ncIUa-0004kO-N3
Subject: Re: [f2fs-dev] [PATCH 02/27] target: pass a block_device to
 target_configure_unmap_from_queue
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
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Christoph,

> The target code is a consumer of the block layer and should generally
> work on struct block_device.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
