Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60859546F70
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 23:56:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzmce-0001S2-Gk; Fri, 10 Jun 2022 21:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mike.kravetz@oracle.com>) id 1nzmcd-0001Rw-IV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 21:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cig8b+8Fcts7tPleLoHcBBCVvhjVSl8maOTJHh2wqmM=; b=UJfUhDb6NEODZ70vnm3oAw6XFh
 uM4ifzxEqIV8stWwELsZScn8OlrZzRKTE0uVEBD8mHAy00QNi71sRpb2n0LA74kKbCPWW0Zn/KdRK
 b2aN9X4w0r3F5ZG92kW8xIGfTHU42maqt/v3rLXQdwBMEE2v5Ucfeh/ptM1F9mWz4M1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cig8b+8Fcts7tPleLoHcBBCVvhjVSl8maOTJHh2wqmM=; b=OYAiznR79cm3aVh/YPLiOUko3Y
 QWPxAeHde/3sViOBYQ3XMwLPNjH7g82V0UqlTvh9mpGx6gRHyJ0BqDwF6IuDKWXITzS+qYrL1tYDq
 19/S6JULz0RvtOGsrM0EvbQsr4pT7+HN26eUF/2mE0j6qCkHbFDC8sm6iQU+LAni0t4I=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzmcO-00058l-R1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 21:56:50 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AK4ku9021892;
 Fri, 10 Jun 2022 21:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cig8b+8Fcts7tPleLoHcBBCVvhjVSl8maOTJHh2wqmM=;
 b=rtue346rIjgYL8zwsPFXQ/v/JyxBkXc7lyalPS/zw2F6ZcTNDBE8g/NGov4dcMgjEW7L
 qL1ryvK+1cvjGjwMhL7vLlSaNqxjROiIcrL+NgLlWlSWfn/MGpDNc9K5V48AigSVCCPy
 KhO1w+RCiCgXoiQ3TEOt50uYVvhbwa3URUro8F6wVGuvAAo87JX8oJ4IvJPKkUJQ6bLI
 Wnnvzh2gZNKh4ydWq0fbM0iuzEN1lDkhelSHX9GwzyUMKtu2PN4SxTg3bwUEeKNFGNSX
 ke/pIXbLVe9Rm2E3j6534CfN6YjUE3sfXxabzgKSaIzfswmjCHB8200GZ7DCXPOm3a9u 1g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxn4mbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 21:56:11 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25ALUlIO040405; Fri, 10 Jun 2022 21:56:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6jg9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 21:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G05CWVc5UOjDsZMrTBoDaQ1BzgupGLSaqkpOl7WiV1ltfaXxaWw6QQ0oy58xuaD+D3VaVuVGFvO4bzdVqtw0509wA2+U5RkNffTCnj9AS6UkeGEH9eLhCk2Xn+O1JBTHKct6FjeqT+mf9WqPr6LKfGjRQTjnq8/zwXkBBg3AnA2nKA2rxYRASI5Q+GSIsJX4vwEcdnHsx7lDoyuTIiYs7bk/5I0cFhfUPNb0sv0dPPSrtxFm2jdLUZSXc6bm9NLX+fJTSUR6WACOhAqjga+cC8CiuLTdAG30FLIcwS/Fl+ABmwQ7glHWOBCS41DzBL3dMlz11DyVzerM2EkZuLnA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cig8b+8Fcts7tPleLoHcBBCVvhjVSl8maOTJHh2wqmM=;
 b=ZBj8SjRAbgYR7CebBs22bYmZVb+R0GqCQle1WCrI/iYp8FmGIdugKIHL64D7kiN6ixT8C5hHuJzHeoyp8rsuPPG5eowUqsorO/rnragLPl29YvBFHdm2j1CbrpQqGVjgHJs7OdVbDEdiTkc5wSUsYpMCqfjWBH2ra12IIUzuCM9XfOkH1uYGgDEj31ip59rpNmqF0GhzlWOP58O5Hd5JHm+98OqXZxvjBsRg45TN2iheQRMccC5FNXbmo+cFs1mbdBCDXPemuaoFo6Mj99pcnErsRYOGxMYFROKlMmTllEx5S5GMC7iVduEAFtzHZWa9MgbsdZpuz0NtRfdRvH/w4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cig8b+8Fcts7tPleLoHcBBCVvhjVSl8maOTJHh2wqmM=;
 b=T8CH7oX/j0AaYvjDSqCgciSkT6W5MunMYiX31kg/2DRYpAvhYS+cnOUuevh+ArAIsVpgSFA4gBB/xN3AK5elY3Yd7wyEPoIPPAduCfE8zVoOEXIFf1jZxcOy1cK5anmOL0DJvb6rJs4A6x57pT1UoX8+jumFvVtIXlzJM6QOFW4=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MW5PR10MB5668.namprd10.prod.outlook.com (2603:10b6:303:1a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 10 Jun
 2022 21:56:07 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 21:56:07 +0000
Message-ID: <6fc6e9de-39c2-3244-ef92-a1de0d390889@oracle.com>
Date: Fri, 10 Jun 2022 14:56:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>
References: <20220605193854.2371230-7-willy@infradead.org>
 <20220610155205.3111213-1-sumanthk@linux.ibm.com>
 <YqO08Dsq8ZcAcWDQ@casper.infradead.org>
From: Mike Kravetz <mike.kravetz@oracle.com>
In-Reply-To: <YqO08Dsq8ZcAcWDQ@casper.infradead.org>
X-ClientProxiedBy: MW2PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:302:1::25) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 327ebf7d-ed93-4d30-0ebd-08da4b2c05c4
X-MS-TrafficTypeDiagnostic: MW5PR10MB5668:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB56680E7BFB0165E67CE95AFAE2A69@MW5PR10MB5668.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5L205H9hL4kiBZ3ny2cSQuDTCgRel4/8MX/kFEWPLvusn1PiTkuX3ktAGttKPgJQZeMouH24KIKYrRkSEnqP2OmV1X6koW8RJEog5gAY7NMPRjo624SunAA6J8x/K4VzVn1DxRfqa9FrCGYxaheTQCcAerNqygu7XYWxkqP7ENKAr5yxrJWUJNtMx6hJvMgAWIDE5aGtn9Z9DRuPY7m5u5qX8KHyrJMPAPxE0wR/vTwwohHTersXDe1ItQbUdEWbOBS24Xg1gh0gNT+tsdDIVZUk5X/n4uium99buMaeQsBYgrrlja1AWDGyOuqLou+4z/xBBAGLhql3XMfsnmjzowJ8556mOgAqXgpdSN/4ATOsFsYENklMWky50jTLjBChbskgegWgZoMS95ZFaCYgyM90PWbE/sMi/xOjHPFvanQvcA6AAOlQWsYgMMf8DkI5swE6VLVBOngLDDDiXp1S9+vgQOio+pk84Nn/M9qAPXrqIWlu5mdGFlM2IrhpeBLunIfNX0AGXi/RiY8hd2alUBWcdXDbI5DEt4vCkfZRFz8JAJKIotmjGrQbc+QXXtZIAH8WcnxcakaFmpeuJ2XJL30xhiuzMWY9ylvZtskU1fmLliIZ76Op68Nqv+RDLBlJ2brUouBjQbrU9udZvwn1hWKqkCHePePmuCc75l8JAvBwqMaqLyv9fFBkjANqWRPpHhH1AkDkb9GQPt7clxm+GoGGyXS3lQQkNC2Cw9R3A1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(86362001)(31686004)(36756003)(4326008)(5660300002)(66946007)(4744005)(8936002)(7416002)(44832011)(110136005)(6486002)(2906002)(66556008)(66476007)(316002)(508600001)(26005)(2616005)(6512007)(31696002)(186003)(53546011)(6506007)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzA1NDdXRFlQNjFhVXZ5emRTYWxTVDhsL3N5ek9mbUh5QkFoRmdvcjBsaEhw?=
 =?utf-8?B?SDI4Q2tkcU9ldEx5bVNRMDhpenVYSmovaWVGSFpZYTRlbDZxSjdmb3FRZncv?=
 =?utf-8?B?OUZIMXNsbTl4QmNoQzYvWEVYMzh4MzVEdGxnVHRaL0l6UE5xRGpYb2I5ZU1p?=
 =?utf-8?B?S3BqZHJrMGFNaEdycXo1aklJVHFUN21BRFJpTzVKK1N3OEgreDA1K0ViaVFk?=
 =?utf-8?B?Zm9KY3ZCWWdKdW1XYXVKaXhWamlqbGJaNGFQTXdEOGg4K0hmMzhyNVNvQ1lw?=
 =?utf-8?B?R3hDb3dXUkdLMjJURDlBRGZDZWxvV1Z1bFNTd1NScGRIVUtOcVVOSnY5Ukdw?=
 =?utf-8?B?VkhZMnRGYjF0eXZlQndkVXdWMTAwRWNjMVBHdDBEd1NObGNRUWd4ZENzeXhS?=
 =?utf-8?B?RThFZjBQQnpwU2lXYm9Eb0hUc2JiN09weHlVd282dHVRRzNJMFhlYmNrMlBU?=
 =?utf-8?B?OTRHNW1UalI1ZzY4VXZLaVljNnEyZkRFUFZUQ2g4NlVsOTlWVDUvS0R3bTFD?=
 =?utf-8?B?c3JxakR3SHJSMWtqSkJDU1pDWklOdDBCaWs1QVoyM3JJNmRKZWJ2MytoblMr?=
 =?utf-8?B?aWhhZEhDejVrU2FtZUsxNUE5MzRXdW5TQWd6SkM0aFFURzNyb0ZkSm84N1lB?=
 =?utf-8?B?b3h2VHpoemFOaU1obW5xSTJUSzBXa2xPc0lIMzlCOVQxYysvNUd4dVZNdXhX?=
 =?utf-8?B?OFZkTndIUCtyL21rSEVnZmppV1IwV3RxR3ZxUzVOSWlwK0N1VlIxYmRkOTIr?=
 =?utf-8?B?czlUQ0hwZ3RnZ3l6UFlQblF4YjRvNlRHTW1Nd0lYdE12aHNBWkhwK2lRUXI2?=
 =?utf-8?B?azlwQXdLRnFYdUxqbTVEdWJZc0t2UE05aTBjczBqaVdmSzlpVmpzYjBEcU1O?=
 =?utf-8?B?Wk1nMVhUeEw1Z3Y1YnJERU9ucjJHZUJ1WXdxV1hKVURmZ1ZOMGVVMEZIVW5r?=
 =?utf-8?B?RjNOVGZvSktDT0Q4OEI4MGlCanJhUVRUQXdMY0R4K1piZWRxUEZEL2Zsbm1F?=
 =?utf-8?B?Z09TTnhLNVUxMkpvTStIZVpEZG1DZCs1MytYQmVpUFp4TzFTZkJEM25ZblZS?=
 =?utf-8?B?TndxelQxQ2RIT1VOeEtOcnlVVkk1NG1JRlJFTnpEcEhkTHR1TDJYWWJPRlBN?=
 =?utf-8?B?NVlkY1A4bnBaditCVFhnOEpFZ0U3ZWJkMGt0Q29zUThBdGVXdHg2TndQVHIx?=
 =?utf-8?B?VjhUSUxVRFJvY0Q2ejI4bVJxLzNaY1dCd3NuYjJ6UEZOZGs5Mjc0cXZzVzdM?=
 =?utf-8?B?NTUyTS9IelZ2REhrR3FOVW8wM0tXRzlnUllIZFM1azhqV1dkQURLUi92Umcv?=
 =?utf-8?B?YlJ0MGhOM2N3SWdXOERPdy9XcEhXaGg5eXJMMVVwcW05QmtzVmxleFo3K2JM?=
 =?utf-8?B?ak9kM1dyR2JBRmpoOW91eUZPZUtvSlRBNjhYZmdFYnpmUVl2cDFOUkZGdUc2?=
 =?utf-8?B?ZTQ2andaMWg1a1JBRzdLOTkzY2lvOEluUG5RcjJPcG5vMEIyYWtBMkNFM25q?=
 =?utf-8?B?aFp5dmhCMDdHcUZRUjNOdGYzYTFHZ2F4Ti90RGx6UGdhcjdzd2lybVN6Z1FV?=
 =?utf-8?B?K1FFYUVkWjl3VHNVWGM4RDQrYlBFUlREaDdaSnRxODB5UkNxYXAyK0l3QWNj?=
 =?utf-8?B?MDh5VEd6dk1PNTRFdzlWQ1VnT1B6WXF6VEJ1MjZBNld3L1l1OE91Yk5TVjFm?=
 =?utf-8?B?Z3BnMGVXekJBMVhuN1hNMVFtcllWR0dJZzlpam9CR1JFbzhoaktJRnBZSjNX?=
 =?utf-8?B?VWF2MGtDbTIzaG5JVUVYNEUwVWVlblpRSGE3ZDhJQllpTnpOakFTYVFDZUpT?=
 =?utf-8?B?NU9yWE5Nd0phc2hhK0Ftak1weDZKT3VTdlVrUS82UTJwd0dKR3ZJZDY0OVNN?=
 =?utf-8?B?K0VlTGZBemp0SVdWRjZYL0xEZWxseGFBUnJGRDJVcGpiRU9mV3dzczRGeFRY?=
 =?utf-8?B?NEFGUlpOQ3RpSzBWbC96N0VOWkRCbjBQS1ZnbWZFOVdJQUtWS2VqVENtV0Rp?=
 =?utf-8?B?eEoycFhrYWx2blYxeEdkbVFIL1lSQVFhcDhTdk5LS3d6UFluNEU3TTdueEpn?=
 =?utf-8?B?YS8xTFdVVkk2OGVvZ0c2VGtkS3pHSGRRU1lRVkRvazZuM0V1RGlPSFlQSVpy?=
 =?utf-8?B?RFdmN3cyeGsyWjUzMWNDY3FKc2JQb1M1eEJXK3FkZFYrUGdZL0ptNFRiUHMz?=
 =?utf-8?B?elU2NGRqOTNuN0lXVmpLTmNFdzRZWWdEOXgyNzBOMVpGeHQvbnpBNU81TUwy?=
 =?utf-8?B?dXFwclJFSm5GdTNleUhxNDdEdEZrYWwvNHZwcTlxbm8zMExFTTRNUjBXaTlq?=
 =?utf-8?B?dmpRRko5SlBTMk14VmFMOE5ZZTlUYUl6WjNzc3lpdlZOVHNKbVZhZ25XYU5i?=
 =?utf-8?Q?EjzCZM4+hQR1n79o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327ebf7d-ed93-4d30-0ebd-08da4b2c05c4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 21:56:07.6381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7KaeIfQ3tw8uMIxYTPs1hiGQemqjjr+i7r8IyA0PxjB7guaxDBwuBrMz35we8qWg0IljdgcyXhebFCrtxB5gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5668
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_09:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100082
X-Proofpoint-GUID: Joi0uQ3HBq_n5Yq9D5Fq3t3mGsz-cFZR
X-Proofpoint-ORIG-GUID: Joi0uQ3HBq_n5Yq9D5Fq3t3mGsz-cFZR
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/10/22 14:17, Matthew Wilcox wrote: > On Fri, Jun 10,
 2022 at 05:52:05PM +0200, Sumanth Korikkar wrote: >> To reproduce: >> * clone
 libhugetlbfs: >> * Execute, PATH=$PATH:"obj64/" LD_LIBRARY_PATH= [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nzmcO-00058l-R1
Subject: Re: [f2fs-dev] [PATCH 06/10] hugetlbfs: Convert
 remove_inode_hugepages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, gor@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 gerald.schaefer@linux.ibm.com, linux-ext4@vger.kernel.org,
 agordeev@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/10/22 14:17, Matthew Wilcox wrote:
> On Fri, Jun 10, 2022 at 05:52:05PM +0200, Sumanth Korikkar wrote:
>> To reproduce:
>> * clone libhugetlbfs:
>> * Execute, PATH=$PATH:"obj64/" LD_LIBRARY_PATH=../obj64/ alloc-instantiate-race shared
> 
> ... it's a lot harder to set up hugetlb than that ...
> 
> anyway, i figured it out without being able to run the reproducer.
> 
> Can you try this?

I can confirm that libhugetlbfs tests do not trigger the BUG with the
below change.
-- 
Mike Kravetz

> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a30587f2e598..8ef861297ffb 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2160,7 +2160,11 @@ unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
>  		if (xa_is_value(folio))
>  			continue;
>  		if (!folio_batch_add(fbatch, folio)) {
> -			*start = folio->index + folio_nr_pages(folio);
> +			unsigned long nr = folio_nr_pages(folio);
> +
> +			if (folio_test_hugetlb(folio))
> +				nr = 1;
> +			*start = folio->index + nr;
>  			goto out;
>  		}
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
