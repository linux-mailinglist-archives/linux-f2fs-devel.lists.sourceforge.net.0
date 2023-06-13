Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD472DAF3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 09:31:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8yV8-00071L-8D;
	Tue, 13 Jun 2023 07:31:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yV3-00070z-Fg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=; b=co/PUO8SEOKqxnWORs1FAoW/cD
 d6SeagRZ6j8WgCkbWWeZ7kuvT1ygPDtEhKFm7DcMwAwqnhFTJNdaQsHjLX4ap+MQsb5Z/W9b+BHBT
 cR/DFmnTlaJeu2kDVi96ZiUiBbvk9elUixNTew2+dhYMzccFlgXhChnd3OD2HBY3vC54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=; b=AVduaR31dhw8LjlHrBEjLkqSx7
 WKY9itagareEEyaRgikC1Uu7b5PlYQQI4NeEXSfEe/V/LjJTx2pXCvP+PSZl3D8v4SZWenHUZvMQ4
 bsnMsdKw82VPhhWCz98fP7NsOTqg6A28chUFf72H7860kBb/qpfxpgw7iMUIkCHzg+gs=;
Received: from mail-sgaapc01on2116.outbound.protection.outlook.com
 ([40.107.215.116] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yUu-0005ni-G9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QftQhsn+26GX9msNi6uw8MoyHO0j2Y2ICALNoPdt7GY5scWuNTXL6x7m4dZo2YGy/svgYdJTIUddUp8kpt2QgILUoGijsTz+KnJZiTlqt0tSZwoIWOiwm5WL3wOp129mfGJ/It+VGDZV00LLRaAXBlc2emRhpPCTMPyQJr/LgelFpfvCxqLaw+yCCkg8ypKKJdIw0r9D+Ipoj8PNFS82HP3+SojQf0Zozr2gd9rA49jSgBGySIea3n2HCS8Tj0IupZSchrPpSRYRw/9Vg/W8sTfyQ1VggYyyI5mX3d5Yoa15nAzmgihc0sJ/S5vAujw4QJBTMFdyH+fwd6nAqWZOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
 b=m3hnsapKVdW+XoaYMF/bNZySFGwjh1bPH9GqlzYJPZFkolmYL7YAgihCdzYlIHSTEPOrhFbGJsBOvFw7RKnaO97KJniCzOCJlFPdImVSzXMo9Ww5aqt+3YIYk5ZW25ap3T5aO7J9hWqc8Qr2tD3a6nr1ibO5/fOY1AESwAfJCyBgSC4PLtcfL8bQKjA0YWrL1Cp5mBMi5MQ9F8YYcxqu67eJYFJDyIk7mRVBHx8n/t7p2sgwffiistiP8a0iPbsefKM7yTZi9kXnjvfEVmTWq8vDDlE1wTjGj8tuivRdpDWeySR6jzWtw9OZpjdAYSWCNvNAEPJNS4J7aZLoYlWoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
 b=GYiMmRiOBI8Hx8aBpysqBRNx0NKSYBA0U0DdtQPNsuJBk1mdlbEamikMs9iXLtsaC1d9boTWw6Wxv3zT3+7moq4bJS5xjdRtBnZk5ESGoU3RjsYr532R9aQwbMBs+8Kb+2qQv4f5fhszt1CJbPj0qD4Nd8JCLffuEDLE3t6uz9a7S+Z259je+9UGLJNZxjiFqBojKKfcw51igSRXaFNtHq6rIZs/FDk0BWo2+aGkHHO0G/1DbJt8EmEoUAkl8PiycSOxEsjDpIr9Y6VzQ1KAsngNMLfKpV8b3shz7GviN91Lp8eB8JlVX5XrDezh2Kasb6DzEZC3gds0X9s0roUjig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3985.apcprd06.prod.outlook.com (2603:1096:820:27::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 07:31:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:31:16 +0000
Message-ID: <b1616a3d-c1a3-571a-3b54-4ca975b5d6cd@vivo.com>
Date: Tue, 13 Jun 2023 15:31:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20230506151604.36890-1-frank.li@vivo.com>
In-Reply-To: <20230506151604.36890-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3985:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b21817-1246-47f3-899f-08db6be02c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1AuOpRAZmj5TEwiqvof8ogoSyq8WnZL6bYrZ9r6KhTIV10HdqLUHlgmYfNbM3CjI90VcRVTYuwEwbSucPQscSbZXoy6W7VZ1CqV0n16qgOIP4nP8pzwgXcnpkKmdnuEIGmgCp42tISRZs3qiiJbjlNpq8XwWIVjAlfdmz3G2LS0Jw8jecwoJt1tK3HKCAaLjmQ90W6S1rQLIp4HOdYEfUP/DsvHr6A5chaFssml/V8CeudeTj/jKO8kRTkZCn4A4ccARXqFUNTZSwISxryoLTY/ofT/QxPUdzzp6Jv554ooJIg3rX/S8pzxP9iD1WbyY5zEl++QmqIIzgNu9opAfybdKnGoGbtfa5IJeYkvR9QLsc5Io0Zj6HhgBZPXwsc34iRxl9aMvm3ZmcGOfOh02+QZszAsSzWJq+h20Zjyo9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(8936002)(8676002)(2906002)(4326008)(66556008)(66946007)(66476007)(52116002)(31686004)(110136005)(6666004)(6486002)(26005)(6512007)(6506007)(41300700001)(316002)(186003)(2616005)(478600001)(558084003)(38100700002)(36756003)(31696002)(86362001)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxEOW5CTTJJWHN0MU96Rng5UTNJNjB4SVMxMkxNcDRKdUhKZ1JyNGV2RUhO?=
 =?utf-8?B?T2tEMTRZY0NuUnJTT3h1dXNqOGJWRk1QS1c0NDZvM1JTSmg5bXNYUjRZVUFl?=
 =?utf-8?B?dFRpYmdaWlpOTUphcWlwQldHOEFXNDUxcDdZK2JBWDVsKzZyMC9hTlQwWEJX?=
 =?utf-8?B?YmhvTzdOdEdNd3RkQWs2WlVSWUtKVkVrZTRKT2hVNDVTT1RjVm1ScHBjUW1m?=
 =?utf-8?B?YitJT0xJeXE0OTJBcTNWSDFjSEEzK3JjVVdUNEhSQlFTTjg5UWpjcjhKMm1h?=
 =?utf-8?B?NThOQXlJODBySXRDSXB3U2lNTDJaMDBmRnNhWG0yVkp2N01Fa01TSmlzMkVQ?=
 =?utf-8?B?eXlHUmRsWWU3NUhqSVIxNE1MS25uQ3pxRCtVbDZueURUaDZuSVBGM2dhZHdk?=
 =?utf-8?B?RFQ4TFV4ZU0vbkR6Zkx5NnRiZ3EvWUxmU1lGUkdiQTNtN0Z5bWs5MDh6V1Z1?=
 =?utf-8?B?RjRMOEZmZ2doZmlUWnYzcUVFS3JCSXA0YVVucUc0RjdIWjl5MjhhaHdIZU5S?=
 =?utf-8?B?YlBpcWgxRU1UM1dvKzhlZklBUkhzUW9sT2F4M3Y3TmY4dko0YUh3QnlSRjl0?=
 =?utf-8?B?elZDYnFHT1NNVUNTb0dBQ0dZOUpuT3dZaFkwRno3R1Mraml6RkphcU03VFNS?=
 =?utf-8?B?cmxrZ3lNb3RKOEZQVGx0SVNsMldXUFFlNHNIK0xmVmpJdjNWejA3OUJZVUps?=
 =?utf-8?B?Q0g4d1hCOXJ2UERhZDhsczVPVzNSWFNqSkt4b052cXZzVGtmVFJpS0NsbzNK?=
 =?utf-8?B?U1ZQZGNpUEMzbS9kT2tRS0hMRThkaThVUFk2bmdwWTlNdlo4UW1oUlZ1V1lT?=
 =?utf-8?B?MWEwU0FxZWY3cURYemkyNkNTRVllS2h5TGNXdlM3R1pVQVFHTG1NdlpRTXNO?=
 =?utf-8?B?V200cDltMjlIVEVjdWk3eHdtTmRLRzc2QlVIQm1kOTRtVjlvb0RxVEMxZWxt?=
 =?utf-8?B?ZlB4WFQ2ZDhVNFV0bFRzWVNxQUlTZko3UE1rdU9pc3YvenJMZnpHOCsrd082?=
 =?utf-8?B?UjdsRTY3a3N0NVZIVyt0dU1ibndpZkVicmV1ZTFUa1pGWXZrWW9kVXMvWkZq?=
 =?utf-8?B?YllnM1ovUCtnVE5FSFVKbC9LM2NNbWd0cVNIUzlXMUlMVXJYelRXeHQzZEYr?=
 =?utf-8?B?dTl5QTViZVNhbXNXVk1ocWRIYVlFNmNERmZtY2VJdmRab0JERG95RUI2RVJs?=
 =?utf-8?B?VFRXODBDQWlaUlRRTXRrUHdNc29YdUxDalpzbXc0dUYwUVZFcG1leW90S2ta?=
 =?utf-8?B?ZWRGbFdhRXBoSTRwUnAwY0tGd2o0a1JuMklveDRFbjlFcDFQVG9YUTh5SXVJ?=
 =?utf-8?B?ZHVzWSszMDBXd2o2ck5aVy9GckMyNkdZcHBVam8zbDdiY2RKYjVVdStKUmxt?=
 =?utf-8?B?L2N2bS9aZURPeTF5YWRXb214d2pKczVKZWNMb2FyZFczc3lsbVJ0dTd5OTBw?=
 =?utf-8?B?K2UzcVJab0lmK1hkYk5hTXQwNXJ4UEgvMzRwMXBzemtqODFFT1JTcGR3L1Ro?=
 =?utf-8?B?N2p6OVRpekdHcjNkR2Q4WUlzS1YxN1Z1OFE2MjIxMWU2WmpTRWVMSVVkYU01?=
 =?utf-8?B?MHBMUXhUamZuYVd3aERXS1JVZXZFSGNwQ0prWExiZCtTMjducnVZMk8wSERk?=
 =?utf-8?B?RHY3UlNWWTVxQXBTdU9uVmFNbzJHTWRCbGp2ZUZQRWlYUElSeXVpRTUxenZ0?=
 =?utf-8?B?TWRXdHFxV1JYUmVENzFzRW1CN1BtMTZLTHBWTTFoNm1yaERtQ0pybnRVMUdX?=
 =?utf-8?B?TjBtenRoWGQvSWhjOVVQL1dTZDFoYlA4WHhSY2hQRDZDU1NmWEN3amJXY3Vh?=
 =?utf-8?B?MVcxRkdnQ2g0V0lIejc3MEdKK3VVeGl5alNuSnRDbHZMOWVGNVhZRldTYlVO?=
 =?utf-8?B?MW9vS250SjBMckh2eTRVQkpTZHg0RW1HRzlmVXE4YUdON2hEeUw4RUtkNU45?=
 =?utf-8?B?NzZkeWI4OUh0ckIwb25tVmdZSXJrZENlczZSa1FtQjRzZkp4N01LVjFVeURy?=
 =?utf-8?B?RVVEcjZ3c1NUQzBvdzNjN0ErdkxkNDAvbHFNU25vUWs0TUt2aXAvOEwreXVW?=
 =?utf-8?B?djQzbS9ONHptVW9XWU5USDdwMk9YZGdVK0kwTUFvbTFCWVQ4SUthSU14aVd1?=
 =?utf-8?Q?UH+35RP8LItYhNqpRzbtJCMH9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b21817-1246-47f3-899f-08db6be02c0f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:31:16.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv3UIJsiX/StYHZY+Hc5MPFFKSpqN9jQ68M4UG5SscdGl+HhayufVX0X2e/4dUbxosQkEsBjODiRYBDl2OzKYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3985
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping...... 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.116 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.116 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q8yUu-0005ni-G9
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: refactor struct f2fs_attr macro
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping......



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
