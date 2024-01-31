Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E67843338
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 03:14:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV07k-00084m-4A;
	Wed, 31 Jan 2024 02:14:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rV07h-00084g-S4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 02:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okNLaNGXePTVJbp77CNYVaCk87E46KUhrp+gJGH4DV8=; b=XTGMGfEtD5RiTNPonoU/lQFdW4
 /6TL2AXN/N1d0Hn+fHMNTCUjglrUlp7fi7XC32C4iWTsqFQXIXfnhcUSqeBGqRGIT7UtFie3VaEkw
 7/8ndaBmwSNBjg2gCNroJ3suIm+0LOhbCgxIq/pWsjX8q5sZviOaOjVZEbOASzB/H9pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=okNLaNGXePTVJbp77CNYVaCk87E46KUhrp+gJGH4DV8=; b=ioDimnkDUV7H6ULQnw4M2adano
 k100NT8twaDDcTjMev1ZLqEVI+l/MMJQhcn/4IBPdKKJm9Yjqo9RyhzbugGx1HjnSOMzuuU2RF5Ro
 vKDeKWORlQ1n553jtkRxKyF+T03gM4ooRLYd5Sxryex5edVisCATL6gOqfIKPep15KCg=;
Received: from mail-psaapc01on2085.outbound.protection.outlook.com
 ([40.107.255.85] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rV07f-0006rM-Qe for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 02:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmbQzIRad22gBo7sb+VskR2/hca3WGvLzFpoxY1AFIrgR0f6yeUNiDGCqTtoQGz2vOV9/RrN1K8eJmDKx4OzR0sXNXSKTa07e5FBuHCYQtELXmzj7nxunH8TRqUtIfbX51ALSREihAVGYGlLEjcdY7U6nO+nHNKqUf3DYrEEfo2g203XkYELanL0KnIVohiz8HTmhpvnNJnL+ybthg5P+DN966FdUZrzH/1Ty9PxPADC9k1ZlN+5Jayfv9OwBBIXZmGISNu10LLNxwr3djDKf2knLHeS3NM/myljh2aE547bwWDRpO+FNubdAlcIz41ObXSu8lST4fpWWNai3AV/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okNLaNGXePTVJbp77CNYVaCk87E46KUhrp+gJGH4DV8=;
 b=YHVEURb4QOOukePw1bVE0Boz78A6ZUGdLUKJXdbK3VUwSMT724/DrUEmROrv6LOStnDw2J8XuwJVbmagPDISmCDEwznMn4jWC+NbRmbBaQoqEIpDaEG8qtdBwb1qkpnJ4eNJaR6koJDliF0pNcEI5WXHw0cBH4OpHjivCmq97F1J/UtHv+vAqgPPeUfTMra5QBU8KC5RlD4ZODL8iNfCv5aQQAVnzfYbWhSaULhBZ/HEFUVdgBOjGrkSvFyupIJpQaKcT3jW5ZJKswkhAW4mxa047EtAUZD92Y3mTbpOnzdUJ3V1WkYc/TKYL+q3YoAZwAlFxGUItnHMHCVkltUHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okNLaNGXePTVJbp77CNYVaCk87E46KUhrp+gJGH4DV8=;
 b=CtzJDLwQMUSmflkzlmB2sE7nmOnDT3LjoQvM47fXIJuUhVyDP3kKdWX8Y78HoDC4w21EQzLXAfh/X62CLqePzqxuG/ePsU0ATTAOSxGIMUkJ3qIsZbax12AivG97K/vsufsh7XmR7p+5R7Espp3cJ61ro6a1eeqXa1lg5CHadCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by TYZPR02MB7906.apcprd02.prod.outlook.com (2603:1096:405:af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 02:14:30 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a815:49db:df99:5461]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a815:49db:df99:5461%5]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 02:14:29 +0000
Message-ID: <3a4e1892-c68f-45cc-ba61-ca7d675e95c8@oppo.com>
Date: Wed, 31 Jan 2024 10:14:25 +0800
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <chao@kernel.org>
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
 <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
 <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
 <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
 <20fdbfaf-aaa3-466e-8797-1927bf0bc804@oppo.com>
 <CACOAw_zKTPD5epxD2RsvarDJJUxz8LEhFvkWJex19XtY9hxa0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_zKTPD5epxD2RsvarDJJUxz8LEhFvkWJex19XtY9hxa0w@mail.gmail.com>
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|TYZPR02MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f9d963-af9e-4727-62f6-08dc22025b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVVMVRiH9gnuWl8qSKaAB1AO8mmgAtwjKq3T0cwS9VI2PbuUFmmXHGpUoYecxXVdqOufS2v7or3LO55PgfmH1kXWwEPeQsTarleXWGmDXTV3Sc1ye6ybKQJ+cFDlaX4R7k76m6upQDyzY6LsfrHd7/PjghLwLNbcKTLQi8F8Hjsufz5ubgduZ8lODzlJnhA28SevvAmIV4uUDALCK+dxjAVMrCLawlMQdALOfS0hD4c3jjAbubr4sDdGrKGPQEuoqsT+fd6ScVMtFlH8OdE6Dte1Yqj3NcHXw4abScj62TZbleOYqR6HBp66L9DAF7ZNDYqqivL3KhQxwaU+9BIeCiAlS2DC7U6T/4z2+InNBlOTiBx+T847OreCsYnziqK/YiEkJ2o64K9azX4Z4S+k/ZSc66zbkOMjcbCyyezZmiSUfZaByN3PcSB9xq44DyMpfMjW52J4pPC2EkJ9p0d3Jx3x//o45NIz1f4jm1FTG+wN1T85keqkkWmbzbvvP6u+qG1JJ1RT+Ey34ZlNop367yHqzrG8XteE0B8vc4UsAMDcE7tip9vPXCn6Sj05hB3MOtdmHpefvbGpHlWcFp+cTrip1+OZ+IzlutmOJvErCWdQzzUROl9gsEbJn5ixSrUmOJvcscgkde66Yd57hFQtEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(31686004)(83380400001)(41300700001)(86362001)(31696002)(36756003)(38100700002)(2616005)(26005)(6506007)(6512007)(66476007)(6486002)(2906002)(6666004)(66946007)(110136005)(53546011)(316002)(66556008)(8936002)(5660300002)(4326008)(8676002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtoZDdTNlovWDl5NHUwYUMyR2F4VnJ0a29rVVBXd0ZBSGNCWGpKaEg3ZlNu?=
 =?utf-8?B?NGo3bWkvcUJvektzd01uVW5YZ2RhWXdDS3N6dS9ucEhmUVBlSHpWQmJIZi94?=
 =?utf-8?B?VWxCcXc4cCt3TlU1NWZFMUd1TEJJOTEvdlVXbDdzRUEzc0ZYS1RqR3F2UktD?=
 =?utf-8?B?cUgxSlZNZVVJa2xSRlN2RjhlQU1ic3dZMmVqajZQR2wwazVBU2Vwbm1RNDZa?=
 =?utf-8?B?Y2RqaWcweUl2bklOTXJlUUxGUXZKazZrWHBHVkNQdmxmSitXZzZKMDhabFQ3?=
 =?utf-8?B?S1ZDM2R5V1IxVTlvTXBzc1hoRE1sVzh3K2NUZVZFUTAyaG1aNkN0RC96WFVr?=
 =?utf-8?B?QzNYa005NHhZcEVDYWg5cVRPUzVldkJOZUxUZ2JSZUlmZ21BOEpYRlJndmRj?=
 =?utf-8?B?ZWw1dVBHTlAvNnBYQjBYQzM5SGk5S24wbHFUTVhsOHZ5dlNEWlZmNjVjck56?=
 =?utf-8?B?VkxsYzluSjdQenlITmNad2RBZm5hcWJPaUR0VkJySTBZTXR3V2V4R1JwVEMr?=
 =?utf-8?B?Q1EyeWZkTVB6ZExzWmJwc1pFTmR5ZlI0eHdHRm5vOTBvUG5Ndy9lRUhrVnJj?=
 =?utf-8?B?cmxTMkdIT0s2WHdpMWlKS1ZmRXhmeWwzcEt1ZXhBMkU2OTBjYXI5Zk4weGpm?=
 =?utf-8?B?U1lBdUhHampxL0IvU1dZMmcwQzNPSDVGS1UrRHJ1WDVYZUpUYXdQLzNnQ0Fa?=
 =?utf-8?B?MTVBanp2Unh3MW54aXNPZ2VlMTJ3U3VBTWJWOCt5Vk1TNFl5eVhJQ1VrTnhj?=
 =?utf-8?B?MTYrMksydzduT1VaaWJrcmljWW9UaWNERE9LY3pCZjFSc0pCZXFvZlNMcW5m?=
 =?utf-8?B?N2lFTzVHYzZxcXRjclVuV0RJRHBCaHh4VTgwVEpOWFRjZkJsVENWcEN6QWNL?=
 =?utf-8?B?b1BVMHdkbXJISnNIMmpTc2szRUZWYnJvbkZrUDRiVjRUWUdLSEphVWplSjlv?=
 =?utf-8?B?L0pjeXJYMCtCSFkwOVRydE1uTGRaaXgzY0RKd3Jsd2hSbWN3cU1vK0lacDFh?=
 =?utf-8?B?UE4ycElvM1lZMC9oUFl1WUdkRHJjWGJTa1BVNGk0RWdLNkZwQzh6c1RZb2Uw?=
 =?utf-8?B?ZHhBb0IvSXVESEpoY2pteVNFZktVYXdmbGRlSjhiaGVoTjZlSjlDNlhLMFJO?=
 =?utf-8?B?T3dFbjB0emNxT2FGdzZBQnlCYUdPaUdLQnRLazJ0dkwxWmhyYnA5NnFOYW8x?=
 =?utf-8?B?QkVjcVVYV3FHNEVPSUxOUXliVThJVkpIVTRtWDgzeis0NHM0YkxnL2lqWkk5?=
 =?utf-8?B?MTgvK3JLaldFcXNzK0tJMjJwNHkyTUZ2a3ZMUzlzOWJha1VIR0h3QkF2c3RY?=
 =?utf-8?B?MG9pWVY1VGZ3aVprU01qRUk3MkJmL0xieWRYNnNSTjg1bDhQSG5uMUhOU09M?=
 =?utf-8?B?bWRjV2RHR1Z4ejVSa3JLd0pJckpvY0tOWVdOTWkraEMzcEdDTmF5RmxmTytu?=
 =?utf-8?B?ZFZqOUZPL1pNMDUzTTcxR0JwOGI0WUMvS21yelZtVGZIUU82YUxuS0FxRGFS?=
 =?utf-8?B?cEJyeWxxTFBnS0RianFjVjgyRnJkZHgxMHJobzdhT25WUWd0RzlmbUFQVU9L?=
 =?utf-8?B?QU11Z1ZkcjhFUW1oc1JLc1RqQ3NWTTdZVmNkZC83aDBXM2cvMkl4c3VqbnVq?=
 =?utf-8?B?VHFrQ3piMWx4a2Z1ZzVJT05TcDNyOEdXQXNXWFN0RFJXS21TN0wwem1ndTQ5?=
 =?utf-8?B?NUZCS1BoZnBNK0lIQ3ppZmUxZ2t4OUJhMk02VzV6SEY5OG9jc1RTK0FDQlhF?=
 =?utf-8?B?SjZqUm5aeUp5dnY5NnZsWnZrKzBFTlZIbjBTNlFrYVhndUxhd1JqdWVhUC9j?=
 =?utf-8?B?UjlLeEZQbUx1RjNUZldXanpQOGFVU3VGYjFNUGlqc2xyYWx5YldicElpeGFn?=
 =?utf-8?B?M1lFYlo2L2pKVWtHdEM2M3JTWlg2TkRRUTdoZjNRczRZYW5yUlZzQ0JuU1Jp?=
 =?utf-8?B?bWplbFVqbXRLdVVCeXR5N1k0UXBodU5rTE5DYm5qd0lsTDAyeVZSbmZTNUhC?=
 =?utf-8?B?ZDhmQjVuVGxOREpjUTBFcGRjaTkvc01MeDJxOFdvTURTMmt6RmF4a1c1V0ZQ?=
 =?utf-8?B?cUxaNjNLV3pjTkVhalVtdXdEaHUxb0Y0VmNwRkJTNWd6MmVFZWtLYmEzQ0Ra?=
 =?utf-8?B?a1lzMzZldU1zUXI4M3RzQkNTV3dlb0JSZlRvWWRLellGUVBCM0RxWWRRNGYv?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f9d963-af9e-4727-62f6-08dc22025b02
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 02:14:29.3955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3uDmTYBM4Zx1BWIBC1btkpJ4rTkJU26poIKElelGqZmeF+v6hIHpRMI2pJ0r7+900QjuHc+7eM5qeq6S5xAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB7906
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 1/31/2024 2:00 AM, Daeho Jeong wrote: > On Mon, Jan 29,
    2024 at 6:17 PM Yongpeng Yang <yangyongpeng1@oppo.com> wrote: >> >> cur_seg[CURSEG_COLD_DATA]
    will exceed end boundary of main area when: > [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.255.85 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.255.85 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rV07f-0006rM-Qe
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS8zMS8yMDI0IDI6MDAgQU0sIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDI5
LCAyMDI0IGF0IDY6MTfigK9QTSBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmcxQG9wcG8uY29t
PiB3cm90ZToKPj4KPj4gY3VyX3NlZ1tDVVJTRUdfQ09MRF9EQVRBXSB3aWxsIGV4Y2VlZCBlbmQg
Ym91bmRhcnkgb2YgbWFpbiBhcmVhIHdoZW46Cj4+IGRldmljZVsxXTogem9uZSBkZXZpY2Ugc2l6
ZSA9IFsyIE1CIH4gMTBNQl0KPj4KPj4gU28sIGlmIHRoZXJlIGFyZSBub3QgZW5vdWdoIHNlcSB6
b25lcyBmb3Igc2l4IGN1cnNlZ3MsIHdlIHNob3VsZCBzdGlsbAo+PiBhc3NpZ24gMCB0byBjLmN1
cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSBvciByZXNlcnZlIHNldmVyYWwgY29udiB6b25lcyBmb3IK
Pj4gY3Vyc2Vncy4KPiAKPiBUbyB0YWNrbGUgdGhhdCBjYXNlLCBob3cgYWJvdXQgdGhpcz8KPiAK
PiAgICAgICAgICB9IGVsc2UgaWYgKGMuem9uZWRfbW9kZSkgewo+ICAgICAgICAgICAgICAgICAg
Yy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gPSAwOwo+ICAgICAgICAgICAgICAgICAgaWYgKGMu
em9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50MzJfdCBjb252X3pvbmVzID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMgLyBjLnNlZ3NfcGVyX3pvbmUKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtIHRvdGFsX21ldGFfem9uZXM7Cj4gCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmICh0b3RhbF96b25lcyAtIGNvbnZfem9uZXMgPj0gYXZhaWxf
em9uZXMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNF
R19IT1RfTk9ERV0gPQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KGMuZGV2aWNlc1sxXS5zdGFydF9ibGthZGRyIC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZXRfc2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZzsK
PiAgICAgICAgICAgICAgICAgIH0KPgpJdCBzZWVtcyBmaW5lLCB0aGFua3MuCj4+Cj4+IE9uIDEv
MjkvMjAyNCAxMTo0NyBQTSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBPbiBTdW4sIEphbiAyOCwg
MjAyNCBhdCA1OjI34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+
Pj4+IE9uIDIwMjQvMS8yNyAyOjE3LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gT24gVGh1LCBK
YW4gMjUsIDIwMjQgYXQgNToyN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xLzI2IDA6MjUsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4+
Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDc6MzTigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiArQ2MgWW9uZ3BlbmcgWWFuZwo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBEYWVobywKPj4+Pj4+Pj4KPj4+Pj4+Pj4gWW9uZ3BlbmcgcmVwb3J0cyBhIHBv
dGVudGlhbCBpc3N1ZTogaWYgYy5kZXZpY2VzWzBdLnRvdGFsX3NlZ21lbnRzIGlzCj4+Pj4+Pj4+
IGxhcmdlciB0aGFuIHNlZ21lbnRzIG9mIG1haW5hcmVhLCBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9O
T0RFXSB3aWxsIGV4Y2VlZAo+Pj4+Pj4+PiBlbmQgYm91bmRhcnkgb2YgbWFpbmFyZWEuIENvdWxk
IHlvdSBwbGVhc2UgY2hlY2sgdGhhdD8gdGhvdWdoIGl0J3MgYSBjb3JuZXIKPj4+Pj4+Pj4gY2Fz
ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IENhbiB5b3UgZWxhYm9yYXRlIG1vcmU/Cj4+Pj4+Pgo+Pj4+Pj4g
U2luY2UgYy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gaXMgYW4gb2Zmc2V0IHN0YXJ0ZWQgZnJv
bSBtYWluX2Jsa2FkZHIuCj4+Pj4+Cj4+Pj4+IE9oLCBHb3QgaXQuCj4+Pj4+IFRoZW4sIGhvdyBh
Ym91dCB0aGlzPwo+Pj4+Pgo+Pj4+PiAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9O
T0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoYy5kZXZpY2VzWzFdLnN0YXJ0X2Jsa2FkZHIgLQo+Pj4+PiBnZXRf
c2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZyA6IDA7Cj4+Pj4KPj4+PiBCZXR0ZXIs
IGJ1dCBsb2cgaGVhZGVyIHNob3VsZCBhbGlnbiB0byBzdGFydCBibGthZGRyIG9mIHpvbmU/Cj4+
Pgo+Pj4gSXQncyBhbHJlYWR5IGFsaWduZWQgaGVyZS4KPj4+Cj4+PiAgICAgICAgICAgaWYgKGMu
em9uZWRfbW9kZSAmJiBjLm5kZXZzID4gMSkKPj4+ICAgICAgICAgICAgICAgICAgIHpvbmVfYWxp
Z25fc3RhcnRfb2Zmc2V0ICs9Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIChjLmRldmlj
ZXNbMF0udG90YWxfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUpICUKPj4+IHpvbmVfc2l6ZV9ieXRl
czsKPj4+Cj4+PiAuLi4KPj4+Cj4+PiAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGMubmRldnM7
IGkrKykgewo+Pj4gICAgICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkgewo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0udG90YWxfc2VnbWVudHMgPQo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjLmRldmljZXNbaV0udG90YWxfc2VjdG9ycyAq
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5zZWN0b3Jfc2l6ZSAtIHpv
bmVfYWxpZ25fc3RhcnRfb2Zmc2V0KSAvCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2VnbWVudF9zaXplX2J5dGVzOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBj
LmRldmljZXNbaV0uc3RhcnRfYmxrYWRkciA9IDA7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGMuZGV2aWNlc1tpXS5lbmRfYmxrYWRkciA9IGMuZGV2aWNlc1tpXS50b3RhbF9zZWdtZW50
cyAqCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGMuYmxrc19wZXJfc2VnIC0gMSArCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNiLT5zZWdtZW50MF9ibGthZGRyOwo+Pj4gICAgICAgICAgICAg
ICAgICAgfSBlbHNlIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2VzW2ld
LnRvdGFsX3NlZ21lbnRzID0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
LmRldmljZXNbaV0udG90YWxfc2VjdG9ycyAvCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGMuc2VjdG9yc19wZXJfYmxrICogYy5ibGtzX3Blcl9zZWcpOwo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0uc3RhcnRfYmxrYWRkciA9Cj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaSAtIDFdLmVu
ZF9ibGthZGRyICsgMTsKPj4+Cj4+PiAuLi4KPj4+Cj4+PiAgICAgICAgICAgdG90YWxfbWV0YV96
b25lcyA9IFpPTkVfQUxJR04odG90YWxfbWV0YV9zZWdtZW50cyAqCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuYmxrc19wZXJfc2VnKTsKPj4+
Cj4+PiAgICAgICAgICAgc2V0X3NiKG1haW5fYmxrYWRkciwgZ2V0X3NiKHNlZ21lbnQwX2Jsa2Fk
ZHIpICsgdG90YWxfbWV0YV96b25lcyAqCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYy5zZWdzX3Blcl96b25lICogYy5ibGtzX3Blcl9zZWcpOwo+Pj4KPj4+Pgo+Pj4+IFRo
YW5rcywKPj4+Pgo+Pj4+Pgo+Pj4+Pj4gSWYgYy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gd2Fz
IGFzc2lnbmVkIHcvIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cywKPj4+Pj4+IGFuZCBjLmRl
dmljZXNbMF0udG90YWxfc2VnbWVudHMgaXMgbGFyZ2VyIHRoYW4gc2VnbWVudHMgb2YgbWFpbmFy
ZSwKPj4+Pj4+IGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkIHRoZSBlbmQg
Ym91bmRhcnkgb2YgbWFpbmFyZWEuCj4+Pj4+Pgo+Pj4+Pj4gICAgICAgICAgICBjLmN1cl9zZWdb
Q1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMg
OiAwOwo+Pj4+Pj4KPj4+Pj4+PiBJbiB0aGUgY2FzZSBvZiBGMkZTX1pPTkVEX0hNLCB3ZSBoYXZl
IHRoZSBkZXZpY2VzWzFdLgo+Pj4+Pj4+IERvIHlvdSBtZWFuIHRoZSBjYXNlIHdlIGZvcm1hdCB0
aGUgZmlsZXN5c3RlbSBpbnRlbnRpb25hbGx5IHNtYWxsZXIKPj4+Pj4+PiB0aGFuIHdoYXQgZGV2
aWNlcyBoYXZlPwo+Pj4+Pj4KPj4+Pj4+IEkgbWVhbiBibGV3IGNhc2U6Cj4+Pj4+PiBkZXZpY2Vb
MF06IGNvbnZlbnRpb25hbCBkZXZpY2Ugc2l6ZSA9IDEwMjQwIE1CCj4+Pj4+PiBkZXZpY2VbMV06
IHpvbmUgZGV2aWNlIHNpemUgPSAyIE1CCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+
Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMDI0LzEvMTggNzowMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4+Pj4+Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE1ha2UgdG8gYWxsb2NhdGUgbG9ncyBhZnRlciBjb252ZW50aW9u
YWwgYXJlYSBmb3IgSE0gem9uZWQgZGV2aWNlcyB0bwo+Pj4+Pj4+Pj4gc3BhcmUgdGhlbSBmb3Ig
ZmlsZSBwaW5uaW5nIHN1cHBvcnQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+
Pj4gICAgICAgbWtmcy9mMmZzX2Zvcm1hdC5jIHwgMyArKy0KPj4+Pj4+Pj4+ICAgICAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1hdC5j
Cj4+Pj4+Pj4+PiBpbmRleCBmMjg0MGM4Li45MWE3ZjRiIDEwMDY0NAo+Pj4+Pj4+Pj4gLS0tIGEv
bWtmcy9mMmZzX2Zvcm1hdC5jCj4+Pj4+Pj4+PiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPj4+
Pj4+Pj4+IEBAIC01NTcsNyArNTU3LDggQEAgc3RhdGljIGludCBmMmZzX3ByZXBhcmVfc3VwZXJf
YmxvY2sodm9pZCkKPj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdf
Q09MRF9EQVRBXSA9IDA7Cj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VS
U0VHX1dBUk1fREFUQV0gPSBuZXh0X3pvbmUoQ1VSU0VHX0NPTERfREFUQSk7Cj4+Pj4+Pj4+PiAg
ICAgICAgICAgfSBlbHNlIGlmIChjLnpvbmVkX21vZGUpIHsKPj4+Pj4+Pj4+IC0gICAgICAgICAg
ICAgYy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gPSAwOwo+Pj4+Pj4+Pj4gKyAgICAgICAgICAg
ICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05F
RF9ITSA/Cj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2VzWzBdLnRvdGFs
X3NlZ21lbnRzIDogMDsKPj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJT
RUdfV0FSTV9OT0RFXSA9IG5leHRfem9uZShDVVJTRUdfSE9UX05PREUpOwo+Pj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19DT0xEX05PREVdID0gbmV4dF96b25lKENV
UlNFR19XQVJNX05PREUpOwo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NV
UlNFR19IT1RfREFUQV0gPSBuZXh0X3pvbmUoQ1VSU0VHX0NPTERfTk9ERSk7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
