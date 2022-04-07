Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B854F7315
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Apr 2022 05:20:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ncIgj-0007Df-3G; Thu, 07 Apr 2022 03:20:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <martin.petersen@oracle.com>)
 id 1ncIgi-0007DV-NW; Thu, 07 Apr 2022 03:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:In-Reply-To:Date:
 References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=; b=USuUInc+b3mtjUU9h3UG3uZJhx
 J1Lh8nUpo8dFNBj4WN4DeiF3SFPZiRoIZwbZU9ISn5KWtPg8ufxWv7m3nJQjXQsq3SMxFLKCCGzBo
 GxaTw3IO6JqtmD04MeiBl2yKNDWFbHYOHXGsrLU9aRzkfiIoA+M4/2O91d26T8ybIWaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:In-Reply-To:Date:References:Message-ID:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=; b=Kic3O+LsZpgfDuUY8zt+m6eZSH
 cGGyP5aqkrrzYhycmIj/Jrrcca+023xVFoRQLsqMhNCqECuF3D7UApNk0KMZ1O+urBLaDYW0VxzUA
 NjL8SkmQGi5AoKkWn7FlcPwgcOLDjOoKrLZyaBJ3hvwVCFrROuLUUDLE03IoGfa/HNPM=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncIgg-008EUN-OM; Thu, 07 Apr 2022 03:19:59 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2372avAf024455; 
 Thu, 7 Apr 2022 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=i5FMU2e8LcZtJnTYkwV6E8F1CmXHTpq432Z3UWXvhHLaaqaB1qLy6grINx2kAbYvfYer
 SN8+/U4jQlO+0tJQjU+RPhn990QZ+/KevL2vFVzK0vh6BtHNWBUaW3rP8TJIRu5RxPuv
 5q2FGGgnsw+BcWFF1Ul8Va26S+QruBwCczAAZMsHEiODM474wY/Lvn/qpjgofktuHQbB
 rQLE30y5Jj2kFRYSzXmvZ2Kccneww/aRTF0VL25SLIHueHK/uGvY09oouCorc2CXAmuQ
 F+gCGaE5kiQpxNaK/oVtrj9/VdkTmpTFEg/S0107fuEBTxgj0Cf4xnG1niTDoPoQ1Vjv dw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6f1tared-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:14:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23736QaM029516; Thu, 7 Apr 2022 03:14:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wqsj63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZejwOG2RyBy5APoCPpRRDnrxjPNsDEUuDWsaQSgIqhJOpZDVvU3rEeDbquZ28wabUwh/cVx2ULrFoV4jtiOLBcfskMdPsetzIKDFIVlHCEdLV9fsaUzmsTyBFICK4C0VFPa/cmC67dDZykbWIi5qJoPvTR6VQeqwpRqL4QPA4nQf8+j1Wcj/KH0HVxLLQzf9P6oTWhzSEfwn4KOQZa1Ix2TT3e9PiVsZwlovL1/q43oAeakpHZGVW4IqGYliLE3I/yMWFZrfiSgbzG/BGUKhKhbR4AXcLm598Cdzj6Mc+UXjWBQ+9UGH3Z60W2N/BaBe+kHBmFNzOrhqIzWzDeIShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=GEVUnwxEjR7Y9KPKNHK9EJliSrWYamRIZ73sHezNUx8fGSYFb5nzR2cBkYgRGnVUyoLwUN9KQFJxnxs/UZvO4PyVrOicG7IsS9rIMQwg75OgZei4vJ54Jj9DiVJ6oa6u2XBSTjRpnfHHOJ90sTfJiiD9Ny7ecfnXQ167vkEsU6A03LEmS+/+l4wrxjn8H7PW/jZ3WL2X4n+Eoq8kB4j+NCOVk9OADTL8WZL7ey1R5SN3t09O6u8W68yUN1qaCZSvua5HleYiQCV6FcM0krUbwxhqmmCkTMZpATS/c0BglOa1pX/K8KgoLXpVWZiaT8aHgFUHpEdRsRXXxMXfzbOtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=eAUxHlJe9dYjSx39nvRTqPMnjkc8ntSDSTlBA/YnG45Q86Uzz9W4anDsjmFExxI1AkFiVdGg9+f5xOEQGGa/wWlpAf4FhZuqEND5u7spmQS8Pk+9zF2P7zUDPeb0EJIuMcTWbIQd4f5YhGwoDsPmrUuRlVkXD23e+HEZ083OZy8=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DM6PR10MB2698.namprd10.prod.outlook.com (2603:10b6:5:b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 03:14:38 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:14:38 +0000
To: Christoph Hellwig <hch@lst.de>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1fsmpk2jw.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-4-hch@lst.de>
Date: Wed, 06 Apr 2022 23:14:35 -0400
In-Reply-To: <20220406060516.409838-4-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 6 Apr 2022 08:04:52 +0200")
X-ClientProxiedBy: DM6PR02CA0103.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::44) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd16d686-cc37-4a76-3d91-08da1844bfae
X-MS-TrafficTypeDiagnostic: DM6PR10MB2698:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB26985E3A4FCB8369FFD925C58EE69@DM6PR10MB2698.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWt/W6binc2eK/lECYWJ5MwOHdOLjtV+I63HmdvkMRPRB2htoEOcPRGRfBMW9tbPGBqlwpjpAkJkS41gbveQu/1ScCzlgh6qfX+5SUmKqzDqD9VCEurwxyL8ZDNRsdz7Dpk3QBzQh2SlIHtjGfQdTIdFlCS24a6OkGPBx1tSbQMGWlo+oMG+mJyyP90zI5KHK6+ICjV/1NE32IA8lIUzdKd2C502SWwtmefP0PT6F1HTtPFJYADznODzb1W9VN4bDPmdWuMeuD1jiGv+fTYDvXhGCSj308rqAwwzVVW9OdzGECRPxQ5aIjcCMSahoL9olDxMGzyrRM/8lHzaucrBhvV3NDQ1CMr6SMrzXb6fdYEDgt9/G5LqWRhdPIcNm226/JikUF5Nyn1bD14RhA6VSTmuILGHdcgAtVxRKnBDqWUDTQbwfZlFL9V7k2ssGgxHy4cR/k1cgqKf314TPQxIHL+KP0TLYM1MCYTgKqEAP+H7T26foljEU/ExTs8iuJ8lpIvqL1uZLZDefvYp7Nb+th6wIJtUXdnHcTL07mRkkGzPAA6VOo66s2Fa7rfuatRkW+KnPCZHskImIZcvDZGmNzG+W08C+CM6/1iZcDOS8U8RKtYpTaIs++MNs+syELQw6R/pto2AZPDxz6dSuzvVFt28XRVCfsI0SJSvgbhKdK9Cm0osZW5O2c+hf1fM6QCEexoFmHfDTRVUNFmBW1Acvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(38100700002)(38350700002)(86362001)(83380400001)(6512007)(558084003)(6916009)(186003)(508600001)(7416002)(2906002)(36916002)(8936002)(6666004)(6486002)(26005)(5660300002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0lCHWB5CBAfwxdmlYZdoZWcbAIAxhJ3LODYJThGmg7jDyutQne0bNBmdyDur?=
 =?us-ascii?Q?ByoGymw/Mop0IlkkOV+oyCY7nLNjITJCUSg9MCdcaq5JYJP24EqvYPFdX2rT?=
 =?us-ascii?Q?EpB4c5NM1fjYkwTZph+pufL8FGWp74GdC+JL5lX5qfhCMUSsxav9iHP4vAVx?=
 =?us-ascii?Q?YPHuc3hMHDhBFgSS9Uv7R4Nhr2wMr1sA8n/EiiJSjGEiEY76rJnCaI5w4fmh?=
 =?us-ascii?Q?q9tpd8DGH4QihSpZgc9issz6MhKD66MCp6iUv6aHIVCBvVxO/0JMonYZSYKl?=
 =?us-ascii?Q?enTfd9Zt7rKdhtOXydajK+3LT/QeppMoj4yefqPJQI3VFi3Rlzwy1E/Rvtwr?=
 =?us-ascii?Q?ee2wlH6PQY0/aM0wa5AAZklIXcDd8mCuuqzkpRTB5yI+iLslVVTR9uBhpt2p?=
 =?us-ascii?Q?JKf1DuCnMhXJcSAB5KsFDWqN/y0ddIUIQ8d+63k6nnPwDAm/wGesJIyzZNAU?=
 =?us-ascii?Q?gDu10O+HzN9khXj/iHdhVTB0iVmtP800x1T2SfH/qUbhyQyAhcLlQFqlizLE?=
 =?us-ascii?Q?3V/cg8VXQZ6p1ERUkv2z7PwmZ9rEBHnUjyvWa5u8btsWLsa6ebMCRDNW7it4?=
 =?us-ascii?Q?/BN3htjhk3MrHj4pHfYaAb2HwNCQRjrjXyc2pUBiiupu3XCJFC/vQYF79Xap?=
 =?us-ascii?Q?dhpiqCwmEsmHnXbhHMURJhmFqpFjGQM0rmE7VYtaS1azRH/zH2TqK8HW8pwz?=
 =?us-ascii?Q?TT/eH5/bYBYmb7JWQZn1K68lBk3v9ggLRJEPCM05Jk8LGsF5KpcGNVE4pgKg?=
 =?us-ascii?Q?4wU/icVJyufC99p/FPHbL+NihjwQjGYcPWFgcsisxTrRrMb2cGhmKTGbT6PW?=
 =?us-ascii?Q?RfNpNHvqtrgo3ANfvyR9Xp5jxXKUwch60zmR9Uk5vgfncScjbcjQ4HYYlUFd?=
 =?us-ascii?Q?vFddJTWKXkIkugR0EPcmXoyOvGme2SVnwY+Ib4pH00P8ZGZeIuH99iM6g/to?=
 =?us-ascii?Q?TFeJTH+Td/paquVRUEJuE7J0yMRrdV/Sax5+EtDFe98NIG+whyI/6Bj1pNqZ?=
 =?us-ascii?Q?wOxPRR6nGmWycCS0nKv9YSiVjwgtRnOxIg3NK+XcPi1oBfVz/TpbxEX4/kMg?=
 =?us-ascii?Q?m/AwBLjNevFMvwTFqmi23A5aK3TZhSU9TnAL3af9msEWxUzOH6FpqZqVvp8H?=
 =?us-ascii?Q?4Js9ZlIyr3E4FnvS9OguYjqKW5DJEs3mb/zBh97Dcj5LFyioMsPh/8mGnSYU?=
 =?us-ascii?Q?84UqYKNe5gS67rR4fEVKDrxZhu+GK1i3TNzQt/S+aCAyI4U+BA8muQftrtdb?=
 =?us-ascii?Q?hBWSXul3WwBbd16Hn/0meDVY7qCPBaaCbFxY47FSll6l3IOEUnLLT8iE3Wy1?=
 =?us-ascii?Q?gxVqtOXX1j27wClIJNcMn0ouYT/Q1ExScWcQUN4bzUk1qFHuu5M09nbQ3qa5?=
 =?us-ascii?Q?gglYD+TRIFgjl1PWuqnOT5xcm6L9/0iOYJZNoNwHYEAEB/Udrxiyea4lpBjV?=
 =?us-ascii?Q?aGMWobILBsEOQ8iI9tmBsMc8xwMkSRAsF1rgcFqTYWuR6TVkwV9h3cACztyj?=
 =?us-ascii?Q?n0v+y0ZGv+/DZqRDh8xCA2h3FYBxucCT6YVND0UGYifN2k1Vx00zY5fd6a8t?=
 =?us-ascii?Q?MjiolsTl/hoVVWbWtxtLdTlwrnjF+KNM0bgPhRpARfUs6Rtrb9rwaAJ38xl7?=
 =?us-ascii?Q?yF+BsrT69GYVCe3qoe0SHsjokAv9TmjFF4WJO2GFjaycWThlGLk1SuEx7ER9?=
 =?us-ascii?Q?yyg+pneArLHJOfX8+vAxAQNmqtL8Ut+fvQAF7I7RALWEuVD+PVU9mY0qqkS5?=
 =?us-ascii?Q?zJyf1w3vMz9oPxOtwim/64f7os3CZL8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd16d686-cc37-4a76-3d91-08da1844bfae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:14:38.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa7XDsF2TUSmbTPOLGTD/Asj3pN0wQx3E3uvOsKaxFNEGn5p6T6o4mitNxIXls+I9gNOdTohIBjq9Or2InsQZNGmqeEh2TEB3f7kd9F/mXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2698
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=949 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070016
X-Proofpoint-ORIG-GUID: mizjd7EMRmxU8Dxf6z3sZxhlMV4xX3Ds
X-Proofpoint-GUID: mizjd7EMRmxU8Dxf6z3sZxhlMV4xX3Ds
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christoph, > Use the proper bdev_discard_alignment helper
 that accounts for partition > offsets. Reviewed-by: Martin K. Petersen
 <martin.petersen@oracle.com>
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.165.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncIgg-008EUN-OM
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 03/27] target: fix discard
 alignment on partitions
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
 linux-um@lists.infradead.org, nbd@other.debian.org, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, ceph-devel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Christoph,

> Use the proper bdev_discard_alignment helper that accounts for partition
> offsets.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
