Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63D60D1F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 18:52:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onN9d-0001VK-Ff;
	Tue, 25 Oct 2022 16:51:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1onN9I-0001UL-9Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 16:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+denAMsoKo6cMjFs33HsexYWFmNPzlMLlgXWB51f1g=; b=DaIlsJlmMwoVv/U96do3+2OnF3
 RDNPzAdYlZPAYtMOQF8gXrIwsglQCiWsD6uU3FNsl2lc547hQGPa6SpjQrZvY7KZdZcfL7Pauj61v
 po2JhyyQPuRZ7paPawTkEhfXNaQAfW+DcMgm+z7xbwF4PcW4VG/Mnpg07w0mTks4duEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+denAMsoKo6cMjFs33HsexYWFmNPzlMLlgXWB51f1g=; b=kqeJNP++fbtSISx+JpOppCIuKf
 RGG361RXrbGVVG0YwRw/12s6FQgnblADprzGfOINZopGLox3//kZfEO8zQEkqwR2aFZeonCkCahEW
 n+wfQpzMB3XzjZ1ynMsN3cSgxwdNwiaI35WC6ok2/I3940/2Bv1uNe5vyKnlkdblAT+4=;
Received: from mail-bn8nam12on2043.outbound.protection.outlook.com
 ([40.107.237.43] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onN8x-00HC8C-FW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 16:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB5kPXrAjcR30MjRRqNQ1AjQPQCjH5NvTewO0ZDp3eaBKM+NwTJcBVcLYlApm0azZanhFnkXx5/tnLhs/CskT0wJo+jomx6nrzhv5f42Qakhw/9cuCYKD3Yuf+/+x1Nv4R/G3S6l1/G865tyE9tPUd66E/kPrZDAmAu9d83IM14wITISPKPcJPI6SJ0jOF3XEEIhXcwDV7P0J88hrbdww/R90Ycnv8sPSk/3+9CGInRaUIXhvnvPI0GS3/+Bg71PpV+yLbS/o5q//C4GuHh0qErjnXjyu4KvogJOn7+yrE8evXC72yKdnRJdZ+wy25indt+/tn1zoGaGnmG807VU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+denAMsoKo6cMjFs33HsexYWFmNPzlMLlgXWB51f1g=;
 b=TJ3FMdIZrFIPcfITR7QKc0kB9v8sAESj3QFGXP8ftbzdy/e3EhBw6sOlbwSga/l9xmhCvEDfmI0Ks+x8mxObd8OZB0GDOf6cgzNCJO82kyERIMIW0OYVfKZ6+EMSqrGOKrbSjqEwtCVjtyY4S4tE6SOO80Qn9gpYbaqNDFwfopsIFAM2AJl95QxC/GiJG2n6LPRfmd9SRWCwplHbiMzUhHnTQIZcFdA/hV/HUOPhV7mq3rtYDrhSv7W/OOScUcEGGFFltpjfFkIQOSeqbYhy+qASxvygC/kTOSAmzUSCavyH46yRRbJCUXUaNe5xFOhMZk4jsHbpisID2Ab89F3E3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+denAMsoKo6cMjFs33HsexYWFmNPzlMLlgXWB51f1g=;
 b=olfhGBo29AFp/+SfpzZR9SQOMIJNDxtdZBnzW779qL5e2SzFJ71bM8pU3AFewYjrznurnhG3JXrS6HPHpxFBS0TUPg6AMku6He2iyuL33jqdIMUvmXONAhDnBTpGlf1kc0ftuFGIIWbnFix+KsstBlukjJtc/hdKXc5jxho6FB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.23; Tue, 25 Oct 2022 16:51:04 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 16:51:03 +0000
Message-ID: <3d7ced9c-b87b-cf4b-4d67-5d497f0f1066@amd.com>
Date: Tue, 25 Oct 2022 12:51:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org
References: <20221025071549.1280528-1-yangyingliang@huawei.com>
In-Reply-To: <20221025071549.1280528-1-yangyingliang@huawei.com>
X-ClientProxiedBy: YT3PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::12) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4504:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9e830f-9d6a-4df9-f6db-08dab6a91a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqC8sMthq1baX6iM6uwLpub3mBj8jaDGXm88TYiiu4c9lKxsNGrpKANAYV5+2KSRSdImnE/lARYat5vR7FY2+Yi2IKXlObD7u0igXAtXIfI87s4Hgmm5rPanILjCQox+QG0k4ePARnA19vRyyksL4J4SS8m6KdzSp7QHloX6IhqInJMeZf35yBdQCJ/aW//P3jq3BlSSK8WLE3eSJ1cBCccsnlFmTatUT5ge7vv+4JyzGo2XHHKbJIrwSFK9MDXabD4xxVpVyk/IvG0HgC7EEJQ19HWbrO2qi+BDXl89YOqZ4cObB8G4ebwm0rYCb4uyqPkdR5d2S+xmKcfC1JJf/JZfqhxi1y7VJ1fNIc4DKOIqlkOy52kpD1203eEpoDY4G88eA7dbVkB3+Zrgfw4u4nVtMVxPaezmpYqZsVyY2i/Hia8MlsEZz/xcoTdTATylCsTSvMCaXD1ikUF0mjQ6khG2LTlvpNStsxt1xT1wTOecKBvwrc4rmB6YZ+7wf1JicYUBcDAzskW68a63KL+ppCoISftb1RlS0ZqDiYAMbflXfiOEJMYGU0amfiIRBza+v0ufpIalau9hMkl0NX6VQf65a2gDECIxwWHgen96bAafZQ4qpqGAmvOpKh+bG+QHyg04DG2Kp80DV6LWr+XQutRI61cVCmPcp2uH8KeR79xi86DGXzx159IRqXaQFp4anFWGuzSuc58mKMKXAEgc9dbWwXimHkr34NK3shWjWlliwJVrpSxcCzP1sxi6ThXfO124LAUejsOZXQoEE5vGiqDloy6jo2oVvMO/Ibi4gVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(31696002)(86362001)(38100700002)(36756003)(4001150100001)(2906002)(6486002)(7416002)(44832011)(478600001)(316002)(8676002)(4326008)(66556008)(66946007)(8936002)(5660300002)(66476007)(41300700001)(83380400001)(6512007)(2616005)(6506007)(53546011)(26005)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZJbk5YQXhnYnJlOFMvN2E4Zll2NjYyanozVGZTNkx6aWNIRW9rREFZTnZy?=
 =?utf-8?B?YkdlMm15d25sZWQxdjBFSFgxYjhGV0U2cXk4aW5VL2hNbUwyUm9TblB0Vk9w?=
 =?utf-8?B?VjBnVG81YlVCTkRvcVlGQVJaaVBHWm9kNmVxWXFBUms4VmNkdVVCR1Z2akox?=
 =?utf-8?B?bUhSWC9NUWlLS3lVU2IvblcrdlZScFF0TUUvdnNvaUNUa3FpQWxtaUtaQTdP?=
 =?utf-8?B?SUMwcjJmbWphMVZUK2FRZllhNlhFSHdJNHVKTzkzVFV6cGlrbFc2NFJzZ3lr?=
 =?utf-8?B?aTBERVB6VnpDRDJzK3dIUldKWnBHcVo1TnBqQitGWGJZOVJMdlVOUVl0N0w3?=
 =?utf-8?B?M041WHZMVlZ3UjVTY3RHZEJlMUU2UjM0dDQxZlRCYUpkd3U1MTdnTnNuMUZh?=
 =?utf-8?B?M0ovRFlxNmhNREZhVzRXYjhiN3F4SDJNcEZoM2U5eDFyNzk2dzZWNFczVVZl?=
 =?utf-8?B?VzgxNFhjaVVXeWdqenpyZ0NKdGluL1JmUEx5N3JFeDhxWElHRUYzNmpwdzFt?=
 =?utf-8?B?dkJ2MFVVYzkwVitEU1JIQ0hmUkxWdnl6M2dOYzBQYkdhM2dyVDVJdzAvaEI2?=
 =?utf-8?B?cXNJelgzNy9kaE1rYnBTUjRETUdkN21BNURSRlR5VWxPNEJSYmJoekJCdVRz?=
 =?utf-8?B?VThXcUZuUi9TNkdDb2F6WUlkNkZRZXdpeHd2L2hPS3VxUUd5bFI4RG5vaHM4?=
 =?utf-8?B?STY0NzVCdUp5SWRzY1ZUcWJQM1hmSjhKNDNtYnJtTnd4V1NaQ2ZFMTVZbnFI?=
 =?utf-8?B?RGJ0NmcrWmNqMy9SU1NaeXFxNUZ4RTh6REZYaXQrR0s2SlJOc1RJd3hzNVoy?=
 =?utf-8?B?cVcwNHRnQzRTc0JiSzBaV0NiQS9SbStzOFk0VVFMblJBMDVlbDIzWDRpeG52?=
 =?utf-8?B?Q1FWMmRLd3Y5dUx4L1kyNlU2M0Y1UHBGU0lkK2cwdm5lSkFFb1djWk82b1R2?=
 =?utf-8?B?MEFXQkV5SC9IUnYxSUcrclE0eVFkTzBpQlN0cmlGci9STWlhby9XOW15d01T?=
 =?utf-8?B?T1lEaml4SXF4eTliS3I5a1NBUWROelE5YXVMZ0RqclNncFA1a3oxMDdkV2dU?=
 =?utf-8?B?TUt0elEvdHlZUUpxMGR5KzlJbVRZTHU2dnVFRDhPRTNUNEVLcCtVdDBNcThz?=
 =?utf-8?B?dEZmbGM4SjRKVDBVV2dlTjA3Qk5wYjViVnFnam1vNEFQeUszSGNaUlFKai9U?=
 =?utf-8?B?V1YvMTlDSE5pUTFyZzVYTkVaYW9ybjJUcDk0MWtBRjByM1JubmZjMnZMamEr?=
 =?utf-8?B?RFU3WDdZVCtnZTkyS01FNEE3VkY3Rk1FZVF4OHdabFlCY2syMUtkdDloRDB3?=
 =?utf-8?B?dnNIVENYSXdGcWN4YTg4eEVBNFJmRU56QW9OMEpRT3VGdXZsU3gvbmRIOWtS?=
 =?utf-8?B?bHpCRUpmQ2t2aWxoQkJLYit4NHNCZW0vaDRqNmdIVzFBOC93UkNPOWlQNy9m?=
 =?utf-8?B?QU5FSzBaZ09PL2R5cWZYbldqRTllU3FYeTM2S2U1VzZvalpoeER3aUF1TXRO?=
 =?utf-8?B?QUFqTmV0TTFzSEFPbEp5YXJzVEhxNG5ibkhRM09zZ0ZwbCtKcHBwTGYxRTRK?=
 =?utf-8?B?Sm1icWJ3UCtocndremlnYVpDSEZOWHdCcm50OGpHQmtTOTI4UHYrdWQyeFFQ?=
 =?utf-8?B?c1gzeFlwRUxEK1ZjcDJwZytrcmFkV3lGbmNoK3JnZzVzdTQwVm42ZXJObDlj?=
 =?utf-8?B?b0ZWcTEzQXkzRmN1VGRteVc0RW54dEYxVUdYVjdBdko5M1dwUXZOeWgwVnc5?=
 =?utf-8?B?cHBHQTh4YytsVnp6dkdDK2VFMEltVXI2SE1HYmc1a1UxUWtVN1dMaGFGVVJU?=
 =?utf-8?B?b3Rvam1nZEVrUGNrRUwydnRiM2p0cG5OTjhmL3R1OXhnemJFTnBqMzA1Y1ZW?=
 =?utf-8?B?K3duQ0c1RkN5anhXWjNzZm5WZFBFcGR0N3pPK0V0cUtZQXdnODd5alAycWlx?=
 =?utf-8?B?U2UyOXpXUlQ5M2twb0xGbGVib0pLT01yU1NYTnpWWDdYZ3ZRcHVjOGt6NDd3?=
 =?utf-8?B?WkM3SlZUVEFZSkFhL0FwdW9EYnNlcnpCY2JTRm1rYWtnaUpaV3VJRm1NeGFu?=
 =?utf-8?B?K3RORkRBVnQ0aXhtemhaZlpTRVp2QkxoZDcrYnA5ZnRDcExSbXZvMmlzcjVo?=
 =?utf-8?Q?83O6HNvFLk0rS7xIb6/JW9hcX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9e830f-9d6a-4df9-f6db-08dab6a91a7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:51:03.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW1C+h29M2xCgYzzH/x/2IoWiXtkrcQYB1hIs2doWMjVhtNVRbQI9GCvX08jhmR5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-25 03:15, Yang Yingliang wrote: > Inject fault
 while loading module, kset_register() may fail. > If it fails,
 the kset.kobj.name
 allocated by kobject_set_name() > which must be called befor [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.237.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.237.43 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1onN8x-00HC8C-FW
Subject: Re: [f2fs-dev] [PATCH v3] kset: fix memory leak when
 kset_register() returns error
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
From: Luben Tuikov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Luben Tuikov <luben.tuikov@amd.com>
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org, hsiangkao@linux.alibaba.com,
 rafael@kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 mark@fasheh.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022-10-25 03:15, Yang Yingliang wrote:
> Inject fault while loading module, kset_register() may fail.
> If it fails, the kset.kobj.name allocated by kobject_set_name()
> which must be called before a call to kset_register() may be
> leaked, since refcount of kobj was set in kset_init().

Technically, this is saying "If it fails, the kset.kobj.name may be leaked."
We want then to clarify that this is "allocated by kobj_set_name() which
must be called before a call to kset_register", so that needs to
be surrounded by commas (like a literary segue):

"If kset_register() fails, the kset.kobj.name allocated by kobject_set_name(),
 which must be called before a call to kset_register(), may be
 leaked."

I don't feel that the reason for the leak is "refcount of kobj was set in kset_init()".
It's a true statement, but not the reason for the leak--the reason for the leak is that
no one frees it on the error path.
 
> To mitigate this, we free the name in kset_register() when an
> error is encountered, i.e. when kset_register() returns an error.
> 
> A kset may be embedded in a larger structure which may be dynamically
> allocated in callers, it needs to be freed in ktype.release() or error

"_by_ callers", since it's something they _do_: allocate.

> path in callers, in this case, we can not call kset_put() in kset_register(),
> or it will cause double free, so just call kfree_const() to free the
> name and set it to NULL to avoid accessing bad pointer in callers.

That's good.

> With this fix, the callers don't need care about freeing the name
> and may call kset_put() if kset_register() fails.

"don't need to care about freeing the name" --> "don't need to free the name"

> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2 -> v3:
>   Update commit message and comment of kset_register().
> 
> v1 -> v2:
>   Free name inside of kset_register() instead of calling kset_put()
>   in drivers.
> ---
>  lib/kobject.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/kobject.c b/lib/kobject.c
> index a0b2dbfcfa23..3cd19b9ca5ab 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>  /**
>   * kset_register() - Initialize and add a kset.
>   * @k: kset.
> + *
> + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> + * is freed, it can not be used any more.

There's no need for "NOTE:"--it's just natural explanation of
what's happening, and what's expected in the doc comment to a function.
Drop it.

"is freed" is correct--that's a good change.

With these fixed, this patch is
Reviewed-by: <luben.tuikov@amd.com>

Regards,
Luben

>   */
>  int kset_register(struct kset *k)
>  {
> @@ -844,8 +847,12 @@ int kset_register(struct kset *k)
>  
>  	kset_init(k);
>  	err = kobject_add_internal(&k->kobj);
> -	if (err)
> +	if (err) {
> +		kfree_const(k->kobj.name);
> +		/* Set it to NULL to avoid accessing bad pointer in callers. */
> +		k->kobj.name = NULL;
>  		return err;
> +	}
>  	kobject_uevent(&k->kobj, KOBJ_ADD);
>  	return 0;
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
